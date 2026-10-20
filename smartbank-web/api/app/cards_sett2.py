"""Cards ▸ Sazlama sub forms 3, 5-11, 13, 14 (cards_azericard setac.pas TForm10 Button1Click / DBGrid1DblClick):
crdtype.pas TForm14, filialaccounts.pas TFilial_Accounts, domesticbank.pas Tdomestic_bank, banksettings.pas TBank_Settings,
atmendpos.pas Tatmpos, poscomission.pas TPOS_COMMISION, Unit155.pas TPROVS, cardbranch.pas Tcard_branch, excsett.pas
TExchangesettings, Taxfilessettings.pas TRbsTaxFileAccsett.

Conventions as cards_sett: DataMod_CARDS (Unit18.dfm) datasets are the verbatim cards_sql line lists; DOA DML on the dataset's
updating table by ROWID (no OnApplyRecord); DataMod_CARDS.mainpacket = package card_main, TOraclePackage.CallProcedure does not
commit; Session.Commit only where the Delphi handler calls it. Datasets with Active = True in Unit18.dfm (CARDTYPES, domestic,
bankomats, POSCOMISSION, noprov, branchcodes, filial, valuta) are open since the data module was created; the web (re)opens them
when the form opens (the Delphi grid would show the state at module creation until the first Refresh: unverified difference).
The SearchEdit boxes (TSearchEdit, incremental search on the account dataset) are free text whose Text is passed, as in Delphi."""
from __future__ import annotations

import base64
import datetime as dt
import os

from fastapi import APIRouter, Depends
from fastapi.responses import Response
from pydantic import BaseModel

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

MSG_DEL = "Seçilmiş sətir silinsin?"
SQL = {
    "cardtype_del": "delete from CARD_CARDTYPE where rowid = :doa_rowid",                 # crdtype.pas Button2Click (CARDTYPES)
    "filialacc_del": "delete from filialaccounts where rowid = :doa_rowid",               # filialaccounts.pas Button2Click
    "domestic_del": "delete from card_domestic where rowid = :doa_rowid",                 # domesticbank.pas Button2Click
    "settings_bank": ("update card_settings set BANKID = :BANKID, ACCOUNTCLOSECODE = :ACCOUNTCLOSECODE, REZ = :REZ, DORD = :DORD, "
                      "KLIRING_25 = :KLIRING_25, KLIRING_45 = :KLIRING_45 where rowid = :doa_rowid"),   # banksettings.pas Button1Click Post
    "pos_ins": ("insert into card_poscommission (POSID, MINVALUE, MAXVALUE, DOMESTICPERCENT, INTERPERCENT1, INTERPERCENT2, ONUSPERCENT) "
                "values (:POSID, :MINVALUE, :MAXVALUE, :DOMESTICPERCENT, :INTERPERCENT1, :INTERPERCENT2, :ONUSPERCENT)"),
    "pos_del": "delete from card_poscommission where rowid = :doa_rowid",
    "noprov_del": "delete from card_noprov where rowid = :doa_rowid",                     # Unit155.pas Button2Click
    # Taxfilessettings.dfm DBGrid1 (default Options incl. dgEditing; rbstax_accounts selects a.rowid): DOA DML by ROWID, CommitOnPost
    "tax_ins": "insert into rbstax_acc_settings (ID, TAX1, TAX10, TAX18, BRANCH, VALUTE) values (:ID, :TAX1, :TAX10, :TAX18, :BRANCH, :VALUTE)",
    "tax_upd": ("update rbstax_acc_settings set ID = :ID, TAX1 = :TAX1, TAX10 = :TAX10, TAX18 = :TAX18, BRANCH = :BRANCH, VALUTE = :VALUTE "
                "where rowid = :doa_rowid"),
    "tax_del": "delete from rbstax_acc_settings where rowid = :doa_rowid",
}
DEC = os.getenv("CARDS_DECIMAL_SEPARATOR", ",")


def _q(ws, lines, b=None, sort=None):
    L = list(lines) + (["ORDER BY " + sort] if sort else [])
    return [dict(r) for r in ws.conn.query(Q.text(L), b or {})]


def _rows(rows):
    return [dict(row(r), rowid=None if r.get("ROWID") is None else str(r.get("ROWID"))) for r in rows]


def _st(ws) -> dict:
    s = ws.module_state.get("cards_sett")
    if not s or "filter" not in s:                      # the Sazlama list (TForm10) must be open
        raise LookupError("sett")
    return s.setdefault("sub", {})


def _check(ws, right):
    ws.conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", [right], commit=False)


def _cm(ws, name, args):
    ws.conn.call_proc("card_main", name, args, commit=False)


def _run(ws, key, b, commit=True):
    c = ws.conn
    try:
        c.execute(SQL[key], b)
        if commit:
            c.commit()
    except Exception:
        c.rollback()
        raise


def _acc_nos(ws, lines, b=None):
    return [r.get("ACC_NO") for r in _q(ws, lines, b)]


def _valuta(ws):
    return [{"valute": r.get("VALUTE"), "valu_name": r.get("VALU_NAME"), "val_name": r.get("VAL_NAME")} for r in _q(ws, Q.LINES_VALUTA)]


def _filial(ws):
    return [{"id": r.get("ID"), "name": r.get("NAME")} for r in _q(ws, Q.LINES_FILIAL)]


def _sortf(field, cols):
    f = (field or "").upper()
    if f not in cols:
        raise ValueError(field)
    return f


def _excel(rows, sheet) -> bytes:
    from .cards_balpay import _excel as X
    return X(rows, sheet)


# ---------------------------------------------------------------- 3 TForm14 crdtype.pas: CARD_CARDTYPE
CT_COLS = ["NAME", "CODE", "CURRENCY", "SERVICE", "SCHEME", "BIN"]


def crdtype_view(ws, sort=None):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_CARDTYPES, sort=sort)), "valuta": _valuta(ws), "msg_del": MSG_DEL}


def crdtype_add(ws, f: dict):
    """Button1Click: all of Edit1, Edit2, DBLookupComboBox1, Edit5, Edit3 filled -> card_main.new_carttype(Edit1, Edit2, combo Text,
    Edit5, Edit3, Edit4); CARDTYPES Close / Open. Else ShowMessage 'Xanalar tam doldurulmalıdır!'. No commit."""
    _st(ws)
    e = lambda k: f.get(k) or ""  # noqa: E731
    if e("edit1") != "" and e("edit2") != "" and e("currency") != "" and e("edit5") != "" and e("edit3") != "":
        _cm(ws, "new_carttype", [e("edit1"), e("edit2"), e("currency"), e("edit5"), e("edit3"), e("edit4")])
        return crdtype_view(ws)
    return dict(crdtype_view(ws), message="Xanalar tam doldurulmalıdır!")


def crdtype_delete(ws, rowid, confirmed):
    """Button2Click: Yes -> CARDTYPES.Delete; Session.Commit after Yes and No."""
    _st(ws)
    if confirmed and rowid:
        _run(ws, "cardtype_del", {"doa_rowid": rowid}, commit=False)
    ws.conn.commit()
    return crdtype_view(ws)


# ---------------------------------------------------------------- 5 TFilial_Accounts filialaccounts.pas
FA_COLS = ["FILIAL", "VALYUTA", "HESAB_28", "HESAB_48", "REZ28", "REZ48", "HESAB_64", "DILING_GELIR", "DILING_XERC", "KOD"]


def filialacc_view(ws, sort=None):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_FILIALACCOUNT, sort=sort)), "valuta": _valuta(ws), "filial": _filial(ws),
            "accounts": _acc_nos(ws, Q.LINES_ACCOUNTS), "msg_del": MSG_DEL}


def filialacc_add(ws, f: dict):
    """Button1Click (confirm commented out): card_main.filialacount(DBLookupComboBox2 (filial NAME), DBLookupComboBox1 (VAL_NAME),
    SearchEdit1 (2801-11), SearchEdit2 (4801-11), SearchEdit3 (64), SearchEdit4 (Diling gəlir), SearchEdit5 (Diling xərc), Edit1 (Kod),
    SearchEdit6 (2803-13), SearchEdit7 (4803-13)); filialaccount Close / Open. No commit."""
    _st(ws)
    e = lambda k: f.get(k) or ""  # noqa: E731
    _cm(ws, "filialacount", [e("filial"), e("currency"), e("se1"), e("se2"), e("se3"), e("se4"), e("se5"), e("edit1"), e("se6"), e("se7")])
    return filialacc_view(ws)


def filialacc_delete(ws, rowid, confirmed):
    """Button2Click: Yes -> filialaccount.Delete, Session.Commit, Close / Open (all inside the Yes branch)."""
    _st(ws)
    if confirmed and rowid:
        _run(ws, "filialacc_del", {"doa_rowid": rowid})
    return filialacc_view(ws)


# ---------------------------------------------------------------- 6 Tdomestic_bank domesticbank.pas
DM_COLS = ["BANKID", "BANKNAME", "VAL_NAME", "ACC_NO", "ACC_NO_1", "ACC_NO_2"]


def domestic_view(ws, sort=None):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_DOMESTIC, sort=sort)), "valuta": _valuta(ws),
            "accounts": _acc_nos(ws, Q.LINES_ACCOUNTDOMESTIC), "msg_save": "Dəyişikliklər yadda saxlanılsın?", "msg_del": MSG_DEL}


def domestic_add(ws, f: dict, confirmed: bool):
    """Button1Click: Yes -> card_main.insert_domestic(Edit1, Edit2, combo Text, SearchEdit1 (25), SearchEdit2 (45), SearchEdit3 (64));
    domestic Close / Open after Yes and No. No commit."""
    _st(ws)
    e = lambda k: f.get(k) or ""  # noqa: E731
    if confirmed:
        _cm(ws, "insert_domestic", [e("edit1"), e("edit2"), e("currency"), e("se1"), e("se2"), e("se3")])
    return domestic_view(ws)


def domestic_delete(ws, rowid, confirmed):
    _st(ws)
    if confirmed and rowid:
        _run(ws, "domestic_del", {"doa_rowid": rowid}, commit=False)
    ws.conn.commit()
    return domestic_view(ws)


# ---------------------------------------------------------------- 7 TBank_Settings banksettings.pas: card_settings
def _iv(v):
    try:
        return int(v or 0)
    except (TypeError, ValueError):
        return 0


def banksett_view(ws):
    """FormCreate hesab1 / hesab2 Open; FormActivate settings Close / Open / Edit, CheckBox1 (hidden) := ARAHESAB = 1, CheckBox2 :=
    dord = 1, RadioGroup1 := 0 when rez = 0 else 1; FormShow SearchEdit3 / 4 := kliring_25 / kliring_45."""
    _st(ws)
    st = _q(ws, Q.LINES_SETTINGS)
    r = st[0] if st else {}
    return {"rowid": None if r.get("ROWID") is None else str(r.get("ROWID")), "bankid": r.get("BANKID"),
            "accountclosecode": r.get("ACCOUNTCLOSECODE"), "dord": _iv(r.get("DORD")) == 1, "rez": 0 if _iv(r.get("REZ")) == 0 else 1,
            "kliring_25": r.get("KLIRING_25") or "", "kliring_45": r.get("KLIRING_45") or "",
            "accounts": _acc_nos(ws, Q.LINES_HESAB1), "msg_save": "Dəyişiklik yadda saxlanılsın?"}


def banksett_save(ws, f: dict, confirmed: bool):
    """Button1Click: CheckAdvancedObjectAccess('cardsettingssave'); Yes -> rez := RadioGroup1 (0 / 1); ARAHESAB := 1 only when the hidden
    CheckBox1 is checked (it shows the stored ARAHESAB = 1, so the value never changes: not written); dord := CheckBox2; kliring_25 /
    kliring_45 := SearchEdit3 / 4; the DBEdits BANKID / ACCOUNTCLOSECODE are in the same edited record; Post (CommitOnPost).
    No -> Close (the edit is dropped). Then Close / Open."""
    _check(ws, "cardsettingssave")
    v = banksett_view(ws)
    if confirmed and v["rowid"]:
        _run(ws, "settings_bank", {"BANKID": f.get("bankid"), "ACCOUNTCLOSECODE": f.get("accountclosecode"),
                                   "REZ": 0 if int(f.get("rez") or 0) == 0 else 1, "DORD": 1 if f.get("dord") else 0,
                                   "KLIRING_25": f.get("kliring_25") or "", "KLIRING_45": f.get("kliring_45") or "", "doa_rowid": v["rowid"]})
    return banksett_view(ws)


# ---------------------------------------------------------------- 8 Tatmpos atmendpos.pas: card_bankomats
AP_COLS = ["ATMPOS", "ATMID", "CONTRACTNUMBER", "ATMNAME", "FILIAL", "VALYUTA", "MAINACCOUNT", "INTERACOUNT", "PROFITACOUNT"]


def atm_view(ws, sort=None):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_BANKOMATS, sort=sort)), "valuta": _valuta(ws), "filial": _filial(ws),
            "accounts": _acc_nos(ws, Q.LINES_ACCOUNTBANKOMATS), "types": ["ATM", "POS", "CASH"],
            "msg_save": "Yadda saxlanılsın?", "msg_del": "Secilmiş sətir silinsin?"}


def atm_required(f: dict) -> bool:
    return all((f.get(k) or "") != "" for k in ("type", "edit1", "edit2", "filial", "currency", "se1"))


def atm_add(ws, f: dict, confirmed: bool):
    """Button1Click: CheckAdvancedObjectAccess('cardatmpossave'); ComboBox1, Edit1, Edit2, DBLookupComboBox2, DBLookupComboBox1,
    SearchEdit1 filled and Yes -> card_main.new_BANKOMAT(ComboBox1, Edit1 (ID), Edit2 (Adı), combo2 (filial NAME), combo1 (VAL_NAME),
    SearchEdit3 (əsas), SearchEdit2 (ara), SearchEdit1 (gəlir), Edit3 (müqavilə)); the grid Close / Open always. No commit."""
    _check(ws, "cardatmpossave")
    e = lambda k: f.get(k) or ""  # noqa: E731
    if atm_required(f) and confirmed:
        _cm(ws, "new_BANKOMAT", [e("type"), e("edit1"), e("edit2"), e("filial"), e("currency"), e("se3"), e("se2"), e("se1"), e("edit3")])
    return atm_view(ws)


def atm_delete(ws, id_, confirmed):
    """Button2Click: CheckAdvancedObjectAccess('cardatmposdelete'); Yes -> card_main.atm_delete(bankomats id AsInteger) (the direct
    Delete + Commit is commented out); bankomats.Refresh. No commit."""
    _check(ws, "cardatmposdelete")
    if confirmed:
        _cm(ws, "atm_delete", [int(id_ or 0)])
    return atm_view(ws)


def atm_excel(ws) -> bytes:
    _check(ws, "cardatmposexcel")
    _st(ws)
    return _excel(_q(ws, Q.LINES_BANKOMATS), "CARDS")


# ---------------------------------------------------------------- 9 TPOS_COMMISION poscomission.pas: card_poscommission
POS_F = ["POSID", "MINVALUE", "MAXVALUE", "DOMESTICPERCENT", "INTERPERCENT1", "INTERPERCENT2", "ONUSPERCENT"]


def pos_view(ws, sort=None):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_POSCOMISSION, sort=sort)), "msg_del": MSG_DEL}


def _asstring_num(v: str):
    """TField.AsString := '' -> Null; a numeric field converts with StrToFloat (DecimalSeparator CARDS_DECIMAL_SEPARATOR)."""
    v = (v or "").strip()
    if v == "":
        return None
    try:
        x = float(v.replace(DEC, ".") if DEC != "." else v)
    except ValueError:
        raise ValueError(v) from None
    return int(x) if x.is_integer() else x


def pos_add(ws, f: dict):
    """Button1Click: try Open; Insert; POSID := Edit1, MINVALUE := Edit6, MAXVALUE := Edit3, DOMESTICPERCENT := Edit4, INTERPERCENT1 :=
    Edit5, INTERPERCENT2 := Edit2, ONUSPERCENT := Edit7 (AsString); Post; Session.Commit; Close / Open; except Close / Open (no message).
    POSID is assumed character, the other columns numeric (card_poscommission DDL not in the repo)."""
    _st(ws)
    try:
        b = {"POSID": f.get("posid") or None}
        for k in POS_F[1:]:
            b[k] = _asstring_num(f.get(k.lower()))
        _run(ws, "pos_ins", b)
    except Exception:
        pass                                            # except: Close / Open, the exception is swallowed
    return pos_view(ws)


def pos_delete(ws, rowid, confirmed):
    """Button2Click: Open; Yes -> Delete; Session.Commit after Yes and No."""
    _st(ws)
    if confirmed and rowid:
        _run(ws, "pos_del", {"doa_rowid": rowid}, commit=False)
    ws.conn.commit()
    return pos_view(ws)


def pos_excel(ws) -> bytes:
    _st(ws)                                             # Button3Click: no right check, sheet 'POS'
    return _excel(_q(ws, Q.LINES_POSCOMISSION), "POS")


# ---------------------------------------------------------------- 10 TPROVS Unit155.pas: card_noprov
def noprov_view(ws):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_NOPROV))}


def noprov_add(ws, text: str):
    """Button1Click: card_main.insert_noprovs(Edit1); noprov.Refresh. No commit."""
    _st(ws)
    _cm(ws, "insert_noprovs", [text or ""])
    return noprov_view(ws)


def noprov_delete(ws, rowid):
    """Button2Click: noprov.Delete (no confirmation), Session.Commit, Refresh. An empty dataset: Delete raises (TDataSet 'Cannot perform
    this operation on an empty dataset')."""
    _st(ws)
    if not rowid:
        raise ValueError("Cannot perform this operation on an empty dataset")
    _run(ws, "noprov_del", {"doa_rowid": rowid})
    return noprov_view(ws)


# ---------------------------------------------------------------- 11 Tcard_branch cardbranch.pas: card_branch_codes
def branch_view(ws):
    _st(ws)
    return {"rows": _rows(_q(ws, Q.LINES_BRANCHCODES)), "filial": _filial(ws), "msg_del": "Əməliyyat Kodu silinsin ?"}


def branch_add(ws, filial_id, filial_name: str, code: str):
    """Button1Click: card_main.addbranchescode(DBLookupComboBox1.KeyValue (filial ID, Null when nothing picked), .Text, Edit1);
    ShowMessage 'Filialın Plastik kart kodu əlavə olundu..'; Refresh; Edit1 / combo cleared. No commit."""
    _st(ws)
    _cm(ws, "addbranchescode", [filial_id, filial_name or "", code or ""])
    return dict(branch_view(ws), message="Filialın Plastik kart kodu əlavə olundu..")


def branch_delete(ws, branchid, confirmed):
    """S1Click (popup 'Sil'): 'Əməliyyat Kodu silinsin ?' Yes -> card_main.del_branchescode(branchid AsInteger); Refresh. No commit."""
    _st(ws)
    if confirmed:
        _cm(ws, "del_branchescode", [int(branchid or 0)])
    return branch_view(ws)


def branch_xml(ws) -> dict:
    """Button2Click 'XML Al' (Visible = False; F11 on the grid shows it, F10 hides it): cardbr_upd.Open; C:\\AZCARD\\OUT\\CARDFILUPD.xml
    with Writeln lines (CRLF); the commented-out UFXMsg variant is not written. Open on the already open dataset is a no-op and the
    cursor stays at Eof after the loop, so a second click in the same session writes the header with the last row's date / time and
    no applications (kept). FieldByName on an empty dataset gives ''."""
    from . import cards_app_file as AF
    s = _st(ws)
    st = s.setdefault("cardbr_upd", None)
    if st is None:
        rows = _q(ws, Q.LINES_CARDBR_UPD)
        st = s["cardbr_upd"] = {"rows": rows}
        todo = rows
    else:
        todo = []
    rows = st["rows"]
    cur = (todo[0] if todo else (rows[-1] if rows else {}))
    g = lambda r, k: "" if r.get(k) is None else str(r.get(k))  # noqa: E731
    c = "NBC#" + g(cur, "DATES").replace("-", "") + "-" + g(cur, "TIME").replace(":", "") + "_0100_"
    L = ['<?xml version="1.0" encoding="windows-1251"?>', '<ApplicationFile>', '<FileHeader>', '   <FormatVersion>2.0</FormatVersion>',
         '        <Sender>0270</Sender>', '       <CreationDate>' + g(cur, "DATES") + '</CreationDate>',
         '         <CreationTime>' + g(cur, "TIME") + '</CreationTime>', '         <Number>100</Number>',
         '          <Institution>0270</Institution>', '     </FileHeader>', '        <ApplicationsList>']
    for v, r in enumerate(todo, 1):
        L += ['    <Application>', '            <RegNumber>' + c + str(v) + '</RegNumber>',
              '            <OrderDprt>' + g(r, "BRANCH_CODE") + '</OrderDprt>', '            <ObjectType>Client</ObjectType>',
              '            <ActionType>Update</ActionType>', '            <ObjectFor>', '            <ClientIDT>', '            <ClientInfo>',
              '                <ShortName>' + g(r, "CARDHOLDER") + '</ShortName>', '             </ClientInfo>',
              '               <RefContractNumber>' + g(r, "CARDNUMBER") + '</RefContractNumber>', '             </ClientIDT>',
              '                </ObjectFor>', '            <Data>', '                  <Client>',
              '                    <OrderDprt>' + g(r, "BRANCH_CODE") + '</OrderDprt>', '                  </Client>', '            </Data>',
              '       </Application>']
    L += ['</ApplicationsList>', '</ApplicationFile>']
    data = "".join(x + "\r\n" for x in L).encode(AF.CODEPAGE, errors="replace")
    path = "C:\\AZCARD\\OUT\\CARDFILUPD.xml"
    lp = AF._local(path)
    if lp:
        os.makedirs(os.path.dirname(lp), exist_ok=True)
        with open(lp, "wb") as fh:
            fh.write(data)
    return {"files": [{"name": "CARDFILUPD.xml", "delphi_path": path, "size": len(data), "b64": base64.b64encode(data).decode()}],
            "messages": ["Xml Yaradildi"], "server_dir": AF.OUT_DIR or None}


# ---------------------------------------------------------------- 13 TExchangesettings excsett.pas: card_exchange_sett
EX_ARGS = ["atmazn", "vdmazn", "atmusd", "vdmusd", "atmeur", "vdmeur", "filial", "ara", "vdmincome", "contract_num", "nameofatm"]


def exch_view(ws):
    s = _st(ws)
    fil = s.get("exch_fil")
    return {"rows": _rows(_q(ws, Q.LINES_SETT_EXCHANE)), "filial": _filial(ws), "fil": fil,
            "accounts": [] if "exch_fil" not in s else _acc_nos(ws, Q.LINES_EXCHANGE_ACC, {"fil": fil})}


def exch_filial(ws, fil):
    """filialcomboCloseUp: exchange_acc Close; SetVariable('fil', KeyValue); Open."""
    _st(ws)["exch_fil"] = fil
    return exch_view(ws)


def exch_add(ws, f: dict):
    """BitBtn1Click: card_main.addexchangeacc(Searchatmazn, Searchvdmazn, Searchatmusd, Searchvdmusd, Searchatmeur, Searchvdmeur,
    filialcombo.KeyValue, Searchara, Searchvdmincome, contract_num, nameofatm); grid Refresh. No commit. BitBtn2 'Sil' has no OnClick."""
    _st(ws)
    args = [(f.get(k) if k == "filial" else (f.get(k) or "")) for k in EX_ARGS]
    _cm(ws, "addexchangeacc", args)
    return exch_view(ws)


# ---------------------------------------------------------------- 14 TRbsTaxFileAccsett Taxfilessettings.pas: rbstax_acc_settings
def tax_view(ws):
    s = _st(ws)
    v = s.get("tax_vars")
    return {"rows": _rows(_q(ws, Q.LINES_RBSTAX_ACCOUNTS)), "filial": _filial(ws), "valuta": _valuta(ws),
            "accounts_open": v is not None, "accounts": [] if v is None else _acc_nos(ws, Q.LINES_RBS_TAX_ACCOUNTS, v), "msg_del": MSG_DEL}


def tax_valute(ws, fil, valu):
    """valutecomboCloseUp: rbs_tax_accounts Close; SetVariable fil := filialcombo.KeyValue, valu := valutecombo.KeyValue; Open."""
    _st(ws)["tax_vars"] = {"fil": fil, "valu": valu}
    return tax_view(ws)


def tax_add(ws, f: dict):
    """BitBtn1Click: card_main.rbs_tax_acc_settings(filialcombo.KeyValue, valutecombo.KeyValue, Searchtax1, Searchtax10, Searchtax18);
    the grid (rbstax_accounts) Close / Open. No commit."""
    _st(ws)
    _cm(ws, "rbs_tax_acc_settings", [f.get("filial"), f.get("valute"), f.get("tax1") or "", f.get("tax10") or "", f.get("tax18") or ""])
    return tax_view(ws)


def tax_delete(ws, confirmed):
    """BitBtn2Click: Yes -> DataMod_CARDS.rbs_tax_accounts.Delete - the ACCOUNT lookup dataset of the search boxes ('select * from
    smart.account where filial=:fil and val_acc=:valu', no ROWID selected), not the settings grid. DOA cannot delete a record without
    a ROWID (closed dataset: 'Cannot perform this operation on a closed dataset'); the web shows the error and deletes nothing."""
    s = _st(ws)
    if confirmed:
        if s.get("tax_vars") is None:
            raise ValueError("Cannot perform this operation on a closed dataset")
        raise ValueError("rbs_tax_accounts: record has no ROWID, cannot delete (Delphi deletes the account lookup dataset, not the "
                         "settings row)")
    return tax_view(ws)


TAX_F = ["ID", "TAX1", "TAX10", "TAX18", "BRANCH", "VALUTE"]
TAX_NUM = {"ID", "BRANCH", "VALUTE"}                     # rbstax_acc_settings DDL not in the repo: assumed NUMBER (ids), TAX* text (acc_no)


def tax_apply(ws, op: str, rowid, vals: dict):
    """DBGrid1 cell editing (dgEditing, dgConfirmDelete): Post -> insert / update by ROWID, Ctrl+Del -> delete; CommitOnPost."""
    _st(ws)
    b = {}
    for k in TAX_F:
        v = vals.get(k.lower())
        b[k] = (_asstring_num(str(v)) if v not in (None, "") else None) if k in TAX_NUM else (v if v not in ("",) else None)
    if op == "insert":
        _run(ws, "tax_ins", b)
    elif op == "update" and rowid:
        _run(ws, "tax_upd", dict(b, doa_rowid=rowid))
    elif op == "delete" and rowid:
        _run(ws, "tax_del", {"doa_rowid": rowid})
    else:
        raise ValueError(op)
    return tax_view(ws)


# ---------------------------------------------------------------- router
class FIn(BaseModel):
    f: dict = {}
    confirmed: bool = False


class DelIn(BaseModel):
    rowid: str | None = None
    id: int | None = None
    confirmed: bool = False


class SortIn(BaseModel):
    field: str


class TextIn(BaseModel):
    text: str = ""


class BrIn(BaseModel):
    filial_id: int | None = None
    filial_name: str = ""
    code: str = ""


class TaxIn(BaseModel):
    op: str
    rowid: str | None = None
    f: dict = {}


class FilIn(BaseModel):
    fil: int | None = None
    valu: int | None = None


XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards/sett")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")
        except ValueError as e:
            err(400, "error.bad_request", ora=str(e))

    def xl(data, name):
        return Response(data, media_type=XLSX, headers={"Content-Disposition": f'attachment; filename="{name}.xlsx"'})

    sortable = {"crdtype": (crdtype_view, CT_COLS), "filialaccounts": (filialacc_view, FA_COLS),
                "domesticbank": (domestic_view, DM_COLS), "atmendpos": (atm_view, AP_COLS), "poscomission": (pos_view, POS_F)}
    opens = {"crdtype": crdtype_view, "filialaccounts": filialacc_view, "domesticbank": domestic_view, "banksettings": banksett_view,
             "atmendpos": atm_view, "poscomission": pos_view, "unit155": noprov_view, "cardbranch": branch_view, "excsett": exch_view,
             "taxfilessettings": tax_view}
    def _mk_open(fn):
        def h(ws=Depends(g)):
            return _fe(fn, ws)
        return h

    def _mk_sort(fn, cols):
        # DBGrid1TitleClick (crdtype :37, filialaccounts :48, domesticbank :34, atmendpos :49, poscomission :55): IsEmpty or no
        # FieldName -> Exit; else SQL.Add('ORDER BY <field>'); Refresh; SQL[pos] := ''
        def h(b: SortIn, ws=Depends(g)):
            def run():
                f = _sortf(b.field, cols)
                v = fn(ws)
                return v if not v["rows"] else fn(ws, f)
            return _fe(run)
        return h

    for name, fn in opens.items():
        r.post(f"/{name}/open")(_mk_open(fn))
    for name, (fn, cols) in sortable.items():
        r.post(f"/{name}/sort")(_mk_sort(fn, cols))

    @r.post("/crdtype/add")
    def _ca(b: FIn, ws=Depends(g)):
        return _fe(crdtype_add, ws, b.f)

    @r.post("/crdtype/delete")
    def _cd(b: DelIn, ws=Depends(g)):
        return _fe(crdtype_delete, ws, b.rowid, b.confirmed)

    @r.post("/filialaccounts/add")
    def _fa(b: FIn, ws=Depends(g)):
        return _fe(filialacc_add, ws, b.f)

    @r.post("/filialaccounts/delete")
    def _fd(b: DelIn, ws=Depends(g)):
        return _fe(filialacc_delete, ws, b.rowid, b.confirmed)

    @r.post("/domesticbank/add")
    def _da(b: FIn, ws=Depends(g)):
        return _fe(domestic_add, ws, b.f, b.confirmed)

    @r.post("/domesticbank/delete")
    def _dd(b: DelIn, ws=Depends(g)):
        return _fe(domestic_delete, ws, b.rowid, b.confirmed)

    @r.post("/banksettings/check")
    def _bc(ws=Depends(g)):
        return _fe(lambda: (_check(ws, "cardsettingssave"), {"ok": True})[1])

    @r.post("/banksettings/save")
    def _bs(b: FIn, ws=Depends(g)):
        return _fe(banksett_save, ws, b.f, b.confirmed)

    @r.post("/atmendpos/check")
    def _ac(b: FIn, ws=Depends(g)):
        # Button1Click up to the MessageDlg: the right check, then the required fields decide whether the question is asked
        return _fe(lambda: (_check(ws, "cardatmpossave"), {"ask": atm_required(b.f)})[1])

    @r.post("/atmendpos/add")
    def _aa(b: FIn, ws=Depends(g)):
        return _fe(atm_add, ws, b.f, b.confirmed)

    @r.post("/atmendpos/delcheck")
    def _adc(ws=Depends(g)):
        return _fe(lambda: (_check(ws, "cardatmposdelete"), {"ok": True})[1])

    @r.post("/atmendpos/delete")
    def _ad(b: DelIn, ws=Depends(g)):
        return _fe(atm_delete, ws, b.id, b.confirmed)

    @r.post("/atmendpos/excel")
    def _ax(ws=Depends(g)):
        return xl(_fe(atm_excel, ws), "CARDS")

    @r.post("/poscomission/add")
    def _pa(b: FIn, ws=Depends(g)):
        return _fe(pos_add, ws, b.f)

    @r.post("/poscomission/delete")
    def _pd(b: DelIn, ws=Depends(g)):
        return _fe(pos_delete, ws, b.rowid, b.confirmed)

    @r.post("/poscomission/excel")
    def _px(ws=Depends(g)):
        return xl(_fe(pos_excel, ws), "POS")

    @r.post("/unit155/add")
    def _na(b: TextIn, ws=Depends(g)):
        return _fe(noprov_add, ws, b.text)

    @r.post("/unit155/delete")
    def _nd(b: DelIn, ws=Depends(g)):
        return _fe(noprov_delete, ws, b.rowid)

    @r.post("/cardbranch/add")
    def _bra(b: BrIn, ws=Depends(g)):
        return _fe(branch_add, ws, b.filial_id, b.filial_name, b.code)

    @r.post("/cardbranch/delete")
    def _brd(b: DelIn, ws=Depends(g)):
        return _fe(branch_delete, ws, b.id, b.confirmed)

    @r.post("/cardbranch/xml")
    def _brx(ws=Depends(g)):
        return _fe(branch_xml, ws)

    @r.post("/excsett/filial")
    def _ef(b: FilIn, ws=Depends(g)):
        return _fe(exch_filial, ws, b.fil)

    @r.post("/excsett/add")
    def _ea(b: FIn, ws=Depends(g)):
        return _fe(exch_add, ws, b.f)

    @r.post("/taxfilessettings/valute")
    def _tv(b: FilIn, ws=Depends(g)):
        return _fe(tax_valute, ws, b.fil, b.valu)

    @r.post("/taxfilessettings/add")
    def _ta(b: FIn, ws=Depends(g)):
        return _fe(tax_add, ws, b.f)

    @r.post("/taxfilessettings/apply")
    def _tg(b: TaxIn, ws=Depends(g)):
        return _fe(tax_apply, ws, b.op, b.rowid, b.f)

    @r.post("/taxfilessettings/delete")
    def _td(b: DelIn, ws=Depends(g)):
        return _fe(tax_delete, ws, b.confirmed)

    return r

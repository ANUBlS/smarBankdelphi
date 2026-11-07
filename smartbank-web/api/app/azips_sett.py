"""AZIPS part 4c - settings forms, exact logic ported by hand:
  ToolButton10Click :3088 ('Sazlama', IN tab)  -> SW_SETTINGS right, insett.pas TIn_sett  ('In_Settings')
  ToolButton12Click :3016 ('Sazlama', OUT tab) -> SW_SETTINGS right, MTsett.pas TAzpSettings ('OUT_Setting')
AzipsSett.pas (TAzipsSettings) and Unit3.pas (TSazlama) are compiled but never created anywhere -> not ported.

Each form: tabs 'MT 103' (accounts), 'MT 205', 'Biznes process', and IN: 'Bizness prosess' (sw_names) / OUT: 'MT205 Names'
(sw_rbname, never opened by FormShow -> the grid stays empty in Delphi). Saves call sw_main procedures WITHOUT a commit
(errors are shown with ShowMessage(e.Message)); the popup 'Sil' items ask 'Silinsin' and commit."""
from __future__ import annotations

from . import azips_sql as Q
from .db.base import DBError

ADDED = "Hesablar Əlavə edildi."                 # insett.pas / MTsett.pas BTnsaveClick, BtsaveClick, Button5Click
BP_ADDED = "Biznes  prosees əlavə edildi."       # Button4Click
VAL_FIRST = "Birinci Valyuta Secilməlidir!!"     # Edit1/2/6/17KeyPress
FIL_FIRST = "Ilk öncə Filial seçilməlidir "      # DBLookupComboBox4CloseUp
VAL_FIRST2 = "Ilk öncə Valyuta seçilməlidir "    # insett DBLookupComboBox9CloseUp

FORMS = {
    "in": {"grids": {"mt103": Q.LINES_AZPSETTINGS_IN, "mt205": Q.LINES_AZPSETT_IN, "bproc": Q.LINES_B_PROC_IN,
                     "names": Q.LINES_SW_NAMES},
           "save": {"mt103": "azpsettings_in", "mt205": "Azp205_in", "bproc": "bproc_in", "names": "Azp900"},
           "delete": {"mt103": ("azpsettings_del_in", "Secilmis hesab silindi"), "mt205": ("Azp205_del_in", "Secilmis hesab silindi."),
                      "bproc": ("bproc_in_del", "Secilmis bizness proses  silindi."),
                      "names": ("azp900_del", "Secilmis bizness proses  silindi.")},
           "mt205_items": ["Xarici valyuta satışından daxil olan vəsait", "Nağd pul üzrə hesablaşma", "Depozit cəlb edilməsi",
                           "Xarici valyuta alışından daxil olan vəsait", "Loro müxbir hesabın möhkəmləndirilməsi"]},
    "out": {"grids": {"mt103": Q.LINES_AZPSETTINGS, "mt205": Q.LINES_AZPSETT, "bproc": Q.LINES_B_PROC, "names": None},
            "save": {"mt103": "azpsettings", "mt205": "Azp205", "bproc": "bproc_out"},
            "delete": {"mt103": ("azpsettings_del", "Secilmis hesab silindi."), "mt205": ("Azp205_del", "Secilmis hesab silindi."),
                       "bproc": ("bproc_in_del", "Secilmis biznes proses silindi.")},     # MTsett S3Click calls bproc_in_del (as Delphi)
            "mt205_items": ["Subhesabın Mohkəmləndirməsi", "Mərkəzi Bankdan nağd pul alınması", "Digər banklardan nağd pul alınması",
                            "Vəsaitin yerləşdirilməsi", "Xarici Valyuta satışı", "Muxbir Hesabin Mohkəmləndirməsi",
                            "MB Ərazi İdarələrindən nağd pul alınması", "Xarici Valyuta Alışı"]},
}
CURR_ITEMS = ["AZN", "USD", "EUR", "RUR", "TRY", "GBP"]       # ComboBox1
MT_ITEMS = ["MT103", "MT102", "MT205"]                        # ComboBox2
OFIS_ITEMS = ["Baş ofis", "Filial"]                           # ComboBox4 (not used by Button4Click)
NAMES_MT_ITEMS = ["MT900", "MT910", "MT205"]                  # insett ComboBox5


def open_form(conn, form):
    """ToolButton10/12Click + FormShow."""
    conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["SW_SETTINGS"])
    f = FORMS[form]
    grids = {k: (conn.query(Q.text(v)) if v else []) for k, v in f["grids"].items()}
    return {"grids": grids, "filial": conn.query(Q.text(Q.LINES_AZPFILIAL)), "avalute": conn.query(Q.text(Q.LINES_AZPVAL)),
            "bproc": conn.query(Q.text(Q.LINES_BPROC)), "mt205_items": f["mt205_items"], "curr_items": CURR_ITEMS,
            "mt_items": MT_ITEMS, "ofis_items": OFIS_ITEMS, "names_mt_items": NAMES_MT_ITEMS if form == "in" else []}


def mb_comm(conn, fil, val_key, val_text):
    """DBLookupComboBox3/4CloseUp: AZN -> bal1 1052 / BAL2 6404, else 1062 / 6414."""
    azn = val_text == "AZN"
    mb = conn.query(Q.text(Q.LINES_MBACC), {"bal1": 1052 if azn else 1062})
    cm = conn.query(Q.text(Q.LINES_COMM_ACC), {"BAL2": 6404 if azn else 6414, "fil": fil, "val": val_key})
    return {"mbacc": mb, "comm_acc": cm}


def bal_accounts(conn, which, valcode, bal_text):
    """Edit1/Edit17KeyPress (Main_acc, :bal1) and Edit2/Edit6KeyPress (alter_acc, :bal2) on Enter: strtoint(Edit.Text)."""
    from .azips_in import _strtoint
    bal = _strtoint(bal_text)
    if which == "main":
        return conn.query(Q.text(Q.LINES_MAIN_ACC), {"bal1": bal, "valcode": valcode})
    return conn.query(Q.text(Q.LINES_ALTER_ACC), {"bal2": bal, "valcode": valcode})


def all_banks(conn, valute_text):
    """DBLookupComboBox6CloseUp: all_banks(:valute = DBLookupComboBox6.Text)."""
    return conn.query(Q.text(Q.LINES_ALL_BANKS), {"valute": valute_text})


def save(conn, form, tab, v: dict):
    """Argument lists exactly as the Delphi CallProcedure calls (KeyValue of lookups, Text of edits/combos)."""
    name = FORMS[form]["save"].get(tab)
    if not name:
        return None
    if tab == "mt103":                       # BTnsaveClick
        args = [v.get("acc_b"), v.get("acc_c"), v.get("fil"), v.get("val")]
    elif tab == "mt205":                     # BtsaveClick: ComboBox3.ItemIndex, cb7, cb8, cb6 (valute), cb5 (filial), Edit3, cb9.Text
        items = FORMS[form]["mt205_items"]
        t = v.get("purpose_text") or ""
        args = [items.index(t) if t in items else -1, v.get("acc_a"), v.get("acc_b"), v.get("val"), v.get("fil"),
                v.get("bankcode") or "", v.get("bank_name") or ""]
    elif tab == "bproc":                     # Button4Click: fil from ComboBox3 (the MT 205 tab combo!) = 'Filial'
        fil = 1 if (v.get("purpose_text") or "") == "Filial" else 0
        args = [v.get("bproc_id"), v.get("bproc_name") or "", v.get("curr") or "", v.get("mt") or "", fil]
    else:                                    # insett Button5Click (Azp900)
        args = [v.get("mt") or "", v.get("acc_a"), v.get("acc_b"), v.get("val"), v.get("edit5") or "", v.get("edit4") or "",
                v.get("acc_a")]
    try:
        conn.call_proc(Q.PKG_MAIN, name, args, commit=False)
    except DBError as e:
        return {"message": e.message, "error": True, "call": [name, args]}
    return {"message": BP_ADDED if tab == "bproc" else ADDED, "call": [name, args]}


def delete(conn, form, tab, rid: int):
    """S1..S4Click after 'Silinsin' = Yes: procedure(id) + ShowMessage + SBSession.Commit."""
    d = FORMS[form]["delete"].get(tab)
    lines = FORMS[form]["grids"].get(tab)
    if not d or not lines or rid not in {r.get("ID") for r in conn.query(Q.text(lines))}:
        return None
    conn.call_proc(Q.PKG_MAIN, d[0], [rid], commit=False)
    conn.commit()
    return {"message": d[1]}

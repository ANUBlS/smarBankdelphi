"""Mock for Packages/SWIFT_MANAGER_IBAN_NEW (AZIPS). Tables from fixtures/azips.json. The verbatim SQL is recognised by its
first TStrings line; the edited lines (SQL[5], SQL[6], SQL[10], SQL[46]) are interpreted. The sw_main package body is not in
the repo: new_dat is emulated as 'move status-96 sw_in rows dated before SYSDAT.tek_dat into SW_ARCHIVE' only to make the archive screen show something;
Find_UserName*_out/_in return the fixture user names (C = creator, M = modifier, V = verifier columns)."""
from __future__ import annotations
import copy
import datetime as dt
import json
import os
import re

from .. import azips_sql as Q

_DATA = None


def reset():
    global _DATA
    _DATA = None


def _load():
    global _DATA
    if _DATA is None:
        from ..config import settings
        _DATA = json.load(open(os.path.join(settings.mock_fixtures, "azips.json"), encoding="utf-8"))
    return _DATA


def _d(v):
    return dt.datetime.fromisoformat(v) if isinstance(v, str) else v


def _rows(rs):
    return [{k: (_d(v) if k in ("DAT", "CDAT", "FDAT", "TDAT", "MF32A_DATE") else v) for k, v in r.items()} for r in rs]


class AzipsMixin:  # noqa: D101 (part 2 below: AzipsEditMixin)
    def _az_user_filial(self):
        return _load()["sba_objinf"].get(str(self.username).upper(), 0)

    def _az_query(self, sql, b):
        D = _load()
        L = sql.split("\r\n")
        first = L[0]
        branch = len(L) > 10 and L[10] == Q.BRANCH_LINE
        fil = self._az_user_filial()
        names = D["user_names"]
        nm = lambda i: names.get(str(i), "")    # noqa: E731
        if first == Q.LINES_USERFIL[0]:
            return [{"FILIALID": fil}]
        r = _azf_query(D, sql, L, b)        # part 3: file generation datasets
        if r is not NotImplemented:
            return r
        if first == Q.LINES_SWMAMMOUNT[0] or first == Q.LINES_SW_AMOUNT[0]:
            st = 1 if first == Q.LINES_SWMAMMOUNT[0] else 5
            xs = [r["MF32A_AMOUNT"] for r in D["sw_out_new"] if r["STATUS"] == st]
            return [{"SUMM": sum(xs) if xs else None}]
        if first == Q.LINES_OPERATORS[0]:
            return [{"ID": -1, "NAME": "Butun operatorlar"}] + sorted(D["users"], key=lambda u: u["NAME"])
        brf = (lambda r: r.get("BRANCH") == fil) if branch else (lambda r: True)
        if first in (Q.LINES_SW_IN[0], Q.LINES_SW_IN2[0]):
            two = first == Q.LINES_SW_IN2[0]
            rs = [r for r in D["sw_in"] if (r["STATUS"] == 96 if two else r["STATUS"] not in (96, 10)) and brf(r)]
            o = L[46] if len(L) > 46 else ""
            m = re.fullmatch(r"order by (\w+)( asc| desc)?", o)
            if m:
                rs = sorted(rs, key=lambda r: (r.get(m.group(1)) is None, str(r.get(m.group(1)))), reverse=m.group(2) == " desc")
            out = _rows(rs)
            for r, src in zip(out, rs):
                r["USERH"] = nm(src.get("USER"))
                r.pop("USER", None)
            return out
        for lines, sts, fns in ((Q.LINES_SW_OUT, (2, 8, 15), ("C",)), (Q.LINES_SW_OUT_2, (5, 7, 55), ("C", "M")),
                                (Q.LINES_SW_OUT3, (1,), ("C", "M", "V"))):
            if first == lines[0]:
                rs = sorted([r for r in D["sw_out_new"] if r["STATUS"] in sts and brf(r)], key=lambda r: -r["ID"])
                out = []
                for src, r in zip(rs, _rows(rs)):
                    for k, col in zip(fns, ("SW_MAIN.FIND_USERNAME_OUT(S.ID)", "SW_MAIN.FIND_USERNAME3_OUT(S.ID)",
                                            "SW_MAIN.FIND_USERNAME2_OUT(S.ID)")):
                        r[col] = nm(src.get(k))
                    for k in ("C", "M", "V"):
                        r.pop(k, None)
                    r["ROWID"] = _rid(src["ID"])
                    r.pop("_CALL", None); r.pop("_POSTED", None)
                    out.append(r)
                return out
        if first == Q.LINES_ARXIVIN[0]:
            d1, d2 = b["dat1"], b["dat2"]
            mt = L[6]
            rs = [r for r in D["sw_archive"] if d1 <= _d(r["DAT"]) <= d2 and brf(r)]
            m = re.fullmatch(r"and mt='(.*)'", mt)
            if m:
                rs = [r for r in rs if r["MT"] == m.group(1)]
            return _rows(rs)        # ORDER BY :title = constant -> table order
        if first == Q.LINES_OUT_ARCHIVE[0]:
            d1, d2 = b["dat1"], b["dat2"]
            rs = [r for r in D["sw_out_sba"] if d1 <= _d(r["MF32A_DATE"]) <= d2 and brf(r)]
            if L[5] == " and fcreate_opid=:oper":
                rs = [r for r in rs if r["FCREATE_OPID"] == b["oper"]]
            m = re.fullmatch(r"and messagetype='(.*)'", L[6])
            if m:
                rs = [r for r in rs if r["MESSAGETYPE"] == m.group(1)]
            out = _rows(rs)
            for src, r in zip(rs, out):
                r.update(CREAT=nm(src["FCREATE_OPID"]), DELETER="", MODSI="", EDITOR="", AVTO="", VERI="")
            return out
        return NotImplemented

    def _az_proc(self, key, args):
        r = _azf_proc(_load(), key, args)
        if r is not NotImplemented:
            return r
        if key == "SW_MAIN.NEW_DAT":
            D = _load()
            day = dt.datetime.fromisoformat(self.st["sys"]["tek_dat"])
            old = lambda r: r["STATUS"] == 96 and _d(r["DAT"]) < day      # noqa: E731
            moved = [r for r in D["sw_in"] if old(r)]
            D["sw_in"] = [r for r in D["sw_in"] if not old(r)]
            for r in moved:
                a = copy.deepcopy(r)
                a.pop("STATUS"); a.pop("USER", None); a.pop("BNK_VOIN", None)
                D["sw_archive"].append(a)
            return {}
        return NotImplemented

    def _az_func(self, key, args):
        if key == "SW_MAIN.SW_OUT_FILEAFTER":
            return _load().get("fileafter", 6)        # 6 = file may be created (PACS0008Execute :744)
        if key == "SB_ACA.CHECKADVANCEDOBJECTACCESS_FUNC":
            return 1 if (self.user.get("is_adm") or args[0] in self.user.get("advanced_access", [])) else 0
        return NotImplemented


# ---------------------------------------------------------------------------------------------- part 2: editor / creation
def _rid(i):
    return "AAAz9x" + str(i).rjust(12, "A")


class AzipsEditMixin:
    """Emulates the datasets used by OUT_FORM / MT103 / MT103AZN / MT103Show and the sw_main calls. sw_main body is not in
    the repo: Set_Referense returns OUT+yymmdd+4-digit counter; savetransaction / saving205 insert a status-2 row (illustrative)."""

    def _aze_query(self, sql, b):
        D = _load()
        L = sql.split("\r\n")
        first = L[0]
        if first == Q.LINES_BANKINFO[0]:
            return [dict(D["bankinfo"])]
        if first == Q.LINES_MT[0]:
            return [{"COLUMN_NAME": "MT103"}, {"COLUMN_NAME": "MT205"}]
        if first == Q.LINES_VALUTE[0]:
            return [{"VAL_NAME": v} for v in D["avalute"]]
        if first == Q.LINES_BANKS[0]:
            return [dict(x) for x in D["sw_banks"] if x["CITY"] == "BAKU"]     # city='BAKU' line
        if first == Q.LINES_TOBIC[0]:
            return [dict(x) for x in D["sw_banks"] if x["BIC"] == b.get("dbs")]
        if first == Q.LINES_ACCOUNT[0]:
            return sorted([dict(x) for x in D["account"]], key=lambda x: x["ACC_NO"])
        if first == Q.LINES_ACCS_FOR_COMISSION[0]:
            return [{"ID": x["ID"], "ACC_NO": x["ACC_NO"]} for x in D["account"] if x["KLI_ID"] == b.get("v_acc_no")]
        if first == Q.LINES_CHK_ACCNO[0]:
            return [{"CUST_TYPE": x["CUST_TYPE"]} for x in D["account"] if x["ACC_NO"] == b.get("acc_no")]
        if first == Q.LINES_CORR[0]:
            return [{"CORACOUNT": x["CORACOUNT"]} for x in D["sw_coraccounts"] if x["BIC"] == b.get("b") and x["VAL_NAME"] == b.get("v")]
        if first == Q.LINES_REFERANS[0]:
            D["ref_seq"] = D.get("ref_seq", 0) + 1
            return [{"REFE": "OUT" + dt.date.today().strftime("%y%m%d") + str(D["ref_seq"]).rjust(4, "0")}]
        if first == Q.LINES_COMBOITEMS[0]:
            m = re.fullmatch(r"and (\w+) is not null order by sw_field", L[1])
            col = m.group(1) if m else None
            rs = [x for x in D["sw_fields"] if x["SW_MAIN_FIELD"] == b.get("comboname") and x["CATEGORY"] != "00" and col and x.get(col)]
            return sorted(rs, key=lambda x: x["SW_FIELD"])
        if first == Q.LINES_COMBOSELECT[0]:
            return [x for x in D["sw_fields"] if x["SW_MAIN_FIELD"] == b.get("name") and x["CATEGORY"] == b.get("selected")]
        if first == Q.LINES_AFTERCOMBOSELECT[0]:
            return [x for x in D["sw_fields"] if x["SW_MAIN_FIELD"] == b.get("name") and x["CATEGORY"] != b.get("selected")]
        return NotImplemented

    def _aze_proc(self, key, args):
        D = _load()
        if key in ("SW_MAIN.SAVETRANSACTION", "SW_MAIN.SAVING205"):
            nid = max(r["ID"] for r in D["sw_out_new"]) + 1
            day = dt.datetime.strptime(args[0], "%d.%m.%Y").isoformat()
            if key == "SW_MAIN.SAVETRANSACTION":
                r = {"MESSAGETYPE": "MT103", "MF20_REFERENCE": args[1], "MF50_ACCOUNT": args[2], "RECEIVERBIC": args[3],
                     "MF59_ACCOUNT": args[5], "FINCOPY": args[7], "MF70": args[8], "MF72": args[9], "MF32A_AMOUNT": args[10],
                     "MF50_NAME$ADRESS": args[13], "MF59_NAME$ADRESS": args[14], "MF32A_CURR": args[19]}
            else:
                r = {"MESSAGETYPE": "MT205", "RECEIVERBIC": args[1], "MF20_REFERENCE": args[2], "MF21": args[3],
                     "MF32A_AMOUNT": args[4], "MF50_NAME$ADRESS": args[5], "MF59_NAME$ADRESS": args[6], "MF70": args[7],
                     "FINCOPY": args[10], "MF32A_CURR": "AZN"}
            r.update(ID=nid, STATUS=2, SENDERLT="103", MF32A_DATE=day, INFO="", CDAT=dt.datetime.now().isoformat(timespec="seconds"),
                     FDAT=None, TDAT=None, BRANCH=self._az_user_filial() or 101, C=self.user.get("id", 2), M=0, V=0, _CALL=[key, list(args)])
            D["sw_out_new"].append(r)
            return {}
        return NotImplemented

    def _aze_execute(self, sql, b):
        m = re.fullmatch(r"update SW_OUT_NEW set (.+) where rowid = :doa__rowid", sql)
        if not m:
            return False
        D = _load()
        tgt = [r for r in D["sw_out_new"] if _rid(r["ID"]) == b["doa__rowid"]]
        if not tgt:
            raise RuntimeError("ORA-01410: invalid ROWID")
        for part in m.group(1).split(", "):
            col, bind = part.split(" = :")
            tgt[0][col] = b[bind]
        tgt[0]["_POSTED"] = True
        return True


# ---------------------------------------------------------------------------------------------- part 3: file generation
def _azf_query(D, sql, L, b):
    """sw_settings / settings (Unit2.dfm:1855, :1986), MT102data / mt102sum (sw_out_new_t), datatemps texts built by
    PACS0008Execute :1793 / :1841 (literals arrive as :b0, :b1)."""
    if sql == Q.text(Q.LINES_SW_SETTINGS):
        return [dict(D["sw_settings"])]
    sel = lambda ref: [r for r in D["sw_out_new"] if r.get("MF20_REFERENCE") == ref]      # noqa: E731
    if L[0] == Q.LINES_MT102DATA[0]:
        return _rows([r for r in sel(b.get("refer")) if r["MESSAGETYPE"] == "MT102" and r["STATUS"] == 1])
    if L[0] == Q.LINES_MT102SUM[0]:
        xs = [r["MF32A_AMOUNT"] for r in sel(b.get("refer")) if r["MESSAGETYPE"] == "MT102" and r["STATUS"] == 1]
        return [{"SUM(MF32A_AMOUNT)": sum(xs) if xs else None}]
    if L[0] == "select * from sw_out_new ase where  mf20_reference=:b0 and L01 in (select max(L01) from sw_out_new where mf20_reference=:b1)":
        rs = sel(b["b0"])
        mx = max((r.get("L01") or 0 for r in rs), default=None)
        return _rows([r for r in rs if (r.get("L01") or 0) == mx])
    if L[0] == "select * from sw_out_new  where  mf20_reference=:b0":
        return _rows(sel(b["b0"]))
    return NotImplemented


def _azf_proc(D, key, args):
    """sw_main body is not in the repo. Illustrative: updout / sw_out_CreateFile record the call; sw_out_CreateFile with
    flag 1 writes INFO and moves the row out of 'Sending' (status 55, shown under Committed)."""
    if key in ("SW_MAIN.INSERT_IN", "SW_MAIN.INSERT_IN_OTHER"):
        # part 3b, illustrative only (body not in the repo): a new incoming row with status 2 (konvert3 passes status:=2)
        D.setdefault("in_calls", []).append([key, list(args)])
        if key == "SW_MAIN.INSERT_IN":
            acc, ref, valu, bic, cur = args[0], args[1], args[2], args[3], args[4]
            mt = args[9]
        else:
            acc, ref, valu, bic, cur, mt = "", args[0], None, args[1], "", args[4]
        try:
            v = float(str(valu).replace(",", ".")) if valu not in (None, "") else None
        except ValueError:
            v = None
        D["sw_in"].append({"ID": max([r["ID"] for r in D["sw_in"]] + [0]) + 1, "DAT": dt.datetime.now().replace(microsecond=0).isoformat(),
                           "REFERANCE": ref, "ACOUNT": acc, "BNK_VOIN": "", "VALU": v, "BIC": bic, "VALUTE": cur, "MT": mt,
                           "INFO": "", "STATUS": 2, "BRANCH": 101, "USER": 2})
        return {}
    if key == "SW_MAIN.CHECK_ACCOUNT":
        D.setdefault("in_calls", []).append([key, list(args)])
        return {}
    if key == "SW_MAIN.UPDOUT":
        return {}
    # part 4a, illustrative only (sw_main body not in the repo)
    if key in ("SW_MAIN.SW_OUT_DELETE", "SW_MAIN.SW_OUT_BACK", "SW_MAIN.SW_OUT_COMMIT", "SW_MAIN.TRANSEND",
               "SW_MAIN.DEL_STD_TRANSACTION"):
        D.setdefault("in_calls", []).append([key, list(args)])
        rid = args[1] if key == "SW_MAIN.DEL_STD_TRANSACTION" else args[0]
        new = {"SW_MAIN.SW_OUT_DELETE": 96, "SW_MAIN.SW_OUT_BACK": 2, "SW_MAIN.SW_OUT_COMMIT": 1,
               "SW_MAIN.TRANSEND": None, "SW_MAIN.DEL_STD_TRANSACTION": 5}[key]
        for r in D["sw_out_new"]:
            if r["ID"] == rid and new is not None:
                r["STATUS"] = new
        return {}
    if key == "SW_MAIN.SW_IN_DELETE":
        D.setdefault("in_calls", []).append([key, list(args)])
        D["sw_in"] = [r for r in D["sw_in"] if r["ID"] != args[0]]
        return {}
    if key == "SW_MAIN.SW_OUT_CREATEFILE":
        for r in D["sw_out_new"]:
            if r["ID"] == args[0]:
                r["INFO"] = args[1]
                if args[2] == 1:
                    r["STATUS"] = 55
        return {}
    return NotImplemented

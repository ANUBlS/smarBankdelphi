"""Mock for AZIPS part 2b (filereport.bpl 'Azipsnew', Unitdatamod.dfm datasets). The SQL is matched on the verbatim text
of each TOracleDataSet (vcl.DataSet.sql_text). Tables in fixtures/azips_new.json (sw_accounts, bankm_t, filialinfo_t,
sw_rbnames, sw_templates); sw_out_new / sw_settings come from fixtures/azips.json (mock_azips). The sw_main body is not in
the repo: saving102 / savetransaction / saving205 are emulated as 'insert a status-2 row' (illustrative only) and
savetemplate as 'insert into sw_templates'; sbop.check_IBAN_acc_num = 1 when the account is 28 characters starting with AZ."""
from __future__ import annotations
import datetime as dt
import functools
import json
import os

from .. import azips_new as N
from . import mock_azips

_DATA = None


def reset():
    global _DATA
    _DATA = None


def _load():
    global _DATA
    if _DATA is None:
        from ..config import settings
        _DATA = json.load(open(os.path.join(settings.mock_fixtures, "azips_new.json"), encoding="utf-8"))
    return _DATA


@functools.lru_cache(None)
def _sql():
    dm = N._dfm("Unitdatamod")
    from .. import vcl
    return {vcl.DataSet(None, c).sql_text(): c.name.lower() for c in dm.children if c.cls == "TOracleDataSet"}


def _d(v):
    return dt.datetime.fromisoformat(v) if isinstance(v, str) and len(v) >= 10 and v[4] == "-" else v


def _row(r):
    return {k: (_d(v) if k in ("MF32A_DATE", "CDAT", "FDAT", "TDAT", "DAT", "OPEN_DAT") else v) for k, v in r.items()}


class AzipsNewMixin:
    def _azn_query(self, sql, b):
        name = _sql().get(sql)
        if name is None:
            return NotImplemented
        D, A = _load(), mock_azips._load()
        if name == "oracledataset2":
            return [{"TIME": D.get("now_time") or dt.datetime.now().strftime("%H:%M:%S")}]
        if name == "sw_settings":
            return [dict(A["sw_settings"])]
        if name == "sw_out":
            return [_row(r) for r in A["sw_out_new"] if r["ID"] == _int(b.get("ids"))]
        if name == "banks":
            rs = [dict(x) for x in D["bankm_t"] if x["VAL_CODE"] == b.get("val")]
            return sorted(({k: v for k, v in x.items() if k != "VAL_CODE"} for x in rs), key=lambda x: x["NAME"])
        if name == "account":
            return sorted([_row(x) for x in D["sw_accounts"] if x["CLOSE_DAT"] is None and x["ACC_NO"] == b.get("accno")], key=lambda x: x["ACC_NO"])
        if name == "acount":
            return sorted([_row(x) for x in D["sw_accounts"] if x["CLOSE_DAT"] is None and str(x["KLI_ID"]) == str(b.get("ids"))
                           and x["CURRENCYNAME"] == b.get("curr")], key=lambda x: x["ACC_NO"])
        if name == "referans":
            A["ref_seq"] = A.get("ref_seq", 0) + 1
            return [{"REFE": "OUT" + dt.date.today().strftime("%y%m%d") + str(A["ref_seq"]).rjust(4, "0")}]
        if name == "relatedrf":
            return [{"MAX(ID)+1": max(r["ID"] for r in A["sw_out_new"]) + 1}]
        if name == "rbnames":
            return [dict(x) for x in D["sw_rbnames"] if x["CODE"] == _int(b.get("vid")) and x["VALUTE"] == b.get("valu")]
        if name == "radiocode":
            return [dict(x) for x in D["sw_rbnames"] if x["RBNAME"] == b.get("rbname")]
        if name == "bank":
            return [{"NAME": x["BANK"][:35], "ACCOUNTANTTITLE": x.get("ACCOUNTANTTITLE"), "KRNO": x["KRNO"], "INN": x["INN"], "SWIFT": x["SWIFT"],
                     "BANKCODE": x["KOD_B"], "SUBKRNO": x.get("KRNO_FIL")} for x in D["filialinfo_t"] if x["NB"] == 1 and x["SVM_CURRENCYID"] == _int(b.get("val"))]
        if name == "krno":
            return [{"KRNO": x["KRNO"]} for x in D["filialinfo_t"] if x["NB"] == 7 and x["SVM_CURRENCYID"] == _int(b.get("valu"))]
        if name == "gonderen":
            return [dict(x) for x in D["filialinfo_t"] if x.get("KOD_FIL") == _int(b.get("fid")) and x["SVM_CURRENCYID"] == _int(b.get("curr"))]
        if name == "alanm":
            # convertpack.CONVERT_xohks body is not in the repo: the mock returns replace(short_name,'"',) unchanged otherwise
            return [{**x, "D": x["SHORT_NAME"].replace('"', "''")} for x in D["customers"] if str(x["ID"]) == str(b.get("kid"))]
        if name == "out":
            return [_row(r) for r in A["sw_out_new"] if r["STATUS"] == 20]
        if name in ("templ", "templates"):
            return [dict(x) for x in D["sw_templates"]]
        if name == "bankm":
            return [dict(D.get("xs_config", {}))]
        if name == "names205":
            from .base import DBError
            raise DBError("ORA-00900: invalid SQL statement")
        return NotImplemented

    def _azn_proc(self, key, args):
        if key in RECORD_ONLY:
            A = mock_azips._load()
            A.setdefault("azn_calls", []).append([key, [a.isoformat() if isinstance(a, dt.datetime) else a for a in args]])
            return {}
        if key not in ("SW_MAIN.SAVING102", "SW_MAIN.SAVETRANSACTION", "SW_MAIN.SAVING205", "SW_MAIN.SAVETEMPLATE") \
                or not args or not isinstance(args[0], dt.datetime):
            return NotImplemented
        A = mock_azips._load()
        A.setdefault("azn_calls", []).append([key, [a.isoformat() if isinstance(a, dt.datetime) else a for a in args]])
        if key == "SW_MAIN.SAVETEMPLATE":
            _load()["sw_templates"].append({"ID": len(_load()["sw_templates"]) + 1, "TEMPNAME": args[11], "MT": args[10]})
            return {}
        nid = max(r["ID"] for r in A["sw_out_new"]) + 1
        if key == "SW_MAIN.SAVING205":
            r = {"MESSAGETYPE": "MT205", "RECEIVERBIC": args[1], "MF20_REFERENCE": args[2], "MF21": args[3], "MF32A_AMOUNT": _num(args[4]),
                 "MF52_NAME$ADRESS": args[5], "MF58_NAME$LOCATION": args[6], "MF72": args[7], "RNAME": args[8], "CODEX": args[11],
                 "MF32A_CURR": args[10]}
        else:
            r = {"MESSAGETYPE": "MT102" if key == "SW_MAIN.SAVING102" else "MT103", "MF20_REFERENCE": args[1], "MF50_ACCOUNT": args[2],
                 "RECEIVERBIC": args[3], "RNAME": args[4], "MF59_ACCOUNT": args[5], "MF70": args[8], "MF72": args[9], "MF32A_AMOUNT": args[10],
                 "MF50_NAME$ADRESS": args[13], "MF59_NAME$ADRESS": args[14], "MF32A_CURR": args[20] if key == "SW_MAIN.SAVING102" else args[19]}
        r.update(ID=nid, STATUS=2, SENDERLT="AZIPS", MF32A_DATE=args[0].replace(hour=0, minute=0, second=0, microsecond=0).isoformat(),
                 INFO="", CDAT=dt.datetime.now().isoformat(timespec="seconds"), FDAT=None, TDAT=None, BRANCH=self._az_user_filial() or 101,
                 C=self.user.get("id", 2), M=0, V=0)
        A["sw_out_new"].append(r)
        return {}

    def _azn_func(self, key, args):
        if key == "SBOP.CHECK_IBAN_ACC_NUM":
            a = str(args[0] or "")
            return 1 if len(a) == 28 and a.startswith("AZ") else 0
        return NotImplemented


RECORD_ONLY = {"SW_MAIN." + x.upper() for x in ("save103UPD", "save205UPD", "insert_298", "insert_298202", "insert_298800",
                                                "insert_298801", "insert_298804", "insert_920", "insert_920_2", "insert_999",
                                                "insert_999pass", "insert_999bizday")}


def _int(v):
    try:
        return int(v)
    except (TypeError, ValueError):
        return v


def _num(v):
    try:
        return float(str(v).replace(",", "."))
    except ValueError:
        return v

"""Mock stand-in for OUT_SB_STATEMENT (Packages/Out_Statement/Script/out_sb_statement.sql) and for the SQL text it returns.

notAccId / GetExtraction / Extraction_Trans are ported string-for-string from the package body (line cited) so the
mock returns the same kind of SQL text the real package builds; the returned SQL is then "executed" by a small
evaluator below that reads the conditions back out of the text and applies them to the bal.json OUT_ accounts.
Dates are concatenated by Oracle with NLS_DATE_FORMAT; the mock assumes the default DD-MON-RR.
Extra columns the fixtures lack (op_id, open_dat, customers.inn, operkurs, vid_op) come from fixtures/ost.json.
"""
from __future__ import annotations
import datetime
import json
import os
import re

from .. import out_ost_sql as Q

_fix = None


def _ost():
    global _fix
    if _fix is None:
        from ..config import settings
        _fix = json.load(open(os.path.join(settings.mock_fixtures, "ost.json"), encoding="utf-8"))
    return _fix


def _nls(v) -> str:
    """Oracle date -> varchar2 with NLS_DATE_FORMAT DD-MON-RR."""
    return v.strftime("%d-%b-%y").upper()


def _undo(s: str) -> datetime.date:
    return datetime.datetime.strptime(s, "%d-%b-%y").date()


def _day(v):
    if isinstance(v, str):
        return datetime.date.fromisoformat(v[:10])
    return v.date() if isinstance(v, datetime.datetime) else v


# ----------------------------------------------------------------------------------- package string builders
def not_acc_id(beg, end, kli, acc, bal, filial, cur, user, trd) -> str:
    """out_sb_statement.sql:306-373."""
    str_user = "" if user == -1 else " and OP_ID=" + str(user)
    str_filial = "" if filial == -1 else " and filial=" + str(filial)
    str_currency = " " if cur == -1 else " and val_acc=" + str(cur)
    if kli == "-1" and acc == "'-1'" and bal == "-1":
        main = " "
    else:
        main = "\n and ( Bal_Cn1 in (" + bal + ") \n    or Acc_No in (" + acc + ")\n    or kli_id in (" + kli + ") \n     ) "
    b, e = _nls(beg), _nls(end)
    vid = "" if trd == "ch_rate_and_turn" else "nvl(vid_op,0)<>1 and  "
    return ("select id as accountid from out_account  where "
            + "( id not in (select debt from out_provarch where " + vid + "dat between '" + b + "' and '" + e + "' ))\nand  \n"
            + "     ( id not in (select kredit from out_provarch where " + vid + "dat between '" + b + "' and '" + e + "'  ))"
            + main + str_filial + str_user + str_currency)


def get_extraction(beg, end, kli, acc, bal, filial, cur, user) -> str:
    """out_sb_statement.sql:378-460."""
    str_user = "" if user == -1 else " and ac.OP_ID=" + str(user)
    str_filial = "" if filial == -1 else " and ac.filial=" + str(filial)
    str_currency = " " if cur == -1 else " and ac.val_acc=" + str(cur)
    if kli == "-1" and acc == "'-1'" and bal == "-1":
        main = " "
    else:
        main = " and ( ac.bal_cn1 in (" + bal + ") \n    or ac.acc_no in (" + acc + ")\n    or ac.kli_id in (" + kli + ") \n     ) "
    b, e = "'" + _nls(beg) + "'", "'" + _nls(end) + "'"
    return ("select\n  ac.id         AccountId,\n  ac.kli_id     CustomerId, \n  ac.acc_no     AccountNumber,\n"
            "  ac.op_id      OperatorId,\n  ac.val_acc    CurrencyId,\n  av.val_name   CurrencyName,\n  ac.name       AccountName,\n"
            "  c.inn         CustomerVoin,\n  ac.bal_cn1    BalanceCode,\n  ac.open_dat   OpenDate, \n  ac.filial     Filial,  \n"
            f"  out_sb_statement.flastopdate(ac.id,{b})    LastOpdate,\n"
            f"  out_sb_statement.fOstat(ac.id,{b})         Ostat,\n"
            f"  out_sb_statement.fPok_Ostat(ac.id,{b})     PokOstat,\n"
            f"  out_sb_statement.fEndOstat(ac.id,{e})      EndOstat,\n"
            f"  out_sb_statement.fEndPok_Ostat(ac.id,{e})  EndPokOstat,\n"
            f"  out_sb_statement.fDatDate(ac.id,{b})       DatDate,\n"
            f"  to_date({e})                                         EndDate,\n"
            f"  out_sb_statement.fAp_Beg(ac.id,{b})        AP_Beg,\n"
            f"  out_sb_statement.fAp_End(ac.id,{b})        AP_End "
            " from out_account ac,customers c,avalute av "
            " where \n  ac.kli_id=c.id\n  and  ac.val_acc = av.valute \n  and ac.open_dat<='" + _nls(end) + "'"
            + str_currency + main + str_filial + str_user + " order by ac.acc_no")


def extraction_trans(beg, end, kli, acc, bal, filial, cur, user) -> str:
    """out_sb_statement.sql:464-609."""
    def sub(side, cond):
        return " and pr." + side + " in(select id from out_account ac  where" + cond + ")"
    su_d = "" if user == -1 else sub("debt", "  ac.op_id = " + str(user))
    su_k = "" if user == -1 else sub("kredit", "  ac.op_id = " + str(user))
    sf_d = "" if filial == -1 else sub("debt", "  ac.filial = " + str(filial))
    sf_k = "" if filial == -1 else sub("kredit", "  ac.filial = " + str(filial))
    sc_d = " " if cur == -1 else sub("debt", "  ac.val_acc = " + str(cur))
    sc_k = " " if cur == -1 else sub("kredit", "  ac.val_acc = " + str(cur))
    if kli == "-1" and acc == "'-1'" and bal == "-1":
        m_d = m_k = ""
    else:
        cond = "  ac.acc_no in (" + acc + ")" + " or " + " ac.bal_cn1 in (" + bal + ")" + " or " + "  ac.kli_id in (" + kli + ")"
        m_d, m_k = sub("debt", cond), sub("kredit", cond)
    b, e = "'" + _nls(beg) + "'", "'" + _nls(end) + "'"
    return ("select \npr.id            id,\npr.dat           dat,\npr.val_acc       CurrencyId,\npr.debt          OwnAccountId,\n"
            "pr.kredit        PairAccountId,\nout_sb_statement.getaccno(pr.kredit)  PairAccountName,\npr.Currencyid_c  PairCurrencyId ,\n"
            "out_sb_statement.checkcurrency(0,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount)  debit,\n"
            "0                kredit, \npr.lammount      ldebit,\n0                lkredit,\npr.vid_op        OperationCode,\n"
            "pr.name          name, \nav.val_name      avalname\nfrom out_provarch pr,avalute av\nwhere \npr.val_acc=av.valute  and\n"
            "pr.debt=:OwnAccountId and\npr.dat between " + b + " and " + e + m_d + sf_d + sc_d + su_d
            + " union "
            + " select \npr.id            id,\npr.dat           dat,\npr.currencyid_c  CurrencyId,\npr.kredit        OwnAccountID,\n"
            "pr.debt          PairAccountId,\nout_sb_statement.getaccno(pr.debt) as PairAccountName,\npr.val_acc       PairCurrencyId ,\n"
            "0                debit,\nout_sb_statement.checkcurrency(1,pr.val_acc,pr.currencyid_c,pr.ammount,pr.ammount_c,pr.lammount) as kredit,\n"
            "0                ldebit,\npr.lammount      lkredit,\npr.vid_op        OperationCode,\npr.name          name,\n"
            "av.val_name      avalname\nfrom out_provarch pr,avalute av\nwhere\npr.currencyid_c=av.valute and\n"
            "pr.kredit=:OwnAccountId   and\npr.dat between " + b + " and " + e + m_k + sf_k + sc_k + su_k
            + " order by dat,debit,kredit ")


def check_currency(d_or_k, cd, cc, amm, amm_c, lamm):
    """out_sb_statement.sql:136-168."""
    if cd == cc:
        return amm
    if d_or_k == 0:
        return amm_c if cd == 0 else amm
    return amm if cc == 0 else amm_c


# ----------------------------------------------------------------------------------- evaluator
def _in(s, col):
    m = re.search(re.escape(col) + r" in \(([^)]*)\)", s, re.I)
    return None if m is None else {x.strip().strip("'") for x in m.group(1).split(",")}


def _eq(s, col):
    m = re.search(re.escape(col) + r" ?= ?(-?\d+)", s, re.I)
    return None if m is None else int(m.group(1))


class OstMixin:
    def _ost_accs(self):
        old, self._bal_out = self._bal_out, True
        try:
            accs = self._accs()
        finally:
            self._bal_out = old
        X = _ost()["accounts"]
        return {i: {**a, "OP_ID": X.get(str(i), {}).get("OP_ID"), "OPEN_DAT": X.get(str(i), {}).get("OPEN_DAT")} for i, a in accs.items()}

    def _ost_provs(self):
        V = _ost()["vid_op"]
        return [{**p, "VID_OP": V.get(str(p["ID"]), p.get("VID_OP"))} for p in self.bal["provarch"] if p.get("OUT")]

    def _ost_arch(self, acc_id):
        return sorted((r for r in self.bal["archost"] if r["ACC_ID"] == acc_id), key=lambda r: r["DATDATE"])

    def _ost_match(self, a, s, prefix=""):
        """Common filters of the three generated texts (main_condition / filial / user / currency)."""
        bal, acc, kli = _in(s, prefix + "bal_cn1"), _in(s, prefix + "acc_no"), _in(s, prefix + "kli_id")
        if bal is not None:
            if not (str(a["BAL_CN1"]) in bal or a["ACC_NO"] in acc or str(a.get("KLI_ID")) in kli):
                return False
        for col, key in (("filial", "FILIAL"), ("op_id", "OP_ID"), ("val_acc", "VAL_ACC")):
            v = _eq(s, prefix + col)
            if v is not None and a.get(key) != v:
                return False
        return True

    def _ost_func(self, key, args):
        if key == "OUT_SB_STATEMENT.NOTACCID":
            return not_acc_id(*args)
        return NotImplemented

    def _ost_query(self, sql, b):
        B, X = self.bal, _ost()
        if sql == Q.SQL_OST_ODS_GETEXTRACTION or sql == Q.SQL_OST_ODS_EXTRACTIONTRANS:
            f = get_extraction if sql == Q.SQL_OST_ODS_GETEXTRACTION else extraction_trans
            return [{"STR": f(b["bDate"], b["eDate"], b["ClientID"], b["AccountNo"], b["BalanceNo"], b["BranchID"], b["CurrencyID"], b["UserID"])}]
        if sql == Q.SQL_OST_ODSCURRENCY:
            return [{"VALUTE": r["VALUTE"], "VAL_NAME": r["VAL_NAME"], "VALU_NAME": r["VALU_NAME"]} for r in B["avalute"]]
        if sql == Q.SQL_OST_ODSFILIAL:
            return [dict(f) for f in sorted(B["filial"], key=lambda f: f["ID"])]
        if sql == Q.SQL_OST_ODSUSERS:
            return [dict(o) for o in B["operators"]]
        if sql == Q.SQL_OST_ODSLOGO:
            return [dict(r, LOGO=None) for r in B["bankinfo"]]
        if sql in (Q.SQL_OST_RATESDATASET, Q.SQL_OST_RATESDATASETBEGIN):
            return [{"VAL_KOD": r["VAL_KOD"], "DAT": datetime.datetime.fromisoformat(r["DAT"]), "OSTAT": r["OSTAT"]}
                    for r in X["operkurs"] if r["VAL_KOD"] == b["Val_Kod"] and b["Dat"] is not None
                    and datetime.date.fromisoformat(r["DAT"]) == _day(b["Dat"])]
        dates = [_undo(x) for x in re.findall(r"'(\d\d-[A-Z]{3}-\d\d)'", sql)]
        if sql.startswith("select id as accountid from out_account  where "):
            beg, end = dates[0], dates[1]
            skip_rate = "nvl(vid_op,0)<>1" in sql
            moved = set()
            for p in self._ost_provs():
                if beg <= _day(p["DAT"]) <= end and not (skip_rate and (p["VID_OP"] or 0) == 1):
                    moved |= {p["DEBT"], p["KREDIT"]}
            return [{"ACCOUNTID": i} for i, a in sorted(self._ost_accs().items()) if i not in moved and self._ost_match(a, sql)]
        if sql.startswith("select\n  ac.id         AccountId,"):
            return self._ost_main(sql, dates)
        if sql.startswith("select \npr.id            id,"):
            return self._ost_trans(sql, dates, b["OwnAccountId"])
        return None

    def _ost_main(self, sql, dates):
        beg, end = dates[0], dates[3]
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        inn = _ost()["customers"]
        out = []
        provs = self._ost_provs()
        for i, a in self._ost_accs().items():
            if a.get("KLI_ID") is None or str(a["KLI_ID"]) not in inn or a["VAL_ACC"] not in cur:
                continue                                                       # inner joins customers / avalute
            if a["OPEN_DAT"] is None or datetime.date.fromisoformat(a["OPEN_DAT"]) > end:
                continue
            if not self._ost_match(a, sql, "ac."):
                continue
            arch = self._ost_arch(i)
            before = [r for r in arch if _day(r["DATDATE"]) < beg]                   # fOstat / fPok_Ostat / fDatDate
            upto = [r for r in arch if _day(r["DATDATE"]) <= end]                    # fEndOstat / fEndPok_Ostat
            fb, fe = (before[-1] if before else None), (upto[-1] if upto else None)
            upto_b = [r for r in arch if _day(r["DATDATE"]) <= beg]
            pok_eb = upto_b[-1]["POK_OSTAT"] if upto_b else None
            last = [_day(p["DAT"]) for p in provs if i in (p["DEBT"], p["KREDIT"]) and _day(p["DAT"]) < beg and (p["VID_OP"] or 0) != 1]
            pok_b, pok_e = (fb or {}).get("POK_OSTAT"), (fe or {}).get("POK_OSTAT")
            dt = lambda d: datetime.datetime.combine(d, datetime.time()) if d else None   # noqa: E731
            out.append({"ACCOUNTID": i, "CUSTOMERID": a["KLI_ID"], "ACCOUNTNUMBER": a["ACC_NO"], "OPERATORID": a["OP_ID"],
                        "CURRENCYID": a["VAL_ACC"], "CURRENCYNAME": cur[a["VAL_ACC"]], "ACCOUNTNAME": a["NAME"],
                        "CUSTOMERVOIN": inn[str(a["KLI_ID"])], "BALANCECODE": a["BAL_CN1"],
                        "OPENDATE": dt(datetime.date.fromisoformat(a["OPEN_DAT"])), "FILIAL": a["FILIAL"],
                        "LASTOPDATE": dt(max(last)) if last else None,
                        "OSTAT": (fb or {}).get("OSTAT"), "POKOSTAT": pok_b,
                        "ENDOSTAT": (fe or {}).get("OSTAT"), "ENDPOKOSTAT": pok_e,
                        "DATDATE": dt(_day(fb["DATDATE"])) if fb else None, "ENDDATE": dt(end),
                        # fAp_Beg / fAp_End: NULL >= 0 is not true -> '(A)'; fAp_End is passed v_beg_dat (package :447)
                        "AP_BEG": "(P)" if pok_b is not None and pok_b >= 0 else "(A)",
                        "AP_END": "(P)" if pok_eb is not None and pok_eb >= 0 else "(A)"})
        return sorted(out, key=lambda r: r["ACCOUNTNUMBER"])

    def _ost_trans(self, sql, dates, own):
        beg, end = dates[0], dates[1]
        d_part, k_part = sql.split(" union ", 1)
        accs = self._ost_accs()
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        out = []
        for p in self._ost_provs():
            if not beg <= _day(p["DAT"]) <= end:
                continue
            dt = datetime.datetime.combine(_day(p["DAT"]), datetime.time())
            for side, part in (("DEBT", d_part), ("KREDIT", k_part)):
                if p[side] != own or own not in accs or not self._ost_match(accs[own], part, "ac."):
                    continue
                pair = p["KREDIT"] if side == "DEBT" else p["DEBT"]
                d = side == "DEBT"
                curr = p["VAL_ACC"] if d else p["CURRENCYID_C"]
                if curr not in cur:
                    continue
                amt = check_currency(0 if d else 1, p["VAL_ACC"], p["CURRENCYID_C"], p["AMMOUNT"], p["AMMOUNT_C"], p["LAMMOUNT"])
                out.append({"ID": p["ID"], "DAT": dt, "CURRENCYID": curr, "OWNACCOUNTID": own, "PAIRACCOUNTID": pair,
                            "PAIRACCOUNTNAME": accs[pair]["ACC_NO"] if pair in accs else "",
                            "PAIRCURRENCYID": p["CURRENCYID_C"] if d else p["VAL_ACC"],
                            "DEBIT": amt if d else 0, "KREDIT": 0 if d else amt, "LDEBIT": p["LAMMOUNT"] if d else 0,
                            "LKREDIT": 0 if d else p["LAMMOUNT"], "OPERATIONCODE": p["VID_OP"], "NAME": p["NAME"], "AVALNAME": cur[curr]})
        return sorted(out, key=lambda r: (r["DAT"], r["DEBIT"], r["KREDIT"]))

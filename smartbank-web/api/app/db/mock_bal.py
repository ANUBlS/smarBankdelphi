"""Mock emulation of the Oracle objects used by the balance report packages (fixtures/bal.json).

Only for DB_MODE=mock: the real server computes all of this in SB_BALANCEFILIDS / SB_BALANCE / OUT_SB_BALANCE /
SB_MTOUTVIEW / SBCORRECTION. Dynamic SQL produced by bal_logic is parsed back with regular expressions, so the mock
also proves that the generated text carries the right filters.
"""
from __future__ import annotations

import copy
import datetime
import json
import os
import re
from decimal import Decimal

from .base import DBError
from .. import bal_logic as L

_fix = None


def load(d):
    global _fix
    if _fix is None:
        _fix = json.load(open(os.path.join(d, "bal.json"), encoding="utf-8"))
    return _fix


def reset():
    global _fix
    _fix = None


def _d(s):
    return datetime.datetime.fromisoformat(s) if isinstance(s, str) else s


def _day(v):
    return v.date() if isinstance(v, datetime.datetime) else v


_MOCK_TAG = re.compile(r"/\*mock:(\{.*?\})\*/", re.S)


class BalMixin:
    # ------------------------------------------------------------------ state
    @property
    def bal(self):
        from ..config import settings
        return load(settings.mock_fixtures)

    def _spr(self, n=1):
        return {r["BAL_CN"]: r for r in self.bal[f"bal_spr{n}"]}

    def _dates(self):
        return [datetime.date.fromisoformat(x) for x in self.bal["dates"]]

    def _rests(self, day):
        day = _day(day)
        return {r["ACC_ID"]: r for r in self._arch() if datetime.date.fromisoformat(r["DATDATE"]) == day}

    # Off-balance (Out_) packages read the OUT_* twins of the tables (out_account, out_archost, out_provarch, ...).
    # The fixture keeps one account list; accounts on an off-balance plan line (out_bal_cn) form the OUT_ tables.
    _bal_out = False

    def _outmode(self, text: str) -> None:
        self._bal_out = bool(re.search(r"\bout_\w", text, re.I))

    def _accs(self):
        outs = set(self.bal["out_bal_cn"])
        return {a["ID"]: a for a in self.bal["accounts"] if (a["BAL_CN1"] in outs) == self._bal_out}

    def _arch(self):
        accs = self._accs()
        return [r for r in self.bal["archost"] if r["ACC_ID"] in accs]

    def _act(self, rest, field, spr):
        return L.mtoutview_active(rest.get(field), spr["TYPEID"], spr["ADDITIONALTYPEID"])

    def _pas(self, rest, field, spr):
        return L.mtoutview_passiv(rest.get(field), spr["TYPEID"], spr["ADDITIONALTYPEID"])

    # ------------------------------------------------------------------ packages
    def _bal_func(self, key, args, named):
        if key in ("SB_BALANCEFILIDS.GETBANKDAY", "SB_BALANCE.GETBANKDAY", "OUT_SB_BALANCEFILIDS.GETBANKDAY", "OUT_SB_BALANCE.GETBANKDAY"):
            return _d(self.bal["tek_dat"])
        return NotImplemented

    def _bal_bool(self, key, args, named):
        if key == "SBCORRECTION.CHECK_ACCOUNT_BALANCE":
            return (named or {})["AccID"] not in self.bal["broken_accounts"]
        return NotImplemented

    def _bal_proc(self, key, args, named):
        if key == "SBCORRECTION.CORRECT_ACCOUNT_BALANCE":
            aid = (named or {})["AccID"]
            if aid in self.bal["broken_accounts"]:
                self.bal["broken_accounts"].remove(aid)
            return {}
        if key in ("SB_BALANCE.NON_EXSIST_DATES", "OUT_SB_BALANCE.NON_EXSIST_DATES"):
            if len(args) != (18 if key.startswith("SB_") else 9):
                raise DBError("PLS-00306: wrong number or types of arguments in call to 'NON_EXSIST_DATES'")
            self._dbd_fill(key.startswith("OUT_"), args)
            return {}
        if key == "GETBALANCE":
            self.bal_state["comp"] = dict(named or {})
            return {}
        return NotImplemented

    def _bal_plsql_out(self, sql, binds):
        self._outmode(sql)
        m = re.search(r"SB_BalanceFilIDs\.(\w+)\(", sql, re.I)
        if m and m.group(1) in L.BALANCE_PROCS:
            p = {k: (v.date().isoformat() if isinstance(v, datetime.datetime) else v) for k, v in binds.items()
                 if not hasattr(v, "typ")}
            p["proc"] = m.group(1)
            p["out"] = self._bal_out
            head = ("Select FirstRemainder.FDate,FirstRemainder.FirstActive,FirstRemainder.FirstPassive,LastRemainder.LDate,"
                    "LastRemainder.LastActive,LastRemainder.LastPassive,TurnOver.DTurnOver,TurnOver.KTurnOver,B.BAL_CN,B.BALNAME From ")
            body = "(" + ("x" * 2100) + ")"    # long enough to exercise the 1999-char split of sb_OpenDataSet
            return {"Param1": head + body + "/*mock:" + json.dumps(p) + "*/", "Param2": " Union Select ..."}
        if "sb_balancefilids.getbankinfo" in sql.lower():
            b = self.bal["bankinfo"][0]
            return {"p0": b["BANK"], "p1": b["KOD_B"], "p2": b["SEDR"], "p3": b["BUHALTR"]}
        return NotImplemented

    def _bal_cursor(self, sql, cursor_bind, binds):
        if "sb_balancefilids.opencursor" not in sql.lower():
            return NotImplemented
        text = (binds.get("AStrParam1") or "") + (binds.get("AStrParam2") or "")
        m = _MOCK_TAG.search(text)
        if not m or not text.endswith(" Order By Bal_CN"):
            raise DBError("ORA-00933: SQL command not properly ended")
        p = json.loads(m.group(1))
        if bool(p.get("out")) != ("out_sb_balancefilids" in sql.lower()):
            raise DBError("ORA-00942: table or view does not exist")     # text of one package opened by the other
        self._bal_out = bool(p.get("out"))
        return self._balance_rows(p)

    # ------------------------------------------------------------------ Balance (sb_BalanceSelections semantics)
    def _balance_rows(self, p):
        first, last = datetime.date.fromisoformat(p["begDate"]), datetime.date.fromisoformat(p["endDate"])
        n, cur, surface = int(p["BalanceType"]), int(p["CurrencyID"]), int(p["FormatID"])
        branch = str(p.get("BranchID") or "-1").strip()
        branches = None if branch in ("-1", "") else {int(x) for x in branch.split(",") if x.strip()}
        pre = "POK_" if (surface == 1 or cur == -1) else ""
        ds = self._dates()
        lprev = [x for x in ds if x <= last]
        fprev = [x for x in ds if x < first]
        ldate = max(lprev) if lprev else None
        fdate = max(fprev) if fprev else None
        spr, accs = self._spr(n), self._accs()

        def ok(a):
            return (cur == -1 or a["VAL_ACC"] == cur) and (branches is None or a["FILIAL"] in branches) and a[f"BAL_CN{n}"] in spr

        def agg(day):
            out = {}
            if day is None:
                return out
            for aid, r in self._rests(day).items():
                a = accs[aid]
                if not ok(a):
                    continue
                s = spr[a[f"BAL_CN{n}"]]
                o = out.setdefault(s["BAL_CN"], [Decimal(0), Decimal(0)])
                o[0] += self._act(r, pre + "OSTAT", s)
                o[1] += self._pas(r, pre + "OSTAT", s)
            return out
        fr, lr = agg(fdate), agg(ldate)
        turn = {}
        for r in self._arch():
            d = datetime.date.fromisoformat(r["DATDATE"])
            a = accs[r["ACC_ID"]]
            if first <= d <= last and ok(a):
                t = turn.setdefault(a[f"BAL_CN{n}"], [Decimal(0), Decimal(0)])
                t[0] += Decimal(str(r[pre + "OBR_D"]))
                t[1] += Decimal(str(r[pre + "OBR_K"]))
        rows = []
        for bc in sorted(lr):
            if bc not in turn:
                continue
            f = fr.get(bc, [0, 0])
            rows.append({"FDATE": fdate.strftime("%d-%b-%y").upper() if fdate else None, "FIRSTACTIVE": f[0], "FIRSTPASSIVE": f[1],
                         "LDATE": ldate.strftime("%d-%b-%y").upper(), "LASTACTIVE": lr[bc][0], "LASTPASSIVE": lr[bc][1],
                         "DTURNOVER": turn[bc][0], "KTURNOVER": turn[bc][1], "BAL_CN": bc, "BALNAME": spr[bc]["BALNAME"]})
        return rows

    # ------------------------------------------------------------------ DBDBalance (NON_EXSIST_DATES -> dbd_balance)
    def _dbd_fill(self, out, args):
        self._bal_out = out
        first, last, branch = _day(args[0]), _day(args[1]), args[2]
        add = args[5] or ""
        filt = "".join(x for x in args[6:-1] if x) if not out else (args[6] or "")
        t = int(args[-1])
        if (last - first).days < 0:
            raise DBError("ORA-20032: Firs Date must less than Last Date!")
        vals = re.search(r"VAL_ACC in \(([\d,]+)\)", add)
        vals = {int(x) for x in vals.group(1).split(",")} if vals else None
        syms = re.findall(r"like\s+\('%(\w)%'\)", add)
        bals = re.search(r"bal_cn\d IN \(([\d, ]+)\)", filt)
        bals = {int(x) for x in bals.group(1).split(",")} if bals else None
        accnos = set(re.findall(r"'([A-Za-z0-9]+)'", filt)) if "acc_no IN" in filt else None
        spr, accs, outs = self._spr(t), {a["ID"]: a for a in self.bal["accounts"]}, set(self.bal["out_bal_cn"])
        ds = self._dates()
        rows = []
        day = first
        while day <= last:
            src = day if day in ds else max([x for x in ds if x < day], default=None)
            agg = {}
            for aid, r in ({r["ACC_ID"]: r for r in self.bal["archost"] if r["DATDATE"] == src.isoformat()}.items() if src else []):
                a = accs[aid]
                bc = a[f"BAL_CN{t}"]
                if (bc in outs) != out or bc not in spr:
                    continue
                if branch != -1 and a["FILIAL"] != branch:
                    continue
                if vals is not None and a["VAL_ACC"] not in vals:
                    continue
                if syms and not any(s in (a["TIPACC"] or "") for s in syms):
                    continue
                if bals is not None and bc not in bals:
                    continue
                if accnos is not None and a["ACC_NO"] not in accnos:
                    continue
                s = spr[bc]
                o = agg.setdefault(bc, {"ADATE": datetime.datetime.combine(day, datetime.time()), "ACCOUNTNUM": str(bc),
                                        "ACCOUNTNAME": s["BALNAME"], "ACTIVE": Decimal(0), "PASSIVE": Decimal(0),
                                        "DEBT_TURNOVER": Decimal(0), "CREDIT_TURNOVER": Decimal(0)})
                o["ACTIVE"] += self._act(r, "POK_OSTAT", s)
                o["PASSIVE"] += self._pas(r, "POK_OSTAT", s)
                o["DEBT_TURNOVER"] += Decimal(str(r["POK_OBR_D"]))
                o["CREDIT_TURNOVER"] += Decimal(str(r["POK_OBR_K"]))
            rows += [agg[k] for k in sorted(agg)]
            day += datetime.timedelta(days=1)
        self.bal_state["out_dbd" if out else "dbd"] = rows

    # ------------------------------------------------------------------ SQL
    def _bal_query(self, s, b):
        self._outmode(s)
        B = self.bal
        st = self.bal_state
        # ---- Balance (UnitDataMod / BalanceImplUnit)
        if s == "select valute,valu_name from avalute":
            return [{"VALUTE": r["VALUTE"], "VALU_NAME": r["VALU_NAME"]} for r in B["avalute"]]
        if s == "select id ,name from filial":
            return [{"ID": f["ID"], "NAME": f["NAME"]} for f in B["filial"]]
        if s == "select accgroup,bal_cn as balancenumber from bal_spr1 order by bal_cn":
            return [{"ACCGROUP": r["ACCGROUP"], "BALANCENUMBER": r["BAL_CN"]} for r in sorted(B["bal_spr1"], key=lambda r: r["BAL_CN"])]
        if s in ("select * from bankinfo", "select nb,bf from bankinfo"):
            return [dict(B["bankinfo"][0])]
        if s == "select value from settings where upper(name) ='product_name'":
            return [{"VALUE": B["product_name"]}]
        if s == "select b.rowid, b.code, b.balance, b.name from balance_settings b":
            return [dict(r) for r in B["balance_settings"]]
        if s.startswith("update balance_settings set"):
            return None
        if s == "select * from balance order by code":
            return self._comp_rows()
        # ---- DBDBalance
        if s.startswith("select a.adate, a.accountnum, a.accountname, a.active, a.passive, a.debt_turnover, a.credit_turnover from dbd_balance a order by adate , accountnum"):
            return copy.deepcopy(st.get("dbd", []))
        if s.startswith("select adate,accountnum,accountname,sum(active) as active") and "from out_dbd_balance" in s:
            return copy.deepcopy(st.get("out_dbd", []))
        if s == "select a.symbol, a.description from account_flags a":
            return [dict(r) for r in B["account_flags"]]
        if s == "select valute, valu_name from avalute_t":
            return [{"VALUTE": r["VALUTE"], "VALU_NAME": r["VALU_NAME"]} for r in B["avalute"]]
        if s == "select id , name from filial":
            return [{"ID": f["ID"], "NAME": f["NAME"]} for f in B["filial"]]
        # ---- TodayBalance
        if s == "select tek_dat as currentdate from smart.sysdat":
            return [{"CURRENTDATE": _d(B["tek_dat"])}]
        if s == "select valute as currency , valu_name as currlname from avalute order by valute":
            return [{"CURRENCY": r["VALUTE"], "CURRLNAME": r["VALU_NAME"]} for r in B["avalute"]]
        if s == "select id as branchid , name as branchname from filial":
            return [{"BRANCHID": f["ID"], "BRANCHNAME": f["NAME"]} for f in B["filial"]]
        if s.startswith("select * from( select kod_b, 'ümumi' bank"):
            a = b.get("a")
            rows = [dict(r) for r in B["bankinfo"] if r["KOD_FIL"] == (0 if a == -1 else a)]
            if a == -1:
                for r in rows:
                    r["BANK"], r["KOD_FIL"] = "Ümumi", -1
            return rows
        if s == "select bank , inn , sedr , buhaltr , managertitle , accountanttitle , logo from bankinfo":
            r = B["bankinfo"][0]
            return [{k: r.get(k) for k in ("BANK", "INN", "SEDR", "BUHALTR", "MANAGERTITLE", "ACCOUNTANTTITLE", "LOGO")}]
        if s.startswith("select max(dat) as workdate from operkurs"):
            ds = [x for x in self._dates() if x <= _day(b["RealDate"])]
            return [{"WORKDATE": datetime.datetime.combine(max(ds), datetime.time()) if ds else None}]
        if s.startswith("select b.bal_cn as accountnumber"):
            return self._tb_balance(s, b)
        if s.startswith("select ac.acc_no as accnumber"):
            return self._tb_accounts(s, b)
        if s.startswith("select p.id, ad.id as debitaccid"):
            return self._tb_transactions(s, b)
        # ---- BalanceAnalys
        if s.startswith("select lastremainder.balancebill as balanceaccount"):
            return self._ba_balance(s, b)
        if s.startswith("select restforlastperiod.accountid"):
            return self._ba_account(s, b)
        if s.startswith("select t.id,t.op_id as operatorid"):
            rows = self._ba_transactions(s, b)
            if self._bal_out:      # Out_ Transaction select list has no kreditbalans / debetbalans
                for r in rows:
                    r.pop("KREDITBALANS", None); r.pop("DEBETBALANS", None)
            return rows
        if s.startswith("select sum(t.ammount) cem,d.bal_cn1 debetbalans ,c.bal_cn1 kreditbalans"):
            return self._ba_balacc(s, b)
        if s == "select * from user$ order by id":
            return [dict(r) for r in B["operators"]]
        if s == "select id, name from filial order by id":
            return [{"ID": f["ID"], "NAME": f["NAME"]} for f in B["filial"]]
        if s == "select max(dat) as beginperiod from operkurs where dat<:begindate":
            ds = [x for x in self._dates() if x < _day(b["BeginDate"])]
            return [{"BEGINPERIOD": datetime.datetime.combine(max(ds), datetime.time()) if ds else None}]
        if s == "select valute, valu_name from avalute order by valute":
            return [{"VALUTE": r["VALUTE"], "VALU_NAME": r["VALU_NAME"]} for r in B["avalute"]]
        # ---- AccBalanceCheck
        if s.startswith("select acc.id, acc.acc_no as accountno, acc.name as accname, t.ostat as amount"):
            last = self._rests(self._dates()[-1])
            return [{"ID": a["ID"], "ACCOUNTNO": a["ACC_NO"], "ACCNAME": a["NAME"], "AMOUNT": last[a["ID"]]["OSTAT"],
                     "LAMOUNT": last[a["ID"]]["POK_OSTAT"], "DEBITTURNOVER": last[a["ID"]]["OBR_D"], "DEBITLTURNOVER": last[a["ID"]]["POK_OBR_D"],
                     "CREDITTURNOVER": last[a["ID"]]["OBR_K"], "CREDITLTURNOVER": last[a["ID"]]["POK_OBR_K"]} for a in self._accs().values()]
        return None

    def _bal_execute(self, sql, binds):
        if sql.strip().lower().startswith("update balance_settings set"):
            r = next((x for x in self.bal["balance_settings"] if x["ROWID"] == binds.get("rid")), None)
            if r is None:
                raise DBError("ORA-01403: no data found")
            for k in ("CODE", "BALANCE", "NAME"):
                r[k] = binds[k.lower()]
            return True
        return False

    @property
    def bal_state(self):
        if not hasattr(self, "_bal_st"):
            self._bal_st = {}
        return self._bal_st

    # ------------------------------------------------------------------ helpers for the parsed families
    def _comp_rows(self):
        c = self.bal_state.get("comp")
        if not c:
            return []
        ds = self._dates()
        bdate, ldate = _day(c["BeginDate"]), _day(c["LastDate"])
        b0 = max([x for x in ds if x < bdate], default=None)
        l0 = max([x for x in ds if x <= ldate], default=None)
        accs, spr = self._accs(), self._spr(1)
        rows = []
        for st in self.bal["balance_settings"]:
            bcs = {int(x) for x in st["BALANCE"].split(",") if x.strip()}
            status = spr[min(bcs)]["TYPEID"] if bcs and min(bcs) in spr else 1

            def tot(day):
                if day is None:
                    return Decimal(0)
                return sum((abs(Decimal(str(r["POK_OSTAT"]))) for aid, r in self._rests(day).items()
                            if accs[aid]["BAL_CN1"] in bcs), Decimal(0))
            rows.append({"NAME": st["NAME"], "CODE": st["CODE"], "RESTBEGINPERIOD": tot(b0), "RESTLASTPERIOD": tot(l0), "STATUS": status})
        return rows

    def _tb_balance(self, s, b):
        rows = {}
        for a, r, sp, pre in self._tb_iter(s, b):
            o = rows.setdefault(sp["BAL_CN"], {"ACCOUNTNUMBER": sp["BAL_CN"], "ACTIVE": Decimal(0), "PASSIVE": Decimal(0),
                                               "DTURNOVER": Decimal(0), "CTURNOVER": Decimal(0), "ACCOUNTNAME": sp["BALNAME"]})
            o["ACTIVE"] += self._act(r, pre + "OSTAT", sp)
            o["PASSIVE"] += self._pas(r, pre + "OSTAT", sp)
            o["DTURNOVER"] += Decimal(str(r[pre + "OBR_D"]))
            o["CTURNOVER"] += Decimal(str(r[pre + "OBR_K"]))
        return [rows[k] for k in sorted(rows)]

    def _tb_accounts(self, s, b):
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        out = []
        for a, r, sp, pre in self._tb_iter(s, b):
            if a["BAL_CN1"] != b.get("AccountNumber"):
                continue
            out.append({"ACCNUMBER": a["ACC_NO"], "ACCCURRENCY": cur[a["VAL_ACC"]], "ACTIVE": self._act(r, pre + "OSTAT", sp),
                        "PASSIVE": self._pas(r, pre + "OSTAT", sp), "ACCOUNTNUMBER": a["BAL_CN1"], "ACCID": a["ID"],
                        "DTURNOVER": Decimal(str(r[pre + "OBR_D"])), "CTURNOVER": Decimal(str(r[pre + "OBR_K"])), "ACCOUNTNAME": a["NAME"]})
        return out

    def _tb_iter(self, s, b):
        if "%s" in s or "%d" in s:
            raise DBError("ORA-00911: invalid character")
        table = re.search(r"from (tenostat|archost|out_archost) ar", s).group(1)
        pre = "pok_" if "ar.pok_ostat" in s else ""
        fil = re.search(r"\(ac\.filial = (\d+)\)", s)
        cur = re.search(r"\(ac\.val_acc = (\d+)\)", s)
        bals = re.search(r"\(ac\.bal_cn1 in \(([\d, ]+)\)\)", s)
        day = _day(b["TargetDate"])
        today = datetime.date.fromisoformat(self.bal["tek_dat"])
        if table != "out_archost" and (table == "tenostat") != (day == today):
            return
        rests = self._rests(day)
        spr, accs = self._spr(1), self._accs()
        for aid, r in rests.items():
            a = accs[aid]
            if fil and a["FILIAL"] != int(fil.group(1)):
                continue
            if cur and a["VAL_ACC"] != int(cur.group(1)):
                continue
            if bals and a["BAL_CN1"] not in {int(x) for x in bals.group(1).split(",")}:
                continue
            yield a, r, spr[a["BAL_CN1"]], pre.upper()

    def _prov(self, table):
        accs = self._accs()
        return [p for p in self.bal["provdoc" if table.endswith("provdoc") else "provarch"] if p["DEBT"] in accs and p["KREDIT"] in accs]

    def _tb_transactions(self, s, b):
        table = re.search(r"from (provdoc|provarch|out_provarch) p", s).group(1)
        day = _day(b["TargetDate"])
        accs = self._accs()
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        ops = {o["ID"]: o["NAME"] for o in self.bal["operators"]}
        return [{"ID": p["ID"], "DEBITACCID": p["DEBT"], "CREDITACCID": p["KREDIT"], "OPERATORID": ops.get(p["OP_ID"]),
                 "TRANSACTIONDATE": _d(p["DAT"]), "DEBITACCNO": accs[p["DEBT"]]["ACC_NO"], "DEBITCURRENCYSNAME": cur[p["VAL_ACC"]],
                 "CREDITACCNO": accs[p["KREDIT"]]["ACC_NO"], "CREDITCURRENCYSNAME": cur[p["CURRENCYID_C"]], "DEBITAMOUNT": p["AMMOUNT"],
                 "CREDITAMOUNT": p["AMMOUNT_C"], "LAMOUNT": p["LAMMOUNT"], "TRDESCRIPTION": p["NAME"]}
                for p in self._prov(table) if _d(p["DAT"]).date() == day]

    def _ba_parse(self, s):
        if "%s" in s or "%d" in s:
            raise DBError("ORA-00911: invalid character")
        pre = "POK_" if "ar.pok_ostat" in s else ""
        plane = int(re.search(r"bal_spr(\d)", s).group(1))
        fil = re.search(r"(?:ac\.filial in|restforlastperiod\.branchid in) \(([\d,]+)\)", s)
        cur = re.search(r"(?:ac\.val_acc =|restforlastperiod\.currencyid =)(\d+)", s)
        bals = re.search(r"\(b\.bal_cn in \(([\d.,]+)\) or b\.accgroup in", s) or re.search(r"and b\.bal_cn in \(([\d.,]+)\)", s)
        return (pre, plane, {int(x) for x in fil.group(1).split(",")} if fil else None, int(cur.group(1)) if cur else None,
                {int(float(x)) for x in bals.group(1).split(",")} if bals else None)

    def _ba_balance(self, s, b):
        pre, plane, fils, cur, bals = self._ba_parse(s)
        accs, spr = self._accs(), self._spr(plane)

        def ok(a):
            sp = spr.get(a[f"BAL_CN{plane}"])
            return sp and (fils is None or a["FILIAL"] in fils) and (cur is None or a["VAL_ACC"] == cur) and \
                (bals is None or sp["BAL_CN"] in bals or sp["ACCGROUP"] in bals)

        def rest(day):
            out = {}
            for aid, r in self._rests(day).items():
                a = accs[aid]
                if ok(a):
                    sp = spr[a[f"BAL_CN{plane}"]]
                    o = out.setdefault(sp["BAL_CN"], [Decimal(0), Decimal(0)])
                    o[0] += self._act(r, pre + "OSTAT", sp)
                    o[1] += self._pas(r, pre + "OSTAT", sp)
            return out
        first, last = rest(b["BeginPeriod"]), rest(b["EndDate"])
        turn = {}
        for r in self._arch():
            a = accs[r["ACC_ID"]]
            if ok(a) and _day(b["BeginDate"]) <= datetime.date.fromisoformat(r["DATDATE"]) <= _day(b["EndDate"]):
                t = turn.setdefault(a[f"BAL_CN{plane}"], [Decimal(0), Decimal(0)])
                t[0] += Decimal(str(r[pre + "OBR_D"]))
                t[1] += Decimal(str(r[pre + "OBR_K"]))
        return [{"BALANCEACCOUNT": k, "FIRSTACTIVE": first.get(k, [None, None])[0], "FIRSTPASSIVE": first.get(k, [None, None])[1],
                 "DTURNOVER": turn[k][0], "CTURNOVER": turn[k][1], "LASTACTIVE": last[k][0], "LASTPASSIVE": last[k][1]}
                for k in sorted(last) if k in turn]

    def _ba_account(self, s, b):
        pre, plane, fils, cur, _ = self._ba_parse(s)
        accs, spr = self._accs(), self._spr(plane)
        f, l_ = self._rests(b["BeginPeriod"]), self._rests(b["EndDate"])
        out = []
        for aid, r in l_.items():
            a = accs[aid]
            sp = spr.get(a[f"BAL_CN{plane}"])
            if not sp or (fils is not None and a["FILIAL"] not in fils) or (cur is not None and a["VAL_ACC"] != cur):
                continue
            tr = [x for x in self._arch() if x["ACC_ID"] == aid and _day(b["BeginDate"]) <= datetime.date.fromisoformat(x["DATDATE"]) <= _day(b["EndDate"])]
            if not tr:
                continue
            fr = f.get(aid)
            out.append({"ACCOUNTID": aid, "NAME": a["NAME"], "ACCNO": a["ACC_NO"], "CURRENCYID": a["VAL_ACC"], "BRANCHID": a["FILIAL"],
                        "BALANCENO": sp["BAL_CN"], "BEGINACTIVE": self._act(fr, pre + "OSTAT", sp) if fr else None,
                        "BEGINPASSIVE": self._pas(fr, pre + "OSTAT", sp) if fr else None,
                        "DTURNOVER": sum(Decimal(str(x[pre + "OBR_D"])) for x in tr), "CTURNOVER": sum(Decimal(str(x[pre + "OBR_K"])) for x in tr),
                        "ENDACTIVE": self._act(r, pre + "OSTAT", sp), "ENDPASSIVE": self._pas(r, pre + "OSTAT", sp)})
        return sorted(out, key=lambda x: x["ACCNO"])

    def _ba_rows(self, b):
        accs = self._accs()
        cur = {r["VALUTE"]: r["VAL_NAME"] for r in self.bal["avalute"]}
        ops = {o["ID"]: o["NAME"] for o in self.bal["operators"]}
        for p in self._prov("provarch"):
            if _day(b["BeginDate"]) <= _d(p["DAT"]).date() <= _day(b["EndDate"]):
                yield p, accs[p["DEBT"]], accs[p["KREDIT"]], cur, ops

    def _ba_transactions(self, s, b):
        if b.get("Title") is None:
            raise DBError("ORA-01008: not all variables bound")
        op = re.search(r"t\.op_id = (\d+) and", s)
        debt = re.search(r"and t\.debt = (-?\d+) and c\.bal_cn1=(\d+)", s)
        kred = re.search(r"and t\.kredit = (-?\d+) and d\.bal_cn1=(\d+)", s)
        out = []
        for p, d, c, cur, ops in self._ba_rows(b):
            if op and p["OP_ID"] != int(op.group(1)):
                continue
            if debt and (p["DEBT"] != int(debt.group(1)) or c["BAL_CN1"] != int(debt.group(2))):
                continue
            if kred and (p["KREDIT"] != int(kred.group(1)) or d["BAL_CN1"] != int(kred.group(2))):
                continue
            out.append({"ID": p["ID"], "OPERATORID": p["OP_ID"], "OPERATIONTYPE": p["VID_OP"], "KREDITBALANS": c["BAL_CN1"], "DEBETBALANS": d["BAL_CN1"],
                        "DAT": _d(p["DAT"]), "DEBT": p["DEBT"], "DEBTACC": d["ACC_NO"], "DVALNAME": cur[p["VAL_ACC"]], "KREDIT": p["KREDIT"],
                        "CREDITACC": c["ACC_NO"], "CVALNAME": cur[p["CURRENCYID_C"]], "AMMOUNT": p["AMMOUNT"], "AMMOUNT_C": p["AMMOUNT_C"],
                        "LAMMOUNT": p["LAMMOUNT"], "NAME": p["NAME"], "USERNAME": ops.get(p["OP_ID"])})
        return out

    def _ba_balacc(self, s, b):
        key = "KREDIT" if "t.kredit= :kredits" in s else "DEBT"
        acc = b.get("Kredits") if key == "KREDIT" else b.get("debts")
        g = {}
        for p, d, c, cur, ops in self._ba_rows(b):
            if p[key] == acc:
                k = (d["BAL_CN1"], c["BAL_CN1"])
                g[k] = g.get(k, Decimal(0)) + Decimal(str(p["AMMOUNT"]))
        return [{"CEM": v, "DEBETBALANS": k[0], "KREDITBALANS": k[1]} for k, v in g.items()]

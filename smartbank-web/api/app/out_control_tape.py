"""Off-balance control tape - port of Delphi Packages/Out_control_tape (TFrmControlTape, CLSID below).

Form ControlTapeImpl.pas, data module untdatamod.pas (SQL: out_ct_sql.py, verbatim from untdatamod.dfm).
The run-time SQL that ControlTapeImpl.pas builds by concatenation is reproduced string-for-string below
(ControlTapeImpl.pas line cited). User text Delphi concatenated (EditBalances, branch id, currency id) is
validated (integers only) instead of being pasted raw; the resulting SQL text is identical for valid input.
Buttons: Button3 'Yeniləmək' (refresh grid), Button1 'Çap' (QR1 detail print), Button2 'Məcmu' (QR2 summary),
Button4 'Hesabat' (QTransactionView transaction report).
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_ct_sql as Q
from . import report_render as R
from .balance import Labels, render_spec, file_resp, rows_out
from .delphi import date_only

CLSID = "{C0327750-D672-4942-90C6-4D56121957A7}"   # Out_control_tape_TLB.pas CLASS_FrmControlTape
ALL_CURRENCIES = "Bütün valyutalar"                  # Full :410
_BAL_LIST = re.compile(r"^\s*-?\d+(\s*,\s*-?\d+)*\s*$")


class TapeIn(BaseModel):
    date: datetime.date                              # DoDate
    currency: int = Field(0, ge=0)                   # CBCurrency.ItemIndex (0 = 'Bütün valyutalar', n = Rate[n-1])
    branch: int = -1                                 # DBLookupBranch.KeyValue
    balans: int = Field(0, ge=0, le=1)               # ComboBox_balans.ItemIndex (0 bal_cn1, 1 bal_cn2)
    toggle: bool = False                             # Toggle.Checked
    balances: str = Field("", max_length=2000)       # EditBalances.Text
    labels: Labels = Field(default_factory=Labels)


def build_filter(toggle: bool, balances: str, balans: int) -> str:
    """BuildFilter ControlTapeImpl.pas:352-365 (note: empty text -> bal_cn1 in (-1) for both plans, as in Delphi)."""
    if not toggle:
        return ""
    if balances.strip() != "":
        if not _BAL_LIST.match(balances):
            raise ValueError("balances")
        return (" a.bal_cn1 in (" if balans == 0 else " a.bal_cn2 in (") + balances + ") and "
    return " a.bal_cn1 in (" + "-1" + ") and "


def branch_filter(branch: int) -> str:
    """Button3Click :441-443 / Button1Click :482-486."""
    return " a.filial = " + str(int(branch)) + " and  " if branch != -1 else " "


def table_sql(b: TapeIn, rate: list[int]) -> str:
    """Button3Click :449-472 (ForTable)."""
    bf, flt = branch_filter(b.branch), build_filter(b.toggle, b.balances, b.balans)
    if b.balans == 0:
        if b.currency == 0:
            return ('select a.bal_cn1, Sum(p.ammount) as AMMOUNTS,Sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'
                    ' where a.id=p.debt and ' + bf + flt + 'p.dat=:ADate Group By a.Bal_cn1 order by a.bal_cn1')
        s = str(rate[b.currency - 1])
        return ('select a.bal_cn1, sum(p.ammount) as AMMOUNTS, sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'
                ' where a.id=p.debt and ' + bf + flt + 'p.dat=:ADate and a.Val_Acc=' + s + ' Group by bal_cn1 order by bal_cn1')
    if b.currency == 0:
        return ('select a.bal_cn2 as bal_cn1, Sum(p.ammount) as AMMOUNTS,Sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'
                ' where a.id=p.debt and ' + bf + flt + 'p.dat=:ADate Group By a.Bal_cn2 order by a.bal_cn2')
    s = str(rate[b.currency - 1])
    return ('select a.bal_cn2 as bal_cn1, sum(p.ammount) as AMMOUNTS, sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'
            ' where a.id=p.debt and ' + bf + flt + 'p.dat=:ADate and a.Val_Acc=' + s + ' Group by bal_cn2 order by bal_cn2')


def group_sql(b: TapeIn, rate: list[int], bank_day: datetime.date) -> str:
    """Button1Click :482-535 (Group). Today's bank day reads out_provdoc, other days out_provarch (:488-491)."""
    bf, flt = branch_filter(b.branch), build_filter(b.toggle, b.balances, b.balans)
    table = " out_provdoc p," if b.date == bank_day else " out_provarch p,"
    s = str(rate[b.currency - 1]) if b.currency else ""
    if b.balans == 0:
        if b.currency == 0:
            return ('select a.bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '
                    ' p.ammount ,p.lammount  from ' + table + ' Out_account a '
                    ' where a.id=p.debt and ' + flt + bf + 'p.dat=:ADate Order By a.Bal_cn1 ,p.val_acc,p.ammount')
        return ('select a.bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '
                'p.ammount,p.lammount from ' + table + ' out_account a '
                ' where a.id=p.debt and ' + flt + bf + 'p.dat=:ADate and a.Val_Acc=' + s + ' Order by bal_cn1 ,p.val_acc ,p.ammount')
    if b.currency == 0:
        return ('select a.bal_cn2 as bal_cn1 ,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '
                ' p.ammount ,p.lammount  from ' + table + ' Out_account a '
                ' where a.id=p.debt and ' + flt + bf + 'p.dat=:ADate Order By a.Bal_cn2  ,p.val_acc,p.ammount')
    return ('select a.bal_cn2 as bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '
            'p.ammount,p.lammount from ' + table + ' out_account a '
            ' where a.id=p.debt and ' + flt + bf + 'p.dat=:ADate and a.Val_Acc=' + s + ' Order by bal_cn2 ,p.val_acc ,p.ammount')


def view_sql(b: TapeIn, rate: list[int]) -> str:
    """Button4Click :565-682 (ODSTransactionView). Ignores branch and balance filters, as in Delphi."""
    col = "d.bal_cn1" if b.balans == 0 else "d.bal_cn2"
    sel = " Select d.bal_cn1 BalanceAccount," if b.balans == 0 else (" Select d.bal_cn2  BalanceAccount," if b.currency == 0 else " Select d.bal_cn2 BalanceAccount,")
    head = (sel + 'd.acc_no Debit,d.val_acc DebitCurrency,dc.val_name DValName'
            ',c.acc_no Credit,c.val_acc CreditCurrency,cc.val_name CValName,p.ammount DebitAmmount'
            ',p.ammount_c CreditAmmount,p.lammount CommonAmmount,p.name '
            ' From Out_Provarch p,Out_Account d,Out_Account c,Avalute dc,Avalute cc Where p.debt = d.id and p.kredit = c.id and ')
    if b.currency == 0:
        return head + 'd.val_acc = dc.valute and c.val_acc = cc.valute and p.dat =:TransactionDate  Order by ' + col
    return (head + 'd.val_acc= ' + str(rate[b.currency - 1]) + ' and d.val_acc = dc.valute and c.val_acc = cc.valute and '
            'p.dat =:TransactionDate  Order by ' + col)


def _sum(rows, *cols):
    return {c: sum((Decimal(str(r.get(c) or 0)) for r in rows), Decimal(0)) for c in cols}


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-control-tape")
    g = require_module(CLSID)

    def rates(c):
        return [int(x["VALUTE"]) for x in c.query(Q.SQL_OCT_FORMONEY)]   # Full :412-424 Rate[]

    def bank_day(c) -> datetime.date:
        v = c.call_func("Out_SB_Balance", "GetBankDay", [], datetime.datetime)   # ActiveFormCreate :386 OraclePackage1
        return v.date() if isinstance(v, datetime.datetime) else v

    def checked(b: TapeIn, c):
        rt = rates(c)
        if b.currency > len(rt):
            err(400, "error.generic")
        try:
            build_filter(b.toggle, b.balances, b.balans)
        except ValueError:
            err(400, "out_control_tape.err_balances")
        return rt

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        cur = [{"index": 0, "name": ALL_CURRENCIES}] + [{"index": i + 1, "valute": x["VALUTE"], "name": x["VALU_NAME"]}
                                                       for i, x in enumerate(c.query(Q.SQL_OCT_FORMONEY))]
        return {"date": bank_day(c).isoformat(), "currencies": cur, "branches": rows_out(c.query(Q.SQL_OCT_BRANCH))}

    def tape(c, b):
        rt = checked(b, c)
        rows = c.query(table_sql(b, rt), {"ADate": date_only(b.date)})
        return {"cols": ["BAL_CN1", "AMMOUNTS", "LAMMOUNTS"], "rows": rows, "totals": _sum(rows, "AMMOUNTS", "LAMMOUNTS")}

    def detail(c, b):
        rt = checked(b, c)
        rows = c.query(group_sql(b, rt, bank_day(c)), {"ADate": date_only(b.date)})
        groups = []
        for x in rows:
            if not groups or groups[-1]["key"] != x["BAL_CN1"]:
                groups.append({"key": x["BAL_CN1"], "rows": []})
            groups[-1]["rows"].append(x)
        for gr in groups:
            gr["totals"] = _sum(gr["rows"], "AMMOUNT", "LAMMOUNT")
        return {"cols": ["BAL_CN1", "VAL_ACC", "CURRENCYNAME", "AMMOUNT", "LAMMOUNT"], "rows": rows, "groups": groups,
                "totals": _sum(rows, "AMMOUNT", "LAMMOUNT")}

    def view(c, b):
        rt = checked(b, c)
        rows = c.query(view_sql(b, rt), {"TransactionDate": date_only(b.date)})
        return {"cols": ["BALANCEACCOUNT", "DEBIT", "DVALNAME", "CREDIT", "CVALNAME", "DEBITAMMOUNT", "CREDITAMMOUNT", "COMMONAMMOUNT", "NAME"],
                "rows": rows, "totals": _sum(rows, "DEBITAMMOUNT", "CREDITAMMOUNT", "COMMONAMMOUNT")}

    def summary(c, b):
        rep = tape(c, b)                                     # Button2Click :542 Button3.Click
        bank = c.query(Q.SQL_OCT_BANKSNAME)                  # :543 BanksName
        # :546-552 amount column (QRDBText2/QRExpr1) printed white unless ForMoney.Locate(valu_name, CBCurrency.Text)
        rep["amount_visible"] = b.currency != 0
        if not rep["amount_visible"]:
            rep["cols"] = ["BAL_CN1", "LAMMOUNTS"]
        rep["bank"] = bank[0]["BANK"] if bank else ""
        return rep

    KINDS = {"refresh": tape, "print": detail, "summary": summary, "report": view}

    def out(rep):
        o = {"cols": [x.lower() for x in rep["cols"]], "rows": rows_out(rep["rows"]),
             "totals": {k.lower(): float(v) for k, v in rep["totals"].items()}, "groups": None}
        if rep.get("groups"):
            o["groups"] = [{"key": gr["key"], "rows": rows_out(gr["rows"]), "totals": {k.lower(): float(v) for k, v in gr["totals"].items()}}
                           for gr in rep["groups"]]
        for k in ("bank", "amount_visible"):
            if k in rep:
                o[k] = rep[k]
        return o

    @r.post("/{kind}.{fmt}")
    def _file(kind: str, fmt: str, b: TapeIn, ws=Depends(g)):
        if kind not in KINDS or fmt not in ("pdf", "xlsx"):
            err(404, "error.generic")
        rep = KINDS[kind](ws.conn, b)
        spec = render_spec(rep, b.labels)
        lab = b.labels.model_dump()
        return file_resp(R.to_pdf(spec, lab) if fmt == "pdf" else R.to_xlsx(spec, lab), fmt, "control-tape-" + kind)

    @r.post("/{kind}")
    def _run(kind: str, b: TapeIn, ws=Depends(g)):
        if kind not in KINDS:
            err(404, "error.generic")
        return out(KINDS[kind](ws.conn, b))

    return r

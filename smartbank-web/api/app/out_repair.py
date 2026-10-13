"""Off-balance repair (transaction correction) - port of Delphi Packages/out_repair (TOut_RepairFrm, CLSID below).

OutRepair.dpr compiles Out_RepairImpl1.pas (list + filters), RepairNewEdit.pas (TOutRepairEdit editor),
RepairNewDataModule.pas (datasets, CheckTransaction, SaveTransaction) and OutRepdelete.pas (delete dialog).
Every write goes through Out_Correct.Main (named parameters, RepairNewDataModule.pas:269-302). SQL: out_rep_sql.py (verbatim).
The dataset Filter (ReInitializeFilters Out_RepairImpl1.pas:854-935) and the editor lookups run on the loaded rows,
exactly like the Delphi TDataSet.Filter / Locate. All user values are bound; nothing is concatenated into SQL.
"""
from __future__ import annotations
import datetime
import math

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from . import out_rep_sql as Q
from .customers import row
from .delphi import date_only, to_currency, delphi_frac

CLSID = "{86E3CBB4-1C62-4BD8-BC35-C5E16FACED54}"     # OutRepair_TLB.pas:56 CLASS_Out_RepairFrm
# Out_dbMain columns with a FieldName (Out_RepairImpl1.dfm) - the only values accepted for the :Title variable.
GRID_FIELDS = ("ID", "TRANSACTIONDATE", "DEBITACCNO", "DEBITCURRENCYSNAME", "CREDITACCNO", "CREDITCURRENCYSNAME",
               "DEBITAMOUNT", "CREDITAMOUNT", "LAMOUNT", "OPERATORID", "NAME")
FLAGS = {"delete": 0, "insert": 1, "update": 2}           # SaveTransaction :275-281 acDelete/acInsert/acUpdate


class RepError(Exception):
    def __init__(self, key, **extra):
        super().__init__(key)
        self.key, self.extra = key, extra


# ------------------------------------------------------------------------------------------------ lists
def check_dates(dat: datetime.date, dat2: datetime.date) -> None:
    """CheckDates RepairNewDataModule.pas:249-258: dtpOpDat > dtOpDatEnd -> 'Əməliyyat tarixini düzgün daxil edin' + Abort."""
    if dat > dat2:
        raise RepError("out_repair.err_dates")


def list_transactions(conn, dat: datetime.date, dat2: datetime.date, title: str | None = None) -> list[dict]:
    """TransactionData (RepairNewDataModule.dfm:7-55) with :DAT, :DAT2 (FullRefresh :343-345, RefreshTransExecute
    Out_RepairImpl1.pas:690-703) and :Title (Out_dbMainTitleClick .pas:629-638 SetVariable('Title', Column.FieldName)).
    :Title is a bind variable, so Oracle orders by a constant string - same row order as Delphi, kept on purpose."""
    check_dates(dat, dat2)
    t = (title or "").upper()
    return [row(r) for r in conn.query(Q.SQL_TRANSACTIONS, {"DAT": date_only(dat), "DAT2": date_only(dat2),
                                                           "Title": t if t in GRID_FIELDS else None})]


def lookups(conn, dat: datetime.date) -> dict:
    """FullRefresh (RepairNewDataModule.pas:339-377) + FilterShowAction(ftAll) (Out_RepairImpl1.pas:531-579)."""
    vals = [row(x) for x in conn.query(Q.SQL_VALUTES)]          # ValutesThreadRecord :396-405 (+ 'Yox' :385-394)
    vid = [row(x) for x in conn.query(Q.SQL_VIDOP)]             # VidOpThreadRecord :418-430
    return {
        "users": [row(x) for x in conn.query(Q.SQL_USERS)],
        "valutes": [{"id": x["valute"], "name": x.get("valu_name") or ""} for x in vals],
        "operations": [{"id": x["id"], "name": x.get("name") or ""} for x in vid],
        "filials": [row(x) for x in conn.query(Q.SQL_FILIAL)],
        "currencies": [row(x) for x in conn.query(Q.SQL_CURRENCIES)],
        "kassa": [row(x) for x in conn.query(Q.SQL_KASSA)],
        "convert": [row(x) for x in conn.query(Q.SQL_CONVERT)],
        "rates": rates(conn, dat),
    }


def rates(conn, dat: datetime.date) -> list[dict]:
    """DebetRateData / CreditRateData (dfm:194-247, same SQL) with :Dat = the editor date (InitializeEditSheets RepairNewEdit.pas:669-695)."""
    return [row(x) for x in conn.query(Q.SQL_RATES, {"Dat": date_only(dat)})]


def accounts(conn, side: str, val_acc: int) -> list[dict]:
    """DebetAccData / CreditAccData (dfm:348-368 / 427-447) - :val_acc = the chosen currency."""
    sql = Q.SQL_DEBIT_ACCOUNTS if side == "debit" else Q.SQL_CREDIT_ACCOUNTS
    return [row(x) for x in conn.query(sql, {"val_acc": val_acc})]


def descriptions(conn) -> list[str]:
    """LoadComboData RepairNewEdit.pas:598-618 (edDescription items from TrDescriptionData NAME)."""
    return [row(x).get("name") or "" for x in conn.query(Q.SQL_TRDESCRIPTION)]


# ------------------------------------------------------------------------------------------------ filter
def build_filter(f: dict, valutes: list[dict], operations: list[dict], users: list[dict], filials: list[dict]):
    """ReInitializeFilters Out_RepairImpl1.pas:854-935. Returns (Delphi filter string, AND-list of OR-atoms).

    f: user_index (scUser.ItemIndex, 0 = none), valute_checked (one per Valutes row + the 'Yox' item, which maps to the
    string 'CreditCurrencyID', ValutesThreadFinished RepairNewDataModule.pas:385-394), operation_checked (one per vid_op row),
    debit_filial / credit_filial (combo ItemIndex; -1 and 0 are ignored, :916).
    Quirks kept: clbValute Val=True loops Count-2 items so the 'Yox' item lands in the <> loop with the *field name* as value;
    the 2nd 'Yox' that VidOpThreadFinished adds to clbValute (:407-416, it writes into clbValute, not clbOperation) is never
    unchecked here. clbOperation also has Val=True: its last row is not in the <> loop; unchecking it adds (OperationType=<last id>)."""
    s, terms, first = [""], [], [True]

    def add(field, value, op, bracket=None, bol=" and "):
        dec = "" if first[0] else bol
        first[0] = False
        atom = (field, op, value)
        if bracket == "begin":
            s[0] += dec + "(" + "(" + field + op + str(value) + ")"
            terms.append([atom])
        elif bracket == "end":
            s[0] += dec + "(" + field + op + str(value) + ")" + ")"
            terms[-1].append(atom)
        else:
            s[0] += dec + "(" + field + op + str(value) + ")"
            terms.append([atom])

    def box(values, checked, f1, f2):
        n = len(values)
        if not n:
            return
        cnt = n - 2                                             # Val = True -> Cnt := Count-2
        for i in range(0, cnt + 1):
            if not checked[i]:
                add(f1, values[i], "<>", "begin")
                add(f2, values[i], "<>", "end", " or ")
        if not checked[n - 1]:
            add(f1, values[n - 1], "=")

    ui = int(f.get("user_index") or 0)
    if ui > 0 and ui <= len(users):                             # scUser.ItemIndex>0 -> Users dataset current row
        add("OPERATORID", users[ui - 1]["id"], "=")
    vchk = list(f.get("valute_checked") or [True] * (len(valutes) + 1))
    box([v["id"] for v in valutes] + ["CreditCurrencyID", "?"], vchk + [True], "DebitCurrencyID", "CreditCurrencyID")
    ochk = list(f.get("operation_checked") or [True] * len(operations))
    box([o["id"] for o in operations], ochk, "OperationType", "OperationType")
    for key, fld in (("debit_filial", "DebFil"), ("credit_filial", "CredFil")):
        ix = int(f.get(key) if f.get(key) is not None else -1)
        if ix not in (-1, 0) and ix <= len(filials):
            add(fld, filials[ix - 1]["id"], "=")
    return s[0], terms


def _val(r: dict, v):
    if isinstance(v, str) and not v.lstrip("-").isdigit():
        return r.get(v.lower())
    return int(v)


def apply_filter(rows: list[dict], terms) -> list[dict]:
    """TDataSet.Filtered := True with the string above (AND of bracketed OR groups)."""
    def ok(r):
        for group in terms:
            hit = False
            for field, op, value in group:
                a, b = r.get(field.lower()), _val(r, value)
                if a is None or b is None:
                    continue                                    # NULL compare is false in a TDataSet filter
                if (op == "=" and int(a) == int(b)) or (op == "<>" and int(a) != int(b)):
                    hit = True
                    break
            if not hit:
                return False
        return True
    return [r for r in rows if ok(r)]


# ------------------------------------------------------------------------------------------------ editor
def round_new(x: float, precision: int) -> float:
    """ChangeAmounts.RoundNew RepairNewEdit.pas:530-540 (>= 0.5 rounds up)."""
    scaled = delphi_frac(x) * precision
    temp = delphi_frac(scaled)
    scaled = float(math.trunc(scaled))
    if temp >= 0.5:
        scaled += 1
    if temp <= -0.5:
        scaled -= 1
    return math.trunc(x) + scaled / precision


def change_amounts(side: str, debit: float, credit: float, lamount: float, rate_d: float, rate_c: float) -> dict:
    """ChangeAmounts RepairNewEdit.pas:528-562 (Precision 100). Rates = DebetRateData/CreditRateData RATE .AsFloat
    (ceDebetAmountChange :569-591). Text '0' -> no recalculation."""
    if side == "debit" and debit != 0:
        lamount = round_new(debit * rate_d, 100)
        credit = round_new((debit * rate_d) / rate_c, 100)
    elif side == "credit" and credit != 0:
        lamount = round_new(credit * rate_c, 100)
        debit = round_new((credit * rate_c) / rate_d, 100)
    elif side == "lamount" and lamount != 0:
        credit = round_new(lamount / rate_c, 100)
        debit = round_new(lamount / rate_d, 100)
    return {"debit": debit, "credit": credit, "lamount": lamount}


def in_balance_state(debit_acc: dict | None, credit_acc: dict | None) -> int:
    """PrepareInBalance RepairNewEdit.pas:435-480: -> the KASSA_B filter MedioCrity=N (0 debit cash AZN, 1 credit cash AZN, -1 none).
    CheckInBalance (:396-413) is True when the state is ibUnknown (-1)."""
    if debit_acc and int(debit_acc.get("iscacheaccount") or 0) == 1 and int(debit_acc.get("val_acc") or 0) == 0:
        return 0
    if credit_acc and int(credit_acc.get("iscacheaccount") or 0) == 1 and int(credit_acc.get("val_acc") or 0) == 0:
        return 1
    return -1


def mode_of(ch_rate: bool, ch_profit: bool) -> int:
    """PrepareTransaction RepairNewEdit.pas:642-644 / OutRepdelete.pas:84-86."""
    if not ch_rate:
        return 2
    return 0 if ch_profit else 1


class TrIn(BaseModel):
    action: str = Field(pattern="^(insert|update)$")
    id: int | None = None
    date: datetime.date
    debit_currency_id: int
    credit_currency_id: int
    debit_id: int | None = None
    credit_id: int | None = None
    debit_rate: float = 0
    credit_rate: float = 0
    debit_amount: float = 0
    credit_amount: float = 0
    lamount: float = 0
    name: str = Field(default="", max_length=500)
    inbalancechar: int | None = None
    outbalancechar: int | None = None
    ch_rate: bool = False                    # RepairNewEdit.dfm chRate/chProfit: unchecked by default
    ch_profit: bool = False
    convert_confirmed: bool = False          # 'İmtina' pressed on the erConvert question


def check_transaction(conn, t: TrIn) -> dict:
    """CheckTransaction RepairNewDataModule.pas:194-227 (EHint messages, then the erConvert question).
    DebetAccData/CreditAccData current row = the chosen account inside the val_acc = chosen-currency list."""
    d = next((a for a in accounts(conn, "debit", t.debit_currency_id) if a["id"] == t.debit_id), None)
    c = next((a for a in accounts(conn, "credit", t.credit_currency_id) if a["id"] == t.credit_id), None)
    if not d or t.debit_currency_id != d.get("val_acc"):
        raise RepError("out_repair.err_debt")
    if not c or t.credit_currency_id != c.get("val_acc"):
        raise RepError("out_repair.err_cred")
    if (t.name or "") == "":
        raise RepError("out_repair.err_descr")
    if in_balance_state(d, c) != -1 and t.inbalancechar is None:
        raise RepError("out_repair.err_kassa")
    conv = (t.debit_currency_id != t.credit_currency_id
            and int(d.get("iscacheaccount") or 0) not in (1, 2)
            and int(c.get("iscacheaccount") or 0) not in (1, 2)
            and t.outbalancechar is not None and t.outbalancechar == 0)   # Null = 0 is False for a Variant
    return {"ask_convert": conv and not t.convert_confirmed}


def main_params(flag: int, mode: int, tid, date, debit_id, credit_id, d_amt, c_amt, l_amt, d_rate, c_rate, name, inb, outb) -> dict:
    """pcCorrect.CallIntegerFunction('Main', [...]) RepairNewDataModule.pas:283-298, ParameterMode = pmNamed."""
    return {"Flag": flag, "CorMode": mode, "TransactionID": tid, "TransactionDate": date_only(date),
            "DebitID": debit_id, "CreditID": credit_id, "DebitAmount": to_currency(d_amt), "CreditAmount": to_currency(c_amt),
            "LAmount": to_currency(l_amt), "DebitRate": to_currency(d_rate), "CreditRate": to_currency(c_rate),
            "TrName": name, "InBalanceChar": inb, "OutBalanceChar": outb}


def _call_main(conn, params: dict) -> int:
    try:
        r = conn.call_func(Q.PKG_CORRECT, "Main", [], int, named=params)
        conn.commit()      # unit has no commit (host session); the web session commits here - see PARITY_OUT_OPS.md §2
        return r
    except Exception:
        conn.rollback()
        raise


def save(conn, t: TrIn) -> dict:
    """btSaveClick RepairNewEdit.pas:699-760: PrepareTransaction -> CheckTrans -> SaveTran."""
    chk = check_transaction(conn, t)
    if chk["ask_convert"]:
        return {"ask_convert": True}
    p = main_params(FLAGS[t.action], mode_of(t.ch_rate, t.ch_profit), None if t.action == "insert" else t.id, t.date,
                    t.debit_id, t.credit_id, t.debit_amount, t.credit_amount, t.lamount, t.debit_rate, t.credit_rate,
                    t.name, t.inbalancechar, t.outbalancechar)
    return {"result": _call_main(conn, p)}


def delete(conn, r: dict, ch_rate: bool, ch_profit: bool) -> dict:
    """DeleteTrans OutRepdelete.pas:75-122: values from the current TransactionData row; AsInteger turns NULL chars into 0."""
    day = r["transactiondate"]
    day = datetime.date.fromisoformat(day[:10]) if isinstance(day, str) else day
    p = main_params(0, mode_of(ch_rate, ch_profit), int(r["id"]), day, int(r.get("debitid") or 0),
                    int(r.get("creditid") or 0), r.get("debitamount") or 0, r.get("creditamount") or 0, r.get("lamount") or 0,
                    r.get("debitrate") or 0, r.get("creditrate") or 0, r.get("name") or "",
                    int(r.get("inbalancechar") or 0), int(r.get("outbalancechar") or 0))
    return {"result": _call_main(conn, p)}


# ------------------------------------------------------------------------------------------------ router
class ListIn(BaseModel):
    dat: datetime.date
    dat2: datetime.date
    title: str | None = Field(default=None, max_length=40)
    filter: dict | None = None


class DeleteIn(BaseModel):
    dat: datetime.date
    dat2: datetime.date
    id: int
    ch_rate: bool = True                     # OutRepdelete.dfm: both checked
    ch_profit: bool = True


class AmountsIn(BaseModel):
    side: str = Field(pattern="^(debit|credit|lamount)$")
    date: datetime.date
    debit_currency_id: int
    credit_currency_id: int
    debit: float = 0
    credit: float = 0
    lamount: float = 0


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/out-repair")
    g = require_module(CLSID)

    def guard(fn, *a):
        try:
            return fn(*a)
        except RepError as e:
            err(400, e.key, **e.extra)

    @r.get("/init")
    def _init(ws=Depends(g)):
        c = ws.conn
        day = c.call_func("SBOP", "get_date", [], datetime.datetime)   # ActiveFormCreate .pas:582-584 Sb_GetSystemDate
        day = day.date() if isinstance(day, datetime.datetime) else day
        return {"date": day.isoformat(), **lookups(c, day)}

    @r.post("/list")
    def _list(b: ListIn, ws=Depends(g)):
        c = ws.conn
        rows = guard(list_transactions, c, b.dat, b.dat2, b.title)
        fs = ""
        if b.filter is not None:
            L = lookups(c, b.dat)
            fs, terms = build_filter(b.filter, L["valutes"], L["operations"], L["users"], L["filials"])
            rows = apply_filter(rows, terms)
        return {"rows": rows, "filter": fs}

    @r.get("/rates")
    def _rates(date: datetime.date, ws=Depends(g)):
        return rates(ws.conn, date)

    @r.get("/accounts")
    def _acc(side: str, val_acc: int, ws=Depends(g)):
        if side not in ("debit", "credit"):
            err(400, "error.generic")
        return accounts(ws.conn, side, val_acc)

    @r.get("/descriptions")
    def _descr(ws=Depends(g)):
        return descriptions(ws.conn)

    @r.post("/amounts")
    def _amounts(b: AmountsIn, ws=Depends(g)):
        rt = {x["id"]: float(x.get("rate") or 0) for x in rates(ws.conn, b.date)}
        try:
            return change_amounts(b.side, b.debit, b.credit, b.lamount, rt.get(b.debit_currency_id, 0.0), rt.get(b.credit_currency_id, 0.0))
        except ZeroDivisionError:
            err(400, "out_repair.err_rate")

    @r.post("/save")
    def _save(t: TrIn, ws=Depends(g)):
        if t.action == "update" and t.id is None:
            err(400, "error.not_found")
        return guard(save, ws.conn, t)

    @r.post("/delete")
    def _delete(b: DeleteIn, ws=Depends(g)):
        rw = next((x for x in guard(list_transactions, ws.conn, b.dat, b.dat2) if x["id"] == b.id), None)
        if not rw:
            err(404, "error.not_found")
        return delete(ws.conn, rw, b.ch_rate, b.ch_profit)

    return r

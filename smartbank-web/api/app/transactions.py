"""Transaction manager - port of Delphi Packages/TransactionManager (TTransactionManagerForm, CLSID below).

Main form TransactionManagerImpl.pas, data module TransactionDataModuleUnit.pas, editor TransactionPropertiesImpl.pas,
commission list CommissionImpl.pas, destination picker TransactionDestinationImpl.pas. SQL: tm_sql.py (verbatim).
"""
from __future__ import annotations
import datetime
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from .db import DBError
from .delphi import subst, round_new, to_currency, date_only
from . import tm_sql as Q
from .customers import row, step_commit, TS_DELAYED, TS_COMMITED, TS_REJECTED  # same loop/semantics as CO

CLSID = "{FF656972-BD77-41BB-848E-D339E05CE52E}"   # TransactionManager_TLB.pas:52 CLASS_TransactionManagerForm

# Grid columns with a FieldName (TransactionManagerImpl.dfm:385-545). The status-icon column has none.
TITLE_FIELDS = ("ID", "TRANSACTIONDATE", "DEBITACCNO", "DEBITCURRENCYSNAME", "CREDITACCNO", "CREDITCURRENCYSNAME",
                "DEBITAMOUNT", "CREDITAMOUNT", "LAMOUNT", "USR")
DEFAULT_TITLE = " ID "                          # ActiveFormCreate :645 OrderedTitle := ' ID '
TITLE_KEY = "transactionmanager.title"
TRDEL_MSG = {"delete": "transactions.err_trdelete", "edit": "transactions.err_tredit"}


# ------------------------------------------------------------------------------------------------ list
def title_value(ordered_title: str, status_first: bool) -> str:
    """ActionRefreshExecute :603-607 / GridTransactionsTitleClick :694-695."""
    return (" Status desc, " + ordered_title) if status_first else ordered_title


def status_first(conn) -> bool:
    # ActiveFormCreate :646-648: ODS_StatusT VALUE = 1 -> ChBoxStatusT checked
    r = conn.query(Q.SQL_STATUST)
    return bool(r) and str(r[0].get("VALUE") or "0").strip() == "1"


def set_status_first(conn, on: bool) -> None:
    """ChBoxStatusTClick :1057-1065: ODS_StatusT.Edit; Value := 1/0; Post (DOA generates the UPDATE by rowid)."""
    conn.execute("update Settings s set s.Value = :Value where upper(s.name)='TRANSACTION_STATUST'", {"Value": 1 if on else 0})
    conn.commit()


def list_transactions(conn, date: datetime.date, title: str) -> list[dict]:
    sql = subst(Q.SQL_TRANSACTIONS, "Title", title)
    return [row(r) for r in conn.query(sql, {"TransactionDate": date_only(date)})]


def build_filter(f: dict) -> str:
    """ActionFilterExecute :1093-1235 - the exact TDataSet.Filter string Delphi builds (kept for parity/tests).
    f: currencies [(id, checked)], op_types [(id, checked)], debit_branch, credit_branch, operator (None = box unchecked),
    delayed/committed/rejected booleans."""
    def gen(items, fmt, two):
        out = ""
        for i, (vid, checked) in enumerate(items):
            if not checked:
                part = fmt % ((vid, vid) if two else (vid,))
                out = part if out == "" else out + " AND " + part
        return out
    parts = [gen(f.get("currencies", []), "((DebitCurrencyID<>%d)AND(CreditCurrencyID<>%d))", True)]
    for key, fmt in (("debit_branch", "(DebitBranch=%d)"), ("credit_branch", "(CreditBranch=%d)"), ("operator", "(OperatorID=%d)")):
        parts.append(fmt % f[key] if f.get(key) is not None else "")
    parts.append(gen(f.get("op_types", []), "(OperationCode<>%d)", False))
    parts.append("((Status=%d)OR(Status=%d)OR(Status=%d))" % (1 if f.get("delayed", True) else 0,
                                                          2 if f.get("committed", True) else 0,
                                                          3 if f.get("rejected", True) else 0))
    return " AND ".join(p for p in parts if p)


def apply_filter(rows: list[dict], f: dict) -> list[dict]:
    """Evaluates the filter of build_filter() on the rows (TDataSet.Filtered := True)."""
    cur_off = {vid for vid, c in f.get("currencies", []) if not c}
    op_off = {vid for vid, c in f.get("op_types", []) if not c}
    st = {s for s, on in ((1, f.get("delayed", True)), (2, f.get("committed", True)), (3, f.get("rejected", True))) if on}
    out = []
    for r in rows:
        if r.get("debitcurrencyid") in cur_off or r.get("creditcurrencyid") in cur_off:
            continue
        if f.get("debit_branch") is not None and r.get("debitbranch") != f["debit_branch"]:
            continue
        if f.get("credit_branch") is not None and r.get("creditbranch") != f["credit_branch"]:
            continue
        if f.get("operator") is not None and r.get("operatorid") != f["operator"]:
            continue
        if r.get("operationcode") in op_off:
            continue
        if r.get("status") not in st:
            continue
        out.append(r)
    return out


# ------------------------------------------------------------------------------------------------ editor rules
def set_amounts(side: str, debit: float, credit: float, lamount: float, debit_cur: int | None, credit_cur: int | None,
                debit_rate: float, credit_rate: float) -> dict:
    """TransactionPropertiesImpl.pas:193-243 SetAmmounts. Rates are the currencies' TEMPRATE rates (not the editable
    rate fields). Returns the three edit values after the change of `side` ('debit' | 'credit' | 'lamount')."""
    if side == "debit":
        l = round_new(debit * debit_rate, 1000000)
        c = debit if debit_cur == credit_cur else round_new(l / credit_rate, 1000000)
        lamount, credit = round_new(l, 100), round_new(c, 100)
    elif side == "credit":
        l = round_new(credit * credit_rate, 1000000)
        d = credit if debit_cur == credit_cur else round_new(l / debit_rate, 1000000)
        lamount, debit = round_new(l, 100), round_new(d, 100)
    else:  # tsUnknown (the equivalent field)
        if debit_cur == 0:
            debit = lamount
        if credit_cur == 0:
            credit = lamount
    return {"debit": float(to_currency(debit)), "credit": float(to_currency(credit)), "lamount": float(to_currency(lamount))}


def cash_symbol_filter(debit_acc: dict | None, credit_acc: dict | None) -> int:
    """SetCashSymbol :245-258 -> kassa_b filter 'Mediocrity = N'."""
    if debit_acc and int(debit_acc.get("iscacheaccount") or 0) == 1 and int(debit_acc.get("val_acc") or 0) == 0:
        return 0
    if credit_acc and int(credit_acc.get("iscacheaccount") or 0) == 1 and int(credit_acc.get("val_acc") or 0) == 0:
        return 1
    return -1


class TrIn(BaseModel):
    mode: str = Field(pattern="^(insert|edit|commission)$")
    id: int | None = None                       # edit: the transaction being edited
    orig_date: datetime.date | None = None      # edit: date of the grid the row was opened from
    commission_id: int | None = None            # commission: commision_trans.id chosen in CommissionForm
    transaction_date: datetime.date
    operation_no: str | None = Field(default=None, max_length=50)
    operation_code: int | None = None
    debit_currency_id: int | None = None
    credit_currency_id: int | None = None
    debit_rate: float | None = None
    credit_rate: float | None = None
    debit_id: int | None = None
    credit_id: int | None = None
    debit_amount: float = 0
    credit_amount: float = 0
    lamount: float = 0
    inbalancechar: str | None = Field(default=None, max_length=10)
    outbalancechar: int | None = None
    name: str | None = Field(default=None, max_length=500)
    report_id: int | None = None
    countr_id: int | None = None


class TrError(Exception):
    def __init__(self, key, field=None):
        super().__init__(key)
        self.key, self.field = key, field


def validate_transaction(conn, t: TrIn) -> None:
    """Editor checks before ActionInsert can run:
    - ActionInsertUpdate :604-611: DebitID, CreditID set and LAmount <> 0 (button disabled otherwise)
    - DebitCurrencyIDEditExit / CreditCurrencyIDEditExit :556-581: CheckCurrency = Avalute.Locate('valute')
    - CashSymbolDBEditExit :627-646: kassa_b.Locate('Symbol', case-insensitive) else Modifed := False
    - ConvertationSymbolIDBEditExit :652-671: CONVERT_ASSIGNMENTS.Locate('ID') else Modifed := False
    - account lookups are filtered to val_acc = chosen currency (SetCurrencyFilter :142-151) - enforced here."""
    if t.debit_id is None or t.credit_id is None:
        raise TrError("transactions.err_accounts", "debit_id" if t.debit_id is None else "credit_id")
    if t.lamount == 0:
        raise TrError("transactions.err_lamount", "lamount")
    vals = {int(r["VALUTE"]) for r in conn.query(Q.SQL_CURRENCY_CHECK)}
    for f in ("debit_currency_id", "credit_currency_id"):
        if getattr(t, f) not in vals:
            raise TrError("transactions.err_currency", f)
    accs = {r["id"]: r for r in accounts(conn)}
    for side in ("debit", "credit"):
        a = accs.get(getattr(t, side + "_id"))
        if not a or a.get("val_acc") != getattr(t, side + "_currency_id"):
            raise TrError("transactions.err_account_currency", side + "_id")
    if t.inbalancechar not in (None, ""):
        if not any(str(r["SYMBOL"]).lower() == t.inbalancechar.lower() for r in conn.query(Q.SQL_CASH_SYMBOLS)):
            raise TrError("transactions.err_cash_symbol", "inbalancechar")
    if t.outbalancechar is not None:
        if not any(int(r["ID"]) == t.outbalancechar for r in conn.query(Q.SQL_CONVERT_SYMBOLS)):
            raise TrError("transactions.err_convert_symbol", "outbalancechar")


def add_params(t: TrIn, tr_id: int | None) -> dict:
    """TransactionsApplyRecord.BuildTransaction (:216-243) -> AddTransaction (:382-412) named parameters."""
    return {
        "TransactionDate": date_only(t.transaction_date), "DebitID": t.debit_id, "CreditID": t.credit_id,
        "DebitAmount": to_currency(t.debit_amount), "CreditAmount": to_currency(t.credit_amount),
        "LAmount": to_currency(t.lamount),
        "DebitRate": to_currency(t.debit_rate or 0), "CreditRate": to_currency(t.credit_rate or 0),   # AsCurrency of NULL = 0
        "TrName": t.name or None, "Flags": 0, "InBalanceChar": t.inbalancechar or None,
        "OutBalanceChar": int(t.outbalancechar or 0),                                                  # AsInteger
        "TransactionID": tr_id, "OperationType": t.operation_code, "TransactionNo": t.operation_no or None,
        "pReportID": t.report_id, "pCountrID": t.countr_id,
    }


def save_transaction(conn, t: TrIn, current: dict | None) -> int:
    """SaveTransaction (TransactionPropertiesImpl.pas:376-411) + TransactionsApplyRecord (TransactionDataModuleUnit.pas:245-266)."""
    validate_transaction(conn, t)
    if t.mode == "edit":
        if not current:
            raise TrError("error.not_found")
        conn.call_proc("SB_ACA", "CheckObjectAccess", ["Transaction", "update"], commit=False)   # ActionEditExecute :708
        if current.get("status") == TS_COMMITED:
            conn.call_proc("SB_ACA", "CheckAdvancedObjectAccess", ["TRANSACTIONCOMMITEDEDIT"], commit=False)
    else:
        conn.call_proc("SB_ACA", "CheckObjectAccess", ["Transaction", "insert"], commit=False)   # ActionInsertExecute :661
    cnt = conn.query(Q.SQL_VIDOP_TRDEL, {"v_ID": int(t.operation_code or 0)})[0]["CNT"]
    if int(cnt) == 1:
        raise TrError(TRDEL_MSG["edit"])
    if t.mode == "edit":
        # 'U': DeleteTransaction(ID); AddTransaction(Transaction) with the same ID
        conn.call_proc("SB_TRANSACTION", "transaction_delete", [], named={"TransactionID": t.id}, commit=False)
        tr_id = t.id
        conn.call_func("SB_TRANSACTION", "transaction_add", [], int, named=add_params(t, tr_id))
    else:
        # 'I': ID := GenerateID; AddTransaction; SetCommission (only acts in omCommission)
        tr_id = conn.call_func("SB_TRANSACTION", "GenerateID", [], int, named={})
        conn.call_func("SB_TRANSACTION", "transaction_add", [], int, named=add_params(t, tr_id))
        if t.mode == "commission":
            conn.call_proc("SB_COMPLEX_TRANSACTIONS", "SetTransactions", [], named={
                "CommisionID": t.commission_id, "DebitID": t.debit_id, "CreditID": t.credit_id,
                "DebitAmmount": to_currency(t.debit_amount), "CreditAmmount": to_currency(t.credit_amount),
                "TransDate": date_only(t.transaction_date), "v_ParentID": tr_id}, commit=False)
    conn.commit()   # SBCommit
    return tr_id


def reject(conn, rows_by_id: dict, ids: list[int], reason: str) -> dict:
    """ActionRejectExecute :1347-1387: rows with status 1/3 -> transaction_reject(TransactionID, RejectReason) + commit;
    errors only counted (cs_RejectInformation)."""
    ok, bad = 0, 0
    for i in ids:
        r = rows_by_id.get(i)
        if not r or r.get("status") not in (TS_DELAYED, TS_REJECTED):
            continue
        try:
            conn.call_func("SB_TRANSACTION", "transaction_reject", [], int,
                           named={"TransactionID": i, "RejectReason": reason or None})
            ok += 1
            conn.commit()
        except DBError:
            bad += 1
    return {"rejected": ok, "errors": bad, "total": ok + bad}


def delete_one(conn, row_: dict, multi: bool) -> dict:
    """ActionDeleteExecute :962-1024 (per row)."""
    conn.call_proc("SB_ACA", "CheckObjectAccess", ["Transaction", "delete"], commit=False)
    cnt = conn.query(Q.SQL_VIDOP_TRDEL, {"v_ID": int(row_.get("operationcode") or 0)})[0]["CNT"]
    if int(cnt) == 1:
        return {"blocked": True}
    try:
        conn.call_proc("SB_TRANSACTION", "transaction_delete", [], named={"TransactionID": row_["id"]}, commit=False)
    except DBError as e:
        if not multi:
            raise
        conn.commit()
        return {"failed": e.message}
    conn.commit()
    return {"deleted": True}


# ------------------------------------------------------------------------------------------------ lookups
def accounts(conn) -> list[dict]:
    """DebitAccData/CreditAccData with :src_pos from settings 'AccNoSearchPos' (FormCreate :526-531)."""
    sp = conn.query(Q.SQL_SRC_POS)
    src = int(sp[0]["VALUE"]) if sp and sp[0]["VALUE"] is not None else 1
    return [row(r) for r in conn.query(Q.SQL_ACCOUNTS, {"src_pos": src})]


def editor_lookups(conn) -> dict:
    return {
        "currencies": [row(r) for r in conn.query(Q.SQL_CURRENCIES)],
        "accounts": accounts(conn),
        "cash_symbols": [row(r) for r in conn.query(Q.SQL_CASH_SYMBOLS)],
        "convert_symbols": [row(r) for r in conn.query(Q.SQL_CONVERT_SYMBOLS)],
        "operation_types": [row(r) for r in conn.query(Q.SQL_OPERATION_TYPES)],
        "destinations": [row(r) for r in conn.query(Q.SQL_DESTINATIONS)],
        "trdest": [row(r) for r in conn.query(Q.SQL_TRDEST)],
        "report_descs": [row(r) for r in conn.query(Q.SQL_REPORT_DESCS)],
        "countries": [row(r) for r in conn.query(Q.SQL_COUNTRIES)],
        "system_date": conn.query(Q.SQL_SYSDAT)[0]["TEK_DAT"].date().isoformat(),
    }


# ------------------------------------------------------------------------------------------------ router
class FilterIn(BaseModel):
    date: datetime.date
    title: str = DEFAULT_TITLE
    currencies_off: list[int] = []
    op_types_off: list[int] = []
    debit_branch: int | None = None
    credit_branch: int | None = None
    operator: int | None = None
    delayed: bool = True
    committed: bool = True
    rejected: bool = True


class IdsIn(BaseModel):
    date: datetime.date
    ids: list[int]


class RejectIn(IdsIn):
    reason: str = Field(default="", max_length=500)


class DeleteIn(BaseModel):
    date: datetime.date
    id: int
    multi: bool = False


class AmountsIn(BaseModel):
    side: str = Field(pattern="^(debit|credit|lamount)$")
    debit: float = 0
    credit: float = 0
    lamount: float = 0
    debit_currency_id: int | None = None
    credit_currency_id: int | None = None


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/transactions")
    guard = require_module(CLSID)

    def resolve_title(ws, title: str) -> str:
        # GridTransactionsTitleClick :687: OrderedTitle := Column.FieldName ('' for the icon column -> the variable
        # keeps its previous value because ActionRefresh only sets TITLE when OrderedTitle <> '')
        t = title.strip().upper()
        if title.strip() == "":
            return ws.module_state.get(TITLE_KEY, title_value(DEFAULT_TITLE, status_first(ws.conn)))
        if t not in TITLE_FIELDS:
            err(400, "error.generic")
        v = title_value(" ID " if t == "ID" else t, status_first(ws.conn))
        ws.module_state[TITLE_KEY] = v
        return v

    @r.get("/init")
    def _init(ws=Depends(guard)):
        c = ws.conn
        return {"date": c.query(Q.SQL_SYSDAT)[0]["TEK_DAT"].date().isoformat(), "status_first": status_first(c),
                "operations": [row(x) for x in c.query(Q.SQL_OPERATIONS)], "valute": [row(x) for x in c.query(Q.SQL_VALUTE)],
                "branches": [row(x) for x in c.query(Q.SQL_BRANCHES)], "users": [row(x) for x in c.query(Q.SQL_USERS)]}

    @r.post("/list")
    def _list(f: FilterIn, ws=Depends(guard)):
        rows = list_transactions(ws.conn, f.date, resolve_title(ws, f.title))
        fd = {"currencies": [(i, False) for i in f.currencies_off], "op_types": [(i, False) for i in f.op_types_off],
              "debit_branch": f.debit_branch, "credit_branch": f.credit_branch, "operator": f.operator,
              "delayed": f.delayed, "committed": f.committed, "rejected": f.rejected}
        return {"rows": apply_filter(rows, fd), "total": len(rows), "filter": build_filter(fd)}

    @r.put("/status-order")
    def _so(body: dict, ws=Depends(guard)):
        set_status_first(ws.conn, bool(body.get("on")))
        return {"ok": True}

    def _rows(ws, date):
        return {x["id"]: x for x in list_transactions(ws.conn, date, title_value(DEFAULT_TITLE, False))}

    @r.post("/commit")
    def _commit(body: IdsIn, ws=Depends(guard)):
        return step_commit(ws.conn, _rows(ws, body.date), body.ids)

    @r.post("/reject")
    def _reject(body: RejectIn, ws=Depends(guard)):
        return reject(ws.conn, _rows(ws, body.date), body.ids, body.reason)

    @r.post("/delete")
    def _delete(body: DeleteIn, ws=Depends(guard)):
        rw = _rows(ws, body.date).get(body.id)
        if not rw:
            err(404, "error.not_found")
        return delete_one(ws.conn, rw, body.multi)

    @r.get("/editor-lookups")
    def _el(ws=Depends(guard)):
        return editor_lookups(ws.conn)

    @r.get("/accounts/{acc_id}/rest")
    def _rest(acc_id: int, ws=Depends(guard)):
        x = ws.conn.query(Q.SQL_ACC_REST, {"acc_id": acc_id})
        return row(x[0]) if x else {}

    @r.post("/amounts")
    def _amounts(b: AmountsIn, ws=Depends(guard)):
        cur = {c["id"]: c for c in (row(x) for x in ws.conn.query(Q.SQL_CURRENCIES))}
        dr = float((cur.get(b.debit_currency_id) or {}).get("rate") or 0)
        cr = float((cur.get(b.credit_currency_id) or {}).get("rate") or 0)
        try:
            return set_amounts(b.side, b.debit, b.credit, b.lamount, b.debit_currency_id, b.credit_currency_id, dr, cr)
        except ZeroDivisionError:
            err(400, "transactions.err_rate")

    @r.post("/cash-filter")
    def _cf(body: dict, ws=Depends(guard)):
        accs = {a["id"]: a for a in accounts(ws.conn)}
        return {"mediocrity": cash_symbol_filter(accs.get(body.get("debit_id")), accs.get(body.get("credit_id")))}

    @r.get("/commissions")
    def _com(ws=Depends(guard)):
        return [row(x) for x in ws.conn.query(Q.SQL_COMMISSION)]

    @r.post("/save")
    def _save(t: TrIn, ws=Depends(guard)):
        cur = _rows(ws, t.orig_date or t.transaction_date).get(t.id) if t.mode == "edit" else None
        try:
            return {"id": save_transaction(ws.conn, t, cur)}
        except TrError as e:
            err(400, e.key, field=e.field)

    return r

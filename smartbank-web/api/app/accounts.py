"""Accounts module - port of the Delphi ActiveX library Packages/Accounts (Accounts.dpr, CLSID below).

All SQL is verbatim from the Delphi source (unit:line cited). Filter values that Delphi formatted into the
SQL text with Format('%d') are passed as bind variables instead (same result, no SQL injection).
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from .db import DBError
from . import sb

CLSID = "{53E4AB09-4BA7-11D6-B271-00C0262B568B}"   # Packages/Accounts/Accounts_TLB.pas CLASS_AccountMainForm
FETCH_LIMIT = 50                                     # AccountDataModuleImpl.pas:156 FetchRecLimit = 50

# ------------------------------------------------------------------------------------------------ SQL
# Packages/Accounts/AccountMainFormImpl.pas:254-298  SAccountsQuery (verbatim, CRLF as #13#10)
SACCOUNTS_QUERY = (
    "SELECT\r\n"
    "  acc.ID AS AccID,\r\n"
    "  acc.ACC_NO AS AccNo,\r\n"
    "  acc.NAME AS AccName,\r\n"
    "  acc.OPEN_DAT AS OpenDate,\r\n"
    "  acc.CLOSE_DAT AS CloseDate,\r\n"
    "  acc.VAL_ACC AS CurrencyID,\r\n"
    "  acc.bal_cn1 AS SAcc,\r\n"
    "  acc.bal_cn2 AS SAcc2,\r\n"
    "  acc.bal_cn3 AS SAcc3,\r\n"
    "  acc.bal_cn4 AS SAcc4,\r\n"
    "  acc.KLI_ID as CustomerID,\r\n"
    "  acc.PAIR_ACC as PairAcc,\r\n"
    "  acc.Limit as AccLimit,\r\n"
    "  acc.SIM_OTCET as ReportSymbol,\r\n"
    "  acc.tipacc as AccFlags ,\r\n"
    "  acc.FILIAL as FilialID,\r\n"
    "  acc.Insider as Insider,\r\n"
    "  t.OSTAT AS Amount,\r\n"
    "  t.POK_OSTAT AS LAmount,\r\n"
    "  t.OBR_D AS DebitTurnover,\r\n"
    "  t.OBR_K AS CreditTurnover,\r\n"
    "  t.POK_OBR_D AS DebitLTurnover,\r\n"
    "  t.POK_OBR_K AS CreditLTurnover,\r\n"
    "  Currency.VAL_NAME AS CurrencySName,\r\n"
    "  dsb.OSTAT as DayStartAmount,\r\n"
    "  dsb.POK_OSTAT as DayStartLAmount,\r\n"
    "  dlb.OSTAT as DelayedAmount,\r\n"
    "  dlb.POK_OSTAT as DelayedLAmount,\r\n"
    "  acc.sid#,\r\n"
    "  acc.rowid\r\n"
    "FROM\r\n"
    "  ACCOUNT acc,\r\n"
    "  TENOSTAT t,\r\n"
    "  TEMPOST dsb,\r\n"
    "  LAZYREST dlb,\r\n"
    "  AVALUTE Currency\r\n"
    "WHERE\r\n"
    "  (t.ACC_ID = acc.ID)\r\n"
    "  AND (Currency.VALUTE = acc.VAL_ACC)\r\n"
    "  AND (dsb.ACC_ID = acc.ID)\r\n"
    "  AND (dlb.ACC_ID = acc.ID)"
)
# AccountDataModuleImpl.dfm:12 / :358 / :396 / :434
SQL_SACCS = {1: "select * from bal_spr1\norder by bal_cn", 2: "select * from bal_spr2\norder by bal_cn",
             3: "select * from bal_spr3\norder by bal_cn", 4: "select * from bal_spr4\norder by bal_cn"}
SQL_CUSTOMERS = "select * from CUSTOMERS\nwhere close_dat is null\norder by ID"      # AccountDataModuleImpl.dfm:50
SQL_CURRENCY = "select * from AVALUTE"                                              # AccountDataModuleImpl.dfm:89
SQL_REPORT_SYMBOL = "select * from REPORT_SYMBOL"                                  # AccountDataModuleImpl.dfm:121
SQL_FILIALS = "select * from FILIAL\norder by ID"                                  # AccountDataModuleImpl.dfm:472
SQL_ACC_FLAGS = "SELECT symbol, name, description\n FROM account_flags"           # AccountDataModuleImpl.dfm:505
SQL_PAIR_ACCOUNTS = "select\n  acc.ID as AccID,\n  acc.ACC_NO as AccNo\nfrom\n  ACCOUNT acc\norder by acc.ACC_NO"  # AccountPropertiesForm_Unit.dfm:563
# AccStatesImpl.dfm:201 (master AccountDataModule ACCID)
SQL_ACC_STATES = ("select\n  arc.DATDATE as ArchiveDate,\n  arc.ACC_ID as AccID,\n  abs(arc.OSTAT) as Amount,\n"
                  "  abs(arc.POK_OSTAT) as LAmount,\n  abs(arc.OBR_D) as DebitTurnover,\n  abs(arc.POK_OBR_D) as DebitLTurnover,\n"
                  "  abs(arc.OBR_K) as CreditTurnover,\n  abs(arc.POK_OBR_K) as CreditLTurnover\nfrom archost arc\n"
                  "where arc.acc_id = :AccID\norder by arc.datdate desc")
# AccTransactionsFormImpl.dfm:574
SQL_DEBIT_TRANSACTIONS = ("select\n  p.ID,\n  p.debt as DebitAccID,\n  p.dat as OperationDate,\n  p.ammount as DebitAmount,\n"
                          "  p.ammount_c as CreditAmount,\n  p.lammount as LAmount,\n  ac.acc_no as CreditAccNo,\n  p.NAME as Destination\n"
                          "from\n  provarch p,\n  account ac\nwhere\n  (p.dat between :StartDate and :EndDate)\n"
                          "  and (p.debt = :DebitAccID)\n  and (ac.id = p.kredit)\norder by p.dat")
# AccTransactionsFormImpl.dfm:477
SQL_CREDIT_TRANSACTIONS = ("select\n  p.ID,\n  p.kredit as CreditAccID,\n  p.dat as OperationDate,\n  p.ammount as DebitAmount,\n"
                           "  p.ammount_c as CreditAmount,\n  p.lammount as LAmount,\n  ad.acc_no as DebitAccNo,\n  p.NAME as Destination\n"
                           "from\n  provarch p,\n  account ad\nwhere\n  (p.kredit = :CreditAccID)\n"
                           "  and (p.dat between :StartDate and :EndDate)\n  and (ad.id = p.debt)\norder by p.dat")


# ------------------------------------------------------------------------------------------------ query builder
def build_accs_query(f: dict) -> tuple[str, dict]:
    """AccountMainFormImpl.pas:559-603 BuildAccsQuery. Returns (sql, binds)."""
    sql, b = SACCOUNTS_QUERY, {}
    if f.get("apply_filter"):
        if f.get("status") == "active":                                   # :564-566
            sql += " AND (acc.CLOSE_DAT IS NULL)\r\n"
        elif f.get("status") == "closed":                                 # :570-573
            sql += " AND (acc.CLOSE_DAT IS NOT NULL)\r\n"
        if f.get("bal_cn") is not None:                                   # :576-577 UseBalanceFilter
            sql += " AND (acc.BAL_CN1 = :bal_cn)\r\n"; b["bal_cn"] = int(f["bal_cn"])
        if f.get("customer_id") is not None:                              # :578-579 UseCustomerFilter
            sql += " AND (acc.KLI_ID = :customer_id)\r\n"; b["customer_id"] = int(f["customer_id"])
        if f.get("currency_id") is not None:                              # :580-581 UseCurrencyFilter
            sql += " AND (acc.VAL_ACC = :currency_id)\r\n"; b["currency_id"] = int(f["currency_id"])
        if f.get("filial_id") is not None:                                # :582-583 UseFilialFilter
            sql += " AND (acc.FILIAL = :filial_id)\r\n"; b["filial_id"] = int(f["filial_id"])
        if f.get("flag"):                                                 # :584-585 CBUseAccFlags: Symbol[1]
            sql += " AND (acc.tipacc like :flag_like  )\r\n"; b["flag_like"] = "%" + str(f["flag"])[0] + "%"
    order = f.get("order", "accno")                                       # :588-595
    if order == "accno":
        sql += "ORDER BY acc.ACC_NO\r\n"
    elif order == "name":
        sql += "ORDER BY acc.NAME\r\n"
    elif order == "currency":
        sql += "ORDER BY acc.VAL_ACC\r\n"
    return sql, b


def page_sql(sql: str) -> str:
    """Delphi fetches 50 rows then pauses (afPause, AccountDataModuleImpl.pas:152-160) and fetches more on scroll.
    Web equivalent: rownum window (works on Oracle 11g+)."""
    return f"select * from (select q.*, rownum rn__ from (\r\n{sql}) q where rownum <= :hi__) where rn__ > :lo__"


# ------------------------------------------------------------------------------------------------ validation
# AccountPropertiesForm_Unit.pas:287-292  AccNoEditKeyPress: allowed characters
_ACCNO_OK = re.compile(r"^[0-9a-zA-Z/\-:().,'+{} ]*$")
# AccountPropertiesForm_Unit.pas:141  CheckByNames(['AccNo', 'CurrencyID', 'SAcc', 'CustomerID', 'AccName'])
REQUIRED_ORDER = ["acc_no", "currency_id", "sacc", "customer_id", "acc_name"]


class AccountIn(BaseModel):
    acc_no: str | None = Field(default=None, max_length=255)
    acc_name: str | None = Field(default=None, max_length=255)
    customer_id: int | None = None
    currency_id: int | None = None
    open_date: datetime.datetime | datetime.date | None = None
    sacc: int | None = None
    sacc2: int | None = 0
    sacc3: int | None = 0
    sacc4: int | None = 0
    acc_limit: Decimal | None = Decimal(0)
    report_symbol: int | None = 0
    pair_acc: int | None = 0
    filial_id: int | None = None
    acc_flags: list[str] | str | None = None


class ValidationError(Exception):
    def __init__(self, key, field=None):
        super().__init__(key)
        self.key, self.field = key, field


def validate(a: AccountIn):
    """OkButtonClick.CheckFields (AccountPropertiesForm_Unit.pas:100-142): the FIRST empty field aborts with
    '"%s" sahəsinə qiymət daxil olunmayıb'. Empty string counts as null (TField.IsNull for an empty TDBEdit)."""
    for f in REQUIRED_ORDER:
        v = getattr(a, f)
        if v is None or (isinstance(v, str) and v == ""):
            raise ValidationError("accounts.err_required", f)
    if not _ACCNO_OK.match(a.acc_no or ""):
        raise ValidationError("accounts.err_accno_chars", "acc_no")


def build_acc_flags(selected) -> str:
    """AccFlagsChangingImpl.pas:38-53 BuildAccFlags: first char of each checked item, comma separated,
    in the order of the account_flags list."""
    if selected is None:
        return None
    if isinstance(selected, str):
        return selected
    return ",".join(s[0] for s in selected if s)


def _num(v):
    if v is None:
        return None
    if isinstance(v, Decimal):
        return float(v)
    return v


def _row(r: dict) -> dict:
    out = {}
    for k, v in r.items():
        if k in ("ROWID", "RN__", "SID#"):
            continue
        if isinstance(v, datetime.datetime):
            v = v.date().isoformat()
        out[k.lower()] = _num(v)
    return out


def _trunc(d) -> datetime.datetime:
    # AccountPropertiesForm_Unit.pas:151  FieldByName('OpenDate').AsDateTime := Trunc(OpenDateEdit.DateTime)
    if isinstance(d, datetime.datetime):
        return datetime.datetime(d.year, d.month, d.day)
    return datetime.datetime(d.year, d.month, d.day)


def account_params(a: AccountIn, prefix: str = "") -> dict:
    """AccountDataModuleImpl.pas:95-118 field -> TAccount, then SBAccount.pas:80-103 (add) / :124-147 (upd).
    Note: 'close_dat' is passed as NullDate (0.0) in Delphi; here NULL (the PL/SQL default) - see PARITY.md."""
    p = prefix
    flags = build_acc_flags(a.acc_flags)
    return {
        f"{p}customerid": a.customer_id, f"{p}op_id": 0, f"{p}accno": a.acc_no, f"{p}currencyid": a.currency_id,
        f"{p}NAME": a.acc_name, f"{p}open_dat": _trunc(a.open_date), f"{p}balcn": a.sacc,
        f"{p}LIMIT": float(a.acc_limit or 0), f"{p}close_dat": None, f"{p}filial": a.filial_id or 0,
        f"{p}sim_otcet": a.report_symbol or 0, f"{p}pair_acc": a.pair_acc or 0,
        f"{p}bal_cn2": a.sacc2 or 0, f"{p}bal_cn3": a.sacc3 or 0, f"{p}bal_cn4": a.sacc4 or 0,
        f"{p}typeacc": flags if flags is not None else "",
    }


# ------------------------------------------------------------------------------------------------ service
def list_accounts(conn, f: dict, offset: int = 0, limit: int = FETCH_LIMIT):
    sql, b = build_accs_query(f)
    rows = conn.query(page_sql(sql), {**b, "lo__": offset, "hi__": offset + limit + 1})
    more = len(rows) > limit
    return [_row(r) for r in rows[:limit]], more


def get_account(conn, acc_id: int) -> dict | None:
    sql = SACCOUNTS_QUERY + "\r\n  AND (acc.ID = :acc_id)"
    rows = conn.query(sql, {"acc_id": acc_id})
    return _row(rows[0]) if rows else None


def lookups(conn) -> dict:
    return {
        "saccs1": [_row(r) for r in conn.query(SQL_SACCS[1])],
        "saccs2": [_row(r) for r in conn.query(SQL_SACCS[2])],
        "saccs3": [_row(r) for r in conn.query(SQL_SACCS[3])],
        "saccs4": [_row(r) for r in conn.query(SQL_SACCS[4])],
        "customers": [{"id": r["ID"], "name": r["NAME"]} for r in conn.query(SQL_CUSTOMERS)],
        "currencies": [_row(r) for r in conn.query(SQL_CURRENCY)],
        "report_symbols": [_row(r) for r in conn.query(SQL_REPORT_SYMBOL)],
        "filials": [_row(r) for r in conn.query(SQL_FILIALS)],
        "acc_flags": [_row(r) for r in conn.query(SQL_ACC_FLAGS)],
    }


def pair_accounts(conn, q: str = "", limit: int = 50) -> list[dict]:
    """PairAccCB lookup (AccountPropertiesForm_Unit.dfm:563, all accounts ordered by ACC_NO). Filtered/limited
    server-side for the web combo box (Delphi loads the full list)."""
    rows = conn.query(page_sql(f"select * from (\r\n{SQL_PAIR_ACCOUNTS}) where AccNo like :q"),
                      {"q": (q or "") + "%", "lo__": 0, "hi__": limit})
    return [{"accid": r["ACCID"], "accno": r["ACCNO"]} for r in rows]


def flags_of(conn, acc_type: str, symbols: list[str]) -> list[str]:
    """FillCBL (AccountPropertiesForm_Unit.pas:208-226): checked if FlagExsist(AccFlags, Symbol[1]),
    SBAccount.pas:70-78 -> SBUTIL.FlagExsist(AccountType=>, FlagChar=>)."""
    return [s for s in symbols if s and conn.call_bool("SBUTIL", "FlagExsist", [],
                                                         named={"AccountType": acc_type or "", "FlagChar": s[0]})]


def default_filial(conn) -> int:
    # AccountPropertiesForm_Unit.pas:279-284 FormActivate (insert): SB_ACA.CallIntegerFunction('getuserfilialid', [])
    return conn.call_func("SB_ACA", "getuserfilialid", [], int)


def add_account(conn, a: AccountIn) -> int:
    validate(a)
    # SBAccount.pas:80-103 Sb_AddAccount -> SBOP.add_account (pmNamed); then Sb_Commit (AccountDataModuleImpl.pas:131)
    new_id = conn.call_func("SBOP", "add_account", [], int, named=account_params(a))
    conn.commit()
    return new_id


def update_account(conn, acc_id: int, a: AccountIn):
    validate(a)
    # SBAccount.pas:124-147 Sb_EditAccount -> SBOP.upd_account (pmNamed, 'v_' prefixed); then Sb_Commit
    conn.call_proc("SBOP", "upd_account", [], named={"v_id": acc_id, **account_params(a, "v_")}, commit=False)
    conn.commit()


def close_account(conn, acc_id: int):
    """AccountMainFormImpl.pas:813-829 CloseExecute + :976-980 CloseUpdate."""
    acc = get_account(conn, acc_id)
    if not acc:
        raise ValidationError("error.not_found")
    if acc["closedate"] is not None:                      # CloseUpdate: action enabled only if CloseDate IsNull
        raise ValidationError("accounts.err_already_closed")
    if (acc["amount"] or 0) != 0 or (acc["lamount"] or 0) != 0:   # :816
        raise ValidationError("accounts.err_close_balance")
    # SBAccount.pas:149-155 Sb_CloseAccount -> SBOP.close_account(AccID=>, DoClose=>1)
    conn.call_proc("SBOP", "close_account", [], named={"AccID": acc_id, "DoClose": 1}, commit=False)
    conn.commit()  # see PARITY.md (Delphi relies on session commit)


def _sum(rows, field):
    # AccTransactionsFormImpl.pas:130-154 FillAmounts (Currency arithmetic -> Decimal)
    tot = Decimal(0)
    for r in rows:
        v = r.get(field)
        tot += Decimal(str(v)) if v is not None else Decimal(0)
    return float(tot)


def transactions(conn, acc_id: int, acc_no: str, start: datetime.date, end: datetime.date) -> dict:
    s = datetime.datetime(start.year, start.month, start.day)
    e = datetime.datetime(end.year, end.month, end.day)
    deb = conn.query(SQL_DEBIT_TRANSACTIONS, {"StartDate": s, "EndDate": e, "DebitAccID": acc_id})
    cre = conn.query(SQL_CREDIT_TRANSACTIONS, {"CreditAccID": acc_id, "StartDate": s, "EndDate": e})
    deb = [{**_row(r), "debitaccno": acc_no} for r in deb]     # :98-104 DebitTransactionsDataCalcFields
    cre = [{**_row(r), "creditaccno": acc_no} for r in cre]    # :111-117 CreditTransactionsDataCalcFields
    return {
        "debit": deb, "credit": cre,
        "debit_total": _sum(deb, "debitamount"), "debit_ltotal": _sum(deb, "lamount"),
        "credit_total": _sum(cre, "creditamount"), "credit_ltotal": _sum(cre, "lamount"),
        # :213-214 if no debit rows but credit rows -> show credit tab
        "active_tab": "credit" if (not deb and cre) else "debit",
    }


def states(conn, acc_id: int) -> list[dict]:
    return [_row(r) for r in conn.query(SQL_ACC_STATES, {"AccID": acc_id})]


# ------------------------------------------------------------------------------------------------ router
def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/accounts")
    guard = require_module(CLSID)

    def v_err(e: ValidationError):
        err(400, e.key, field=e.field)

    @r.get("/lookups")
    def _lookups(ws=Depends(guard)):
        return {**lookups(ws.conn), "operation_date": ws.conn.call_func("SBOP", "get_date", [], datetime.datetime).date().isoformat()}

    @r.get("")
    def _list(status: str = "all", apply_filter: bool = False, bal_cn: int | None = None,
              customer_id: int | None = None, currency_id: int | None = None, filial_id: int | None = None,
              flag: str | None = None, order: str = "accno", offset: int = 0, limit: int = FETCH_LIMIT,
              ws=Depends(guard)):
        if status not in ("all", "active", "closed") or order not in ("accno", "name", "currency"):
            err(400, "error.generic")
        rows, more = list_accounts(ws.conn, dict(status=status, apply_filter=apply_filter, bal_cn=bal_cn,
                                                 customer_id=customer_id, currency_id=currency_id,
                                                 filial_id=filial_id, flag=flag, order=order),
                                   max(0, offset), max(1, min(limit, 500)))
        return {"rows": rows, "more": more, "offset": offset}

    @r.get("/pair-lookup")
    def _pair(q: str = "", ws=Depends(guard)):
        return pair_accounts(ws.conn, q)

    @r.get("/new-defaults")
    def _defaults(ws=Depends(guard)):
        # AccountPropertiesForm_Unit.pas:178-188 New: OpenDate := Sb_GetSystemDate; FormActivate filial
        return {"open_date": ws.conn.call_func("SBOP", "get_date", [], datetime.datetime).date().isoformat(),
                "filial_id": default_filial(ws.conn), "acc_limit": 0, "acc_flags": []}

    @r.get("/{acc_id}")
    def _get(acc_id: int, ws=Depends(guard)):
        a = get_account(ws.conn, acc_id)
        if not a:
            err(404, "error.not_found")
        syms = [f["symbol"] for f in lookups_flags(ws.conn)]
        a["acc_flags_checked"] = flags_of(ws.conn, a.get("accflags") or "", syms)
        return a

    @r.post("")
    def _add(body: AccountIn, ws=Depends(guard)):
        try:
            return {"accid": add_account(ws.conn, body)}
        except ValidationError as e:
            v_err(e)

    @r.put("/{acc_id}")
    def _upd(acc_id: int, body: AccountIn, ws=Depends(guard)):
        try:
            update_account(ws.conn, acc_id, body)
        except ValidationError as e:
            v_err(e)
        return {"ok": True}

    @r.post("/{acc_id}/close")
    def _close(acc_id: int, ws=Depends(guard)):
        try:
            close_account(ws.conn, acc_id)
        except ValidationError as e:
            v_err(e)
        return {"ok": True}

    @r.get("/{acc_id}/transactions")
    def _tr(acc_id: int, start: datetime.date | None = None, end: datetime.date | None = None, ws=Depends(guard)):
        a = get_account(ws.conn, acc_id)
        if not a:
            err(404, "error.not_found")
        # AccountMainFormImpl.pas:837-838 StartDate := Sb_GetSystemDate(); EndDate := StartDate
        od = ws.conn.call_func("SBOP", "get_date", [], datetime.datetime).date()
        start, end = start or od, end or (start or od)
        return {"start": start.isoformat(), "end": end.isoformat(), "accno": a["accno"],
                **transactions(ws.conn, acc_id, a["accno"], start, end)}

    @r.get("/{acc_id}/states")
    def _states(acc_id: int, ws=Depends(guard)):
        return states(ws.conn, acc_id)

    return r


def lookups_flags(conn):
    return [_row(r) for r in conn.query(SQL_ACC_FLAGS)]

"""Pure logic of the balance report packages (Balance, DBDBalance, TodayBalance, BalanceAnalys, AccBalanceCheck).

Every function cites the Delphi unit:line it reproduces. SQL text stays in bal_sql.py (verbatim DFM); this module only
does what the Delphi code does to those TStrings (SQL[i] := Format(SQL[i], [...]), concatenated filters) and the
client-side TDataSet.Filter / QuickReport totals. User text that Delphi concatenated into SQL is validated first.
"""
from __future__ import annotations

import datetime
import re
from decimal import Decimal


class BalError(Exception):
    def __init__(self, key: str, **kw):
        super().__init__(key)
        self.key = key
        self.kw = kw


# ----------------------------------------------------------------------------------------------- TStrings helpers
def sql_lines(sql: str) -> list[str]:
    return sql.split("\n")


def pformat(line: str, *args) -> str:
    """SysUtils.Format for the %s / %d placeholders used in these SQL lines."""
    out, it = [], iter(args)

    def rep(m):
        v = next(it)
        return str(int(v)) if m.group(0) == "%d" else str(v)
    return re.sub(r"%[sd]", rep, line)


def set_line(lines: list[str], i: int, text: str) -> None:
    """TStrings[i] := text (index must exist, like Delphi; otherwise EStringListError)."""
    if i >= len(lines):
        raise IndexError(f"list index out of bounds ({i})")
    lines[i] = text


def nz(v) -> bool:
    """TDataSet.Filter '(X<>0)': NULL compares false."""
    return v is not None and v != 0


def ds_filter(rows: list[dict], fields: tuple[str, ...]) -> list[dict]:
    """Filter := '(F1<>0)or(F2<>0)...'"""
    return [r for r in rows if any(nz(r.get(f.upper())) for f in fields)]


def total(rows: list[dict], field: str):
    """QRExpr SUM(DataSet.Field) — NULLs ignored."""
    vals = [Decimal(str(r[field])) for r in rows if r.get(field) is not None]
    return sum(vals) if vals else Decimal(0)


# ------------------------------------------------------------------------------------- input validation (security)
_INTLIST = re.compile(r"^\s*\d+(\s*,\s*\d+)*\s*$")
_NUMLIST = re.compile(r"^[0-9.,]+$")                # BalanceAnalysImpl.pas EditBalancesKeyPress: '0'..'9', ',', '.'
_ACCNO = re.compile(r"^[A-Za-z0-9]+$")


def int_list(text: str, err: str) -> str:
    if not _INTLIST.match(text or ""):
        raise BalError(err)
    return text


# ============================================================================================ Balance (TFrmBalance)
BALANCE_PROCS = ("sb_BalanceSelections", "sb_SumSelections")   # values of the :P_Procedure substitution variable


def cr_filial_str(checked_ids: list[int]) -> str:
    """BalanceImplUnit.pas:747-765 CrFilialStr: ' ' + ids joined by ','."""
    return " " + ",".join(str(int(i)) for i in checked_ids)


def split_astr(text: str) -> tuple[str, str]:
    """BalanceImplUnit.pas:526-538 sb_OpenDataSet: Copy(V,1,1999) / Copy(V,2000,Length(V))."""
    return text[:1999], text[1999:]


def balance_text(param1: str | None, param2: str | None) -> str:
    """BalanceImplUnit.pas:515 AStrParam := Param1 + Param2 + ' Order By Bal_CN'."""
    return (param1 or "") + (param2 or "") + " Order By Bal_CN"


_LAST = ("LastActive", "LastPassive")
_LAST_TURN = ("LastActive", "LastPassive", "DTurnOver", "KTurnOver")

# BalanceImplUnit.pas:604-719 sb_InitRpt + QuickReport layouts (UntBalanceRpt1/4/3/2, InterBalance, InterBalance2)
BALANCE_REPORTS = {
    0: {"name": "rpt_rests", "filter": _LAST, "cols": ["BAL_CN", "LASTACTIVE", "LASTPASSIVE"], "group": None},
    1: {"name": "rpt_full", "filter": None,
        "cols": ["BAL_CN", "FIRSTACTIVE", "FIRSTPASSIVE", "DTURNOVER", "KTURNOVER", "LASTACTIVE", "LASTPASSIVE"], "group": None},
    2: {"name": "rpt_turnover", "filter": _LAST_TURN, "cols": ["BAL_CN", "DTURNOVER", "KTURNOVER", "LASTACTIVE", "LASTPASSIVE"], "group": None},
    3: {"name": "rpt_rests_names", "filter": _LAST_TURN, "cols": ["BAL_CN", "LASTACTIVE", "LASTPASSIVE", "BALNAME"], "group": None},
    4: {"name": "rpt_inter", "filter": _LAST, "cols": ["BAL_CN", "LASTACTIVE", "LASTPASSIVE"], "group": "ACCGROUP"},
    5: {"name": "rpt_inter2", "filter": _LAST, "cols": ["BAL_CN", "DTURNOVER", "KTURNOVER", "LASTACTIVE", "LASTPASSIVE"], "group": "ACCGROUP"},
}
MONEY = {"FIRSTACTIVE", "FIRSTPASSIVE", "DTURNOVER", "KTURNOVER", "CTURNOVER", "LASTACTIVE", "LASTPASSIVE", "ACTIVE", "PASSIVE",
         "AMOUNT", "LAMOUNT", "DEBITTURNOVER", "DEBITLTURNOVER", "CREDITTURNOVER", "CREDITLTURNOVER", "BEGINACTIVE", "BEGINPASSIVE",
         "ENDACTIVE", "ENDPASSIVE", "CEM", "AMMOUNT", "AMMOUNT_C", "LAMMOUNT", "DEBITAMOUNT", "CREDITAMOUNT",
         "RESTBEGINPERIOD", "RESTLASTPERIOD", "MEM_AMOUNT", "LAMMOUNT_R",
         "LBEGINACTIVE", "LBEGINPASSIVE", "LDTURNOVER", "LCTURNOVER", "LENDACTIVE", "LENDPASSIVE"}

# ExportFormImpl.pas:12-19 FieldsInfo (order = Excel column order; ExportList gets UpperCase(name))
EXPORT_FIELDS = ["BAL_CN", "FIRSTACTIVE", "FIRSTPASSIVE", "DTURNOVER", "KTURNOVER", "LASTACTIVE", "LASTPASSIVE", "BALNAME"]


def acc_group_lookup(rows: list[dict], groups: list[dict]) -> None:
    """UnitDataMod.dfm ODSMainAccGroup: fkLookup BalanceGroups(BALANCENUMBER -> ACCGROUP) keyed by BAL_CN."""
    m = {g["BALANCENUMBER"]: g["ACCGROUP"] for g in groups}
    for r in rows:
        r["ACCGROUP"] = m.get(r.get("BAL_CN"))


def balance_report(rows: list[dict], rpt: int) -> dict:
    spec = BALANCE_REPORTS[rpt]
    data = ds_filter(rows, spec["filter"]) if spec["filter"] else list(rows)
    money_cols = [c for c in spec["cols"] if c in MONEY]
    out = {"name": spec["name"], "cols": spec["cols"], "rows": data,
           "totals": {c: total(data, c) for c in money_cols}, "groups": None}
    if spec["group"]:
        groups: list[dict] = []
        for r in data:                       # TQRGroup on ODSMain.AccGroup: a new band whenever the value changes
            if not groups or groups[-1]["key"] != r.get(spec["group"]):
                groups.append({"key": r.get(spec["group"]), "rows": []})
            groups[-1]["rows"].append(r)
        for g in groups:
            g["totals"] = {c: total(g["rows"], c) for c in money_cols}
        out["groups"] = groups
    return out


def report_dates(beg: datetime.date, end: datetime.date) -> dict:
    """sb_InitRpt: FDate/LDate 'dd/mm/yyyy'; LDate.Enabled := not (Begin = End)."""
    return {"fdate": beg.strftime("%d/%m/%Y"), "ldate": end.strftime("%d/%m/%Y"), "show_ldate": beg != end}


def f600_rows(rows: list[dict], nb, bf, diversity: int) -> list[dict]:
    """BalanceImplUnit.pas:924-999 BtnCreateFileClick (Filter LastActive/LastPassive<>0; Sum = value * Diversity)."""
    out = []
    for r in ds_filter(rows, _LAST):
        out.append({"NB": nb, "NF": bf, "NB1": r.get("BAL_CN"),
                    "SUM1": None if r.get("LASTACTIVE") is None else Decimal(str(r["LASTACTIVE"])) * diversity,
                    "SUM2": None if r.get("LASTPASSIVE") is None else Decimal(str(r["LASTPASSIVE"])) * diversity})
    return out


def write_dbf(rows: list[dict]) -> bytes:
    """dBase III file with the F600 fields (template F600ta.dbf is not in the repository: field widths assumed)."""
    import struct
    fields = [("NB", "N", 10, 0), ("NF", "N", 10, 0), ("NB1", "N", 10, 0), ("SUM1", "N", 20, 2), ("SUM2", "N", 20, 2)]
    today = datetime.date.today()
    hlen = 32 + 32 * len(fields) + 1
    rlen = 1 + sum(f[2] for f in fields)
    out = bytearray(struct.pack("<BBBBIHH20x", 3, today.year - 1900, today.month, today.day, len(rows), hlen, rlen))
    for name, typ, ln, dec in fields:
        out += struct.pack("<11sc4xBB14x", name.encode(), typ.encode(), ln, dec)
    out += b"\r"
    for r in rows:
        out += b" "
        for name, typ, ln, dec in fields:
            v = r.get(name)
            s = "" if v is None else (f"{Decimal(str(v)):.{dec}f}" if dec else str(int(Decimal(str(v)))))
            out += s.rjust(ln)[:ln].encode()
    out += b"\x1a"
    return bytes(out)


# =========================================================================== DBDBalance (TFrmDayByDayBalance)
def str_to_comma(s: str) -> str:
    """SBStoredProc.pas StrToComma: TrimAll (drop every ' ') then quote each comma-separated item with ''''."""
    s = s.replace(" ", "")
    return ",".join("'" + x + "'" for x in s.split(","))


def dbd_params(plan_index: int, currencies: list[int], all_currencies: list[int], symbols: list[str], all_symbols: list[str],
               mode: int, edit_debt: str) -> dict:
    """UnitDayByDayBalanceImpl.pas:561-655 RefreshButtonClick: ADDITIONALPARAMS, BalansH / SsudaH and chunks."""
    t = str(plan_index + 1)
    if t == "0":
        t = "1"
    if not symbols:                                   # ErrorInCheck(LookSimvol, rsErrorSinvol) :592
        raise BalError("balance.err_symbol")
    if not currencies:                                # :593
        raise BalError("balance.err_valute")
    sym_ok = set(all_symbols)
    if any(s not in sym_ok for s in symbols) or any(c not in all_currencies for c in currencies):
        raise BalError("error.generic")
    add = ""
    if len(set(currencies)) != len(all_currencies):   # :595-597
        add += " AND ac.VAL_ACC in (" + ",".join(str(int(c)) for c in currencies) + ")"
    if len(set(symbols)) != len(all_symbols):          # :599-611
        joined = "%') or ac.tipacc like  ('%".join(symbols)
        add += " and (ac.tipacc like ('%" + joined + "%'))" + "\r\n"
    edit = (edit_debt or "").strip()
    balans_h = ssuda_h = None
    if edit:
        if mode == 0:
            int_list(edit, "balance.err_balances")
            balans_h = "and (ac.bal_cn" + t + " IN (" + edit_debt + "))"            # :614
        else:
            items = edit_debt.replace(" ", "").split(",")
            if not all(_ACCNO.match(x) for x in items):
                raise BalError("balance.err_accounts")
            ssuda_h = "and (ac.acc_no IN (" + str_to_comma(edit_debt) + "))"        # :615
    return {"t": t, "additional": add, "balans_h": balans_h, "ssuda_h": ssuda_h,
            "ssuda": [ssuda_h[i * 1000:(i + 1) * 1000] if ssuda_h else "" for i in range(10)]}   # :618-627 Copy(…,1+1000k,1000)


def dbd_calls(p: dict, first: datetime.datetime, last: datetime.datetime, branch: int, with_out: bool) -> list[tuple]:
    """Positional argument lists exactly as :631-655 (out_NEDPackage only when out_balance is checked)."""
    t, add = p["t"], p["additional"]
    calls = []
    if p["balans_h"] is not None:
        if with_out:
            calls.append(("OUT_SB_BALANCE", [first, last, branch, None, None, add, p["balans_h"], None, t]))
        calls.append(("SB_BALANCE", [first, last, branch, None, None, add, p["balans_h"]] + [None] * 10 + [t]))
    elif p["ssuda_h"] is not None:
        if with_out:
            calls.append(("OUT_SB_BALANCE", [first, last, branch, None, None, add, p["ssuda_h"], None, t]))
        calls.append(("SB_BALANCE", [first, last, branch, None, None, add] + p["ssuda"] + [None, t]))
    else:
        if with_out:
            calls.append(("OUT_SB_BALANCE", [first, last, branch, None, None, None, None, None, t]))
        calls.append(("SB_BALANCE", [first, last, branch, None, None, add] + [None] * 11 + [t]))
    return calls


def dbd_row_id(r: dict) -> int:
    """BalanceDataCalcFields :524-537: ID := AccountNum + 1000000 * Day(ADate)."""
    d = r["ADATE"]
    try:
        acc = int(r.get("ACCOUNTNUM") or 0)
    except ValueError:
        acc = 0
    return acc + 1000000 * d.day


# =============================================================================== TodayBalance (TFrmTodayBalance)
def tb_amount_type(currency_id: int, amount_index: int) -> str:
    """SBExecuteClick: atExsistCurrency only when a currency is chosen and CBAmountType = 0."""
    return "exist" if currency_id != -1 and amount_index == 0 else "national"


def tb_balance_sql(sql: str, currency_id: int, branch_id: int, account_list: str, amount: str, target_is_today: bool) -> str:
    """TodayBalanceImpl.pas Balance_Selections."""
    L = sql_lines(sql)
    pre = "" if amount == "exist" else "Pok_"
    for i in (4, 11, 16, 17):
        set_line(L, i, pformat(L[i], pre))
    set_line(L, 20, pformat(L[20], "Tenostat" if target_is_today else "Archost"))
    set_line(L, 24, "" if branch_id == -1 else pformat(L[24], branch_id))
    set_line(L, 25, "" if currency_id == -1 else pformat(L[25], currency_id))
    if (account_list or "").strip() == "":
        set_line(L, 26, "")
    else:
        int_list(account_list, "balance.err_balances")
        set_line(L, 26, pformat(L[26], account_list))
    return "\n".join(L)


def tb_account_sql(sql: str, currency_id: int, branch_id: int, amount: str, target_is_today: bool) -> str:
    """TodayBalanceImpl.pas Account_Selections."""
    L = sql_lines(sql)
    pre = "" if amount == "exist" else "Pok_"
    for i in (4, 10, 17, 18):
        set_line(L, i, pformat(L[i], pre))
    set_line(L, 21, pformat(L[21], "Tenostat" if target_is_today else "Archost"))
    set_line(L, 26, "" if branch_id == -1 else pformat(L[26], branch_id))
    set_line(L, 27, "" if currency_id == -1 else pformat(L[27], currency_id))
    return "\n".join(L)


def tb_transactions_sql(sql: str, target_is_today: bool) -> str:
    """TodayBalanceImpl.pas Transaction_Selections: SQL[15] Provdoc (today) / Provarch."""
    L = sql_lines(sql)
    set_line(L, 15, pformat(L[15], "Provdoc" if target_is_today else "Provarch"))
    return "\n".join(L)


TB_REPORTS = {   # ViewReport + TodayBalance/UntBalanceRpt1/2/3
    0: {"name": "rpt_rests", "filter": ("Active", "Passive"), "cols": ["ACCOUNTNUMBER", "ACTIVE", "PASSIVE"]},
    1: {"name": "rpt_rests_names", "filter": ("Active", "Passive"), "cols": ["ACCOUNTNUMBER", "ACCOUNTNAME", "ACTIVE", "PASSIVE"]},
    2: {"name": "rpt_turnover", "filter": ("Active", "Passive", "DTurnOver", "CTurnOver"),
        "cols": ["ACCOUNTNUMBER", "DTURNOVER", "CTURNOVER", "ACTIVE", "PASSIVE"]},
}


def tb_report(rows: list[dict], idx: int) -> dict:
    spec = TB_REPORTS[idx]
    data = ds_filter(rows, spec["filter"])
    return {"name": spec["name"], "cols": spec["cols"], "rows": data,
            "totals": {c: total(data, c) for c in spec["cols"] if c in MONEY}, "groups": None}


def tb_account_filter(rows: list[dict], rest_only: bool) -> list[dict]:
    """CBRest: '(DTurnOver <> 0) or (CTurnOver <> 0) or (Active <> 0) or (Passive <> 0)'."""
    return ds_filter(rows, ("DTurnOver", "CTurnOver", "Active", "Passive")) if rest_only else rows


def tb_transactions_for(rows: list[dict], acc_id: int | None) -> list[dict]:
    """TB_DataModuleImpl.pas AccountDataAfterScroll: (DebitAccID = %d) or (CreditAccID = %d), -1 when NULL."""
    a = -1 if acc_id is None else acc_id
    return [r for r in rows if r.get("DEBITACCID") == a or r.get("CREDITACCID") == a]


# ============================================================================== BalanceAnalys (TFormBalanceAnalys)
def ba_branch_condition(checked: list[int], all_ids: list[int]) -> bool:
    """WillEnabled(any checked) and not IsEnabled(all checked)."""
    return bool(checked) and set(checked) != set(all_ids)


def ba_balance_sql(sql: str, checked: list[int], all_ids: list[int], currency_on: bool, currency: int | None,
                   balances: str, view_index: int, plan_index: int, with_group: bool = True) -> tuple[str, str]:
    """BalanceAnalysImpl.pas BuildBalance. with_group=False: Out_BalanceAnalys/BalanceAnalysImpl.pas:556
    'b.bal_cn in (...)' only."""
    cond = ""
    foreign = currency_on and view_index == 0
    plane = plan_index + 1
    if ba_branch_condition(checked, all_ids):
        cond = " AND Ac.filial in " + "(" + ",".join(str(int(i)) for i in checked) + ")"
    if currency_on:
        cond += " AND Ac.val_acc =" + str(int(currency))
    if (balances or "").strip() != "":
        b = balances.strip()
        if not _NUMLIST.match(b) or not re.match(r"^\d+(\.\d+)?(,\d+(\.\d+)?)*$", b):
            raise BalError("balance.err_balances")
        cond += " AND " + ("(b.bal_cn in (" + b + ") or b.accgroup in (" + b + "))" if with_group else "b.bal_cn in (" + b + ")")
    L = sql_lines(sql)
    pre = "" if foreign else "POK_"
    for i in (10, 17, 30, 31, 41, 48):
        set_line(L, i, pformat(L[i], pre))
    for i in (25, 35, 56):
        set_line(L, i, cond)
    for i in (22, 24, 32, 34, 53, 55):
        set_line(L, i, pformat(L[i], plane))
    return "\n".join(L), cond


def ba_account_sql(sql: str, checked: list[int], all_ids: list[int], currency_on: bool, currency: int | None,
                   view_index: int, plan_index: int) -> str:
    """BalanceAnalysImpl.pas BuildAccount."""
    cond = ""
    foreign = currency_on and view_index == 0
    plane = plan_index + 1
    if ba_branch_condition(checked, all_ids):
        cond = " RestForLastPeriod.BranchID in " + "(" + ",".join(str(int(i)) for i in checked) + ") AND"
    if currency_on:
        cond += " RestForLastPeriod.CurrencyID =" + str(int(currency)) + " AND "
    L = sql_lines(sql)
    pre = "" if foreign else "POK_"
    for i in (20, 26, 50, 56, 76, 77):
        set_line(L, i, pformat(L[i], pre))
    for i in (34, 37, 64, 67, 81, 84):
        set_line(L, i, pformat(L[i], plane))
    set_line(L, 91, cond)
    return "\n".join(L)


def ba_transaction_sql(sql: str, operator_id: int | None, line20: str | None = None) -> str:
    """BuildTransaction / debtBuildTransaction / CredBuildTransaction: SQL.CommaText := FTransaction (always the
    Transaction dataset text), SQL[16] operator filter; the double-click handlers then set SQL[20]."""
    L = sql_lines(sql)
    set_line(L, 16, "" if operator_id is None else "t.op_id = %d and " % int(operator_id))
    if line20 is not None:
        set_line(L, 20, line20)
    return "\n".join(L)


def ba_debt_line20(account_id, kredit_balance) -> str:
    """DBGriddebtbal_accDblClick: ' and t.Debt = ' + AccountID + ' and c.bal_cn1=' + KREDITBALANS."""
    return " and t.Debt = " + str(int(account_id)) + " and c.bal_cn1=" + str(int(kredit_balance))


def ba_cred_line20(account_id, debet_balance) -> str:
    """DBGrid1credbal_accDblClick: ' and t.Kredit = ' + AccountID + ' and d.bal_cn1=' + DEBETBALANS."""
    return " and t.Kredit = " + str(int(account_id)) + " and d.bal_cn1=" + str(int(debet_balance))


def ba_accounts_for(rows: list[dict], balance_no) -> list[dict]:
    """DataModuleBalance.pas BalanceAfterScroll: Account.Filter := 'BalanceNo = ' + BalanceAccount."""
    return [r for r in rows if r.get("BALANCENO") == balance_no]


def ba_transactions_for(rows: list[dict], account_id) -> list[dict]:
    """AccountAfterScroll: '(Debt = id) OR (Kredit = id)' with -1 for NULL."""
    a = -1 if account_id is None else account_id
    return [r for r in rows if r.get("DEBT") == a or r.get("KREDIT") == a]


# ====================================================================== mock-only emulation of server functions
def mtoutview_active(value, typeid, addtype):
    """Emulates SB_MTOUTVIEW.ACTIVE with the rules of SB_BALANCE.SaldoToActive (SQL_/DBDBalance/SB_BALANCE.sql:273-326)."""
    if value is None:
        return None
    v = Decimal(str(value))
    if v == 0:
        return Decimal(0)
    r = abs(v) if v < 0 else Decimal(0)
    if r != 0:
        if typeid != addtype and addtype == 2:
            r = Decimal(0)
    elif addtype == 1 and addtype != typeid:
        r = -abs(v)
    return r


def mtoutview_passiv(value, typeid, addtype):
    """SaldoToPassive rules (SB_BALANCE.sql:217-270)."""
    if value is None:
        return None
    v = Decimal(str(value))
    if v == 0:
        return Decimal(0)
    r = abs(v) if v > 0 else Decimal(0)
    if r != 0:
        if typeid != addtype and addtype == 1:
            r = Decimal(0)
    elif addtype == 2 and addtype != typeid:
        r = -abs(v)
    return r

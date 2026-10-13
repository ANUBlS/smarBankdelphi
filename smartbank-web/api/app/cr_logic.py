"""Pure re-implementations used by the credits module (Packages/SB_Credit). No DB access -> unit-tested directly.

Two kinds of code live here and are kept apart on purpose:
  * Delphi client logic (runs in the web app exactly as the Delphi form did): months_beetwean, inc_month,
    period_rate, filter strings, CheckFields order, coefficient ratios, DECA XML writer.
  * Oracle PL/SQL semantics (ORACLE_*): used ONLY by the DB_MODE=mock emulation of CM_SCHEDULE / CM_UTILS /
    CM_COMMON so the mock produces the numbers the real packages would. In oracle mode the real packages run.
All money arithmetic is Decimal.
"""
from __future__ import annotations
import calendar
import datetime
from decimal import Decimal, ROUND_HALF_UP, ROUND_HALF_EVEN, getcontext

getcontext().prec = 40          # Oracle NUMBER carries 38-40 significant digits

D = Decimal


def dec(v) -> Decimal:
    if v is None:
        return D(0)
    if isinstance(v, Decimal):
        return v
    return D(repr(v)) if isinstance(v, float) else D(v)


# ================================================================== Delphi runtime
def inc_month(d: datetime.date, n: int) -> datetime.date:
    """SysUtils.IncMonth: same day-of-month, clamped to the last day of the target month."""
    y, m = divmod(d.month - 1 + n, 12)
    y += d.year
    m += 1
    day = min(d.day, calendar.monthrange(y, m)[1])
    return d.replace(year=y, month=m, day=day)


def months_beetwean(d1: datetime.date, d2: datetime.date) -> int:
    """AnnutyPaymentFormImpl.pas:70-82 MonthsBeetwean (D1<D2). Starts at 1 even when D2 < IncMonth(D1,1)
    and then subtracts -> 0 in that case."""
    result = 1
    while inc_month(d1, result) <= d2:
        result += 1
    if inc_month(d1, result) > d2:
        result -= 1
    return result


def period_rate(item_index: int) -> int:
    """AnnutyPaymentFormImpl.pas:119-125 CmbBoxPeriodRate.ItemIndex -> months."""
    return {0: 1, 1: 3, 2: 6}.get(item_index, 12)


def delphi_currency(v) -> Decimal:
    """Assignment to a Delphi Currency (AmountEdit.Value / AsCurrency): 4 decimals, banker's rounding."""
    return dec(v).quantize(D("0.0001"), rounding=ROUND_HALF_EVEN)


# ================================================================== Oracle semantics (mock only)
def ora_round(v, places=0) -> Decimal:
    """ROUND(n, p) and assignment to NUMBER(p,s): half away from zero."""
    return dec(v).quantize(D(1).scaleb(-places), rounding=ROUND_HALF_UP)


def ora_last_day(d: datetime.date) -> datetime.date:
    return d.replace(day=calendar.monthrange(d.year, d.month)[1])


def ora_add_months(d: datetime.date, n: int) -> datetime.date:
    """ADD_MONTHS: if d is the last day of its month (or the target month is shorter) -> last day of target."""
    y, m = divmod(d.month - 1 + n, 12)
    y += d.year
    m += 1
    last = calendar.monthrange(y, m)[1]
    if d == ora_last_day(d):
        return datetime.date(y, m, last)
    return datetime.date(y, m, min(d.day, last))


def ora_months_between(d1: datetime.date, d2: datetime.date) -> Decimal:
    """MONTHS_BETWEEN(d1, d2): whole months if same day or both last days, else fraction on a 31-day month."""
    whole = (d1.year - d2.year) * 12 + (d1.month - d2.month)
    if d1.day == d2.day or (d1 == ora_last_day(d1) and d2 == ora_last_day(d2)):
        return D(whole)
    return D(whole) + (D(d1.day) - D(d2.day)) / D(31)


def ora_to_integer(v) -> int:
    """Assigning a NUMBER to a PL/SQL INTEGER rounds (half away from zero)."""
    return int(ora_round(v, 0))


def cm_common_getperiod(bdat, edat) -> int:
    """CM_COMMON.GetPeriod (SQL_credit/CREDITSMGR_ddl_p.sql:15544): RETURN MONTHS_BETWEEN(edat, bdat) as INTEGER."""
    return ora_to_integer(ora_months_between(edat, bdat))


def cm_utils_calcpercent(p_sum, p_rate, p_coefficient, p_delimmer=360) -> Decimal:
    """CM_UTILS.CalcPercent (CREDITSMGR_ddl_p.sql:26140). p_delimmer defaults to BankYearDays (reference value)."""
    return (dec(p_sum) * dec(p_rate) * dec(p_coefficient)) / (dec(p_delimmer) * 100)


def cm_utils_bankdaysbetween(first: datetime.date, last: datetime.date, bankyeardays=360) -> int:
    """CM_UTILS.BankDaysBetween (CREDITSMGR_ddl_p.sql:26087-26136)."""
    if first >= last:
        return 0
    result = (last - first).days
    if bankyeardays > 360:
        return result
    monthinterval = ora_to_integer(D(result) / 30)
    month = first
    for _ in range(0, monthinterval + 1):
        cur = ora_last_day(month)
        lmd = cur.day
        if first < cur <= last:
            if lmd == 31:
                result -= 1
            if lmd == 28:
                result += 2
            if lmd == 29:
                result += 1
        month = ora_add_months(month, 1)
    return result


def annutypayment_get(p_amount, p_rate, p_periods) -> Decimal:
    """CM_SCHEDULE.AnnutyPayment_Get (SQL_credit/cm_schedule.sql:82-100); RESULT NUMBER(18,2)."""
    a, r, n = dec(p_amount), dec(p_rate), int(p_periods)
    q = 1 + r / 12 / 100
    return ora_round(a * q ** n * r / 12 / 100 / (q ** n - 1), 2)


def equalpartspayment_get(p_amount, p_periods) -> Decimal:
    """cm_schedule.sql:102-114; RESULT NUMBER(18,2)."""
    return ora_round(dec(p_amount) / int(p_periods), 2)


def defdate(p_date, p_begindatechr: str, p_first: bool, rows_in_prev_month: bool, rows_in_cur_month: int):
    """cm_schedule.sql:362-450 DefDate. The two cursor results are passed in (c_p FOUND, c_cp count)."""
    day = p_date.day
    ldat = ora_last_day(p_date).day
    result = ora_add_months(p_date, 1)
    rday = result.day
    b = int(p_begindatechr)
    if b != rday:
        if rday < b:
            result = result                   # TO_DATE(rday-rmon-ryear) == result
        else:
            result = _safe(result.year, result.month, b)
    if p_first:
        if not rows_in_prev_month and not rows_in_cur_month == 2:
            if b != day:
                if ldat < b:
                    result = datetime.date(p_date.year, p_date.month, ldat)
                else:
                    result = _safe(p_date.year, p_date.month, b)
    return result


def _safe(y, m, d):
    # TO_DATE of an impossible day raises ORA-01839 in Oracle; propagate the same way
    try:
        return datetime.date(y, m, d)
    except ValueError:
        raise ValueError("ORA-01839: date not valid for month specified")


def is_sunday(d: datetime.date) -> bool:
    """CM_UTILS.check_endweek: TO_CHAR(d,'D')='1'. With NLS_TERRITORY=AZERBAIJAN/RUSSIA day 1 is Monday,
    with AMERICA it is Sunday -> NLS dependent; the mock assumes AMERICA (Sunday)."""
    return d.weekday() == 6


def get_annutydate(p_date, p_char, first, schedule_dates, seldates) -> datetime.date:
    """cm_schedule.sql:452-494 Get_AnnutyDate. schedule_dates: existing cm_payment_schedule dates of the credit;
    seldates: cm_seldates (non-working days)."""
    prev_lo, prev_hi = _month_bounds(ora_add_months(p_date, -1))
    cur_lo, cur_hi = _month_bounds(p_date)
    found_prev = any(prev_lo <= x <= prev_hi for x in schedule_dates)
    cnt_cur = sum(1 for x in schedule_dates if cur_lo <= x <= cur_hi)
    r = defdate(p_date, p_char, first, found_prev, cnt_cur)
    if is_sunday(r):
        r = r + datetime.timedelta(days=1)
    while r in seldates:
        r = r + datetime.timedelta(days=1)
    return r


def _month_bounds(d):
    return d.replace(day=1), ora_last_day(d)


def insert_annuty_schedule(amount, rate, first_pay, start, periods, period_rate_m,
                           creditline, seldates=frozenset()) -> list[dict]:
    """cm_schedule.sql:116-195 InsertAnnutySchedule. Returns the rows PaymentSchedule_AddEdit would insert.
    crdrest is NUMBER(18,2); intramt/principialamt are unconstrained NUMBER."""
    rows: list[dict] = []
    dates: list = []
    ap = annutypayment_get(amount, rate, periods)
    _ = cm_utils_bankdaysbetween(start, first_pay)          # computed but unused (30 is hard-coded) :139-140
    full = dec(amount)
    intr = cm_utils_calcpercent(full, rate, 30)
    princ = ap - intr
    rest = ora_round(full - princ, 2)
    d0 = get_annutydate(ora_add_months(first_pay, -1), f"{first_pay.day:02d}", False, dates, seldates)
    rows.append(_row(d0, princ, intr, rest)); dates.append(d0)
    full = dec(amount) - princ
    paydate = first_pay
    f = False
    for _i in range(2, int(periods) + 1):
        intr = cm_utils_calcpercent(full, rate, period_rate_m * 30)
        princ = ap - intr
        paydate = get_annutydate(paydate, f"{ora_add_months(first_pay, -1).day:02d}", f, dates, seldates)
        rest = ora_round(full - princ, 2)
        f = True
        rows.append(_row(paydate, princ, intr, rest)); dates.append(paydate)
        full = full - princ if full >= princ else D(0)
    if rows:
        last = max(r["PAYMENTDATE"] for r in rows)
        for r in rows:
            if r["PAYMENTDATE"] == last:
                r["REST"] = D(0)
    return rows


def insert_equal_schedule(amount, rate, first_pay, start, periods, period_rate_m) -> list[dict]:
    """cm_schedule.sql:197-255 InsertEqualSchedule."""
    rows = []
    eq = equalpartspayment_get(amount, periods)
    days = cm_utils_bankdaysbetween(start, first_pay)
    intr = cm_utils_calcpercent(amount, rate, days)
    princ = eq
    full = dec(amount)
    rows.append(_row(first_pay, princ, intr, full - princ))
    full = dec(amount) - eq
    paydate = first_pay
    for _i in range(2, int(periods) + 1):
        intr = cm_utils_calcpercent(full, rate, period_rate_m * 30)
        paydate = ora_add_months(paydate, 1)
        rows.append(_row(paydate, eq, intr, full - eq))
        full = full - eq if full >= eq else D(0)
    return rows


def _row(d, p, i, r):
    return {"PAYMENTDATE": d, "PRINCIPAL": p, "INTEREST": i, "REST": r}


# ================================================================== Delphi form logic
class CrError(Exception):
    def __init__(self, key: str, **kw):
        super().__init__(key)
        self.key, self.kw = key, kw


def annuty_validate(n_periods: int, dovr: int) -> None:
    """AnnutyPaymentFormImpl.pas:151-155 (the other checks at :136-150 are commented out in Delphi)."""
    if dovr > n_periods:
        raise CrError("credits.err_dovr")


def schedule_call(payment_type_annuity: bool, credit_id, amount, rate, first_pay, start, n_periods, per_rate, dovr):
    """ScheduleMainFormImpl.pas:334-356: procedure name + named params as DOA sends them."""
    name = "InsertAnnutySchedule" if payment_type_annuity else "InsertEqualSchedule"
    return name, {"p_CreditID": credit_id, "p_Amount": amount, "p_Rate": rate, "p_FirstPayDate": first_pay,
                  "p_StartDate": start, "p_Periods": n_periods - dovr, "p_PeriodRate": per_rate, "p_dovr": dovr}


def annuty_defaults(credit: dict) -> dict:
    """AnnutyPaymentFormImpl.pas:88-107 InitPaymentInfo."""
    met = int(credit.get("INTCALCMETHOD") or 0)
    concl = credit["DATEOFCONCLUSION"]
    return {"first_pay_date": inc_month(concl, 1),
            "amount": D(0) if met == 2 else delphi_currency(credit.get("CREDITLINEAMOUNT")),
            "amount_readonly": met != 2, "period_rate_index": 0,
            "n_periods": months_beetwean(concl, credit["DUEDATEFIRSTCONTRACT"]), "dovr": 0}


# CM_Filter/MainUnitImpl.pas:120-133 (order matters for the produced string)
CM_FILTER_FIELDS = ("CURRENCY", "BRANCHID", "USRGROUP", "RESERVEID", "AIM_ID", "USID", "PERSONALTYPE",
                    "CUSTOMERTYPE", "CREDITTYPE", "PLEDGEID", "BOOROWERID", "KR_STATUS")


def cm_filter_string(f: dict) -> str:
    """CM_Filter BuildFilterString :91-133. f: {FIELD: value} for ticked boxes; 'DATEOFCONCLUSION': date;
    'TODAY_PAYMENTS': True. Delphi passes Trunc(DateTime) (a day number) for the date - shown as ISO here."""
    def concat(s, prefix, value):
        t = f"({prefix}={value})" if prefix else f"({value})"
        return t if s == "" else s + " and " + t
    s = ""
    for k in CM_FILTER_FIELDS:
        if f.get(k) is not None:
            s = concat(s, k, int(f[k]))
    if f.get("DATEOFCONCLUSION"):
        s = concat(s, "dateofconclusion", f["DATEOFCONCLUSION"])
    if f.get("TODAY_PAYMENTS"):
        s = concat(s, "ID", "select creditid from cm_payments where paydate=sbop.get_date")
    return s


def cm_filter_apply(rows, f: dict, today_paid_ids=frozenset()):
    out = []
    for r in rows:
        ok = all(f.get(k) is None or (r.get(k) is not None and int(r[k]) == int(f[k])) for k in CM_FILTER_FIELDS)
        if ok and f.get("DATEOFCONCLUSION"):
            d = r.get("DATEOFCONCLUSION")
            ok = d is not None and (d.date() if isinstance(d, datetime.datetime) else d) == f["DATEOFCONCLUSION"]
        if ok and f.get("TODAY_PAYMENTS"):
            ok = r.get("ID") in today_paid_ids
        if ok:
            out.append(r)
    return out


# ConclusionMainUnitImpl.pas:415-487 CheckFieldByNames - exact order
CHECK_ORDER = ("@ACTIVITIES_TYPE", "CREDITACT", "ACTIVITIES", "CUSTOMERTYPE", "NUMBEROFCREDIT", "BRANCHID", "CURRENCY",
               "PERSONALTYPE", "CREDITTYPE", "USRGROUP", "@AIM_ID", "CREDITLINEAMOUNT", "ANNUALYINTERESTRATE",
               "ANNUALYOVERDUERATE", "ANNUALYPENALTYRATE", "RESERVEID", "DUERESERVEID", "AUTOPAYMENT", "AUTOEXPIRE",
               "INTCALCMETHOD", "BOOROWERID", "LOANACCID", "PRIMARYRESERVEACCID", "PRIMARYPURRESERVEACCID",
               "INTERESTACCID", "PLEDGEID_P", "#PINCODE", "BOORID", "ADDRESS", "SALARY")


def _empty(v) -> bool:
    return v is None or (isinstance(v, str) and v == "")


def check_fields(rec: dict, check_person) -> None:
    """Raises CrError for the first failing rule, in Delphi order.
    '@X': the lookup control's Text is '' (DBLookupComboboxEh29 / Eh32) -> dedicated message.
    '#PINCODE': only when NOT CM_CREDIT.checkPerson(P_ID => PERSONALTYPE): required and Length <> 7 -> error.
    check_person(personaltype) -> bool. Field.IsNull: '' for string fields is NULL in TOracleDataSet."""
    for k in CHECK_ORDER:
        if k == "@ACTIVITIES_TYPE":
            if _empty(rec.get("ACTIVITIES_TYPE")):
                raise CrError("credits.err_estate_type")
        elif k == "@AIM_ID":
            if _empty(rec.get("AIM_ID")):
                raise CrError("credits.err_aim")
        elif k == "#PINCODE":
            pt = rec.get("PERSONALTYPE")
            if not check_person(int(pt or 0)):          # FieldByName('PERSONALTYPE').AsInteger
                if _empty(rec.get("PINCODE")):
                    raise CrError("credits.err_empty", field="PINCODE")
                if len(str(rec.get("PINCODE"))) != 7:
                    raise CrError("credits.err_pin")
        elif _empty(rec.get(k)):
            raise CrError("credits.err_empty", field=k)


def pin_filter(text: str) -> str:
    """DBEditEh7KeyPress :1205-1216: only A-Z a-z 0-9 survive, and 'O'/'o' are dropped (confusable with 0)."""
    return "".join(ch for ch in text if ch.isascii() and ch.isalnum() and ch not in "Oo")


def boorid_filter(text: str) -> str:
    """DBEditEh3KeyPress :1218-1228: the 'O/o' test is nested inside 'not alnum' so it never fires and
    nothing is filtered (Delphi quirk, kept)."""
    return text


def credit_type_rules(credit_type) -> dict:
    """DBLookupComboboxEh4Change :1409-1432: types 6,8,9 show the pay-interest-day/pay-period panel (Panel77);
    other types hide and clear PAYINTDAY/PAYPERIOD; type 9 forces PAYPERIOD := 20."""
    a = 100 if credit_type is None else int(credit_type)
    r = {"show_payint_panel": a in (6, 8, 9), "clear": a not in (6, 8, 9)}
    if a == 9:
        r["PAYPERIOD"] = 20
    return r


def usrgroup_rules(usrgroup) -> dict:
    """DBLookupComboboxEh5Change :1434-1458: group 11 shows the AIF panel (Panel15). The schedule flag
    (UsrGroups.schedule=1) triggers CM_SCHEDULE.get_annutydate on DUEDATEFIRSTCONTRACT (done by the caller)."""
    a = 100 if usrgroup in (None, "") else int(usrgroup)
    return {"show_aif": a == 11}


CURRENCY_CLEARS = ("BOOROWERACCID", "LOANACCID", "DUELOANACCID", "INTERESTACCID", "DUEINTERESTACCID",
                   "PRIMARYRESERVEACCID", "OUTCOLLATERALACCID", "OUTGUARANTEEACCID", "OUTINTERESTACCID")
"""DataModuleConclusion.pas:472-487 CreditPropsCURRENCYChange (SECONDARYRESERVEACCID is commented out)."""


def cust_accs_line14(kli_id: int) -> str:
    """ConclusionMainUnitImpl.pas:1390-1402: CustAccs.SQL[14] is rewritten with the borrower id;
    customer 541 also sees accounts of customer 502 (hard-coded in Delphi)."""
    k = int(kli_id)
    return f"and ac.kli_id in ({k},502)" if k == 541 else f" and ac.kli_id={k}"


def replace_sql_line(sql: str, index: int, text: str) -> str:
    """TStrings SQL[index] := text (0-based line index of the DFM SQL.Strings)."""
    lines = sql.split("\n")
    while len(lines) <= index:
        lines.append("")
    lines[index] = text
    return "\n".join(lines)


# ================================================================== CM_coefficient
def coefficient_additional_params(branch_checked, branch_all, cat_checked, cat_all) -> str:
    """coefficientImpl.pas:232-261 (FilterStr/CheckStr/chpayStr/RestsStr are always '' in the shipped code)."""
    s = ""
    if len(branch_checked) != len(branch_all):
        s += " AND p.branchid in(" + ",".join(str(int(x)) for x in branch_checked) + ")" + "\r\n"
    if len(cat_checked) != len(cat_all):
        s += " AND p.CUSTOMERTYPE in(" + ",".join(str(int(x)) for x in cat_checked) + ")" + "\r\n"
    return s


def _div(a, b):
    a, b = dec(a), dec(b)
    return None if b == 0 else a / b      # Excel shows #DIV/0! - returned as null


def coefficient_interest(rows: list[dict]) -> dict:
    """SpeedButton1Click :297-431 (% borcu üzrə ödəniş əmsalı). Row values come from SQL (GF, F computed in SQL);
    the total row is Excel formulas: SUM(C..G), H=G/C, I=E/D."""
    out = [{"name": r["NAME"], "portfel": dec(r["PORTFEL"]), "odenilmelifaiz": dec(r["ODENILMELIFAIZ"]),
            "odenilmish": dec(r["ODENILMISH"]), "gecfaizmeb": dec(r["GECFAIZMEB"]), "gec": dec(r["GEC"]),
            "gf": None if r.get("GF") is None else dec(r["GF"]), "f": None if r.get("F") is None else dec(r["F"])}
           for r in rows]
    t = {k: sum((x[k] for x in out), D(0)) for k in ("portfel", "odenilmelifaiz", "odenilmish", "gecfaizmeb", "gec")}
    t["gf"] = _div(t["gec"], t["portfel"])
    t["f"] = _div(t["odenilmish"], t["odenilmelifaiz"])
    return {"rows": out, "total": t}


def coefficient_main(rows: list[dict]) -> dict:
    """SpeedButton3Click :547-724 (əsas borc üzrə ödəniş əmsalı). Per row: I=G/C, J=H/C, K=(E-F)/D.
    Column 12 (unlabelled) repeats GECES; totals: SUM(C..H), I=G/C, J=H/C, K=(E-F)/D."""
    out = []
    for r in rows:
        x = {"name": r["NAME"], "portfel": dec(r["PORTFEL"]), "odenilmeli": dec(r["ODENILMELI"]),
             "odenilmish": dec(r["ODENILMISH"]), "artiq": dec(r["ARTIQ"]), "geces": dec(r["GECES"]), "gec": dec(r["GEC"])}
        _ratios(x)
        out.append(x)
    t = {k: sum((x[k] for x in out), D(0)) for k in ("portfel", "odenilmeli", "odenilmish", "artiq", "geces", "gec")}
    _ratios(t)
    return {"rows": out, "total": t}


def _ratios(x):
    x["r_geces"] = _div(x["geces"], x["portfel"])
    x["r_gec"] = _div(x["gec"], x["portfel"])
    x["r_pay"] = _div(x["odenilmish"] - x["artiq"], x["odenilmeli"])


# ================================================================== CM_DECA (credit registry XML)
def deca_reporting_date(d: datetime.date) -> str:
    """DecaMainForm.pas:172-185 dd/mm/yyyy with zero padding."""
    return f"{d.day:02d}/{d.month:02d}/{d.year}"


def deca_file_begin(bank_id: str, bank_name: str, d: datetime.date) -> str:
    """WriteFileBegin :165-201 (note the trailing blank after the XML declaration)."""
    return ('<?xml version="1.0" encoding="UTF-8" ?> ' + "<CreditInfo>" + "<Header>" + "<BankID>" + bank_id +
            "</BankID>" + "<BankName>" + bank_name + "</BankName>" + "<ReportingDate>" + deca_reporting_date(d) +
            "</ReportingDate>" + "</Header>" + "<Credits>")


DECA_FILE_END = "</Credits></CreditInfo>"


class DecaWriter:
    """WriteData :202-280 with the UnusableGrops set (reset per credit by the caller, :377/:633)."""

    def __init__(self, tag_settings: list[dict]):
        self.tags = {str(t["FIELDNAME"]).upper(): t for t in tag_settings}
        self.unusable: set[int] = set()

    def write(self, field: str, value: str) -> str:
        t = self.tags.get(field.upper())
        if t is None:
            raise CrError("credits.err_deca_tag", field=field)        # EFieldNotFoud
        tf, tl = t.get("TAGFIRST") or "", t.get("TAGLAST") or ""
        tp, ts = t.get("TAGPREFIX") or "", t.get("TAGSUFFIX") or ""
        fg, pg = int(t.get("FIELDGROUP") or 0), int(t.get("PARENTGROUP") or 0)
        out = ""
        if fg in self.unusable or pg in self.unusable:
            if ts != "" and pg not in self.unusable:
                out += ts
            return out
        if value == "":
            if tp != "" and pg not in self.unusable and pg != -1:
                out += tp
            if ts != "" and pg not in self.unusable and pg != -1:
                out += ts
            if pg == -2:
                out += tf + tl
            if fg != 0 and pg != 0 and pg != -2:
                self.unusable.add(fg & 0xFF)       # set of Byte
            return out
        return tp + tf + value + tl + ts


DECA_BLANKED = ("NAME5", "REGAGSY1", "ZAMIN")   # SpeedButton5Click :623-625


def deca_closed_export(bank_id, bank_name, rep_date, tag_settings, rows) -> tuple[str, int]:
    """SpeedButton5Click :552-652: header, one <Credit> per DecaData_clos row with every TagSettings field
    (in NUM order), footer. Returns (xml, exported count)."""
    parts = [deca_file_begin(bank_id, bank_name, rep_date)]
    w = DecaWriter(tag_settings)
    for r in rows:
        parts.append("<Credit>")
        for t in tag_settings:
            fn = str(t["FIELDNAME"])
            fv = "" if fn in DECA_BLANKED else _as_string(r.get(fn.upper()))
            parts.append(w.write(fn, fv))
        parts.append("</Credit>")
        w.unusable = set()
    parts.append(DECA_FILE_END)
    return "".join(parts), len(rows)


def _as_string(v) -> str:
    """TField.AsString."""
    if v is None:
        return ""
    if isinstance(v, datetime.datetime):
        return v.strftime("%d.%m.%Y") if (v.hour, v.minute, v.second) == (0, 0, 0) else v.strftime("%d.%m.%Y %H:%M:%S")
    if isinstance(v, Decimal):
        s = format(v.normalize(), "f")
        return s
    if isinstance(v, float):
        return str(int(v)) if v == int(v) else repr(v)
    return str(v)


_MON = ("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")


def deca_strdate(mode: int | None, b: datetime.date, e: datetime.date) -> str:
    """SpeedButton5Click :578-593 (closed credits). mode 0: by DATEOFCONCLUSION; 1: fully repaid with a payment
    in the period; otherwise ' '. Delphi FormatDateTime('dd-MMM-yyyy') uses the client's short month names;
    English upper-case abbreviations are used here (NLS_DATE_LANGUAGE=AMERICAN must match - unverified)."""
    fmt = lambda d: f"{d.day:02d}-{_MON[d.month - 1]}-{d.year}"  # noqa: E731
    if mode == 0:
        return "and DATEOFCONCLUSION between  '" + fmt(b) + "' and '" + fmt(e) + "'"
    if mode == 1:
        return ("and rest +interestrest+duerest+dueinterestrest=0 and closedate is null "
                " and b.id in( select creditid from cm_payments where paydate between '" + fmt(b) +
                "' and '" + fmt(e) + "'" + " group by paydate,creditid)")
    return " "

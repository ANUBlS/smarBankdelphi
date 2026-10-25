"""Customers module - port of the Delphi ActiveX library Packages/Customer_Operations (TCO_Main, CLSID below).

Main form customers_operation_impl.pas (+ .dfm), data module CO_datamod_impl.pas/.dfm, customer card
UnitCustProps.pas, PEP dialog Pep_changeUnit.pas, new-account form FormAcc_Unit.pas, account states
P_AccState_Unit, account documents P_AccTransaction_Unit, customer API sboapi50/SBCustomer.pas.

All SQL is verbatim from the Delphi source (unit:line / dfm:line cited). Where Delphi glued user input into the
SQL text, the same predicate is used with a bind variable (same rows, no SQL injection). DOA substitution
variables (':title' in ORDER BY) are filled only from a whitelist of the grid's column names.
"""
from __future__ import annotations
import datetime
from decimal import Decimal

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from .db import DBError, Out
from .delphi import subst, page_sql, like_prefix, az_i_to_backtick, date_only

CLSID = "{D773B8FF-0651-421E-8451-897F8A20F8BE}"   # customer_operations.ridl:181 / customer_operations_TLB CLASS_CO_Main
PAGE = 100

# ------------------------------------------------------------------------------------------------ SQL
# CO_datamod_impl.dfm:215-284  Customers (OnApplyRecord=CustomersApplyRecord, AfterScroll=CustomersAfterScroll)
# ':title' is a DOA substitution variable (Variables.Data type 1, default 'ID').
SQL_CUSTOMERS = (
    "\n"
    "SELECT customers.rowID, id, op_id, open_dat, close_dat, nerezident,\n"
    "       prinad_kod, name, short_name, group_klie, vid_sob,\n"
    "       org_sob, sfera_dey, otrasl, nalog_kod, kod_okpro,\n"
    "\n"
    "       inn, dat_nal, dat_ustav, bik, cust_type, incorporation_number,\n"
    "\n"
    "       tph_contact_type,tph_communication_type, tph_number, address_type,\n"
    "       address, city, country_code, director_id, email, url,\n"
    "       incorporation_state,incorporation_cntr,tph_extension,\n"
    "\n"
    "       tph_zip, tph_country_prefix, tph_state,risk_categ,riskdescid,samelydate,quality_id,\n"
    "       translate(name, 'IiİiIı', '``````') as name1,\n"
    "  /*sb_aca.getuserbyid(op_id)*/'' usnam\n"
    "  FROM customers  \n"
    "where  nvl(cust_type,0)=0 and close_dat is null\n"
    "order by :title"
)
CUSTOMER_SORT = ("ID", "INN", "NAME", "OPEN_DAT", "USNAM")          # customers_operation_impl.dfm:124-180 grid columns
# CO_datamod_impl.dfm:448  Account (variables :CID integer, :p_AccNO string)
SQL_ACCOUNT = "select * from jurAccs \nwhere custID =:CID\n or AccNO like (:p_AccNO)\n"
# customers_operation_impl.pas:1077-1078 SearchNameKeyUp (SearchName.Text was concatenated; here a bind)
SQL_ACCOUNT_BY_NAME = "Select * from juraccs Where upper(accname) like upper(:p_name) and rownum=1"
# CO_datamod_impl.dfm:1792  Transactions (':title' substitution, default 'id')
SQL_TRANSACTIONS = ("Select * from transactionsp \nwhere debitID = :p_AccID or creditID = :p_AccID\n"
                    "order by :title")
TRANSACTION_SORT = ("ID", "TRANSACTIONDATE", "DEBITACCNO", "DEBITCURRENCYSNAME", "CREDITACCNO",
                    "CREDITCURRENCYSNAME", "DEBITAMOUNT", "CREDITAMOUNT", "LAMOUNT", "NAME")  # dfm:514-640
SQL_VIDOP_TRDEL = "select count(0) Cnt from vid_OP\nwhere ID = :v_ID and TrDelete=1 "   # CO_datamod_impl.dfm:3361
SQL_SYSDAT = "select tek_dat from sysdat"                                              # CO_datamod_impl.dfm:827
# P_AccState_Unit.dfm:405  AccStateData (note: '--desc' is commented out -> ascending)
SQL_ACC_STATES = ("select\n  arc.DATDATE as ArchiveDate,\n  arc.ACC_ID as AccID,\n  abs(arc.OSTAT) as Amount,\n"
                  "  abs(arc.POK_OSTAT) as LAmount,\n  abs(arc.OBR_D) as DebitTurnover,\n"
                  "  abs(arc.POK_OBR_D) as DebitLTurnover,\n  abs(arc.OBR_K) as CreditTurnover,\n"
                  "  abs(arc.POK_OBR_K) as CreditLTurnover\nfrom archost arc\nwhere arc.acc_id = :AccID\n"
                  "order by arc.datdate --desc")
# P_AccTransaction_Unit.dfm:464 / :550
SQL_ACC_DEBIT = ("select\n  p.ID,\n  p.debt as DebitAccID,\n  p.dat as OperationDate,\n  p.ammount as DebitAmount,\n"
                 "  p.ammount_c as CreditAmount,\n  p.lammount as LAmount,\n  ac.acc_no as CreditAccNo,\n"
                 "  p.NAME as Destination\nfrom\n  SMART.provarch p,\n  SMART.account ac\nwhere\n"
                 "  (p.dat between :StartDate and :EndDate)\n  and (p.debt = :AccountID)\n  and (ac.id = p.kredit)\n"
                 "order by p.dat\n ")
SQL_ACC_CREDIT = ("select\n  p.ID,\n  p.kredit as CreditAccID,\n  p.dat as OperationDate,\n  p.ammount as DebitAmount,\n"
                  "  p.ammount_c as CreditAmount,\n  p.lammount as LAmount,\n  ad.acc_no as DebitAccNo,\n"
                  "  p.NAME as Destination\nfrom\n  SMART.provarch p,\n  SMART.account ad\nwhere\n"
                  "  (p.kredit = :AccountID)\n  and (p.dat between :StartDate and :EndDate)\n  and (ad.id = p.debt)\n"
                  "order by p.dat")

# customer card lookups (UnitCustProps.dfm -> CO_datamod_impl.dfm)
LOOKUPS = {
    "relations": "select * from PRINAD",                                          # dfm:2791 RelationData
    "groups": "select * from QRP_KLIE",                                           # dfm:2823 ClientGroupData
    "estate_types": "SELECT * FROM VID_SOB where cust_type in(-1,0)",             # dfm:2848 EstateTypeData
    "org_types": "SELECT * FROM ORG_PRAV",                                        # dfm:2874 OrganizationTypeData
    "action_areas": "SELECT * FROM SFERADEY",                                     # dfm:2894 ActionAreaData
    "tax_areas": "SELECT * FROM NALOG",                                           # dfm:2919 TaxAreaData
    "branches": "SELECT * FROM OTRASLI",                                          # dfm:2944 BranchData
    "contact_types": "SELECT a.id, a.symbol, a.description\n  FROM mmx_contact_type a\norder by a.id",          # dfm:3807
    "communication_types": "SELECT a.id, a.symbol, a.description\n  FROM mmx_communication_type a\norder by a.id",  # dfm:3786
    "phone_prefixes": "\nselect c.phone_code from  countries c where c.phone_code is not null\norder by ID ",   # dfm:3849
    "countries": "\nselect c.rowid,c.* from  countries c where lower(c.cntr_name) <> lower('yox')\norder by c.cntr_name ",  # dfm:3870
    "incorp_countries": "\nselect c.* from  countries c where lower(c.cntr_name) <> lower('yox')\norder by ID \n \n",      # dfm:3923
    "risk_categories": "select id,name from CUST_RISK_CATEG\norder by ID",        # dfm:4202
    "qualities": "select A.rowid,A.* from cust_quality A  order by A.id",         # dfm:4477
}
SQL_CITIES = "select * from cities\nwhere COUNTRY_ID = nvl(:CID,0)\norder by ID"   # dfm:3899 DSCityByConctType
SQL_RISK_DESC = ("SELECT a.id, a.risk_id, a.name, a.date_period\n  FROM cust_risk_desc a\n"
                 "where a.risk_id=:v_riskid")                                      # dfm:4222 cust_risk_desc

# UnitCustProps.pas:662-765 FormCreate: customer_operations.get_Messaj('customers', <column>) <> 0 -> '*' visible
REQUIRED_FLAG_COLUMNS = ["open_dat", "name", "risk_categ", "samelydate", "inn", "dat_ustav", "incorporation_cntr",
                         "address_type", "city", "address", "tph_contact_type", "tph_communication_type",
                         "tph_number", "incorporation_number", "dat_nal", "country_code"]

# UnitCustProps.pas:412-555 ToolButton4Click - checks in this exact order; first failure aborts.
#   (field, get_Messaj column or None=always, kind)
#   kind 'text'  : TDBEdit.Text = ''            (empty or NULL; whitespace is NOT empty - no Trim in Delphi)
#   kind 'null'  : KeyValue = null / Value = null
#   kind 'eqstr' : KeyValue = ''  -- Delphi compares a Null variant with '' which is False, so for an unselected
#                  lookup this check never fires. Preserved as-is (see docs/PARITY_CUSTOMERS.md #V-07).
VALIDATION = [
    ("name", "name", "text"),                                    # :418-425  Label27
    ("short_name", None, "text"),                                # :427-431
    ("incorporation_number", "incorporation_number", "text"),    # :439-446  Label21
    ("risk_categ", "risk_categ", "null"),                        # :447-454  Label29
    ("inn", "inn", "text"),                                      # :455-462  Label26
    ("dat_nal", "dat_nal", "null"),                              # :463-470  Label23
    ("dat_ustav", "dat_ustav", "null"),                          # :471-478  Label22
    ("samelydate", "samelydate", "null"),                        # :479-487  Label31
    ("incorporation_cntr", "incorporation_cntr", "null"),        # :488-495  Label24
    ("address_type", "address_type", "eqstr"),                   # :496-503  Label61
    ("country_code", "country_code", "null"),                    # :504-511  Label65
    ("city", "city", "null"),                                    # :512-519  Label66
    ("address", "address", "text"),                              # :520-527  Label25
    ("tph_contact_type", "tph_contact_type", "eqstr"),           # :528-537  Label67
    ("tph_communication_type", "tph_communication_type", "eqstr"),  # :538-547  Label68
    ("tph_number", "tph_number", "text"),                        # :548-555  Label69
]


class CustomerIn(BaseModel):
    open_dat: datetime.date | None = None
    name: str | None = Field(default=None, max_length=400)
    short_name: str | None = Field(default=None, max_length=400)
    nerezident: int | None = 0
    prinad_kod: int | None = None
    group_klie: int | None = None
    vid_sob: int | None = None
    org_sob: int | None = None
    sfera_dey: int | None = None
    otrasl: int | None = None
    nalog_kod: int | None = None
    inn: str | None = Field(default=None, max_length=60)
    bik: str | None = Field(default=None, max_length=60)
    kod_okpro: str | None = Field(default=None, max_length=60)
    dat_nal: datetime.date | None = None
    dat_ustav: datetime.date | None = None
    incorporation_number: str | None = Field(default=None, max_length=100)
    tph_contact_type: str | None = None
    tph_communication_type: str | None = None
    tph_number: str | None = Field(default=None, max_length=100)
    address_type: str | None = None
    address: str | None = Field(default=None, max_length=400)
    city: int | None = None
    country_code: int | None = None
    email: str | None = Field(default=None, max_length=200)
    url: str | None = Field(default=None, max_length=200)
    incorporation_state: str | None = Field(default=None, max_length=200)
    incorporation_cntr: int | None = None
    tph_extension: str | None = Field(default=None, max_length=60)
    tph_zip: str | None = Field(default=None, max_length=60)
    tph_country_prefix: str | None = None
    tph_state: str | None = Field(default=None, max_length=200)
    risk_categ: int | None = None
    riskdescid: int | None = None
    samelydate: datetime.date | None = None
    quality_id: int | None = None
    blacklist_confirmed: bool = False      # answer 'Bəli' to the red blacklist warning (ShowRedMessage)


class ValidationError(Exception):
    def __init__(self, key, field=None, **extra):
        super().__init__(key)
        self.key, self.field, self.extra = key, field, extra


def validate(c: CustomerIn, required: dict) -> None:
    for field, flag, kind in VALIDATION:
        if flag is not None and not required.get(flag):
            continue
        v = getattr(c, field)
        if kind == "text":
            bad = v is None or v == ""
        elif kind == "null":
            bad = v is None
        else:  # eqstr
            bad = v == ""
        if bad:
            raise ValidationError("customers.err_" + field, field)


def _d(v):
    return date_only(v) if v is not None else None


def customer_record(c: CustomerIn) -> dict:
    """CO_datamod_impl.pas:822-867 CustomersApplyRecord: dataset fields -> TCustomer.
    AsInteger of a NULL field is 0 in Delphi; AsString of NULL is '' (DOA binds '' as NULL)."""
    i = lambda v: int(v) if v is not None else 0        # noqa: E731
    s = lambda v: v if v not in (None, "") else None    # noqa: E731
    return dict(
        Name=s(c.name), ShortName=s(c.short_name), OpenDate=_d(c.open_dat),
        RelationID=i(c.prinad_kod), GroupID=i(c.group_klie), EstateType=i(c.vid_sob), OrganizationType=i(c.org_sob),
        ActionArea=i(c.sfera_dey), BranchID=i(c.otrasl), TaxAreaID=i(c.nalog_kod),
        IsResident=1 if i(c.nerezident) == 1 else 0,   # :840 IsResident := NEREZIDENT=1; passed as Integer(IsResident)
        TaxIDString=s(c.inn), BankIDString=s(c.bik), OKPRO=s(c.kod_okpro),
        TaxDepartmentRegDate=_d(c.dat_nal), CapitalRegDate=_d(c.dat_ustav),
        INCORPORATION_NUMBER=s(c.incorporation_number), TPH_CONTACT_TYPE=s(c.tph_contact_type),
        TPH_COMMUNICATION_TYPE=s(c.tph_communication_type), TPH_NUMBER=s(c.tph_number),
        ADDRESS_TYPE=s(c.address_type), ADDRESS=s(c.address),
        CITY=str(c.city) if c.city is not None else None, COUNTRY_CODE=str(c.country_code) if c.country_code is not None else None,
        EMAIL=s(c.email), URL=s(c.url), INCORPORATION_STATE=s(c.incorporation_state),
        INCORPORATION_CNTR=str(c.incorporation_cntr) if c.incorporation_cntr is not None else None,
        TPH_EXTENSION=s(c.tph_extension), TPH_ZIP=s(c.tph_zip), TPH_COUNTRY_PREFIX=s(c.tph_country_prefix),
        TPH_STATE=s(c.tph_state), RISK_CATEG=i(c.risk_categ), riskdescid=i(c.riskdescid),
        samelydate=_d(c.samelydate), quality_id=c.quality_id,
    )


def add_customer_params(r: dict) -> dict:
    """sboapi50/SBCustomer.pas:177-222 Sb_AddCustomer -> SBOP.add_customer (pmNamed, sboapiDataModuleImpl.dfm:24).
    CLOSE_DAT: Delphi passes NullDate (TDateTime 0.0); NULL is passed here - see PARITY_CUSTOMERS.md #U-02."""
    return {
        "OP_ID": 0, "OPEN_DAT": r["OpenDate"], "NAME": r["Name"], "CLOSE_DAT": None,
        "NEREZIDENT": r["IsResident"], "PRINAD_KOD": r["RelationID"], "SHORT_NAME": r["ShortName"],
        "GROUP_KLIE": r["GroupID"], "VID_SOB": r["EstateType"], "ORG_SOB": r["OrganizationType"],
        "SFERA_DEY": r["ActionArea"], "OTRASL": r["BranchID"], "NALOG_KOD": r["TaxAreaID"],
        "INN": r["TaxIDString"], "BIK": r["BankIDString"], "KOD_OKPRO": r["OKPRO"],
        "DAT_NAL": r["TaxDepartmentRegDate"], "DAT_USTAV": r["CapitalRegDate"],
        "v_INCORP_NUM": r["INCORPORATION_NUMBER"], "v_TPH_CONTACT_TYPE": r["TPH_CONTACT_TYPE"],
        "v_TPH_COMMUNICATION_TYPE": r["TPH_COMMUNICATION_TYPE"], "v_TPH_NUMBER": r["TPH_NUMBER"],
        "v_ADDRESS_TYPE": r["ADDRESS_TYPE"], "v_ADDRESS": r["ADDRESS"], "v_CITY": r["CITY"],
        "v_COUNTRY_CODE": r["COUNTRY_CODE"], "v_EMAIL": r["EMAIL"], "v_URL": r["URL"],
        "v_INCORPORATION_STATE": r["INCORPORATION_STATE"], "v_INCORPORATION_CNTR": r["INCORPORATION_CNTR"],
        "v_TPH_EXTENSION": r["TPH_EXTENSION"], "v_TPH_ZIP": r["TPH_ZIP"],
        "v_TPH_COUNTRY_PREFIX": r["TPH_COUNTRY_PREFIX"], "v_TPH_STATE": r["TPH_STATE"],
        "v_risk_categ": r["RISK_CATEG"], "v_riskdescid": r["riskdescid"],
        "v_samelydate": r["samelydate"], "v_quality_id": r["quality_id"],
    }


def upd_customer_params(cust_id: int, r: dict) -> dict:
    """sboapi50/SBCustomer.pas:233-277 Sb_EditCustomer -> SBOP.upd_customer (pmNamed, every name 'v_' prefixed)."""
    a = add_customer_params(r)
    out = {"v_ID": cust_id}
    for k, v in a.items():
        out[k if k.startswith("v_") else "v_" + k] = v
    return out


# ------------------------------------------------------------------------------------------------ helpers
def _num(v):
    return float(v) if isinstance(v, Decimal) else v


def row(r: dict) -> dict:
    out = {}
    for k, v in r.items():
        if k in ("ROWID", "RN__"):
            continue
        if isinstance(v, datetime.datetime):
            v = v.date().isoformat()
        out[k.lower()] = _num(v)
    return out


def customers_sql(sort: str = "ID") -> str:
    return subst(SQL_CUSTOMERS, "title", sort if sort in CUSTOMER_SORT else "ID")


def transactions_sql(sort: str = "ID") -> str:
    return subst(SQL_TRANSACTIONS, "title", sort if sort in TRANSACTION_SORT else "id")


def sysdate(conn) -> datetime.datetime:
    # SBCore.pas:53-57 Sb_GetSystemDate -> SBOP.get_date
    return conn.call_func("SBOP", "get_date", [], datetime.datetime)


# ------------------------------------------------------------------------------------------------ service: lists
def list_customers(conn, sort="ID", offset=0, limit=PAGE):
    rows = conn.query(page_sql(customers_sql(sort)), {"lo__": offset, "hi__": offset + limit + 1})
    return [row(r) for r in rows[:limit]], len(rows) > limit


def get_customer(conn, cust_id: int) -> dict | None:
    rows = conn.query(f"select * from (\n{customers_sql()}) where ID = :cust_id", {"cust_id": cust_id})
    return row(rows[0]) if rows else None


# customers_operation_impl.pas:312-343 ActionSpeedSearchExecute: field = Copy(EditX.Name, 5, ...)
SPEED_FIELDS = {"id": "ID", "inn": "INN", "name": "NAME1"}


def locate(conn, field: str, text: str, after: int, sort="ID") -> int | None:
    """DOA SearchRecord(field, text, [srIgnoreCase, srPartialMatch, srFromCurrent, srForward]) on the Customers grid.
    Returns the 1-based row number of the next match after row `after` (0 = from beginning) or None.
    For the name box Delphi first maps i/I/İ/ı to '`' (EditNameKeyPress) and searches NAME1."""
    col = SPEED_FIELDS[field]
    if field == "name":
        text = az_i_to_backtick(text)
    sql = (f"select rn__ from (select q.*, rownum rn__ from (\n{customers_sql(sort)}) q)\n"
           f"where rn__ > :after and upper(to_char({col})) like upper(:v) escape '\\' and rownum = 1")
    r = conn.query(sql, {"after": after, "v": like_prefix(text)})
    return int(r[0]["RN__"]) if r else None


def locate_open_date(conn, d: datetime.date, sort="ID") -> int | None:
    """customers_operation_impl.pas:1736-1742 DateEditKeyUp: Customers.Locate('OPEN_DAT', DateEdit.Text, [])
    - exact value, always from the first record, no message when not found."""
    sql = (f"select rn__ from (select q.*, rownum rn__ from (\n{customers_sql(sort)}) q)\n"
           "where OPEN_DAT = :d and rownum = 1")
    r = conn.query(sql, {"d": date_only(d)})
    return int(r[0]["RN__"]) if r else None


def customer_accounts(conn, cust_id: int | None, acc_like: str | None = None) -> list[dict]:
    # CO_datamod_impl.pas:805-820 CustomersAfterScroll: SetVariable('CID', ID); SetVariable('p_AccNO', null)
    return [row(r) for r in conn.query(SQL_ACCOUNT, {"CID": cust_id, "p_AccNO": acc_like})]


def search_account_no(conn, text: str) -> dict:
    """customers_operation_impl.pas:988-1015 SearchAccKeyPress (Enter): CID := null, p_AccNO := text+'%';
    then Customers.Locate('ID', ACCKLID of the first row) and Account.Locate('ACCNO', ...)."""
    accs = customer_accounts(conn, None, (text or "") + "%")
    if not accs:
        return {"accounts": [], "customer_id": None, "acc_no": None}
    first = accs[0]
    return {"accounts": accs, "customer_id": first.get("accklid"), "acc_no": first.get("accno")}


def search_account_name(conn, text: str) -> dict:
    """customers_operation_impl.pas:1069-1117 SearchNameKeyUp (Enter): first account whose name contains the text,
    then Customers.Locate('id', accklid)."""
    r = conn.query(SQL_ACCOUNT_BY_NAME, {"p_name": "%" + (text or "") + "%"})
    if not r:
        return {"customer_id": None, "acc_no": None, "acc_id": None}
    a = row(r[0])
    return {"customer_id": a.get("accklid"), "acc_no": a.get("accno"), "acc_id": a.get("id")}


def account_transactions(conn, acc_id: int, sort="ID") -> list[dict]:
    # CO_datamod_impl.pas:987-997 AccountAfterScroll: SetVariable('p_AccID', Account.ID)
    return [row(r) for r in conn.query(transactions_sql(sort), {"p_AccID": acc_id})]


def account_states(conn, acc_id: int) -> list[dict]:
    return [row(r) for r in conn.query(SQL_ACC_STATES, {"AccID": acc_id})]


def _sum(rows, f):
    t = Decimal(0)
    for r in rows:
        if r.get(f) is not None:
            t += Decimal(str(r[f]))
    return float(t)


def account_documents(conn, acc_id: int, acc_no: str, start: datetime.date, end: datetime.date) -> dict:
    """P_AccTransaction_Unit.pas OpenDataControls/FillAmounts + calc fields DebitAccNo/CreditAccNo."""
    b = {"AccountID": acc_id, "StartDate": date_only(start), "EndDate": date_only(end)}
    deb = [{**row(r), "debitaccno": acc_no} for r in conn.query(SQL_ACC_DEBIT, b)]
    cre = [{**row(r), "creditaccno": acc_no} for r in conn.query(SQL_ACC_CREDIT, b)]
    return {"debit": deb, "credit": cre, "debit_total": _sum(deb, "debitamount"), "debit_ltotal": _sum(deb, "lamount"),
            "credit_total": _sum(cre, "creditamount"), "credit_ltotal": _sum(cre, "lamount")}


# ------------------------------------------------------------------------------------------------ service: card
def required_flags(conn) -> dict:
    return {c: conn.call_func("customer_operations", "get_Messaj", ["customers", c], int) != 0
            for c in REQUIRED_FLAG_COLUMNS}


def card_lookups(conn) -> dict:
    out = {k: [row(r) for r in conn.query(sql)] for k, sql in LOOKUPS.items()}
    out["required"] = required_flags(conn)
    # UnitCustProps.pas:171 New: quality := Ods_cust_quality.Lookup('name','Yüksək','id')
    out["default_quality_id"] = next((q["id"] for q in out["qualities"] if q.get("name") == "Yüksək"), None)
    return out


def cities(conn, country_id: int | None) -> list[dict]:
    return [row(r) for r in conn.query(SQL_CITIES, {"CID": country_id})]


def risk_descs(conn, risk_id: int | None) -> list[dict]:
    return [row(r) for r in conn.query(SQL_RISK_DESC, {"v_riskid": risk_id})]


PEP_KEY = "customer_operations.pep_chek"


def save_customer(ws, c: CustomerIn, cust_id: int | None) -> dict:
    """UnitCustProps.pas:412-621 ToolButton4Click (the hotspot), in order:
      1. required-field checks (VALIDATION, driven by get_Messaj flags)
      2. PEP gate  :567-575  if Name<>'' and pep_chek<>-1 -> show Pep_change dialog and EXIT without saving.
         pep_chek is a unit-global (customers_operation_impl.pas:270, initially 0) set to -1 only by the dialog's
         'bağla' button (Pep_changeUnit.pas:71-75) -> once per loaded plugin = once per web session here.
      3. blacklist :578-594  PG_PCustService.GET_WORLD_YOXLAMA(trim(name), null) <> '' -> red Yes/No warning;
         'Xeyr' stops, 'Bəli' continues.
      4. :597-610 the second PEP warning reads Pep_change.Memo1.Lines.Count>2; the memo holds one empty line and its
         filler code is commented out, so it can never trigger (not ported, see parity #V-09).
      5. Post + ApplyUpdates -> CustomersApplyRecord -> SBOP.add_customer / SBOP.upd_customer.
    Returns {"status": "pep_check" | "blacklist" | "saved"}."""
    conn = ws.conn
    validate(c, required_flags(conn))
    if (c.name or "") != "" and ws.module_state.get(PEP_KEY, 0) != -1:
        return {"status": "pep_check", "name": c.name}
    black = conn.call_func("PG_PCustService", "GET_WORLD_YOXLAMA", [(c.name or "").strip(), None], str)
    if black not in (None, "") and not c.blacklist_confirmed:
        return {"status": "blacklist"}
    rec = customer_record(c)
    if cust_id is None:
        conn.call_proc("SBOP", "add_customer", [], named=add_customer_params(rec), commit=False)
    else:
        conn.call_proc("SBOP", "upd_customer", [], named=upd_customer_params(cust_id, rec), commit=False)
    conn.commit()   # see PARITY_CUSTOMERS.md #U-03
    return {"status": "saved", "blacklisted": black not in (None, "")}


def close_customer(conn, cust_id: int) -> None:
    """customers_operation_impl.pas:1724-1734 N20Click + SBCustomer.pas:224-231 Sb_CloseCustomer."""
    if customer_accounts(conn, cust_id):
        raise ValidationError("customers.err_has_accounts")
    conn.call_proc("SBOP", "close_customer", [], named={"v_ID": cust_id, "CURRENTDATE": sysdate(conn),
                                                        "RESULT": Out(int)}, commit=False)
    conn.commit()


# ------------------------------------------------------------------------------------------------ service: transactions
TS_DELAYED, TS_COMMITED, TS_REJECTED = 1, 2, 3     # customers_operation_impl.pas:18-20

# customers_operation_impl.pas:1226-1231 CommitTransaction (CO_datamod_impl.pas:35 cs_commit_transaction); SB_TRANSACTION is pmNamed
# (CO_datamod_impl.dfm:2247). CommitTemp is a PL/SQL BOOLEAN -> literal in an anonymous block.
SQL_COMMIT_TRANSACTION = "begin :r := SB_TRANSACTION.transaction_commit(TransactionID => :TransactionID, CommitTemp => true); end;"


def commit_one(conn, tr_id: int) -> int:
    return conn.plsql(SQL_COMMIT_TRANSACTION, {"TransactionID": tr_id}, int)


def step_commit(conn, rows_by_id: dict, ids: list[int]) -> dict:
    """ActionStepCommitExecute (customers_operation_impl.pas:1352-1435; same loop in
    TransactionManagerImpl.pas:1279-1344): each selected delayed/rejected row -> transaction_commit + SBCommit;
    an error is remembered and the loop CONTINUES (no rollback, as in Delphi)."""
    committed, errors, last = 0, 0, None
    for i in ids:
        r = rows_by_id.get(i)
        if not r or r.get("status") not in (TS_DELAYED, TS_REJECTED):
            continue
        try:
            commit_one(conn, i)
            committed += 1
            conn.commit()
        except DBError as e:
            last, errors = e.message, errors + 1
    return {"committed": committed, "errors": errors, "last_error": last, "total": committed + errors}


def delete_transactions(conn, rows_by_id: dict, ids: list[int], multi: bool) -> dict:
    """N18Click (customers_operation_impl.pas:1611-1684) / ActionDeleteExecute (TransactionManagerImpl.pas:962-1024):
    SB_ACA.CheckObjectAccess('Transaction','delete'); per row: vid_OP.TrDelete=1 -> message & skip;
    transaction_delete; errors swallowed only when more than one row is selected; SBCommit after each."""
    conn.call_proc("SB_ACA", "CheckObjectAccess", ["Transaction", "delete"], commit=False)
    deleted, blocked, failed = [], [], []
    for i in ids:
        r = rows_by_id.get(i) or {}
        cnt = conn.query(SQL_VIDOP_TRDEL, {"v_ID": int(r.get("operationcode") or 0)})[0]["CNT"]
        if int(cnt) == 1:
            blocked.append(i)
            continue
        try:
            conn.call_proc("SB_TRANSACTION", "transaction_delete", [], named={"TransactionID": i}, commit=False)
        except DBError as e:
            if not multi:
                raise
            failed.append({"id": i, "ora": e.message})
            conn.commit()      # Delphi still reaches SBCommit after the swallowed exception
            continue
        deleted.append(i)
        conn.commit()
    return {"deleted": deleted, "blocked": blocked, "failed": failed}


# ------------------------------------------------------------------------------------------------ new account (FormAcc_Unit)
SQL_FA_CURRENCY = ("select -1 as Valute, 'Bütün Valyutalar' as Valu_Name from Dual\nUnion All\n"
                   "select Valute, Valu_Name from Avalute\nOrder by valute")                       # FormAcc_Unit.dfm:610
SQL_FA_BALACC = ("select '-1' as Bal_cn,'   ' as BalName from dual\nUnion All\nselect * from \n(\n"
                 "select to_char(bal_cn), BalName from bal_spr1\norder by bal_cn\n)")              # FormAcc_Unit.dfm:638
SQL_FA_BALACC2 = ("select '-1' as Bal_cn,'   ' as BalName from dual\nUnion All\nselect * from \n(\n"
                  "select to_char(bal_cn), BalName from bal_spr2\norder by bal_cn\n)\n\n")          # FormAcc_Unit.dfm:773
SQL_FA_BRANCHES = ("/*select ID, name from filial \norder by ID*/\n\n"
                   "select ID, name from filial_t where id in(select filialid from sba_objinf where obj=user)")  # dfm:740
SQL_REPSYMBOL = "select * from REPORT_SYMBOL\norder by id"                                         # CO_datamod_impl.dfm:2760
SQL_ACC_SETTINGS = ("\nselect id, accnumber, val_code, val_name, bal_cn1, bal_name, cust_id,\n"
                    "       cust_name, open_date, tw_acc_number, acc_symbol, limit,\n\n"
                    "       to_char(sb_aca.getuserfilial(uid)) branch_id, branch_name, acc_name, symbol, ostat, pok_ostat\n"
                    " from acc_Settings order by :title")                                          # CO_datamod_impl.dfm:2484
SQL_ACC_FLAGS = ("select ' ' as symbol, 'Бцтцн символлар' as Name from Dual\nUnion All\n"
                 "SELECT symbol, symbol||'     '||description as name\n  FROM account_flags")    # CO_datamod_impl.dfm:2594


class NewAccountIn(BaseModel):
    acc_no: str | None = Field(default=None, max_length=60)        # EditAcc
    currency: str | None = None                                    # EditValute (text)
    bal_cn: str | None = None                                      # EditBall
    bal_cn2: str | None = None                                     # editballnew (only when Bal_CN2 group visible)
    customer_id: str | None = None                                 # EditCust
    open_date: datetime.date | None = None                         # DTPOpenDate
    limit: str | None = "0"                                        # DBEditLimit
    report_symbol: str | None = None                               # SymbolEdit_ / DBRepSymb.KeyValue
    branch: str | None = None                                      # EditFil
    flags: list[str] | None = None                                 # CO_AccFlags checked items -> FlagMap
    acc_name: str | None = Field(default=None, max_length=400)     # EditAccName
    note_code: str | None = None                                   # EditNoteCode (generator only)


def flag_map(selected: list[str] | None) -> str:
    """CO_AccFlags.pas ButtonApplyClick: ',' + first char of each checked item, then Delete(FlagMap,1,1)."""
    return ",".join(s[0] for s in (selected or []) if s)


def check_params(a: NewAccountIn, bal2_visible: bool, for_commit: bool) -> bool:
    """FormAcc_Unit.pas:706-724 CheckParams: True = 'Məlumat tam deyil'."""
    t = lambda v: (v or "").strip() == ""     # noqa: E731
    res = t(a.report_symbol) or t(a.bal_cn) or t(a.customer_id) or t(a.branch) or t(a.currency) or \
        (bal2_visible and t(a.bal_cn2))
    if for_commit:
        res = res or t(a.acc_no)
    return res


def bal2_visible(conn) -> bool:
    # FormAcc_Unit.pas:631-635 PG_PCustService.get_Modle_comp('customer_operations','FormAccount','Bal_CN2')
    return conn.call_func("PG_PCustService", "get_Modle_comp", ["customer_operations", "FormAccount", "Bal_CN2"], int) != 0


def new_account_form(conn, cust: dict) -> dict:
    """FormAcc_Unit.pas:592-641 FormActivate/FormCreate defaults and lists."""
    settings = [row(r) for r in conn.query(subst(SQL_ACC_SETTINGS, "title", "id"))]
    reps = [row(r) for r in conn.query(SQL_REPSYMBOL)]
    return {
        "lists": {"currencies": [row(r) for r in conn.query(SQL_FA_CURRENCY)],
                  "balances": [row(r) for r in conn.query(SQL_FA_BALACC)],
                  "balances2": [row(r) for r in conn.query(SQL_FA_BALACC2)],
                  "branches": [row(r) for r in conn.query(SQL_FA_BRANCHES)],
                  "report_symbols": reps,
                  "flags": [row(r) for r in conn.query(SQL_ACC_FLAGS)][1:]},   # CO_AccFlags.FormCreate skips row 0
        "bal2_visible": bal2_visible(conn),
        "defaults": {"open_date": conn.query(SQL_SYSDAT)[0]["TEK_DAT"].date().isoformat(),
                     "customer_id": str(cust["id"]), "acc_name": cust.get("name") or "", "limit": "0", "currency": "0",
                     "branch": (settings[0].get("branch_id") if settings else None),
                     "report_symbol": (str(reps[0]["id"]) if reps else None), "bal_cn": "", "bal_cn2": "", "acc_no": ""},
    }


def generate_account_number(conn, a: NewAccountIn) -> str:
    """FormAcc_Unit.pas:677-698 SpeedButton1Click -> SBOP.GenerateAccountNumber (pmNamed)."""
    if check_params(a, bal2_visible(conn), False):
        raise ValidationError("customers.err_incomplete")
    n = lambda v: None if v in (None, "") else int(v)   # noqa: E731  (lookup KeyValue)
    return conn.call_func("SBOP", "GenerateAccountNumber", [], str, named={
        "BalCn": n(a.bal_cn), "CurrencyID": n(a.currency), "CustomerID": n(a.customer_id), "BranchID": n(a.branch),
        "AnalitKod": n(a.report_symbol), "NoteCode": a.note_code or None, "BalCN2": n(a.bal_cn2)})


def open_account(conn, a: NewAccountIn) -> int:
    """FormAcc_Unit.pas:571-590 ButtonCommitClick -> customer_operations.open_Account (positional, 11 args,
    the edit texts as typed). The last argument is custid.Text - a TDBEdit without DataSource, i.e. always ''."""
    if check_params(a, bal2_visible(conn), True):
        raise ValidationError("customers.err_incomplete")
    e = lambda v: None if v in (None, "") else v       # noqa: E731  DOA binds '' as NULL
    r = conn.call_func("customer_operations", "open_Account", [
        e(a.acc_no), e(a.currency), e(a.bal_cn), e(a.customer_id), date_only(a.open_date), e(a.limit),
        e(a.report_symbol), e(a.branch), e(flag_map(a.flags)), e(a.acc_name), None], int)
    conn.commit()   # Delphi: no explicit commit (relies on the session) - PARITY #U-03
    return r


# ------------------------------------------------------------------------------------------------ router
class IdsIn(BaseModel):
    acc_id: int
    ids: list[int]
    current_id: int | None = None
    multi: bool = False


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/customers")
    guard = require_module(CLSID)

    def v_err(e: ValidationError):
        err(400, e.key, field=e.field, **e.extra)

    @r.get("")
    def _list(sort: str = "ID", offset: int = 0, limit: int = PAGE, ws=Depends(guard)):
        if sort not in CUSTOMER_SORT:
            err(400, "error.generic")
        rows, more = list_customers(ws.conn, sort, max(0, offset), max(1, min(limit, 500)))
        return {"rows": rows, "more": more, "offset": offset}

    @r.get("/locate")
    def _locate(field: str, text: str = "", after: int = 0, sort: str = "ID", ws=Depends(guard)):
        if field not in SPEED_FIELDS or sort not in CUSTOMER_SORT:
            err(400, "error.generic")
        return {"rn": locate(ws.conn, field, text, max(0, after), sort)}

    @r.get("/locate-date")
    def _locate_d(d: datetime.date, sort: str = "ID", ws=Depends(guard)):
        return {"rn": locate_open_date(ws.conn, d, sort)}

    @r.get("/search-account")
    def _sacc(acc_no: str = "", ws=Depends(guard)):
        return search_account_no(ws.conn, acc_no)

    @r.get("/search-account-name")
    def _sname(name: str = "", ws=Depends(guard)):
        return search_account_name(ws.conn, name)

    @r.get("/card-lookups")
    def _cl(ws=Depends(guard)):
        return {**card_lookups(ws.conn), "system_date": sysdate(ws.conn).date().isoformat()}

    @r.get("/cities")
    def _cities(country_id: int | None = None, ws=Depends(guard)):
        return cities(ws.conn, country_id)

    @r.get("/risk-descs")
    def _rd(risk_id: int | None = None, ws=Depends(guard)):
        return risk_descs(ws.conn, risk_id)

    @r.post("/pep/close")
    def _pep(ws=Depends(guard)):
        ws.module_state[PEP_KEY] = -1      # Pep_changeUnit.pas:71-75 Button2Click
        return {"ok": True}

    @r.post("")
    def _add(body: CustomerIn, ws=Depends(guard)):
        try:
            return save_customer(ws, body, None)
        except ValidationError as e:
            v_err(e)


    def _ocx_guard(ws):
        if not any(ws.conn.call_bool("SB_ACA", "CHECKMODRIGHT", [c]) for c in OCX_CLSIDS):
            err(403, "error.access_denied")
        return ws

    @r.get("/ocx/init")
    def _ocx_init(ws=Depends(require_session)):
        _ocx_guard(ws)
        conn = ws.conn
        return {
            "system_date": sysdate(conn).date().isoformat(),
            "filials": [row(x) for x in conn.query(SQL_OCX_FILIAL_ALL)],
            "currencies": [row(x) for x in conn.query(SQL_OCX_AVALUTE_ALL)],
            "prinad": [row(x) for x in conn.query(LOOKUPS["prinad"])],
            "qrp_klie": [row(x) for x in conn.query(LOOKUPS["qrp_klie"])],
            "vid_sob": [row(x) for x in conn.query(SQL_OCX_VID_SOB_ALL)],
            "org_prav": [row(x) for x in conn.query(LOOKUPS["org_prav"])],
            "sferadey": [row(x) for x in conn.query(LOOKUPS["sferadey"])],
            "otrasli": [row(x) for x in conn.query(LOOKUPS["otrasli"])],
            "nalog": [row(x) for x in conn.query(LOOKUPS["nalog"])],
            "countries": [row(x) for x in conn.query(LOOKUPS["countries_by_name"])],
        }

    @r.get("/ocx/list")
    def _ocx_list(sort: str = "ID", filial: int | None = None, cust_type: int | None = None,
                  include_closed: bool = False, q_id: str = "", q_inn: str = "", q_name: str = "",
                  q_date: str = "", ws=Depends(require_session)):
        _ocx_guard(ws)
        if sort not in OCX_CUST_SORT:
            err(400, "error.generic")
        fil_clause = "AND c.FILIAL = :filial" if filial else ""
        sql = SQL_OCX_CUSTOMERS.format(filial_clause=fil_clause, sort=sort)
        binds = {"filial": filial} if filial else {}
        rows = [row(x) for x in ws.conn.query(sql, binds)]
        if cust_type is not None:
            rows = [x for x in rows if (x.get("cust_type") or 0) == cust_type]
        if q_id:
            rows = [x for x in rows if str(x.get("id") or "").startswith(q_id)]
        if q_inn:
            rows = [x for x in rows if str(x.get("inn") or "").upper().startswith(q_inn.upper())]
        if q_name:
            qn = q_name.upper()
            rows = [x for x in rows if qn in str(x.get("name") or "").upper()]
        if q_date:
            rows = [x for x in rows if str(x.get("open_dat") or "")[:10] == q_date[:10]]
        return {"rows": rows, "total": len(rows)}

    @r.get("/ocx/{cust_id}/accounts")
    def _ocx_accs(cust_id: int, sort: str = "AccNo", currency_id: int | None = None,
                  q_accno: str = "", q_accname: str = "", ws=Depends(require_session)):
        _ocx_guard(ws)
        if sort not in OCX_ACC_SORT:
            sort = "AccNo"
        curr_clause = "AND (Account.CurrencyID = :curr)" if currency_id is not None else ""
        sql = SQL_OCX_ACCOUNTS.format(curr_clause=curr_clause, sort=sort)
        binds = {"ID": cust_id}
        if currency_id is not None:
            binds["curr"] = currency_id
        rows = [row(x) for x in ws.conn.query(sql, binds)]
        if q_accno:
            rows = [x for x in rows if str(x.get("accno") or "").upper().startswith(q_accno.upper())]
        if q_accname:
            rows = [x for x in rows if q_accname.upper() in str(x.get("accname") or "").upper()]
        return rows

    @r.post("/ocx/customers")
    def _ocx_add(body: OcxCustomerIn, ws=Depends(require_session)):
        _ocx_guard(ws)
        if not (body.name or "").strip():
            err(400, "customers.err_name", field="name")
        if not (body.short_name or "").strip():
            err(400, "customers.err_short_name", field="short_name")
        d_open = date_only(body.open_dat) if body.open_dat else sysdate(ws.conn)
        named = {
            "OP_ID": 0, "OPEN_DAT": d_open, "CLOSE_DAT": None, "NEREZIDENT": body.nerezident,
            "PRINAD_KOD": body.prinad_kod or 1, "NAME": body.name, "SHORT_NAME": body.short_name,
            "GROUP_KLIE": body.group_klie or 1, "VID_SOB": body.vid_sob or 1, "ORG_SOB": body.org_sob or 1,
            "SFERA_DEY": body.sfera_dey or 1, "OTRASL": body.otrasl or 1, "NALOG_KOD": body.nalog_kod or 1,
            "KOD_OKPRO": body.kod_okpro, "INN": body.inn, "DAT_NAL": date_only(body.dat_nal),
            "DAT_USTAV": date_only(body.dat_ustav), "BIK": body.bik, "CUST_TYPE": body.cust_type,
            "FILIAL": body.filial or 101,
        }
        cid = ws.conn.call_func("SBOP", "SB_ADDCUSTOMER", [], int, named=named)
        return {"status": "saved", "id": cid}

    @r.put("/ocx/customers/{cust_id}")
    def _ocx_upd(cust_id: int, body: OcxCustomerIn, ws=Depends(require_session)):
        _ocx_guard(ws)
        if not (body.name or "").strip():
            err(400, "customers.err_name", field="name")
        if not (body.short_name or "").strip():
            err(400, "customers.err_short_name", field="short_name")
        d_open = date_only(body.open_dat) if body.open_dat else sysdate(ws.conn)
        named = {
            "v_ID": cust_id, "OPEN_DAT": d_open, "NEREZIDENT": body.nerezident,
            "PRINAD_KOD": body.prinad_kod or 1, "NAME": body.name, "SHORT_NAME": body.short_name,
            "GROUP_KLIE": body.group_klie or 1, "VID_SOB": body.vid_sob or 1, "ORG_SOB": body.org_sob or 1,
            "SFERA_DEY": body.sfera_dey or 1, "OTRASL": body.otrasl or 1, "NALOG_KOD": body.nalog_kod or 1,
            "KOD_OKPRO": body.kod_okpro, "INN": body.inn, "DAT_NAL": date_only(body.dat_nal),
            "DAT_USTAV": date_only(body.dat_ustav), "BIK": body.bik, "CUST_TYPE": body.cust_type,
            "FILIAL": body.filial or 101,
        }
        ws.conn.call_proc("SBOP", "SB_EDITCUSTOMER", [], named=named)
        return {"status": "saved", "id": cust_id}

    @r.post("/ocx/customers/{cust_id}/close")
    def _ocx_close(cust_id: int, ws=Depends(require_session)):
        _ocx_guard(ws)
        try:
            close_customer(ws.conn, cust_id)
        except ValidationError as e:
            v_err(e)
        return {"ok": True}

    @r.get("/ocx/customers/{cust_id}/info")
    def _ocx_info_get(cust_id: int, ws=Depends(require_session)):
        _ocx_guard(ws)
        cards = [row(x) for x in ws.conn.query(SQL_OCX_CUSTINFO, {"ID": cust_id})]
        ip_cards = {}
        for c in cards:
            cno = c.get("card_no", 0)
            ip = [row(x) for x in ws.conn.query(SQL_OCX_IPINFO, {"CUSTID": cust_id, "CARD_NO": cno})]
            if ip:
                ip_cards[str(cno)] = ip[0]
        return {"cards": cards, "ip_info": ip_cards}

    @r.post("/ocx/customers/{cust_id}/info")
    def _ocx_info_save(cust_id: int, body: OcxCustInfoIn, ws=Depends(require_session)):
        _ocx_guard(ws)
        named = {
            "v_ID": cust_id, "v_CARD_NO": body.card_no, "v_PASP_TYPE": body.pasp_type,
            "v_PASPORT": body.pasport, "v_KEM_VIDAN": body.kem_vidan, "v_PASP_DATE": date_only(body.pasp_date),
            "v_DOG_YER": body.dog_yer, "v_DOG_TAR": date_only(body.dog_tar), "v_CINS": body.cins,
            "v_MILLIYET": body.milliyet, "v_GRAJDAN": body.grajdan, "v_WORK_PLACE": body.work_place,
            "v_DOLJNOST": body.doljnost, "v_PARTNER": body.partner, "v_FATHER": body.father,
            "v_ADRESS": body.adress, "v_STRANA": body.strana, "v_TEL": body.tel,
            "v_TEL_MOB": body.tel_mob, "v_FAKS": body.faks, "v_E_MAIL": body.e_mail,
        }
        ws.conn.call_proc("SB_CUSTINFO", "UPD_CUSTINFO", [], named=named)
        return {"ok": True, "cards": [row(x) for x in ws.conn.query(SQL_OCX_CUSTINFO, {"ID": cust_id})]}

    @r.delete("/ocx/customers/{cust_id}/info/{card_no}")
    def _ocx_info_del(cust_id: int, card_no: int, ws=Depends(require_session)):
        _ocx_guard(ws)
        ws.conn.call_proc("SB_CUSTINFO", "DEL_CUSTINFO", [], named={"v_ID": cust_id, "v_CARD_NO": card_no})
        return {"ok": True, "cards": [row(x) for x in ws.conn.query(SQL_OCX_CUSTINFO, {"ID": cust_id})]}

    @r.post("/ocx/customers/{cust_id}/ipinfo")
    def _ocx_ip_save(cust_id: int, body: OcxIpInfoIn, ws=Depends(require_session)):
        _ocx_guard(ws)
        ws.conn.call_proc("SB_CUSTINFO", "UPD_CUSTIPINFO", [], named={
            "v_CUSTID": cust_id, "v_CARD_NO": body.card_no, "v_FAMILYSTATUS": body.familystatus,
            "v_EDUCATION": body.education, "v_PLACE1": body.place1, "v_WORK1": body.work1,
            "v_WORK2": body.work2, "v_VERIFY": body.verify, "v_FAMILYMEMBERS": body.familymembers,
            "v_MONTHLYINCOME": body.monthlyincome, "v_MONTHLYEXPENSE": body.monthlyexpense,
        })
        ip = [row(x) for x in ws.conn.query(SQL_OCX_IPINFO, {"CUSTID": cust_id, "CARD_NO": body.card_no})]
        return {"ok": True, "ip_info": ip[0] if ip else {}}

    @r.get("/ocx/settings/{table_name}")
    def _ocx_settings_get(table_name: str, ws=Depends(require_session)):
        _ocx_guard(ws)
        allowed = {"prinad": LOOKUPS["prinad"], "qrp_klie": LOOKUPS["qrp_klie"], "vid_sob": SQL_OCX_VID_SOB_ALL,
                   "org_prav": LOOKUPS["org_prav"], "sferadey": LOOKUPS["sferadey"], "otrasli": LOOKUPS["otrasli"],
                   "nalog": LOOKUPS["nalog"]}
        if table_name not in allowed:
            err(400, "error.generic")
        return [row(x) for x in ws.conn.query(allowed[table_name])]

    @r.get("/info-ocx/analyze")
    def _info_ocx_analyze(mode: str = "customers", filial: int | None = None, currency_id: int | None = None,
                          cust_type: int | None = None, status: str = "open", min_bal: float | None = None,
                          max_bal: float | None = None, start_date: str = "", end_date: str = "",
                          ws=Depends(require_session)):
        _ocx_guard(ws)
        conn = ws.conn
        if mode == "customers":
            sql = SQL_OCX_CUSTOMERS.format(filial_clause="", sort="ID")
            rows = [row(x) for x in conn.query(sql)]
            if cust_type is not None:
                rows = [x for x in rows if (x.get("cust_type") or 0) == cust_type]
            if filial is not None:
                rows = [x for x in rows if (x.get("filial") or 101) == filial]
            if start_date:
                rows = [x for x in rows if str(x.get("open_dat") or "")[:10] >= start_date]
            if end_date:
                rows = [x for x in rows if str(x.get("open_dat") or "")[:10] <= end_date]
            return {"mode": mode, "rows": rows, "total": len(rows)}
        elif mode == "accounts":
            custs = [row(x) for x in conn.query(SQL_OCX_CUSTOMERS.format(filial_clause="", sort="ID"))]
            all_accs = []
            for c in custs:
                for a in conn.query(SQL_OCX_ACCOUNTS.format(curr_clause="", sort="AccNo"), {"ID": c["id"]}):
                    ar = row(a)
                    ar["customer_name"] = c.get("name")
                    all_accs.append(ar)
            if currency_id is not None:
                all_accs = [x for x in all_accs if x.get("currencyid") == currency_id]
            if filial is not None:
                all_accs = [x for x in all_accs if (x.get("filial") or 101) == filial]
            if min_bal is not None:
                all_accs = [x for x in all_accs if float(x.get("balance") or 0) >= min_bal]
            if max_bal is not None:
                all_accs = [x for x in all_accs if float(x.get("balance") or 0) <= max_bal]
            return {"mode": mode, "rows": all_accs, "total": len(all_accs)}
        else:
            # documents / transactions mode
            custs = [row(x) for x in conn.query(SQL_OCX_CUSTOMERS.format(filial_clause="", sort="ID"))]
            docs = []
            seen = set()
            for c in custs:
                for a in conn.query(SQL_OCX_ACCOUNTS.format(curr_clause="", sort="AccNo"), {"ID": c["id"]}):
                    ar = row(a)
                    for t in account_transactions(conn, ar["id"]):
                        if t["id"] not in seen:
                            seen.add(t["id"])
                            docs.append(t)
            return {"mode": mode, "rows": docs, "total": len(docs)}

    @r.get("/{cust_id}")
    def _get(cust_id: int, ws=Depends(guard)):
        c = get_customer(ws.conn, cust_id)
        if not c:
            err(404, "error.not_found")
        return c

    @r.put("/{cust_id}")
    def _upd(cust_id: int, body: CustomerIn, ws=Depends(guard)):
        try:
            return save_customer(ws, body, cust_id)
        except ValidationError as e:
            v_err(e)

    @r.post("/{cust_id}/close")
    def _close(cust_id: int, ws=Depends(guard)):
        try:
            close_customer(ws.conn, cust_id)
        except ValidationError as e:
            v_err(e)
        return {"ok": True}

    @r.get("/{cust_id}/accounts")
    def _accs(cust_id: int, ws=Depends(guard)):
        return customer_accounts(ws.conn, cust_id)

    @r.get("/{cust_id}/new-account")
    def _na(cust_id: int, ws=Depends(guard)):
        c = get_customer(ws.conn, cust_id)
        if not c:
            err(404, "error.not_found")
        return new_account_form(ws.conn, c)

    @r.post("/new-account/generate")
    def _gen(body: NewAccountIn, ws=Depends(guard)):
        try:
            return {"acc_no": generate_account_number(ws.conn, body)}
        except ValidationError as e:
            v_err(e)

    @r.post("/new-account")
    def _open(body: NewAccountIn, ws=Depends(guard)):
        try:
            return {"result": open_account(ws.conn, body)}
        except ValidationError as e:
            v_err(e)

    @r.get("/accounts/{acc_id}/transactions")
    def _tr(acc_id: int, sort: str = "ID", ws=Depends(guard)):
        if sort not in TRANSACTION_SORT:
            err(400, "error.generic")
        return account_transactions(ws.conn, acc_id, sort)

    @r.get("/accounts/{acc_id}/states")
    def _st(acc_id: int, ws=Depends(guard)):
        return account_states(ws.conn, acc_id)

    @r.get("/accounts/{acc_id}/documents")
    def _docs(acc_id: int, acc_no: str, start: datetime.date | None = None, end: datetime.date | None = None,
              ws=Depends(guard)):
        # customers_operation_impl.pas:1549-1554 StartDate := Sysdat.tek_dat; EndDate := StartDate
        od = ws.conn.query(SQL_SYSDAT)[0]["TEK_DAT"].date()
        start, end = start or od, end or (start or od)
        return {"start": start.isoformat(), "end": end.isoformat(), "accno": acc_no,
                **account_documents(ws.conn, acc_id, acc_no, start, end)}

    def _rows(ws, acc_id):
        return {x["id"]: x for x in account_transactions(ws.conn, acc_id)}

    @r.post("/transactions/commit")
    def _commit(body: IdsIn, ws=Depends(guard)):
        rows = _rows(ws, body.acc_id)
        if not rows:
            err(400, "customers.err_no_transactions")          # :1362-1366
        cur = rows.get(body.current_id if body.current_id is not None else body.ids[0] if body.ids else -1)
        if cur and cur.get("status") == TS_COMMITED:
            err(400, "customers.err_already_committed")        # :1372-1373
        return step_commit(ws.conn, rows, body.ids or ([body.current_id] if body.current_id else []))

    @r.post("/transactions/delete")
    def _delete(body: IdsIn, ws=Depends(guard)):
        return delete_transactions(ws.conn, _rows(ws, body.acc_id), body.ids, body.multi)

    return r

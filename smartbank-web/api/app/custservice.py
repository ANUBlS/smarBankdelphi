"""Customer service module - port of the Delphi ActiveX library Packages/PCustService_irshad (production).

Main form PCustServiceFormImpl1.pas/.dfm (TPCustServiceForm), data module UnitDataModPCustService.pas/.dfm,
linking dialog CustomersImpl (FormCustomers), PEP check PEPUnit. CLSID PCustService_TLB CLASS_PCustService.

All SQL is verbatim from the dfm (csv_sql.py). Where Delphi wrote user input into SQL[n] lines the same
predicate is written with a bind variable. Oracle package calls are unchanged (PG_PCustService, msg_control,
convertpack, SB_ACA). Validation runs in the exact Delphi order; the first failing check returns its message.
"""
from __future__ import annotations
import datetime
import re
from decimal import Decimal
from typing import Any

from fastapi import APIRouter, Depends
from pydantic import BaseModel, Field

from .db import DBError
from . import csv_sql as Q
from .csv_sql import M, set_line

CLSID = "{7B18F01A-D60D-406F-9A5B-8F191106E786}"
PKG = "PG_PCustService"
FORM = ("PCustService", "PCustServiceForm")
LIMIT = 500

# get_Modle_comp components hidden when the function returns 0 (FormShow, pas:4470-4700)
COMPONENTS = ("Köçermeler", "XHKS1", "AZPS1", "SWFT1", "Kreditler", "Yenikreditinverilmsi1", "Mtrininkreditlri1",
              "Depozit1", "PlastikKartlar", "Məhsullar", "Əməliyyat", "HesabAmaq1", "Hesabdanxar2", "Expemmeliyyat1",
              "dmtapr1", "Qaime", "tonaj", "Qeydlr1", "SM_Email", "Sazlama1", "ToolButton1", "ToolButton6",
              "ToolButton7", "potencialm1", "panelMasin")

# Messaj_fs_phys_nom / Messaj_jur (pas:1128-1600): get_Messaj(table, column) -> required '*' label(s)
PHYS_REQ = (
    ("customers", "inn", (12,)), ("customers", "nerezident", (41, 42)),
    ("custinfo", "doc_type", (8, 26, 87, 27)), ("custinfo", "LastName", (11,)), ("custinfo", "firstname", (9,)),
    ("custinfo", "soname", (10,)), ("custinfo", "citizenship", (86,)), ("custinfo", "birthplace", (81,)),
    ("custinfo", "BIRTH_STATE", (82,)), ("custinfo", "birthday", (97,)), ("custinfo", "adrs_state", (83,)),
    ("custinfo", "city", (84,)), ("custinfo", "address", (80,)), ("custinfo", "fakt_country", (68,)),
    ("custinfo", "fakt_adress", (28,)), ("custinfo", "fakt_city", (69,)), ("custinfo", "doc_country", (75,)),
    ("custinfo", "e_mail", (127,)), ("custinfo", "work_place", (115,)), ("custinfo", "work_post", (116,)),
    ("custinfo", "work_adress", (117,)), ("custinfo", "sex", (118,)), ("custinfo", "fam_status", (119,)),
    ("custinfo", "phone_m", (128,)), ("custinfo", "paspplace", (85,)), ("custinfo", "paspdate", (98,)),
    ("custinfo", "passexpire", (99,)), ("custinfo", "contact_type", (54,)), ("custinfo", "tph_country", (25,)),
    ("custinfo", "tph_city", (55,)), ("custinfo", "tph_adress", (56,)), ("custinfo", "tph_contact_type", (58,)),
    ("custinfo", "tph_communication_type", (59,)), ("custinfo", "tph_number", (60,)),
    ("custinfo", "work_vid_sob", (104,)), ("custinfo", "work_otrasli", (105,)), ("custinfo", "activity", (112,)),
    ("custinfo", "profession", (113,)), ("custinfo", "source_of_income", (114,)),
    ("customers", "risk_categ", (90,)), ("customers", "riskdescid", (95,)), ("customers", "SAMELYDATE", (96,)),
    ("customers", "sfera_deycod", (122,)), ("customers", "compani", (121,)),
)
JUR_REQ = (
    ("customers", "nerezident", (41, 42)), ("customers", "name", (24,)), ("customers", "inn", (12,)),
    ("customers", "incorporation_cntr", (62,)), ("customers", "incorporation_number", (67,)),
    ("customers", "dat_ustav", (66,)), ("customers", "dat_nal", (101,)), ("customers", "risk_categ", (90,)),
    ("customers", "riskdescid", (95,)), ("customers", "SAMELYDATE", (96,)), ("customers", "address_type", (54,)),
    ("customers", "country_code", (25,)), ("customers", "city", (55,)), ("customers", "address", (56,)),
    ("customers", "tph_contact_type", (58,)), ("customers", "tph_communication_type", (59,)),
    ("customers", "tph_number", (60,)), ("custinfo", "doc_country", (75,)), ("customers", "sfera_deycod", (122,)),
    ("customers", "compani", (121,)),
)
ALL_LABELS = sorted({n for _, _, ns in PHYS_REQ + JUR_REQ for n in ns} | {92})

# combo -> data set (DM or MAIN key), KeyField, ListField (PCustServiceFormImpl1.dfm ListSource/KeyField/ListField)
COMBOS = {
    "CBoxDocType": ("OdsDoctaypes", "ID", "NAME"), "id_quality": ("Ods_cust_quality", "ID", "NAME"),
    "Eh3": ("OracleDataSet3", "ID", "NAME"), "DBLC_INCORP_CNTR": ("DS_INCORP_CNTR", "ID", "CNTR_NAME"),
    "Citizenship3": ("Citizenship3", "ID", "CNTR_NAME"), "Citizenship2": ("Citizenship2", "ID", "CNTR_NAME"),
    "CBoxCitizenship": ("Odscountries", "ID", "CNTR_NAME"), "DBLookupComboBox1": ("ods_rescount", "ID", "CNTR_NAME"),
    "DBLookupComboBox2": ("ods_rescount1", "ID", "CNTR_NAME"), "DBLookupComboBox3": ("ods_rescount2", "ID", "CNTR_NAME"),
    "ComboBox_risk": ("ODS_risk", "ID", "NAME"), "CBox": ("EstateTypeData", "ID", "NAME"),
    "cust_compani": ("Ods_cust_compani", "ID", "NAME_DES"), "Eh2": ("OracleDataSet4", "ID", "NAME"),
    "sfereday_kod": ("ODS_sferadey_cod", "ID", "NAME"), "Relation": ("RelationData", "ID", "NAME"),
    "CBoxBirthState": ("Odscountries1", "CNTR_NAME", "CNTR_NAME"),
    "CBoxAddressState": ("Odscountries2", "CNTR_NAME", "CNTR_NAME"),
    "Fakt_Adrs_State": ("ODSFakt_Adrs_Country", "ID", "CNTR_NAME"),
    "fakt_adress_owner": ("Ods_fakt_adress_owner", "ID", "NAME"), "issue_country": ("DS_issue_country", "ID", "CNTR_NAME"),
    "Eh1": ("OracleDataSet2", "ID", "NAME"), "BankKard": ("OracleDataSet7", "ID", "NAME"),
    "borrower_bad": ("OracleDataSet10", "ID", "NAME"), "borrower_occupation": ("OracleDataSet14", "ID", "NAME"),
    "Income_cur": ("ods_val", "VAL_NAME", "VAL_NAME"), "Eh5": ("OracleDataSet16", "KOD", "NAME"),
    "Eh6": ("OracleDataSet17", "ID", "NAME"), "CountryByConctType": ("CountryByConctType", "ID", "CNTR_NAME"),
    "tph_country_prefix": ("ds_tph_country_prefix", "PHONE_CODE", "PHONE_CODE"),
    "tph_communication_type": ("ds_mmx_communication_type", "SYMBOL", "DESCRIPTION"),
    "tph_contact_type": ("ds_tph_contact_type", "SYMBOL", "DESCRIPTION"),
    "Address_type": ("ds_mmx_contact_type", "SYMBOL", "DESCRIPTION"),
    "WORK_VID_SOB": ("Ods_WORK_VID_SOB", "ID", "NAME"), "WORK_OTRASLI": ("Ods_WORK_OTRASLI", "ID", "NAME"),
    "source_of_income": ("ods_cust_sorcof", "ID", "NAME"), "par2": ("OracleDataSet6", "ID", "NAEM"),
    "par1": ("OracleDataSet5", "ID", "NAEM"), "idxal": ("OracleDataSet8", "ID", "NAME"),
    "finance": ("OracleDataSet11", "ID", "NAME"), "ReportType": ("OracleDataSet12", "KOD", "NAME"),
    "InsolvencyStatus": ("OracleDataSet13", "KOD", "NAME"), "Isoplost": ("OracleDataSet15", "KOD", "NAME"),
    "iflas": ("OracleDataSet9", "ID", "NAME"), "grop": ("ods_cust_group", "KOD", "NAME"),
    # TComboBox filled with the NAME column (FormShow); Delphi Locate('name', Text) -> id
    "OrganizationTypeCB": ("OrganizationTypeData", "ID", "NAME"), "BranchCB": ("BranchData", "ID", "NAME"),
    "TaXAreaCB": ("TaxAreaData", "ID", "NAME"), "CBoxGender": ("OdsGender", "ID", "NAME"),
    "CBoxFamStatus": ("OdsFamstatus", "ID", "NAME"), "ActionAreaCB": ("ActionAreaData", "ID", "NAME"),
    "CBoxGroup": ("ClientGroupData", "ID", "NAME"),
}
DEPENDENT = {   # dependent lookups (DM AfterScroll handlers): name -> (sql, bind)
    "Odscities": (Q.DM["Odscities"], "v_id"), "Odscities1": (Q.DM["Odscities1"], "v_id"),
    "ODSFakt_Adrs_City": (Q.DM["ODSFakt_Adrs_City"], "CID"), "CityByConctType": (Q.DM["CityByConctType"], "CID"),
    "ODS_CUST_RISK_DESC": (Q.DM["ODS_CUST_RISK_DESC"], "id"), "odsPassDeps": (Q.DM["odsPassDeps"], "v_doctype"),
}
GRID_SORT = ("ID", "CUST_NAME", "LASTNAME", "FIRSTNAME", "PATRONYMIC", "PASSP_NUMBER", "PASSPIN", "PHONE_MOB",
             "PHONE", "PASSPORT", "OPENDATE", "INN", "USNAM")


class Msg(Exception):
    def __init__(self, text: str, kind: str = "msg", **extra):
        self.text, self.kind, self.extra = text, kind, extra


# ------------------------------------------------------------------ helpers
def _v(v):
    if isinstance(v, Decimal):
        return float(v) if v != v.to_integral_value() else int(v)
    if isinstance(v, datetime.datetime):
        return v.date().isoformat() if v.time() == datetime.time() else v.isoformat(sep=" ")
    return v


def row(r: dict) -> dict:
    return {k.upper(): _v(v) for k, v in r.items() if k.upper() not in ("ROWID", "RN__")}


def rows(conn, sql, binds=None, limit=None):
    out = conn.query(sql, binds or {})
    return [row(r) for r in (out[:limit] if limit else out)]


def get_message(conn, n: int, key: str) -> str:
    return conn.call_func("msg_control", "GetMessage", [n, key], str) or ""


def comp_flags(conn) -> dict:
    return {c: conn.call_func(PKG, "get_Modle_comp", [*FORM, c], int) != 0 for c in COMPONENTS}


def required_flags(conn, cust_type: int | None) -> dict:
    """FormShow -> Messaj_fs_phys_nom; type 0/5 click -> Messaj_jur (label Visible := get_Messaj()<>0)."""
    flags = {n: True for n in ALL_LABELS}             # XFLabel*.Visible=True in the dfm
    for t, c, ns in PHYS_REQ:
        on = conn.call_func(PKG, "get_Messaj", [t, c], int) != 0
        for n in ns:
            flags[n] = on
    if cust_type in (0, 5):
        for t, c, ns in JUR_REQ:
            on = conn.call_func(PKG, "get_Messaj", [t, c], int) != 0
            for n in ns:
                flags[n] = on
    return flags


def _lookup_sql(name: str, cust_type: int | None = None) -> str:
    sql = Q.MAIN[name] if name in Q.MAIN else Q.DM[name]       # main-form data sets first (OracleDataSet2.. are on the form)
    if name == "EstateTypeData" and cust_type is not None:          # XFRadioGroupCust_typeClick pas:10905
        sql = set_line(sql, 4, "and cust_type in(-1,0)" if cust_type == 0 else "and cust_type in(-1,1)")
    if name == "Ods_WORK_VID_SOB" and cust_type in (1, 2, 3, 4):
        sql = set_line(sql, 4, "and cust_type in(-1,1)")
    return sql


def lookups(conn, cust_type: int | None = None) -> dict:
    out = {}
    for ctl, (ds, key, lst) in COMBOS.items():
        if ds not in out:
            out[ds] = rows(conn, _lookup_sql(ds, cust_type))
    out["odsbankinfo"] = rows(conn, Q.MAIN["odsbankinfo"])
    out["ODS_SYSDATE"] = rows(conn, Q.DM["ODS_SYSDATE"])
    return {"data": out, "combos": {k: {"ds": v[0], "key": v[1], "list": v[2]} for k, v in COMBOS.items()}}


def dependent(conn, name: str, value) -> list[dict]:
    sql, bind = DEPENDENT[name]
    return rows(conn, sql, {bind: value})


def months_from_sysdat(conn, months: int):
    r = rows(conn, Q.DM["ods_months_sysdat"], {"v_months": months})
    return r[0]["DAT"] if r else None


# ------------------------------------------------------------------ search (CustSearch1Click pas:7095-7440)
def _t(f, k):
    v = f.get(k)
    return "" if v is None else str(v)


def _sel(f, k):
    """lookup combo value: None / '' / -1 -> not selected"""
    v = f.get(k)
    return None if v in (None, "", -1, "-1") else v


def search_sql(f: dict, sort: str = "ID") -> tuple[str, dict]:
    sql = Q.DM["ODS_Customers_Phys_FS"]
    s, b = "", {}
    if _t(f, "EditID"):
        s += " and ID = :b_id"; b["b_id"] = _t(f, "EditID")
    for ctl, col in (("EditFirstName", "FIRSTNAME"), ("EditPatronymic", "PATRONYMIC"), ("EditLastName", "LastName"),
                     ("EditFullName", "Cust_Name")):
        if _t(f, ctl):
            s += f" and nvl(upper({col}),0) like upper (:b_{ctl})"; b[f"b_{ctl}"] = "%" + _t(f, ctl) + "%"
    if _t(f, "EditShort_name"):
        s += " and upper(SHORT_NAME) like upper(:b_short)"; b["b_short"] = "%" + _t(f, "EditShort_name") + "%"
    if _t(f, "EditPINCode1"):
        s += " and PASSPIN = :b_pin"; b["b_pin"] = _t(f, "EditPINCode1")
    if _t(f, "EditITN"):
        s += " and inn =:b_inn"; b["b_inn"] = _t(f, "EditITN")
    if _sel(f, "CBoxGender") is not None:
        s += " and nvl(sex,0)=:b_sex"; b["b_sex"] = f["CBoxGender"]
    if _sel(f, "CBoxFamStatus") is not None:
        s += " and nvl(fam_status,0)=:b_fam"; b["b_fam"] = f["CBoxFamStatus"]
    t = f.get("type")
    if f.get("doc_enabled", True) and _sel(f, "CBoxDocType1") is not None:
        s += " and doc_type=:b_doct"; b["b_doct"] = f["CBoxDocType1"]
    if f.get("doc_enabled", True):
        for ctl, col in (("EditDocSerie1", "passport"), ("EditDocNumber1", "passp_number")):
            if _t(f, ctl):
                s += f" and nvl(upper({col}),0) like upper(:b_{col})"; b[f"b_{col}"] = "%" + _t(f, ctl) + "%"
    for ctl, col in (("CBoxDocPlace2", "paspplace"), ("CBoxBirthState", "birthplace"), ("CBoxBirthCity", "BIRTH_STATE"),
                     ("CBoxAddressState", "adrs_state"), ("CBoxAddressCity", "adrs_city"), ("EditAddress", "adress "),
                     ("EditAddressFactical", "fakt_adress"), ("EditPhoneCity", "phone")):
        if _t(f, ctl):
            s += f" and nvl(upper({col}),0) like upper (:b_{ctl})"; b[f"b_{ctl}"] = "%" + _t(f, ctl) + "%"
    if f.get("Resident") in (1, "1"):
        s += " and nerezident=1"
    elif f.get("Resident") in (0, "0"):
        s += " and nerezident=0"
    s += {0: "and cust_type=0", 1: "and cust_phys =1", 2: "and cust_fs =1", 3: "and cust_type=3",
          4: "and cust_type =4", 5: "and cust_type =5"}.get(t, "")
    sql = set_line(sql, 8, s)
    return subst_title(sql, sort), b


def subst_title(sql, sort):
    from .delphi import subst
    return subst(sql, "title", sort if sort in GRID_SORT else "ID")


def search(conn, f: dict, sort="ID") -> list[dict]:
    sql, b = search_sql(f, sort)
    return rows(conn, sql, b, LIMIT)


# ------------------------------------------------------------------ selected customer (AfterScroll + MainGridDblClick)
def customer(conn, cid: int) -> dict | None:
    r = rows(conn, Q.DM["Ods_Customers_PhysFS_yoxlama"], {"id_yoxlama": cid})
    return r[0] if r else None


def detail(conn, cid: int, cust_type: int | None, radio1_visible: bool = False) -> dict:
    out = {"group_info": rows(conn, Q.DM["ods_cust_group_info"], {"v_custid": cid}),
           "bank_stetment": rows(conn, Q.DM["ods_bank_stetment"], {"v_custid": cid}),
           "notes": rows(conn, Q.DM["ods_cust_notes"], {"v_custid": cid})}
    poz = set_line(Q.DM["ODS_Pozition"], 1, " WHERE (a.custid = :b_id OR a.custid2 = :b_id)")
    out["pozition"] = rows(conn, poz, {"b_id": cid})
    if out["pozition"]:
        ids2 = sorted({p.get("CUSTID2") for p in out["pozition"] if p.get("CUSTID2") is not None})
        ids1 = sorted({p.get("CUSTID") for p in out["pozition"] if p.get("CUSTID") is not None})
        b = {"b_self": cid}
        n2 = ",".join(f":b2_{i}" for i in range(len(ids2))) or "null"
        n1 = ",".join(f":b1_{i}" for i in range(len(ids1))) or "null"
        b.update({f"b2_{i}": v for i, v in enumerate(ids2)}); b.update({f"b1_{i}": v for i, v in enumerate(ids1)})
        sql = Q.DM["ODS_custinfo"]
        sql = set_line(sql, 9, f" AND (IDCUST IN ({n2})")
        sql = set_line(sql, 10, f" OR IDCUST IN ({n1}))")
        sql = set_line(sql, 11, " AND IDCUST <>:b_self")
        out["related"] = rows(conn, sql, b)
    else:
        out["related"] = []
    out["tipacc"] = any((a.get("TIPACC") or "") != "" for a in rows(conn, Q.DM["ODS_account_tipacc"], {"id": cid}))
    if cust_type in (0, 1, 2):
        out["busproc"] = rows(conn, Q.DM["ODS_BusProc"], {"custtype": cust_type, "ids": str(cid), "sira": "id"})
    elif cust_type == 3 and not radio1_visible:
        out["busproc"] = rows(conn, Q.DM["ODS_BusProc"], {"custtype": 10, "ids": str(cid), "sira": "id"})
    else:
        out["busproc"] = rows(conn, Q.DM["ODS_BusProc"], {"custtype": None, "ids": None, "sira": "id"})
    c = customer(conn, cid)
    out["samely"] = samely_label(conn, c) if c else None
    imgs = rows(conn, Q.DM["DScustimage"], {"cust_id": cid})
    out["images"] = [k for k in ("PHOTO", "CUSTSIGN", "STAMP") if imgs and imgs[0].get(k)]
    return out


def samely_label(conn, c: dict) -> str | None:
    """MainGridDblClick pas:9097-9125 (LabelSamelyDate)"""
    if not c.get("SAMELYDATE"):
        return None
    descs = rows(conn, Q.DM["ODS_CUST_RISK_DESC"], {"id": c.get("RISK_CATEG")})
    d = next((x for x in descs if x.get("ID") == c.get("RISKDESCID")), descs[0] if descs else {})
    period = int(d.get("DATE_PERIOD") or 0)
    tek = rows(conn, Q.DM["ODS_SYSDATE"])
    if not tek:
        return None
    today = datetime.date.fromisoformat(str(tek[0]["TEK_DAT"])[:10])
    sd = datetime.date.fromisoformat(str(c["SAMELYDATE"])[:10])
    m = sd.month - 1 + period
    y, m = sd.year + m // 12, m % 12 + 1
    import calendar
    due = datetime.date(y, m, min(sd.day, calendar.monthrange(y, m)[1]))   # Delphi IncMonth
    if today == due:
        return "Bugün  eyniləşdirmə tarixidir !"
    if today > due:
        return "Eyniləşdirmə tarixi bitmişdir !"
    return None


# ------------------------------------------------------------------ MainGridDblClick pas:9034-9890 (row -> controls)
_FILL_ALWAYS = (   # control, field (Text / KeyValue assignments outside the cust_type case)
    ("EditID", "ID"), ("EditFirstName", "FIRSTNAME"), ("EditPatronymic", "PATRONYMIC"), ("EditLastName", "LASTNAME"),
    ("EditFullName", "CUST_NAME"), ("EditPINCode", "PASSPIN"), ("EditITN", "INN"), ("CBoxCitizenship", "CITIZENSHIP"),
    ("CBoxGender", "SEX"), ("CBoxFamStatus", "FAM_STATUS"), ("CBoxGroup", "GROUP_KLIE"), ("CBox", "VID_SOB"),
    ("Relation", "PRINAD_KOD"), ("CBoxDocType", "DOC_TYPE"), ("CBoxDocType1", "DOC_TYPE"), ("id_quality", "QUALITY_ID"),
    ("issue_country", "DOC_COUNTRY"), ("Comb_riskdescid", "RISKDESCID"), ("Citizenship2", "CITIZENSHIP2"),
    ("Citizenship3", "CITIZENSHIP3"), ("DBLookupComboBox1", "REZD_COUNTRY"), ("DBLookupComboBox2", "REZD_COUNTRY1"),
    ("DBLookupComboBox3", "REZD_COUNTRY2"), ("Eh1", "WORK_EXPERIENCE"), ("Eh2", "LAST_WORK_EXPERIENCE"),
    ("Eh3", "CATEGORY"), ("Edit2", "CUST_INVOLVEMENT"), ("Edit3", "FAMILY_NUMBER"), ("Fakt_Adrs_State", "FAKT_COUNTRY"),
    ("Fakt_Adrs_City", "FAKT_CITY"), ("ZipFakt", "FAKT_ZIP"), ("Work_Place", "WORK_PLACE"), ("Work_Post", "WORK_POST"),
    ("Work_Address", "WORK_ADRESS"), ("Work_Phone", "WORK_PHONE"), ("DBLC_INCORP_CNTR", "INCORPORATION_CNTR"),
    ("incor_number", "INCORPORATION_NUMBER"), ("DB_INCORP_STATE", "INCORPORATION_STATE"), ("Edit_reg_no", "STATE_REYESTER_NO"),
    ("gerdat", "REYESTER_DAT"), ("Edit_MONTHLYPROFIT", "MONTHLYPROFIT"), ("WORK_OTRASLI", "WORK_OTRASLI"),
    ("WORK_VID_SOB", "WORK_VID_SOB"), ("cust_compani", "COMPANI"), ("sfereday_kod", "SFERA_DEYCOD"),
    ("CBoxDocPlace2", "PASPPLACE"), ("EditShort_name", "SHORT_NAME"), ("EditDocSerie", "PASSPORT"),
    ("EditDocNumber", "PASSP_NUMBER"), ("MemoNotes", "NOTE"), ("DocDate", "PASPDATE"), ("DocExpiryDate", "PASSEXPIRE"),
    ("BirthDate", "BIRTHDATE"), ("Dtp_Ustav", "DAT_USTAV"), ("Dpt_Nal", "DAT_NAL"), ("CBoxBirthState", "BIRTHPLACE"),
    ("CBoxBirthCity", "BIRTH_STATE"), ("CBoxAddressState", "ADRS_STATE"), ("CBoxAddressCity", "ADRS_CITY"),
    ("EditAddress", "ADRESS"), ("EditAddressFactical", "FAKT_ADRESS"), ("EditPhoneMob", "PHONE_MOB"),
    ("EditPhoneCity", "PHONE"), ("Edit_activity", "ACTIVITY"), ("Edit_profession", "PROFESSION"),
    ("source_of_income", "SOURCE_OF_INCOME"), ("par1", "PAR1"), ("par2", "PAR2"), ("edit4", "PAR3"),
    ("samelydate", "SAMELYDATE"), ("iflas", "IFLAS"), ("idxal", "IMPORT_EXPORT"), ("finance", "FINANCIAL_STATEMENT"),
    ("BankKard", "BANK_CARD"), ("borrower_occupation", "BORROWER_OCCUPATION"), ("borrower_bad", "BORROWER_BAD"),
    ("ReportingDate", "REPORTINGDATE"), ("ReportType", "REPORTTYPE"), ("Revenue", "REVENUE"), ("Ebitda", "EBITDA"),
    ("Ebit", "EBIT"), ("InterestExpences", "INTERESTEXPENCES"), ("NetProfit", "NETPROFIT"), ("TotalAssets", "TOTALASSETS"),
    ("TotalAssetsForeignCurrency", "TOTALASSETSFOREIGNCURRENCY"),
    ("TotalLiabilitiesForeignCurrency", "TOTALLIABILITIESFOREIGNCURR"),
    ("InterestExpenceLiabilities", "INTERESTEXPENCELIABILITIES"), ("TotalLiabilities", "TOTALLIABILITIES"),
    ("ForeignInterestExpenceLiabilities", "FOREIGNINTERESTEXPENCE"), ("TotalCapital", "TOTALCAPITAL"),
    ("InsolvencyStatus", "INSOLVENCYSTATUS"), ("Isoplost", "ISOPLOST"), ("Edit_work_inn", "WORK_INN"),
    ("Edit_Income", "INCOME"), ("Income_cur", "INCOME_CUR"), ("Eh5", "ISFOREIGNECOOP"), ("Eh6", "IMPORTEXPORTCODE"),
    ("OrganizationTypeCB", "ORG_SOB"), ("ActionAreaCB", "SFERA_DEY"), ("BranchCB", "OTRASL"), ("TaXAreaCB", "NALOG_KOD"),
)
_FILL_JUR = (("ComboBox_risk", "RISK_CATEG"), ("Address_type", "ADDRESS_TYPE"), ("tph_contact_type", "TPH_CONTACT_TYPE"),
             ("tph_communication_type", "TPH_COMMUNICATION_TYPE"), ("CountryByConctType", "COUNTRY_CODE_CUST"),
             ("CityByConctType", "CITY_CUST"), ("tph_country_prefix", "TPH_COUNTRY_PREFIX"), ("Db_tph_number", "TPH_NUMBER"),
             ("db_tph_adress", "ADDRESS_CUST"), ("Edit_url", "URL_CUST"), ("Db_tph_extension", "TPH_EXTENSION"),
             ("DB_tph_zip", "TPH_ZIP"), ("db_tph_state", "TPH_STATE"))
_FILL_PHYS = (("ComboBox_risk", "CUST_RISK_CATEG"), ("tph_contact_type", "INFO_TPH_CONTACT_TYPE"),
              ("CountryByConctType", "INFO_TPH_COUNTRY"), ("CityByConctType", "INFO_TPH_CITY"),
              ("tph_country_prefix", "INFO_TPH_COUNTRY_PREFIX"), ("tph_communication_type", "INFO_TPH_COMMUNICATION_TYPE"),
              ("Address_type", "INFO_CONTACT_TYPE"), ("fakt_adress_owner", "FAKT_ADRESS_OWNER"),
              ("CountryCode", "INFO_TPH_COUNTRY_PREFIX"), ("db_tph_state", "INFO_TPH_STATE"), ("DB_tph_zip", "INFO_TPH_ZIP"),
              ("db_tph_adress", "INFO_TPH_ADRESS"), ("Db_tph_number", "INFO_TPH_NUMBER"),
              ("Db_tph_extension", "INFO_TPH_EXTENSION"), ("Edit_url", "URL"))


def fill(c: dict) -> dict:
    """Control values after MainGridDblClick; the cust_type case picks the jur (0) or info_* (else) contact fields."""
    t = int(c.get("CUST_TYPE") or 0)
    f = {k: c.get(col) for k, col in _FILL_ALWAYS}
    f.update({k: c.get(col) for k, col in (_FILL_JUR if t == 0 else _FILL_PHYS)})
    mail = str(c.get("EMAIL_CUST" if t == 0 else "EMAIL") or "")
    i = mail.find("@")                                     # copy(s, 0, pos('@')-1) / copy(s, pos('@')+1, ..): pos=0 -> '' / s
    f["EditEmail"], f["Edit1"] = mail[:max(i, 0)], mail[i + 1:]
    nr = c.get("NEREZIDENT")
    f["Resident"] = 1 if nr in (1, "1") else 0 if nr in (0, "0") else None
    f["type"] = t
    # OnChange mirrors (pas:3592-3607, 3817-3822, 4862/4892, 3659): the tab-0 edits follow the detail edits
    for a, b in MIRROR:
        f[a] = f.get(b)
    return {k: ("" if v is None else v) for k, v in f.items()}


MIRROR = (("EditPINCode1", "EditPINCode"), ("EditDocSerie1", "EditDocSerie"), ("EditDocNumber1", "EditDocNumber"),
          ("CBoxDocType1", "CBoxDocType"), ("Edit10", "EditFullName"))


# ------------------------------------------------------------------ validation
def fin_bad(serie: str, pin: str) -> bool:
    """pas:1856-1863 (MY/DY branch kept verbatim: both length tests on the same field)"""
    n = len(pin)
    return ((serie[:3] == "AZE" and n != 7) or (serie[:2] == "AA" and n != 7)
            or (serie[:2] == "MY" and n != 5 and n != 6) or (serie[:2] == "DY" and n != 5 and n != 6))


def _dup(conn, kind, val, *extra):
    return conn.call_func(PKG, "get_Add_cust_yoxlama", [kind, val, *extra], int)


def _empty(f, k):
    return _t(f, k).strip() == "" if k not in SEL_KEYS else _sel(f, k) is None


SEL_KEYS = set(COMBOS) | {"Dtp_Ustav", "Dpt_Nal", "samelydate", "BirthDate", "DocDate", "DocExpiryDate"}


def continue_check(conn, f: dict, req: dict) -> dict:
    """XFBitcontinueClick pas:10289 - step 1 of add (Davam et)."""
    t = f.get("type1")
    if t is None or t == -1:
        raise Msg(get_message(conn, 1, "cust_type"))
    itn, pin, ser, num = _t(f, "EditITN"), _t(f, "EditPINCode1"), _t(f, "EditDocSerie1"), _t(f, "EditDocNumber1")
    if t == 0:
        if req[12] and itn == "":
            raise Msg(M["inn_empty"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    elif t in (1, 4):
        if req[92] and pin == "":
            raise Msg(M["pin_empty"])
        if req[92] and pin == num:
            raise Msg(M["pin_eq_doc"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    elif t == 2:
        if req[12] and itn == "":
            raise Msg(M["inn_empty2"])
        if req[92] and pin == "":
            raise Msg(M["pin_empty3"])
        if (req[12] or req[92]) and pin == itn:
            raise Msg(M["pin_eq_inn"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    if itn != "":
        a = _dup(conn, "p_inn", itn)
        if a != -1:
            raise Msg(M["dup_inn_c"].format(n=a, v=itn))
    if pin != "":
        b = _dup(conn, "p_passpin", pin)
        if b != -1:
            raise Msg(M["dup_pin"].format(n=b, v=pin))
    if req[41] and req[42] and f.get("Resident") not in (0, 1, "0", "1"):
        raise Msg(M["resident"])
    if req[8] and f.get("doc_enabled", True):
        if ser == "" or num == "":
            raise Msg(M["doc_sn_c"])
        c = _dup(conn, "p_passer_panum", ser + num, f.get("CBoxDocType1"))
        if c != -1:
            raise Msg(M["dup_doc_c"].format(n=c, s=ser, d=num))
    resident = f.get("Resident") in (1, "1")
    tab = "TabSheet13" if t == 5 else "TabSheet8" if t == 0 else "TabSheet1"
    return {"ok": True, "type": t, "tab": tab, "pep": t in (0, 1, 2), "resident": resident}


def _jur_checks(conn, f, req, edit):
    if req[24] and _empty(f, "EditFullName"):
        raise Msg(get_message(conn, 2, "cust_İnsname"))
    if req[62] and _sel(f, "DBLC_INCORP_CNTR") is None:
        raise Msg(M["incorp_cntr"])
    if req[67] and _empty(f, "incor_number"):
        raise Msg(M["incorp_no_e" if edit else "incorp_no"])
    if req[66] and _empty(f, "Dtp_Ustav"):
        raise Msg(M["ustav"])
    if req[101] and _empty(f, "Dpt_Nal"):
        raise Msg(M["dvm"])
    if req[90] and _sel(f, "ComboBox_risk") is None:
        raise Msg(M["risk"])
    if req[95] and _sel(f, "Comb_riskdescid") is None:
        raise Msg(M["riskdesc"])
    if req[96] and _empty(f, "samelydate"):
        raise Msg(M["samely_e" if edit else "samely"])
    if not edit:
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
        if _sel(f, "Eh2") is None:
            raise Msg(M["bolgu"])
    if req[122] and _sel(f, "sfereday_kod") is None:
        raise Msg(M["sfera_kod"])
    if req[121] and _sel(f, "cust_compani") is None:
        raise Msg(M["compani_e" if edit else "compani"])
    _contact_checks(f, req, "addr_type_l" if edit else "addr_type")


def _contact_checks(f, req, first):
    for n, k, m in ((54, "Address_type", first), (25, "CountryByConctType", "c_country"),
                    (55, "CityByConctType", "c_city"), (56, "db_tph_adress", "c_addr"),
                    (58, "tph_contact_type", "c_tph_ct"), (59, "tph_communication_type", "c_tph_comm"),
                    (60, "Db_tph_number", "c_number")):
        if req[n] and _empty(f, k):
            raise Msg(M[m])


def _phys_checks(conn, f, req, edit):
    t = f.get("type")
    if req[11] and _empty(f, "EditLastName"):
        raise Msg(get_message(conn, 3, "custinfo_inslastname"))
    if req[9] and _empty(f, "EditFirstName"):
        raise Msg(get_message(conn, 4, "custinfo_İnsname"))
    if req[10] and f.get("Resident") not in (0, "0") and _empty(f, "EditPatronymic"):
        raise Msg(get_message(conn, 5, "custinfo_İnsasoname"))
    if req[118] and _sel(f, "CBoxGender") is None:
        raise Msg(M["sex"])
    if req[119] and _sel(f, "CBoxFamStatus") is None:
        raise Msg(M["fam"])
    if req[86] and _sel(f, "CBoxCitizenship") is None:
        raise Msg(M["citizen"])
    if req[90] and _sel(f, "ComboBox_risk") is None:
        raise Msg(M["risk_e" if edit else "risk"])
    if req[95] and _sel(f, "Comb_riskdescid") is None:
        raise Msg(M["riskdesc" if edit else "riskdesc_p"])
    if req[96] and _empty(f, "samelydate"):
        raise Msg(M["samely_e" if edit else "samely"])
    if not edit:
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
        if t in (0, 2) and _sel(f, "Eh2") is None:
            raise Msg(M["bolgu"])
    if req[122] and _sel(f, "sfereday_kod") is None:
        raise Msg(M["sfera_kod"])
    if req[121] and _sel(f, "cust_compani") is None:
        raise Msg(M["compani_e" if edit else "compani_p"])
    for n, k, m in ((81, "CBoxBirthState", "birth_cntr"), (82, "CBoxBirthCity", "birth_city"),
                    (97, "BirthDate", "birth_date_e" if edit else "birth_date"), (83, "CBoxAddressState", "reg_cntr"),
                    (84, "CBoxAddressCity", "reg_city"), (80, "EditAddress", "reg_addr"),
                    (68, "Fakt_Adrs_State", "fakt_cntr"), (69, "Fakt_Adrs_City", "fakt_city"),
                    (28, "EditAddressFactical", "fakt_addr")):
        if req[n] and _empty(f, k):
            raise Msg(M[m])
    if (req[87] if edit else (req[8] or req[26])) and _sel(f, "CBoxDocType") is None:
        raise Msg(M["doc_type"])
    for n, k, m in ((75, "issue_country", "doc_cntr"), (85, "CBoxDocPlace2", "doc_place"),
                    (98, "DocDate", "doc_date"), (99, "DocExpiryDate", "doc_exp")):
        if req[n] and _empty(f, k):
            raise Msg(M[m])
    _contact_checks(f, req, "addr_type_l")
    if req[127] and (_empty(f, "EditEmail") or _empty(f, "Edit1")):
        raise Msg(M["email"])


def _common_checks(f, req):
    for n, k, m in ((115, "Work_Place", "work_place"), (116, "Work_Post", "work_post"),
                    (117, "Work_Address", "work_addr"), (104, "WORK_VID_SOB", "work_vid"),
                    (105, "WORK_OTRASLI", "work_otr"), (112, "Edit_activity", "activity"),
                    (113, "Edit_profession", "profession"), (114, "source_of_income", "income_src")):
        if req[n] and _empty(f, k):
            raise Msg(M[m])
    if _t(f, "EditPhoneCity") == "":
        raise Msg(M["phone_h"])
    if req[128] and len(_t(f, "EditPhoneMob").replace("-", "").replace(" ", "")) < 9:
        raise Msg(M["phone_m"])


def validate_add(conn, f: dict, req: dict) -> None:
    """CustAdd pas:1660-2700, checks in Delphi order (every failing check is ShowMessage + Exit)."""
    t1, t = f.get("type1"), f.get("type")
    if t1 is None or t1 == -1:
        raise Msg(get_message(conn, 1, "cust_type"))
    itn, pin, ser = _t(f, "EditITN"), _t(f, "EditPINCode1"), _t(f, "EditDocSerie1")
    if t == 0 and req[12] and itn == "":
        raise Msg(M["inn_empty"])
    if t in (1, 4):
        if req[92] and pin == "":
            raise Msg(M["pin_empty"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
    if t == 2:
        if req[12] and itn == "":
            raise Msg(M["inn_empty2"])
        dt = _doctype(conn, f.get("CBoxDocType1"))
        if dt and int(dt.get("PINCODFORCED") or 0) == 1 and req[92] and pin == "":
            raise Msg(M["pin_empty2"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
    if (req[41] or req[42]) and f.get("Resident") not in (0, 1, "0", "1"):
        raise Msg(M["resident"])
    if t == 0:
        _jur_checks(conn, f, req, False)
    elif t in (1, 2, 3, 4):
        _phys_checks(conn, f, req, False)
    _common_checks(f, req)
    _doc_main_checks(f, req)
    num = _t(f, "EditDocNumber1")
    if ser + num != "":
        c = _dup(conn, "p_passer_panum", ser + num, f.get("CBoxDocType1"))
        if c != -1:
            raise Msg(M["dup_doc_a"].format(n=c, s=ser, d=num))
    if pin != "":
        b = _dup(conn, "p_passpin", pin)
        if b != -1:
            raise Msg(M["dup_pin"].format(n=b, v=pin))
    if itn != "":
        a = _dup(conn, "p_inn", itn)
        if a != -1:
            raise Msg(M["dup_inn"].format(n=a, v=itn))
    if t == 3:
        raise Msg(M["add_phys_fs"])


def _doc_main_checks(f, req):
    if req[8] or req[87]:
        if f.get("doc_enabled", True) and _t(f, "EditDocSerie") == "":
            raise Msg(M["doc_sn"])
        if f.get("doc_enabled", True) and _t(f, "EditDocNumber").strip() == "":
            raise Msg(M["doc_sn"])


def _doctype(conn, did):
    if did in (None, "", -1):
        return None
    return next((d for d in rows(conn, Q.DM["OdsDoctaypes"]) if str(d.get("ID")) == str(did)), None)


def validate_edit(conn, f: dict, req: dict, row_: dict | None, convert_nominal: bool) -> None:
    """CustEdit1Click pas:5273-6270"""
    conn.call_proc("SB_ACA", "CheckObjectAccess", ["PCUSTSERVICE", "update"], commit=False)
    if not row_:
        raise Msg(M["none_selected"])
    t, rt = f.get("type"), int(row_.get("CUST_TYPE") or 0)
    if rt == 3 and t != 3:
        raise Msg(M["phys_fs_conv"])
    if rt == 4 and not convert_nominal and t in (0, 1, 2, 3):
        raise Msg(get_message(conn, 6, "edit_Nom_Cust"))
    if rt in (0, 1, 2, 3) and t == 4:
        raise Msg(get_message(conn, 7, "edit_cust_nom"))
    if t is None or t == -1:
        raise Msg(get_message(conn, 1, "cust_type"))
    itn, pin, ser, num = _t(f, "EditITN"), _t(f, "EditPINCode1"), _t(f, "EditDocSerie1"), _t(f, "EditDocNumber1")
    if t == 0:
        if req[12] and itn == "":
            raise Msg(M["inn_empty"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    elif t in (1, 4):
        if req[92] and pin == "":
            raise Msg(M["pin_empty"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    elif t == 2:
        if req[12] and itn == "":
            raise Msg(M["inn_empty2"])
        if req[92] and pin == "":
            raise Msg(M["pin_empty2"])
        if fin_bad(ser, pin):
            raise Msg(M["fin"])
        if _sel(f, "Eh3") is None:
            raise Msg(M["category"])
    old = customer(conn, int(row_["ID"])) or {}
    if itn != (old.get("INN") or "") and itn != "":
        a = _dup(conn, "p_inn", itn)
        if a != -1:
            raise Msg(M["dup_inn"].format(n=a, v=itn))
    if pin != (old.get("PASSPIN") or "") and pin != "":
        b = _dup(conn, "p_passpin", pin)
        if b != -1:
            raise Msg(M["dup_pin_e"].format(n=b, v=pin))
    if ser != (old.get("PASSPORT") or "") and num != (old.get("PASSP_NUMBER") or "") and f.get("doc_enabled", True):
        if ser.strip() == "" or num.strip() == "":
            raise Msg(M["doc_sn"])
        c = _dup(conn, "p_passer_panum", ser + num, f.get("CBoxDocType1"))
        if c != -1:
            raise Msg(M["dup_doc"].format(n=c, s=ser, d=num))
    _doc_main_checks(f, req)
    if t == 0:
        _jur_checks(conn, f, req, True)
    elif t in (1, 2, 3, 4):
        _phys_checks(conn, f, req, True)
    _common_checks(f, req)


# ------------------------------------------------------------------ gather (CustAdd / CustEdit1Click)
def _date(v):
    if v in (None, ""):
        return None
    return datetime.datetime.fromisoformat(str(v)[:10])


def _nz(v, default=0):
    return default if v in (None, "", -1, "-1") else v


def _s(v):
    return None if v in (None, "") else v


def gather(conn, f: dict, edit: bool, row_: dict | None, today: datetime.datetime) -> dict:
    t = f.get("type")
    txt = f.get("txt") or {}
    p: dict[str, Any] = {k: None for k in Q.EDIT_PARAMS}
    email = _t(f, "EditEmail") + "@" + _t(f, "Edit1")
    if edit:
        p["c_name"] = txt.get("grop", "") if t == 5 else _t(f, "EditFullName")
        p["c_id"] = int(row_["ID"])
    elif f.get("type1") == 5:
        p["c_name"] = txt.get("grop", "")
    else:
        p["c_name"] = _t(f, "EditFullName") or (_t(f, "EditLastName") + " " + _t(f, "EditFirstName") + " "
                                                 + _t(f, "EditPatronymic"))
    p["c_short_name"] = _t(f, "EditShort_name")
    p["c_inn"] = _t(f, "EditITN") if t != 1 else ""
    p["c_group_klie"] = _nz(f.get("CBoxGroup"))
    p["c_nerezident"] = 1 if f.get("Resident") in (1, "1") else 0 if f.get("Resident") in (0, "0") else (None if edit else 1)
    p["c_vid_sob"] = _nz(f.get("CBox"))
    p["c_prinad_kod"] = _nz(f.get("Relation"))
    ct = {0: (0, 1, "", ""), 1: (1, "", 1, ""), 2: (2, "", "", 1), 3: (3, "", 1, 1), 4: (4, "", "", ""),
          5: (5, "", "", "")}[t]
    p["c_cust_type"], p["c_cust_jur"], p["c_cust_phys"], p["c_cust_fs"] = (ct[0],) + tuple(_s(x) for x in ct[1:])
    if edit and row_ and int(row_.get("CUST_PHYS") or 0) == 1 and row_.get("CUST_FS") in (None, "") and t == 2:
        p["c_cust_phys"], p["c_cust_fs"], p["c_cust_type"] = 1, 1, 3
    p["c_bik"] = ""                      # EditBic is Visible=False (never filled)
    p["c_riskdescid"] = _nz(f.get("Comb_riskdescid"))
    p["c_samelydate"] = _date(f.get("samelydate"))
    p["c_category"] = _nz(f.get("Eh3"))
    p["d_name"], p["d_soname"], p["d_lastname"] = _t(f, "EditFirstName"), _t(f, "EditPatronymic"), _t(f, "EditLastName")
    p["d_birthday"] = _date(f.get("BirthDate"))
    p["d_birthplace"] = _s(f.get("CBoxBirthState")) or ""
    p["d_fam_status"] = _nz(f.get("CBoxFamStatus"))
    p["d_address"], p["d_fakt_adress"] = _t(f, "EditAddress"), _t(f, "EditAddressFactical")
    p["d_phone_h"], p["d_phone_m"] = _t(f, "EditPhoneCity"), _t(f, "EditPhoneMob")
    p["d_sex"] = _nz(f.get("CBoxGender"))
    doc_en = f.get("doc_enabled", True)
    p["d_passer"] = _t(f, "EditDocSerie") if doc_en else ""
    p["d_paspnum"] = _t(f, "EditDocNumber") if doc_en else ""
    p["d_adrs_state"] = _s(f.get("CBoxAddressState")) or ""
    p["d_city"] = _s(f.get("CBoxAddressCity"))
    p["d_doc_type"] = _nz(f.get("CBoxDocType")) if doc_en else 0
    p["d_birth_state"] = _s(f.get("CBoxBirthCity"))
    p["d_paspdate"], p["d_passexpire"] = _date(f.get("DocDate")), _date(f.get("DocExpiryDate"))
    p["d_paspplace"] = _t(f, "CBoxDocPlace2")
    p["d_passPIN"] = _t(f, "EditPINCode") if t != 0 else ""
    p["d_note"] = _t(f, "MemoNotes")
    p["d_citizenship"] = _nz(f.get("CBoxCitizenship"))
    p["d_rescount"], p["d_rescount1"], p["d_rescount2"] = (_nz(f.get("DBLookupComboBox1")), _nz(f.get("DBLookupComboBox2")),
                                                           _nz(f.get("DBLookupComboBox3")))
    p["d_work_experience"] = txt.get("Eh1", "") if _sel(f, "Eh1") is not None else ""
    p["d_last_work_experience"] = _sel(f, "Eh2") or ""
    p["d_family_number"] = int(_t(f, "Edit3")) if _t(f, "Edit3") else 0
    p["d_cust_involvement"] = _t(f, "Edit2")
    p["c_org_sob"], p["c_sfera_dey"] = _nz(f.get("OrganizationTypeCB")), _nz(f.get("ActionAreaCB"))
    p["c_otrasl"], p["c_nalog_kod"] = _nz(f.get("BranchCB")), _nz(f.get("TaXAreaCB"))
    p["d_doc_country"] = _s(f.get("issue_country"))
    p["d_citizenship2"], p["d_citizenship3"] = _nz(f.get("Citizenship2")), _nz(f.get("Citizenship3"))
    p["d_fakt_country"] = _nz(f.get("Fakt_Adrs_State")) if not edit else _s(f.get("Fakt_Adrs_State"))
    p["d_fakt_city"] = _s(f.get("Fakt_Adrs_City"))
    p["d_fakt_zip"] = _t(f, "ZipFakt")
    for k, c in (("d_work_place", "Work_Place"), ("d_work_post", "Work_Post"), ("d_work_adress", "Work_Address"),
                 ("d_work_phone", "Work_Phone"), ("d_activity", "Edit_activity"), ("d_profession", "Edit_profession")):
        p[k] = _t(f, c)
    p["c_dat_ustav"], p["c_dpt_nal"] = _date(f.get("Dtp_Ustav")), _date(f.get("Dpt_Nal"))
    p["c_incorporation_number"] = _t(f, "incor_number")   # add: always incor_number (pas:2985 overwrites); edit: below
    if edit and t == 5:
        p["c_incorporation_number"] = _t(f, "Edit_grop_name")
    contact = {"tph_contact_type": _s(f.get("tph_contact_type")), "tph_communication_type": _s(f.get("tph_communication_type")),
               "tph_number": _t(f, "Db_tph_number"), "address_type": _s(f.get("Address_type")),
               "address": _t(f, "db_tph_adress"), "city": _s(f.get("CityByConctType")),
               "country": _s(f.get("CountryByConctType")), "extension": _t(f, "Db_tph_extension"),
               "zip": _t(f, "DB_tph_zip"), "prefix": _s(f.get("tph_country_prefix")), "state": _t(f, "db_tph_state")}
    p.update(c_tph_contact_type=contact["tph_contact_type"], c_tph_communication_type=contact["tph_communication_type"],
             c_tph_number=contact["tph_number"], c_address_type=contact["address_type"], c_address=contact["address"],
             c_city=contact["city"], c_country_code=contact["country"], c_email=email, c_url=_t(f, "Edit_url"),
             c_incorporation_state=_t(f, "DB_INCORP_STATE"), c_incorporation_cntr=_s(f.get("DBLC_INCORP_CNTR")),
             c_tph_extension=contact["extension"], c_tph_zip=contact["zip"], c_tph_country_prefix=contact["prefix"],
             c_tph_state=contact["state"],
             d_tph_contact_type=contact["tph_contact_type"], d_tph_country=contact["country"],
             d_tph_country_code=_t(f, "CountryCode"), d_tph_city=contact["city"], d_tph_state=contact["state"],
             d_tph_zip=contact["zip"], d_tph_country_prefix=contact["prefix"], d_tph_adress=contact["address"],
             d_tph_communication_type=contact["tph_communication_type"], d_tph_number=contact["tph_number"],
             d_tph_extension=contact["extension"], d_contact_type=contact["address_type"], d_e_mail=email,
             d_url=_t(f, "Edit_url"))
    p["d_source_of_income"] = _s(f.get("source_of_income"))
    p["par1"], p["par2"], p["par3"] = _s(f.get("par1")), _s(f.get("par2")), _t(f, "edit4")
    for k in ("c_faktor_muq", "c_faktor_accno", "c_faktor_bank", "c_faktor_bankkod", "c_faktor_muxaccno", "c_faktor_swift"):
        p[k] = ""                        # Panel_BsProc faktor_* edits are Visible=False
    p["c_faktor_opendat"] = None
    p["c_NAME_QUALITY"] = txt.get("id_quality", "")
    p["c_id_quality"] = p["d_quality_id"] = _nz(f.get("id_quality"))
    p["d_fakt_adress_owner"] = _nz(f.get("fakt_adress_owner"))
    # ---- after the confirmation (both paths)
    if t == 0:
        p["c_risk_categ"], p["d_risk_categ"] = _nz(f.get("ComboBox_risk")), ""
        if not edit:
            p["c_reyester_dat"], p["c_state_reyester_no"] = _date(f.get("gerdat")), _t(f, "Edit_reg_no")
        else:
            p["c_reyester_dat"], p["c_state_reyester_no"] = _date(f.get("gerdat")), _t(f, "Edit_reg_no")
        for k in ("d_tph_contact_type", "d_tph_country", "d_tph_country_code", "d_tph_city", "d_tph_state", "d_tph_zip",
                  "d_tph_country_prefix", "d_tph_adress", "d_tph_communication_type", "d_tph_number", "d_tph_extension",
                  "d_contact_type", "d_e_mail", "d_url"):
            p[k] = ""
    elif t in (1, 2, 3, 4):
        mp = _t(f, "Edit_MONTHLYPROFIT")
        p["d_MONTHLYPROFIT"] = mp if mp else (0 if edit else -1)
        p["d_risk_categ"], p["c_risk_categ"] = _nz(f.get("ComboBox_risk")), ""
        p["d_WORK_OTRASLI"], p["d_WORK_VID_SOB"] = _s(f.get("WORK_OTRASLI")), _s(f.get("WORK_VID_SOB"))
        for k in ("c_bik", "c_state_reyester_no", "c_incorporation_number", "c_tph_contact_type",
                  "c_tph_communication_type", "c_tph_number", "c_address_type", "c_address", "c_city", "c_country_code",
                  "c_email", "c_url", "c_incorporation_state", "c_incorporation_cntr", "c_tph_extension", "c_tph_zip",
                  "c_tph_country_prefix", "c_tph_state"):
            p[k] = ""
        p["c_reyester_dat"] = None
    p["c_compani"] = _s(f.get("cust_compani")) if _sel(f, "cust_compani") is not None else -1
    p["c_sfereday_kod"] = _s(f.get("sfereday_kod")) if _sel(f, "sfereday_kod") is not None else -1
    p["d_iflas"] = txt.get("iflas", "") if _sel(f, "iflas") is not None else ""
    p["d_import_export"] = _s(f.get("idxal")) or ""
    p["d_financial_statement"] = _s(f.get("finance")) or ""
    p["d_bank_card"] = _s(f.get("BankKard")) or ""
    p["d_borrower_occupation"] = _s(f.get("borrower_occupation")) or ""
    p["d_borrower_bad"] = txt.get("borrower_bad", "") if _sel(f, "borrower_bad") is not None else ""
    p["d_ReportingDate"] = _date(f.get("ReportingDate")) or ""
    p["d_ReportType"] = _s(f.get("ReportType")) or ""
    for k in ("Revenue", "Ebitda", "Ebit", "InterestExpences", "InterestExpenceLiabilities", "NetProfit", "TotalAssets",
              "TotalAssetsForeignCurrency", "TotalLiabilitiesForeignCurrency", "TotalLiabilities",
              "ForeignInterestExpenceLiabilities", "TotalCapital"):
        p["d_" + k] = _t(f, k) or 0
    p["d_insolvencyStatus"] = _s(f.get("InsolvencyStatus")) or ""
    p["d_isoplost"] = _s(f.get("Isoplost")) or ""
    p["d_work_inn"] = _t(f, "Edit_work_inn")
    p["d_Income_cur"] = _s(f.get("Income_cur")) or ""
    p["d_IsForeignEcoOp"] = _s(f.get("Eh5")) or ""
    p["d_ImportExportCode"] = _s(f.get("Eh6")) or ""
    p["d_Income"] = _t(f, "Edit_Income")
    p["date"] = today
    return p


def blacklist(conn, p: dict) -> str:
    if p["c_cust_type"] == 0:
        return conn.call_func(PKG, "GET_WORLD_YOXLAMA", [p["c_name"].strip(), None], str) or ""
    return conn.call_func(PKG, "GET_WORLD_YOXLAMA", [p["d_lastname"].strip() + " " + p["d_name"].strip() + " "
                                                     + p["d_soname"].strip(), p["d_birthday"]], str) or ""


def save(conn, f: dict, edit: bool, row_: dict | None, confirm: bool, black_ok: bool, convert_nominal=False) -> dict:
    t = f.get("type")
    req = required_flags(conn, t)
    if edit:
        validate_edit(conn, f, req, row_, convert_nominal)
    else:
        validate_add(conn, f, req)
    if not confirm:
        raise Msg(M["confirm_edit" if edit else "confirm_add"], "confirm")
    today = conn.call_func("SBOP", "get_date", [], datetime.datetime) if not edit else None
    p = gather(conn, f, edit, row_, today)
    black = blacklist(conn, p)
    if black and not black_ok:
        raise Msg(M["black"].format(b=black), "black")
    names = Q.EDIT_PARAMS if edit else Q.ADD_PARAMS
    conn.call_proc(PKG, "edit_customers_prosess" if edit else "add_customers_prosess", [p[n] for n in names])
    return {"ok": True}


# ------------------------------------------------------------------ router
class Body(BaseModel):
    f: dict = Field(default_factory=dict)
    confirm: bool = False
    black_ok: bool = False
    row_id: int | None = None
    convert_nominal: bool = False
    sort: str = "ID"


class RelBody(BaseModel):
    custid: int
    custid2: int | None = None
    kind: int = 1          # ins_elaqe: 1 relation (ODS_Pozition), 2 bank statement, 3 group


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/custservice")
    guard = require_module(CLSID)

    def run(fn):
        try:
            return fn()
        except Msg as m:
            return {"ok": False, "kind": m.kind, "msg": m.text, **m.extra}

    @r.get("/init")
    def _init(ws=Depends(guard)):
        c = ws.conn
        return {"comp": comp_flags(c), "req": required_flags(c, None), "lookups": lookups(c),
                "required_by_type": {t: required_flags(c, t) for t in (0, 5)}}

    @r.get("/lookup/{name}")
    def _lookup(name: str, value: str | None = None, cust_type: int | None = None, ws=Depends(guard)):
        if name in DEPENDENT:
            return dependent(ws.conn, name, value)
        if name in ("EstateTypeData", "Ods_WORK_VID_SOB"):
            return rows(ws.conn, _lookup_sql(name, cust_type))
        err(404, "error.generic")

    @r.get("/required")
    def _req(cust_type: int | None = None, ws=Depends(guard)):
        return required_flags(ws.conn, cust_type)

    @r.get("/months")
    def _months(risk: int, ws=Depends(guard)):
        m = {1: 24, 2: 12, 3: 6}.get(risk)            # ComboBox_riskCloseUp pas:4916
        return {"dat": months_from_sysdat(ws.conn, m) if m else None}

    @r.post("/search")
    def _search(b: Body, ws=Depends(guard)):
        rs = search(ws.conn, b.f, b.sort)
        return {"rows": rs, "msg": M["no_rows"] if not rs else None}

    @r.get("/cust/{cid}")
    def _cust(cid: int, radio1_visible: bool = False, ws=Depends(guard)):
        c = customer(ws.conn, cid)
        if not c:
            err(404, "error.generic")
        return {"row": c, "f": fill(c), **detail(ws.conn, cid, int(c.get("CUST_TYPE") or 0), radio1_visible)}

    @r.post("/continue")
    def _cont(b: Body, ws=Depends(guard)):
        return run(lambda: continue_check(ws.conn, b.f, required_flags(ws.conn, b.f.get("type1"))))

    @r.post("/add")
    def _add(b: Body, ws=Depends(guard)):
        return run(lambda: save(ws.conn, b.f, False, None, b.confirm, b.black_ok))

    @r.post("/edit")
    def _edit(b: Body, ws=Depends(guard)):
        row_ = customer(ws.conn, b.row_id) if b.row_id else None
        return run(lambda: save(ws.conn, b.f, True, row_, b.confirm, b.black_ok, b.convert_nominal))

    @r.post("/close/{cid}")
    def _close(cid: int, confirm: bool = False, ws=Depends(guard)):
        # CustClose1Click: Format(GetMessage[10,'close_cust'], ['c_id']) then close_customers_prosess
        if not confirm:
            txt = get_message(ws.conn, 10, "close_cust")
            return {"ok": False, "kind": "confirm", "msg": txt.replace("%s", "c_id")}
        ws.conn.call_proc(PKG, "close_customers_prosess", [cid])
        return {"ok": True}

    @r.post("/nominal/{cid}")
    def _nominal(cid: int, radio: int, confirm: bool = False, ws=Depends(guard)):
        # XFBitBtn2Click: radio 4 -> GetMessage[8]; else confirm GetMessage[9] then CustEdit with ConvertNominalToCust
        if radio == 4:
            return {"ok": False, "kind": "msg", "msg": get_message(ws.conn, 8, "Nom_Cust")}
        return {"ok": False, "kind": "confirm", "msg": get_message(ws.conn, 9, "nom_cust_insert")}

    @r.post("/rel")
    def _rel(b: RelBody, ws=Depends(guard)):
        # FormCustomers.XFButton1Click: ins_elaqe 1 add_cust_relations, 2 add_bank_stetment, 3 add_cust_grop
        proc = {1: "add_cust_relations", 2: "add_bank_stetment", 3: "add_cust_grop"}.get(b.kind)
        if not proc or b.custid2 is None:
            err(400, "error.generic")
        ws.conn.call_proc(PKG, proc, [b.custid, b.custid2])
        return {"ok": True}

    @r.post("/rel/delete")
    def _rel_del(b: RelBody, confirm: bool = False, ws=Depends(guard)):
        # XFButton19Click (relations: del_customers_relations [custid2]) / XFButton10Click (bank statement) / XFButton9Click (group)
        if not confirm:
            return {"ok": False, "kind": "confirm", "msg": M["unlink"]}
        if b.kind == 2:                                            # XFButton10Click (Qohumları grid)
            ws.conn.call_proc(PKG, "del_customers_bank_stetment", [b.custid, b.custid2])
        elif b.kind == 3:
            ws.conn.call_proc(PKG, "del_customers_grop", [b.custid, b.custid2])
        else:
            ws.conn.call_proc(PKG, "del_customers_relations", [b.custid2])
        return {"ok": True}

    @r.get("/picker")
    def _picker(col: int = 0, text: str = "", ws=Depends(guard)):
        # FormCustomers (CustomersImpl) CBSearch + EditSearch -> SQL[3]
        sql, b = Q.FORMCUSTOMERS, {}
        if text:
            c = Q.FORMCUSTOMERS_SEARCH[col if 0 <= col < len(Q.FORMCUSTOMERS_SEARCH) else 0]
            if c == "ID":
                sql = set_line(sql, 3, " and ID like :b_t"); b["b_t"] = text + "%"
            else:
                sql = set_line(sql, 3, f" and upper({c}) like upper(:b_t)"); b["b_t"] = "%" + text + "%"
        return rows(ws.conn, sql, b, LIMIT)

    @r.get("/credits/{cid}")
    def _credits(cid: int, cust_phys: int = 0, cust_fs: int = 0, ws=Depends(guard)):
        if cust_phys == 1 and cust_fs == 1:                       # Mtrininkreditlri1Click
            return {"ok": False, "kind": "msg", "msg": M["cred_phys_fs"]}
        return {"ok": True, "rows": rows(ws.conn, Q.DM["CreditDSet"], {"custid": cid}, LIMIT)}

    @r.get("/deposits/{cid}")
    def _deps(cid: int, cust_phys: int = 0, cust_fs: int = 0, sort: str = "id", ws=Depends(guard)):
        if cust_phys == 1 and cust_fs == 1:                       # Depozit1Click
            return {"ok": False, "kind": "msg", "msg": M["dep_phys_fs"]}
        from .delphi import subst
        col = sort if re.fullmatch(r"[A-Za-z_#]+( (ASC|DESC))?", sort or "") else "id"   # DepozitFrm title click
        return {"ok": True, "rows": rows(ws.conn, subst(Q.DM["DepozDset"], "OrderField", col), {"CUSTID": str(cid)}, LIMIT)}

    @r.get("/business-ops/{cid}")
    def _ops(cid: int, cust_type: int, bdat: datetime.date, edat: datetime.date, ws=Depends(guard)):
        if cust_type == 4:                                         # ƏməliyyatClick
            return {"ok": False, "kind": "msg", "msg": M["nominal_ops"]}
        sql = set_line(Q.DM["ODS_sb_business_opers"], 2,
                       "and b.parentid in (select id FROM transactions_busnes_pros where (custid_cred =:b_id) or (custid_debt=:b_id))")
        return {"ok": True, "rows": rows(ws.conn, sql, {"bdat": datetime.datetime.combine(bdat, datetime.time()),
                                                         "edat": datetime.datetime.combine(edat, datetime.time()),
                                                         "b_id": cid}, LIMIT)}

    @r.post("/pep")
    def _pep(name: str = "", surname: str = "", ws=Depends(guard)):
        return pep_check(ws.conn, name, surname)

    return r


def _bind_vars(sql: str) -> set:
    return set(re.findall(r"(?<![:\w]):(\w+)", re.sub(r"'[^']*'", "", sql)))


def pep_check(conn, name: str, surname: str) -> dict:
    """PEPUnit Button1Click: convertpack.CONVERT_INT on both names, GET bankinfo.tax_regcode + query string."""
    import urllib.parse
    import urllib.request
    n = conn.call_func("convertpack", "CONVERT_INT", [name], str) or ""
    s = conn.call_func("convertpack", "CONVERT_INT", [surname], str) or ""
    base = (rows(conn, Q.PEP_BANKINFO) or [{}])[0].get("TAX_REGCODE") or ""
    url = base + "name=" + urllib.parse.quote(n) + "&surname=" + urllib.parse.quote(s)
    try:
        if base.startswith("mock://"):
            text = getattr(conn, "pep_response", lambda u: "")(url)
        else:
            with urllib.request.urlopen(url, timeout=10) as resp:   # noqa: S310 (URL comes from bankinfo)
                text = resp.read().decode("utf-8", "replace")
        return {"ok": True, "line": "Response: " + text, "warn_text": M["pep_warn"], "warn_title": M["pep_title"]}
    except Exception as e:  # noqa: BLE001
        return {"ok": False, "kind": "msg", "msg": M["pep_err"].format(e=e)}

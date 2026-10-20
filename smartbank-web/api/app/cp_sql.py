"""Verbatim SQL of Packages/CurrencyPosition (TFrmCurrencyPosition, CPDataMod, TFrmTuning, TFrmChecking).

Most texts are built at run time from 'CurrencyPosition_' + sb_GetUserName (sb_currencyposition.GetUserName = USER);
the builders below reproduce the Delphi string concatenation character for character (unit:line cited on each).
"""
from __future__ import annotations

# CPDataMod.ODSCurrency (DataModCurrPositin.dfm:77-85) - FillCurrency (CurrencyPositionImpl.pas:510-532)
SQL_CP_ODSCURRENCY = "Select  Valute,Valu_Name \n From  AVALUTE"

# CPDataMod.BankInfo (DataModCurrPositin.dfm:115-124) - opened in DataModuleCreate (DataModCurrPositin.pas), only
# used by the held CPReport (UntCPReport.pas:193)
SQL_CP_BANKINFO = "select av.Val_name,svm_currencyid from bankinfo bi , avalute av\nwhere av.valute = bi.SVM_CurrencyID\n "

# TFrmCurrencyPosition.ODSFillFile (CurrencyPositionImpl.dfm:775-792)
SQL_CP_ODSFILLFILE = "Select \n    Ostat as Rate\n    From\n      OperKurs\n    Where \n         ( DAT=:CurrentDate)  And   (VAL_KOD=:Currency)"

# TFrmCurrencyPosition.ODSSVM (CurrencyPositionImpl.dfm:793-804)
SQL_CP_ODSSVM = "  Select \n      SVM\n    From\n     BankInfo"

# TFrmTuning.OracleDataSet1 (UntMore.dfm:317-346)
SQL_CP_TUNING_BANKINFO = "Select\n   BankInfo.RowID\n  ,Bank\n  ,SVM\n  ,Tel\n  ,Capital\n\n From  BankInfo\n "


def table_name(user: str) -> str:
    """'CurrencyPosition_'+sb_GetUserName (CurrencyPositionImpl.pas:463, :497, :553, :652)."""
    return "CurrencyPosition_" + user


def sql_fill_date(user: str) -> str:
    """FillDate :458-491 (CPDataMod.ODSDate)."""
    return "Select Distinct PresentDate From " + table_name(user)


def sql_do_open(user: str, filter_string: str = "") -> str:
    """Do_Open :549-564 (CPDataMod.ODSCurrPosition)."""
    return "Select  *  From " + table_name(user) + " " + filter_string + " Order By  PresentDate,Balance"


def sql_remainders(user: str, filter_string: str = "") -> str:
    """GetRemainders(FilterString) :493-508 (CPDataMod.ODSSum)."""
    return "Select Sum(Active),Sum(Passive) From " + table_name(user) + filter_string


def refresh_where(by_date: bool, by_currency: bool) -> str:
    """TBRefreshClick :641-709: ' Where '+FilterString, then +'And'+TempruaryString (no blanks around 'And')."""
    f = " (PresentDate=:ADate)" if by_date else ""
    t = " (Currency =:Currency)" if by_currency else ""
    q = ""
    if f:
        q = " Where " + f
    if t:
        q = (" Where " + t) if q == "" else (q + "And" + t)
    return q


def sql_refresh(user: str, where: str) -> str:
    """TBRefreshClick :689 SelectStatement+TableName+QueryString+' Order By  PresentDate,Balance'."""
    return "Select * From " + table_name(user) + where + " Order By  PresentDate,Balance"


def sql_refresh_sum(user: str, where: str) -> str:
    """TBRefreshClick :697."""
    return "Select Sum(Active),Sum(Passive) From " + table_name(user) + where


def sql_checking(user: str) -> str:
    """TFrmChecking.FormCreate (UntChecking.pas:116-132): TableName := ' CPSUM_'+sb_GetUserName (leading blank)."""
    return "Select  TblChecking.*,TblChecking.RowID From " + " CPSUM_" + user + " TblChecking"


# DOA default ApplyRecord of TFrmTuning.OracleDataSet1 (UpdatingTable BankInfo from the FROM clause, CommitOnPost True):
# SpeedButtonCommitClick (UntMore.pas:538-546) Edit; Post on the DBEdits BANK / SVM / CAPITAL.
TUNING_FIELDS = ("BANK", "SVM", "CAPITAL")


def sql_tuning_update(fields: list[str]) -> str:
    return "update BankInfo set " + ", ".join(f"{f} = :{f}" for f in fields) + " where rowid = :ROWID_"


# ------------------------------------------------------------------ TfrmCapital ('Kapital', UntCapital.pas/.dfm)
# ds_capital (UntCapital.dfm:2393-2415). SQL[SQL.Count-1] is the ' order by id' line that ReOrder_Capital (:543-553)
# replaces with 'ORDER BY '+Column.FieldName; DOA joins SQL.Strings with line breaks.
CAP_LINES = ["SELECT cap.rowid,cap.id, cap.type, cap.bal, cap.acc,ac.acc_no, cap.sum, cap.percent, cap.formula, cap.op_type,cap.bal_type",
             "  FROM capital cap,account ac",
             "  where cap.acc=ac.id (+)",
             " order by id"]
# ds_capital_out (UntCapital.dfm:2582-2594), same shape on CAPITAL_ACC_OUT; DBGrid3TitleClick (:745-755) re-orders it
CAP_OUT_LINES = ["SELECT cap.rowid,cap.id, cap.type, cap.bal, cap.acc,ac.acc_no, cap.sum, cap.percent, cap.formula, cap.op_type,cap.bal_type",
                 "  FROM capital cap,CAPITAL_ACC_OUT ac",
                 "  where cap.acc=ac.id (+)",
                 " order by id"]
# FieldNames of the grid columns whose title can be clicked (dbg_balacc/DBGrid2/DBGrid1/DBGrid4/DBGrid5: BAL, ACC_NO,
# PERCENT; DBGrid3: BAL, ACC_NO, PERCENT) - the only values Column.FieldName can take
CAP_ORDER_FIELDS = ("BAL", "ACC_NO", "PERCENT")


def sql_capital(order: str | None = None, out: bool = False) -> str:
    lines = list(CAP_OUT_LINES if out else CAP_LINES)
    if order is not None:
        if order not in CAP_ORDER_FIELDS:
            raise ValueError(f"unexpected order field {order!r}")
        lines[-1] = "ORDER BY " + order
    return "\n".join(lines)


# ds_account (UntCapital.dfm:2456-2464) / ds_account_out (dfm:2524-2531)
SQL_CAP_ACCOUNT = "select * from account\norder by acc_no"
SQL_CAP_ACCOUNT_OUT = "SELECT *  FROM CAPITAL_ACC_OUT\norder by acc_no"
# ds_AdiEhtiyyat design-time SQL (dfm:2636-2666, Active = True) and cb_MainChange :339-349 (page 4 / page 5)
SQL_CAP_ADI_DFM = "select * from  Bal_SPR1 where ( Bal_CN like '%91') and (length(Bal_cn)=4)\norder by Bal_CN\n"
SQL_CAP_ADI_4 = "select * from  Bal_SPR1 where (Bal_CN like '%91') and (length(Bal_CN)=4) order by Bal_CN "
SQL_CAP_ADI_5 = "select * from BAL_SPR1 order by bal_CN "
# OracleDataSet1 design-time SQL (dfm:2677-2704, Active = True) and cb_MainChange :353-356 (page 6)
SQL_CAP_ODS1_DFM = "select * from bal_spr1\norder by bal_cn"
SQL_CAP_ODS1_6 = "select * from BAL_SPR1 order by bal_CN "
# OracleDataSet2 / OracleDataSet3 / OracleDataSet4 (dfm:2705-2765, all Active = True)
SQL_CAP_ODS2 = "select  *  from capital   where OP_TYPE=3 and BAL_TYPE=1\norder by bal\n "
SQL_CAP_ODS3 = "select  *  from capital   where OP_TYPE=4 and BAL_TYPE=1\norder by bal"
SQL_CAP_ODS4 = "select * from capital"

# BitBtn3Click (UntCapital.pas:562-600): memo <- FloatToStr(PK_CAPITAL.CallFloatFunction(name, [Trunc(dp_capdate)]))
CAP_CALC = (("m_firstcap", "calculate_First_capital"), ("m_seccap", "calculate_second_capital"),
            ("m_actcap", "calculate_risks"), ("m_adieh", "calculate_reserv"), ("m_cap", "calculate_capital"),
            ("m_capeh", "calculate_capeht"), ("m_capumh", "calculate_capumhes"), ("m_activm", "calculate_AQiymetal"),
            ("m_passivm", "calculate_PQiymetal"))

# SpeedButton1Click (:676-681) ds_capital Post of DBEdit1 (FORMULA): DOA ApplyRecord on the first FROM table
# (capital), CommitOnPost default True.
SQL_CAP_FORMULA_UPDATE = "update capital set FORMULA = :FORMULA where rowid = :ROWID_"

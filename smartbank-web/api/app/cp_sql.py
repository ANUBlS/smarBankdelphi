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

"""SBDM_PercentSettings_new.bpl SQL, verbatim from PercentSettingImpl_new.dfm (unit:line in each comment)."""
from .dep_sql import text

# depcapitalperiods (dfm:724-730)  Master = depperiods, MasterFields ID -> DetailFields PERIODID
PCT_SQL_DEPCAPITALPERIODS = text(['select id,rowid,period,description,periodid,type# from sbcm_depcapitalperiods_new',
    'where periodid = :periodid',
    'order by period'])
# Depositdatsettings (dfm:769-782)
PCT_SQL_DEPOSITDATSETTINGS = text(['SELECT id,rowid, percent, firstdateint, lastdateint, valcod,',
    '       depid, periodid, capitalid, depsetid,amount_setting_id',
    'FROM  sbcm_depositunitime_new',
    'where Depid     = :depid',
    'and   Periodid  = :periodid  ',
    'and   Capitalid = :capitalid',
    'and   valcod    = :valcod',
    '--and   depsetid  = :depsetid',
    'and amount_setting_id=:amount_setting_id',
    'order by lastdateint',
    '       ',
    ''])
# DepositPerSetting (dfm:838-850)
PCT_SQL_DEPOSITPERSETTING = text(['SELECT id,rowid, currencyid, interestrate,dueintrate,firstamount,lastamount,depid, periodid, capitalid, befointrate,first_day,percentage_growth_step,LAST_DAY,amount_setting_id,amount_growth_first,amount_growth_last,write_memory,confirmation,hdate',
    'FROM sbcm_depositpersetting_new where Depid     = :depid',
    'and   Periodid  = :periodid  ',
    'and   Capitalid = :capitalid',
    'and   Currencyid=:currencyid',
    'and   Amount_setting_id=:amount_setting_id',
    'order by LAST_DAY,id'])
# DepositTypes (dfm:952-955)  no ROWID: read-only in DOA
PCT_SQL_DEPOSITTYPES = text(['SELECT id, type',
    '  FROM sbcm_deposit_types_new'])
# depperiods (dfm:977-983)  Master = DepositTypes, MasterFields ID -> DetailFields DEPID
PCT_SQL_DEPPERIODS = text(['select id,rowid,period,description,depid,period_type from sbcm_depperiods_new',
    'where depid = :depid',
    'order by period '])
# Valutes (dfm:1023-1025)  no ROWID: read-only in DOA
PCT_SQL_VALUTES = text(['select valute,val_name,valu_name from avalute'])
# DSsbcm_amount_setting (dfm:1091-1099)  classic table name (no _new), verbatim
PCT_SQL_AMOUNT_SETTING = text(['SELECT rowid,id,firstamount,lastamount,periodid,currencyid,maxamuontconrtact,maxamuontconrtactpercent',
    '  FROM sbcm_amount_setting ',
    'where periodid = :periodid',
    'and currencyid = :currencyid',
    'order by lastamount,periodid '])
# DSsysdat (dfm:1148-1150) 'select * from sysdat': only TEK_DAT is read -> dep_sql.SQL_BANKDATE (same row)

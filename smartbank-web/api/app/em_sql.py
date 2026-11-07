"""Verbatim SQL of Packages/ExchangeMGR-NBC/UnitDateExch.dfm (TDataModExch, binary dfm converted with
tools/dfm_bin2txt.py, texts extracted with tools/dfmsql_bin.py). Constant name = dataset name; dfm line cited above each."""

# ODSExchOffice (dfm:6)
DM_ODSExchOffice = 'select * from ex_office \norder by ex_no'
# ODSExchAcc (dfm:64)
DM_ODSExchAcc = 'select  rowid,a.*\n from ex_accounts a\n\nwhere ex_id = :ex_id\norder by ex_id,val_id\n'
# ODSExchRate (dfm:225)
DM_ODSExchRate = 'select r.rowid, r.* from ex_rates r\n\nwhere \n     dat   =:dat\n\norder by \n         val_id '
# ODSAcc_main_debt (dfm:291)
DM_ODSAcc_main_debt = 'select \n       id,\n       acc_no\n      \nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand   \n       filial=:filial'
# ODSExchProvarch (dfm:301)
DM_ODSExchProvarch = "SELECT \n      rownum,\n      p.*,\n      decode(p.status,'1', 'alış', '2','satış', '3', 'mübadilə') as status_str,\n      decode(p.cashless,'0', 'nağd', '1','nağdsız') as status_cashless\n\nFROM \n       ex_provarch p\n\nWHERE\n       p.ex_id = :ex_id\n\n\nAND\n       p.dat=:dat\n\nAND\n       p.status not in (4,5)\n\n\nORDER BY :Title"
# ODSReport (dfm:324)
DM_ODSReport = 'Select \n\n     rownum,ex.*,\n      p.*\n\nFrom \n      ex_office ex,ex_provarch p\nWhere \n        ex.ex_no=p.ex_id \n   and\n        p.id=:p_id'
# ODSRateInsert (dfm:345)
DM_ODSRateInsert = '/*select r.rowid, r.* from ex_rates r where ex_id = :ex_id and dat=(select max(dat) from ex_rates where dat<dat and ex_id = :ex_id)order by  val_id*/\n\nselect \n operkurs.val_kod val_id,\n(select val_name from avalute where valute=operkurs.val_kod)  val_name,\n(select valu_name from avalute where valute=operkurs.val_kod) val_full_name,\n operkurs.buy_rate  val_purchase_course,\noperkurs.sell_rate val_selling_course,\n operkurs.ostat     val_nb_course,\n :dat as dat,\n /*nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0) first_ostat,\n nvl((select purchase_turn from ex_rates where ex_rates.ex_id=:ex_id and ex_rates.val_id=temprate.val_kod),0)purchase_turn,\n nvl((select selling_turn from ex_rates where ex_rates.ex_id=:ex_id and ex_rates.val_id=temprate.val_kod),0)selling_turn,\n(nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0)+\n nvl((select purchase_turn from ex_rates where ex_rates.ex_id=:ex_id and ex_rates.val_id=temprate.val_kod),0)-\n nvl((select selling_turn from ex_rates where ex_rates.ex_id=:ex_id and ex_rates.val_id=temprate.val_kod),0))current_ostat,*/\n :Tim as Tim\n\nfrom operkurs \nwhere\noperkurs.dat=:dat\n/*left join ex_accounts on  temprate.val_kod=ex_accounts.val_id and  ex_accounts.ex_id=:ex_id*/\n\norder by  operkurs.val_kod\n\n'
# ODSExchRateOther (dfm:385)
DM_ODSExchRateOther = 'select r.rowid, r.* from ex_rates r\n\nwhere \n      dat   =:dat\norder by \n         val_id'
# ODSTraffics (dfm:399)
DM_ODSTraffics = " select p.*,\n        decode(p.status,'1', 'alış', '2','satış', '3', 'mübadilə') as status_str,\n        (p.cust_lname||' '||p.cust_name||' '||p.cust_father) as custname,\n        (p.country||cust_passport) as custpassport, \n        (select name from filial where id=(select filial from EX_OFFICE where ex_no=p.ex_id))as FilialName,\n        (select ex_name from EX_OFFICE where ex_no=p.ex_id) as VDMName\nfrom ex_provarch p \n where \n   p.id is not null  and p.dat between '24-Nov-2006' and '28-Nov-2006' "
# ODSExchProvarchTrans (dfm:535)
DM_ODSExchProvarchTrans = 'SELECT \n      p.*\n\nFROM \n       ex_provarch p\n\nWHERE\n      id=:v_id\n\nand\n       p.dat=:dat\nAND\n       p.status <>3\nAND\n       p.trans_close=0\n\nORDER BY :Title'
# ODSCust_Name (dfm:549)
DM_ODSCust_Name = 'select distinct cust_name from ex_constants where cust_name is not null'
# ODSCust_LName (dfm:557)
DM_ODSCust_LName = 'select distinct cust_lname from ex_constants where cust_lname is not null'
# ODSCust_Father (dfm:565)
DM_ODSCust_Father = 'select distinct cust_father from ex_constants where cust_father is not null'
# ODSCust_Confirm (dfm:573)
DM_ODSCust_Confirm = 'select distinct cust_confirm from ex_constants where cust_confirm is not null'
# ODSCust_Country (dfm:581)
DM_ODSCust_Country = 'select distinct cust_country from ex_constants where cust_country is not null'
# ODSGiving_Member (dfm:589)
DM_ODSGiving_Member = 'select distinct cust_giving_member from ex_constants where cust_giving_member is not null'
# ODSUserList (dfm:633)
DM_ODSUserList = "select username,user_id from dba_users where default_tablespace='SMARTBANK' order by username"
# ODSRateTurn (dfm:651)
DM_ODSRateTurn = 'select val_id, val_name, val_full_name, val_purchase_course,val_purchase_course_end,\n       val_selling_course,val_selling_course_end,val_nb_course, dat, tim,username\nfrom ex_rates \nwhere dat=:dat \n      \nunion\n\nselect val_id, val_name, val_full_name, val_purchase_course,val_purchase_course_end,\n       val_selling_course,val_selling_course_end, val_nb_course, dat, tim,username\nfrom ex_rates_archive \nwhere dat=:dat \n \norder by  val_id,tim\n\n\n\n\n'
# ODSAcc_main_cred (dfm:696)
DM_ODSAcc_main_cred = 'select \n       id,\n       acc_no\nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand\n       val_acc=:val_id\nand   \n       filial=:filial'
# ODSAcc_child_debt (dfm:711)
DM_ODSAcc_child_debt = 'select \n       id,\n       acc_no\nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand   \n       filial=:filial'
# ODSAcc_child_cred (dfm:726)
DM_ODSAcc_child_cred = 'select \n       id,\n       acc_no\nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand   \n       filial=:filial'
# ODSSumTrans (dfm:741)
DM_ODSSumTrans = 'select \n        sum(fee_amount) as fee_amount\nfrom \n        ex_provarch\nwhere \n        ex_id=:ex_id\nand\n        dat=(select max(dat) from ex_provarch)\nand\n        status in(1,2,3)\n\n'
# ODSUsers (dfm:757)
DM_ODSUsers = "select id,username from USERS where username not in ('EXCHANGEMGR','SMART') ORDER BY ID"
# ODsAccount (dfm:776)
DM_ODsAccount = 'select acc_no from account where close_dat is null order by acc_no'
# ODSExp_Provarch (dfm:790)
DM_ODSExp_Provarch = 'select r.rowid, r.* from exp_provarch r'
# Kurs (dfm:810)
DM_Kurs = 'select a.val_name,o.* from operkurs o,avalute a\nwhere o.val_kod=a.valute  and o.dat=:datdate  and o.val_kod>0\norder by o.VAL_KOD'
# ODSFilial (dfm:826)
DM_ODSFilial = 'select * from filial\norder by id'
# ODSDel_ExProvarch (dfm:857)
DM_ODSDel_ExProvarch = "select \n   p.*,\n   decode(p.status,'1', 'алыш', '2','сатыш') as status_str,\n  (select name from filial where id=(select filial from EX_OFFICE where ex_no=p.ex_id))as FilialName,\n  (p.cust_lname||' '||p.cust_name||' '||p.cust_father) as custname,\n  (p.country||cust_passport) as custpassport, \n  (select ex_name from EX_OFFICE where ex_no=p.ex_id) as VDMName \nfrom \n  ex_provarch_delete p\nwhere\n  p.dat between '24-Nov-2006' and '28-Nov-2006' \n\n\n\n"
# ODSParametr (dfm:993)
DM_ODSParametr = "select id,NAME from user$\nwhere SB_ACA.checkmodaccess_int('EXCHANGEMGR',name)=1\norder by name"
# ODSExAdminIn (dfm:1001)
DM_ODSExAdminIn = 'select EX_A_I.* from EX_admin_in EX_A_I\nwhere EX_A_I.USER_ID=:USER_ID'
# ODSExOffice (dfm:1023)
DM_ODSExOffice = 'select * from ex_office'
# ODSAvalute (dfm:1031)
DM_ODSAvalute = 'select * from avalute where valute<>0'
# ODSCashDebt (dfm:1044)
DM_ODSCashDebt = 'select \n       id,\n       acc_no\nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand   \n       filial=:filial'
# ODSCashKredit (dfm:1064)
DM_ODSCashKredit = 'select \n       id,\n       acc_no\nfrom \n        account   \nwhere \n       bal_cn1 =:balance\nand\n       val_acc=:val_id\nand   \n       filial=:filial'
# ODSExchRateDelete (dfm:1074)
DM_ODSExchRateDelete = 'delete \n    ex_rates \nwhere \n   dat =:dat\n'
# ODSExchRatearchive (dfm:1082)
DM_ODSExchRatearchive = 'insert into ex_rates_archive\n  select * from ex_rates\nwhere\n   dat =:dat'
# ODSExchRateAll (dfm:1090)
DM_ODSExchRateAll = 'select r.* from avalute r\n\nwhere \n  --       dat   =:dat\n--and     \n         valute<>0\n\norder by \n         valute'
# ODSVDMAll (dfm:1185)
DM_ODSVDMAll = "select -1 as ex_no, 'Bütün məntəqələr' as ex_name from ex_office \nunion\nselect ex_no,ex_name filial from ex_office "
# ODSReporting (dfm:1205)
DM_ODSReporting = "select \n    p.ex_no,\n    p.ex_name Ex_name,\n   (select name from filial where id=p.filial) Filial,\n    :val_name val_name,\n    nvl((select decode(status,'1', 'alış')from ex_provarch where ex_id=p.ex_no and status=1 and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id group by status),'alış') purchase,\n    nvl((select round(sum(lamount)/sum(debitamount),6)from ex_provarch where ex_id=p.ex_no and status=1  and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id),0) exchangerate,\n    nvl((select sum(debitamount) from ex_provarch where ex_id=p.ex_no and status=1 and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id ),0) purchaseamount,\n    nvl((select count(id) from ex_provarch where ex_id=p.ex_no and status=1 and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id ),0) purchasenumber,\n    nvl((select  decode(status,'2','satış') from ex_provarch where ex_id=p.ex_no and status=2 and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id group by status),'satış') sale,\n    nvl((select round(sum(lamount)/sum(debitamount),6)from ex_provarch where ex_id=p.ex_no and status=2  and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id),0) salecourse,\n    nvl((select sum(debitamount) from ex_provarch where ex_id=p.ex_no and status=2 and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id ),0)  salesamount,\n    nvl((select count(id) from ex_provarch where ex_id=p.ex_no and status=2        and trans_close=1 and dat between :bdat and :edat and VAL_ID=:val_id ),0) salesnumber\nfrom \n  ex_office p\n\n\n\n\n\n\n\n\n\n\n\n\n\norder by ex_no\n"
# ODSOperKurs (dfm:1266)
DM_ODSOperKurs = 'SELECT *\n  FROM operkurs PARTITION (TODAY)'
# ODSBankInfo (dfm:1274)
DM_ODSBankInfo = 'select * from bankinfo'
# ODSExRemainder (dfm:1447)
DM_ODSExRemainder = 'begin\n  vdat     =>:dat\n  v_exid   =>:ex_id\n  sdat     =>:sdat\n  result   =>:result\nend;'
# ODSValute (dfm:1498)
DM_ODSValute = 'select * from avalute'
# ODSExRemainderInsert (dfm:1506)
DM_ODSExRemainderInsert = 'select  \n temprate.val_kod,\n nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0) ftpe_ostat,\n nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0) pefr_ostat,\n nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0) first_ostat,\n nvl((select obr_d from tenostat where acc_id=ex_accounts.selling_acc_id),0)purchase_turn,\n nvl((select obr_k from tenostat where acc_id=ex_accounts.selling_acc_id),0)selling_turn,\n nvl((select abs(ostat) from tenostat where acc_id=ex_accounts.selling_acc_id),0) current_ostat,\n :ex_id as ex_id,\n :dat as dat,\n :Tim as tim\n\nfrom temprate \n     left join ex_accounts on  temprate.val_kod=ex_accounts.val_id and  ex_accounts.ex_id=:ex_id\nwhere \n\n  temprate.val_kod<>0 \n\n  \n\norder by  temprate.val_kod'
# ODSAccNo (dfm:1548)
DM_ODSAccNo = 'select * from account where close_dat is null'
# ODSReestrReport (dfm:1561)
DM_ODSReestrReport = 'select \n  val_name,\n  nvl((select round(sum(lamount)/sum(debitamount),6) from  ex_provarch \n  where  dat=:dat  and  val_id=r.val_id  and ex_id=:ex_id and status=1 and trans_close=1),val_purchase_course)purchase,\n  nvl((select sum(debitamount) from  ex_provarch where  dat=:dat  and  val_id=r.val_id  and ex_id=:ex_id and status=1 and trans_close=1),0) purchasenumber,\n  nvl((select sum(debitamount) * round(sum(lamount)/sum(debitamount),6) from  ex_provarch \n  where  dat=:dat  and  val_id=r.val_id  and ex_id=:ex_id and status=1 and trans_close=1),0)purchaseamount, \n  nvl((select round(sum(lamount)/sum(debitamount),6) from  ex_provarch \n  where  dat=:dat  and  val_id=r.val_id  and ex_id=:ex_id and status=2 and trans_close=1),val_selling_course)salecourse,\n  nvl((select sum(debitamount) from  ex_provarch where  dat=:dat  and  val_id=r.val_id  and ex_id=:ex_id and status=2 and trans_close=1),0) salenumber,\n  nvl((select sum(debitamount) * round(sum(lamount)/sum(debitamount),6) from  ex_provarch \n  where  dat=:dat  and  val_id=r.val_id and ex_id=:ex_id and status=2 and trans_close=1),0)saleamount\nfrom \n   ex_rates r\n  where \n      dat=:dat and r.val_id in(select val_id from ex_provarch  where trans_close=1 and dat=:dat)\n     and \n      r.val_id in(select val_id from ex_accounts where ex_id=:ex_id)\n\n\n\n\n\n\norder by r.val_id\n     \n  \n'
# ODSReestrOstat (dfm:1597)
DM_ODSReestrOstat = 'begin\n  vdat     =>:dat\n  v_exid   =>:ex_id\n  sdat     =>:sdat\n  result   =>:result\nend;\n\n\n\n\n\n\n'
# ODSReestrVdm (dfm:1629)
DM_ODSReestrVdm = 'select ex_no,ex_name filial from ex_office '
# ODSReestrValyuta (dfm:1637)
DM_ODSReestrValyuta = "select -1 as val_id, 'Bütün valyutalar' as val_name from avalute\nunion\nselect valute as val_id,val_name from avalute where valute<>0\n\n--select 0 as val_id, 'AZN' as val_name from ex_rates\n--union"
# ODSReestrEkvOstat (dfm:1645)
DM_ODSReestrEkvOstat = 'select \n   (select val_name from ex_rates where val_id=a.val_id and dat=:dat)v_name,pefr_ostat from ex_remainder a \nwhere \n    a.val_id<>0 \n  and \n    a.ex_id=:ex_id \n  and \n    a.dat=:dat    \n\nunion\nselect \n    (select val_name from avalute where valute=a.val_id)v_name,\n     pefr_ostat\n from \n    ex_remainder a \nwhere \n     a.val_id=0 \n   and\n     a.ex_id=:ex_id \n   and \n     a.dat=:dat\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
# ODSDeleteVDM (dfm:1686)
DM_ODSDeleteVDM = "select -1 as ex_no, 'Bütün məntəqələr' as ex_name from ex_office \nunion\nselect ex_no,ex_name filial from ex_office "
# ODSToplamVDM (dfm:1706)
DM_ODSToplamVDM = "select -1 as ex_no, 'Bütün məntəqələr' as ex_name from ex_office \nunion\nselect ex_no,ex_name filial from ex_office "
# ODSAvaluteDelete (dfm:1726)
DM_ODSAvaluteDelete = 'select * from avalute where valute<>0'
# ODSAvaluteToplam (dfm:1739)
DM_ODSAvaluteToplam = 'select * from avalute where valute<>0'
# ODSVDM (dfm:1760)
DM_ODSVDM = 'select * from ex_office where ex_no=:ex_id'
# ODSSysdat (dfm:1777)
DM_ODSSysdat = "select trunc(sysdate) ssdat,to_char(sysdate,'HH24:MI:SS') stime from dual"
# ODS_ExRemain (dfm:1797)
DM_ODS_ExRemain = 'begin\n  vdat     =>:dat\n  v_exid   =>:ex_id\n  sdat     =>:sdat\n  result   =>:result\nend;'
# OracleDataSet2 (dfm:1840)
DM_OracleDataSet2 = "select \n   p.*,decode(p.status,'1', 'алыш', '2','сатыш') as status_str,\n  (select name from filial where id=(select filial from EX_OFFICE where ex_no=p.ex_id))as FilialName,\n  (select ex_name from EX_OFFICE where ex_no=p.ex_id) as VDMName \nfrom \n  ex_provarch_delete p\nwhere\n  p.dat between '24-Nov-2006' and '28-Nov-2006'"
# ODSResurs (dfm:1993)
DM_ODSResurs = "select  r.*,\n       decode(r.status,'1', 'Resurs verilir', '2','Resurs qaytarılır') as status_str \nfrom\n   ex_resurs r where r.ex_no=:ex_id and (r.dat=:vdat or r.nextstatus=1)\norder by :title"
# ODSResursValyuta (dfm:2070)
DM_ODSResursValyuta = 'select * from avalute where valute in (0,1,45,48,50,784,792,981)'
# ODSVdmResurs (dfm:2083)
DM_ODSVdmResurs = 'select * from ex_office where ex_no=:ex_id'
# ODSTrdestination (dfm:2100)
DM_ODSTrdestination = 'select * from trdestination'
# ODSVdmRResurs (dfm:2107)
DM_ODSVdmRResurs = 'select * from ex_office where ex_no=:ex_id'
# ODSRResursValyuta (dfm:2124)
DM_ODSRResursValyuta = 'select * from avalute where valute in (0,1,45,48,50,784,792,981)'
# ODSRTrdestination (dfm:2137)
DM_ODSRTrdestination = 'select * from trdestination'
# ODSRatesFilial (dfm:2149)
DM_ODSRatesFilial = 'select r.rowid, r.* from ex_rates_filial r\nwhere \n     dat   =:dat and val_id in(1,45,48,50,784,792,981)\n \n\norder by \n         ex_id,val_id '
# ODS_RFilial (dfm:2222)
DM_ODS_RFilial = "select -1 as ID, 'Bütün məntəqələr' as name from Dual\nUnion All\nselect ex_no as id, ex_name from ex_office\norder by ID"
# ODSSumValyuta (dfm:2248)
DM_ODSSumValyuta = "select * from\n  ( select      debitamount,  val_name\n     from ex_provarch  where status=1 and (dat>=:dat1 and dat<=:dat2) \nand ex_id=:ex_id\n)\n  pivot\n  ( sum(debitamount) for val_name in ('USD' as USD,'EUR' as EUR,\n                  'RUR' as RUR,'GBP' as GBP\n                  )  )\n "
# ODSSumValyuta1 (dfm:2273)
DM_ODSSumValyuta1 = "select * from\n  ( select      debitamount,  val_name\n     from ex_provarch  where status=2 and (dat>=:dat1 and dat<=:dat2) \n  and ex_id=:ex_id\n)\n  pivot\n  ( sum(debitamount) for val_name in ('USD' as USD,'EUR' as EUR,\n                  'RUR' as RUR,'GBP' as GBP\n                  )  )\n "
# Amountsum (dfm:2303)
DM_Amountsum = ' select sum(p.debitamount),sum(lamount),sum(fee_amount)    \nfrom ex_provarch p \n where \n   p.id is not null  and p.dat between :dat1 and :dat2\n\n\n\n\n'


# ------------------------------------------------------------------ run-time texts (Unit_ExchangeMGR.pas)
# ActiveFormCreate :2309-2321 - ODSExRemainder.SQL.Clear; SQL.Add(...) (the same text in all three branches)
SQL_EX_REMAINDER = "begin exch_mgr.ExRemainderSql(vdat=>:dat,v_exid=>:ex_id,sdat=>:sdat,result=>:result); end;"


def sql_rates_filial(ex_id: int | None) -> str:
    """DBLookupComboBox2Click :1337-1352: SQL[3] := '' (KeyValue = -1) or 'and ex_id='+VarToStr(KeyValue)."""
    lines = DM_ODSRatesFilial.split("\n")
    lines[3] = "" if ex_id is None or ex_id == -1 else "and ex_id=" + str(int(ex_id))
    return "\n".join(lines)

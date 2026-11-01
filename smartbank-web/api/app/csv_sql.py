"""SQL of the Customer service module, verbatim from Delphi Packages/PCustService_irshad (production).

DM   = UnitDataModPCustService.dfm datasets (TDataModPCustService), key = component name, value = SQL.Strings text.
MAIN = PCustServiceFormImpl1.dfm datasets on the main form.
Lines are kept exactly (blank lines too) because the Delphi code writes filters into fixed SQL[n] lines
(see set_line). DM_LINE / MAIN_LINE give the dfm line of each dataset object.
Generated from the DFM by a helper script; do not edit by hand, re-extract instead.
"""

DM = {}
DM_LINE = {}
MAIN = {}
MAIN_LINE = {}

DM['ODS_BusProc'] = 'select *from sb_business_processes where  formnum is not null\n--and( cust_type :custtype  or  cust_type is null )\nand (pg_pcustservice.find_vergul_ids(cust_type,:custtype)=1 /*or(cust_type is not null )*/)     \nand \n    (pg_pcustservice.find_vergul_ids(cust_ids,:ids)=1 or (cust_ids is null ))\n\norder by :sira'
DM_LINE['ODS_BusProc'] = 12

DM['ODS_AccNO_A'] = "/*select null id, '' acc_no,''acc_no1 ,''name,'' tipacc,''symb,null ostat,-1 filial,'' filial_name,null val_acc,'' val_name,null bal_cn1  from dual\nunion all*/\nselect a.ID, a.acc_no,B.CASHINCOMING AS ISCACHEACCOUNT,CASE WHEN :AccSrchPos =0 THEN substr(acc_no,1,:AccSrchPos)||''||substr(acc_no,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(acc_no,1,:AccSrchPos)||'   '||substr(acc_no,:AccSrchPos+1,30)END acc_no1,a.name, a.tipacc,a.symb, (select ostat  from temprate   where val_kod=a.val_acc) ostat,a.filial, f.name filial_name,\n a.val_acc, v.val_name,a.bal_cn1  \nfrom account a, avalute v, filial_t f,bal_spr1 b\n where a.close_dat is  null and kli_ID = :CustID\n and bal_cn1 :BalCn\n and nvl(tipacc,'WWWWWWW') like (:vTipAcc)\n and a.val_acc :Currency\n and a.val_acc = v.valute\nand a.filial = f.id\nand a.bal_cn1=b.bal_cn\nand b.cust_type :custtype\n\norder by id, acc_no\n--a.filial,(select  name from filial where id=a.filial) filname"
DM_LINE['ODS_AccNO_A'] = 112

DM['OPG_BusProc'] = ''
DM_LINE['OPG_BusProc'] = 163

DM['ODS_AccNO_B'] = "select a.ID,a.kli_id, a.acc_no,B.CASHINCOMING AS ISCACHEACCOUNT,CASE WHEN :AccSrchPos =0 THEN substr(acc_no,1,:AccSrchPos)||''||substr(acc_no,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(acc_no,1,:AccSrchPos)||'   '||substr(acc_no,:AccSrchPos+1,30)END acc_no1, a.name, a.tipacc,a.symb, (select ostat  from temprate   where val_kod=a.val_acc) ostat,a.filial, f.name filial_name,\n a.val_acc, v.val_name,a.bal_cn1,b.cust_type  \nfrom account a, avalute v, filial_t f,bal_spr1 b\n where  a.close_dat is  null \n and bal_cn1 :BalCn\n and nvl(tipacc,'WWWWWWW') like (:vTipAcc)\n and a.val_acc  :Currency\n and a.val_acc = v.valute\nand a.filial = f.id\nand a.bal_cn1=b.bal_cn\nand b.cust_type :custtype\n\n\n\n\n\n\norder by id, acc_no"
DM_LINE['ODS_AccNO_B'] = 169

DM['ODS_AccNO_C'] = "select a.ID,a.kli_id, a.acc_no,B.CASHINCOMING AS ISCACHEACCOUNT,CASE WHEN :AccSrchPos =0 THEN substr(acc_no,1,:AccSrchPos)||''||substr(acc_no,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(acc_no,1,:AccSrchPos)||'   '||substr(acc_no,:AccSrchPos+1,30)END acc_no1, a.name, a.tipacc,a.symb, (select ostat  from temprate   where val_kod=a.val_acc) ostat,a.filial, f.name filial_name,\n a.val_acc, v.val_name,a.bal_cn1,b.cust_type  \nfrom account a, avalute v, filial_t f,bal_spr1 b\n where  a.close_dat is  null \n and bal_cn1 :BalCn\n and nvl(tipacc,'WWWWWWW') like (:vTipAcc)\n and a.val_acc  :Currency\n and a.val_acc = v.valute\nand a.filial = f.id\nand a.bal_cn1=b.bal_cn\nand b.cust_type :custtype\n\n\n\n\n\norder by id, acc_no"
DM_LINE['ODS_AccNO_C'] = 215

DM['odsPassDeps'] = 'select id,name from doc_deps where doc_type=:v_doctype\norder by ID'
DM_LINE['odsPassDeps'] = 281

DM['ClientGroupData'] = 'select * from QRP_KLIE\norder by id'
DM_LINE['ClientGroupData'] = 303

DM['Odscountries'] = 'select*from countries order by id'
DM_LINE['Odscountries'] = 328

DM['EstateTypeData'] = 'SELECT * FROM VID_SOB  where cust_type is not null and name is not null\n\n\n\n\n\n\n\n\n\n\n\norder by id\n\n\n\n\n\n\n\n'
DM_LINE['EstateTypeData'] = 363

DM['RelationData'] = 'select * from PRINAD'
DM_LINE['RelationData'] = 416

DM['OdsDoctaypes'] = 'SELECT a.id, a.name, a.symbol, a.series, a.pincodforced, a.fordoctypes\n  FROM doc_types a\n order by a.symbol'
DM_LINE['OdsDoctaypes'] = 440

DM['Odscountries1'] = 'select*from countries\norder by id'
DM_LINE['Odscountries1'] = 480

DM['Odscities'] = 'select*from cities\nwhere country_id =:v_id\norder by id'
DM_LINE['Odscities'] = 497

DM['Odscountries2'] = 'select*from countries\norder by id'
DM_LINE['Odscountries2'] = 535

DM['Odscities1'] = 'select*from cities\nwhere country_id=:v_id\n\norder by id'
DM_LINE['Odscities1'] = 551

DM['OdsGender'] = "select 1 as id ,'Kişi' as name from dual\nunion\nselect 2 as id ,'Qadın' as name from dual"
DM_LINE['OdsGender'] = 581

DM['OdsFamstatus'] = "select 1 as id,'Evli' as name from dual\nunion\nselect 2 as id,'Subay' as name from dual"
DM_LINE['OdsFamstatus'] = 601

DM['DScustimage'] = 'SELECT a.rowid, a.id, a.photo, a.custsign, a.stamp, a.doc_type_image\n  FROM custimage a  where a.id=:cust_id'
DM_LINE['DScustimage'] = 626

DM['CreditDSet'] = 'select a.*,cm_utils.Get_Gecgun(a.id,trunc(sysdate)) gecgun,cm_utils.Get_PlanPrincipal(a.id,trunc(sysdate)) as prin\n  from\n    cm_active a\nwhere a.boorowerid=:custid\norder by id desc'
DM_LINE['CreditDSet'] = 669

DM['DepozDset'] = 'select \n       cont.id,\n       cont.contractno,\n       av.val_name,\n       dm_stored_programs.getcustomername(cont.customerid) as CustomerName,\n       cont.opendate,\n       cont.closedate,\n       cont.amount,\n       interest,      \n       (select sum(facticaldebt) from dm_history_currstate where id#=cont.id) as facticaldebt ,\n       (select sum(facticalinterestdebt) from dm_history_currstate where id#=cont.id) as facticalinterestdebt,\n       (select ostat from tenostat where acc_id=acc.clientaccid) as ostat,\n       (select type from dm_types where id=cont.contracttype)as contracttypename,\n       cont.currency,\n       cont.personaltype,\n       cont.clienttype,\n       cont.branchid,\n       cont.contracttype,\n       cont.customerid,\n       cont.prolongationdate,\n       cont.stopcalcdate,\n       cont.sid# as usid,\n       (select name from user$ where id=cont.sid#) username\nfrom dm_active_contracts cont,\n     dm_contract_accounts acc,\n     avalute av\nwhere acc.id# = cont.id and\n      cont.currency = av.valute and\n      cont.type# = 3 \n    \n     and cont.customerid=:CUSTID\n\n\norder by :OrderField     '
DM_LINE['DepozDset'] = 869

DM['PG_PCustService'] = ''
DM_LINE['PG_PCustService'] = 1033

DM['OdsKurs'] = 'SELECT   ostat\n  FROM   temprate\n WHERE   val_kod =\n             (SELECT   val_acc\n                FROM   account\n               WHERE   id = (SELECT   debt\n                               FROM   (SELECT   ROWNUM r, debt\n                                         FROM   sb_business_proc_childs r\n                                        WHERE   parentid = :v_parentID)\n                              WHERE   r = 1)\n                       OR id = :d_accid)         \n '
DM_LINE['OdsKurs'] = 1039

DM['ODS_SYSDATE'] = 'select*from sysdat'
DM_LINE['ODS_SYSDATE'] = 1067

DM['ODSFilial_A'] = "select -1  id, 'Bütün filiallar' NAME, '00' KOD_FILIAL from dual\nunion\nselect id, NAME, KOD_FILIAL from filial_t "
DM_LINE['ODSFilial_A'] = 1093

DM['ODSFilial1'] = 'select*from filial_t'
DM_LINE['ODSFilial1'] = 1127

DM['ODSValute_acc'] = 'select*from avalute\norder by valute'
DM_LINE['ODSValute_acc'] = 1140

DM['ODS_account_symbols_A'] = "\n\n\nselect 'hhh'symbol , 'Bütün hesablar' name from dual\nunion all\nselect symbol,name  from  account_symbols\n\n\n\n"
DM_LINE['ODS_account_symbols_A'] = 1173

DM['ODS_Bal_spr_parts'] = '--select part,par_tname from  bal_spr1 group by part,part_name\nselect*from bal_spr_parts order by part'
DM_LINE['ODS_Bal_spr_parts'] = 1208

DM['ODS_Bal_spr'] = 'select *from bal_spr1\nwhere-- part=:part1 and \n length (bal_cn)>3 \nand nvl(inter_valute,0)=:int_val\nand nvl(cust_type,0)=:cus_tip \nand nvl(resident,0)=:resd\nand nvl(sferadey,0) like :sferad_ey\nand nvl(acc_type,0)=:acctype\nand nvl(government,0) like :govern_ment\n\n/*and SYMB=:SYM*/\n\n/*union \nselect *from bal_spr1\nwhere   length (bal_cn)>3 \nand   part=:part1 \nand inter_valute is null \n--and cust_type is null \nand  resident is null*/\n'
DM_LINE['ODS_Bal_spr'] = 1220

DM['AccFlags'] = "select ' ' as symbol, 'Butun simvollar' as Name from Dual\nUnion All\nSELECT symbol, symbol||'     '||description as name\n  FROM account_flags"
DM_LINE['AccFlags'] = 1355

DM['SBOP'] = ''
DM_LINE['SBOP'] = 1383

DM['CurrentUserFilial'] = "select o.filialid as id,f.name,f.kod_filial from sba_objinf o, filial f where \no.sysuserid=uid and o.type = 'U' and f.id=o.filialid"
DM_LINE['CurrentUserFilial'] = 1389

DM['SBUTIL'] = ''
DM_LINE['SBUTIL'] = 1420

DM['ConvertationSymbols'] = 'select * from CONVERT_ASSIGNMENTS\norder by ID'
DM_LINE['ConvertationSymbols'] = 1427

DM['Ods_contrs3'] = 'select*from countries\norder by id'
DM_LINE['Ods_contrs3'] = 1448

DM['ODS_account_symbols1'] = 'select*  from  account_symbols'
DM_LINE['ODS_account_symbols1'] = 1495

DM['ODS_CUSTOMERS_PHYS_FS1'] = "SELECT c.id, c.name cust_name, d.name FIRSTNAME, d.soname PATRONYMIC, d.lastname,\n       d.passer passport, d.birthday birthdate, d.birthplace,\n       d.fam_status, d.address adress,d.fakt_adress, d.phone_h phone, d.e_mail email, c.open_dat opendate, d.sex,\n       c.op_id userid, d.paspnum passp_number, d.adrs_state, d.city adrs_city, d.doc_type ,c.sfera_dey ,c.otrasl, c.nalog_kod,c.org_sob,\n       d.birth_state, d.phone_m phone_mob, c.inn, c.group_klie, d.paspdate, c.close_dat, c.nerezident,    c.vid_sob, c.prinad_kod, d.paspplace, d.passPIN, c.cust_type,c.category,d.citizenship,d.passexpire, d.id as idcustinfo\n  FROM customers c, custinfo d      where  --and d.paspplace like ('%Bakı, Nizami RPİ%')  \n  d.idcust = c.id and c.close_dat is  null\n\n\n\n\norder by :title"
DM_LINE['ODS_CUSTOMERS_PHYS_FS1'] = 1516

DM['ODS_sb_business_opers'] = 'select  b.reference,b.dat,b.parentid,tim,p.name from sb_business_opers b,sb_business_processes  p \nwhere b.busproc=p.id  and  dat BETWEEN  :bdat and :edat \n\n\norder by tim\n'
DM_LINE['ODS_sb_business_opers'] = 1726

DM['ODS_trancation'] = "select \nt.id,\nt.name,\nCASE WHEN :AccSrchPos =0 THEN substr(t.debitaccno,1,:AccSrchPos)||''||substr(t.debitaccno,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(t.debitaccno,1,:AccSrchPos)||'   '||substr(t.debitaccno,:AccSrchPos+1,30)END debitaccno,\nt.debitcurrencysname,\nCASE WHEN :AccSrchPos =0 THEN substr(t.creditaccno,1,:AccSrchPos)||''||substr(t.creditaccno,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(t.creditaccno,1,:AccSrchPos)||'   '||substr(t.creditaccno,:AccSrchPos+1,30)END creditaccno,\nt.creditcurrencysname,\nt.debitamount,\nt.creditamount,\nt.lamount,\nt.status,\nt.parentid,\nt.creditid,\nt.debitcurrencyid,\nt.DEBITBALANCE,\nt. NO_PROV,\nt. DAT,\nt. KNAME\nfrom transactions t where t.parentid=:ID and t. DAT=:dat\nunion\nselect \nt.id,\nt.name,\nCASE WHEN :AccSrchPos =0 THEN substr(t.debitaccno,1,:AccSrchPos)||''||substr(t.debitaccno,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(t.debitaccno,1,:AccSrchPos)||'   '||substr(t.debitaccno,:AccSrchPos+1,30)END debitaccno,\nt.debitcurrencysname,\nCASE WHEN :AccSrchPos =0 THEN substr(t.creditaccno,1,:AccSrchPos)||''||substr(t.creditaccno,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(t.creditaccno,1,:AccSrchPos)||'   '||substr(t.creditaccno,:AccSrchPos+1,30)END creditaccno,\nt.creditcurrencysname,\nt.debitamount,\nt.creditamount,\nt.lamount,\nt.status,\nt.parentid,\nt.creditid,\nt.debitcurrencyid,\nt.DEBITBALANCE,\nt. NO_PROV,\nt. DAT,\nt. KNAME\nfrom transactions t where t.id=:ID and t. DAT=:dat"
DM_LINE['ODS_trancation'] = 1769

DM['OrganizationTypeData'] = 'SELECT * FROM ORG_PRAV\norder by id'
DM_LINE['OrganizationTypeData'] = 1940

DM['ActionAreaData'] = 'SELECT * FROM SFERADEY\norder by id'
DM_LINE['ActionAreaData'] = 1961

DM['TaxAreaData'] = 'SELECT * FROM NALOG'
DM_LINE['TaxAreaData'] = 1987

DM['BranchData'] = 'SELECT * FROM OTRASLI'
DM_LINE['BranchData'] = 2017

DM['SB_STATEMENT'] = ''
DM_LINE['SB_STATEMENT'] = 2042

DM['ODSUsers'] = 'select * from user$'
DM_LINE['ODSUsers'] = 2053

DM['ODS_GetExtraction'] = 'select SB_Statement.GetExtraction2(\n    :bDate,\n    :eDate,\n    :ClientID,\n    :AccountNo,\n    :BalanceNo,\n    :BranchID,\n    :CurrencyID,\n    :UserID,\n    :Vidop) str from dual'
DM_LINE['ODS_GetExtraction'] = 2070

DM['ODS_ExtractionTrans'] = 'select SB_Statement.Extraction_Trans(\n    :bDate,\n    :eDate,\n    :ClientID,\n    :AccountNo,\n    :BalanceNo,\n    :BranchID,\n    :CurrencyID,\n    :UserID,\n    :vidop) str from dual'
DM_LINE['ODS_ExtractionTrans'] = 2104

DM['ODSMainState'] = "select\n  ac.id         AccountId,\n  ac.kli_id     CustomerId,\n  ac.acc_no     AccountNumber,\n  ac.op_id      OperatorId,\n  ac.val_acc    CurrencyId,\n  av.val_name   CurrencyName,\n  ac.name       AccountName,\n  c.inn         CustomerVoin,\n  ac.bal_cn1    BalanceCode,\n  ac.open_dat   OpenDate,\n  ac.filial     Filial,\n  sb_statement.flastopdate(ac.id,'11-SEP-10')    LastOpdate,\n  sb_statement.fOstat(ac.id,'11-SEP-10')         Ostat,\n  sb_statement.fPok_Ostat(ac.id,'11-SEP-10')     PokOstat,\n  sb_statement.fEndOstat(ac.id,'11-SEP-10')      EndOstat,\n  sb_statement.fEndPok_Ostat(ac.id,'11-SEP-10')  EndPokOstat,\n  sb_statement.fDatDate(ac.id,'11-SEP-10')       DatDate,\n  to_date('11-SEP-10')                                         EndDate,\n  sb_statement.fAp_Beg(ac.id,'11-SEP-10')        AP_Beg,\n  sb_statement.fAp_End(ac.id,'11-SEP-10')        AP_End  from account ac,customers c,avalute av  where\n  ac.kli_id=c.id\n  and  ac.val_acc = av.valute\n  and ac.open_dat<='11-SEP-10'   --order by a"
DM_LINE['ODSMainState'] = 2138

DM['ODSExtractTrans'] = ''
DM_LINE['ODSExtractTrans'] = 2265

DM['RatesDataSetBegin'] = 'Select\n   Val_Kod\n  ,Dat\n ,Ostat\n  From Operkurs\nWhere   Val_Kod = :Val_Kod and Dat =:Dat'
DM_LINE['RatesDataSetBegin'] = 2284

DM['RatesDataSet'] = 'Select\n   Val_Kod\n  ,Dat\n ,Ostat\n  From Operkurs\nWhere   Val_Kod = :Val_Kod and Dat =:Dat'
DM_LINE['RatesDataSet'] = 2318

DM['ODS_State'] = "select ac. rowid,ac. kli_id, CASE WHEN :AccSrchPos =0 THEN substr(ac.acc_no,1,:AccSrchPos)||''||substr(ac.acc_no,:AccSrchPos+1,30) WHEN :AccSrchPos <> 0 THEN substr(ac.acc_no,1,:AccSrchPos)||'   '||substr(ac.acc_no,:AccSrchPos+1,30)END acc_no1,ac.acc_no ,ac.bal_cn1 ,ac.name, 0 dd,(select name from filial_t where id=filial) as filial, (select val_name from avalute  where valute=val_acc) as Valuta,\nt.pok_ostat,ac.filial as fil,ac.val_acc as val,t.ostat,b.cust_type from\n account ac,tenostat t,bal_spr1 b\nwhere ac. kli_id=:custid\n and  ac.id=t.acc_id \n and ac.bal_cn1=b.bal_cn\n and ac.close_dat is  null\n\n\n\n\n\n\n\n-- and b.cust_type:custtype\n\n\n"
DM_LINE['ODS_State'] = 2352

DM['OPackage'] = ''
DM_LINE['OPackage'] = 2452

DM['memorial_date'] = 'select m.rowid,m.* from memorial_date m'
DM_LINE['memorial_date'] = 2458

DM['OPCash'] = ''
DM_LINE['OPCash'] = 2475

DM['ODSValuteName'] = 'Select\n  valute\n  ,valu_name\n  ,valu_bala \nFrom\n   Avalute \n\nwhere valute =:Valute '
DM_LINE['ODSValuteName'] = 2481

DM['Account'] = 'select *\n from Fiz_FS_Accs  \nwhere custID =:CID\nor AccNO like (:p_AccNO)'
DM_LINE['Account'] = 2516

DM['ForFizFsVoen'] = 'select decode(bl.cust_type,null,0,bl.cust_type) as cust_type\n from  bal_spr1 bl, account a\nwhere \n\ta.bal_cn1=bl.bal_cn \nand \ta.acc_no=:v_acc_no'
DM_LINE['ForFizFsVoen'] = 2552

DM['ODSBank'] = 'Select\n  Bank,Inn,KOD_B From BankInfo'
DM_LINE['ODSBank'] = 2567

DM['ODSCashInfo'] = 'Select\n  C.RowID,\n  C.*\nFrom\n  CashInfo C\nWhere  ID=:ID'
DM_LINE['ODSCashInfo'] = 2590

DM['Settings'] = 'SELECT  *\nFROM\n    cash_settings'
DM_LINE['Settings'] = 2642

DM['OracleDataSet1'] = 'select id ,name from customers'
DM_LINE['OracleDataSet1'] = 2751

DM['ODS_Work_Post'] = 'select*from work_posts'
DM_LINE['ODS_Work_Post'] = 2775

DM['ODS_Prinad'] = 'select*from prinad'
DM_LINE['ODS_Prinad'] = 2793

DM['OracleDataSet2'] = "SELECT c.id, c.name cust_name, d.name FIRSTNAME, d.soname PATRONYMIC, d.lastname,\n       d.passer passport, d.birthday birthdate, d.birthplace,\n       d.fam_status, d.address adress,d.fakt_adress, d.phone_h phone, d.e_mail email, c.open_dat opendate, d.sex,\n       c.op_id userid, d.paspnum passp_number, d.adrs_state, d.city adrs_city, d.doc_type ,\n       d.birth_state, d.phone_m phone_mob, c.inn, c.group_klie, d.paspdate, c.close_dat, c.nerezident,    c.vid_sob, c.prinad_kod, d.paspplace, d.passPIN, c.cust_type,c.category,d.citizenship,d.passexpire, d.id as idcustinfo\n  FROM customers c, custinfo d      where  --and d.paspplace like ('%Bakı, Nizami RPİ%')  \n  d.idcust = c.id and c.close_dat is  null\n\n\n\n\norder by :title"
DM_LINE['OracleDataSet2'] = 2813

DM['convertpack'] = ''
DM_LINE['convertpack'] = 3026

DM['Ods_closAccount'] = "select a.*,c.*,t.*, decode(b.typeid,1,'A',2,'P',3,'A-P') typesymb,v.val_name, T.OSTAT*decode(typeid,1,-1,1) as Balance,substr(acc_no,10,7) accno,\n  T.POK_OSTAT*decode(typeid,1,-1,1) as LBalance from account a, customers c, Tenostat t , bal_spr1 b,avalute_t v\nwhere a.kli_id=c.id and a.close_dat is null and a.id=t.acc_id and a.bal_cn1=b.bal_cn and a.val_acc=v.valute and\n kli_id=:id  Order by :Title\n"
DM_LINE['Ods_closAccount'] = 3032

DM['ReportSymbol'] = 'select * from REPORT_SYMBOL'
DM_LINE['ReportSymbol'] = 3201

DM['Ods_acc_types'] = 'SELECT id, name\n  FROM acc_types\norder by id'
DM_LINE['Ods_acc_types'] = 3223

DM['ODS_custinfo'] = 'SELECT*from PCust_view where  close_dat is  null \n--order by :DD\n\n\n\n\n\n\n\n\n\n'
DM_LINE['ODS_custinfo'] = 3236

DM['ODS_CUSTOMERS_PHYS_FS2'] = 'SELECT*from pcust_view  where  close_dat is  null-- and cust_type in(1,2,3)\n\n\n\n\n\n\n\n\n\n\n\n\norder by :title'
DM_LINE['ODS_CUSTOMERS_PHYS_FS2'] = 3954

DM['ODS_Customers_Phys_FS'] = "SELECT p.*, case when cust_type=0 then cust_name else p.lastname ||' '||substr(p.firstname,0,1)end papa_n,p.inn  voen  from PCust_view p where  p.close_dat is  null  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\norder by :title"
DM_LINE['ODS_Customers_Phys_FS'] = 4409

DM['CountryByConctType'] = "select c.rowid,c.* from  countries c where lower(c.cntr_name) <> lower('yox')\norder by c.cntr_name"
DM_LINE['CountryByConctType'] = 5156

DM['CityByConctType'] = 'select * from cities\nwhere COUNTRY_ID = nvl(:CID,0)\norder by ID'
DM_LINE['CityByConctType'] = 5179

DM['ds_mmx_communication_type'] = 'SELECT a.id, a.symbol, a.description\n  FROM mmx_communication_type a\norder by a.id'
DM_LINE['ds_mmx_communication_type'] = 5202

DM['ds_tph_country_prefix'] = 'select c.phone_code from  countries c where c.phone_code is not null\norder by ID '
DM_LINE['ds_tph_country_prefix'] = 5227

DM['DS_INCORP_CNTR'] = "select c.* from  countries c where lower(c.cntr_name) <> lower('yox')\norder by ID \n "
DM_LINE['DS_INCORP_CNTR'] = 5247

DM['ODSFakt_Adrs_Country'] = "select c.rowid,c.* from  countries c where lower(c.cntr_name)<>lower('yox')\norder by c.cntr_name"
DM_LINE['ODSFakt_Adrs_Country'] = 5276

DM['ODSFakt_Adrs_City'] = 'select * from cities\nwhere COUNTRY_ID = nvl(:CID,0)\norder by ID'
DM_LINE['ODSFakt_Adrs_City'] = 5301

DM['Citizenship2'] = 'select ID,CNTR_NAME from countries order by id'
DM_LINE['Citizenship2'] = 5324

DM['Citizenship3'] = 'select ID,CNTR_NAME from countries order by id-- cntr_name'
DM_LINE['Citizenship3'] = 5338

DM['DS_issue_country'] = "select c.rowid,c.* from  countries c where lower(c.cntr_name)<>lower('yox')\norder by c.cntr_name"
DM_LINE['DS_issue_country'] = 5352

DM['Ods_Customers_PhysFS_yoxlama'] = '\nSELECT*from PCust_view where  close_dat is  null \nand id=:id_yoxlama'
DM_LINE['Ods_Customers_PhysFS_yoxlama'] = 5377

DM['Ods_imzahuququ'] = "select 0 as id ,'yox' as name from dual\nunion\nselect 1 as id ,'Hə' as name from dual"
DM_LINE['Ods_imzahuququ'] = 5806

DM['ODS_risk'] = 'select*from cust_risk_categ'
DM_LINE['ODS_risk'] = 5831

DM['ODS_CUST_RISK_DESC'] = 'select*from CUST_RISK_DESC\nwhere risk_id=:id'
DM_LINE['ODS_CUST_RISK_DESC'] = 5850

DM['ODS_Hesabinsahibi'] = "select 0 as id ,'yox' as name from dual\nunion\nselect 1 as id ,'Hə' as name from dual"
DM_LINE['ODS_Hesabinsahibi'] = 5877

DM['ODS_account_symbols_B'] = "\n\n\nselect 'hhh'symbol , 'Bütün hesablar' name from dual\nunion all\nselect symbol,name  from  account_symbols\n\n\n"
DM_LINE['ODS_account_symbols_B'] = 5890

DM['ds_tph_contact_type'] = 'SELECT a.id, a.symbol, a.description\n  FROM mmx_contact_type a\norder by a.id'
DM_LINE['ds_tph_contact_type'] = 5912

DM['Templates'] = 'SELECT T.RowID , T.*\n  FROM CUSTOMERS_WR_TEMPLATES T where CUSTTYPE in(0,1,2,3)'
DM_LINE['Templates'] = 5927

DM['Bookmarks'] = 'SELECT rowid,ID, TEMPLATEID, FIELDID, BOOKMARKNAME\n  FROM CUSTOMERS_WR_BOOKMARKS\nwhere templateid = :templateid'
DM_LINE['Bookmarks'] = 5960

DM['Fields'] = 'SELECT ID, FIELDNAME, DESCRIPTION\n  FROM CUSTOMERS_WR_FIELDS\norder by id'
DM_LINE['Fields'] = 6006

DM['CustomerInfoDataSet'] = 'SELECT *\n  FROM PCUST_WR_INFO\nwhere accID=:Acc_ID'
DM_LINE['CustomerInfoDataSet'] = 6022

DM['ReplaceCustDataSet'] = 'SELECT\n   B.TEMPLATEID , B.BOOKMARKNAME , A.FIELDNAME\nFROM\n   CUSTOMERS_WR_BOOKMARKS B\n , CUSTOMERS_WR_FIELDS A\nWHERE\n     (B.FIELDID = A.ID)\n   AND templateid = :tid\n   AND bookmarkname = :bname'
DM_LINE['ReplaceCustDataSet'] = 6058

DM['Ods_WORK_OTRASLI'] = 'SELECT * FROM OTRASLI\norder by id'
DM_LINE['Ods_WORK_OTRASLI'] = 6084

DM['Ods_WORK_VID_SOB'] = 'SELECT * FROM VID_SOB where cust_type is not null and name is not null\n\n\n\n\n\n\n\norder by id'
DM_LINE['Ods_WORK_VID_SOB'] = 6096

DM['msg_control'] = ''
DM_LINE['msg_control'] = 6128

DM['Ods_HesabCap'] = 'select*from account a, customers c,bal_spr1 b\nwhere a.kli_id=c.id and a.bal_cn1=b.bal_cn and a.close_dat is null and\n kli_id=:id '
DM_LINE['Ods_HesabCap'] = 6134

DM['Ods_filial'] = 'select*from filial'
DM_LINE['Ods_filial'] = 6567

DM['ODS_account_tipacc'] = "select*from account where kli_id=:id and( tipacc like upper('%D%') or tipacc like upper('%C%'))"
DM_LINE['ODS_account_tipacc'] = 6585

DM['ODS_account_symbols_C'] = "\n\n\nselect 'hhh'symbol , 'Bütün hesablar' name from dual\nunion all\nselect symbol,name  from  account_symbols\n\n\n"
DM_LINE['ODS_account_symbols_C'] = 6703

DM['Destinations'] = 'select d.*, d.rowid from TRDESTINATION d\norder by name'
DM_LINE['Destinations'] = 6725

DM['Ods_cust_quality'] = 'select A.rowid,A.* from smart.cust_quality A  order by A.id'
DM_LINE['Ods_cust_quality'] = 6742

DM['Ods_cust_id_quality'] = 'select a.rowid,a.* from smart.cust_id_quality a where a.id_quality=:id_quality'
DM_LINE['Ods_cust_id_quality'] = 6761

DM['ods_custID_quality'] = '--select c.*,c.name_quality from custID_quality c  where c.custid=:custid  group by name_quality-- and id_quality=:id_quality\nselect*from cust_quality where id in(select id_quality from custID_quality where  custid=:custid  GROUP by id_quality) order by id'
DM_LINE['ods_custID_quality'] = 6801

DM['Ods_cust_id_quality1'] = 'select A.rowid,A.* from smart.custid_quality A where  A.custid=:custid and id_quality=:id_quality'
DM_LINE['Ods_cust_id_quality1'] = 6833

DM['Ods_cust_id_qualityCount'] = 'select count(checked) as checked from smart.custid_quality A where  A.custid=:custid and id_quality=:id_quality'
DM_LINE['Ods_cust_id_qualityCount'] = 6882

DM['ODS_val'] = 'select valute ,valu_name from avalute\norder by valute'
DM_LINE['ODS_val'] = 6902

DM['Ods_Tenostat_A'] = 'select*from Tenostat where acc_id=:id'
DM_LINE['Ods_Tenostat_A'] = 6927

DM['Ods_Tenostat_B'] = 'select*from Tenostat where acc_id=:id'
DM_LINE['Ods_Tenostat_B'] = 6948

DM['Ods_Tenostat_C'] = 'select*from Tenostat where acc_id=:id'
DM_LINE['Ods_Tenostat_C'] = 6969

DM['Ods_fakt_adress_owner'] = 'select*from fakt_adress_owner'
DM_LINE['Ods_fakt_adress_owner'] = 6990

DM['Transaction'] = 'Select * from transactionsp \nwhere debitID = :p_AccID or creditID = :p_AccID\norder by :title'
DM_LINE['Transaction'] = 7013

DM['Ods_cust_compani'] = "select id,name,name||'  \\  '||description as name_des from cust_compani order by id"
DM_LINE['Ods_cust_compani'] = 7179

DM['SB_ACA'] = ''
DM_LINE['SB_ACA'] = 7209

DM['ODS_sferadey_cod'] = 'select *from sferadey_cod'
DM_LINE['ODS_sferadey_cod'] = 7220

DM['ods_tarifs'] = "select name ,qrup,(minamt||'-'||maxamt) as amt,rtrim(to_char(amtpercent,'FM90.99'),'.')||'%' as amtpercent ,amtvalue,\nreplace(to_char(mintime/100,'00.99'),'.',':') ||' - ' || replace(to_char(maxtime/100,'00.99'),'.',':') as tim\nfrom tarifs \n\n\n\n\norder by qrup"
DM_LINE['ods_tarifs'] = 7247

DM['ods_months_sysdat'] = 'select ADD_MONTHS(tek_dat,:v_months) as dat from sysdat'
DM_LINE['ods_months_sysdat'] = 7295

DM['CustomerInfoDataSet_nom'] = 'SELECT *\n  FROM PCUST_WR_INFO_nom\nwhere ID=:v_ID'
DM_LINE['CustomerInfoDataSet_nom'] = 7315

DM['ods_rescount'] = 'select*from countries\norder by id'
DM_LINE['ods_rescount'] = 7328

DM['ods_rescount2'] = 'select*from countries\norder by id'
DM_LINE['ods_rescount2'] = 7383

DM['ods_rescount1'] = 'select*from countries\norder by id'
DM_LINE['ods_rescount1'] = 7438

DM['CashSymbols'] = 'SELECT\n  symbol,\n  name,\n  mediocrity\nFROM\n  kassa_b\norder by symbol '
DM_LINE['CashSymbols'] = 7508

DM['companycredit'] = ''
DM_LINE['companycredit'] = 7543

DM['returng_good'] = ''
DM_LINE['returng_good'] = 7548

DM['ds_mmx_contact_type'] = 'SELECT a.id, a.symbol, a.description\n  FROM mmx_contact_type a\norder by a.id'
DM_LINE['ds_mmx_contact_type'] = 7553

DM['ods_bank_stetment'] = 'select\ncustid,\ncustid1,\n(select name from customers where id=custid1) name\nfrom cust_bank_stetment where custid=:v_custid'
DM_LINE['ods_bank_stetment'] = 7568

DM['ods_cust_group_info'] = 'select\n\ncustid1,custid2 ,(select name from customers where id=custid2)as name\nfrom cust_group_info where custid1=:v_custid'
DM_LINE['ods_cust_group_info'] = 7602

DM['ods_cust_notes'] = 'select * from cust_notes where status=1 and custid=:v_custid'
DM_LINE['ods_cust_notes'] = 7637

DM['ods_percent'] = "SELECT  level as id,LEVEL || '%' AS name\nFROM dual\nCONNECT BY LEVEL <= 100"
DM_LINE['ods_percent'] = 7648

DM['ODS_Pozition'] = 'select a.rowid,a.* from View_customers_relations a\n\n\n\n\n\n\n\n\n'
DM_LINE['ODS_Pozition'] = 7668

MAIN['OracleDataSet1'] = "select max(line) as line  from user_source where name = upper('pg_pcustservice')"
MAIN_LINE['OracleDataSet1'] = 6472

MAIN['OracleDataSet2'] = "select '1' as id ,'1 ilə qədər' as name  from dual \nunion\nselect '2' as id, '1-3 il' as name from dual \nunion\nselect '3' as id ,'3-4 il' as name from dual \nunion\nselect '4' as id ,'5 ildən çox' as name from dual "
MAIN_LINE['OracleDataSet2'] = 6486

MAIN['OracleDataSet3'] = "SELECT *\n  FROM categories\n/*select '1' as id ,'1 ilə qədər' as name  from dual \nunion\nselect '2' as id, '1-3 il' as name from dual \nunion\nselect '3' as id ,'3-5 il' as name from dual \nunion\nselect '4' as id ,'5 ildən çox' as name from dual \n*/"
MAIN_LINE['OracleDataSet3'] = 6511

MAIN['OracleDataSet4'] = "select '001' as id ,'Mikro' as name  from dual \nunion\nselect '002' as id, 'Kiçik' as name from dual \nunion\nselect '003' as id ,'Orta' as name from dual \nunion\nselect '004' as id ,'İri' as name from dual \n\n\n/*select '1' as id ,'NBCBankda müsbət kredit tarixçəsi' as name  from dual \nunion\nselect '2' as id, 'MKR-də müsbət kredit tarixçəsi' as name from dual \nunion\nselect '3' as id ,'MKR-də 30 gündən çox gecikmə' as name from dual \nunion\nselect '4' as id ,'Ümumiyyətlə kredit tarixçəsi yoxdur' as name from dual \n*/"
MAIN_LINE['OracleDataSet4'] = 6538

MAIN['odsxx1'] = 'select*from lazytransaction'
MAIN_LINE['odsxx1'] = 6596

MAIN['ods_masinAxtaris'] = 'select kli_id from account where substr(acc_no,10,7) in (:v_accno)\ngroup by kli_id'
MAIN_LINE['ods_masinAxtaris'] = 6755

MAIN['ods_cust_sorcof'] = 'select*from cust_source_of_income'
MAIN_LINE['ods_cust_sorcof'] = 6769

MAIN['OracleDataSet5'] = "select 1 as id, 'Bəli' as naem  from dual\nunion\nselect 2 as id, 'Xeyir' as naem  from dual\n "
MAIN_LINE['OracleDataSet5'] = 6795

MAIN['OracleDataSet6'] = "select 1 as id, 'Bəli' as naem  from dual\nunion\nselect 2 as id, 'Xeyir' as naem  from dual"
MAIN_LINE['OracleDataSet6'] = 6809

MAIN['odsbankinfo'] = 'select\naz_name\nfrom bankinfo'
MAIN_LINE['odsbankinfo'] = 6822

MAIN['ods_tim'] = "SELECT\n    TRUNC(sysdate) AS tarix,\n    TO_CHAR(sysdate, 'HH24:MI:SS') AS saat\nFROM dual"
MAIN_LINE['ods_tim'] = 6838

MAIN['ods_user'] = 'select fullname from sba_objinf where sysuserid in(select uid from dual)'
MAIN_LINE['ods_user'] = 6859

MAIN['OracleDataSet7'] = "select '001' as id ,'Əmək haqqı kartı' as name  from dual \nunion\nselect '002' as id, 'Pensiya kartı' as name from dual \nunion\nselect '003' as id ,'Sosial kartı' as name from dual \nunion\nselect '004' as id ,'Yoxdur' as name from dual "
MAIN_LINE['OracleDataSet7'] = 6876

MAIN['OracleDataSet9'] = "select '1' as id, 'Bəli' as name  from dual \nunion\nselect '2' as id, 'Xeyr' as name from dual \n"
MAIN_LINE['OracleDataSet9'] = 6906

MAIN['OracleDataSet10'] = "select '1' as id, 'Bəli' as name  from dual \nunion\nselect '2' as id, 'Xeyr' as name from dual \n"
MAIN_LINE['OracleDataSet10'] = 6939

MAIN['OracleDataSet8'] = "select '001' as id ,'İxrac' as name  from dual \nunion\nselect '002' as id, 'İdxal' as name from dual \nunion\nselect '003' as id ,'İxrac və İdxal' as name from dual "
MAIN_LINE['OracleDataSet8'] = 6962

MAIN['OracleDataSet11'] = "\nselect '1' as id ,'Yox' as name from dual \nunion\nselect '001' as id ,'Maliyyə hesabatı' as name  from dual \nunion\nselect '002' as id, 'Vergi orqanlarına hesabat' as name from dual \nunion\nselect '003' as id ,'Digər' as name from dual \n"
MAIN_LINE['OracleDataSet11'] = 6995

MAIN['OracleDataSet12'] = 'select*from cust_financial_report'
MAIN_LINE['OracleDataSet12'] = 7030

MAIN['OracleDataSet13'] = "select  'TRUE' as kod, 'Bəli' as name  from dual\nunion all\nselect  'FALSE' as kod, 'Xeyr' as name  from dual"
MAIN_LINE['OracleDataSet13'] = 7041

MAIN['OracleDataSet14'] = "select '001' as id ,'İşləyir' as name  from dual \nunion\nselect '002' as id, 'İşsiz' as name from dual \nunion\nselect '003' as id ,'Fərdi sahibkar' as name from dual "
MAIN_LINE['OracleDataSet14'] = 7067

MAIN['ods_cust_group'] = 'select*from cust_group'
MAIN_LINE['ods_cust_group'] = 7101

MAIN['OracleDataSet15'] = "select  'TRUE' as kod, 'Bəli' as name  from dual\nunion all\nselect  'FALSE' as kod, 'Xeyr' as name  from dual"
MAIN_LINE['OracleDataSet15'] = 7112

MAIN['ods_custnote'] = 'select*from  cust_notes  where /*status=0 and*/ custid=:v_id'
MAIN_LINE['ods_custnote'] = 7138

MAIN['ods_val'] = 'select val_name,valu_name from avalute'
MAIN_LINE['ods_val'] = 7149

MAIN['OracleDataSet16'] = "select  'TRUE' as kod, 'Bəli' as name  from dual\nunion all\nselect  'FALSE' as kod, 'Xeyr' as name  from dual"
MAIN_LINE['OracleDataSet16'] = 7173

MAIN['OracleDataSet17'] = "select '001' as id ,'İxrac' as name  from dual \nunion\nselect '002' as id, 'İdxal' as name from dual \nunion\nselect '003' as id ,'İxrac və İdxal' as name from dual "
MAIN_LINE['OracleDataSet17'] = 7199


# ------------------------------------------------------------------ CustomersImpl.dfm (FormCustomers picker)
# ODS_CUSTOMERS: CustomersImpl.pas puts the search predicate into SQL[3] (CBSearch index), 'order by id' is SQL[6].
FORMCUSTOMERS = ("SELECT id ,cust_name,lastname,firstname,patronymic  from pcust_view  where  close_dat is  null "
                 "and cust_type in(1,2,3,4)\n\n\n\n\n\norder by id\n\n\n")
FORMCUSTOMERS_CAPTION = "Müştərinin əlaqələndirilməsi"
# CBSearch.Items -> column (index 0 = ID uses "like 'X%'", others "upper(col) like upper('%X%')")
FORMCUSTOMERS_SEARCH = ("ID", "cust_name", "lastname", "firstname", "patronymic")

# PEPUnit.dfm OracleDataSet1
PEP_BANKINFO = "select tax_regcode from bankinfo"


def set_line(sql: str, n: int, text: str) -> str:
    """Delphi TStrings SQL[n] := text (the dataset keeps its blank lines so the index exists)."""
    lines = sql.split("\n")
    while len(lines) <= n:          # DOA would raise 'List index out of bounds'; never happens for the dfm texts
        lines.append("")
    lines[n] = text
    return "\n".join(lines)


# ------------------------------------------------------------------ verbatim Delphi messages (PCustServiceFormImpl1.pas)
M = {
    # menu pre-checks (PCustServiceFormImpl1.pas *Click handlers)
    "dep_phys_fs": "Fiziki şəxs və sahibkara yeni Depozit vermək olmaz !",
    "cred_phys_fs": "Fiziki şəxs və sahibkarların kreditlərinə baxmaq olmaz !",
    "card_phys_fs": "Fiziki şəxs və sahibkara Plastik kart vermək olmaz !",
    "nom_xohks": "Nominala XÖHKS emeliyyatları etmek olmaz !",
    "nom_card": "Nominalın plastik kartlarına əməliyyat vermek olmaz !",
    "nom_swift": "Nominala plastik kartlarına əməliyyat vermek olmaz !",
    "nom_acc_open": "Nomina hesab açmaq olmaz !",
    "nom_acc_view": "Nominalin hesablarına baxmaq olmaz !",
    "nom_acc_edit": "Nominalın hesablarını redakte etmek olmaz !",
    "no_cust_sel": " Heç bir müştəri seçilməyib !",
    "no_data_sel": "Heç bir məlumat seçilməyib !",
    "jur_post": " Fiziki şəxsə vəzifə vermək olmaz !",
    "pep_title": "Xəbərdarlıq",
    "no_rows": "Heç bir məlumat tapılmadı?",                                         # CustSearch1Click
    "none_selected": "Heç bir məlumat seseçilməyib !",                                # CustEdit1Click
    "none_selected2": "Heç bir məlumat seçilməyib !",                                  # PEPYoxlama1Click
    "no_cust": " Heç bir müştəri seçilməyib !",                                        # Qeydlr1Click / OTherClick
    "phys_fs_conv": "Fiziki şəxs və sahibkarı Fiziki şəxsə və sahibkara çevirmek olmaz !",
    "add_phys_fs": "Fiziki şəxs və fiziki sahibkara əlavə etmek olmaz",
    "inn_empty": "VÖEN sahəsi boşdur",
    "inn_empty2": "VÖEN  sahəsi boşdur",
    "pin_empty": "Pinkod sahəsi boşdur",
    "pin_empty2": "Pinkod  sahəsi boşdur",
    "pin_empty3": " Pinkod sahəsi boşdur",
    "pin_eq_doc": "PİN Kod və Senedin  Seriya nömresi eynidir  !",
    "pin_eq_inn": "VÖEN və PİN Kod  eynidir  !",
    "fin": "  FIN-i düzgün daxil edin  !",
    "category": "  Kateqoriyası sahəsi Kodu  daxil edilməlidir!",
    "resident": " Rezident və ya  Qeyr Rezident Sahəsi seçilməyib  ! ",
    "incorp_cntr": "Mənsub olduğu ölkə sahəsi seçilməyib  !",
    "incorp_no": "Dövlət qeydiyyat nömrəsi sahəsi doldurulmayıb !",
    "incorp_no_e": "Dövlət qeydiyyat nömrəsi sahəsi doldurulmayıb  !",
    "ustav": " Nizamnaməsi qeydiyyata alındığı tarixi daxil edin!",
    "dvm": " DVM-də qeydə alındığı tarixi daxil edin!",
    "risk": " Risk kateqoriyası sahəsi doldurulmayıb !",
    "risk_e": "Risk kateqoriyası sahəsi doldurulmayıb !",
    "riskdesc": "Risk kateqoriyasının təyinatı  sahəsi doldurulmayıb!",
    "riskdesc_p": " Risk kateqoriyasının təyinatı  sahəsi doldurulmayıb!",
    "samely": " Eyniləşdirmə tarixi daxil edilməlidir!",
    "samely_e": "Eyniləşdirmə tarixi daxil edilməlidir!",
    "bolgu": "  Bölgü meyarı sahəsi Kodu  daxil edilməlidir!",
    "sfera_kod": "  Fəaliyyət sahəsi Kodu  daxil edilməlidir!",
    "compani": "  ƏDV \\ Təsnifat kodu  daxil edilməlidir!",
    "compani_p": " ƏDV \\ Təsnifat kodu  daxil edilməlidir!",
    "compani_e": "ƏDV \\ Təsnifat kodu  daxil edilməlidir!",
    "addr_type": "Əlaqə növü sahəsi  seçilməyib !",
    "addr_type_l": "əlaqə növü sahəsi  seçilməyib !",
    "c_country": "Əlaqə növünə görə  Ölkə sahəsi seçilməyib  !",
    "c_city": "Əlaqə növünə görə  Şəhər sahəsi seçilməyib  !",
    "c_addr": "Əlaqə növünə görə  Ünvan  sahəsi doldurulmayıb  !",
    "c_tph_ct": "Əlaqə növünə görə telefon nömrəsinin tipi  sahəsi seçilməyib  !",
    "c_tph_comm": "Rabitə növünə görə telefon nömrəsinin tipi sahəsi seçilməyib  !",
    "c_number": "Əlaqə növünə görə  Nömrə  sahəsi doldurulmayıb  !",
    "sex": "Cinsi sahesi doldurulmayib !",
    "fam": "Ailə vəziyyəti sahesi doldurulmayib !",
    "citizen": "Vətəndaşlığını daxil edin  !",
    "birth_cntr": "Doğum haqqında məlumatın ölkəsini daxil edin  !",
    "birth_city": "Doğum haqqında məlumatın şəhərini daxil edin  !",
    "birth_date": " Doğum tarixin daxil edin",
    "birth_date_e": "Doğum tarixin daxil edin",
    "reg_cntr": "Qeydiyyat ünvanın ölkəsini daxil edin  !",
    "reg_city": "Qeydiyyat ünvanın şəhərini daxil edin  !",
    "reg_addr": "Qeydiyyat ünvanı sahəsi doldurulmayib !",
    "fakt_cntr": "Faktiki ünvanın ölkəsini daxil edin  !",
    "fakt_city": "Faktiki ünvanın şəhərini daxil edin  !",
    "fakt_addr": "Faktiki ünvanın daxil edin  !",
    "doc_type": "Sənədin növünü  daxil edin  !",
    "doc_cntr": "Sənədin verildiyi ölkəni daxil edin  !",
    "doc_place": "Sənədin verildiyi yeri daxil edin  !",
    "doc_date": "Sənədin verildiyi tarixi daxil edin!",
    "doc_exp": "Sənədin etibarlıq tarixin daxil edin!",
    "email": "Email  sahəsi doldurulmayıb  !",
    "work_place": "İş yerinin adı  sahəsi doldurulmayıb !",
    "work_post": "İş yerinin Vəzifəsi  sahəsi doldurulmayıb !",
    "work_addr": "İş yerinin Ünvan  sahəsi doldurulmayıb !",
    "work_vid": "İş yeri haqqında ümumi fəaliyyət sahəsi doldurulmayıb  !",
    "work_otr": "İş yeri haqqında  fəaliyyət sahəsi doldurulmayıb  !",
    "activity": " Fəaliyyət istiqaməti sahəsi  doldurulmayıb  !",
    "profession": " Peşəsi sahəsi  doldurulmayıb  !",
    "income_src": " Gəlir mənbəyi  sahəsi  doldurulmayıb !",
    "phone_h": " Ev telefon sahesi tam doldurulmayib !",
    "phone_m": " Mobil telefon sahesi tam doldurulmayib !",
    "doc_sn": "Sənədin Seriya / N_si sahəsi tam doldurulmayıb     !",
    "doc_sn_c": "Sənədin Seriya / N_si sahəsi tam doldurulmayıb !",         # XFBitcontinueClick
    "dup_inn": "{n} -ID i  üçün  {v}  VÖEN mövcuddur!",
    "dup_inn_c": "{n} -ID i üçün  {v}  VÖEN mövcuddur!",
    "dup_pin": "{n} -ID i üçün {v}  Pinkod mövcuddur!",
    "dup_pin_e": "{n} -ID i  üçün {v}  Pinkod mövcuddur!",
    "dup_doc": "{n} -ID i  üçün {s} /{d}  Sənədin  seryasi mövcuddur!",
    "dup_doc_a": "{n} -ID i  üçün {s} /{d}  Sənədin  seryasi mövcuddur!",
    "dup_doc_c": "{n} -ID i üçün {s} /{d}  Sənədin  seryasi mövcuddur!",
    "confirm_add": " Yaddaşa yazmaq istəyirsinizmi ?",
    "confirm_edit": "Dəyşikliki Yadda saxlanılsınmı ?",
    "black": "{b}  DIQQET Bu Müştəri qara siyahıdadı Risk şöbəsinə müraciət  edin !",
    "unlink": " Əlaqə ləğv olunsunmu ?",
    "same_today": "Bugün  eyniləşdirmə tarixidir !",
    "same_over": "Eyniləşdirmə tarixi bitmişdir !",
    "nominal_ops": "Nominala əməliyyatlarına baxmaq olmaz !",
    "pep_warn": "Diqqət! Aidiyyatı şöbyə müraciəkt edin!",
    "pep_err": "Xəta: {e}",
}

# ------------------------------------------------------------------ PG_PCustService.add/edit_customers_prosess
# Positional parameter order, verbatim from CustAdd / CustEdit1Click (CallProcedure argument arrays).
_COMMON = (
    "d_name d_soname d_lastname d_passer d_birthday d_birthplace d_fam_status d_address d_fakt_adress d_doc_country "
    "d_citizenship2 d_citizenship3 d_fakt_country d_fakt_city d_fakt_zip d_work_place d_work_post d_work_adress "
    "d_work_phone d_phone_h d_e_mail d_sex d_paspnum d_adrs_state d_city d_doc_type d_birth_state d_phone_m "
    "d_paspdate d_paspplace d_passPIN d_citizenship d_passexpire d_note "
    "c_org_sob c_sfera_dey c_otrasl c_nalog_kod c_incorporation_number c_tph_contact_type c_tph_communication_type "
    "c_tph_number c_address_type c_address c_city c_country_code c_dat_ustav c_dpt_nal c_email c_url "
    "c_incorporation_state c_incorporation_cntr c_tph_extension c_tph_zip c_tph_country_prefix c_tph_state "
    "d_tph_contact_type d_tph_country d_tph_country_code d_tph_city d_tph_state d_tph_zip d_tph_country_prefix "
    "d_tph_adress d_tph_communication_type d_tph_number d_tph_extension d_contact_type d_url d_WORK_OTRASLI "
    "d_WORK_VID_SOB d_MONTHLYPROFIT "
    "c_id_quality c_NAME_QUALITY d_quality_id c_compani c_sfereday_kod c_state_reyester_no c_reyester_dat "
    "d_fakt_adress_owner d_activity d_profession d_source_of_income d_rescount d_rescount1 d_rescount2 "
    "d_work_experience d_last_work_experience d_family_number d_credit_history d_cust_involvement "
    "c_faktor_muq c_faktor_opendat c_faktor_accno c_faktor_bank c_faktor_bankkod c_faktor_muxaccno c_faktor_swift "
    "par1 par2 par3 "
    "d_iflas d_import_export d_financial_statement d_bank_card d_borrower_occupation d_borrower_bad d_ReportingDate "
    "d_ReportType d_Revenue d_Ebitda d_Ebit d_InterestExpences d_NetProfit d_TotalAssets d_TotalAssetsForeignCurrency "
    "d_TotalLiabilitiesForeignCurrency d_InterestExpenceLiabilities d_TotalLiabilities "
    "d_ForeignInterestExpenceLiabilities d_TotalCapital d_insolvencyStatus d_isoplost d_work_inn d_Income "
    "d_Income_cur d_IsForeignEcoOp d_ImportExportCode"
).split()
_HEAD = ("c_name c_short_name {date} c_inn c_group_klie {date} c_nerezident c_vid_sob c_prinad_kod c_cust_type "
         "c_cust_jur c_cust_phys c_cust_fs c_bik c_risk_categ d_risk_categ c_riskdescid c_samelydate c_category")
ADD_PARAMS = tuple(_HEAD.format(date="date").split()) + tuple(_COMMON)      # 'date' = Date (open / input date)
EDIT_PARAMS = ("c_id",) + tuple(_HEAD.replace("{date} ", "").split()) + tuple(_COMMON)

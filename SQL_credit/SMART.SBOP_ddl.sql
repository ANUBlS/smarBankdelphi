CREATE OR REPLACE 
PACKAGE sbop
IS

	/* *********************************************** */
  /*         SmartBank Operation Day package         */
	/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
  /* *********************************************** */
	
	type t_acc_balance is record (
		amount number := 0,
		lamount number := 0,
		d_turnover number := 0,
		d_l_turnover number := 0,
		c_turnover number := 0,
		c_l_turnover number := 0
	);  

  Function add_account (
    customerid   in   number,
    op_id        in   number,
    accno        in   varchar,
    currencyid        integer,
    name         in   varchar,
    open_dat     in   date,
    balcn             integer,
    limit             number default 0,
    close_dat         date default null,
    bal_cn2           integer default 0,
    bal_cn3           integer default 0,
    bal_cn4           integer default 0,
    filial            number default 0,
    sim_otcet         number default 0,
    typeacc           varchar default '',
    old_acc_no        varchar default 0,
    pair_acc          number default 0,
    insider           varchar default 0
  ) return integer;
  Procedure add_archost (ID_Number number,acc_id in number, datdate in date);
  Procedure add_tenostat (acc_id in number, datdate in date);
  Procedure close_account (accid integer, doclose integer);
  Procedure close_customer (
 v_id                number,
 currentdate         date default null,
 result        out   number
 );
  Function get_account_balance(AccID integer)	return t_acc_balance;
  Function get_account_balance(AccID integer, TargetDate date)	
 return t_acc_balance;
  Function get_archive_date(AccID integer, TargetDate date)	return date;
  Function get_currency_rate(CurrencyID integer, ArchiveDate date)
		return number;
  Function get_date return sysdat.tek_dat%type;
  Procedure set_acc_sid(acc_id integer, sid sbsec.t_sid);
  Procedure upd_account (
    v_id                integer, -- ID
    v_customerid   in   number, -- KLI_ID
    v_op_id        in   number, -- OP_ID
    v_accno        in   varchar, -- ACC_NO
    v_currencyid        integer, -- VAL_ACC
    v_name         in   varchar, -- NAME
    v_open_dat     in   date, -- OPEN_DAT
    v_balcn             integer, -- BAL_CN1
    v_limit             number default 0, -- LIMIT
    v_close_dat         date default null,
    v_bal_cn2           integer default 0,
    v_bal_cn3           integer default 0,
    v_bal_cn4           integer default 0,
    v_filial            number default 0,
    v_sim_otcet         number default 0,
    v_typeacc           varchar default '', --TIPACC
    v_old_acc_no        varchar default 0,
    v_pair_acc          number default 0,
    v_insider           varchar default 0
  );
  Function GenerateAccountNumber (
                  BalCn Bal_spr1.bal_cn%type
                 ,CurrencyID Avalute.valute%type
                 ,CustomerID Customers.id%type
                 ,BranchID Filial.id%type) return Account.acc_no%type;
  Procedure add_customer (
    op_id          number,
    open_dat       date,
    name           varchar2,
    close_dat      date default null,
    nerezident     integer default 0,
    prinad_kod     number default 0,
    short_name     varchar default '',
    group_klie     number default 0,
    vid_sob        number default 0,
    org_sob        number default 0,
    sfera_dey      number default 0,
    otrasl         number default 0,
    nalog_kod      number default 0,
    kod_okpro      number default 0,
    inn            varchar2 default '',
    dat_nal        date default null,
    dat_ustav      date default null,
    bik            number default 0,
    otv_lico       varchar default ' ',
    otv_passport   varchar default ' ',
    otv_issued     varchar default ' ',
    otv_isdate     date default null
  );
  Procedure upd_customer (
    v_id             integer
    ,v_op_id          number
    ,v_open_dat       date
    ,v_name           varchar
    ,v_close_dat      date default null
    ,v_nerezident     integer default 0
    ,v_prinad_kod     number default 0
    ,v_short_name     varchar default ''
    ,v_group_klie     number default 0
    ,v_vid_sob        number default 0
    ,v_org_sob        number default 0
    ,v_sfera_dey      number default 0
    ,v_otrasl         number default 0
    ,v_nalog_kod      number default 0
    ,v_kod_okpro      number default 0
    ,v_inn            varchar2 default ''
    ,v_dat_nal        date default null
    ,v_dat_ustav      date default null
    ,v_bik            number default 0
    ,v_otv_lico       varchar default ' '
    ,v_otv_passport   varchar default ' '
    ,v_otv_issued     varchar default ' '
    ,v_otv_isdate     date default null
 
 );
END;
/

CREATE OR REPLACE 
PACKAGE BODY sbop is

	/* *********************************************** */
  /*         SmartBank Operation Day package         */
	/*  Copyright 2002, Smart Systems Technoogy, Ltd.  */
  /* *********************************************** */
	
	/* Functions */
------------------------------------------
Function GenerateAccountNumber (
                  BalCn Bal_spr1.bal_cn%type
                 ,CurrencyID Avalute.valute%type
                 ,CustomerID Customers.id%type
                 ,BranchID Filial.id%type) return Account.acc_no%type
is
  Result Account.acc_no%type;
  CustAccCount number;
  CurrID varchar(3);
  CustID varchar(5);
  AccCount varchar(3);
  ValName varchar(5);
  ValNum  varchar(3);
  BrID varchar(3);
  
begin

  Select count(*) into CustAccCount from Account where kli_id =CustomerID;
  select VAL_NAME into ValName from Avalute where valute = CurrencyID;
  
  if length(to_char(CurrencyID)) < 3 then
  for pos in 1..3 - length(to_char(CurrencyID)) 
  loop
   CurrID :=CurrID || '0'; 
  end loop;
  end if;
  CurrID :=CurrID || to_char(CurrencyID);

  if length(to_char(CustomerID)) < 5 then
  for pos in 1..5 - length(to_char(CustomerID)) 
  loop
   CustID :=CustID || '0'; 
  end loop;
  end if;
  CustID :=CustID || to_char(CustomerID);
  
  if length(to_char(CustAccCount)) < 3 then
  for pos in 1..3 - length(to_char(CustAccCount)) 
  loop
   AccCount :=AccCount || '0'; 
  end loop;
  end if;
  AccCount :=AccCount || to_char(CustAccCount);

  if length(to_char(BranchID)) < 2 then
  for pos in 1..2 - length(to_char(BranchID)) 
  loop
   BrID :=BrID || '0'; 
  end loop;
  end if;
  BrID :=BrID || to_char(BranchID);
  
--dbms_output.put_line(BalCn);
--dbms_output.put_line(CurrencyID);
--dbms_output.put_line(CustomerID);
--dbms_output.put_line(AccCount);
--dbms_output.put_line(BranchID);

--   Result :=to_char(BalCn) || CurrID || CustID || AccCount ||'F' ||BrID;
   Result :=to_char(BalCn) || CurrID || CustID || AccCount ||BrID;
  Return Result;
end;                 
------------------------------------------
Function get_date return sysdat.tek_dat%type as
Currdate   sysdat.tek_dat%type;
begin
 select tek_dat into currdate from sysdat;
 return currdate;
end;
--------------------------------	
Function add_account (
    customerid   in   number,
    op_id        in   number,
    accno        in   varchar,
    currencyid        integer,
    name         in   varchar,
    open_dat     in   date,
    balcn             integer,
    limit             number default 0,
    close_dat         date default null,
    bal_cn2           integer default 0,
    bal_cn3           integer default 0,
    bal_cn4           integer default 0,
    filial            number default 0,
    sim_otcet         number default 0,
    typeacc           varchar default '',
    old_acc_no        varchar default 0,
    pair_acc          number default 0,
    insider           varchar default 0
  ) return integer is
    resultid   integer;
  begin
--  Checks whether user has right to add new account or not
	SB_ACA.CheckObjectAccess('Accounts','insert');  --adm
		
    insert into account
                (kli_id, op_id, acc_no, val_acc, name, open_dat, close_dat,
                 bal_cn1, bal_cn2, bal_cn3, bal_cn4, filial, sim_otcet,
                 tipacc, limit, old_acc_no, pair_acc, insider)
         values (customerid, op_id, accno, currencyid, name, open_dat, null,
                 balcn, bal_cn2, bal_cn3, bal_cn4, filial, sim_otcet,
                 typeacc, limit, old_acc_no, pair_acc, insider)
		returning ID into ResultID;

    insert into lazyrest(
			acc_id, ostat, pok_ostat, datdate, obr_d, obr_k, pok_obr_d,pok_obr_k)
    values (
			ResultID, 0,0, sysdate, 0, 0, 0, 0);
    commit;
    return ResultID;
  end;
---------------------------------------------------------
Procedure add_archost (ID_Number number,acc_id in number, datdate in date) as
begin
 insert into archost(
		id_Number,acc_id, ostat, pok_ostat, datdate, obr_d, obr_k, pok_obr_d,pok_obr_k)
 values (
		ID_Number, acc_id, 0,0, datdate, 0, 0, 0, 0);
end;
-------------------------------------------------------
Procedure add_customer (
    op_id          number,
    open_dat       date,
    name           varchar2,
    close_dat      date default null,
    nerezident     integer default 0,
    prinad_kod     number default 0,
    short_name     varchar default '',
    group_klie     number default 0,
    vid_sob        number default 0,
    org_sob        number default 0,
    sfera_dey      number default 0,
    otrasl         number default 0,
    nalog_kod      number default 0,
    kod_okpro      number default 0,
    inn            varchar2 default '',
    dat_nal        date default null,
    dat_ustav      date default null,
    bik            number default 0,
    otv_lico       varchar default ' ',
    otv_passport   varchar default ' ',
    otv_issued     varchar default ' ',
    otv_isdate     date default null
  )
  is
  begin	
--  Checks whether user has right to add new customer or not  
		 SB_ACA.CheckObjectAccess('CUSTOMERS','insert');  --adm
--		raise_application_error(-20001,'Ozunnnnnnnnnn');
		insert into customers
  (op_id, open_dat, close_dat, nerezident, prinad_kod, name,
   short_name, group_klie, vid_sob, org_sob, sfera_dey, otrasl,
   nalog_kod, kod_okpro, inn, dat_nal, dat_ustav, bik,
   otv_lico, otv_passport, otv_issued, otv_isdate)
    values (
			op_id, open_dat, close_dat, nerezident, prinad_kod, name, short_name, 
			group_klie, vid_sob, org_sob, sfera_dey, otrasl, nalog_kod, kod_okpro,
      inn, dat_nal, dat_ustav, bik, otv_lico, otv_passport, otv_issued, 
			otv_isdate);
  commit;            
  end;
-------------------------------------------------------------
Procedure add_tenostat (acc_id in number, datdate in date) as
begin
 insert into tenostat(
	 acc_id, ostat, pok_ostat, datdate, obr_d, obr_k, pok_obr_d, pok_obr_k)
 values (
		acc_id, 0, 0, datdate, 0, 0, 0, 0);
end;
-------------------------------------------------------------
Procedure close_customer (
 v_id                number,
 currentdate         date default null,
 result        out   number
 ) as
begin
--  Checks whether user has right to close existing customer or not  
	SB_ACA.CheckObjectAccess('CUSTOMERS','delete');  --adm
 update account set close_dat = currentdate where kli_id = v_id;
 update customers set close_dat = currentdate where id = v_id;
end;
----------------------------------------
Procedure upd_account (
    v_id                integer, -- ID
    v_customerid   in   number, -- KLI_ID
    v_op_id        in   number, -- OP_ID
    v_accno        in   varchar, -- ACC_NO
    v_currencyid        integer, -- VAL_ACC
    v_name         in   varchar, -- NAME
    v_open_dat     in   date, -- OPEN_DAT
    v_balcn             integer, -- BAL_CN1
    v_limit             number default 0, -- LIMIT
    v_close_dat         date default null,
    v_bal_cn2           integer default 0,
    v_bal_cn3           integer default 0,
    v_bal_cn4           integer default 0,
    v_filial            number default 0,
    v_sim_otcet         number default 0,
    v_typeacc           varchar default '', --TIPACC
    v_old_acc_no        varchar default 0,
    v_pair_acc          number default 0,
    v_insider           varchar default 0
  )
  is
  begin
--  Checks whether user has right to update an account or not
		SB_ACA.CheckObjectAccess('Accounts','Update');  --adm

    update account
       set kli_id = v_customerid,
           --op_id = v_op_id, TNariman 
           acc_no = v_accno,
           val_acc = v_currencyid,
           name = v_name,
           open_dat = v_open_dat,
           close_dat = v_close_dat,
           bal_cn1 = v_balcn,
           bal_cn2 = v_bal_cn2,
           bal_cn3 = v_bal_cn3,
           bal_cn4 = v_bal_cn4,
           filial = v_filial,
           sim_otcet = v_sim_otcet,
           tipacc = v_typeacc,
           limit = v_limit,
           old_acc_no = v_old_acc_no,
           pair_acc = v_pair_acc,
           insider = v_insider
     where id = v_id;
    commit;
  end;
---------------------------------------
Procedure upd_customer (
    v_id             integer
    ,v_op_id          number
    ,v_open_dat       date
    ,v_name           varchar
    ,v_close_dat      date default null
    ,v_nerezident     integer default 0
    ,v_prinad_kod     number default 0
    ,v_short_name     varchar default ''
    ,v_group_klie     number default 0
    ,v_vid_sob        number default 0
    ,v_org_sob        number default 0
    ,v_sfera_dey      number default 0
    ,v_otrasl         number default 0
    ,v_nalog_kod      number default 0
    ,v_kod_okpro      number default 0
    ,v_inn            varchar2 default ''
    ,v_dat_nal        date default null
    ,v_dat_ustav      date default null
    ,v_bik            number default 0
    ,v_otv_lico       varchar default ' '
    ,v_otv_passport   varchar default ' '
    ,v_otv_issued     varchar default ' '
    ,v_otv_isdate     date default null
 
 )
  is
  begin	
--  Checks whether user has right to update existing customers or not  
		SB_ACA.CheckObjectAccess('CUSTOMERS','update');  --adm
		
		update customers
       set op_id = v_op_id,
           open_dat = v_open_dat,
           close_dat = v_close_dat,
           nerezident = v_nerezident,
           prinad_kod = v_prinad_kod,
           name = v_name,
           short_name = v_short_name,
           group_klie = v_group_klie,
           vid_sob = v_vid_sob,
           org_sob = v_org_sob,
           sfera_dey = v_sfera_dey,
           otrasl = v_otrasl,
           nalog_kod = v_nalog_kod,
           kod_okpro = v_kod_okpro,
           inn = v_inn,
           dat_nal = v_dat_nal,
           dat_ustav = v_dat_ustav,
           bik = v_bik,
           otv_lico = v_otv_lico,
           otv_passport = v_otv_passport,
           otv_issued = v_otv_issued,
           otv_isdate = v_otv_isdate
     where id = v_id;
commit;
  end;
-------------------------------------------------
Procedure close_account (accid integer, doclose integer) is
 accstate         tenostat%rowtype;
 closedatevalue   sysdat.tek_dat%type;
 TrCount number;
begin
TrCount :=0;
--  Checks whether user has right to close an account or not
	SB_ACA.CheckObjectAccess('Accounts','delete');  --adm
  select * into accstate from tenostat where acc_id = accid;
  select count(*) into TrCount from LazyTransaction where debt = accid or kredit = accid;
  if (accstate.ostat <> 0 or accstate.pok_ostat <> 0) or (TrCount<>0) then
      raise_application_error (
        sbdecls.Error_AccountBalanceNotZero,
           'Account balance and localized balance must be zero before '
        || 'closing account. State dump: balance: '
        || accstate.ostat
        || '; localized balance: '
        || accstate.pok_ostat
        || '.'
      );
    end if;

  if doclose = 1 then
   closedatevalue := get_date;
  else
   closedatevalue := null;
  end if;
  update account set close_dat = closedatevalue where id = accid;
end;
-----------------------------------------------------	
Procedure set_acc_sid(acc_id integer, sid sbsec.t_sid)	as
begin
	update account	set	sid# = sid	where	id = acc_id;
 if SQL%rowcount = 0 then
		raise_application_error(sbdecls.Error_InvalidParameters, 'Invalid acount id specified');
 end if;
end;
------------------------------------------------------	
Function get_account_balance(AccID integer)	return t_acc_balance	as
	Result t_acc_balance;
begin
		select ostat, pok_ostat, obr_d, pok_obr_d,obr_k, pok_obr_k
			into Result	from tenostat	where acc_id = AccID;
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(sbdecls.Error_DataCorrupted,
				'get_account_balance: AccID: '||TO_CHAR(AccID));  
	end;
------------------------------------------------------	
Function get_archive_date(AccID integer, TargetDate date)	return date	as
		Result date;
begin
	select Max(datdate)	into Result	from archost
		where (acc_ID = AccID) and (datdate <= TargetDate);
	if Result is null then
		raise NO_DATA_FOUND;
	end if;
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(sbdecls.Error_InvalidParameters,
				'get_archive_date: No entry found for account (id='
					||to_char(AccID)
					||'; maxdate='
					||to_char(TargetDate)
					||')');
end;
------------------------------------------	
Function get_archive_id(
		AccID integer, TargetDate date,	RaiseErrors boolean default True
	)	return integer	as
	Result integer;
	ArchiveDate date;
	begin
		ArchiveDate := get_archive_date(AccID,TargetDate);
		select ID_NUMBER	into Result	from archost	where
			(acc_ID = AccID)	and (datdate = ArchiveDate);
		return Result;
	exception
		when OTHERS then
			if (not RaiseErrors) and (SQLCODE = sbdecls.Error_InvalidParameters) then
				return -1;
			else
				raise;
			end if; 
	end; 
----------------------------------------------------	
Function get_account_balance(AccID integer, TargetDate date)	
 return t_acc_balance	as
		ArchiveID integer;
		Result t_acc_balance;
	begin
		ArchiveID := get_archive_id(AccID, TargetDate, False);
		if ArchiveID <> -1 then
			select ostat, pok_ostat, obr_d, pok_obr_d, obr_k, pok_obr_k
				into Result
				from archost		where	ID_NUMBER = ArchiveID;
		end if;
		return Result;
	end;
----------------------------------------------------------	
Function get_currency_rate(CurrencyID integer, ArchiveDate date)
		return number	is
		Result number;
begin
	select OSTAT	into Result	from OPERKURS	where 
			(VAL_KOD = CurrencyID) 
			and (
				DAT = (
					select Max(DAT) from operkurs where DAT <= ArchiveDate
				));
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(
				sbdecls.Error_NoRateForDateSpecified, 
				'Rate for specified date not found. CurrencyID='||TO_CHAR(CurrencyID)||', Date='||TO_CHAR(ArchiveDate));
	end;
-----------------------------------------	
end;
/


-- Start of DDL Script for Package Body SMART.SBREP
-- Generated 6-ноя-2003 22:48:03 from SMART@SB

CREATE OR REPLACE 
PACKAGE sbrep
IS

/*	type t_transaction is record (
		ID integer,
		DebitID integer,
		DebitAccNo varchar2(32),
		DebitCurrencyID integer,
		DebitCurrencySName varchar2(8),
		CreditID integer,
		CreditAccNo varchar2(32),
		CreditCurrencyID integer,
		CreditCurrencySName varchar2(8),
		DebitAmount number,
		CreditAmount number,
		LAmount number,
		DebitRate number,
		CreditRate number,
		Name varchar2(64)
	);*/ 

	type t_transactions is ref cursor;

  procedure consbalance (balcn number, ondate date, result out number);
  procedure consturnover (
    balcn                number, -- { Number of Balance }
    fromdate             date, -- { On Required Date}
    todate               date, -- { On Required Date}
    debt_or_cred         number, -- { Turnover of Debit or Credit}
    result         out   number
  );
  procedure currencybalance (
    balcn            number, -- { Number of Balance }
    ondate           date, -- { On Required Date}
    currency         number, -- { On Required Currency}
    baltype          integer, -- { Type Of Balance}
    result     out   number
  );
  procedure currencyturnover (
    balcn                number,
    fromdate             date,
    todate               date,
    currency             number,
    debt_or_cred         number,
    baltype              number,
    result         out   number
  );
  procedure getaccountturnover (
    accid                 number,
    dturnover    in out   number,
    dlturnover   in out   number,
    cturnover    in out   number,
    clturnover   in out   number
  );
  procedure getcurrencyrate (
    currencyid          integer,
    currentdate         date default null,
    rate          out   number
  );
  procedure setaccountturnover (
    accid                 number,
    dturnover    in out   number,
    dlturnover   in out   number,
    cturnover    in out   number,
    clturnover   in out   number
  );
  procedure turnover (
    acc_no               varchar,
    currency             number,
    fromdate             date,
    todate               date,
    debt_or_cred         number,
    baltype              integer,
    result         out   number
  );
  function get_acc_currency(AccID in integer)
		return integer;
  function TrBuildQuery(
		FromDate date,
		ToDate date,
		NationalCurrency in boolean,
		ForeignCurrency in boolean,
		MultyCurrency in boolean,
		RateDifference in boolean,
        ProfitDebit in boolean,
		DebitCredit in boolean,
		DebitBalance in integer,
		CreditBalance in integer,
		DebitAccID in integer,
		CreditAccID in integer,
		DebitCurrencyID in integer,
		CreditCurrencyID in integer,
		DebitAmount in number,
		CreditAmount in number,
		LAmount in number,
		OrderBy in varchar2 default 'p.ID',
		CustomBoolPrefix in varchar2 default null,
		CustomCondition in varchar2 default null,
		Delayed in boolean default True,
		Commited in boolean default True,
		Rejected in boolean default True,
        FilialsDebit in number default -1,
        FilialsCredit in number default -1,
        OperatorId in number default -1
	)
		return varchar2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY sbrep
is

	CRLF constant varchar2(2) := sbdecls.CRLF;

	TrQuerySeg_Start constant varchar2(1024) := 
'SELECT'||CRLF|| 
'  p.ID,'||CRLF||
'  p.OperatorID,'||CRLF||
'  p.TransactionDate,'||CRLF||
'  p.DebitID,'||CRLF||
'  p.DebitAccNo,'||CRLF||
'  p.DebitCurrencyID,'||CRLF||
'  p.DebitCurrencySName,'||CRLF||
'  p.CreditID,'||CRLF||
'  p.CreditAccNo,'||CRLF||
'  p.CreditCurrencyID,'||CRLF||
'  p.CreditCurrencySName,'||CRLF||
'  p.DebitAmount,'||CRLF||
'  p.CreditAmount,'||CRLF||
'  p.LAmount,'||CRLF||
'  p.DebitRate,'||CRLF||
'  p.CreditRate,'||CRLF||
'  p.DebitBank,'||CRLF||
'  p.CreditBank,'||CRLF||
'  p.PackageNumber,'||CRLF||
'  p.CYPHERCODE,'||CRLF||
'  p.OPERATIONCODE,'||CRLF||
'  p.INBALANCECHAR,'||CRLF||
'  p.OUTBALANCECHAR,'||CRLF||
'  p.FilialID,'||CRLF||
'  p.DebitBalance,'||CRLF||
'  p.Name,'||CRLF||
'  p.Status,'||CRLF||
'  p.REJECT_REASON'||CRLF||
'FROM'||CRLF||
' TRANSACTIONS p'||CRLF||
' WHERE'||CRLF;
	
	TrQuerySeg_End constant varchar2(256) :=
'';
 
  TrQuerySeg_OrderBySegment constant varchar2(16) := 
		'ORDER BY ';
	
	TrQuerySeg_NationalCurrency constant varchar2(64) := 
		'((p.DebitCurrencyID = 0) AND (p.CreditCurrencyID = 0))
';

	TrQuerySeg_ForeignCurrency constant varchar2(96) := 
		'((p.DebitCurrencyID <> 0) AND (p.DebitCurrencyID = p.CreditCurrencyID))
';
		
	TrQuerySeg_MultyCurrency constant varchar2(64) :=
		'(p.DebitCurrencyID <> p.CreditCurrencyID)
';

	TrQuerySeg_RateDifference constant varchar2(96) := 
		'((p.LAmount <> 0) and ((p.DebitAmount = 0) or (p.CreditAmount = 0)))
';

    TrQuerySeg_ProfitDebit constant varchar2(32) :='((p.OPERATIONCODE = 2))';

	TrQuerySeg_Dates constant varchar2(32) := '(p.TransactionDate between '; 

  procedure consbalance (balcn number, ondate date, result out number)
  as
    currentdate   date;
  begin
    select tek_dat
      into currentdate
      from sysdat;

    if currentdate = ondate
    then
      select SUM (t.pok_ostat)
        into result
        from account a, tenostat t
       where a.id = t.acc_id
         and a.bal_cn1 = balcn
         and t.datdate >= ondate
         and t.datdate <=   ondate
                          + 1;
    elsif currentdate <> ondate
    then
      select SUM (t.pok_ostat)
        into result
        from account a, archost t
       where a.id = t.acc_id
         and a.bal_cn1 = balcn
         and t.datdate >= ondate
         and t.datdate <=   ondate
                          + 1;
    end if;
  end;

  procedure consturnover (
    balcn                number, -- { Number of Balance }
    fromdate             date, -- { On Required Date}
    todate               date, -- { On Required Date}
    debt_or_cred         number, -- { Turnover of Debit or Credit}
    result         out   number
  )
  as
    currentdate   date;
  begin
    select tek_dat
      into currentdate
      from sysdat;

    if  currentdate = fromdate and currentdate = todate
    then
      if debt_or_cred = 0
      then
        select SUM (t.pok_obr_d)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif debt_or_cred = 1
      then
        select SUM (t.pok_obr_k)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      else
        commit;
      end if;
    else
      if debt_or_cred = 0
      then
        select SUM (t.pok_obr_d)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif debt_or_cred = 1
      then
        select SUM (t.pok_obr_k)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      else
        commit;
      end if;
    end if;
  end;

  procedure currencybalance (
    balcn            number, -- { Number of Balance }
    ondate           date, -- { On Required Date}
    currency         number, -- { On Required Currency}
    baltype          integer, -- { Type Of Balance}
    result     out   number
  )
  as
    currentdate   date;
  begin
    select tek_dat
      into currentdate
      from sysdat;

    if currentdate = ondate
    then
      if baltype = 0
      then
        select SUM (t.ostat)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= ondate
           and t.datdate <   ondate
                           + 1;
      elsif baltype = 1
      then
        select SUM (t.pok_ostat)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= ondate
           and t.datdate <   ondate
                           + 1;
      else
        commit;
      end if;
    elsif currentdate <> ondate
    then
      if baltype = 0
      then
        select SUM (t.ostat)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= ondate
           and t.datdate <   ondate
                           + 1;
      elsif baltype = 1
      then
        select SUM (t.pok_ostat)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= ondate
           and t.datdate <   ondate
                           + 1;
      else
        commit;
      end if;
    end if;
  end;

  procedure currencyturnover (
    balcn                number,
    fromdate             date,
    todate               date,
    currency             number,
    debt_or_cred         number,
    baltype              number,
    result         out   number
  )
  as
    currentdate   date;
  begin
    select tek_dat
      into currentdate
      from sysdat;

    if  currentdate = fromdate and currentdate = todate
    then
      if  debt_or_cred = 0 and baltype = 0
      then
        select SUM (t.obr_d)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 0
      then
        select SUM (t.obr_k)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 0 and baltype = 1
      then
        select SUM (t.pok_obr_d)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 1
      then
        select SUM (t.pok_obr_k)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      else
        commit;
      end if;
    else
      if  debt_or_cred = 0 and baltype = 0
      then
        select SUM (t.obr_d)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 0
      then
        select SUM (t.obr_k)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 0 and baltype = 1
      then
        select SUM (t.pok_obr_d)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 1
      then
        select SUM (t.pok_obr_k)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.bal_cn1 = balcn
           and t.datdate >= fromdate
           and t.datdate <= todate;
      else
        commit;
      end if;
    end if;
  end;

  procedure getaccountturnover (
    accid                 number,
    dturnover    in out   number,
    dlturnover   in out   number,
    cturnover    in out   number,
    clturnover   in out   number
  )
  is
  begin
    select obr_d, pok_obr_d, obr_k, pok_obr_k
      into dturnover, dlturnover, cturnover, clturnover
      from tenostat
     where acc_id = accid;
  end;


/*
procedure GetAccountTurnover(
AccID: Integer;
DTurnover, DLTurnover,
CTurnover, CLTurnover: PCurrency);

procedure GetIfRequested(const AName: String; Value: PCurrency);
begin
if Assigned(Value) then
Value^ := GetAccountField(AccID, AName);
end;

begin
GetIfRequested('OBR_D', DTurnover);
GetIfRequested('POK_OBR_D', DLTurnover);
GetIfRequested('OBR_K', CTurnover);
GetIfRequested('POK_OBR_K', CLTurnover);
end;
*/



---

--  Procedure SMART.GETCURRENCYRATE
  procedure getcurrencyrate (
    currencyid          integer,
    currentdate         date default null,
    rate          out   number
  )
  is
    curdate   date;
  begin
    if currentdate is null
    then
      select tek_dat
        into curdate
        from sysdat;
    else
      select MAX (dat)
        into curdate
        from operkurs
       where dat <= currentdate;
    end if;

    select o.ostat
      into rate
      from operkurs o
     where o.val_kod = currencyid and o.dat = curdate;
  end;

  procedure setaccountturnover (
    accid                 number,
    dturnover    in out   number,
    dlturnover   in out   number,
    cturnover    in out   number,
    clturnover   in out   number
  )
  is
  begin
    update tenostat
       set obr_d = dturnover,
           pok_obr_d = dlturnover,
           obr_k = cturnover,
           pok_obr_k = clturnover
     where acc_id = accid;

    commit;
  end;

  procedure turnover (
    acc_no               varchar, -- {  }
    currency             number, -- { On Required Currency}
    fromdate             date,
    todate               date,
    debt_or_cred         number, -- { Turnover of 0-Debit or 1-Credit}
    baltype              integer -- { Type Of Balance}
                                ,
    result         out   number
  )
  as
    currentdate   date;
    accno         varchar2 (12);
  begin
    accno := RTRIM (acc_no);

    select tek_dat
      into currentdate
      from sysdat;

    if  currentdate = fromdate and currentdate = todate
    then
      if  debt_or_cred = 0 and baltype = 0
      then
        select SUM (t.obr_d)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 0
      then
        select SUM (t.obr_k)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 0 and baltype = 1
      then
        select SUM (t.pok_obr_d)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 1
      then
        select SUM (t.pok_obr_k)
          into result
          from account a, tenostat t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      end if;
    else
      if  debt_or_cred = 0 and baltype = 0
      then
        select SUM (t.obr_d)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 0
      then
        select SUM (t.obr_k)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 0 and baltype = 1
      then
        select SUM (pok_obr_d)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      elsif  debt_or_cred = 1 and baltype = 1
      then
        select SUM (pok_obr_k)
          into result
          from account a, archost t
         where a.id = t.acc_id
           and a.val_acc = currency
           and a.acc_no = accno
           and t.datdate >= fromdate
           and t.datdate <= todate;
      end if;
    end if;
  end;
	
	procedure add_expression(
		Result in out varchar2, 
		BoolPrefix varchar2,
		HasExpr in out boolean, 
		expr varchar2)
	as
	begin
		if HasExpr then
			Result := Result || ' ' || BoolPrefix || ' ' || expr;
		else
			Result := Result || ' ' || expr;
			HasExpr := True;
		end if;
	end;
	
	function TrBuildQuery(
		FromDate date,
		ToDate date,
		NationalCurrency in boolean,
		ForeignCurrency in boolean,
		MultyCurrency in boolean,
		RateDifference in boolean,
        ProfitDebit in boolean,
		DebitCredit in boolean,
		DebitBalance in integer,
		CreditBalance in integer,
		DebitAccID in integer,
		CreditAccID in integer,
		DebitCurrencyID in integer,
		CreditCurrencyID in integer,
		DebitAmount in number,
		CreditAmount in number,
		LAmount in number,
		OrderBy in varchar2 default 'p.ID',
		CustomBoolPrefix in varchar2 default null,
		CustomCondition in varchar2 default null,
		Delayed in boolean default True,
		Commited in boolean default True,
		Rejected in boolean default True,
        FilialsDebit in number default -1,
        FilialsCredit in number default -1,
        OperatorId in number default -1
     	)
		return varchar2
	as
		Result varchar2(2048);
		HasExpr boolean := False;
		OrExpr varchar2(300);
		HasOrExpr boolean := False;
		Buf varchar2(256) := ''; 
		status varchar2(96) := '';
--		FromDate date := sbop.get_date;
--		ToDate date := FromDate;
	begin
		Result := TrQuerySeg_Start;
		
		add_expression(
			Result, 
			'AND', 
			HasExpr, 
			TrQuerySeg_Dates||''''||TO_CHAR(FromDate)||''' AND '''||TO_CHAR(ToDate)||''')');
		
          if  FilialsDebit<>-1 then
          add_expression(Result, 'AND', HasExpr,'p.DebitID in (select id from account where filial='||FilialsDebit||')');
          end if;
        
          if  FilialsCredit<>-1 then
           add_expression(Result, 'AND', HasExpr,'p.CreditID in (select id from account where filial='||FilialsCredit||')');
          end if;
   
          if OperatorId<>-1 then
          add_expression(Result, 'AND', HasExpr,'(p.OperatorID='||OperatorId||')');
          end if;  
		
        
		if NationalCurrency then
			add_expression(OrExpr, 'OR', HasOrExpr, TrQuerySeg_NationalCurrency);
		end if; 
		if ForeignCurrency then
			add_expression(OrExpr, 'OR', HasOrExpr, TrQuerySeg_ForeignCurrency);
		end if;
		if MultyCurrency then
			add_expression(OrExpr, 'OR', HasOrExpr, TrQuerySeg_MultyCurrency);
		end if;
		if RateDifference then
			add_expression(OrExpr, 'OR', HasOrExpr, TrQuerySeg_RateDifference);
		end if;
        if ProfitDebit then
			add_expression(OrExpr, 'OR', HasOrExpr, TrQuerySeg_ProfitDebit);
		end if;
 

		-- add "OR" expression
		if HasOrExpr then
			add_expression(Result, 'AND', HasExpr, '('||OrExpr||')'||CRLF);
		end if;
		
		-- DebitBalance
		if DebitBalance <> 0 then
			add_expression(
				Result, 
				'AND', 
				HasExpr, 
				'(p.bal_cn1 = '
					||TO_CHAR(DebitBalance)
					||')'||CRLF
			);
		end if;		
		
		-- CreditBalance
		if CreditBalance <> 0 then
			add_expression(
				Result, 
				'AND',	
				HasExpr, 
				'(p.bal_cn1 = '
					||TO_CHAR(CreditBalance)
					||')'||CRLF
			);
		end if;
		
		-- DebitAccID
		if DebitAccID <> 0 then
			add_expression(Result, 'AND', HasExpr, '(p.DEBT = '||DebitAccID||')'||CRLF);
		end if;		

		-- CreditAccID
		if CreditAccID <> 0 then
			add_expression(Result, 'AND', HasExpr, '(p.KREDIT = '||CreditAccID||')'||CRLF);
		end if;		
		
		-- DebitCurrencyID
		if DebitCurrencyID <> -1 then
			add_expression(
				Result, 
				'AND', 
				HasExpr, 
				'(p.VAL_ACC = '
					||TO_CHAR(DebitCurrencyID)
					||')'||CRLF);
		end if;

		-- CreditCurrencyID
		if CreditCurrencyID <> -1 then
			add_expression(
				Result, 
				'AND', 
				HasExpr, 
				'(p.CurrencyID_C = '
					||TO_CHAR(CreditCurrencyID)
					||')'||CRLF);
		end if;
		
		HasOrExpr := False;
		if Delayed then
			add_expression(
				status,
				',',
				HasOrExpr,
				'1');
		end if;
		if Commited then
			add_expression(
				status,
				',',
				HasOrExpr,
				'2');
		end if;
		if Rejected then
			add_expression(
				status,
				',',
				HasOrExpr,
				'3');
		end if;
		
		if not HasOrExpr then
			status := '0';
		end if;			
		add_expression(
			Result,
			'AND',
			HasExpr,
			'(Status in ('||status||'))'||CRLF
		);

		-- Custom condition
		if (CustomCondition is not null) and (CustomBoolPrefix is not null) then
			add_expression(Result, CustomBoolPrefix, HasExpr, CustomCondition);
		end if;

--		add_expression(Result, '', HasExpr, TrQuerySeg_End);

		-- order expression
		add_expression(Result, '', HasExpr, TrQuerySeg_OrderBySegment||OrderBy||CRLF);
		
		return Result;				
	end;

	function get_acc_currency(AccID in integer)
		return integer
	as
		Result integer;
	begin
		open sbrep_clib.c_acc_currency(AccID);
			fetch sbrep_clib.c_acc_currency into Result;
		close sbrep_clib.c_acc_currency;
		return Result; 
	end;

end;
/


-- End of DDL Script for Package Body SMART.SBREP


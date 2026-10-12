-- Start of DDL Script for Package SMART.SB_CASHREPORT
-- Generated 14-Jul-2006 0:57:12 from SMART@sb

CREATE OR REPLACE 
PACKAGE sb_cashreport
  IS
  procedure add_cashinfo(v_ID number,v_persondoc varchar,v_issuedby varchar,v_seria varchar,v_docnumber varchar,v_fromwhen varchar);
  Function  CheckOICome(RefCome IN Bal_Spr1.bal_cn%Type) return Boolean;
  Procedure       ChooseCashSymbol(
          TransactionID PROVARCH.id%Type
     ,NewBSymbolValue KASSA_B.symbol%Type 
		                                    );
  procedure delete_cashinfo(v_ID number);
  Procedure  GetBankInfo(BankName OUT VARCHAR2,BankINN OUT VARCHAR2);
  Procedure GetCustomerInfo(
                           CustID IN Customers.ID%Type
                          ,CustINN OUT Customers.Inn%Type
													,CustName OUT Customers.Name%Type													
													 );
  Function  GetPresentDate
  return Date;
  PROCEDURE update_cashsettings
(V_cashbalancenational cash_settings.cashbalancenational %TYPE
 ,V_cashbalanceenglish  cash_settings.cashbalanceenglish %TYPE
 ,V_description_az      cash_settings.description_az %TYPE
 ,V_description_eng       cash_settings.description_eng %TYPE
 ,V_signatyre             cash_settings.signatyre %TYPE
 ,V_responsible_person    cash_settings.responsible_person %TYPE
 ,V_handover              cash_settings.handover %TYPE
 ,V_chief                 cash_settings.CHIEF %TYPE
 ,V_operator              cash_settings.operator  %TYPE
 ,V_cashier               cash_settings.cashier %TYPE
 ,v_amount                cash_settings.amount %TYPE
 ,v_chief_out             cash_settings.chief_out %TYPE
 ,v_accountant            cash_settings.accountant %TYPE   
 ,v_operator_out          cash_settings.operator_out %TYPE 
 ,v_cashier_out           cash_settings.cashier_out %TYPE          
 
 );

  procedure update_cashinfo(v_ID number,v_persondoc varchar,v_issuedby varchar,v_seria varchar,v_docnumber varchar,v_fromwhen varchar);
  procedure AddCashSymbols(v_symbol number, v_name varchar, v_mediocrity number);
  procedure DeleteCashSymbols(v_symbol number);
  procedure UpdateCashSymbols(v_old_symbol number,v_symbol number, v_name varchar, v_mediocrity number);
  procedure UpdatePackNo(TransactionID provarch.id%type, 
                       PackNo provarch.no_prov%type,
                       TableName varchar);
END; -- Package spec
/

-- Grants for Package
GRANT EXECUTE ON sb_cashreport TO sbr_cashdesk
/
GRANT EXECUTE ON sb_cashreport TO sbr_cashrefernce
/

CREATE OR REPLACE 
PACKAGE BODY sb_cashreport
IS
  Procedure       ChooseCashSymbol(
          TransactionID PROVARCH.id%Type
     ,NewBSymbolValue KASSA_B.symbol%Type 
		                                    )
Is
Begin
  update Provarch set KASSA_B=NewBSymbolValue
	where ID=TransactionID;
	commit;
End;
Procedure  GetBankInfo(BankName OUT VARCHAR2,BankINN OUT VARCHAR2)
Is
  BName BankInfo.bank%type;
	BInn  BankInfo.inn%type;
begin
  Select Bank,Inn into BName,BInn From BankInfo;
  	BankName :=BName;
	  BankInn :=BInn;
	Exception  When NO_DATA_FOUND Then
	Begin
	  BankInn :=' ';
		BankName:=' ';
	End;	
end;	
Function  GetPresentDate
return Date
Is
 PresentDate Date;  
Begin
  Select TEK_DAT Into PresentDate From SYSDAT;
	return PresentDate;	
End;
Procedure GetCustomerInfo(
                           CustID IN Customers.ID%Type
                          ,CustINN OUT Customers.Inn%Type
													,CustName OUT Customers.Name%Type													
													 )
Is

Begin
  Select INN,Name Into  CustINN,CustName 
	       From  Customers
				 Where ID=CustID;
	EXCEPTION  WHEN NO_DATA_FOUND  THEN
	BEGIN
	   CUSTINN :=-1;
		 CUSTNAME :='';
	END;			 
End;													 
Function  CheckOICome(RefCome IN Bal_Spr1.bal_cn%Type) return Boolean
Is
 Result Boolean;
 IsIncoming Integer;
Begin
  Select CashIncoming Into IsIncoming 
	     From Bal_Spr1 Where BAL_CN=RefCome;
	if  IsIncoming=1 then
	 Result :=True;
	else
	 Result :=False;
	end if;
	return Result; 		    
End; 

procedure add_cashinfo(v_ID number,v_persondoc varchar,v_issuedby varchar,v_seria varchar,v_docnumber varchar,v_fromwhen varchar)
is
begin
 Insert into CashInfo(
               ID
               ,person_doc
               ,issuedby 
               ,seria 
               ,docnumber
               ,fromwhen 
                      )
         Values(v_id 
                ,v_persondoc
                ,v_issuedby
                ,v_seria
                ,v_docnumber
                ,v_fromwhen
               );
 commit;                     
end;

procedure update_cashinfo(v_ID number,v_persondoc varchar,v_issuedby varchar,v_seria varchar,v_docnumber varchar,v_fromwhen varchar)
is
begin
 UpDate CashInfo
   set
    person_doc = v_persondoc,
    issuedby = v_issuedby,
    seria = v_seria,
    docnumber = v_docnumber,
    fromwhen = v_fromwhen
   Where
    ID=v_ID;  
   commit;  
end;

procedure delete_cashinfo(v_ID number)
is
begin
 Delete from CashInfo
  Where ID=v_ID;
 commit; 
end;  

procedure AddCashSymbols(v_symbol number, v_name varchar, v_mediocrity number)
is
begin
 Insert into Kassa_B
               (
                symbol,
                name, 
                mediocrity
                )
        values (
                v_symbol, 
                v_name,
                v_mediocrity
                );
  commit;                      
end;
--------------*****KNN*******-----------------------TKenan
PROCEDURE update_cashsettings
(V_cashbalancenational cash_settings.cashbalancenational %TYPE
 ,V_cashbalanceenglish  cash_settings.cashbalanceenglish %TYPE
 ,V_description_az      cash_settings.description_az %TYPE
 ,V_description_eng       cash_settings.description_eng %TYPE
 ,V_signatyre             cash_settings.signatyre %TYPE
 ,V_responsible_person    cash_settings.responsible_person %TYPE
 ,V_handover              cash_settings.handover %TYPE
 ,V_chief                 cash_settings.CHIEF %TYPE
 ,V_operator              cash_settings.operator  %TYPE
 ,V_cashier               cash_settings.cashier %TYPE
 ,v_amount                cash_settings.amount %TYPE
 ,v_chief_out             cash_settings.chief_out %TYPE
 ,v_accountant            cash_settings.accountant %TYPE   
 ,v_operator_out          cash_settings.operator_out %TYPE 
 ,v_cashier_out           cash_settings.cashier_out %TYPE          
 
 )
 is
 rec integer; 
 begin
 select count(*) into rec from cash_settings;
 if rec=0 then 
 insert into cash_settings
 (cashbalancenational, cashbalanceenglish, description_az,
       description_eng, signatyre, responsible_person, handover, chief,
       operator, cashier, amount, chief_out, operator_out, cashier_out,
       accountant)
 values
 ( v_cashbalancenational, v_cashbalanceenglish, v_description_az,
       v_description_eng, v_signatyre, v_responsible_person, v_handover, v_chief,
       v_operator, v_cashier, v_amount, v_chief_out, v_operator_out, v_cashier_out,
       v_accountant);
       end if;
       
             if rec=1 then
             update cash_settings set
               cashbalancenational=v_cashbalancenational,
               cashbalanceenglish=v_cashbalanceenglish,
               description_az=v_description_az,
               description_eng=v_description_eng,
               signatyre=v_signatyre,
               responsible_person=v_responsible_person,
               handover=v_handover,
               chief=v_chief,
               operator=v_operator,
               cashier=v_cashier,
               amount=v_amount,
               chief_out=v_chief_out,
               operator_out=v_operator_out,
               cashier_out=v_cashier_out,
               accountant=v_accountant;
               end if;
               commit;
               END update_cashsettings;
---------------------------------------------------------------------------
procedure UpdateCashSymbols(v_old_symbol number,v_symbol number, v_name varchar, v_mediocrity number)
is
begin
 Update Kassa_B
   set 
    symbol = v_symbol
   ,name = v_name 
   ,mediocrity = v_mediocrity
  where 
   symbol = v_old_symbol; 
 commit;                      
end;

procedure DeleteCashSymbols(v_symbol number)
is
begin
 Delete from Kassa_B
  where symbol = v_symbol;
 commit; 
end;

procedure UpdatePackNo(TransactionID provarch.id%type, 
                       PackNo provarch.no_prov%type,
                       TableName varchar)
is
 SqlStr constant varchar(300) :='Update '||TableName||' set no_prov ='||''''||PackNo||''''||' where id='||to_char(TransactionID);
begin
 Execute Immediate sqlStr;
 Commit;
end;
END;
/


-- End of DDL Script for Package SMART.SB_CASHREPORT



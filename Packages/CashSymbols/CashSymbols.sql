-- Start of DDL Script for Package Body SMART.SB_CASHREPORT
-- Generated 08-Apr-2003 1:42:02 PM from SMART@ORAWIN

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
  procedure update_cashinfo(v_ID number,v_persondoc varchar,v_issuedby varchar,v_seria varchar,v_docnumber varchar,v_fromwhen varchar);
  procedure AddCashSymbols(v_symbol number, v_name varchar, v_mediocrity number);
  procedure DeleteCashSymbols(v_symbol number);
  procedure UpdateCashSymbols(v_old_symbol number,v_symbol number, v_name varchar, v_mediocrity number);
END; -- Package spec
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
	if  IsIncoming=0 then
	 Result :=False;
	else
	 Result :=True;
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

END;
/


-- End of DDL Script for Package Body SMART.SB_CASHREPORT



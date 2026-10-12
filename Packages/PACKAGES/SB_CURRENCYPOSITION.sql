CREATE OR REPLACE PACKAGE   SB_CURRENCYPOSITION
  IS 
  /* **************************************************************** */
 /*        SmartBank SB_CURRENCYPOSITION package                     */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
	
  Type  Cursor_Type is ref Cursor;
	
  Function  GetBankDay return Date;
  Procedure  OpenCursor(
   ACursor OUT Cursor_Type,
	  AStrParam IN VarChar2
											);
  Procedure  CreateTable(TableName VarChar2);
  Function  GetUserName 
return VarChar2;
 Procedure Get_CurrencyPosition(
         FirstDate Date,
				 LastDate  Date,		
				 BalanceType Integer 					
															);

  procedure  DataChecking(
           ADate  Date
                        );
END; -- Package spec
/
CREATE OR REPLACE PACKAGE BODY SB_CURRENCYPOSITION
IS
/* **************************************************************** */
 /*        SmartBank SB_CURRENCYPOSITION package                     */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
Procedure  CreateTable(TableName VarChar2)
is
  QueryString VarChar2(512);
	Temp Integer;

	DotPos integer := Instr(TableName, '.');
	ATableName varchar2(32);
Begin
	if DotPos <> 0 then
		ATableName := substr(TableName, DotPos+1, Length(TableName)-DotPos);
	else
		ATableName := TableName; 
	end if;
	
	select count(*)
		into Temp 
	from sys.all_tables
	where (owner = GetUserName) and (TABLE_NAME = Upper(ATableName));

--  Select  Count(*) Into  Temp from Tab Where TName=Upper(TableName);
	
	if   Temp=1  then
	  EXECUTE IMMEDIATE 'Drop Table '||TableName; 
	end if;	 
  QueryString:='Create  Table '||TableName||'
	(BankID VarChar2(64),
	 ShortName VarChar2(64), 
     Using  Number(5),
	 PresentDate Date,
	 Currency Number(3),
	 Offical VarChar2(64),
	 Balance Number(10),	 
     Incoming Integer,
	 Active  Number,
	 Passive Number,
	 Rate    Number,
	 Extra   Integer
	)';
	EXECUTE IMMEDIATE  QueryString;
	Commit;
End; 
Function  GetBankDay return Date
is
  PresentDate Date;
Begin
  Select  TEK_DAT Into  PresentDate 
	                From  SYSDAT;
  return  PresentDate;									
End;
Procedure Get_CurrencyPosition(
         FirstDate Date,
				 LastDate  Date,		
				 BalanceType Integer 					
															)														
Is  															
  Cursor  BankWorkingDays 
	 is (Select Distinct Dat From OperKurs
	    Where (Dat>=FirstDate)And(Dat<=LastDate));
	Cursor CurrencySet 
	 is ( Select Valute,OFFICAL,USING,VAL_NAME  
			 From AValute); 	
	PresentDate Date;
	Rate  OperKurs.ostat%Type;
	Currency  AValute.Valute%Type;
	OfficalID AValute.Offical%Type;
	BankID   varchar2(64); --BankInfo.kod_b%Type;
	QueryStr VarChar2(1424);		
--  Result Boolean:=True;
	TableName VarChar2(64);
	BalanceBill VarChar2(32);
	Reference  VarChar2(32);
	DefaultOffical AValute.Offical%Type;
	DefaultCurrency AValute.Valute%Type;
	USED   AValute.Using%Type;
	ShortName Avalute.Val_Name%Type;
	DefaultUSED AValute.Using%Type;									 
Begin
  BalanceBill :='Ac.BAL_CN'||TO_CHAR(BalanceType);
	Reference :=' BAL_SPR'||TO_CHAR(BalanceType);
  TableName := GetUserName||'.CurrencyPosition_'||GetUserName;
  CreateTable(TableName);
	
	Select Offical,Using Into DefaultOffical,DefaultUsed
	 from AValute Where Valute=0;
	
	DefaultCurrency :=0;	
	
	--Select  '0'||TO_CHAR (val_mov) val_mov Into BankID
	-- From  BankInfo;
     
     	Select  val_mov Into BankID
	 From  BankInfo;
     
--	 raise_application_error(-20004, bankid);
  Open BankWorkingDays;
	 Loop
	   Fetch  BankWorkingDays Into  PresentDate;
		 Exit When  BankWorkingDays%notFound;		  
		 Open CurrencySet; 		  
			 Loop
			   Fetch  CurrencySet Into  Currency,OfficalID,USED,ShortName;
				 Exit When CurrencySet%notFound;
				 BEGIN
				  Select  Ostat Into Rate
                   From OperKurs 
					  Where  (Dat=PresentDate)And(Val_Kod=Currency); 					 
				  EXCEPTION  WHEN  NO_DATA_FOUND  THEN
   					Rate :=null;
				 END;
			if   not  (Rate is null)  then 	 
	       QueryStr:='Insert  Into '||TableName||
   				 '(Select '''||BankID||''' BankID,'||''''||ShortName||''''||' ShortName,'
					            ||TO_CHAR(USED)||' Using,'
          						||''''||TO_CHAR(PresentDate)||''''||
											' PresentDate,'||TO_CHAR(Currency)||' Currency,'||''''||OfficalID||''''||' Offical,'
											||BalanceBill||' Balance
											,Max(B.CurrencyPosition) Incoming
											,Sum(SB_BALANCE.SALDOTOACTIVE(Ar.OSTAT,1,B.Bal_CN)) Active
											,Sum(SB_BALANCE.SALDOTOPASSIVE(Ar.OSTAT,1,B.Bal_CN)) Passive,
										  '||Rate||' Rate,0 Extra From  Account Ac,Archost Ar,'||Reference||' B
											Where  (Ac.ID=Ar.Acc_ID)And(Ar.DatDate='
											||''''||TO_CHAR(PresentDate)||''''||')And(B.BAL_CN='||BalanceBill||')And(Ac.Val_Acc=
											'||Currency||
											') Group By '||BalanceBill||')';
						
--                       update a1 set c5=QueryStr;commit;
   	
		          Execute Immediate QueryStr;
							 												
						
				 	if   Currency <> 0 then
    				QueryStr:='Insert  Into '||TableName||
   				 '(Select '''||BankID||''' BankID,'||''''||'AZM'||''''||' ShortName,'
					           ||TO_CHAR(DefaultUSED)||' Using,'
					           ||''''||TO_CHAR(PresentDate)||''''||
											' PresentDate,'||TO_CHAR(DefaultCurrency)||' Currency,'
											||''''||DefaultOffical||''''||'  Offical,'
											||BalanceBill||' Balance
												,Max(B.CurrencyPosition) Incoming										
											  ,Sum(SB_BALANCE.SALDOTOACTIVE(Ar.POK_OSTAT,1,B.Bal_CN)) Active												
  										  ,Sum(SB_BALANCE.SALDOTOPASSIVE(Ar.POK_OSTAT,1,B.Bal_CN)) Passive,
										  '||1||' Rate,0 Extra From  Account Ac,Archost Ar,'||Reference||' B
											Where  (Ac.ID=Ar.Acc_ID)And(Ar.DatDate='
											||''''||TO_CHAR(PresentDate)||''''||')And(B.BAL_CN='||BalanceBill||
											')And(Ac.Val_Acc='||Currency||
											') Group By '||BalanceBill||')';
                                            
                                      --update a1 set c5=QueryStr;commit;
 					 			
					  	Execute Immediate QueryStr; 				   							
						 end if;						 
					end if;
						 			
										
                                       
----------------------------OUT_BALANACE-------------------------- TKenan
if   not  (Rate is null)  then 	 
	       QueryStr:='Insert  Into '||TableName||
   				 '(Select '''||BankID||''' BankID,'||''''||ShortName||''''||' ShortName,'
					            ||TO_CHAR(USED)||' Using,'
          						||''''||TO_CHAR(PresentDate)||''''||
											' PresentDate,'||TO_CHAR(Currency)||' Currency,'||''''||OfficalID||''''||' Offical,'
											||BalanceBill||' Balance
											,Max(B.CurrencyPosition) Incoming
											,Sum(OUT_SB_BALANCE.SALDOTOACTIVE(Ar.OSTAT,1,B.Bal_CN)) Active
											,Sum(OUT_SB_BALANCE.SALDOTOPASSIVE(Ar.OSTAT,1,B.Bal_CN)) Passive,
										  '||Rate||' Rate,0 Extra From  Out_Account Ac,Out_Archost Ar,'||Reference||' B
											Where  (Ac.ID=Ar.Acc_ID)And(Ar.DatDate='
											||''''||TO_CHAR(PresentDate)||''''||')And(B.BAL_CN='||BalanceBill||')And(Ac.Val_Acc=
											'||Currency||
											') Group By '||BalanceBill||')';
						
--                      update a1 set c5=QueryStr;commit;
   	
		          Execute Immediate QueryStr;
							 												
							
if   Currency <> 0 then
    				QueryStr:='Insert  Into '||TableName||
   				 '(Select '''||BankID||''' BankID,'||''''||'AZM'||''''||' ShortName,'
					           ||TO_CHAR(DefaultUSED)||' Using,'
					           ||''''||TO_CHAR(PresentDate)||''''||
											' PresentDate,'||TO_CHAR(DefaultCurrency)||' Currency,'
											||''''||DefaultOffical||''''||'  Offical,'
											||BalanceBill||' Balance
												,Max(B.CurrencyPosition) Incoming										
											  ,Sum(OUT_SB_BALANCE.SALDOTOACTIVE(Ar.POK_OSTAT,1,B.Bal_CN)) Active												
  										  ,Sum(OUT_SB_BALANCE.SALDOTOPASSIVE(Ar.POK_OSTAT,1,B.Bal_CN)) Passive,
										  '||1||' Rate,0 Extra From  OUT_Account Ac,OUT_Archost Ar,'||Reference||' B
											Where  (Ac.ID=Ar.Acc_ID)And(Ar.DatDate='
											||''''||TO_CHAR(PresentDate)||''''||')And(B.BAL_CN='||BalanceBill||
											')And(Ac.Val_Acc='||Currency||
											') Group By '||BalanceBill||')';
                                            
                                      --update a1 set c5=QueryStr;commit;
 					 			
					  	Execute Immediate QueryStr; 				   							
						 end if;						 
					end if;----------------------modified by TKenan at 06.06.2006
						 			
					
-------------------------------------------------------------------------------------------										  	       		          
			 End Loop;			 
     Close CurrencySet;			  			   		  
	 End loop;
	  
	Close BankWorkingDays;
	
	Commit;
	
 Execute Immediate 'Delete From '||TableName||' Where Active=0 And Passive=0 ';Commit;
      	
	EXCEPTION  WHEN  OTHERS  THEN
	BEGIN
 	   Close BankWorkingDays;
		 Close CurrencySet;
		 raise;
	END;  
End;
Procedure  OpenCursor(
   ACursor OUT Cursor_Type,
	  AStrParam IN VarChar2
											)
Is
Begin
	if  ACursor%IsOpen then
	  Close ACursor;
	end if;	
	Open ACursor For  AStrParam;		  
End;
Function  GetUserName 
return VarChar2 
Is
Begin
  return User;
End;
procedure  DataChecking(
           ADate  Date
                        )
Is
  Cur Integer;
	QueryStr VarChar2(1124);
	TblName VarChar2(128);
	MainTblName VarChar2(128);
	IsExsist Integer;
	NRow     Integer;
	AStrCreateTable  VarChar2(1124);
	SVMValue  BankInfo.SVM%type;
	PokSvmValue  Number;
	PresentRate Number; 
Begin
  Select  OSTAT Into PresentRate From OperKurs
	  Where Dat=ADate and VAL_KOD=1;
  Select  SVM  Into  SvmValue  From BankInfo;
	PokSvmValue :=Round(SVMValue*PresentRate);
					  
  MainTblName := GetUserName||'.CPSUM_'||GetUserName;
  TblName := GetUserName||'.CurrencyPosition_'||GetUserName;
	AStrCreateTable :='
	Create  Table '||MainTblName||'(
	ShortName VarChar2(5)
 ,Currency  Number
 ,Rate      Number
 ,Actives   Number
 ,Pok_Actives Number
 ,Passives  Number
 ,Pok_Passives Number
 ,Limit Number 
	)';
  QueryStr :=
	'Insert  Into '||MainTblName||' 
 Select   
 ActiveSet.ShortName as ShortName 
,ActiveSet.Currency as Currency 
,ActiveSet.Rate  as Rate 
,Round(ActiveSet.Actives) as Actives
,Round(ActiveSet.Pok_Actives) as Pok_Actives
,Round(PassiveSet.Passives) as Passives
,Round(PassiveSet.Pok_Passives) as Pok_Passives 
,AValute.Limit as  Limit
From 
(Select 
 Currency
,Max(Extra) as Extra 
,Max(Shortname) as ShortName 
,Max(Rate) as Rate 
,Round(Sum(Active)) as Actives 
,Round(Sum(Active))*Max(Rate) as Pok_Actives 
From '||TblName|| 
' Where 
 Currency<>0 and
 Extra=0 and
 ((Incoming=1)or(Incoming=3)) and
 PresentDate=:ADate
 Group by
 Currency) ActiveSet,
(Select 
 Currency
,Max(Shortname) as ShortName
,Max(Rate) as Rate 
,Round(Sum(Passive)) as Passives
,Round(Sum(Passive))*Max(Rate) as Pok_Passives
 From '||TblName||' Where 
 Currency<>0 and
 Extra=0 and 
 ((Incoming=2)or(Incoming=3)) and 
 PresentDate=:ADate 
 Group by Currency) PassiveSet
,AValute 
 Where 
 (ActiveSet.Currency=PassiveSet.Currency)
 and(ActiveSet.Currency=AValute.Valute)';

	select count(*)
		into IsExsist 
	from sys.all_tables
	where (owner = GetUserName) and (TABLE_NAME = UPPER('CPSUM_'||GetUserName));

  if  IsExsist=1  then
    Execute Immediate  'Drop  Table '||MainTblName;
	end if;
	Execute Immediate  AStrCreateTable;  
      	Cur:=dbms_sql.open_cursor;
        dbms_sql.parse(Cur,QueryStr,dbms_sql.v7);
				dbms_sql.bind_variable(Cur,':ADate',ADate);
        NRow:=dbms_sql.execute(Cur);
        dbms_sql.Close_cursor(Cur);
				
  Execute Immediate  'Update  '||MainTblName||' Set Passives=Passives+'||TO_Char(SVMValue)||',Pok_Passives=Pok_Passives+'||TO_Char(PokSVMValue)||' Where Currency=1';
  commit;					  
End;		  	
																									
END;




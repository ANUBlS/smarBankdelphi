CREATE OR REPLACE PACKAGE OUT_SB_BALANCE
IS
/* **************************************************************** */
 /*        SmartBank OUT_SB_BALANCE package                        */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
Type Cursor_Type is ref cursor ; 
  function  getBankDay 
return Date;
  procedure   getBankInfo(
  BankName OUT VarChar2
 ,BankCode OUT Number
 ,Manager  OUT VarChar2
 ,Accountant OUT varchar2        
		                     );
  Procedure sb_SumSelections(     
      FirstDate Date, 
       LastDate Date,
 BalanceBill Integer, --Balance account
    Currency Integer, --Currency Id (-1 All currency)
    Surface  Integer,  --Surface (0-OSTAT,1-POK_OSTAT)
   ReturnParametr1  OUT VarChar2,
   ReturnParametr2  OUT VarChar2 
                     );
  Function sb_AccountSelections(     
   FirstDate  Date,
   LastDate   Date,        
 BalanceBill Integer, --Balance Type
    Currency Integer, --Currency Id (-1 All currency)
    Surface  Integer, --Surface (0-OSTAT,1-POK_OSTAT)
  BalanceID  Integer)
 return VarChar2;
  Function  sb_TurnSelections(
  FirstDate  Date,
  LastDate   Date,         
	AccID    VarChar2
														)
 return  VarChar2;
  FUNCTION SALDOTOACTIVE
  ( aValue IN Number,
	 BalType IN integer,
	 Balance IN integer)
  RETURN  Number;
  FUNCTION SALDOTOPASSIVE
  ( aValue IN Number,
    BalType IN integer,
		Balance IN integer
    )
  RETURN  Number;
  Procedure OpenCursor(ACursor IN OUT Cursor_Type,AStrParam1 IN VarChar2,AStrParam2 IN VarChar2);
  Procedure sb_BalanceSelections(     
      FirstDate IN Date, 
       LastDate IN Date,
 BalanceBill IN Integer, --Balance account
    Currency IN Integer, --Currency Id (-1 All currency)
    Surface  IN Integer,  --Surface (0-OSTAT,1-POK_OSTAT)		
    ReturnParametr1  OUT VarChar2,
    ReturnParametr2  OUT VarChar2,
		Branch  IN Integer
  -- ReturnParametr3  OUT VarChar2
                     );
  procedure NON_EXSIST_DATES(
                             FirstDate in out date ,
                             LastDate  in date ,
                             BranchID in integer,
                             NonExistsBalances in varchar2,
                             NonExistsAccounts in varchar2 
                             );
End;
/
CREATE OR REPLACE PACKAGE BODY OUT_SB_BALANCE
IS
/* **************************************************************** */
 /*        SmartBank OUT_SB_BALANCE package                        */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
 TableName constant varchar2(32) := 'OUT_DBD_BALANCE';
  procedure NON_EXSIST_DATES(
                             FirstDate in out date ,
                             LastDate  in date ,
                             BranchID in integer,
                             NonExistsBalances in varchar2,
                             NonExistsAccounts in varchar2 
                             )
  is
    
    cursor c_NonExsistDate(ADate date) is
    select count(*) as RecCount from operkurs 
    where dat = ADate;
     
    Temp Integer;
    ATableName varchar2(64) := User||'.'||TableName;
    DateCount Integer;
    DateIndex Integer := 0; 
    PersentDate date;
    rowNED c_NonExsistDate%rowtype; 
    ACursor integer;
    NRow Integer;
    Query varchar2(2048);
    FPersentDate date ;
    BranchFilter varchar2(64);
    NonExistsBalancesExpr varchar2(255);
    NonExistsAccountsExpr varchar2(255);
    
  begin
  
    select count(*)
   		into Temp 
   	from sys.all_tables
   	where (owner = User) and (TABLE_NAME = TableName);
    
    if  Temp > 0 then
    execute immediate 'drop table '||ATableName;
    end if;
    execute immediate 'create table '||ATableName
    ||' ('
    ||' ADate date ,'
    ||' AccountNum varchar2(32) ,'
    ||' AccountName varchar2(1024) ,'
    ||' Active number ,'
    ||' Passive number ,'
    ||' Debt_Turnover number ,'
    ||' Credit_Turnover number '    
    ||' )'; 
    if BranchID <> -1 then 
    BranchFilter :=' and (Ac.Filial='||TO_CHAR(BranchID)||') ';
    else
    BranchFilter :='';
    end if;
    /*if  NonExistsBalances is null  then
         -- raise_application_error(-20001,'NULL');
    end if;*/
    if Length(NonExistsBalances) > 0 then
      NonExistsBalancesExpr := ' and (ac.bal_cn1 not in('||NonExistsBalances||')) ';
    else
      NonExistsBalancesExpr := '';
     -- raise_application_error(-20001,'OLMADI'); 
    end if;    
    
    if Length(NonExistsAccounts) > 0 then
      NonExistsAccountsExpr := ' and (ac.acc_no not in('||NonExistsAccounts||')) ';
    else
      NonExistsAccountsExpr := '';
     -- raise_application_error(-20001,'OLMADI'); 
    end if;
                     
    Query := 
     ' ( select
           ar.DatDate as ADate ,
           b.Bal_cn  as AccountNum ,  
           Min(b.BalName) as AccName ,
           Sum(Out_SB_MTOUTVIEW.ACTIVE(Ar.POK_OSTAT ,B.TYPEID,B.ADDITIONALTYPEID)) as Active  ,
           Sum(Out_SB_MTOUTVIEW.Passiv(Ar.POK_OSTAT ,B.TYPEID,B.ADDITIONALTYPEID)) as Passive ,
           Sum(ar.POK_OBR_D) as Debt_Turnover ,
           Sum(ar.POK_OBR_K) as Credit_Turnover 
         from
            Out_account ac,
            Out_archost ar,
            Out_bal_spr1 b
         where 
            ac.ID = Ar.Acc_ID '||NonExistsBalancesExpr||NonExistsAccountsExpr||'
            and ac.Bal_cn1 = B.Bal_cn '||BranchFilter||'            
            and (ar.DatDate >= :FirstDate) and (ar.DatDate <= :LastDate)
         group by
            ar.DatDate ,
            b.Bal_cn )';
    ACursor:=dbms_sql.open_cursor;
    dbms_sql.parse(ACursor,'insert into '||ATableName||Query,dbms_sql.v7);
    dbms_sql.BIND_VARIABLE (ACursor, ':FirstDate',FirstDate);
    dbms_sql.BIND_VARIABLE (ACursor, ':LastDate', LastDate);  
    NRow:=dbms_sql.execute(ACursor);
    dbms_sql.Close_cursor(ACursor);
    DateCount := LastDate - FirstDate;
    if DateCount < 0 then
    raise_application_error(-20032,'Firs Date must less than Last Date!');  
    end if;
    while DateIndex <= DateCount
    loop
      PersentDate := FirstDate+DateIndex;      
      open c_NonExsistDate(PersentDate);
      fetch c_NonExsistDate into rowNED;
      
      if rowNED.RecCount = 0 then      
      select MAX(Dat) into FPersentDate
      from operkurs where dat < PersentDate;
    Query := 
     ' ( select
           :THIS_DATE as ADate ,
           b.Bal_cn  as AccountNum ,  
           Min(b.BalName) as AccName ,
           Sum(Out_SB_MTOUTVIEW.ACTIVE(Ar.POK_OSTAT ,B.TYPEID,B.ADDITIONALTYPEID)) as Active  ,
           Sum(Out_SB_MTOUTVIEW.Passiv(Ar.POK_OSTAT ,B.TYPEID,B.ADDITIONALTYPEID)) as Passive ,
           Sum(ar.POK_OBR_D) as Debt_Turnover ,
           Sum(ar.POK_OBR_K) as Credit_Turnover 
         from
            Out_account ac,
            Out_archost ar,
            Out_bal_spr1 b
         where 
            ac.ID = Ar.Acc_ID'||NonExistsBalancesExpr||NonExistsAccountsExpr||'
            and ac.Bal_cn1 = B.Bal_cn '||BranchFilter||'    
            /*and ac.acc_no not in (:KURSACCS)*/
            and (ar.DatDate >= :FirstDate) and (ar.DatDate <= :LastDate)
         group by
            ar.DatDate ,
            b.Bal_cn )';   
      ACursor:=dbms_sql.open_cursor;
      dbms_sql.parse(ACursor,'insert into '||ATableName||Query,dbms_sql.v7);      
      dbms_sql.BIND_VARIABLE (ACursor, ':THIS_DATE', PersentDate);
      dbms_sql.BIND_VARIABLE (ACursor, ':FirstDate', FPersentDate);      
      dbms_sql.BIND_VARIABLE (ACursor, ':LastDate', FPersentDate);    
      NRow:=dbms_sql.execute(ACursor);
      dbms_sql.Close_cursor(ACursor);          
    
    
    
      end if;
      close c_NonExsistDate;
      DateIndex := DateIndex + 1;
    end loop;
    commit;  
  end;

/**********************************************************************/
FUNCTION SALDOTOPASSIVE
  ( aValue IN Number,
    BalType IN integer,
		Balance IN integer
    )
  RETURN  Number IS
  ReturnValue Number;
	aTID  Integer;
  aAdd   Integer;
BEGIN
    if  BalType=1  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr1
					Where Bal_cn=Balance;
	end if;
	if  BalType=2  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr2
					Where Bal_cn=Balance;
	end if;
	if  BalType=3  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr3
					Where Bal_cn=Balance;
	end if;
	if  BalType=4  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr4
					Where Bal_cn=Balance;
	end if;

  if aValue=0 then
   return 0;
  end if;
  
  if  aValue>0 then
    ReturnValue :=abs(aValue);
   else
    ReturnValue :=0;
  end if;
  
  if ReturnValue<>0 then
  if  (aTID<>aAdd) then   
   if  aAdd=1 then
       ReturnValue :=0;
   end if;
   end if;
   else
   if  (aAdd=2)And(aADD<>aTID) then
   ReturnValue :=-abs(aValue);
   end if;   
  end if;
  Return ReturnValue;
END;

--***************************
FUNCTION SALDOTOACTIVE
  ( aValue IN Number,
	 BalType IN integer,
	 Balance IN integer)
  RETURN  Number 
IS
  ReturnValue Number;
	aTID integer;
	aAdd integer;
BEGIN
  if  BalType=1  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr1
					Where Bal_cn=Balance;
	end if;
	if  BalType=2  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr2
					Where Bal_cn=Balance;
	end if;
	if  BalType=3  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr3
					Where Bal_cn=Balance;
	end if;
	if  BalType=4  then
   Select  TypeID,AdditionalTypeId 
	        Into  aTid,aAdd From Out_Bal_Spr4
					Where Bal_cn=Balance;
	end if;
					   
  if aValue=0 then
   return 0;
  end if;
  
  if  aValue<0 then
    ReturnValue :=abs(aValue);
   else
    ReturnValue :=0;
  end if;
  
  if ReturnValue<>0 then
  if  (aTID<>aAdd) then   
   if  aAdd=2 then
       ReturnValue :=0;
   end if;
   end if;
   else
   if  (aAdd=1)And(aADD<>aTID) then
   ReturnValue :=-abs(aValue);
   end if;   
  end if;
  return ReturnValue;
END;
--****************************************************************************
Procedure sb_SumSelections(     
      FirstDate Date, 
       LastDate Date,
 BalanceBill Integer, --Balance account
    Currency Integer, --Currency Id (-1 All currency)
    Surface  Integer,  --Surface (0-OSTAT,1-POK_OSTAT)
   ReturnParametr1  OUT VarChar2,
   ReturnParametr2  OUT VarChar2 
                     ) 
is
  Header 
     constant VarChar2(512):='Select Sum(FirstRemainder.FirstActive) FA,Sum(FirstRemainder.FirstPassive) FP,Sum(LastRemainder.LastActive) LA,Sum(LastRemainder.LastPassive) LP,Sum(TurnOver.DTurnOver) D,Sum(TurnOver.KTurnOver) K From ';
  ResBody 
     constant VarChar2(512):='Where (FirstRemainder.BalanceBill=LastRemainder.BalanceBill)And(LastRemainder.BalanceBill=TurnOver.BalanceBill)And(LastRemainder.BalanceBill=B.BAL_CN) ';
  cUnionHeader 
     constant VarChar2(512):=' 0 FA,0 FP,Sum(LastRemainder.LastActive),Sum(LastRemainder.LastPassive),Sum(TurnOver.DTurnOver),Sum(TurnOver.KTurnOver) From ';
  cUnionBody
     constant VarChar2(512):=' Where (not LastRemainder.BalanceBill in (Select Distinct  B.Bal_cn from  out_ArchOst Ar,Out_Account Ac, Out_BAL_SPR1 B Where (Ar.ACC_ID=Ac.ID)And(Ac.BAL_CN1=B.BAL_CN)And(Ar.DatDate=';     
  Result VarChar2(2048);  
  StatementFilter  VarChar2(32):='BAL_CN';
  ReferenceFilter  VarChar2(32):=' BAL_SPR';
  FirstRemFilter  VarChar2(556);
  LastRemFilter   VarChar2(556);  
  TurnFilter Varchar2(556);
  UnionStr   VarChar2(3270);
  UnionBody  VarChar2(3270);
  UnionHeader VarChar2(556);
  CurrencyFilter   VarChar2(128);  
  DepositoryFilter VarChar2(32);
  Remainder VarChar2(16);
  DTurnOver VarChar2(16);
  KTurnOver VarChar2(16);
  FDate  Date;
  LDate  Date; 
	PresentDate Date;   
begin

  StatementFilter :=StatementFilter||TO_CHAR(BalanceBill);
  ReferenceFilter :=ReferenceFilter||TO_CHAR(BalanceBill);
  
  if  Currency=-1 then
    CurrencyFilter :=null;
   else
    CurrencyFilter:='And(VAL_ACC='||TO_CHAR(Currency)||')';
  end if;
    
  if   (Surface=1)or(Currency=-1)  then     
    Remainder :='POK_OSTAT';
    DTurnOver :='POK_OBR_D';
    KTurnOver :='POK_OBR_K';
   else
    Remainder :='OSTAT';
    DTurnOver :='OBR_D';
    KTurnOver :='OBR_K';    
  end if;     
   Select  Max(DatDate) Into FDate  From ArchOst
           Where  DatDate<=FirstDate;                
   Select  Max(DatDate) Into LDate  From ArchOst
           Where  DatDate<=LastDate;
					 
		PresentDate:=FDate;			 
		   
   Select  Max(DatDate) Into FDate  From ArchOst
           Where  DatDate<FirstDate;       
                 
  FirstRemFilter :='(Select Sum(SB_MTOUTVIEW.ACTIVE(Ar.'
  ||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) FirstActive,Sum(Out_SB_MTOUTVIEW.PASSIV(Ar.'||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) FirstPassive,B.BAL_CN BalanceBill,'
  ||''''||TO_CHAR(FDate)||''''||' FDate From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate='||''''||TO_DATE(FDate)
  ||''''||')'||CurrencyFilter||' Group By B.BAL_CN) FirstRemainder';

  LastRemFilter :='(Select Sum(Out_SB_MTOUTVIEW.ACTIVE(Ar.'
  ||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) LastActive,Sum(Out_SB_MTOUTVIEW.PASSIV(Ar.'||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) LastPassive,B.BAL_CN BalanceBill,'
  ||''''||TO_CHAR(LDate)||''''||' LDate From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate='||''''||TO_DATE(LDate)
  ||''''||')'||CurrencyFilter||' Group By B.BAL_CN) LastRemainder';

  TurnFilter :='(Select Sum('||DTurnOver||') DTurnOver,Sum('
  ||KTurnOver||') KTurnOver,B.BAL_CN BalanceBill From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate<='||''''||TO_DATE(LDate)  
  ||''''||')And(Ar.DatDate>='||''''
  ||TO_CHAR(PresentDate)||''''||')'||CurrencyFilter||' Group By B.BAL_CN) TurnOver';
  
  UnionHeader:='Union Select '||cUnionHeader;
  UnionBody  :=cUnionBody||''''||TO_CHAR(FDate)
               ||''''
               ||')))and(Bal_cn=LastRemainder.BalanceBill)and(LastRemainder.BalanceBill=TurnOver.BalanceBill) Order By Bal_cn';
  UnionStr :=UnionHeader
             ||LastRemFilter||','
             ||TurnFilter||','
             ||ReferenceFilter
             ||UnionBody;
              
  Result :=Header||FirstRemFilter||','
           ||LastRemFilter||','
           ||TurnFilter||','
           ||ReferenceFilter||' B '
           ||ResBody;
 if  LDate = FDate then
  ReturnParametr2 :=')';
  ReturnParametr1 :=Result;
 else          
  ReturnParametr2 :=UnionStr||')';
  ReturnParametr1 :='Select Sum(FA),Sum(FP),Sum(LA),Sum(LP),Sum(D),Sum(K) from ('||Result;
 end if;      
-- Update a1 set c5 = ReturnParametr1||ReturnParametr2; commit;            
end;

--*****************************************************************************
/*  Getting  Balance Selections! */  

Procedure sb_BalanceSelections(     
      FirstDate IN Date, 
       LastDate IN Date,
 BalanceBill IN Integer, --Balance account
    Currency IN Integer, --Currency Id (-1 All currency)
    Surface  IN Integer,  --Surface (0-OSTAT,1-POK_OSTAT)		
    ReturnParametr1  OUT VarChar2,
    ReturnParametr2  OUT VarChar2,
		Branch  IN Integer
  -- ReturnParametr3  OUT VarChar2
                     ) 
is
  Header 
     constant VarChar2(512):='Select FirstRemainder.FDate,FirstRemainder.FirstActive,FirstRemainder.FirstPassive,LastRemainder.LDate,LastRemainder.LastActive,LastRemainder.LastPassive,TurnOver.DTurnOver,TurnOver.KTurnOver,B.BAL_CN,B.BALNAME From ';
  ResBody 
     constant VarChar2(512):='Where (FirstRemainder.BalanceBill=LastRemainder.BalanceBill)And(LastRemainder.BalanceBill=TurnOver.BalanceBill)And(LastRemainder.BalanceBill=B.BAL_CN) ';
  cUnionHeader 
     constant VarChar2(512):=' FDate,0 FirstActive,0  FirstPassive,LastRemainder.LDate,LastRemainder.LastActive,LastRemainder.LastPassive,TurnOver.DTurnOver,TurnOver.KTurnOver,BAL_CN,BALNAME From ';
  cUnionBody
      VarChar2(512);--:=' Where (not LastRemainder.BalanceBill in (Select  B.Bal_cn from  ArchOst Ar,Account Ac, BAL_SPR1 B Where (Ar.ACC_ID=Ac.ID)And(Ac.BAL_CN1=B.BAL_CN)And(Ar.DatDate=';
  cUnionHeader11
     constant VarChar2(512):='Union Select FirstRemainder.FDate,FirstRemainder.FirstActive,FirstRemainder.FirstPassive,'; 
  cUnionHeader12
     constant VarChar2(512):=' LDate,0 LastActive,0 LastPassive,TurnOver.DTurnOver,TurnOver.KTurnOver,BAL_CN,BALNAME From '; 
  cUnionBody1
      VarChar2(512);--:=' Where (not FirstRemainder.BalanceBill in (Select  B.Bal_cn from  ArchOst Ar,Account Ac, BAL_SPR1 B Where (Ar.ACC_ID=Ac.ID)And(Ac.BAL_CN1=B.BAL_CN)And(Ar.DatDate=';        
  Result VarChar2(2048);  
  StatementFilter  VarChar2(32):='BAL_CN';
  ReferenceFilter  VarChar2(32):=' BAL_SPR';
  FirstRemFilter  VarChar2(556);
  LastRemFilter   VarChar2(556);  
  TurnFilter Varchar2(556);
  UnionStr   VarChar2(3270);
  UnionStr1  VarChar2(3270);
  UnionBody  VarChar2(3270);
  UnionBody1 VarChar2(3270); 
  UnionHeader VarChar2(556);
  UnionHeader1 VarChar2(556);
  CurrencyFilter   VarChar2(128);  
  DepositoryFilter VarChar2(32);
  Remainder VarChar2(16);
  DTurnOver VarChar2(16);
  KTurnOver VarChar2(16);
	--PresentDate Date;
  FDate  Date;
  LDate  Date;
	Branchfilter VarChar2(200);    
begin
  if Branch = -1 then
	  BranchFilter :='';
	else
	  BranchFilter :=' AND (Ac.Filial='||TO_CHAR(Branch)||') ';
	end if;	 
  StatementFilter :=StatementFilter||TO_CHAR(BalanceBill);
  ReferenceFilter :=ReferenceFilter||TO_CHAR(BalanceBill);
  
  if  Currency=-1 then
    CurrencyFilter :=null;
   else
    CurrencyFilter:='And(VAL_ACC='||TO_CHAR(Currency)||')';
  end if;
    
  if   (Surface=1)or(Currency=-1)  then     
    Remainder :='POK_OSTAT';
    DTurnOver :='POK_OBR_D';
    KTurnOver :='POK_OBR_K';
   else
    Remainder :='OSTAT';
    DTurnOver :='OBR_D';
    KTurnOver :='OBR_K';    
  end if;  
     
   Select  Max(Dat) Into LDate  From Operkurs
           Where  Dat<=LastDate;                      
   Select  Max(Dat) Into FDate  From Operkurs
           Where  Dat<=FirstDate;
					 					 			   
	   Select Max(Dat) Into FDate From Operkurs
		        Where  Dat<FirstDate; 	 
                                     
  FirstRemFilter :='(Select Sum(Out_SB_MTOUTVIEW.ACTIVE(Ar.'
  ||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) FirstActive,Sum(Out_SB_MTOUTVIEW.PASSIV(Ar.'||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) FirstPassive,B.BAL_CN BalanceBill,'
  ||''''||TO_CHAR(FDate)||''''||' FDate From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate='||''''||TO_DATE(FDate)
  ||''''||')'||CurrencyFilter||BranchFilter||' Group By B.BAL_CN) FirstRemainder';

  LastRemFilter :='(Select Sum(Out_SB_MTOUTVIEW.ACTIVE(Ar.'
  ||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) LastActive,Sum(Out_SB_MTOUTVIEW.PASSIV(Ar.'||Remainder||',B.TYPEID,B.ADDITIONALTYPEID)) LastPassive,B.BAL_CN BalanceBill,'
  ||''''||TO_CHAR(LDate)||''''||' LDate From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate='||''''||TO_DATE(LDate)
  ||''''||')'||CurrencyFilter||BranchFilter||' Group By B.BAL_CN) LastRemainder';

  TurnFilter :='(Select Sum('||DTurnOver||') DTurnOver,Sum('
  ||KTurnOver||') KTurnOver,B.BAL_CN BalanceBill From Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'
  ||StatementFilter ||'=B.BAL_CN)And(Ar.DatDate<='||''''||TO_DATE(LastDate)  
  ||''''||')And(Ar.DatDate>='||''''
  ||TO_CHAR(FirstDate)||''''||')'||CurrencyFilter||BranchFilter||' Group By B.BAL_CN) TurnOver';
  
  cUnionBody :=' Where (not LastRemainder.BalanceBill in (Select  B.Bal_cn from  Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where  (Ar.ACC_ID=Ac.ID) '||BranchFilter||' And(Ac.'||StatementFilter||'=B.BAL_CN)And(Ar.DatDate=';
    cUnionBody1 :=' Where (not FirstRemainder.BalanceBill in (Select  B.Bal_cn from  Out_ArchOst Ar,Out_Account Ac,'
  ||ReferenceFilter||' B Where (Ar.ACC_ID=Ac.ID)And(Ac.'||StatementFilter||'=B.BAL_CN) And(Ar.DatDate=';
  UnionHeader:='Union Select '||''''||To_Char(LDate)||''''||cUnionHeader;
  UnionBody  :=cUnionBody||''''||TO_CHAR(FDate)
               ||''''
               ||')))and(Bal_cn=LastRemainder.BalanceBill)and(LastRemainder.BalanceBill=TurnOver.BalanceBill) ';
  UnionStr :=UnionHeader
             ||LastRemFilter||','
             ||TurnFilter||','
             ||ReferenceFilter
             ||UnionBody;
              
  Result :=Header||FirstRemFilter||','
           ||LastRemFilter||','
           ||TurnFilter||','
           ||ReferenceFilter||' B '
           ||ResBody;
/* 
 UnionHeader1 :=cUnionHeader11||''''||TO_CHAR(FDate)||''''
                ||cUnionHeader12; 
 UnionBody1 :=cUnionBody1||''''||TO_CHAR(LDate)
               ||''''
               ||')))and(Bal_cn=FirstRemainder.BalanceBill)and(FirstRemainder.BalanceBill=TurnOver.BalanceBill) ';
  UnionStr1 :=UnionHeader1
              ||FirstRemFilter||','
              ||TurnFilter||','
              ||ReferenceFilter||' B'
              ||UnionBody1;*/            
           
 ReturnParametr1 :=Result;
 ReturnParametr2 :=UnionStr;
 --ReturnParametr3 :=UnionStr1;      
 
 -- ||ReturnParametr3;
-- update a1 set c5=ReturnParametr1||ReturnParametr2; commit;            
end;
--*********************************************************************
Function sb_AccountSelections(     
   FirstDate  Date,
   LastDate  Date,        
 BalanceBill Integer, --Balance Type
    Currency Integer, --Currency Id (-1 All currency)
    Surface  Integer, --Surface (0-OSTAT,1-POK_OSTAT)
  BalanceID  Integer)
 return VarChar2	 
is
  Header constant VarChar2(512):='Select Sum(CurrDate.FActive),Sum(CurrDate.FPassive),Sum(DTurn),Sum(KTurn),Sum(CurrDate.LActive),Sum(CurrDate.LPassive),CurrDate.Accountant,CurrDate.Name from
  ';
	     
  Result VarChar2(2048);  
  StatementFilter  VarChar2(32):='BAL_CN';  
  FirstDateFilter  VarChar2(556);
  LastDateFilter   VarChar2(556);
	TurnFilter       VarChar2(556);      
  CurrencyFilter   VarChar2(128);    
  Remainder VarChar2(16);
  DTurnOver VarChar2(16);
  KTurnOver VarChar2(16);
	FDate Date;
	LDate Date;
	PresentDate Date;    
begin
  StatementFilter:=StatementFilter||To_Char(BalanceBill);
  if  Currency=-1 then
    CurrencyFilter :=null;
   else
    CurrencyFilter:='And(VAL_ACC='||TO_CHAR(Currency)||')';
  end if;
    
  if   (Surface=1)or(Currency=-1)  then     
    Remainder :='Ar.POK_OSTAT';
    DTurnOver :='Ar.POK_OBR_D';
    KTurnOver :='Ar.POK_OBR_K';
   else
    Remainder :='Ar.OSTAT';
    DTurnOver :='Ar.OBR_D';
    KTurnOver :='Ar.OBR_K';    
  end if;
	Select Max(DatDate) Into FDate From Archost
         Where  DatDate<=FirstDate;
	Select Max(DatDate) Into LDate From Archost
	       Where  DatDate<=LastDate;
				 
	PresentDate:=FDate;
				 
	  Select Max(DatDate) Into FDate From Archost
		       Where  DatDate<FDate;
					 			 			  
	FirstDateFilter :='(Select Ac.Name as Name,Ac.Acc_No Accountant,Out_SB_BALANCE.SaldoToActive('
	||Remainder||','||BalanceBill||','||BalanceID||') FActive,Out_SB_BALANCE.SaldoToPassive('
	||Remainder||','||BalanceBill||','||BalanceID||') FPassive,0 DTurn,0 KTurn,0 LActive,0 LPassive
   From  Out_Account Ac,Out_Archost Ar 
   Where (ac.id=ar.acc_id)And('||StatementFilter||'='
  ||To_Char(BalanceID)||')And(Ar.DatDate='
  ||''''||To_Char(FDate)||''''||')'||CurrencyFilter||')';
	
	LastDateFilter :='(Select Ac.Name as Name,Ac.Acc_No Accountant,0  FActive,0 FPassive,0 DTurn,0 KTurn,Out_SB_BALANCE.SaldoToActive('
	||Remainder||','||BalanceBill||','||BalanceID||') LActive,Out_SB_BALANCE.SaldoToPassive('
	||Remainder||','||BalanceBill||','||BalanceID||') LPassive
   From  Out_Account Ac,Out_Archost Ar 
   Where (ac.id=ar.acc_id)And('||StatementFilter||'='
  ||To_Char(BalanceID)||')And(Ar.DatDate='
  ||''''||To_Char(LDate)||''''||')'||CurrencyFilter||')';
	
	TurnFilter :='(Select Ac.Name as Name,Ac.Acc_No Accountant,0 FActive,0 FPassive,'
	||DTurnOver||','||KTurnOver||',0 LActive,0 LPassive
	From  Out_Account Ac,Out_Archost Ar 
	Where (ac.id=ar.acc_id)And('||StatementFilter||'='
	||To_Char(BalanceID)||')And(Ar.DatDate>='||''''
	||To_Char(PresentDate)||''''||')And(Ar.DatDate<='||''''
	||To_Char(LDate)||''''||')'||CurrencyFilter||')';
	
	Result :=Header||'(
'||FirstDateFilter||'
Union 
'||LastDateFilter
 ||'Union
'||TurnFilter||
')  CurrDate 
Group By  Accountant,Name ';

--	update a1 set c5 = Result;	commit;		     
 return Result;   
end;--*************************************************************************
function  getBankDay 
return Date
is
  BankDate Date;
begin
  Select  Tek_Dat  Into BankDate From SysDat;
  return  BankDate;   
end; 
--******************************************************
procedure   GetBankInfo(
  BankName OUT VarChar2
 ,BankCode OUT Number
 ,Manager  OUT VarChar2
 ,Accountant OUT varchar2        
		                     ) IS
begin
   Select  bank,kod_b,sedr,buhaltr into bankname,bankcode,manager,accountant from bankinfo;
   Exception When no_data_found Then
   begin
     BankName :='';
     BankCode :=0;
     Manager  :='';
     AccountAnt:='';
   end;
end;
--*************************************************************************
Function  sb_TurnSelections(
  FirstDate  Date,
  LastDate   Date,         
	AccID    VarChar2
														)
 return  VarChar2 
is
  Result VarChar2(2048);   
	FDate Date;
	LDate Date;	    
begin     
	Select Max(DatDate) Into FDate From Archost
         Where  DatDate<=FirstDate;
	Select Max(DatDate) Into LDate From Archost
	       Where  DatDate<=LastDate;  
				 		  			 
		Result :='Select Ac1.Acc_No Debitor,Ac2.Acc_no Kreditor
		,AC1.NAME DNAME,AC2.NAME KNAME
		,Pr.Val_Acc DCurrency
    ,Pr.CurrencyID_C  CCurrency 
		,Pr.Ammount,Pr.LAmmount,Pr.Dat,PR.Name 
    From Out_Provarch Pr ,Out_Account Ac1,Out_Account Ac2
    Where  ((Pr.Debt=Ac1.Id)and(Pr.Kredit=Ac2.Id))
		and(Pr.Dat>='||''''||To_Char(FDate)||''''||')and(Pr.Dat<='||''''||To_Char(LDate)||''''||')And((Ac1.Acc_no='||''''
		||AccID||''''||')Or(Ac2.Acc_No='||''''||AccId||''''||'))';
--	update a1 set c5=Result;commit;		 		 
	return Result;	
end; 														
--*************************************************************************
Procedure OpenCursor(ACursor IN OUT Cursor_Type, AStrParam1 IN VarChar2,AStrParam2 IN VarChar2) 
is begin
  if  ACursor%isOpen  then
  close ACursor;
  end if;  
  Open ACursor For AStrParam1||AStrParam2;  
end;  
END;


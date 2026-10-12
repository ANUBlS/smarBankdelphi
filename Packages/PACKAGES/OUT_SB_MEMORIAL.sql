CREATE OR REPLACE PACKAGE OUT_SB_MEMORIAL
  IS
    	/* **************************************************************** */
 /*        SmartBank OUT_SB_MEMORIAL package                            */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

  PROCEDURE   GetBankInfo(
      BankName  OUT  VarChar2,
      BankINN   OUT  VarChar2
                           );
  FUNCTION    getCustINN(
         Cust_ID IN Number
                           ) 
        return Number;
  FUNCTION  GetUserName return VarChar2;
  PROCEDURE  INTO_TABLE(
     TableName VarChar2,
     SqlString VarChar2
                      );
  FUNCTION  GetRate(
      ID  integer
                    )
      Return  Number;
  Function GetBankDay return date;
  Function  GetCurrencyShortName(CurrID IN Integer)
 return AValute.Val_Name%type;
  Function  GetDiffRate( 
                       DCurrencyID IN Integer
											,CCurrencyID IN Integer 											                       
											,DDiffRate IN Operkurs.Ostat%type
											,CDiffRate IN Operkurs.Ostat%type
											,CurrentDate IN Date 
											)
  return Operkurs.Ostat%type;
 
  
  PROCEDURE   MEMORIAL(
     aDateBegin   Date
    ,aDateEnd     Date
    ,aValute      Integer
    ,BalanceType  Integer
    ,BalOrACC     Integer   -- 0-ACC_NO ,1-BAL_CN
    ,Balance      VARCHAR2
    ,RateDiff     Integer  --1 Kurs Ferqi ile,0-ferqsiz    
    ,KredDebt     Integer   -- -1-None ,2-All ,0-Debt,1-Kredit
		,UseBalance    Integer --0-not use; 1 use 
		,MultyCurrency Integer--0,1 
    ,TransactionMode Integer --0 commited, 1 Lazy   
				,FilialMode integer default 0 -- 0   All accounts
                        );
END; -- Package spec
/
CREATE OR REPLACE PACKAGE BODY OUT_SB_MEMORIAL
IS
   	/* **************************************************************** */
 /*        SmartBank OUT_SB_MEMORIAL package                            */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
Function GetBankDay return date is
   Bankday Date;
begin
 Select Tek_dat into BankDay from SysDat; 
 return BankDay;
end;
  FUNCTION  GetRate(
      ID  integer
                    )
      Return  Number                    
   IS
     Rate Number(7);
   Begin
        Select  Ostat into Rate from OperKurs where(Val_Kod=ID)and(Dat=getBankDay);
       Exception 
       when no_data_found then
       begin
        return 0;
       end; 
   End;

Function  GetCurrencyShortName(CurrID IN Integer)
 return AValute.Val_Name%type
 Is
   Result AValute.Val_Name%type; 
 Begin
    Select Val_Name Into Result From Avalute
		  Where Valute = CurrID;
		return Result;	
 End;
                       
  PROCEDURE  INTO_TABLE(
     TableName VarChar2,
     SqlString VarChar2
                      )
IS

 V_Cursor Number(38);
     nRow Number(38);    
      vCount Integer;
	DotPos integer := Instr(TableName, '.');
	ATableName varchar2(32);
Begin
	if DotPos <> 0 then
		ATableName := substr(TableName, DotPos+1, Length(TableName)-DotPos);
	else
		ATableName := TableName; 
	end if;

	select count(*)
		into vCount 
	from sys.all_tables
	where (owner = GetUserName) and (TABLE_NAME = ATableName);

--  select Count(*) into vCount from tab where TNAME=TableName;
  
--  update a1 set c5=SqlString;commit;
  if   vCount=1  then     
       V_Cursor:=dbms_sql.open_cursor;
       dbms_sql.parse(V_Cursor,'Drop table ' || TableName ,dbms_sql.v7);
       NRow:=dbms_sql.execute(V_Cursor);
       dbms_sql.Close_cursor(v_cursor);
    end if;                                 
        v_Cursor:=dbms_sql.open_cursor;
        dbms_sql.parse(V_Cursor,SqlString,dbms_sql.v7);
        NRow:=dbms_sql.execute(V_Cursor);
        dbms_sql.Close_cursor(v_cursor);     
End;               
    FUNCTION    getCustINN(
         Cust_ID IN Number
                           ) 
        return Number
     IS
     TempINN  Number(10);
     Begin
       Select  Cust.INN into TempINN 
         from CUSTOMERS CUST 
           where  (CUST.ID=Cust_ID);
          return TempINN;            
        EXCEPTION  
        WHEN NO_DATA_FOUND THEN 
        Begin       
          return NULL;
        End;      
     End;
                                       
    PROCEDURE   getBankInfo(
      BankName  OUT  VarChar2,
      BankINN   OUT  VarChar2
                           )
       IS
       Begin
         Select  Bank , INN into BankName,BankINN from BankInfo;
       End;
                                   
    PROCEDURE   MEMORIAL(
     aDateBegin   Date
    ,aDateEnd     Date
    ,aValute      Integer
    ,BalanceType  Integer
    ,BalOrACC     Integer   -- 0-ACC_NO ,1-BAL_CN
    ,Balance      VARCHAR2
    ,RateDiff     Integer  --1 Kurs Ferqi ile,0-ferqsiz    
    ,KredDebt     Integer   -- -1-None ,2-All ,0-Debt,1-Kredit
	  	,UseBalance    Integer --0-not use; 1 use 
		  ,MultyCurrency Integer--0,1 
    ,TransactionMode Integer --0 commited, 1 Lazy   
				,FilialMode integer default -1 -- -1   All accounts
                        )
    IS 
    cCreate  constant VarChar2(20) :='CREATE  TABLE ';        
    cSelect  constant VarChar2(1056):=',PR.Dat,out_sb_memorial.getdiffrate(pr.val_acc,pr.currencyid_c,pr.rate_d,pr.rate_c,pr.dat) DiffRate,PR.NAME,PR.ID,PR.SHIFR,OUT_SB_MEMORIAL.getcurrencyshortname(PR.VAL_ACC) Val_acc,OUT_SB_MEMORIAL.getcurrencyshortname(PR.CurrencyID_C) CurrencyID_C,PR.AMMOUNT,PR.AMMOUNT_C,PR.LAMMOUNT,PR.OP_ID,A1.ACC_NO DEBITOR,out_sb_memorial.GETCUSTINN(A1.KLI_ID) DEBTINN,A1.NAME DNAME,A2.ACC_NO KREDITOR,out_sb_memorial.GETCUSTINN(A2.KLI_ID) KREDINN ,A2.NAME KNAME,PR.DEBT,PR.KREDIT'; 
    cWhere   constant VarChar2(64):=' WHERE (A1.ID=PR.Debt)AND(A2.ID=PR.Kredit)AND';
    aBalCN            VarChar2(16):='BAL_CN'; 
    QueryStr   VarChar2(5924);--main
    aSelect    VarChar2(1656):=' AS SELECT ';
    TableName  VarChar2(264);
    ValFilter  VarChar2(364); 
    DateFilter VarChar2(264);
    BalFilter  VarChar2(264);
    RateFilter VarChar2(264);
				FilialFilter VarChar(264);
		MultyCurrencyFilter VarChar2(256):='';
    cFrom     VarChar2(64); --:=' FROM PROVARCH PR,ACCOUNT A1 ,ACCOUNT A2 ';   
 Begin
   TableName := GetUserName||'.MEMORIAL_'||GetUserName;
   if  TransactionMode = 0  then
    cFrom :=' FROM OUT_PROVARCH PR,OUT_ACCOUNT A1 ,OUT_ACCOUNT A2 ';
   else
    cFrom :=' FROM OUT_LAZYTRANSACTION PR,OUT_ACCOUNT A1 ,OUT_ACCOUNT A2 ';
   end if;  
   
			if FilialMode = -1 then
					FilialFilter :='';
			else
			  FilialFilter :=' and A1.Filial = '||To_char(FilialMode)||' and A2.Filial = '||To_char(FilialMode);			    
   end if;
			  
		 aBalCN  :=aBalCN||TO_CHAR(BalanceType);
   aSelect :=aSelect||'A1.'||aBalCN||' DBAL_CN,A2.'||aBalCN||' KBAL_CN';
   DateFilter :='(PR.DAT >='||''''||TO_CHAR(aDateBegin)||''''||')AND(PR.DAT<='||''''||TO_CHAR(aDateEnd)||''''||')';	 
   if aValute<>-1 then
	 if MultyCurrency=0 then 
     ValFilter  :='AND((PR.VAL_ACC='||TO_CHAR(aValute)||')AND(PR.CurrencyID_C='||TO_CHAR(aValute)||'))';
		else
		 ValFilter  :='AND((PR.VAL_ACC='||TO_CHAR(aValute)||')OR(PR.CurrencyID_C='||TO_CHAR(aValute)||'))';
		end if;  
   else 
     ValFilter :='';
   end if;
	 if  MultyCurrency=1  then
 	   MultyCurrencyFilter :='AND((PR.Val_Acc<>PR.CurrencyID_C)OR(PR.ParentID IS NOT NULL))';	 
	 end if;
	 
	   ValFilter :=ValFilter||MultyCurrencyFilter;
		 
	 if  UseBalance<>0 then
	     ValFilter  :=ValFilter||'AND((not (A1.'||aBalCN
			 ||' in (Select Balance From OUT_Memorial)))'||
			 'AND(not (A2.'||aBalCN
			 ||' in (Select Balance From OUT_Memorial))))';
	   end if;
		 
		 dbms_output.put_line(ValFilter);
		 
   if  RateDiff=0 then
      RateFilter :='AND (PR.AMMOUNT<>0) And (PR.Ammount_C<>0)';
     else
      RateFilter :='';
   end if;
     
   if  KredDebt=-1 then --hec biri
    BalFilter:='';
    end if;
            
   if KredDebt=2 then   --D&K
   
    if BalOrACC=0 then  --acc_no 
      BalFilter:='AND((A1.ACC_NO in ('||Balance||'))OR(A2.ACC_NO in ('||Balance||')))';
    end if;
    
    if BalOrACC=1 then  --bal_cn
      BalFilter:='AND((A1.'||aBalCN||' in ('||Balance||'))OR(A2.'||aBalCN||' in ('||Balance||')))';
    end if;
                    
   end if;
   
   if  KredDebt=0 then  --D
    if BalOrACC=0 then  --acc_no 
      BalFilter:='AND(A1.ACC_NO in ('||Balance||'))';
    end if;
    if BalOrACC=1 then  --bal_cn
      BalFilter:='AND(A1.'||aBalCN||' in ('||Balance||'))';
    end if;    
   end if;
   
   if  KredDebt=1 then  --K
    if BalOrACC=0 then  --acc_no 
      BalFilter:='AND(A2.ACC_NO in ('||Balance||'))';
    end if;
    if BalOrACC=1 then  --bal_cn
      BalFilter:='AND(A2.'||aBalCN||' in ('||Balance||'))';
    end if;    
   end if;  
   QueryStr :=cCreate||TableName||aSelect||cSelect||cFrom||cWhere||DateFilter||RateFilter||BalFilter||ValFilter||FilialFilter;
--	 update a1 set c5 = QueryStr; commit;

   INTO_TABLE(TableName,QueryStr);       
 End;
    FUNCTION  GetUserName return VarChar2
    IS
     UserName VarChar2(40);
    Begin
      UserName:=User;
      return UserName;    
    End; 
Function  GetDiffRate( 
                       DCurrencyID IN Integer
											,CCurrencyID IN Integer 											                       
											,DDiffRate IN Operkurs.Ostat%type
											,CDiffRate IN Operkurs.Ostat%type
											,CurrentDate IN Date 
											)
  return Operkurs.Ostat%type
	Is
	Begin
  if DCurrencyID > CCurrencyID then   
	  return DDiffRate;
  else
    return CDiffRate; 
  end if;  
	End;  											 		                              
END;





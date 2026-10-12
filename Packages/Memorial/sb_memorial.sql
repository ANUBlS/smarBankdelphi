-- Start of DDL Script for Package SMART.SB_MEMORIAL
-- Generated 21-Jun-2006 10:53:16 from SMART@SB

CREATE OR REPLACE 
PACKAGE sb_memorial
 AutHid current_user
  IS


  Function GetBankDay return date;
  PROCEDURE   getBankInfo(
      BankName  OUT  VarChar2,
      BankINN   OUT  VarChar2
                           );
  Function  GetCurrencyShortName(CurrID IN Integer)
 return AValute.Val_Name%type;
  FUNCTION    getCustINN(
         Cust_ID IN Number
                           ) 
        return Number;
  Function  GetDiffRate( 
                       DCurrencyID IN Integer
											,CCurrencyID IN Integer 											                       
											,DDiffRate IN Operkurs.Ostat%type
											,CDiffRate IN Operkurs.Ostat%type
											,CurrentDate IN Date 
											)
  return Operkurs.Ostat%type;
  FUNCTION  GetRate(
      ID  integer
                    )
      Return  Number;
  FUNCTION  GetUserName return VarChar2;
  PROCEDURE   MEMORIAL(
                    strsql  out varchar2,
     aDateBegin   Date
    ,aDateEnd     Date
    ,aValute      Integer
    ,BalanceType  Integer
    ,BalOrACC     Integer   
    ,Balance      VARCHAR2
    ,RateDiff     Integer  
    ,KredDebt     Integer   
	  	,UseBalance    Integer 
		  ,MultyCurrency Integer
    ,TransactionMode Integer 
				,FilialMode integer default -1
 
                        );
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY sb_memorial

IS
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
                       


               
    FUNCTION    getCustINN(
         Cust_ID IN Number
                           ) 
        return Number
     IS
     TempINN  Number(20);
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
     strsql  out  varchar2,
     aDateBegin   Date
    ,aDateEnd     Date
    ,aValute      Integer
    ,BalanceType  Integer
    ,BalOrACC     Integer   
    ,Balance      VARCHAR2
    ,RateDiff     Integer  
    ,KredDebt     Integer   
	  	,UseBalance    Integer 
		  ,MultyCurrency Integer
    ,TransactionMode Integer 
				,FilialMode integer default -1
 
                        )
    IS      
    cSelect  constant VarChar2(1056):=',PR.Dat,sb_memorial.getdiffrate(pr.val_acc,pr.currencyid_c,pr.rate_d,pr.rate_c,pr.dat) DiffRate,PR.NAME,PR.ID,PR.SHIFR,sb_memorial.getcurrencyshortname(PR.VAL_ACC) Val_acc,sb_memorial.getcurrencyshortname(PR.CurrencyID_C) CurrencyID_C,PR.AMMOUNT,PR.AMMOUNT_C,PR.LAMMOUNT,PR.OP_ID,A1.ACC_NO DEBITOR,sb_memorial.GETCUSTINN(A1.KLI_ID) DEBTINN,A1.NAME DNAME,A2.ACC_NO KREDITOR,sb_memorial.GETCUSTINN(A2.KLI_ID) KREDINN ,A2.NAME KNAME,PR.DEBT,PR.KREDIT'; 
    cWhere   constant VarChar2(64):=' WHERE (A1.ID=PR.Debt)AND(A2.ID=PR.Kredit)AND';
    aBalCN            VarChar2(16):='BAL_CN'; 
    QueryStr   VarChar2(5924);
    aSelect    VarChar2(1656):=' SELECT ';
    TableName  VarChar2(264);
    ValFilter  VarChar2(364); 
    DateFilter VarChar2(264);
    BalFilter  VarChar2(264);
    RateFilter VarChar2(264);
				FilialFilter VarChar(264);
		MultyCurrencyFilter VarChar2(256):='';
    cFrom     VarChar2(64);  
 Begin

   if  TransactionMode = 0  then
    cFrom :=' FROM PROVARCH PR,ACCOUNT A1 ,ACCOUNT A2 ';
   else
    cFrom :=' FROM LAZYTRANSACTION PR,ACCOUNT A1 ,ACCOUNT A2 ';
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
			 ||' in (Select Balance From Memorial)))'||
			 'AND(not (A2.'||aBalCN
			 ||' in (Select Balance From Memorial))))';
	   end if;
		 
	
		 
   if  RateDiff=0 then
      RateFilter :='AND (PR.AMMOUNT<>0) And (PR.Ammount_C<>0)';
     else
      RateFilter :='';
   end if;
     
   if  KredDebt=-1 then  
    BalFilter:='';
    end if;
            
   if KredDebt=2 then   
   
    if BalOrACC=0 then    
      BalFilter:='AND((A1.ACC_NO in ('||Balance||'))OR(A2.ACC_NO in ('||Balance||')))';
    end if;
    
    if BalOrACC=1 then   
      BalFilter:='AND((A1.'||aBalCN||' in ('||Balance||'))OR(A2.'||aBalCN||' in ('||Balance||')))';
    end if;
                    
   end if;
   
   if  KredDebt=0 then 
    if BalOrACC=0 then  
      BalFilter:='AND(A1.ACC_NO in ('||Balance||'))';
    end if;
    if BalOrACC=1 then   
      BalFilter:='AND(A1.'||aBalCN||' in ('||Balance||'))';
    end if;    
   end if;
   
   if  KredDebt=1 then   
    if BalOrACC=0 then   
      BalFilter:='AND(A2.ACC_NO in ('||Balance||'))';
    end if;
    if BalOrACC=1 then   
      BalFilter:='AND(A2.'||aBalCN||' in ('||Balance||'))';
    end if;    
   end if;  
   QueryStr :=aSelect||cSelect||cFrom||cWhere||DateFilter||RateFilter||BalFilter||ValFilter||FilialFilter;

update a1 set c5 =QueryStr;commit;
strsql:=QueryStr;	 
    
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
/


-- End of DDL Script for Package SMART.SB_MEMORIAL



create or replace PACKAGE out_sb_memorial
  IS

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


-- Start of DDL Script for View SMART.ACTIVE_CREDITS_OWN
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW active_credits_own (
   id,
   branchid,
   contractno,
   operatorid,
   opendate,
   monthday,
   closedate,
   amount,
   contracttype,
   pledgetype,
   reliabilityid,
   overduereliabilityid,
   clienttype,
   pledgeprice,
   contractaccid,
   clientaccid,
   reserveaccid,
   interestaccid,
   overdueaccid,
   overdueinterestaccid,
   overduereserveaccid,
   facticaldebt,
   facticalinterestdebt,
   overduedebt,
   overdueinterestdebt,
   stopcalculationdate,
   calculationenabled,
   reguiredamountdec,
   reguiredpercentdec,
   lastprocessdate,
   residuaryamount,
   contractaccno,
   interestaccno,
   contractcurrency,
   contractaccname,
   contractcurrencyid,
   status,
   interestbalance,
   clientbalance )
AS
SELECT "ID","BRANCHID","CONTRACTNO","OPERATORID","OPENDATE","MONTHDAY","CLOSEDATE","AMOUNT","CONTRACTTYPE","PLEDGETYPE","RELIABILITYID","OVERDUERELIABILITYID","CLIENTTYPE","PLEDGEPRICE","CONTRACTACCID","CLIENTACCID","RESERVEACCID","INTERESTACCID","OVERDUEACCID","OVERDUEINTERESTACCID","OVERDUERESERVEACCID","FACTICALDEBT","FACTICALINTERESTDEBT","OVERDUEDEBT","OVERDUEINTERESTDEBT","STOPCALCULATIONDATE","CALCULATIONENABLED","REGUIREDAMOUNTDEC","REGUIREDPERCENTDEC","LASTPROCESSDATE","RESIDUARYAMOUNT","CONTRACTACCNO","INTERESTACCNO","CONTRACTCURRENCY","CONTRACTACCNAME","CONTRACTCURRENCYID","STATUS","INTERESTBALANCE","CLIENTBALANCE"
  FROM active_credits

/


-- End of DDL Script for View SMART.ACTIVE_CREDITS_OWN

-- Start of DDL Script for View SMART.ACTIVE_CREDITS
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW active_credits (
   id,
   branchid,
   contractno,
   operatorid,
   opendate,
   monthday,
   closedate,
   amount,
   contracttype,
   pledgetype,
   reliabilityid,
   overduereliabilityid,
   clienttype,
   pledgeprice,
   contractaccid,
   clientaccid,
   reserveaccid,
   interestaccid,
   overdueaccid,
   overdueinterestaccid,
   overduereserveaccid,
   facticaldebt,
   facticalinterestdebt,
   overduedebt,
   overdueinterestdebt,
   stopcalculationdate,
   calculationenabled,
   reguiredamountdec,
   reguiredpercentdec,
   lastprocessdate,
   residuaryamount,
   contractaccno,
   interestaccno,
   contractcurrency,
   contractaccname,
   contractcurrencyid,
   status,
   interestbalance,
   clientbalance )
AS
Select
    Contracts.ID
   ,Contracts.BranchID as BranchID
   ,Contracts.ContractNo
   ,Contracts.SID# as OperatorID          
   ,Contracts.OpenDate
   ,to_char(OpenDate,'DD') as MonthDay
   ,Contracts.CloseDate
   ,Contracts.Amount
   ,Contracts.ContractType
   ,Contracts.PledgeType
   ,Contracts.ReliabilityID
   ,Contracts.OverdueReliabilityID
   ,Contracts.ClientType
   ,Contracts.PledgePrice
   ,ContractAccs.ContractAccID
   ,ContractAccs.ClientAccID
   ,ContractAccs.ReserveAccID
   ,ContractAccs.InterestAccID
   ,ContractAccs.OverdueAccID
   ,ContractAccs.OverdueInterestAccID
   ,ContractAccs.OverdueReserveAccID
   ,ContractState.FacticalDebt
   ,ContractState.FacticalInterestDebt
   ,ContractState.OverdueDebt
   ,ContractState.OverdueInterestDebt
   ,ContractState.StopCalculationDate
   ,ContractState.CalculationEnabled
   ,ContractState.ReguiredAmountDec
   ,ContractState.ReguiredPercentDec
   ,ContractState.LastProcessDate
   ,ContractState.ResiduaryAmount
   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.ContractAccID) as ContractAccNo
   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(ContractAccs.InterestAccID) as InterestAccNo
   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(ContractAccs.ContractAccID)as ContractCurrency
   ,SBCM_Stored_Programs.SBCMGetAccName(ContractAccs.ContractAccID) as ContractAccName   
   ,SBCM_Stored_Programs.GetContractCurrency(Contracts.ID) as ContractCurrencyID
   ,SBCM_Stored_Programs.CheckContractState(Contracts.ID) as  Status
   ,SBCM_Stored_Programs.GetAccountBalance(ContractAccs.InterestAccID) as InterestBalance
   ,SBCM_Stored_Programs.GetAccountBalance(ContractAccs.ClientAccID) as ClientBalance
From
   SBCM_Contracts Contracts
  ,SBCM_Contract_Accounts ContractAccs
  ,SBCM_Contract_State ContractState
Where
       Contracts.Type# = 1
   And Contracts.ID = ContractAccs.ID#
   And Contracts.ID = ContractState.ID#
/


-- End of DDL Script for View SMART.ACTIVE_CREDITS

-- Start of DDL Script for View SMART.SBA_SBCM_CONTRACTS_PHYS
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW sba_sbcm_contracts_phys (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid,
   branchid )
AS
select sbcn.* from SBA_SBCM_CONTRACTS sbcn,sbcm_categories sbcat
where sbcn.clienttype = sbcat.id
and (sbcat.truecategory = 2)
/


-- End of DDL Script for View SMART.SBA_SBCM_CONTRACTS_PHYS

-- Start of DDL Script for View SMART.SBA_SBCM_CONTRACTS_LEGAL
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW sba_sbcm_contracts_legal (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid,
   branchid )
AS
select sbcn.* from SBA_SBCM_CONTRACTS sbcn,sbcm_categories sbcat
where sbcn.clienttype = sbcat.id
and (sbcat.truecategory = 4)
/


-- End of DDL Script for View SMART.SBA_SBCM_CONTRACTS_LEGAL

-- Start of DDL Script for View SMART.SBA_SBCM_CONTRACTS
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW sba_sbcm_contracts (
   id,
   type#,
   opendate,
   closedate,
   amount,
   contractno,
   contracttype,
   pledgetype,
   reliabilityid,
   clienttype,
   pledgeprice,
   sid#,
   overduereliabilityid,
   branchid )
AS
SELECT "ID","TYPE#","OPENDATE","CLOSEDATE","AMOUNT","CONTRACTNO","CONTRACTTYPE","PLEDGETYPE","RELIABILITYID","CLIENTTYPE","PLEDGEPRICE","SID#","OVERDUERELIABILITYID","BRANCHID" FROM sbcm_contracts 
 where
  type# in (1,2) and
(
(SID#<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0) ))
or
(SID# in(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
)
or
type# in (3,4) and
(
(SID#<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=5 or type#=0)))
or
(SID# in(select SUSER from sba_userman where MUSER=uid and (type#=5 or type#=0)))
)
/

-- Grants for View
GRANT SELECT ON sba_sbcm_contracts TO sbr_creditmanager
/

-- End of DDL Script for View SMART.SBA_SBCM_CONTRACTS

-- Start of DDL Script for View SMART.SBA_ACTIVE_CREDITS
-- Generated 10-Nov-2004 12:31:54 from SMART@sbdev

CREATE OR REPLACE VIEW sba_active_credits (
   id,
   branchid,
   contractno,
   operatorid,
   opendate,
   monthday,
   closedate,
   amount,
   contracttype,
   pledgetype,
   reliabilityid,
   overduereliabilityid,
   clienttype,
   pledgeprice,
   contractaccid,
   clientaccid,
   reserveaccid,
   interestaccid,
   overdueaccid,
   overdueinterestaccid,
   overduereserveaccid,
   facticaldebt,
   facticalinterestdebt,
   overduedebt,
   overdueinterestdebt,
   stopcalculationdate,
   calculationenabled,
   reguiredamountdec,
   reguiredpercentdec,
   lastprocessdate,
   residuaryamount,
   contractaccno,
   interestaccno,
   contractcurrency,
   contractaccname,
   contractcurrencyid,
   status,
   interestbalance,
   clientbalance )
AS
select 
"ID","BRANCHID","CONTRACTNO","OPERATORID","OPENDATE","MONTHDAY","CLOSEDATE","AMOUNT","CONTRACTTYPE","PLEDGETYPE","RELIABILITYID","OVERDUERELIABILITYID","CLIENTTYPE","PLEDGEPRICE","CONTRACTACCID","CLIENTACCID","RESERVEACCID","INTERESTACCID","OVERDUEACCID","OVERDUEINTERESTACCID","OVERDUERESERVEACCID","FACTICALDEBT","FACTICALINTERESTDEBT","OVERDUEDEBT","OVERDUEINTERESTDEBT","STOPCALCULATIONDATE","CALCULATIONENABLED","REGUIREDAMOUNTDEC","REGUIREDPERCENTDEC","LASTPROCESSDATE","RESIDUARYAMOUNT","CONTRACTACCNO","INTERESTACCNO","CONTRACTCURRENCY","CONTRACTACCNAME","CONTRACTCURRENCYID","STATUS","INTERESTBALANCE","CLIENTBALANCE" from active_credits
where
(OPERATORID<>-1 and 
not EXISTS(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
or
(OPERATORID in(select SUSER from sba_userman where MUSER=uid and (type#=4 or type#=0)))
/

-- Grants for View
GRANT SELECT ON sba_active_credits TO sbr_creditmanager
/

-- End of DDL Script for View SMART.SBA_ACTIVE_CREDITS



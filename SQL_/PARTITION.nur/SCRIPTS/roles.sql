                     ---Creating roles---
Create role SBR_ABOUTBANKS identified by sm;
Create role SBR_ACCOUNTS identified by sm;
Create role SBR_ACCOUNTSFORPERIOD identified by sm;
Create role SBR_AVALUTE identified by sm;
Create role SBR_BACKUPCREATOR identified by sm;
Create role SBR_BALANCE identified by sm;
Create role SBR_BALANCEREFEDIT identified by sm;
Create role SBR_BANKINFO identified by sm;
Create role SBR_CASHDESK identified by sm;
Create role SBR_CASHREFERNCE identified by sm;
Create role SBR_CLOSEDAY identified by sm;
Create role SBR_CONTRACTCORRECTION identified by sm;
Create role SBR_CONTROLTAPE identified by sm;
Create role SBR_CREDITMANAGER identified by sm;
Create role SBR_CREDITSARCHIVE identified by sm;
Create role SBR_CURRENCYPOSITION identified by sm;
Create role SBR_CUSTOMERS identified by sm;
Create role SBR_CUSTOMERS_INFORMATIONS identified by sm;
Create role SBR_DAYBYDAYBALANCE identified by sm;
Create role SBR_DEPOSITCORRECTOR identified by sm;
Create role SBR_DEPOSITMANAGER identified by sm;
Create role SBR_DEPOSITSARCHIVE identified by sm;
Create role SBR_EXCHANGE identified by sm;
Create role SBR_EXPERTANALYS identified by sm;
Create role SBR_INCOMESANDEXPENSES identified by sm;
Create role SBR_MAINFACILITIES identified by sm;
Create role SBR_MEMORIALPROJECT identified by sm;
Create role SBR_OBRSAVED identified by sm;
Create role SBR_ODDSOFRATE identified by sm;
Create role SBR_OLDCOURSES identified by sm;
Create role SBR_ORDER identified by sm;
Create role SBR_PAYMENTDECREEX identified by sm;
Create role SBR_PROFITCLOSING identified by sm;
Create role SBR_QUERYEXPORTER identified by sm;
Create role SBR_RATEMANAGEMENT identified by sm;
Create role SBR_REFEDIT identified by sm;
Create role SBR_SPLASH identified by sm;
Create role SBR_STANDART identified by sm;
Create role SBR_STATEMENT identified by sm;
Create role SBR_SWIFT identified by sm;
Create role SBR_TODAYBALANCE identified by sm;
Create role SBR_TRANSACTION identified by sm;
Create role SBR_TRANSACTIONSVIEWER identified by sm;
Create role SBR_TUNINGTRANSACTIONS identified by sm;
Create role SBR_TURNOVERSFORPERIOD identified by sm;
Create role SBR_UREPORTPACKCONSOLE identified by sm;
--**********************SBR_ABOUTBANKS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BANKM to SBR_ABOUTBANKS;
Grant DELETE on BANKM to SBR_ABOUTBANKS;
Grant INSERT on BANKM to SBR_ABOUTBANKS;
Grant UPDATE on BANKM to SBR_ABOUTBANKS;


--**********************SBR_ACCOUNTS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ACCOUNT_FLAGS to SBR_ACCOUNTS;
Grant SELECT on ARCHOST to SBR_ACCOUNTS;
Grant SELECT on AVALUTE to SBR_ACCOUNTS;
Grant SELECT on BAL_SPR1 to SBR_ACCOUNTS;
Grant SELECT on BAL_SPR2 to SBR_ACCOUNTS;
Grant SELECT on BAL_SPR3 to SBR_ACCOUNTS;
Grant SELECT on BAL_SPR4 to SBR_ACCOUNTS;
Grant SELECT on FILIAL to SBR_ACCOUNTS;
Grant SELECT on LAZYREST to SBR_ACCOUNTS;
Grant SELECT on PROVARCH to SBR_ACCOUNTS;
Grant SELECT on REPORT_SYMBOL to SBR_ACCOUNTS;
Grant SELECT on TENOSTAT to SBR_ACCOUNTS;
Grant SELECT on TEMPOST to SBR_ACCOUNTS;
Grant SELECT on SBA_CUSTOMERS to SBR_ACCOUNTS;
Grant SELECT on SBA_ACCOUNT to SBR_ACCOUNTS;
Grant SELECT on SBA_CUSTOMERS_CENTRAL to SBR_ACCOUNTS;
Grant SELECT on SBA_ACCOUNT_CENTRAL to SBR_ACCOUNTS;
Grant EXECUTE on SBOP to SBR_ACCOUNTS;
Grant EXECUTE on SBUTIL to SBR_ACCOUNTS;


--**********************SBR_ACCOUNTSFORPERIOD--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_ACCOUNTSFORPERIOD;
Grant SELECT on FILIAL to SBR_ACCOUNTSFORPERIOD;
Grant SELECT on SYSDAT to SBR_ACCOUNTSFORPERIOD;
Grant SELECT on SBA_CUSTOMERS to SBR_ACCOUNTSFORPERIOD;
Grant SELECT on SBA_ACCOUNT to SBR_ACCOUNTSFORPERIOD;
Grant SELECT on USER$ to SBR_ACCOUNTSFORPERIOD;
Grant EXECUTE on SBSEC to SBR_ACCOUNTSFORPERIOD;


--**********************SBR_AVALUTE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant DELETE on AVALUTE to SBR_AVALUTE;
Grant INSERT on AVALUTE to SBR_AVALUTE;
Grant SELECT on AVALUTE to SBR_AVALUTE;
Grant UPDATE on AVALUTE to SBR_AVALUTE;
Grant SELECT on SBA_ACCOUNT to SBR_AVALUTE;


--**********************SBR_BACKUPCREATOR--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_BALANCE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_BALANCE;
Grant SELECT on BAL_SPR1 to SBR_BALANCE;
Grant SELECT on BANKINFO to SBR_BALANCE;
Grant SELECT on FILIAL to SBR_BALANCE;
Grant EXECUTE on SB_BALANCE to SBR_BALANCE;


--**********************SBR_BALANCEREFEDIT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BAL_SPR1 to SBR_BALANCEREFEDIT;
Grant DELETE on BAL_SPR1 to SBR_BALANCEREFEDIT;
Grant INSERT on BAL_SPR1 to SBR_BALANCEREFEDIT;
Grant UPDATE on BAL_SPR1 to SBR_BALANCEREFEDIT;
Grant DELETE on BAL_SPR2 to SBR_BALANCEREFEDIT;
Grant INSERT on BAL_SPR2 to SBR_BALANCEREFEDIT;
Grant SELECT on BAL_SPR2 to SBR_BALANCEREFEDIT;
Grant UPDATE on BAL_SPR2 to SBR_BALANCEREFEDIT;
Grant DELETE on BAL_SPR3 to SBR_BALANCEREFEDIT;
Grant INSERT on BAL_SPR3 to SBR_BALANCEREFEDIT;
Grant SELECT on BAL_SPR3 to SBR_BALANCEREFEDIT;
Grant UPDATE on BAL_SPR3 to SBR_BALANCEREFEDIT;
Grant DELETE on BAL_SPR4 to SBR_BALANCEREFEDIT;
Grant INSERT on BAL_SPR4 to SBR_BALANCEREFEDIT;
Grant SELECT on BAL_SPR4 to SBR_BALANCEREFEDIT;
Grant UPDATE on BAL_SPR4 to SBR_BALANCEREFEDIT;
Grant SELECT on CLOSE_ACC_TYPE to SBR_BALANCEREFEDIT;


--**********************SBR_BANKINFO--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BANKINFO to SBR_BANKINFO;
Grant DELETE on BANKINFO to SBR_BANKINFO;
Grant INSERT on BANKINFO to SBR_BANKINFO;
Grant UPDATE on BANKINFO to SBR_BANKINFO;


--**********************SBR_CASHDESK--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_CASHDESK;
Grant SELECT on BAL_SPR1 to SBR_CASHDESK;
Grant SELECT on BANKINFO to SBR_CASHDESK;
Grant SELECT on CASHINFO to SBR_CASHDESK;
Grant SELECT on KASSA_B to SBR_CASHDESK;
Grant SELECT on OPERKURS to SBR_CASHDESK;
Grant SELECT on PROVARCH to SBR_CASHDESK;
Grant SELECT on SBA_ACCOUNT to SBR_CASHDESK;
Grant EXECUTE on SB_CASHREPORT to SBR_CASHDESK;


--**********************SBR_CASHREFERNCE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on KASSA_B to SBR_CASHREFERNCE;
Grant EXECUTE on SB_CASHREPORT to SBR_CASHREFERNCE;


--**********************SBR_CLOSEDAY--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant EXECUTE on SBOP to SBR_CLOSEDAY;
Grant EXECUTE on SBSYS to SBR_CLOSEDAY;


--**********************SBR_CONTRACTCORRECTION--**********************
                     ---Granting roles---
Grant SBR_CREDITMANAGER to SBR_CONTRACTCORRECTION;
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_CONTROLTAPE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_CONTROLTAPE;
Grant SELECT on BANKINFO to SBR_CONTROLTAPE;
Grant SELECT on PROVARCH to SBR_CONTROLTAPE;
Grant SELECT on SBA_ACCOUNT to SBR_CONTROLTAPE;
Grant EXECUTE on SB_BALANCE to SBR_CONTROLTAPE;


--**********************SBR_CREDITMANAGER--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_CREDITMANAGER;
Grant SELECT on AVALUTE to SBR_CREDITMANAGER;
Grant SELECT on BAL_SPR1 to SBR_CREDITMANAGER;
Grant SELECT on BANKINFO to SBR_CREDITMANAGER;
Grant SELECT on OPERKURS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_ACC_ZONES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_ACC_ZONE_INFO to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CATEGORIES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CONTRACT_ACCOUNTS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CONTRACT_STATE to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CONTRACT_TYPES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CREDIT_TYPES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_DEPOSIT_TYPES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_INTERESTS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_MOVIE_NAMES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_OVERDUEINTERESTS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_PAYMENTS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_PAYMENTS_PLANE to SBR_CREDITMANAGER;
Grant SELECT on SBCM_PLEDGETYPES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_PROLONGATIONS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_REFERENCES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_RELIABILITY to SBR_CREDITMANAGER;
Grant SELECT on SBCM_SETTINGS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_STATE_HISTORY to SBR_CREDITMANAGER;
Grant SELECT on SBCM_TRANCHES to SBR_CREDITMANAGER;
Grant SELECT on SBCM_TRUECATEGORIES to SBR_CREDITMANAGER;
Grant SELECT on SBA_SBCM_CONTRACTS to SBR_CREDITMANAGER;
Grant SELECT on SBA_CUSTOMERS to SBR_CREDITMANAGER;
Grant SELECT on SBA_ACCOUNT to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_STORED_PROGRAMS to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CONTRACT_CORRECTION to SBR_CREDITMANAGER;
Grant DELETE on SBCM_CONTRACT_CORRECTION to SBR_CREDITMANAGER;
Grant INSERT on SBCM_CONTRACT_CORRECTION to SBR_CREDITMANAGER;
Grant UPDATE on SBCM_CONTRACT_CORRECTION to SBR_CREDITMANAGER;
Grant SELECT on SBCM_CALCED_PERCENTS_VIEWER to SBR_CREDITMANAGER;
Grant SELECT on SBA_ACTIVE_CREDITS to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_PROLONGATION to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_PERCENT_CONVERTING to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_PAYMENT_PLANE to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_PAYMENT to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_EXPIRE to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_CREDIT_TRANCHES to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_CONTRACT to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_RPDEPOSITORY to SBR_CREDITMANAGER;
Grant EXECUTE on SBCM_RESERVE_CONT to SBR_CREDITMANAGER;


--**********************SBR_CREDITSARCHIVE--**********************
                     ---Granting roles---
Grant SBR_CREDITMANAGER to SBR_CREDITSARCHIVE;
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_CURRENCYPOSITION--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_CURRENCYPOSITION;
Grant SELECT on BANKINFO to SBR_CURRENCYPOSITION;
Grant SELECT on OPERKURS to SBR_CURRENCYPOSITION;
Grant EXECUTE on SB_CURRENCYPOSITION to SBR_CURRENCYPOSITION;


--**********************SBR_CUSTOMERS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_CUSTOMERS;
Grant DELETE on CUSTIMAGE to SBR_CUSTOMERS;
Grant INSERT on CUSTIMAGE to SBR_CUSTOMERS;
Grant SELECT on CUSTIMAGE to SBR_CUSTOMERS;
Grant UPDATE on CUSTIMAGE to SBR_CUSTOMERS;
Grant SELECT on CUSTINFO to SBR_CUSTOMERS;
Grant SELECT on FILIAL to SBR_CUSTOMERS;
Grant SELECT on NALOG to SBR_CUSTOMERS;
Grant SELECT on ORG_PRAV to SBR_CUSTOMERS;
Grant SELECT on OTRASLI to SBR_CUSTOMERS;
Grant SELECT on PRINAD to SBR_CUSTOMERS;
Grant SELECT on QRP_KLIE to SBR_CUSTOMERS;
Grant SELECT on SFERADEY to SBR_CUSTOMERS;
Grant SELECT on VID_SOB to SBR_CUSTOMERS;
Grant SELECT on TENOSTAT to SBR_CUSTOMERS;
Grant DELETE on SBA_CUSTOMERS to SBR_CUSTOMERS;
Grant INSERT on SBA_CUSTOMERS to SBR_CUSTOMERS;
Grant SELECT on SBA_CUSTOMERS to SBR_CUSTOMERS;
Grant UPDATE on SBA_CUSTOMERS to SBR_CUSTOMERS;
Grant SELECT on SBA_ACCOUNT to SBR_CUSTOMERS;
Grant SELECT on SBA_CUSTOMERS_CENTRAL to SBR_CUSTOMERS;
Grant SELECT on SBA_ACCOUNT_CENTRAL to SBR_CUSTOMERS;
Grant EXECUTE on SBREF to SBR_CUSTOMERS;
Grant EXECUTE on SBOP to SBR_CUSTOMERS;
Grant EXECUTE on SB_CUSTINFO to SBR_CUSTOMERS;


--**********************SBR_CUSTOMERS_INFORMATIONS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on FILIAL to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on PROVARCH to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on SYSDAT to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on TENOSTAT to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on SBA_CUSTOMERS to SBR_CUSTOMERS_INFORMATIONS;
Grant SELECT on SBA_ACCOUNT to SBR_CUSTOMERS_INFORMATIONS;


--**********************SBR_DAYBYDAYBALANCE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on FILIAL to SBR_DAYBYDAYBALANCE;
Grant SELECT on SYSDAT to SBR_DAYBYDAYBALANCE;
Grant EXECUTE on SB_BALANCE to SBR_DAYBYDAYBALANCE;


--**********************SBR_DEPOSITCORRECTOR--**********************
                     ---Granting roles---
Grant SBR_CREDITMANAGER to SBR_DEPOSITCORRECTOR;
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_DEPOSITMANAGER--**********************
                     ---Granting roles---
Grant SBR_CREDITMANAGER to SBR_DEPOSITMANAGER;
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_DEPOSITSARCHIVE--**********************
                     ---Granting roles---
Grant SBR_CREDITMANAGER to SBR_DEPOSITSARCHIVE;
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_EXCHANGE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_EXCHANGE;
Grant SELECT on BANKINFO to SBR_EXCHANGE;
Grant SELECT on CONVERT_ASSIGNMENTS to SBR_EXCHANGE;
Grant SELECT on EXCACCOUNT to SBR_EXCHANGE;
Grant SELECT on EXCHANGES to SBR_EXCHANGE;
Grant SELECT on SETEXCHANGE to SBR_EXCHANGE;
Grant DELETE on SETEXCHANGE to SBR_EXCHANGE;
Grant INSERT on SETEXCHANGE to SBR_EXCHANGE;
Grant UPDATE on SETEXCHANGE to SBR_EXCHANGE;
Grant SELECT on EXCONVERT to SBR_EXCHANGE;
Grant SELECT on SBA_ACCOUNT to SBR_EXCHANGE;
Grant SELECT on BUY to SBR_EXCHANGE;
Grant SELECT on SELL to SBR_EXCHANGE;
Grant SELECT on CONVERTBUY to SBR_EXCHANGE;
Grant SELECT on CONVERTSELL to SBR_EXCHANGE;
Grant SELECT on RESULT to SBR_EXCHANGE;
Grant EXECUTE on SBREF to SBR_EXCHANGE;
Grant EXECUTE on SB_MTOUTVIEW to SBR_EXCHANGE;


--**********************SBR_EXPERTANALYS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_EXPERTANALYS;
Grant SELECT on AVALUTE to SBR_EXPERTANALYS;
Grant SELECT on BAL_SPR1 to SBR_EXPERTANALYS;
Grant SELECT on OPERATIONS to SBR_EXPERTANALYS;
Grant INSERT on OPERATIONS to SBR_EXPERTANALYS;
Grant DELETE on OPERATIONS to SBR_EXPERTANALYS;
Grant UPDATE on OPERATIONS to SBR_EXPERTANALYS;
Grant SELECT on OPERATION_BALANCES to SBR_EXPERTANALYS;
Grant INSERT on OPERATION_BALANCES to SBR_EXPERTANALYS;
Grant DELETE on OPERATION_BALANCES to SBR_EXPERTANALYS;
Grant UPDATE on OPERATION_BALANCES to SBR_EXPERTANALYS;
Grant SELECT on OPERATION_SCHEMA to SBR_EXPERTANALYS;
Grant INSERT on OPERATION_SCHEMA to SBR_EXPERTANALYS;
Grant DELETE on OPERATION_SCHEMA to SBR_EXPERTANALYS;
Grant UPDATE on OPERATION_SCHEMA to SBR_EXPERTANALYS;
Grant SELECT on SYSDAT to SBR_EXPERTANALYS;
Grant SELECT on SBA_ACCOUNT to SBR_EXPERTANALYS;


--**********************SBR_INCOMESANDEXPENSES--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BAL_SPR1 to SBR_INCOMESANDEXPENSES;
Grant SELECT on BANKINFO to SBR_INCOMESANDEXPENSES;
Grant SELECT on FILIAL to SBR_INCOMESANDEXPENSES;
Grant SELECT on PROVARCH to SBR_INCOMESANDEXPENSES;
Grant SELECT on SYSDAT to SBR_INCOMESANDEXPENSES;
Grant SELECT on SBA_ACCOUNT to SBR_INCOMESANDEXPENSES;


--**********************SBR_MAINFACILITIES--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHIVE_WARES1 to SBR_MAINFACILITIES;
Grant SELECT on BANKINFO to SBR_MAINFACILITIES;
Grant SELECT on DEPARTMENTS to SBR_MAINFACILITIES;
Grant SELECT on GROUPS to SBR_MAINFACILITIES;
Grant SELECT on MFTRAFFICS to SBR_MAINFACILITIES;
Grant SELECT on MODERNED_WARES to SBR_MAINFACILITIES;
Grant SELECT on REPAIRED_WARES to SBR_MAINFACILITIES;
Grant SELECT on WARES to SBR_MAINFACILITIES;
Grant SELECT on SBA_ACCOUNT to SBR_MAINFACILITIES;
Grant EXECUTE on SBMSG to SBR_MAINFACILITIES;
Grant EXECUTE on SB_TRANSACTION to SBR_MAINFACILITIES;
Grant EXECUTE on SB_MAIN_FACILITIES to SBR_MAINFACILITIES;


--**********************SBR_MEMORIALPROJECT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_MEMORIALPROJECT;
Grant SELECT on BANKINFO to SBR_MEMORIALPROJECT;
Grant SELECT on MEMORIAL to SBR_MEMORIALPROJECT;
Grant EXECUTE on SB_MEMORIAL to SBR_MEMORIALPROJECT;


--**********************SBR_OBRSAVED--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_OBRSAVED;
Grant SELECT on FILIAL to SBR_OBRSAVED;
Grant SELECT on OPERKURS to SBR_OBRSAVED;
Grant EXECUTE on SB_MTOUTVIEW to SBR_OBRSAVED;


--**********************SBR_ODDSOFRATE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_OLDCOURSES--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_OLDCOURSES;
Grant SELECT on OPERKURS to SBR_OLDCOURSES;
Grant EXECUTE on SB_MAIN_FACILITIES to SBR_OLDCOURSES;


--**********************SBR_ORDER--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_ORDER;
Grant SELECT on AVALUTE to SBR_ORDER;
Grant SELECT on BANKINFO to SBR_ORDER;
Grant SELECT on SBCM_ACC_ZONES to SBR_ORDER;
Grant SELECT on SBCM_ACC_ZONE_INFO to SBR_ORDER;
Grant SELECT on SYSDAT to SBR_ORDER;
Grant SELECT on SBA_ACCOUNT to SBR_ORDER;


--**********************SBR_PAYMENTDECREEX--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BANKINFO to SBR_PAYMENTDECREEX;
Grant SELECT on BANKM to SBR_PAYMENTDECREEX;
Grant SELECT on PAYMENTDECREE to SBR_PAYMENTDECREEX;
Grant SELECT on SBA_ACCOUNT to SBR_PAYMENTDECREEX;
Grant EXECUTE on SB_PAYMENTDECREE to SBR_PAYMENTDECREEX;


--**********************SBR_PROFITCLOSING--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on TEMPTRANZ to SBR_PROFITCLOSING;
Grant SELECT on SBA_ACCOUNT to SBR_PROFITCLOSING;
Grant SELECT on CLOSE_PROFITS_ACCS to SBR_PROFITCLOSING;
Grant EXECUTE on SBMSG to SBR_PROFITCLOSING;
Grant EXECUTE on SBSYS to SBR_PROFITCLOSING;
Grant EXECUTE on SB_TRANSACTION to SBR_PROFITCLOSING;


--**********************SBR_QUERYEXPORTER--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on SB_QUERIES to SBR_QUERYEXPORTER;
Grant INSERT on SB_QUERIES to SBR_QUERYEXPORTER;
Grant DELETE on SB_QUERIES to SBR_QUERYEXPORTER;
Grant UPDATE on SB_QUERIES to SBR_QUERYEXPORTER;


--**********************SBR_RATEMANAGEMENT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_RATEMANAGEMENT;
Grant SELECT on TEMPRATE to SBR_RATEMANAGEMENT;
Grant DELETE on TEMPRATE to SBR_RATEMANAGEMENT;
Grant INSERT on TEMPRATE to SBR_RATEMANAGEMENT;
Grant UPDATE on TEMPRATE to SBR_RATEMANAGEMENT;
Grant SELECT on TEMPTRANZ to SBR_RATEMANAGEMENT;
Grant SELECT on SBA_ACCOUNT to SBR_RATEMANAGEMENT;
Grant EXECUTE on SBMSG to SBR_RATEMANAGEMENT;
Grant EXECUTE on SBSYS to SBR_RATEMANAGEMENT;
Grant EXECUTE on SBRM to SBR_RATEMANAGEMENT;
Grant EXECUTE on SB_TRANSACTION to SBR_RATEMANAGEMENT;


--**********************SBR_REFEDIT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant DELETE on FILIAL to SBR_REFEDIT;
Grant INSERT on FILIAL to SBR_REFEDIT;
Grant SELECT on FILIAL to SBR_REFEDIT;
Grant UPDATE on FILIAL to SBR_REFEDIT;
Grant DELETE on NALOG to SBR_REFEDIT;
Grant INSERT on NALOG to SBR_REFEDIT;
Grant SELECT on NALOG to SBR_REFEDIT;
Grant UPDATE on NALOG to SBR_REFEDIT;
Grant DELETE on ORG_PRAV to SBR_REFEDIT;
Grant INSERT on ORG_PRAV to SBR_REFEDIT;
Grant SELECT on ORG_PRAV to SBR_REFEDIT;
Grant UPDATE on ORG_PRAV to SBR_REFEDIT;
Grant DELETE on OTRASLI to SBR_REFEDIT;
Grant INSERT on OTRASLI to SBR_REFEDIT;
Grant SELECT on OTRASLI to SBR_REFEDIT;
Grant UPDATE on OTRASLI to SBR_REFEDIT;
Grant DELETE on PRINAD to SBR_REFEDIT;
Grant INSERT on PRINAD to SBR_REFEDIT;
Grant SELECT on PRINAD to SBR_REFEDIT;
Grant UPDATE on PRINAD to SBR_REFEDIT;
Grant DELETE on QRP_KLIE to SBR_REFEDIT;
Grant INSERT on QRP_KLIE to SBR_REFEDIT;
Grant SELECT on QRP_KLIE to SBR_REFEDIT;
Grant UPDATE on QRP_KLIE to SBR_REFEDIT;
Grant DELETE on REPORT_SYMBOL to SBR_REFEDIT;
Grant INSERT on REPORT_SYMBOL to SBR_REFEDIT;
Grant SELECT on REPORT_SYMBOL to SBR_REFEDIT;
Grant UPDATE on REPORT_SYMBOL to SBR_REFEDIT;
Grant DELETE on SFERADEY to SBR_REFEDIT;
Grant INSERT on SFERADEY to SBR_REFEDIT;
Grant SELECT on SFERADEY to SBR_REFEDIT;
Grant UPDATE on SFERADEY to SBR_REFEDIT;
Grant DELETE on VID_SOB to SBR_REFEDIT;
Grant INSERT on VID_SOB to SBR_REFEDIT;
Grant SELECT on VID_SOB to SBR_REFEDIT;
Grant UPDATE on VID_SOB to SBR_REFEDIT;


--**********************SBR_SPLASH--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---


--**********************SBR_STANDART--**********************
                     ---Granting roles---
Grant CONNECT to SBR_STANDART;
Grant EXECUTE_CATALOG_ROLE to SBR_STANDART;
                     ---Granting system privileges---
Grant CREATE SESSION to SBR_STANDART;
                     ---Granting tab privs---
Grant SELECT on USER$ to SBR_STANDART;
Grant EXECUTE on SBLOGIN to SBR_STANDART;
Grant EXECUTE on SB_ACA to SBR_STANDART;


--**********************SBR_STATEMENT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_STATEMENT;
Grant SELECT on BANKINFO to SBR_STATEMENT;
Grant SELECT on FILIAL to SBR_STATEMENT;
Grant SELECT on OPERKURS to SBR_STATEMENT;
Grant EXECUTE on P_EXTRACTION to SBR_STATEMENT;
Grant EXECUTE on SBOP to SBR_STATEMENT;


--**********************SBR_SWIFT--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_SWIFT;
Grant SELECT on AVALUTE to SBR_SWIFT;
Grant SELECT on BANKINFO to SBR_SWIFT;
Grant SELECT on BANKM to SBR_SWIFT;
Grant SELECT on COMMISION_TRANS to SBR_SWIFT;
Grant SELECT on FILIAL to SBR_SWIFT;
Grant SELECT on FILIALINFO to SBR_SWIFT;
Grant SELECT on HOX102_OUT to SBR_SWIFT;
Grant SELECT on HOX150_OUT to SBR_SWIFT;
Grant SELECT on HOXMESSAGE_IN to SBR_SWIFT;
Grant SELECT on HOXMESSAGE_OUT to SBR_SWIFT;
Grant SELECT on HOXSW_ACCOUNT to SBR_SWIFT;
Grant SELECT on HOXSW_PROPER to SBR_SWIFT;
Grant SELECT on HOXTRANSTYPE_CODE to SBR_SWIFT;
Grant SELECT on OPERKURS to SBR_SWIFT;
Grant SELECT on SWIFT to SBR_SWIFT;
Grant SELECT on SBA_CUSTOMERS to SBR_SWIFT;
Grant SELECT on SBA_ACCOUNT to SBR_SWIFT;
Grant EXECUTE on SBOP to SBR_SWIFT;
Grant EXECUTE on SB_COMPLEX_TRANSACTIONS to SBR_SWIFT;
Grant EXECUTE on SWIFT_PACK to SBR_SWIFT;
Grant EXECUTE on SB_TRANSACTION to SBR_SWIFT;
Grant EXECUTE on HOXPACK to SBR_SWIFT;


--**********************SBR_TODAYBALANCE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_TODAYBALANCE;
Grant SELECT on AVALUTE to SBR_TODAYBALANCE;
Grant SELECT on BAL_SPR1 to SBR_TODAYBALANCE;
Grant SELECT on BANKINFO to SBR_TODAYBALANCE;
Grant SELECT on FILIAL to SBR_TODAYBALANCE;
Grant SELECT on OPERKURS to SBR_TODAYBALANCE;
Grant SELECT on PROVARCH to SBR_TODAYBALANCE;
Grant SELECT on SYSDAT to SBR_TODAYBALANCE;
Grant SELECT on PROVDOC to SBR_TODAYBALANCE;
Grant SELECT on TENOSTAT to SBR_TODAYBALANCE;
Grant SELECT on SBA_ACCOUNT to SBR_TODAYBALANCE;
Grant EXECUTE on SBSEC to SBR_TODAYBALANCE;
Grant EXECUTE on SB_MTOUTVIEW to SBR_TODAYBALANCE;


--**********************SBR_TRANSACTION--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_TRANSACTION;
Grant SELECT on BAL_SPR1 to SBR_TRANSACTION;
Grant SELECT on BANKM to SBR_TRANSACTION;
Grant SELECT on COMMISION_TRANS to SBR_TRANSACTION;
Grant SELECT on CONVERT_ASSIGNMENTS to SBR_TRANSACTION;
Grant SELECT on FILIAL to SBR_TRANSACTION;
Grant SELECT on KASSA_B to SBR_TRANSACTION;
Grant SELECT on TEMPRATE to SBR_TRANSACTION;
Grant SELECT on TEMPTRANZ to SBR_TRANSACTION;
Grant SELECT on TRDESTINATION to SBR_TRANSACTION;
Grant SELECT on TENOSTAT to SBR_TRANSACTION;
Grant SELECT on SBA_ACCOUNT to SBR_TRANSACTION;
Grant SELECT on SBA_CUSTOMERS_CENTRAL to SBR_TRANSACTION;
Grant SELECT on SBA_ACCOUNT_CENTRAL to SBR_TRANSACTION;
Grant SELECT on USER$ to SBR_TRANSACTION;
Grant SELECT on SBA_TRANSACTIONS to SBR_TRANSACTION;
Grant EXECUTE on SBOP to SBR_TRANSACTION;
Grant EXECUTE on SBMSG to SBR_TRANSACTION;
Grant EXECUTE on SBSETTINGS to SBR_TRANSACTION;
Grant EXECUTE on SBREP to SBR_TRANSACTION;
Grant EXECUTE on SB_COMPLEX_TRANSACTIONS to SBR_TRANSACTION;
Grant EXECUTE on SB_TRANSACTION to SBR_TRANSACTION;


--**********************SBR_TRANSACTIONSVIEWER--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on BANKINFO to SBR_TRANSACTIONSVIEWER;
Grant SELECT on PROVARCH to SBR_TRANSACTIONSVIEWER;
Grant SELECT on SYSDAT to SBR_TRANSACTIONSVIEWER;
Grant SELECT on SBA_ACCOUNT to SBR_TRANSACTIONSVIEWER;
Grant EXECUTE on SB_MEMORIAL to SBR_TRANSACTIONSVIEWER;


--**********************SBR_TUNINGTRANSACTIONS--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on AVALUTE to SBR_TUNINGTRANSACTIONS;
Grant SELECT on COMMISION_TRANS to SBR_TUNINGTRANSACTIONS;
Grant SELECT on QRP_KLIE to SBR_TUNINGTRANSACTIONS;
Grant DELETE on QRP_KLIE to SBR_TUNINGTRANSACTIONS;
Grant INSERT on QRP_KLIE to SBR_TUNINGTRANSACTIONS;
Grant UPDATE on QRP_KLIE to SBR_TUNINGTRANSACTIONS;
Grant SELECT on TARIFFSCALE to SBR_TUNINGTRANSACTIONS;
Grant DELETE on TARIFFSCALE to SBR_TUNINGTRANSACTIONS;
Grant INSERT on TARIFFSCALE to SBR_TUNINGTRANSACTIONS;
Grant UPDATE on TARIFFSCALE to SBR_TUNINGTRANSACTIONS;
Grant SELECT on SBA_ACCOUNT to SBR_TUNINGTRANSACTIONS;
Grant EXECUTE on SB_COMPLEX_TRANSACTIONS to SBR_TUNINGTRANSACTIONS;


--**********************SBR_TURNOVERSFORPERIOD--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---
Grant SELECT on ARCHOST to SBR_TURNOVERSFORPERIOD;
Grant SELECT on AVALUTE to SBR_TURNOVERSFORPERIOD;
Grant SELECT on BAL_SPR1 to SBR_TURNOVERSFORPERIOD;
Grant SELECT on BAL_SPR2 to SBR_TURNOVERSFORPERIOD;
Grant SELECT on BAL_SPR3 to SBR_TURNOVERSFORPERIOD;
Grant SELECT on BAL_SPR4 to SBR_TURNOVERSFORPERIOD;
Grant SELECT on BANKINFO to SBR_TURNOVERSFORPERIOD;
Grant SELECT on FILIAL to SBR_TURNOVERSFORPERIOD;
Grant SELECT on OPERKURS to SBR_TURNOVERSFORPERIOD;
Grant SELECT on SYSDAT to SBR_TURNOVERSFORPERIOD;
Grant SELECT on SBA_ACCOUNT to SBR_TURNOVERSFORPERIOD;
Grant EXECUTE on SB_MTOUTVIEW to SBR_TURNOVERSFORPERIOD;


--**********************SBR_UREPORTPACKCONSOLE--**********************
                     ---Granting roles---
                     ---Granting system privileges---
                     ---Granting tab privs---



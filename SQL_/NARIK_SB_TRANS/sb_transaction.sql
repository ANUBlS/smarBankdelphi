CREATE OR REPLACE 
PACKAGE sb_transaction
  IS

	/* SessionID of the user session */
	/* used by transaction_temp_add */
	SessionID integer := USERENV('SESSIONID');
	
	DefaultTrDeleteFlags constant integer := 0;
		
	type t_transaction is record (
		ID integer,
		OperatorID integer,
		ParentID integer,
		TrDate date,
		DebitID integer,
		CreditID integer,
		DebitAmount number,
		CreditAmount number,
		LAmount number,
		DebitRate number,
		CreditRate number,
		InBalanceChar integer,
		OutBalanceChar integer,
		Name provdoc.name%type,
		Flags integer,
		Status integer,
		OperationType integer,
		Param1 varchar2(256),
        TransactionNo varchar(20)
	);

	/* transaction_add
	||
	|| Adds a transaction
	||
	|| --------------------------
	|| Input:
	||   TransactionDate - date of transaction. By default if parameter are ommited
	||     or if null passed, current system (bank) date will used instead
	||   DebitID  (required) - ID of the debit account
	||   CreditID (required) - ID of the credit account
	||   DebitAmount (required) - Amount in debit currency. If null passed, 
	||     amount should be calculated from CreditAmount or LAmount (see below)
	||   CreditAmount (required) - Amount in credit currency. See comments 
	||     for DebitAMount
	||   LAmount (required) - Amount in local (national) currency. See comments 
	||     for DebitAMount
	||   DebitRate - Rate of the debit currency. If null is passed (or the 
	||     parameter is ommited) rate should be retreived from system dataset
	||   CreditRate - Rate of the credit currency. See comments 
	||     for DebitRate    
	||   TrName - Name (destination, comments) for transaction
	||   Flags - The flags :). Type: set of bits. See SBDECLS constants and 
	||     comments section for brief specification of this parameter. 
	||     By default transaction are delayed (0 is passed by default, 
	||     this means no parameters)
	||   InBalanceChar & OutBalanceChar - transactions grouping symbols.
	||     Used in specific reports
	||   TransactionID - ID of transaction. Usefull for child transaction, or
	||     if commited transaction MUST some ID with parent (not commited) 
	||     transaction. If null passed, or parameter ommited, ID will generated
	||     from specific sequence
	||
	|| -----------------------------------
	|| Output:
	||   Returns ID of the transaction 
	*/
  procedure transaction_delete (TransactionID integer,Flags integer default DefaultTrDeleteFlags);
  function transaction_commit(TransactionID integer, CommitTemp boolean default True)	return integer;
		
	/* Transaction groups management functions */
  function transactions_commit(TrIDs varchar2,CommitTemp boolean default True) return integer;
  function transactions_delayed_commit(OverloadIDsStr varchar2, CommitTemp boolean) return integer;
  function transactions_temp_commit (ATempID integer) return integer;
  function transactions_temp_delete(ATempID integer)	return integer;
  function gen_temp_id return integer;
  function transaction_reject(TransactionID integer, RejectReason varchar2) return integer;
  function transaction_get(ATransactionID integer)	return t_transaction;
  Function GetRate (AccID integer, ArchiveDate date) return number;
  ------------------------------------------------	
  function GenerateID return provdoc.id%type;
  function transaction_add (
   TransactionDate  date default null,
   DebitID                 integer,
   CreditID                integer,
   DebitAmount        number,
   CreditAmount       number,
   LAmount               number,
   DebitRate             number default null,
   CreditRate            number default null, -- rates should be retreived from system dataset
   TrName                varchar,
   Flags                    integer default 0,      -- transaction are delayed by default
   InBalanceChar	integer default null,
   OutBalanceChar	integer default null,
   TransactionID	integer default null,
   OperationType	integer default null,
   ParentID	integer default null,
   TempID		integer default null,
   OperatorId            integer default null,
   TransactionNo varchar default null     -- TNarik
  ) return integer;
END;
/

CREATE OR REPLACE 
PACKAGE BODY sb_transaction IS
/* Error messages */
Message_NoMultyCurrencyError constant varchar2(64)  :=  'Multy currency transactions are not enabled';
Message_NullAmountsError constant varchar2(64)         :=  'Amount or LAmount must be non-zero';
Merr_DebitAccountArested constant varchar2(64)            :=  'Debit account are under arest';
Merr_CreditAccountArested constant varchar2(64)           :=  'Credit account are under arest';
Merr_InsufficientParameters constant varchar2(64)         :=  'One of amounts must be not null';
		
/* variables & constants */  
TrDestinationFormatDebit varchar2(1024)  := SBMSG.get_message('SBOP.AddTransaction.MultyCurrencyDestinationFormat_Debit');
TrDestinationFormatCredit varchar2(1024) := SBMSG.get_message('SBOP.AddTransaction.MultyCurrencyDestinationFormat_Credit');
		
/* Functions */
function mask_flags(Flags integer, Flag integer) return integer is
begin
 return BitAnd(Flags, 65535 - Flag);
end;
---------------------------------
Function gen_temp_id return integer as
begin
 return sbutil.gen_unique_id();    
end;
----------------------------
Procedure add_std_transaction (
    OperatorID           integer,
    DebitID                 integer,
    CreditID                integer,
    DAmount              number,
    CAmount               number,
    LAmount               number,
    DebitRate             number,
    CreditRate            number,
    TrName                 varchar2,
    Flags                    integer default 0,
    InBalanceChar     integer,
    OutBalanceChar  integer,
    OperationType     integer default null,
    AParentID            integer default null,
    Result                 in out integer,
    TransactionID     in  integer default null,
    TransactionNo    varchar default null
  )   as
    DebitCurrency        account.val_acc%type;
    CreditCurrency       account.val_acc%type;
    DebitORate             number (11, 2);
    CreditORate            number (11, 2);
    DebitAmount           tenostat.ostat%type;
    CreditAmount          tenostat.ostat%type;
    DebitLAmount         tenostat.pok_ostat%type;
    CreditLAmount        tenostat.pok_ostat%type;
    CurrencyRate         number (11, 2);
    CurrentDate            date;
    DebitLimit               account.limit%type;
    CreditLimit              account.limit%type;
    DebitAccType          bal_spr1.TypeID%type;
    CreditAccType         integer;
    DebetCID                 integer;
    CreditCID                 integer;
    Debit_DTurnover     tenostat.obr_d%type;
    Debit_DLTurnover    tenostat.pok_obr_d%type;
    Debit_CTurnover     tenostat.obr_k%type;
    Debit_CLTurnover    tenostat.pok_obr_k%type;
    Credit_DTurnover    tenostat.obr_d%type;
    Credit_DLTurnover   tenostat.pok_obr_d%type;
    Credit_CTurnover    tenostat.obr_k%type;
    Credit_CLTurnover   tenostat.pok_obr_k%type;
    Debit_SID               integer;
    Credit_SID              integer;
    TrDebitAmount        number (15, 2);
    TrCreditAmount       number (15, 2);
    TrLAmount              number (15, 2);
    ATransactionID 	   integer := TransactionID;
    
    updRowCount integer := 0;
  begin
  if ATransactionID is null then
    select tr_seg_PROVARCH.nextval into ATransactionID from dual; 
  end if;
    /* get accounts' data */
    select val_acc, limit, bal_cn1 into DebitCurrency, DebitLimit, Debit_SID from account where id = DebitID;
    select val_acc, limit, bal_cn1 into CreditCurrency, CreditLimit, Credit_SID from account where id = CreditID;

    /* get account's states */
    select ostat, pok_ostat, obr_d, pok_obr_d, obr_k, pok_obr_k  into 
     DebitAmount, DebitLAmount, Debit_DTurnover, Debit_DLTurnover, Debit_CTurnover, Debit_CLTurnover
      from tenostat  where acc_id = DebitID;

    select ostat, pok_ostat, obr_d, pok_obr_d, obr_k, pok_obr_k  into 
      CreditAmount, CreditLAmount, Credit_DTurnover, Credit_DLTurnover, Credit_CTurnover, Credit_CLTurnover
       from tenostat where acc_id = creditid;

    /* get account's flags (active, passive, etc.) */
    select TypeID into DebitAccType from bal_spr1 where bal_cn = Debit_SID;
    select TypeID into CreditAccType from bal_spr1 where bal_cn = Credit_SID;

    CurrentDate := SBOP.get_date;

    if  (TrDebitAmount = 0) and (TrLAmount = 0) then
      raise_application_error ( sbdecls.Error_NullAmounts, Message_NullAmountsError );
    end if;

    /* Check arest flags DI__ABLO*/
--    if    sbutil.get_account_flag (DebitID, 'Arested')
--       or sbutil.get_account_flag (DebitID, 'DebitArested')
    if sbutil.FindAccFlag(DebitID,'DebitArested') then
      raise_application_error ( sbdecls.Error_DebitAccountArested, Merr_DebitAccountArested );
    end if;

--    if    sbutil.get_account_flag (CreditID, 'Arested')
--       or sbutil.get_account_flag (CreditID, 'CreditArested')
    if sbutil.FindAccFlag(CreditID,'CreditArested') then
      raise_application_error ( sbdecls.Error_CreditAccountArested, Merr_CreditAccountArested );
    end if;

    /* get rates of account's currencies */
    select ostat into DebitORate from operkurs partition (ToDay) where (val_kod = DebitCurrency);
    select ostat into creditorate from operkurs partition (ToDay)   where (val_kod = CreditCurrency);

    /* round policy */
    TrDebitAmount := sbutil.Round_Currency (DAmount);
    TrCreditAmount := sbutil.Round_Currency (CAmount); 
    TrLAmount := sbutil.Round_Currency (LAmount);

    if TrLAmount is null then
     if TrDebitAmount is not null then
      TrLAmount := TrDebitAmount * DebitORate;
     elsif TrCreditAmount is null then
      raise_application_error(sbdecls.Error_InsufficientParameters, Merr_InsufficientParameters);
     else
      TrLAmount := TrCreditAmount * CreditORate;
     end if;
    end if;

    if TrDebitAmount is null then
     TrDebitAmount := TrLAmount / DebitORate;
    end if;
    
    if TrCreditAmount is null then
     TrCreditAmount := TrLAmount / CreditORate;
    end if;

    /* check account's balance & limit conditions and raise an exception if they are violated */

--  amt begin
    if not (   --sbutil.get_account_flag (DebitID, 'Overdraft')
               sbutil.FindAccFlag (DebitID, 'Overdraft')
            or (DebitAccType = sbdecls.atActive)
            or (DebitAccType = sbdecls.atActivePassive)
            or (  DebitAmount
                - DebitLimit >= TrDebitAmount
               )  )  then
      raise_application_error ( sbdecls.Error_DebitBalanceViolation,
           'Amount or limit condition on debet account is not enought for transaction. '
        || 'Balance: '
        || DebitAmount
        || ', localized balance: '
        || DebitLAmount
        || '. Required: '
        || TrDebitAmount
        || ', '
        || TrLAmount
      );
    end if;
   
     --dbms_output.put_line(to_char(CreditID));
     --dbms_output.put_line(to_char(CreditAmount - CreditLimit)||TO_CHAR(-TrCreditAmount));
     --dbms_output.put_line('CreditAccType =  '||To_char(CreditAccType));
     --dbms_output.put_line('CreditAccType =  '||To_char(CreditAccType));	 

    if not (   --sbutil.get_account_flag (CreditID, 'Overdraft')
               sbutil.FindAccFlag (CreditID, 'Overdraft')
            or (CreditAccType = sbdecls.atPassive)
            or (CreditAccType = sbdecls.atActivePassive)
            or (  CreditAmount
                - CreditLimit <= -TrCreditAmount)
           )
    then
      raise_application_error ( sbdecls.Error_CreditBalanceViolation,
           'Amount or limit condition on credit account is not enought for transaction. '
        || 'Balance: '
        || CreditAmount
        || ', localized balance: '
        || CreditLAmount
        || '. Required: '
        || TrCreditAmount
        || ', '
        || TrLAmount
      );
    end if;
		
-- amt end

    /* All checks passed, values accepted. Processing... :) */

    /*  if atfNoAdd flags is fired,
        we will not actually add transaction,
        & value returned in "Result" will -1
    */

    if BitAnd (Flags, sbdecls.atfNoAdd) = 0
    then
      /* Add in PROVARCH */

      insert into provarch (
          ID, OP_ID,  vid_op, ParentID, dat, debt, kredit
        , val_acc, currencyid_c, ammount, lammount, tim, Shifr
        , rate_d, rate_c, ammount_c, Kassa_B, Kassa_Z, name, no_prov)
      values (
           ATransactionID, OperatorID, OperationType, AParentID, CurrentDate, DebitID, CreditID
         , DebitCurrency, CreditCurrency, TrDebitAmount, TrLAmount, SYSDATE, 3
         , DebitRate, CreditRate, TrCreditAmount, InBalanceChar, OutBalanceChar, TrName,TransactionNo)  --TNarik
	returning ID into Result;

      /* add transaction into provdoc */

      Debit_DTurnover     :=   Debit_DTurnover     + TrDebitAmount;
      Debit_DLTurnover   :=   Debit_DLTurnover   + TrLAmount;
      Credit_CTurnover    :=   Credit_CTurnover    + TrCreditAmount;
      Credit_CLTurnover  :=   Credit_CLTurnover  + TrLAmount;

      update tenostat  set 
             ostat          =   DebitAmount - TrDebitAmount,
             pok_ostat  =   DebitLAmount - TrLAmount,
             datdate      =  CurrentDate,
             obr_d         =  Debit_DTurnover,
             pok_obr_d =  Debit_DLTurnover
       where acc_id = DebitID;
      
      updRowCount := updRowCount + SQL%rowcount; 

      update tenostat set 
             ostat          =   CreditAmount + TrCreditAmount,
             pok_ostat  =   CreditLAmount + TrLAmount,
             datdate      = CurrentDate,
             obr_k         = Credit_CTurnover,
             pok_obr_k = Credit_CLTurnover
       where acc_id = CreditID;

      updRowCount := updRowCount + SQL%rowcount;
      
      if updRowCount <> 2 then
        RAISE_APPLICATION_ERROR(-20001, 'Please report to  administrator about this Internal Program Error');
      end if; 
       
      update LazyRest set 
             ostat          =   DebitAmount  - TrDebitAmount,
             pok_ostat  =   DebitLAmount - TrLAmount,
             datdate      =   CurrentDate,
             obr_d         =   Debit_DTurnover,
             pok_obr_d =   Debit_DLTurnover
       where acc_id = DebitID;

      update LazyRest set 
             ostat           =   CreditAmount  + TrCreditAmount,
             pok_ostat   =   CreditLAmount + TrLAmount,
             datdate       =   CurrentDate,
             obr_k          =   Credit_CTurnover,
             pok_obr_k  =   Credit_CLTurnover
       where acc_id = CreditID;
    else
      Result := -1;    /* Transaction not actually added - result undefined */
    end if;           /* if bitand ... atfNoAdd ... */
  end;
--------------------------------------------------------
  procedure del_std_transaction (TransactionID integer) as
    Tr            provdoc%rowtype;
    AddTrResult   integer;
    CurrentDate   date := SBOP.get_date;
  begin
    select * into Tr from provdoc where ID = TransactionID;
   update archost set
     ostat = ostat + Tr.ammount,
     pok_ostat = pok_ostat + Tr.LAmmount,
     obr_d = obr_d - Tr.Ammount,
     pok_obr_d = pok_obr_d - Tr.LAmmount
  where (ACC_ID = Tr.DEBT) and (datdate = CurrentDate);
		 
  update archost set
   ostat = ostat - Tr.Ammount_C,
   pok_ostat = pok_ostat - Tr.LAmmount,
   obr_k = obr_k - Tr.Ammount_C,
   pok_obr_k = pok_obr_k - Tr.LAmmount
  where (ACC_ID = Tr.KREDIT) and (datdate = CurrentDate);

  update LazyRest set 
           ostat     =   ostat + Tr.Ammount,
           pok_ostat =   pok_ostat + Tr.LAmmount,
           obr_d     =   obr_d - Tr.Ammount,
           pok_obr_d =   pok_obr_d - Tr.LAmmount
     where acc_id = Tr.DEBT;

    update LazyRest set 
           ostat     =   ostat - Tr.Ammount_C,
           pok_ostat =   pok_ostat - Tr.LAmmount,
           obr_k     =   obr_k - Tr.Ammount_C,
           pok_obr_k =   pok_obr_k - Tr.LAmmount
     where acc_id = Tr.KREDIT;

    delete from provarch
      where ID = TransactionID;
  end;
-------------------------------------------
Function transaction_get_status(TransactionID integer) return integer 	is
cursor c_transaction_status is select status from today_transactions_all where ID = TransactionID;
Result integer;
begin
 open c_transaction_status; 
 fetch c_transaction_status into Result;
 close c_transaction_status;
 return Result; 
end;
----------------------------------------------	
function transaction_temp_add (Transaction in out t_transaction) return integer is
Result integer;
AFlags integer;
begin
AFlags := Mask_Flags(Transaction.Flags, sbdecls.atfTemporary/*+sbdecls.atfCommitImmediate*/);
if (not (Transaction.Flags is null)) and (AFlags is null) then
 raise_application_error(-20001, 'Flags is null');
end if;
Insert into TempTranz (
   ID, OperatorID, ParentID,
   DebitID, CreditID, DebitAmount, CreditAmount, LAmount, 
   DebitRate, CreditRate, TrName, Flags, TempID, VID_OP,
   Kassa_B, Kassa_Z, --modified by Tars in 17/12/2002 
   SessionID, no_prov)   
 values (
  Transaction.ID,
  Transaction.OperatorID,
  Transaction.ParentID,
  Transaction.DebitID, Transaction.CreditID, 
  Transaction.DebitAmount, Transaction.CreditAmount, 
  Transaction.LAmount, Transaction.DebitRate, 
  Transaction.CreditRate, Transaction.Name, 
  AFlags,
  TO_NUMBER(Transaction.Param1),
  Transaction.OperationType,
  Transaction.InBalanceChar,
  Transaction.OutBalanceChar,
  SessionID, Transaction.TransactionNo)--TNarik
    returning ID into Result;
Transaction.ID := Result;
return Result;
end;
-----------------------------------------
Function transaction_temp_add(
  OperatorID               integer,
  DebitID                    integer,
  CreditID                   integer,
  DebitAmount           number,
  CreditAmount          number,
  LAmount                  number,
  DebitRate                number,
  CreditRate               number,
  TrName                    varchar,
  Flags                        integer,
  InBalanceChar    in  integer,
  OutBalanceChar  in integer,
  TransactionID          integer default null,
  ATempID	   integer,
  OperationType integer default null,     -- Amt vid_op
  TransactionNo varchar default null     --TNarik
) return integer is
  Transaction t_transaction;
begin
--dbms_output.put_line('transaction_temp_add '|| to_char(OperationType));
 Transaction.ID := TransactionID;
 Transaction.OperatorID := OperatorID;
 Transaction.DebitID := DebitID;
 Transaction.CreditID := CreditID;
 Transaction.DebitAmount := DebitAmount;
 Transaction.CreditAmount := CreditAmount;
 Transaction.LAmount := LAmount;
 Transaction.DebitRate := DebitRate;
 Transaction.CreditRate := CreditRate;
 Transaction.Flags := Flags; 
 Transaction.Param1 := TO_CHAR(ATempID);
 Transaction.InBalanceChar := InBalanceChar;
 Transaction.OutBalanceChar := OutBalanceChar; 
 Transaction.Name := TrName;
 Transaction.OperationType :=OperationType;
 Transaction.TransactionNo := TransactionNo;  
return transaction_temp_add(Transaction);
end;
-------------------------------------------
Procedure transaction_delayed_delete(TransactionID integer, Flags integer default DefaultTrDeleteFlags) is
 cursor c_delayed_transaction is select * from LAZYTRANSACTION where ID = TransactionID; 
 DelayedTransaction c_delayed_transaction%rowtype;
 NotFound boolean;
begin
 open c_delayed_transaction;
 fetch c_delayed_transaction into DelayedTransaction;
 NotFound := c_delayed_transaction%notfound;
 close c_delayed_transaction;  
 if NotFound then
  raise_application_error(sbdecls.Error_InvalidParameters,	
   'transaction_delayed_delete: Transaction with specified ID not found');
 end if;
 delete from LAZYTRANSACTION where ID = TransactionID;
 if BitAnd(Flags, sbdecls.dtfDontUpdateRest) = 0 then

  update LAZYREST set
   ostat           =  ostat          +  DelayedTransaction.Ammount,
   pok_ostat   =  pok_ostat   +  DelayedTransaction.LAmmount,
   obr_d          =  obr_d         -  DelayedTransaction.Ammount,
   pok_obr_d  =  pok_obr_d  -  DelayedTransaction.LAmmount
  where ACC_ID = DelayedTransaction.DEBT;  
    
  update LAZYREST set
    ostat = ostat - DelayedTransaction.Ammount_C,
    pok_ostat = pok_ostat - DelayedTransaction.LAmmount,
    obr_k = obr_k - DelayedTransaction.Ammount_C,
    pok_obr_k = pok_obr_k - DelayedTransaction.LAmmount
   where ACC_ID = DelayedTransaction.KREDIT;
 end if;
end;
-------------------------------------------------------------	
Function transaction_delayed_commit(
  TransactionID integer,CommitTemp boolean, TempID integer default null) return integer is
Cursor c_overlapped_transaction(TransactionID integer) is
  select * from LAZYTRANSACTION	where ID = TransactionID 
    for update;
OverlappedTransaction LAZYTRANSACTION%rowtype;
ATempID integer := TempID;
ATempTrID integer;
DebitRate number;
CreditRate number;
CurrentDate date;
begin
 open c_overlapped_transaction(TransactionID);
 fetch c_overlapped_transaction into OverlappedTransaction;
 close c_overlapped_transaction;
  	
 if ATempID is null then
  ATempID := gen_temp_id;
 end if;
		
 CurrentDate := sbop.get_date;
		
 if OverlappedTransaction.rate_d is null then
  open sb_transaction_clib.c_RateByAcc(OverlappedTransaction.debt, CurrentDate);
  fetch sb_transaction_clib.c_RateByAcc into DebitRate;
  close sb_transaction_clib.c_RateByAcc;
 else
  DebitRate := OverlappedTransaction.rate_d;					
 end if;
		
 if OverlappedTransaction.rate_c is null then
   open sb_transaction_clib.c_RateByAcc(OverlappedTransaction.kredit, CurrentDate);
   fetch sb_transaction_clib.c_RateByAcc into CreditRate;
   close sb_transaction_clib.c_RateByAcc;
 else
   CreditRate := OverlappedTransaction.rate_c;		
 end if;
ATempTrID :=
transaction_temp_add(
     OperatorID	=> OverlappedTransaction.OP_ID,
     DebitID	=> OverlappedTransaction.debt,
     CreditID	=> OverlappedTransaction.KREDIT,
     DebitAmount	=> OverlappedTransaction.ammount, 
     CreditAmount 	=> OverlappedTransaction.ammount_c, 
     LAmount	=> OverlappedTransaction.lammount,
     DebitRate	=> DebitRate, 
     CreditRate	=> CreditRate, 
     TrName	=> OverlappedTransaction.name, 
     Flags		=> sbdecls.atfCommitImmediate, 
     InBalanceChar	=> OverlappedTransaction.Kassa_B, 
     OutBalanceChar => OverlappedTransaction.Kassa_Z, 
     TransactionID	=> TransactionID, 
     ATempID	=> ATempID,
     OperationType   => OverlappedTransaction.vid_op, -- amt vid_op
     TransactionNo   => OverlappedTransaction.no_prov
 );

--  update LAZYTRANSACTION set TempTrID = ATempTrID where ID = OverlappedTransaction.ID;


if CommitTemp then
  delete from LAZYTRANSACTION where ID = OverlappedTransaction.ID;
--    do not use transaction_delete here: there are 2 transaction with equal ID:
--    temporary and delayed. If you call transaction_delete - it will deletes 
--    first transaction (temporary), but not delayed
--   transaction_delayed_delete(OverlappedTransaction.ID);
  ATempID := transaction_commit(ATempTrID, True);
end if;
return ATempID;  
end;
-------------------------------------
Function transactions_delayed_commit(OverloadIDsStr varchar2, CommitTemp boolean) 	return integer is	
subtype t_str_array is sbutil.t_str_array;
TrCount integer;
OverlappedIDs t_str_array;
ind integer;
TempID integer;
begin
 OverlappedIDs := sbutil.comma_to_array(OverloadIDsStr, TrCount);
 TempID := gen_temp_id;
 for ind in 1..OverlappedIDs.COUNT
  loop
  TrCount := transaction_delayed_commit(OverlappedIDs(ind), CommitTemp, TempID);
 end loop;
return TempID;
end;
-------------------------------	
Function transaction_get(ATransactionID integer)	return t_transaction is
 cursor c_transactions is select * from today_transactions_all where ID = ATransactionID;
 transaction_snapshot c_transactions%rowtype;
 Result t_transaction;
 NotFound boolean;		
begin
 open c_transactions;
 fetch c_transactions into transaction_snapshot;
 NotFound := c_transactions%notfound;
 close c_transactions;
 if NotFound then
  raise_application_error(sbdecls.Error_InvalidParameters,
		'Can''t find transaction. ID='||TO_CHAR(ATransactionID));
 end if;
 Result.ID := transaction_snapshot.ID;
 Result.OperatorID := transaction_snapshot.OperatorID;
 Result.DebitID := transaction_snapshot.DebitID;
 Result.CreditID := transaction_snapshot.CreditID;
 Result.DebitAmount := transaction_snapshot.DebitAmount;
 Result.CreditAmount := transaction_snapshot.CreditAmount;
 Result.LAmount := transaction_snapshot.LAmount;
 Result.DebitRate := transaction_snapshot.DebitRate;
 Result.CreditRate := transaction_snapshot.CreditRate;
 Result.Name := transaction_snapshot.Name;
 Result.Flags := transaction_snapshot.Flags;
 Result.Status := transaction_snapshot.Status;
 Result.TransactionNo :=transaction_snapshot.TransactionNo;--TNarik
 return Result;
End;
-----------------------------------------------------	
Function transaction_delayed_add (Transaction in out t_transaction) return integer  as
    DebitCurrency       account.val_acc%type;
    CreditCurrency      account.val_acc%type;
    DebitORate          number (11, 2);
    CreditORate         number (11, 2);
    DebitAmount         tenostat.ostat%type;
    CreditAmount        tenostat.ostat%type;
    DebitLAmount        tenostat.pok_ostat%type;
    CreditLAmount       tenostat.pok_ostat%type;
    CurrencyRate        number (11, 2);
    CurrentDate         date;
    DebitLimit          account.limit%type;
    CreditLimit         account.limit%type;
    DebitAccType        bal_spr1.TypeID%type;
    CreditAccType       integer;
    DebetCID            integer;
    CreditCID           integer;
    Debit_DTurnover     tenostat.obr_d%type;
    Debit_DLTurnover    tenostat.pok_obr_d%type;
    Debit_CTurnover     tenostat.obr_k%type;
    Debit_CLTurnover    tenostat.pok_obr_k%type;
    Credit_DTurnover    tenostat.obr_d%type;
    Credit_DLTurnover   tenostat.pok_obr_d%type;
    Credit_CTurnover    tenostat.obr_k%type;
    Credit_CLTurnover   tenostat.pok_obr_k%type;
    Debit_SID           integer;
    Credit_SID          integer;
    TrDebitAmount       number (15, 2);
    TrCreditAmount      number (15, 2);
    TrLAmount           number (15, 2);
    Result	integer;
  begin
    /* get accounts' data */
    select val_acc, limit, bal_cn1 into DebitCurrency, DebitLimit, Debit_SID
      from account where id = Transaction.DebitID;

    select val_acc, limit, bal_cn1 into CreditCurrency, CreditLimit, Credit_SID
      from account where id = Transaction.CreditID;

    /* get account's states */
    select ostat, pok_ostat, obr_d, pok_obr_d, obr_k, pok_obr_k
      into DebitAmount, DebitLAmount, Debit_DTurnover, Debit_DLTurnover,
           Debit_CTurnover, Debit_CLTurnover
      from LazyRest where acc_id = Transaction.DebitID;

    select ostat, pok_ostat, obr_d, pok_obr_d, obr_k, pok_obr_k into 
      CreditAmount, CreditLAmount, Credit_DTurnover, Credit_DLTurnover, Credit_CTurnover, Credit_CLTurnover
        from LazyRest where acc_id = Transaction.CreditID;

    /* get account's flags (active, passive, etc.) */
    select TypeID into DebitAccType from bal_spr1 where bal_cn = Debit_SID;
    select TypeID into CreditAccType from bal_spr1 where bal_cn = Credit_SID;
    CurrentDate := sbop.get_date;

    if  (TrDebitAmount = 0) and (TrLAmount = 0) then
      raise_application_error (sbdecls.Error_NullAmounts,
        Message_NullAmountsError );
    end if;

    /* Check arest flags */
-- if    sbutil.get_account_flag (Transaction.DebitID, 'Arested') or sbutil.get_account_flag (Transaction.DebitID, 'DebitArested')
    if sbutil.FindAccFlag(Transaction.DebitID,'DebitArested')  then
      raise_application_error (sbdecls.Error_DebitAccountArested, Merr_DebitAccountArested);
    end if;

-- if    sbutil.get_account_flag (Transaction.CreditID, 'Arested') or sbutil.get_account_flag (Transaction.CreditID, 'CreditArested')
    if sbutil.FindAccFlag(Transaction.CreditID,'CreditArested') then
      raise_application_error (sbdecls.Error_CreditAccountArested, Merr_CreditAccountArested );
    end if;

    /* get rates of account's currencies */
    select ostat into DebitORate from operkurs where (dat = CurrentDate) and (val_kod = DebitCurrency);
    select ostat into CreditORate from operkurs where (dat = CurrentDate) and (val_kod = CreditCurrency);

    /* round policy */
    TrDebitAmount := sbutil.Round_Currency (Transaction.DebitAmount);
    TrCreditAmount := sbutil.Round_Currency (Transaction.CreditAmount); 
    TrLAmount := sbutil.Round_Currency (Transaction.LAmount);
    if TrLAmount is null then
     if TrDebitAmount is not null then
      TrLAmount := TrDebitAmount * DebitORate;
     elsif TrCreditAmount is null then
      raise_application_error(sbdecls.Error_InsufficientParameters,Merr_InsufficientParameters);
     else
     TrLAmount := TrCreditAmount * CreditORate;
    end if;
   end if;
   if TrDebitAmount is null then
    TrDebitAmount := TrLAmount / DebitORate;
   end if;
   if TrCreditAmount is null then
    TrCreditAmount := TrLAmount / CreditORate;
   end if;

    /* check account's balance & limit conditions and raise an exception if they are violated */

/*
    if not (   sbutil.get_account_flag (DebitID, 'Overdraft')
            or (DebitAccType = sbdecls.atActive)
            or (DebitAccType = sbdecls.atActivePassive)
            or (  DebitAmount
                - DebitLimit >= TrDebitAmount
               )
           )
    then
      raise_application_error (
        sbdecls.Error_DebitBalanceViolation,
           'Amount or limit condition on debet account is not enought for transaction. '
        || 'Balance: '
        || DebitAmount
        || ', localized balance: '
        || DebitLAmount
        || '. Required: '
        || TrDebitAmount
        || ', '
        || TrLAmount
      );
    end if;
*/

/*
   if not (   sbutil.get_account_flag (CreditID, 'Overdraft')
            or (CreditAccType = sbdecls.atPassive)
            or (CreditAccType = sbdecls.atActivePassive)
            or (  CreditAmount
                - CreditLimit <= -TrCreditAmount
               )
           )
    then
      raise_application_error (
        sbdecls.Error_CreditBalanceViolation,
           'Amount or limit condition on credit account is not enought for transaction. '
        || 'Balance: '
        || CreditAmount
        || ', localized balance: '
        || CreditLAmount
        || '. Required: '
        || TrCreditAmount
        || ', '
        || TrLAmount
      );
    end if;
*/

    /* All checks passed, values accepted. Processing... :) */

    /*  if atfNoAdd flags is fired,
        we will not actually add transaction,
        & value returned in "Result" will -1
    */

    if BitAnd (Transaction.Flags, sbdecls.atfNoAdd) = 0  then
      /* Add in LazyRest */
      insert into LazyTransaction
                  (ID,OP_ID, ParentID, dat, debt, kredit, val_acc,
                   currencyid_c, ammount, lammount, tim, rate_d,
                   rate_c, ammount_c, Kassa_B, Kassa_Z, VID_OP,  name, no_prov)
      values (Transaction.ID,Transaction.OperatorId,  Transaction.ParentID, Transaction.TrDate, Transaction.DebitID, Transaction.CreditID, 
	DebitCurrency, CreditCurrency, TrDebitAmount, 
	TrLAmount, SYSDATE, Transaction.DebitRate,
                Transaction.CreditRate, TrCreditAmount, 
	Transaction.InBalanceChar, Transaction.OutBalanceChar,
	Transaction.OperationType, 
	Transaction.Name, Transaction.TransactionNo)
       returning ID into Result;

      /* add transaction into LazyTransaction */
      Debit_DTurnover    :=   Debit_DTurnover      + TrDebitAmount;
      Debit_DLTurnover  :=   Debit_DLTurnover    + TrLAmount;
      Credit_CTurnover   :=   Credit_CTurnover     + TrCreditAmount;
      Credit_CLTurnover :=   Credit_CLTurnover   + TrLAmount;

      update LazyRest set 
         ostat            =   DebitAmount  - TrDebitAmount,
         pok_ostat    =   DebitLAmount - TrLAmount,
         datdate        =   CurrentDate,
         obr_d           =   Debit_DTurnover,
         pok_obr_d   =   Debit_DLTurnover
       where acc_id = Transaction.DebitID;

      update LazyRest set 
        ostat     =   CreditAmount  + TrCreditAmount,
         pok_ostat =   CreditLAmount + TrLAmount,
         datdate   =   CurrentDate,
         obr_k     =   Credit_CTurnover,
         pok_obr_k =   Credit_CLTurnover
       where acc_id = Transaction.CreditID;
    else
      Result := -1;    /* Transaction not actually added - result undefined */
    end if;                                   /* if bitand ... atfNoAdd ... */
   return Result;
  end;
------------------------------------------------------
Function transaction_add(Transaction in out t_transaction)	return integer is
 cursor c_IsCashAccount(AccID1 integer, AccID2 integer) is 
  select count(*) as r from bal_spr1 where bal_cn in 
   (select bal_cn1 from account where 
     (ID in (AccID1, AccID2)) and (VAL_ACC = 0))	and (CashIncoming = 1);
  Result integer := 0;
  CurrentDate date;
  DebitRate number;
  CreditRate number;
  IsCashAccount c_IsCashAccount%rowtype;
begin
 SB_ACA.CheckObjectAccess('Transaction','insert');  --adm     

/* Begin Amt */
CurrentDate := SBOP.get_date;
 if Transaction.TrDate<CurrentDate then
  raise_application_error(-20083,'!!! Kechmish Gune Olmaz !!!');
-- p_repair.main(Transaction,1);
 return 0;
 end if;
/* End Amt */		
	
if Transaction.Name is null then raise_application_error(
  sbdecls.Error_InvalidParameters, 'Transaction description is not specified');
end if;

open c_IsCashAccount(Transaction.DebitID, Transaction.CreditID);
fetch c_IsCashAccount into IsCashAccount;
close c_IsCashAccount;
	
if (Transaction.InBalanceChar = 0) and (IsCashAccount.r <> 0) then
 raise_application_error(sbdecls.Error_InvalidParameters,
   'Cash transaction without cash symbols is not permitted');
end if;
		
-- Check if debit and credit accounts are equal
if Transaction.DebitID = Transaction.CreditID then
 raise_application_error(
  sbdecls.Error_InvalidParameters,
--'Debit and credit accounts MAY NOT be equal for transaction'
    To_char(Transaction.DebitID) || '  ' ||To_char(Transaction.CreditID));
end if;
        
  if (Transaction.DebitAmount < 0) or (Transaction.CreditAmount < 0) or (Transaction.LAmount < 0) then
     raise_application_error(sbdecls.Error_InvalidParameters, 'Amounts may not be less than zero');
  end if;
	
 -- Generate transaction ID if required	
if Transaction.ID is null then
 select TR_SEG_PROVARCH.nextval into Transaction.ID from dual;
end if;
		
-- Condition 1. Use current date by default	
CurrentDate := SBOP.get_date;
if Transaction.TrDate is null then
 Transaction.TrDate := CurrentDate;
end if;
		
-- Condition 2. Always use current rates	
-- Added by amt 4-jan-4
   DebitRate:= GetRate (Transaction.DebitID, CurrentDate);
   CreditRate:=GetRate(Transaction.CreditID, CurrentDate);
   
-- Comment By amt 4-jan-4 		
/*
 	open sb_transaction_clib.c_RateByAcc(Transaction.DebitID, CurrentDate);
	fetch sb_transaction_clib.c_RateByAcc into DebitRate;
 	close sb_transaction_clib.c_RateByAcc;
 	open sb_transaction_clib.c_RateByAcc(Transaction.CreditID, CurrentDate);
	fetch sb_transaction_clib.c_RateByAcc into CreditRate;
 	close sb_transaction_clib.c_RateByAcc;
*/

if DebitRate is null then 
  raise_application_error(sbdecls.Error_NoRateForDateSpecified,
   'No rates found for debit account (ID="'||
    TO_CHAR(Transaction.DebitID)||
  '") for current operation date');
end if;

if CreditRate is null then
 raise_application_error(
  sbdecls.Error_NoRateForDateSpecified,
  'No rates found for credit account (ID="'||
  TO_CHAR(Transaction.CreditID)||
  '") for current operation date');
end if;
		
if not (Transaction.DebitRate is null) then
 if Transaction.DebitRate = DebitRate then
  Transaction.DebitRate := null;				
 end if;
end if;

if not (Transaction.CreditRate is null) then
 if Transaction.CreditRate = CreditRate then
  Transaction.CreditRate := null;				
 end if;
end if;

-- Amt ParentId 0 Call all Tansactions 
if BitAnd(Transaction.Flags, sbdecls.atfTemporary) <> 0 then
 Result := transaction_temp_add(Transaction);
else
 Result := transaction_delayed_add(Transaction);		
 if BitAnd(Transaction.Flags, sbdecls.atfCommitImmediate) <> 0 then
  Result := transaction_commit(Transaction.ID);
 end if;
end if;
return Result;
end;
------------------------------------------------	
function transaction_add (
  TransactionDate   date default null,
  DebitID                integer,
  CreditID               integer,
  DebitAmount       number,
  CreditAmount      number,
  LAmount              number,
  DebitRate            number default null,
  CreditRate           number default null, -- rates should be retreived from system dataset
  TrName               varchar,
  Flags                   integer default 0, -- transaction are delayed by default
  InBalanceChar		integer default null,
  OutBalanceChar		integer default null,
  TransactionID		integer default null,
  OperationType		integer default null,
  ParentID		integer default null,
  TempID			integer default null,
  OperatorId integer default null,
  TransactionNo varchar default null --TNarik
  ) return integer Is
Transaction t_transaction;
begin
  Transaction.ID := TransactionID;
  Transaction.OperatorId :=OperatorId; 
  Transaction.TrDate := TransactionDate;
  Transaction.DebitID := DebitID;
  Transaction.CreditID := CreditID;
  Transaction.DebitAmount := DebitAmount;
  Transaction.CreditAmount := CreditAmount;
  Transaction.LAmount := LAmount;
  Transaction.DebitRate := DebitRate;
  Transaction.CreditRate := CreditRate;
  Transaction.Flags := Flags;
  Transaction.InBalanceChar := InBalanceChar;
  Transaction.OutBalanceChar := OutBalanceChar;
  Transaction.Param1 := TempID;
  Transaction.OperationType := OperationType;
  Transaction.ParentID := ParentID;
  Transaction.Name := TrName; 
  Transaction.TransactionNo := TransactionNo; 
return transaction_add(Transaction);
end;
--------------------------------------------	
Function transaction_commited_add (
  OperatorID integer,
  DebitID            integer,
  CreditID           integer,
  DebitAmount        number,
  CreditAmount       number,
  LAmount            number,
  DebitRate          number,
  CreditRate         number,
  TrName             varchar,
  Flags              integer,
  InBalanceChar	in	 integer,
  OutBalanceChar in  integer,
  Result       out   integer,
  OperationType      integer,
  TransactionID			 integer default null,
  TransactionNo varchar default null
  ) return integer
  as
    Debit             integer;
    Credit            integer;
    CurrentDate       sysdat.tek_dat%type;
    DebitCurrency     account.val_acc%type;
    CreditCurrency    account.val_acc%type;
    DebitTrRate        operkurs.ostat%type;
    CreditTrRate       operkurs.ostat%type;
    DebitORate        operkurs.ostat%type;
    CreditORate       operkurs.ostat%type;
    RegSDebit         avalute.sdebet%type;
    RegSCredit        avalute.scredit%type;
    ChildTrName       provdoc.name%type;
    ParentID          number;
    DeltaRate         number;
    DebitDeltaRate    number;
    CreditDeltaRate   number;
    SelfParentID      number;
-- params t_params := t_params();
begin
    SB_ACA.checkadvancedobjectaccess ('TRANSACTIONCOMMITEDEDIT');--adm 
 select tek_dat into currentdate from sysdat;
 select val_acc into DebitCurrency from account where id = DebitID;
 select val_acc into CreditCurrency from account where id = CreditID;
 select ostat into DebitORate from operkurs  where (dat = CurrentDate) and (val_kod = DebitCurrency);
 select ostat into CreditORate from operkurs where (dat = CurrentDate) and (val_kod = CreditCurrency);
 Result := 0;
if DebitRate = 0 then
  DebitTrRate := DebitORate;
  DebitDeltaRate := 0;
else   
 DebitTrRate := DebitRate;
  DebitDeltaRate :=  DebitRate - DebitORate;
end if;
		
if CreditRate = 0 then
  CreditTrRate := CreditORate;
  CreditDeltaRate := 0;
else  
  CreditTrRate := CreditRate;
  CreditDeltaRate := CreditRate - CreditORate;
end if;

 add_std_transaction (
  OperatorID => OperatorID,
  DebitID => DebitID,
  CreditID => CreditID, 
  DAmount  => DebitAmount,
  CAmount  => CreditAmount, 
  LAmount  => LAmount,
  DebitRate => DebitTrRate, 
  CreditRate => CreditTrRate, 
  TrName => TrName, 
  Flags => Flags,
  InBalanceChar => InBalanceChar,
  OutBalanceChar => OutBalanceChar,
  OperationType => OperationType, 
  AParentID =>  null,
  Result => Result, 
  TransactionID => TransactionID,
  TransactionNo => TransactionNo
);

  if DebitCurrency = CreditCurrency then
    return Result;
  end if;
		
	/*
	 calculation of child transaction is only enabled if
	 immediate commit flag is set, because rate may not be set
	 for delayed transaction 
	*/

    ParentID := Result;

  if  (DebitCurrency <> 0) and (CreditCurrency <> 0) then
     raise_application_error(sbdecls.Error_DifferentCurrencies, 
       'Transactions between accounts having different currencies - not implemented');
  end if;

    if  (DebitCurrency = 0) and (CreditDeltaRate <> 0.0)  then
     select SDebet, SCredit into RegSDebit, RegSCredit from avalute where valute = CreditCurrency;
     if (RegSDebit is null) or (RegSCredit is null) then
      raise_application_error(
        sbdecls.Error_NoMultiCurrencyEnabled, 
        Message_NoMultyCurrencyError);
     end if;
      DeltaRate := CreditDeltaRate * CreditAmount;
      if CreditDeltaRate > 0.0
      then
        Debit := DebitID;
        Credit := RegSCredit;
      else
        Debit := RegSDebit;
        Credit := DebitID;
        DeltaRate := -DeltaRate;
      end if;
    else
      if  (CreditCurrency = 0) and (DebitDeltaRate <> 0.0) then
        select SDebet, SCredit  into RegSDebit, RegSCredit  from avalute where valute = DebitCurrency;
    if (RegSDebit is null) or (RegSCredit is null) then
     raise_application_error(Sbdecls.Error_NoMultiCurrencyEnabled, Message_NoMultyCurrencyError);
    end if;
        DeltaRate := DebitDeltaRate * DebitAmount;
        if DebitDeltaRate > 0.0
        then
          Debit := RegSDebit;
          credit := CreditID;
        else
          Debit := CreditID;
          Credit := RegSCredit;
          DeltaRate := -DeltaRate;
        end if;
      else
        return Result; /* no additional transaction required */
      end if;
    end if;

    ChildTrName :='(MultiCurrency Auto Transaction)';
--	  OperationType:=0;
   SelfParentID :=Result; ---Nariman
   add_std_transaction (
     OperatorID  => OperatorID,
     DebitID       => Debit,
     CreditID      => Credit,
     DAmount    => DeltaRate,
     CAmount    => DeltaRate,
     LAmount    => DeltaRate,
     DebitRate  => 0,
     CreditRate => 0,
     TrName     => ChildTrName,
     Flags         => Flags,
     InBalanceChar    => InBalanceChar, -- For NBS -only
     OutBalanceChar => 0,
     Result                => Result,
     AParentID          => Result,
     OperationType  => 0 -- Amt  
 );

-- Added by AMT 5-jan-4
--dbms_output.put_line('RESULT==== '||to_char(SelfParentID));
update provarch partition (ToDay) set vid_op=0 where id=SelfParentID;
return Result;
end;
--------------------------------------	
Function transaction_temp_commit(Temp temptranz%rowtype) return integer as
  ATemp temptranz%rowtype := Temp;
  Result integer;
begin
/*
 We can not use here ADD_TRANSACTION, 
 because it may (and will) cause an deadlock
*/
if BitAnd(ATemp.Flags, sbdecls.atfCommitImmediate) <> 0 then
  Result := transaction_commited_add(
    ATemp.OperatorID,
    ATemp.DebitID,
    ATemp.CreditID,
    ATemp.DebitAmount,
    ATemp.CreditAmount,
    ATemp.LAmount,
    ATemp.DebitRate,
    ATemp.CreditRate,
    ATemp.TrName,
    ATemp.Flags, 
    ATemp.Kassa_B,
    ATemp.Kassa_Z,
    ATemp.ID,
    ATemp.vid_op,
    ATemp.ID,
    ATemp.no_prov
    );
else
   Result := transaction_add(
        DebitID               => ATemp.DebitID,
        CreditID              => ATemp.CreditID,
        DebitAmount       => ATemp.DebitAmount,
        CreditAmount      => ATemp.CreditAmount,
        LAmount              => ATemp.LAmount,
        DebitRate            => ATemp.DebitRate,
        CreditRate           => ATemp.CreditRate,
        TrName               => ATemp.TrName,
        Flags                   => ATemp.Flags, 
        InBalanceChar    => ATemp.Kassa_B,
        OutBalanceChar  => ATemp.Kassa_Z,
       TransactionID      => ATemp.ID,
       OperationType     =>ATemp.vid_op,
       TransactionNo     => ATemp.no_prov);--TNarik
end if;
/*
    update temptranz    set  Applied = 1  where ID = Temp.ID;
    return Result;
*/

 delete from TEMPTRANZ where ID = Temp.ID;
 return Result;
end;
-----------------------------------------
Function transaction_temp_commit(TempTrID integer) return integer as
Temp temptranz%rowtype;
begin
 select *	into temp from temptranz where ID = TempTrID;
-- dbms_output.put_line(substr('Value of temp transaction=('||temp.debitamount||' '||temp.creditamount||' '||temp.lamount, 1,255));
  return transaction_temp_commit(Temp);
end;
/* CommitTemp is only used for delayed transactions */
------------------------------------------------------
Function transaction_commit(	TransactionID integer, CommitTemp boolean default True ) return integer is
Transaction t_transaction;
TempID integer;
begin
     SB_ACA.CheckObjectAccess('Transaction','update');  --adm 
     SB_ACA.checkadvancedobjectaccess ('TRANSACTIONCOMMITRIGHT');--adm
--Checkin rights for commiting transactions
--sbsec.right_check('Right_TransactionCommit');
Transaction := transaction_get(TransactionID);
 --dbms_output.put_line(substr('Value of Transaction.Status='||Transaction.Status,1,255));
-- check status of transaction to commit
if Transaction.Status = sbdecls.tsTemporary then
 -- commit temp transaction
 Transaction.ID := transaction_temp_commit(Transaction.ID);
elsif (Transaction.Status = sbdecls.tsDelayed) or (Transaction.Status = sbdecls.tsRejected) then
-- make temporary transaction from delayed
 TempID := transaction_delayed_commit(Transaction.ID, CommitTemp);
else
 raise_application_error(sbdecls.Error_InvalidParameters,
        'Commit operations not implemented for transactions with status: '||
	TO_CHAR(Transaction.Status)||
	', transaction ID: '||
	TO_CHAR(Transaction.ID));
end if;
return Transaction.ID;
end;
---------------------------------------------	
function transactions_commit(TrIDs varchar2, CommitTemp boolean default True) return integer is
subtype t_str_array is sbutil.t_str_array;
TrCount integer;
IDs t_str_array;
ind integer;
TempID integer;
begin
 IDs := sbutil.comma_to_array(TrIDs, TrCount);
 TempID := gen_temp_id;
  for ind in 1..IDs.COUNT
  loop
   TrCount := transaction_commit(IDs(ind), CommitTemp);
  end loop;
return TempID;
end;
-----------------------------------------------------	
function transaction_delayed_reject(TransactionID integer, Reason varchar2)	return integer is
begin
 update LAZYTRANSACTION set Rejected = 1,  RejectReason = Reason where ID = TransactionID;
 return 0;
end;
	
procedure transaction_temp_delete(TransactionID integer)	is
begin
 delete from temptranz where ID = TransactionID;
end;
	
function transaction_reject(TransactionID integer, RejectReason varchar2) return integer	is
status integer := transaction_get_status(TransactionID);
Result integer;
begin
 SB_ACA.CheckObjectAccess('Transaction','update');  --adm 
 if status = sbdecls.tsTemporary  then
  transaction_temp_delete(TransactionID);
  Result := 0;
 elsif (status = sbdecls.tsDelayed) or (status = sbdecls.tsRejected) then
  Result := transaction_delayed_reject(TransactionID, RejectReason);
 end if;
 return Result;
end;
	
function transactions_temp_delete(ATempID integer) return integer is
begin
 delete from temptranz where TempID = ATempID;
 return SQL%rowcount;
end;

procedure transaction_commited_delete(TransactionID integer) is
 cursor c_ChildTransactions is (select id from provdoc where parentid = TransactionID);
 ParentID integer;
 TrDate date;
 OperDay date;
 Transaction t_transaction;
begin
    SB_ACA.checkadvancedobjectaccess ('TRANSACTIONCOMMITEDEDIT');--adm 
/* Begin Amt */
 Select dat into TrDate from provarch where id=TransactionID;
 Select tek_dat into OperDay from sysdat;
 Transaction.id:=TransactionID;
 if TrDate<OperDay then
    --p_repair.main(Transaction,0);
   return;
 end if;
/* End Amt */		
-- retreive ParentID is present
select ParentID into ParentID 	from provdoc where ID = TransactionID;
if ParentID is not null then
 raise_application_error(sbdecls.Error_ChildTransaction, 'Unable to delete child transaction - delete parent first. ChildID: '
		||TO_CHAR(TransactionID)
		||', ParentID: '
		||TO_CHAR(ParentID));
end if;

-- Amt for Extraction 
execute immediate 'ALTER TRIGGER UPD_SET_OF_LASTOPDAY disable';
-- 
-- delete specified transaction
    del_std_transaction (TransactionID);
-- delete childs if present
   for c in c_ChildTransactions 
    loop
      del_std_transaction(c.ID);
   end loop;
-- Amt for Extraction				
 execute immediate 'ALTER TRIGGER UPD_SET_OF_LASTOPDAY ENABLE';				
--
end;
---------------------------------------------------------------
procedure transaction_delete (TransactionID integer, Flags integer default DefaultTrDeleteFlags) as
TransactionStatus integer := transaction_get_status(TransactionID);
begin
-- Checking user rights for deleting transactions
    SB_ACA.CheckObjectAccess('Transaction','delete');  --adm 
if (TransactionStatus = sbdecls.tsDelayed) or (TransactionStatus = sbdecls.tsRejected) then
  transaction_delayed_delete(TransactionID);
elsif TransactionStatus = sbdecls.tsTemporary then
  transaction_temp_delete(TransactionID);
else
  transaction_commited_delete(TransactionID);
end if;
end;
-----------------------------------------------
Function transactions_temp_commit ( ATempID integer)  return integer as
    Temp TempTranz%rowtype;
    TrResult integer;
    Result integer;
    cursor Transactions is select * from TempTranz where TempID = ATempID;
  begin
    Result := 0;
    for Temp in Transactions
    loop
--  dbms_output.put_line('applying temp transaction #'||Temp.ID);
      TrResult := transaction_temp_commit(Temp.ID);
      Result := Result + 1;
    end loop;
    return Result;
  end;
---------------------------------------------
Function cancel_temp_transaction( ATempID integer)
 return integer  as -- number of commited transactions         
begin
 delete from temptranz where TempID = ATempID;
 return SQL%rowcount;
end;
----------------------------------------------
Function GetRate (AccID integer, ArchiveDate date) return number is Result number;
 CurrencyID number;
Begin
 Select VAL_ACC into CurrencyID From account where ID = AccID;
 Select OSTAT into Result from OPERKURS where  VAL_KOD =CurrencyID and DAT = ArchiveDate;
 return Result;
 exception 
  when NO_DATA_FOUND then
    raise_application_error(sbdecls.Error_NoRateForDateSpecified, 
      'Rate for specified date not found. CurrencyID='||TO_CHAR(CurrencyID)||', Date='||TO_CHAR(ArchiveDate));
end;
--------------------------------------------------

function GenerateID return provdoc.id%type is result provdoc.id%type;
begin
 select tr_seg_provarch.nextval into result from dual;
 return result;
end;

END;
/


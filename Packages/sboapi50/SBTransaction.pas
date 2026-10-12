unit SBTransaction;

interface

uses SysUtils, SBSrvIntf, Variants;

type
  ETransactionException = class(Exception);
  ENotImplemented = class(ETransactionException);
  ENeedCurrencySetup = class(ETransactionException);
  ETransactionsLimitExceeded = class(ETransactionException);
  ENotEnoughtAmmount = class(ETransactionException);
  ETransactionNotFound = class(ETransactionException);

{
  TTransaction - данные дл€ проведени€ проводки
  некоторые из этих полей будут заменены или устареют со временем
}

  TTransaction = record
    Size            : Integer;
    TransactionDate : TDateTime;
    hDebit          : Integer;
    hCredit         : Integer;
    DebitAmount     : Currency;
    CreditAmount    : Currency;
    LAmount         : Currency;
    DebitRate       : Currency;
    CreditRate      : Currency;
    ParentID        : Integer;
    DebitBankID     : Integer;
    CreditBankID    : Integer;
    FilialID        : Integer;  // filialin kodu - NO_FILIAL
    PackageNumber   : Integer;  // pachka nomrasi - NO_PACK
    InbalanceChar   : Word;     // balansdaxili kassa simvolu - KASSA_B
    OutBalanceChar  : Word;     // balansdankanar kassa simvolu - KASSA_Z
    CypherCode      : Word;     // - SHIFR
    OperationCode   : Word;     // - VID_OP
    TransactionID   : Integer;
    TrName          : ShortString;
    IsRoot          : Boolean;
    ArchiveID       : Integer;
  end;
  PTransaction = ^TTransaction;

const
  MaxTransactionCount = 10;

type
  TTransactionArray = array[0..MaxTransactionCount-1] of TTransaction;
  PTransactionArray = ^TTransactionArray;

  TTransactions = record
    Size                : Integer;
    Count               : Integer;
    TransactionArray    : PTransactionArray;
  end;

type
  TAddTransactionFlag = (
    tfNoAdd,            // do not actually add transaction, just check arguments
                        // and accounts balances
    tfNoAddChild,       // do not add child transactions
    tfNoControl,        // do not control acc's balances
    tfCommitImmediate,  // commit transaction imediately
                        // if not prohibited by security permissions
    {obsolette flags}
    tfNoAddName         // do not write name for transaction in NAZPROV
  );

  TAddTransactionFlags = set of TAddTransactionFlag;

const

  AddTransactionFlagMapping: array[TAddTransactionFlag] of Cardinal = (
    satfNoAdd,
    satfNoAddChild,
    satfNoControl,
    satfCommitImmediate,
    {other flags are obsolette}
    0
  );

  AddTransactionStdFlags = [];

procedure SB_InitializeTransaction(var Transaction: TTransaction);

{
  procedure SB_AddTransaction(Transaction: TTransaction);

  добавл€ет корневую и порождЄнные проводки
}

function SB_AddTransaction(var Transaction: TTransaction; const Flags: TAddTransactionFlags): Integer;

{
  procedure SB_AddStdTransaction(Transaction: TTransaction);

  добавл€ет проводку. порождени€ не анализируютс€
}

//function SB_AddStdTransaction(var Transaction: TTransaction; Flags: TAddTransactionFlags): Integer;

{
  procedure SB_CheckStdTransaction(Transaction: TTransaction; Flags: TAddTransactionFlags);

  провер€ет услови€ дл€ проводки. √енерирует соответствующую исключительную ситуацию если
  операци€ не может быть проведена, как если бы была вызвана процедура SB_AddStdTransaction
}

procedure SB_CheckStdTransaction(Transaction: TTransaction; Flags: TAddTransactionFlags);

{
  procedure DeleteTransaction(ID: Integer);

  удал€ет операцию
}

type
  TDeleteTransactionFlag = (dfNoControl, dfNoChild);
  TDeleteTransactionFlags = set of TDeleteTransactionFlag;

  TConstArray = SBSrvIntf.TConstArray;

procedure SB_DeleteTransaction(ID: Integer; Flags: TDeleteTransactionFlags);

//function Sb_MakeTempLazyTransactions(LazyIDs: TConstArray): Integer;
// returns TempID

//function Sb_CommitLazyTransactions(TempID: Integer; ApplyTransactions: Boolean = True): Integer;
// return count of the commited transactions

procedure Sb_RejectTransaction(TransactionID: Integer; const Reason: String);

type
  TTransactionStatus = (tsDelayed, tsCommited, tsRejected);
  TTransactionStatusInt = 1..3;

const
  IntToTransactionStatusMapping: array[TTransactionStatusInt] of TTransactionStatus = (
    tsDelayed, tsCommited, tsRejected
  );

function Sb_GetTransactionStatus(TransactionID: Integer): TTransactionStatus;

function Sb_CommitTransaction(ID: Integer; CommitTemp: Boolean): Integer;
function Sb_CommitTransactions(IDs: String; CommitTemp: Boolean): Integer;

function Sb_CommitDelayedTransactions(IDs: TConstArray; CommitTemp: Boolean): Integer;
function Sb_TransactionsTempDelete(TempID: Integer): Integer;
function Sb_TransactionsTempCommit(TempID: Integer): Integer;
function Sb_GenTempID: Integer;
procedure Sb_AddTempTransaction(TempID: Integer; Transaction: TTransaction);
procedure Sb_ApplyTempTransaction(TempTrID: Integer);

implementation

uses sboapiDataModuleImpl, SBCore, Oracle;

procedure SB_InitializeTransaction(var Transaction: TTransaction);
begin
  with Transaction do
  begin
    Size := SizeOf(TTransaction);
    TransactionDate := Sb_GetSystemDate;
    DebitAmount := 0.0;
    CreditAmount := 0.0;
    LAmount := 0.0;
    TransactionID := -1;
    ParentID := 0;
    IsRoot := True;
  end;
end;

function BuildAddTransactionFlags(const Flags: TAddTransactionFlags): Cardinal;
var
  Flag: TAddTransactionFlag;
begin
  Result := 0;
  for Flag := Low(Flag) to High(Flag) do
    if Flag in Flags then
      Result := Result or AddTransactionFlagMapping[Flag];
end;

function SB_AddTransaction(var Transaction: TTransaction; const Flags: TAddTransactionFlags): Integer;
var
  ATransactionID: Variant;
begin
  try
    with Transaction, sboapiDataModule.SBTransaction do
    begin
      if TransactionID = -1 then
        ATransactionID  := Null
      else
        ATransactionID := TransactionID;
      Result := CallIntegerFunction(sPN_AddTransaction, [
        'TransactionDate', TransactionDate,
        'DebitID', hDebit,
        'CreditID', hCredit,
        'DebitAmount', DebitAmount,
        'CreditAmount', CreditAmount,
        'LAmount', LAmount,
        'DebitRate', DebitRate,
        'CreditRate', CreditRate,
        'TrName', TrName,
        'Flags', Integer(BuildAddTransactionFlags(Flags)),
        'InBalanceChar', InBalanceChar,
        'OutBalanceChar', OutBalanceChar,
        'TransactionID', ATransactionID
      ]);
    end;
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_CommitTransaction(ID: Integer; CommitTemp: Boolean): Integer;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(
        sPN_TransactionCommit, [
          'TransactionID', ID,
          'CommitTemp', CommitTemp]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_CommitTransactions(IDs: String; CommitTemp: Boolean): Integer;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(
        sPN_TransactionCommit, [
          'TrIDs', IDs,
          'CommitTemp', CommitTemp]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_CommitDelayedTransactions(IDs: TConstArray; CommitTemp: Boolean): Integer;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(
        sPN_TransactionsDelayedCommit, [
          'OverloadIDsStr', Sb_PackArray(IDs),
          'CommitTemp', CommitTemp]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

procedure SB_CheckStdTransaction(Transaction: TTransaction; Flags: TAddTransactionFlags);
begin
end;

procedure SB_DeleteTransaction(ID: Integer; Flags: TDeleteTransactionFlags);
begin
  try
    with sboapiDataModule.SBTransaction do
      CallProcedure(sPN_DelTransaction, [
        'TransactionID', ID]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

{function Sb_MakeTempLazyTransactions(LazyIDs: TConstArray): Integer;
begin
  with sboapiDataModule.SBOperationDay do
    Result := CallIntegerFunction(sPN_LazyMakeTempTransactions, [
      'OverloadIDsStr', Sb_PackArray(LazyIDs)
    ]);
end;}

{function Sb_CommitLazyTransactions(TempID: Integer; ApplyTransactions: Boolean = True): Integer;
begin
  with sboapiDataModule.SBOperationDay do
    Result := CallIntegerFunction(sPN_LazyCommitTempTransactions, [
      'ATempID', TempID,
      'ApplyTransactions', ApplyTransactions]);
end;}

{$HINTS OFF}
{Hint message (264): Value assigned to 'Result' never used}
procedure Sb_RejectTransaction(TransactionID: Integer; const Reason: String);
var
  Result: Integer; {reserved}
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(sPN_RejectTransaction, [
        'TransactionID', TransactionID,
        'RejectReason', Reason]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;
{$HINTS ON}

function Sb_GetTransactionStatus(TransactionID: Integer): TTransactionStatus;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := IntToTransactionStatusMapping[Integer(
        CallIntegerFunction(sPN_GetTransactionStatus, ['TransactionID', TransactionID])
      )];
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_TransactionsTempDelete(TempID: Integer): Integer;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(sPN_TransactionsTempDelete, ['ATempID', TempID]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_TransactionsTempCommit(TempID: Integer): Integer;
begin
  try
    with sboapiDataModule.SBTransaction do
      Result := CallIntegerFunction(sPN_TransactionsTempCommit, ['ATempID', TempID]);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

function Sb_GenTempID: Integer;
begin
  try
    with sboapiDataModule.SBOperationDay do
      Result := CallIntegerFunction(sPN_GenTempID, []);
  except
    on E: EOracleError do
    begin
      Sb_ProcessException(E);
      raise;
    end;
  end;
end;

procedure Sb_AddTempTransaction(TempID: Integer; Transaction: TTransaction);
begin
end;

procedure Sb_ApplyTempTransaction(TempTrID: Integer);
begin
end;

{function Sb_CancelTempTransactions(TempID: Integer): Integer;
begin
  with sboapiDataModule.SBOperationDay do
    Result := CallIntegerFunction(sPN_CancelTempTransactions, ['ATempID', TempID]);
end;}

end.

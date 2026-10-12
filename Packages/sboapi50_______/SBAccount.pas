unit SBAccount;

interface

uses SBSecurity;

type
  TSAccounts = record
  case Integer of
  0:(
    Acc1: Integer;
    Acc2: Integer;
    Acc3: Integer;
    Acc4: Integer
  );
  1:(
    Accs: array[1..4] of integer;
  );
  end;

  TAccount = record
    CustomerID: Integer;  // KLI_ID
    AccNo: ShortString;   // ACC_NO
    CurrencyID: Integer;  // VAL_ACC
    Name: ShortString;    // NAME
    OpenDate: TDateTime;  // OPEN_DAT
    Limit: Currency;      // LIMIT
    CloseDate: TDateTime;
    SAccs: TSAccounts;
    FilialID: Integer;
    ReportSymbol: Integer;
    PairAccID: Integer;
    IsInsider: Boolean;
    AccFlags : String;
  end;

function Sb_AddAccount(const AccountInfo: TAccount): Integer;
procedure Sb_EditAccount(AccID: Integer; const AccountInfo: TAccount);
//procedure Sb_SetAccountFlag(AccID: Integer; const FlagName: String; Value: Boolean);
//function Sb_GetAccountFlag(AccID: Integer; const FlagName: String): Boolean;
procedure Sb_CloseAccount(AccID: Integer; DoClose: Boolean = True);
function Sb_BuildAccountDefaultSecurity(ID: Integer): TSid;
procedure Sb_SetAccSecurityDescriptor(AccID: Integer; Sid: TSid);

type
  TAccError = (aeBalance, aeAccBalance, aeDebitTurnover, aeDebitLTurnover,
    aeCreditTurnover, aeCreditLTurnover);
  TErrorSet = set of TAccError;

function Sb_CheckAccBalance(AccID: Integer; var Errors: TErrorSet): Boolean;
procedure Sb_CorrectAccBalance(AccID: Integer);
function  FlagExsist(AccID : Integer;Ch : Char):Boolean;overload;
function  FlagExsist(AccType : string;Ch : Char):Boolean;overload;

implementation

uses sboapiDataModuleImpl, SBCore, SBSrvIntf;


function  FlagExsist(AccID : Integer;Ch : Char):Boolean;
begin
   with sboapiDataModule.SBUtil do
   Result :=
     CallBooleanFunction(sPN_FlagExsist,[
       'AccID' , AccID ,
       'FlagChar' , ch
     ]);
end;

function  FlagExsist(AccType : string;Ch : Char):Boolean;
begin
   with sboapiDataModule.SBUtil do
   Result :=
     CallBooleanFunction(sPN_FlagExsist,[
       'AccountType' , AccType ,
       'FlagChar' , ch
     ]);
end;

function Sb_AddAccount(const AccountInfo: TAccount): Integer;
begin
  with sboapiDataModule.SBOperationDay, AccountInfo do
    Result :=
      CallIntegerFunction(sPN_AddAccount, [
        'customerid', CustomerID,
        'op_id', 0,
        'accno', AccNo,
        'currencyid', CurrencyID,
        'NAME', Name,
        'open_dat', OpenDate,
        'balcn', SAccs.Acc1,
        'LIMIT', Limit,
        'close_dat', NullDate,
        'filial', FilialID,
        'sim_otcet', ReportSymbol,
        'pair_acc', PairAccID,
//      'insider', Integer(IsInsider),
        'bal_cn2', SAccs.Acc2,
        'bal_cn3', SAccs.Acc3,
        'bal_cn4', SAccs.Acc4 ,
        'typeacc', AccFlags
      ]);
end;

{procedure Sb_SetAccountFlag(AccID: Integer; const FlagName: String; Value: Boolean);
begin
  with sboapiDataModule.SBUtil do
    CallProcedure(sPN_SetAccountFlag, [
      'v_ACC_ID', AccID,
      'FLAG_NAME', FlagName,
      'VALUE', Integer(Value)
    ]);
end;

function Sb_GetAccountFlag(AccID: Integer; const FlagName: String): Boolean;
begin
  with sboapiDataModule.SBUtil do
    Result := CallBooleanFunction(sPN_GetAccountFlag, [
      'v_Acc_ID', AccID,
      'Flag_Name', FlagName]);
end;
}

procedure Sb_EditAccount(AccID: Integer; const AccountInfo: TAccount);
begin
  with sboapiDataModule.SBOperationDay, AccountInfo do
    CallProcedure(sPN_UpdateAccount, [
      'v_id', AccID,
      'v_customerid', CustomerID,
      'v_op_id', 0,
      'v_accno', AccNo,
      'v_currencyid', CurrencyID,
      'v_NAME', Name,
      'v_open_dat', OpenDate,
      'v_balcn', SAccs.Acc1,
      'v_LIMIT', Limit,
      'v_close_dat', NullDate,
      'v_filial', FilialID,
      'v_sim_otcet', ReportSymbol,
      'v_pair_acc', PairAccID,
//      'insider', Integer(IsInsider),
      'v_bal_cn2', SAccs.Acc2,
      'v_bal_cn3', SAccs.Acc3,
      'v_bal_cn4', SAccs.Acc4,
      'v_typeacc', AccFlags
    ]);
end;

procedure Sb_CloseAccount(AccID: Integer; DoClose: Boolean = True);
begin
  with sboapiDataModule.SBOperationDay do
    CallProcedure(sPN_CloseAccount, [
      'AccID', AccID,
      'DoClose', Integer(DoClose)]);
end;

function Sb_BuildAccountDefaultSecurity(ID: Integer): TSid;
begin
  Result := Sb_CreateSecurityDescriptor(Sb_GetUserID, Sb_GetGroupID, Sb_GetTypeID('account'));
  Sb_BuildDefaultSecurity(Result);
  Sb_SetAccSecurityDescriptor(ID, Result);
end;

procedure Sb_SetAccSecurityDescriptor(AccID: Integer; Sid: TSid);
begin
  with sboapiDataModule.SBOperationDay do
    CallProcedure(sPN_SetAccSID, [
      'acc_id', AccID,
      'sid', Sid]);
end;

function Sb_CheckAccBalance(AccID: Integer; var Errors: TErrorSet): Boolean;
var
  IErrors: Integer;
begin
  IErrors := 0;
  with sboapiDataModule.SBCorrection do
    Result :=
      CallBooleanFunction(
        sPN_CheckAccBalance, [
          'AccID', AccID,
          'ErrorSet', IErrors]);
  Errors := [];
end;

procedure Sb_CorrectAccBalance(AccID: Integer);
begin
  with sboapiDataModule.SBCorrection do
    CallProcedure(
      sPN_CorrectAccBalance, [
        'AccID', AccID]);
end;

end.

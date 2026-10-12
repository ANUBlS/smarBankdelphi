unit SBSystem;

interface

uses SBTransaction;

procedure Sb_CloseDay(NewDate: TDateTime);
function Sb_IsDayOpened: Boolean;
procedure Sb_CommitNewRates;
procedure Sb_ChangeRates;
procedure Sb_OpenDay;
function Sb_CalculateRateDifference: Integer;
//function Sb_CancelTempTransactions(TempID: Integer): Integer;
function Sb_CloseDayProfits: Integer;

procedure Sb_CorrectLAmount;
function Get_CurrentDate : TDateTime;
function Get_PrevDate : TDateTime;
function Get_BranchID : Integer;
implementation

uses sboapiDataModuleImpl, SBSrvIntf;

procedure Sb_CloseDay(NewDate: TDateTime);
begin
  NewDate := Trunc(NewDate);
  with sboapiDataModule.SBSystem do
    CallProcedure(sPN_CloseDay, ['NewDate', NewDate]);
end;

function Sb_IsDayOpened: Boolean;
begin
  with sboapiDataModule.SBSystem do
    Result := CallBooleanFunction(sPN_IsDayOpened, []);
end;

procedure Sb_CommitNewRates;
begin
  with sboapiDataModule.SBRateManagement do
    CallProcedure(sPN_CommitNewRates, []);
end;

procedure Sb_OpenDay;
begin
  with sboapiDataModule.SBSystem do
    CallProcedure(sPN_OpenDay, []);
end;

procedure Sb_ChangeRates;
begin
end;

function Sb_CalculateRateDifference: Integer;
begin
  with sboapiDataModule.SBRateManagement do
    Result := CallIntegerFunction(sPN_CalculateRateDifference, []);
end;

function Sb_CloseDayProfits: Integer;
begin
  with sboapiDataModule.SBSystem do
    Result := CallIntegerFunction(sPN_CloseDayProfits, []);
end;

procedure Sb_CorrectLAmount;
begin
  with sboapiDataModule.SBRateManagement do
    CallProcedure(sPN_CorrectLAmount, []);
end;
function Get_CurrentDate : TDateTime;
begin
  sboapiDataModule.DSBankDate.Open;
  Result := sboapiDataModule.DSBankDate.fieldbyname('TEK_DAT').asdatetime;
   sboapiDataModule.DSBankDate.close;
end;

function Get_PrevDate : TDateTime;
begin
   sboapiDataModule.DSBankDate.Open;
  Result := sboapiDataModule.DSBankDate.fieldbyname('PRED_DAT').asdatetime;
  sboapiDataModule.DSBankDate.close;
end;

function Get_BranchID : Integer;
begin
  Result := sboapiDataModule.Branch.fieldbyname('KOD_FIL').asinteger;
end;

end.

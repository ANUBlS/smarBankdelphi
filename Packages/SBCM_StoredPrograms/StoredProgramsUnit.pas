unit StoredProgramsUnit;

interface

uses DataModuleStoredPrograms,DB;

  function  SBCMGetOption(OptionName :String):Variant;
  function  GetBankDate :TDateTime;
  function  IsCalculationEnabled(ContractID :LongInt) :Boolean;
  procedure SetCalculationEnabled(ContractID :LongInt;const Enable :Boolean);
  procedure CloseContract(ContractID :LongInt);
  procedure CloseDeposit(ContractID :LongInt);
  function  ContractTypeByName(const ContractName :string):Integer;
  function  GetAdditionalDepositType(ContractID :LongInt) : string;

implementation

function  ContractTypeByName(const ContractName :string):Integer;
begin
  with  DataModuleRefer.ReferPackage do
   Result :=CallIntegerFunction('GetTypeIDFromName',[ContractName]);
end;
procedure CloseDeposit(ContractID :LongInt);
begin
  with  DataModuleRefer.ReferPackage do
    CallProcedure('CloseDeposit',[ContractID])
end;
procedure CloseContract(ContractID :LongInt);
begin
  with  DataModuleRefer.ReferPackage do
  CallProcedure('CloseContract',[ContractID])
end;
function  IsCalculationEnabled(ContractID :LongInt):Boolean;
begin
  with  DataModuleRefer.ReferPackage do
   Result :=CallBooleanFunction('IsCalculationEnabled',[ContractID]);
end;
procedure SetCalculationEnabled(ContractID :LongInt;const Enable :Boolean);
begin
  with  DataModuleRefer.ReferPackage do
    if  Enable  then
      CallProcedure('EnableCalculation',[ContractID])
    else
      CallProcedure('DisableCalculation',[ContractID])
end;
function  GetBankDate :TDateTime;
begin
  with  DataModuleRefer.ReferPackage  do
    Result :=CallDateFunction('GetBankDate',[]);
end;

function  SBCMGetOption(OptionName :String):Variant;
begin
  with  DataModuleRefer.ReferPackage  do
   Result :=CallStringFunction('GetReference',[OptionName]);
end;
function  GetAdditionalDepositType(ContractID :LongInt) : string;
begin
  with  DataModuleRefer.ReferPackage do
    Result :=CallStringFunction('GetAdditionalDepositType',[
                        ContractID
                        ])
end;
end.

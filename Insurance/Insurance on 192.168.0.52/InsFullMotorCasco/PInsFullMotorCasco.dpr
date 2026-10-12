library PInsFullMotorCasco;  {(c) Smart Systems Technology  Xalid Hasanov  2006}

uses
  ComServ,
  PInsFullMotorCasco_TLB in 'PInsFullMotorCasco_TLB.pas',
  UInsFullMotorCasco in 'UInsFullMotorCasco.pas' {InsFullMotorCasco: TActiveForm} {InsFullMotorCasco: CoClass},
  UInsAppMotor in 'UInsAppMotor.pas' {FullCascoForm},
  DataUnitFullMotor in 'DataUnitFullMotor.pas' {DataModuleFullMotor: TDataModule},
  UInsSuggest in 'UInsSuggest.pas' {FormSuggestion},
  UMotorInsPolicy in 'UMotorInsPolicy.pas' {FormPolicy},
  URiskTypes in 'URiskTypes.pas' {fmRiskTypes};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

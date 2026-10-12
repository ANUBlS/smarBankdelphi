library TurnOversForPeriod;

uses
  ComServ,
  TurnOversForPeriod_TLB in 'TurnOversForPeriod_TLB.pas',
  TurnOversForPeriodImpl in 'TurnOversForPeriodImpl.pas' {TurnOvers_Form: TActiveForm} {TurnOvers_Form: CoClass},
  FPTurnOversDataModImpl in 'FPTurnOversDataModImpl.pas' {TurnOversDataMod: TDataModule},
  UnitPrintWb in 'UnitPrintWb.pas' {Printing};

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

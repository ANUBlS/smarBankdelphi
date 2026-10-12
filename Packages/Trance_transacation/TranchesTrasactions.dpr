library TranchesTrasactions;

uses
  ComServ,
  TranshTransaction_TLB in 'TranshTransaction_TLB.pas',
  TranceTransactions in 'TranceTransactions.pas' {TranceTransaction: TActiveForm} {TranceTransaction: CoClass},
  TrdataUnit in 'TrdataUnit.pas' {TrData: TDataModule},
  UnitImage in 'UnitImage.pas' {FormImage};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}

begin
end.

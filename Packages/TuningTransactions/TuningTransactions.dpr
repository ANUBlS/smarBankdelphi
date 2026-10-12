library TuningTransactions;

uses
  ComServ,
  TuningTransactions_TLB in 'TuningTransactions_TLB.pas',
  TuningTransactionImpl in 'TuningTransactionImpl.pas' {TuningTransaction: TActiveForm} {TuningTransaction: CoClass},
  DataModuleImpl in 'DataModuleImpl.pas' {TuningDataModule: TDataModule},
  UnitFormOperations in 'UnitFormOperations.pas' {FormOperations},
  UntTariffScale in 'UntTariffScale.pas' {FormReferences};

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

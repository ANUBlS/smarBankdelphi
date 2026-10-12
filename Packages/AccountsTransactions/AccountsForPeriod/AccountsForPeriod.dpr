library AccountsForPeriod;

uses
  ComServ,
  AccountsForPeriod_TLB in 'AccountsForPeriod_TLB.pas',
  AccountsForPeriodImpl in 'AccountsForPeriodImpl.pas' {AccountsForPeriodForm: TActiveForm} {AccountsForPeriodForm: CoClass},
  FPAccountsDataModuleImpl in 'FPAccountsDataModuleImpl.pas' {FPADataMod: TDataModule};

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

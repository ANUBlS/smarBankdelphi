library out_account;

uses
  ComServ,
  out_account_TLB in 'out_account_TLB.pas',
  AccountImpl in 'AccountImpl.pas' {AccountForm: TActiveForm} {ActiveFormX: CoClass},
  AccountDataModuleImpl in 'AccountDataModuleImpl.pas' {out_accdatamodule: TDataModule},
  AccountPropertiesImpl in 'AccountPropertiesImpl.pas' {AccountPropertiesForm},
  AccountFlagsImpl in 'AccountFlagsImpl.pas' {FormAccFlags},
  AccountRestState in 'AccountRestState.pas' {AccountState},
  AccountTransactionsImpl in 'AccountTransactionsImpl.pas' {FormAccountTransactions},
  IntervalImpl in 'IntervalImpl.pas' {FormInterval};

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

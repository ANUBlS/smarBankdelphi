library AccountsTransactions;

uses
  ComServ,
  AccountsTransactions_TLB in 'AccountsTransactions_TLB.pas',
  AccountsTransactionsImpl in 'AccountsTransactionsImpl.pas' {FormAccountsTransactions: TActiveForm} {FormAccountsTransactions: CoClass},
  UnitDataMod in 'UnitDataMod.pas' {DataMod: TDataModule};

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

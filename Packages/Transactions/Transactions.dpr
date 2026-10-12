library Transactions;

uses
  ComServ,
  Transactions_TLB in 'Transactions_TLB.pas',
  TransactionsMainFormImpl in 'TransactionsMainFormImpl.pas' {TransactionsMainForm: TActiveForm} {TransactionsMainForm: CoClass},
  TransactionPropertiesForm_Unit in 'TransactionPropertiesForm_Unit.pas' {TransactionPropertiesForm},
  TrDescrForm_Unit in 'TrDescrForm_Unit.pas' {TrDescrForm},
  TransactionsDataModuleImpl in 'TransactionsDataModuleImpl.pas' {TransactionsDataModule: TDataModule};

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

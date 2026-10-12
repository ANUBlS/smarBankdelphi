library out_TransactionManagerForm;

uses
  ComServ,
  out_TransactionManagerForm_TLB in 'out_TransactionManagerForm_TLB.pas',
  TransactionManagerImpl in 'TransactionManagerImpl.pas' {TransactionManagerForm: TActiveForm} {ActiveFormX: CoClass},
  out_CommissionImpl in 'out_CommissionImpl.pas' {CommissionForm},
  out_TransactionDestinationForm in 'out_TransactionDestinationForm.pas' {TransactionDestinationForm},
  TransactionPropertiesImpl in 'TransactionPropertiesImpl.pas' {TransactionEditForm},
  TransactionDataModuleUnit in 'TransactionDataModuleUnit.pas' {out_transactionDataModule: TDataModule};

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

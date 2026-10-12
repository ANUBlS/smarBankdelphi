library Accounts;

uses
  ComServ,
  Accounts_TLB in 'Accounts_TLB.pas',
  AccountMainFormImpl in 'AccountMainFormImpl.pas' {AccountMainForm: TActiveForm} {AccountMainForm: CoClass},
  AccountAboutImpl in 'AccountAboutImpl.pas' {AccountMainFormAbout},
  AccountPropertiesForm_Unit in 'AccountPropertiesForm_Unit.pas' {AccountPropertiesForm},
  AccountDataModuleImpl in 'AccountDataModuleImpl.pas' {AccountDataModule: TDataModule},
  AccTransactionsFormImpl in 'AccTransactionsFormImpl.pas' {AccTransactionsForm},
  StartEndDateInputImpl in 'StartEndDateInputImpl.pas' {StartEndDateInputForm},
  AccStatesImpl in 'AccStatesImpl.pas' {AccStatesForm},
  AccFlagsChangingImpl in 'AccFlagsChangingImpl.pas' {AccFlagsForm};

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

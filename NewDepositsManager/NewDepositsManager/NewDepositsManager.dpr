library NewDepositsManager;

uses
  ComServ,
  NewDepositsManager_TLB in 'NewDepositsManager_TLB.pas',
  NewDepositsManagerForm in 'NewDepositsManagerForm.pas' {NewDepositsManagerImpl: TActiveForm} {NewDepositsManagerImpl: CoClass},
  NewDepositDataModule in 'NewDepositDataModule.pas' {NewDepsitDataModule: TDataModule};

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

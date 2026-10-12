library NewDepositsManagerArchive;

uses
  ComServ,
  NewDepositsManagerArchive_TLB in 'NewDepositsManagerArchive_TLB.pas',
  NewDepositsManagerArchiveForm in 'NewDepositsManagerArchiveForm.pas' {NewDepositsManagerArchiveFormImpl: TActiveForm} {NewDepositsManagerArchiveFormImpl: CoClass},
  NewDepositsDataModule in 'NewDepositsDataModule.pas' {NewDepositDataModule: TDataModule};

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

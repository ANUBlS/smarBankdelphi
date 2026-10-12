library DepositsArchive;

uses
  ComServ,
  DepositsArchive_TLB in 'DepositsArchive_TLB.pas',
  DepositsArchiveImpl in 'DepositsArchiveImpl.pas' {FrmDepositsArchive: TActiveForm} {FrmDepositsArchive: CoClass},
  dmDepositsArchiveImpl in 'dmDepositsArchiveImpl.pas' {dmDepositsArchive: TDataModule};

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

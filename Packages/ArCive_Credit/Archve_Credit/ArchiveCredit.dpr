
library ArchiveCredit;

uses
  ComServ,
  Archive_Credit_TLB in 'Archive_Credit_TLB.pas',
  ArchiveCreditUnit in 'ArchiveCreditUnit.pas' {FormArchiveCredit: TActiveForm} {FormArchiveCredit: CoClass},
  ArchiveCredUnit in 'ArchiveCredUnit.pas' {DataMArchiveCr: TDataModule},
  UnitTR in 'UnitTR.pas' {FormTr};

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

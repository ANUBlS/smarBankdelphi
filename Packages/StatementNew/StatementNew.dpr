library StatementNew;

uses
  ComServ,
  StatementNew_TLB in 'StatementNew_TLB.pas',
  StatementDataModule in 'StatementDataModule.pas' {StatementDataModNew: TDataModule},
  StatementReportUnit in 'StatementReportUnit.pas' {StatementReport},
  StatementImpl in 'StatementImpl.pas' {StatementX: TActiveForm};

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

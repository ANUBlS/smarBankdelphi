 library GoAml_ServiceOcxdproj;

uses
  ComServ,
  GoAml_ServiceProject_TLB in 'GoAml_ServiceProject_TLB.pas',
  GoAml_serviceImpl in 'GoAml_serviceImpl.pas' {GoAml_ServiceForm: TActiveForm} {GoAml_Service: CoClass},
  DatUnit in 'DatUnit.pas' {DM_goAml: TDataModule};

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

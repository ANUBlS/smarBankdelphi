library OutExcelImporter;

uses
  ComServ,
  OutExcelImport_TLB in 'OutExcelImport_TLB.pas',
  OutExcelImport in 'OutExcelImport.pas' {OutExcelImp: TActiveForm} {OutExcelImp: CoClass};

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

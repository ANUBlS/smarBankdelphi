library ImportService;

uses
  ComServ,
  ImportService_TLB in 'ImportService_TLB.pas',
  ImportServiceImpl1 in 'ImportServiceImpl1.pas' {FormImportService: TActiveForm} {FormImportService: CoClass};

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

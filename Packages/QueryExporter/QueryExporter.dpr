library QueryExporter;

uses
  ComServ,
  QueryExporter_TLB in 'QueryExporter_TLB.pas',
  QueryExporterImpl in 'QueryExporterImpl.pas' {QueryExporterForm: TActiveForm} {QueryExporterForm: CoClass},
  QueryResultViewer in 'QueryResultViewer.pas' {ResultForm};

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

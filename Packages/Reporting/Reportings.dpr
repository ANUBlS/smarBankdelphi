library Reportings;

uses
  ComServ,
  Reporting_TLB in 'Reporting_TLB.pas',
  ReportingMain in 'ReportingMain.pas' {Reporting: TActiveForm} {Reporting: CoClass};

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

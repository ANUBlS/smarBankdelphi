library Online_court_conturol;

uses
  ComServ,
  Online_court_conturol_TLB in 'Online_court_conturol_TLB.pas',
  Online_court_conturolUnit in 'Online_court_conturolUnit.pas' {Online_court_conturolImpl: TActiveForm} {Online_court_conturolImpl: CoClass};

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

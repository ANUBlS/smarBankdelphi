library Project2;

uses
  ComServ,
  Project2_TLB in 'Project2_TLB.pas',
  Unit2 in 'Unit2.pas' {sa: TActiveForm} {sa: CoClass};

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

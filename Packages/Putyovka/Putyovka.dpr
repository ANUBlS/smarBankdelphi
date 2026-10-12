library Putyovka;

uses
  ComServ,
  Project1_TLB in 'Project1_TLB.pas',
  Putyuvoka in 'Putyuvoka.pas' {Putyukova: TActiveForm} {Putyukova: CoClass};

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

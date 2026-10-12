library Sif_Platform;

uses
  ComServ,
  SifPlatforms_TLB in 'SifPlatforms_TLB.pas',
  MainPlatform in 'MainPlatform.pas' {SifPlatform: TActiveForm} {SifPlatform: CoClass};

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

library PMFBlank;

uses
  ComServ,
  PMFBlank_TLB in 'PMFBlank_TLB.pas',
  UMFBlank in 'UMFBlank.pas' {MFBlank: TActiveForm} {MFBlank: CoClass};

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

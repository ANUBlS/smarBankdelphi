library PMFPolicy;

uses
  ComServ,
  PMFPolicy_TLB in 'PMFPolicy_TLB.pas',
  UMFPolicy in 'UMFPolicy.pas' {MFPolicy: TActiveForm} {MFPolicy: CoClass};

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

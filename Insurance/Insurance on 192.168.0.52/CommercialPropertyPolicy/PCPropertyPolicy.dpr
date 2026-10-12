library PCPropertyPolicy;

uses
  ComServ,
  PCPropertyPolicy_TLB in 'PCPropertyPolicy_TLB.pas',
  UCPPolicyDataModule in 'UCPPolicyDataModule.pas' {CPropertyPolicy: TActiveForm} {CPropertyPolicy: CoClass},
  UCPropertyPolicy in 'UCPropertyPolicy.pas' {PolicyDataModule: TDataModule};

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

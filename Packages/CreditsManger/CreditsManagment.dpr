library CreditsManagment;

uses
  ComServ,
  CreditsManagment_TLB in 'CreditsManagment_TLB.pas',
  cmMainUnitImpl in 'cmMainUnitImpl.pas' {CMMainForm: TActiveForm} {CMMainForm: CoClass};

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

library CreditsArcive;

uses
  ComServ,
  CreditsArcive_TLB in 'CreditsArcive_TLB.pas',
  CreditsArciveImpl in 'CreditsArciveImpl.pas' {FrmCreditsArcive: TActiveForm} {FrmCreditsArcive: CoClass};

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

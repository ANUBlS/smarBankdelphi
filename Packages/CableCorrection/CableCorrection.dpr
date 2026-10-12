library CableCorrection;

uses
  ComServ,
  CableCorrection_TLB in 'CableCorrection_TLB.pas',
  CableCorrectionImpl in 'CableCorrectionImpl.pas' {CableCorrect: TActiveForm} {CableCorrect: CoClass};

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

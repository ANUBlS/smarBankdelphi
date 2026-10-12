library RateDifference;

uses
  ComServ,
  RateDifference_TLB in 'RateDifference_TLB.pas',
  RateDifferenceFormImpl1 in 'RateDifferenceFormImpl1.pas' {RateDifferenceForm: TActiveForm} {RateDifferenceForm: CoClass};

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

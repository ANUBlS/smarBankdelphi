library MKSuggestion;

uses
  ComServ,
  MKSuggestion_TLB in 'MKSuggestion_TLB.pas',
  MKSuggestionImpl in 'MKSuggestionImpl.pas' {fmMKSuggestion: TActiveForm} {fmMKSuggestion: CoClass},
  URiskTypes in 'URiskTypes.pas' {fmRiskTypes};

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

library MEDSuggestion;

uses
  ComServ,
  MEDSuggestion_TLB in 'MEDSuggestion_TLB.pas',
  fmMEDSuggestionImpl in 'fmMEDSuggestionImpl.pas' {fmMEDSuggestion: TActiveForm} {fmMEDSuggestion: CoClass};

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

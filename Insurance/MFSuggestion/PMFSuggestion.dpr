library PMFSuggestion;

uses
  ComServ,
  PMFSuggestion_TLB in 'PMFSuggestion_TLB.pas',
  UMFSuggestion in 'UMFSuggestion.pas' {MFSuggestion: TActiveForm} {MFSuggestion: CoClass},
  URiskTypes in 'URiskTypes.pas' {fmRiskTypes},
  UDModule in 'UDModule.pas' {DModule1: TDataModule};

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

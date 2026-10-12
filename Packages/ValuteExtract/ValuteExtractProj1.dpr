library ValuteExtractProj1;

uses
  ComServ,
  ValuteExtractProj1_TLB in 'ValuteExtractProj1_TLB.pas',
  ValuteExtractImpl1 in 'ValuteExtractImpl1.pas' {ValuteExtract: TActiveForm} {ValuteExtract: CoClass},
  UnotQuickRepStatement in 'UnotQuickRepStatement.pas' {QuickRepStatement: TQuickRep};

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

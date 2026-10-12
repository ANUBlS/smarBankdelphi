library Extraction;

uses
  ComServ,
  Extraction_TLB in 'Extraction_TLB.pas',
  ExtractionUnit in 'ExtractionUnit.pas' {ExtractionForm: TActiveForm} {ExtractionForm: CoClass},
  ExtractionDataModuleImpl in 'ExtractionDataModuleImpl.pas' {ExtractionDataModule: TDataModule},
  ExtractionReportUnit in 'ExtractionReportUnit.pas' {ExtractionReport: TQuickRep};

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

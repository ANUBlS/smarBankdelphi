library ExpertAnalys;

uses
  ComServ,
  ExpertAnalys_TLB in 'ExpertAnalys_TLB.pas',
  ExpertAnalysImpl in 'ExpertAnalysImpl.pas' {ExpertAnalysX: TActiveForm} {ExpertAnalysX: CoClass},
  ExpertDataModule in 'ExpertDataModule.pas' {ExpertDataModul: TDataModule},
  MainReportUnit in 'MainReportUnit.pas' {MainReport: TQuickRep},
  TrafficsFormImpl in 'TrafficsFormImpl.pas' {TrafficsForm},
  MainTrafficsForm in 'MainTrafficsForm.pas' {MainTraffics},
  SchemaTrafficsFormImpl in 'SchemaTrafficsFormImpl.pas' {SchemaTrafficsForm},
  TurnOverReport in 'TurnOverReport.pas' {ReportTurnOver: TQuickRep},
  ExportFormUnit in 'ExportFormUnit.pas' {ExportForm};

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

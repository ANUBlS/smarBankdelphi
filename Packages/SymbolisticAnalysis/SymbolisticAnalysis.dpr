library SymbolisticAnalysis;

uses
  ComServ,
  SymbolisticAnalysis_TLB in 'SymbolisticAnalysis_TLB.pas',
  SymbolisticAnalysisImpl in 'SymbolisticAnalysisImpl.pas' {FrmSymbolisticAnalysis: TActiveForm} {FrmSymbolisticAnalysis: CoClass},
  SADataModuleImpl in 'SADataModuleImpl.pas' {SADataModule: TDataModule};

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

library TransactionsDocument;

uses
  ComServ,
  TransactionsDocument_TLB in 'TransactionsDocument_TLB.pas',
  TransactionsDocumentImpl in 'TransactionsDocumentImpl.pas' {TransactionsDocumentX: TActiveForm} {TransactionsDocumentX: CoClass},
  TransactionsDocDataModUnit in 'TransactionsDocDataModUnit.pas' {TransactionsDocDataMod: TDataModule},
  ReportUnit in 'ReportUnit.pas' {TransactionsDocReportForm};

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

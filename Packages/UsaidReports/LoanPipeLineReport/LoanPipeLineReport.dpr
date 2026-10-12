library LoanPipeLineReport;

uses
  ComServ,
  LoanPipeLineReport_TLB in 'LoanPipeLineReport_TLB.pas',
  frmLoanPipeLineReportImpl in 'frmLoanPipeLineReportImpl.pas' {frmLoanPipeLineReport: TActiveForm} {frmLoanPipeLineReport: CoClass},
  dmLoanPipeLineReportImpl in 'dmLoanPipeLineReportImpl.pas' {dmLoanPipeLineReport: TDataModule},
  frmAddEditClpImpl in 'frmAddEditClpImpl.pas' {frmAddEditClp},
  frmInfoflevelsImpl in 'frmInfoflevelsImpl.pas' {frmInfoflevels},
  frmReportOfLOLIMPL in 'frmReportOfLOLIMPL.pas' {frmReportOflpl};

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

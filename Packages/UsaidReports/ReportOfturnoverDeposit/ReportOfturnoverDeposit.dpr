library ReportOfturnoverDeposit;

uses
  ComServ,
  ReportOfturnoverDeposit_TLB in 'ReportOfturnoverDeposit_TLB.pas',
  frmReportOfturnoverDepositImpl in 'frmReportOfturnoverDepositImpl.pas' {frmReportOfturnoverDeposit: TActiveForm} {frmReportOfturnoverDeposit: CoClass},
  dmReportOfturnoverDepositImpl in 'dmReportOfturnoverDepositImpl.pas' {dmReportOfturnoverDeposit: TDataModule},
  frmDetailTurnOverDepositImpl in 'frmDetailTurnOverDepositImpl.pas' {frmDetailTurnOverDeposit};

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

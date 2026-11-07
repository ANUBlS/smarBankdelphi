unit ReportLoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  MISImpl,PayPeriodImpl, PeriodReport, CommonDecls;

procedure ShowMisReport;
begin
  with TMISForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure ShowPeriodReport;
begin
  with TPeriodReportForm.Create(CommonApplication) do
  try
    ShowModal;
  finally
    Release
  end;
end;

procedure Showpay;
begin
  with TPayForm.Create(CommonApplication) do
  try
    ShowModal;
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SMisReport='MIS';
  SPeriodReport='PERIODREPORT';
  spay='PAY'    ;
begin
  if S = SMisReport then
    ShowMisReport
  else if S = SPeriodReport then
    ShowPeriodReport;

    if s=spay then
    Showpay
end;

exports
  InitPlugin;

end.

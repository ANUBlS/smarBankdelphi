unit AKReportLoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  BriefcaseImpl, CommonDecls;

procedure ShowBriefCaseReport;
begin
  with TBriefcaseForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SBriefcaseReport = 'BRIEFCASE';
begin
  if S = SBriefcaseReport then
    ShowBriefCaseReport;
end;

exports
  InitPlugin;

end.

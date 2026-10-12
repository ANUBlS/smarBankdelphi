unit AKReportsLoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  uBriefCaseFilter, crCommonDecls;

procedure ShowBriefCaseFilter;
begin
  with TfrmBCFilter.Create(CommonApplication) do
  try
    ShowMe;
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SBriefcaseFilter = 'FILTER';
begin
  if S = SBriefcaseFilter then
    ShowBriefCaseFilter;
end;

exports
  InitPlugin;

end.

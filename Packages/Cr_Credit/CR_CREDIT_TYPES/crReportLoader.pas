unit crReportLoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  crCrTypeImpl, crCommonDecls;

procedure ShowCrTypeMainForm;
begin
  with TCrTypeMainForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SMisReport='CreditType';
begin
  if S = SMisReport then
    ShowCrTypeMainForm;
end;

exports
  InitPlugin;

end.

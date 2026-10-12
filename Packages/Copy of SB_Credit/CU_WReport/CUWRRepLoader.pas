unit CUWRRepLoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  CUAgreeUnit, CUCommonDecls;

procedure ShowAgreeReport;
begin
  with TAgreeForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SAgreeReport='AGREE';
begin
  if S = SAgreeReport then
    ShowAgreeReport;
end;

exports
  InitPlugin;

end.

unit RILoader;

interface


procedure InitPlugin(S : String);export;

implementation

uses
  CommonDecls, uRIMain;

procedure ShowReestReport;
begin
  with TfrmRIMain.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;


procedure InitPlugin(S : String);export;
const
  SReestrReport='REESTR';
begin
  if S = SReestrReport then
    ShowReestReport
end;

exports
  InitPlugin;

end.

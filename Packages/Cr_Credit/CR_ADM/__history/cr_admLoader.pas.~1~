unit admLoader;

interface
       
procedure InitPlugin(S : String);export;

implementation

uses admMainFormImpl, CommonDecls;

procedure ShowAdministrationMain;
begin
  with TfrmMain.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure InitPlugin(S : String);export;
const
  SAdminMain='MAIN';
begin
  if S = SAdminMain then
    ShowAdministrationMain;
end;

exports
  InitPlugin;

end.

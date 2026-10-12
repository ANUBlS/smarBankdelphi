program SBUpdater;

uses
  Forms,
  SBUpdaterUnit in 'SBUpdaterUnit.pas' {SBUpdaterMainForm},
  SBUpdaterUtils_Unit in 'SBUpdaterUtils_Unit.pas',
  sbFileVersion in 'sbFileVersion.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'SmartBank2.0 Updater';
  Application.CreateForm(TSBUpdaterMainForm, SBUpdaterMainForm);
  Application.Run;
end.

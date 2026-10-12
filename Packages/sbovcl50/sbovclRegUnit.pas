unit sbovclRegUnit;

interface

uses SysUtils, Classes, Dialogs;

procedure Register;

implementation

uses InstallationTaskEditFrameImpl, DBIniSource, IniSourceViewer,
  SBSecurityBrowser, VisibleController;

const
  Page_SmartDialogs = 'Smart';
  Page_SmartVisualControls = 'Smart Visuals';

procedure Register;
begin
  RegisterComponents(Page_SmartDialogs, [
    TInstallationTaskEditFrame,
    TSBSecurityBrowser]);

  RegisterComponents(Page_SmartVisualControls, [
    TDBIniSource,
    TIniSourceViewer,
    TVisibleController]);
end;

end.

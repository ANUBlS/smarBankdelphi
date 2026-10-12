unit SytemManager;

interface

uses
  SysUtils,Windows,Forms,Dialogs, ShellAPI;

procedure InitPlugin(P : String); export;

implementation

uses
  CommonDecls, AboutProgramImpl;
  
const
  sTurnOffSystem = 'TURNOFFSYSTEM';
  sRefreshData = 'REFRESHDATA';
  sAboutProgram = 'ABOUTPROGRAMM';
  sShowHelp = 'SHOWHELP';

procedure ShowAbout;
begin
  with TfrmAboutProgram.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure InitPlugin(P : String); export;
begin
  if UpperCase(P) = sTurnOffSystem then
    CommonApplication.MainForm.Close else
  if UpperCase(P) = sRefreshData then
    SafeRefresh(True,rmLocateAfterRefresh) else
  if UpperCase(P) = sAboutProgram then
    ShowAbout;                 
  if UpperCase(P) = sShowHelp then
  ShellExecuteA(CommonApplication.Handle,
                'open',
                'CreditsMgr.chm',
                nil,
                nil,
                SW_SHOWNORMAL);
end;

exports
  InitPlugin;

end.

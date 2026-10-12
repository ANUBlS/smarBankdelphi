unit SBUpdaterUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TSBUpdaterMainForm = class(TForm)
    LogoMemo: TMemo;
    Button1: TButton;
    OpenDlg: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LogMessage(const message : String);
    { Public declarations }
  end;

var
  SBUpdaterMainForm: TSBUpdaterMainForm;

implementation

uses SBUpdaterUtils_Unit,  sbFileVersion;

{$R *.DFM}

procedure TSBUpdaterMainForm.LogMessage(const message : String);
begin
  LogoMemo.Lines.Add(message);
end;

procedure TSBUpdaterMainForm.FormCreate(Sender: TObject);
begin
    LogMessage(FindCmdLineParam('Path',['/'],'=',True));
    if FindCmdLineSwitch('LoadModules',['/','-'],True) then
    LogMessage('LoadModules') else LogMessage('Nulls')
end;

procedure TSBUpdaterMainForm.Button1Click(Sender: TObject);
var
  FI : TFileVersion;
begin
  LogoMemo.Lines.Clear;
  with OpenDlg do
  if Execute then
  begin
    FI := TFileVersion.Create;
    try
      FI.GetFileVersion(FileName);
      LogMessage('Major '+IntToStr(FI.Major));
      LogMessage('Minor '+IntToStr(FI.Minor));
      LogMessage('Build '+IntToStr(FI.Build));
      LogMessage('Release '+IntToStr(FI.Release));
      LogMessage('Version '+FI.Version);
    finally
      FI.Destroy;
    end;
  end;

end;

end.

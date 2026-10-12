unit ProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type
  TProgressForm = class(TForm)
    Panel1: TPanel;
    StatusPanel: TPanel;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    TotalPBPanel: TPanel;
    Label3: TLabel;
    TotalProgressBar: TProgressBar;
    ControlPanel: TPanel;
    CancelButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure StartDialog(const ACaption: String; InitialMessage: String = ''; TotalProgressBarVisible: Boolean = False;
      ControlPanelVisible: Boolean = False);
    procedure DoneDialog;
    procedure StatusMessage(const Message: String);
    procedure SetCaption(const ACaption: String);
    procedure SetProgress(Value: Integer);
    procedure SetTotalProgress(Value: Integer);
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

procedure TProgressForm.StartDialog(const ACaption: String; InitialMessage: String = ''; TotalProgressBarVisible: Boolean = False;
      ControlPanelVisible: Boolean = False);
begin
  SetCaption(ACaption);
  StatusMessage(InitialMessage);
  TotalProgressBar.Visible := TotalProgressBarVisible;
  ControlPanel.Visible := ControlPanelVisible;
  Show;
end;

procedure TProgressForm.DoneDialog;
begin
  Close;
end;

procedure TProgressForm.StatusMessage(const Message: String);
begin
  StatusPanel.Caption := Message;
end;

procedure TProgressForm.SetCaption(const ACaption: String);
begin
  Caption := ACaption;
end;

procedure TProgressForm.SetProgress(Value: Integer);
begin
  ProgressBar.Position := Value;
  Refresh;
end;

procedure TProgressForm.SetTotalProgress(Value: Integer);
begin
  TotalProgressBar.Position := Value;
  Refresh;
end;

end.

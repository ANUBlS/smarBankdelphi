unit ErrorFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TErrorForm = class(TForm)
    DetailsMemo: TMemo;
    Panel1: TPanel;
    MessageMemo: TMemo;
    Panel2: TPanel;
    OkButton: TButton;
    DetailsButton: TButton;
    Panel3: TPanel;
    Image1: TImage;
    procedure DetailsButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowException(E: Exception);
  end;

var
  ErrorForm: TErrorForm;

implementation

{$R *.DFM}

uses SBCore;

procedure TErrorForm.ShowException(E: Exception);
begin
  Caption := E.ClassName;
  MessageMemo.Lines.Text := E.Message;
  if E is ESmartError then
    DetailsMemo.Lines.Text :=''// (E as ESmartError).OriginalMessage
  else
    DetailsMemo.Lines.Text := '(details not available)';
  ShowModal;
end;

procedure TErrorForm.DetailsButtonClick(Sender: TObject);
begin
  with DetailsMemo do
    Visible := not Visible;
end;

procedure TErrorForm.OkButtonClick(Sender: TObject);
begin
  Close;
end;

end.

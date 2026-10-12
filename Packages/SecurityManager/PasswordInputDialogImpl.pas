unit PasswordInputDialogImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask;

type
  TPasswordInputDialog = class(TForm)
    GroupBox1: TGroupBox;
    PasswordEdit: TMaskEdit;
    RetryPasswordEdit: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function GetPassword: String;
  public
    { Public declarations }
    function Execute: Boolean;
    property Password: String read GetPassword;
  end;

var
  PasswordInputDialog: TPasswordInputDialog;

implementation

{$R *.DFM}

function TPasswordInputDialog.Execute: Boolean;
begin
  ShowModal;
  Result := ModalResult = mrOk;
end;

function TPasswordInputDialog.GetPassword: String;
begin
  Result := PasswordEdit.Text;
end;

procedure TPasswordInputDialog.OkButtonClick(Sender: TObject);
begin
  if PasswordEdit.Text = '' then
  begin
    PasswordEdit.SetFocus;
    MessageDlg('Password can not be empty string', mtError, [mbOk], 0);
  end
  else
  if PasswordEdit.Text <> RetryPasswordEdit.Text then
  begin
    RetryPasswordEdit.SetFocus;
    MessageDlg('Retry password', mtError, [mbOk], 0);
  end
  else
  begin
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TPasswordInputDialog.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Chr(VK_ESCAPE) then
    Close;
end;

end.

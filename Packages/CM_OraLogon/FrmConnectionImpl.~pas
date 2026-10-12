unit FrmConnectionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, Buttons, ExtCtrls, CMHintBox;

type
  TFrmConnection = class(TForm)
    GrBLogonParams: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EdUsername: TEdit;
    EdPassword: TEdit;
    CBDatabases: TComboBox;
    LblUserName: TLabel;
    LblPassword: TLabel;
    Lbl: TLabel;
    HBxCheck: TCMHintBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
  public
    LogonDatabase :String;
    LogonUsername :String;
    LogonPassword :String;
    TryConnect :Boolean;
    function CheckLogonParams :Boolean;
  end;

var
  FrmConnection: TFrmConnection;

implementation

{$R *.DFM}

procedure TFrmConnection.BitBtn2Click(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFrmConnection.BitBtn1Click(Sender: TObject);
begin
   LogonDatabase := CBDatabases.Text;
   LogonUsername := EdUsername.Text;
   LogonPassword := EdPassword.Text;
   if CheckLogonParams then
   begin
     TryConnect := True;
     ModalResult := mrOk;
   end;
end;

function TFrmConnection.CheckLogonParams :Boolean;
const
  cUsrname = 'Истифадячини дахил един !';
  cPassword = 'Шифряни дахил един !';
  cDatabase = 'Датабасе-и сечин !';
begin
  if CBDatabases.Text = '' then HBxCheck.ShowMessage(cDatabase);
  if EdPassword.Text = '' then HBxCheck.ShowMessage(cPassword);
  if EdUsername.Text = '' then HBxCheck.ShowMessage(cUsrname);
  Result := (EdUsername.Text <> '') and (EdPassword.Text <> '') and
            (CBDatabases.Text <> '');
end;

procedure TFrmConnection.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close;
end;

procedure TFrmConnection.FormShow(Sender: TObject);
begin
   EdUsername.Text := LogonUsername;
   EdPassword.Text := LogonPassword;
   EdPassword.SetFocus;
   CBDatabases.Text := LogonDatabase;
end;

end.

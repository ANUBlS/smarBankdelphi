unit FrmChangePasswordImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, CMHintBox ;

type
  TFrmChangePassword = class(TForm)
    Panel1: TPanel;
    EdNewPass: TEdit;
    EdRetPass: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    HBxCheck: TCMHintBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  // function GetPass :String;
   function Control : Boolean;
  public
    NewPassword :String;
    ChangePass : Boolean;
  end;

var
  FrmChangePassword: TFrmChangePassword;

implementation

{$R *.DFM}

function TFrmChangePassword.Control : Boolean;
begin
   Result := (EdNewPass.Text = EdRetPass.Text);
   if  not Result then
      HBxCheck.ShowMessage('Òÿךנאנ רטפנÿ הצח‎צם הויטכ !');
end;

procedure TFrmChangePassword.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmChangePassword.BitBtn1Click(Sender: TObject);
begin
  if Control then begin
     NewPassword := EdNewPass.Text;
     ChangePass := True;
     ModalResult := MrOk;
  end;
end;

procedure TFrmChangePassword.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(Key) = VK_ESCAPE then close;
end;

end.

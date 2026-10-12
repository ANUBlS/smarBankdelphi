unit UnitChangePasswordForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, HintBox, Oracle, DB, OracleData;

type
  TCheckPassErr  = class(Exception);

  TfmPassChange = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNewPass: TEdit;
    Label2: TLabel;
    edRetypePass: TEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    hbErrBox: THintBox;
    pcADM: TOraclePackage;
    ODSusername: TOracleDataSet;
    ODSusernameUSER: TWideStringField;
    procedure btCancelClick(Sender: TObject);
    procedure edNewPassKeyPress(Sender: TObject; var Key: Char);
    procedure showInfo(info : String);
    procedure btOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  CheckPass(new, ret:String) : Boolean;    
  private
    { Private declarations }
  public
    oldpass : String;
    newpass : String;
    { Public declarations }
  end;

var
  fmPassChange: TfmPassChange;

implementation

uses UnitSBOraLogOn;

{$R *.DFM}

procedure TfmPassChange.btCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Application.Terminate;
end;

procedure TfmPassChange.showInfo(info : String);
begin
  hbErrBox.ShowMessage(info);
end;

function TfmPassChange.CheckPass(new, ret:String) : Boolean;
begin
  result := false;
  try
    if Length(new) = 0  then
      raise  TCheckPassErr.Create('Bu sahə boş ola bilməz!');
    if new <> ret then
      raise  TCheckPassErr.Create('Təkrar şifrə düzgün deyil!');
    if new = oldpass then
      raise  TCheckPassErr.Create('Yeni şifrə ilə köhnə şifrə eyni ola bilməz!');
    result := true;
  except
    on E:TCheckPassErr do showInfo(E.Message);
    else RaiseLastWin32Error;
  end;
end;

procedure TfmPassChange.edNewPassKeyPress(Sender: TObject; var Key: Char);
var
 Layout: array[0.. KL_NAMELENGTH] of char;
begin
GetKeyboardLayoutName(Layout);
 if  (Layout<>'00000409') then
  key:=#0;
if (Length((Sender As TEdit).Text)=0) and ( key in ['0'..'9']) then
 key:=#0;
if ((Sender As TEdit).SelLength>0) and ( key in ['0'..'9']) then
 key:=#0
end;

procedure TfmPassChange.btOkClick(Sender: TObject);

function VerifyPassword(passwd : string) : Boolean;
begin
  Result := false;
  with pcADM do
    if CallBooleanFunction('verify_password', [trim(passwd)]) then Result := true;
end;

begin
  if CheckPass(edNewPass.Text, edRetypePass.Text) then
    begin
      newpass := edNewPass.Text;
      //ODSusername.Open;
       //pcADM.CallBooleanFunction('user_passw',[ODSusername.FieldByName('user').AsString,newpass]);
       ModalResult := mrOk;
    end;
end;

procedure TfmPassChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not (ModalResult  in [mrOk, mrCancel]) then
             Action := caNone
end;

end.

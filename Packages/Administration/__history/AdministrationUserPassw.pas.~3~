unit AdministrationUserPassw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, HintBox;



type
  EPassError=class(Exception);

  TfmUserPassw = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edPassw: TEdit;
    edretpassw: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ErBox: THintBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure edPasswKeyPress(Sender: TObject; var Key: Char);
  private
  function GetPassword: string;virtual;
    { Private declarations }
  public
  function Execute: Boolean;
   property Password : string read GetPassword;
    { Public declarations }
  end;

var
  fmUserPassw: TfmUserPassw;

implementation

uses AdministrationDataModule;

{$R *.DFM}

function TfmUserPassw.Execute: Boolean;
begin
  ShowModal;
  if ModalResult=mrOK then result:=True
  else Result:=False
end;

function TfmUserPassw.GetPassword: string;
begin
Result:=edPassw.Text;
end;

procedure TfmUserPassw.BitBtn1Click(Sender: TObject);

function VerifyPassword(passwd : string) : Boolean;
begin
  Result := false;
  with AdministrationData.pcADM do
    if CallBooleanFunction('verify_password', [trim(passwd)]) then Result := true;
end;

begin
 try
  with edPassw do
   begin
    if Text=EmptyStr then
    raise EPassError.Create('Şifrəni daxil edin');
    if not VerifyPassword(Text) then
    raise EPassError.Create('Şifrə mürəkkəb deyil');
    if StrToIntDef(Text[1],-1)<>-1 then
    raise EPassError.Create(' Birinci simvol hərf olmalıdır');
   if Text<>edretpassw.Text then
    raise EPassError.Create(' Təkrar düzgün daxil edin');
   end;
 except
 on E: EPassError do
  begin
   ErBox.ShowMessage(E.Message);
   ModalResult:=mrNone;
  end;
 else
   ModalResult:=mrNone;
 end
 
end;

procedure TfmUserPassw.edPasswKeyPress(Sender: TObject; var Key: Char);
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

end.

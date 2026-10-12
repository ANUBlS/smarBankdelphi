unit PasswordChange_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, ImgList, Oracle, ExtCtrls, HintBox{, ICECrypt};

type
  EPassError=class(Exception);   {H. R. 240626}

  TPasswordChange = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    OldPswEdit: TEdit;
    GroupBox2: TGroupBox;
    NewPswEdit: TEdit;
    GroupBox3: TGroupBox;
    RetypeNewPswEdit: TEdit;
    ClassImages: TImageList;
    Panel4: TPanel;
    BtnChange: TButton;
    Button1: TButton;
    pcADM: TOraclePackage;
    ErBox: THintBox;
    procedure BtnChangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordChange: TPasswordChange;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl, SBTranslateProc;

procedure TPasswordChange.BtnChangeClick(Sender: TObject);

 procedure EmptyText();
  begin
    NewPswEdit.Text := '';
    OldPswEdit.Text := '';
    RetypeNewPswEdit.Text := '';
    NewPswEdit.SetFocus;
  end;

  {H. R. 240626}
  function VerifyPassword(passwd : string) : Boolean;
   begin
   Result := false;
   with pcADM do
    if CallBooleanFunction('verify_password', [trim('KLs'+passwd+'#1$')]) then Result := true;
  end;
  {*** H. R. 240626 ***}

var
    UserName ,NewPsw: STRING;
    OldPsw: String;
    NoCryptedPsw :string;
begin
  NoCryptedPsw :=NewPswEdit.Text;
  //ICECrypt.Text := OldPswEdit.Text;
  OldPsw := 'KLs'+OldPswEdit.Text +'#1$'; //'s'+ICECrypt.GetCrypted;
  if OldPsw <> sboapiDataModule.SBSession.LogonPassword then
  begin
    ShowMessage('Köhnə şifrə düzgün daxil edilməyib!');
    EmptyText();
    Exit;
  end;
  if NewPswEdit.Text <> RetypeNewPswEdit.Text then
  begin
    ShowMessage('Yeni şifrə tələblərə uyğun deyil!');
    EmptyText();
    Exit;
  end;

  UserName := sboapiDataModule.SBSession.LogonUsername;
  //ICECrypt.Text := NewPswEdit.Text;
  NewPsw := 'KLs'+NewPswEdit.Text +'#1$'; //'s'+ICECrypt.GetCrypted;

  {H. R. 240626}
  if not VerifyPassword(NewPswEdit.Text) then
    raise EPassError.Create('Şifrə mürəkkəb deyil');
  {*** H. R. 240626 ***}

  with sboapiDataModule.SBLogin do begin
  //try
    CallProcedure('ChangeUserPsw',[NewPsw,NoCryptedPsw]);
    ShowMessage('Şifrə dəyişdirildi!');
    ModalResult:=mrOk
  //except
  //ShowMessage('Yeni şifrə tələblərə uyğun deyil!');
  end;
end;

procedure TPasswordChange.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

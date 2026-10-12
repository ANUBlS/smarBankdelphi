unit PasswordChange_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, ImgList, Oracle, ExtCtrls;

type
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
    procedure BtnChangeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordChange: TPasswordChange;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TPasswordChange.BtnChangeClick(Sender: TObject);

 procedure EmptyText();
  begin
    NewPswEdit.Text := '';
    OldPswEdit.Text := '';
    RetypeNewPswEdit.Text := '';
    NewPswEdit.SetFocus;
  end;

var
    UserName ,NewPsw: STRING;
begin
  if OldPswEdit.Text <> sboapiDataModule.SBSession.LogonPassword then
  begin
    ShowMessage('Ê‏שםÿ רטפנÿ הצח האץטכ והטכלÿיטב!');
    EmptyText();
    Exit;
  end;
  if NewPswEdit.Text <> RetypeNewPswEdit.Text then
  begin
    ShowMessage('ֹוםט ״טפנÿ הצחüצם הויטכ!');
    EmptyText();
    Exit;
  end;

  UserName := sboapiDataModule.SBSession.LogonUsername;
  NewPsw := NewPswEdit.Text;
  
  with sboapiDataModule.SBLogin do begin
  //try
    CallProcedure('ChangeUserPsw',[NewPsw]);
    ShowMessage('״טפנÿ הÿיטרהטנטכהט!');
    ModalResult:=mrOk;
  //except
    //ShowMessage('ֹוםט ״טפנÿ הצחüצם הויטכ!');
  end;

end;

end.

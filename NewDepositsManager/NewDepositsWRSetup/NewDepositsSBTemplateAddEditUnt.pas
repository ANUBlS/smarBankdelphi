unit NewDepositsSBTemplateAddEditUnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList,  Buttons, Mask, DBCtrls;

type
  TNewDepositsSBTemplAddEditForm = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBOpenDlg: TSpeedButton;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    Button1: TButton;
    Button2: TButton;
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure SBOpenDlgClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsSBTemplAddEditForm: TNewDepositsSBTemplAddEditForm;

implementation

{$R *.dfm}
  uses NewDepositsSBWRSetupDataModImpl,SBTranslateProc,sboapiDataModuleimpl;
procedure TNewDepositsSBTemplAddEditForm.ActnAcceptExecute(Sender: TObject);
begin
      if (DBEdit1.Text<>'') and (DBEdit2.Text<>'')  then
      begin
        with NewDepositsSBWRSetupDataMod.SBWRTemplatesDSet do
             Post;
             ModalResult := mrOk;
      end  else
      begin
        if DBEdit1.Text='' then  ShowMessage('Şablonun adı   daxil  edilməyib');
        if DBEdit2.Text='' then  ShowMessage('Şablon faylı   daxil  edilməyib');
        with NewDepositsSBWRSetupDataMod.SBWRTemplatesDSet do
             Cancel;
      end;
end;

procedure TNewDepositsSBTemplAddEditForm.ActnRejectExecute(Sender: TObject);
begin
    with NewDepositsSBWRSetupDataMod.SBWRTemplatesDSet do
          Cancel;
          ModalResult := mrCancel;
end;

procedure TNewDepositsSBTemplAddEditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Resize := False;
end;

procedure TNewDepositsSBTemplAddEditForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsSBTemplAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
      if ORD(Key) = VK_ESCAPE then
      ActnRejectExecute(nil);
end;

procedure TNewDepositsSBTemplAddEditForm.SBOpenDlgClick(Sender: TObject);
begin
   with NewDepositsSBWRSetupDataMod, OpenDlg ,SBWRTemplatesDSet do
      if Execute then
      FieldByName('Path').AsString := FileName;
end;

end.

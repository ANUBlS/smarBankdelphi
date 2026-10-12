unit Ph_CO_TemplAddEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, Buttons, Mask, DBCtrls;

type
  TPh_CO_TemplAddEditForm = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBOpenDlg: TSpeedButton;
    DBEdit3: TDBEdit;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    Button1: TButton;
    Button2: TButton;
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure SBOpenDlgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ph_CO_TemplAddEditForm: TPh_CO_TemplAddEditForm;

implementation

uses P_Datamod_Unit, Ph_CO_BookmarkSetupUnit,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TPh_CO_TemplAddEditForm.ActnAcceptExecute(Sender: TObject);
begin
  DBEdit3.Text := '2';
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    with P_DataModule.Templates do
      Post;
    ModalResult := mrOk;
  end
  else
  begin
    if DBEdit1.Text = '' then
      ShowMessage('Şablonun adı daxil deilməyib');
    if DBEdit2.Text = '' then
      ShowMessage('Şablon faylı daxil edilməyib');
    with P_DataModule.Templates do
      Cancel;
  end;
end;

procedure TPh_CO_TemplAddEditForm.ActnRejectExecute(Sender: TObject);
begin
  with P_DataModule.Templates do
    Cancel;
  ModalResult := mrCancel;
end;

procedure TPh_CO_TemplAddEditForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TPh_CO_TemplAddEditForm.SBOpenDlgClick(Sender: TObject);
begin
  if Ph_CO_BookmarkSetupFrom.OpenDlg.Execute then
    P_DataModule.Templates.FieldByName('Path').AsString :=
      Ph_CO_BookmarkSetupFrom.OpenDlg.FileName;
end;

end.

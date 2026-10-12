unit SBTemplateAddEditUnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList,  Buttons, Mask, DBCtrls;

type
  TSBTemplAddEditForm = class(TForm)
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
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SBTemplAddEditForm: TSBTemplAddEditForm;

implementation

uses SBWRSetupDataModImpl,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TSBTemplAddEditForm.ActnAcceptExecute(Sender: TObject);
begin

      if (DBEdit1.Text<>'') and (DBEdit2.Text<>'')  then
      begin
        with SBWRSetupDataMod.SBWRTemplatesDSet do
             Post;
             ModalResult := mrOk;
      end  else
      begin
        if DBEdit1.Text='' then  ShowMessage('Ўаблонун ады   даxил  eдилм€йиб');
        if DBEdit2.Text='' then  ShowMessage('Ўаблон файлы   даxил  eдилм€йиб');
        with SBWRSetupDataMod.SBWRTemplatesDSet do
             Cancel;
      end;
end;

procedure TSBTemplAddEditForm.ActnRejectExecute(Sender: TObject);
begin
    with SBWRSetupDataMod.SBWRTemplatesDSet do
          Cancel;
          ModalResult := mrCancel;
end;

procedure TSBTemplAddEditForm.SBOpenDlgClick(Sender: TObject);
begin
   with SBWRSetupDataMod, OpenDlg ,SBWRTemplatesDSet do
      if Execute then
      FieldByName('Path').AsString := FileName;

end;

procedure TSBTemplAddEditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Resize := False;
end;

procedure TSBTemplAddEditForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TSBTemplAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin

      if ORD(Key) = VK_ESCAPE then
      ActnRejectExecute(nil);
end;

end.

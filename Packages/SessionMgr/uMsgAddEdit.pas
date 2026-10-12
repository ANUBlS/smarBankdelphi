unit uMsgAddEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls;

type
  TfrmMsgAddEdit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBLookupComboBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsgAddEdit: TfrmMsgAddEdit;

implementation

uses uMsgSettings,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TfrmMsgAddEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMsgSettings.ODSMessages.Cancel;
end;

procedure TfrmMsgAddEdit.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfrmMsgAddEdit.Button1Click(Sender: TObject);
begin
  frmMsgSettings.ODSMessages.Post;
  Close;
end;

end.

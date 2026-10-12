unit Pcust_CO_BookmarkAddEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, DBCtrls, Mask;

type
  TPh_CO_BookmarkAddEditForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ph_CO_BookmarkAddEditForm: TPh_CO_BookmarkAddEditForm;

implementation

uses UnitDataModPCustService,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TPh_CO_BookmarkAddEditForm.ActnAcceptExecute(Sender: TObject);
resourcestring
  BookmarkNameEmptyMsg = 'Əlfəcinin (bookmark) adı daxil edilməyib';
  descriptionNameEmptyMsg = 'Təyinatı daxil edilməyib';
begin

  if (DBLookupComboBox1.Text <> '') and (DBEdit3.Text <> '') then
  begin
    with DataModPCustService.Bookmarks do
      Post;
    ModalResult := mrOk;
  end
  else
  begin
    if DBLookupComboBox1.Text = '' then
      Showmessage('Təyinatı daxil edilməyib');
    if DBEdit3.Text = '' then
      Showmessage('Əlfəcinin (bookmark) adı daxil edilməyib');
    with DataModPCustService.Bookmarks do
      Cancel;
  end;
end;

procedure TPh_CO_BookmarkAddEditForm.ActnRejectExecute(Sender: TObject);
begin
  with DataModPCustService.Bookmarks do
    Cancel;
  ModalResult := mrCancel;
end;

procedure TPh_CO_BookmarkAddEditForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

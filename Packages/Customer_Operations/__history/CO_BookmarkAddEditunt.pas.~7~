unit CO_BookmarkAddEditunt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, DBCtrls, Mask, DBLookup;

type
  TCO_BookmarkAddEditForm = class(TForm)
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
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
  CO_BookmarkAddEditForm: TCO_BookmarkAddEditForm;

implementation

uses CO_datamod_impl, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TCO_BookmarkAddEditForm.ActnAcceptExecute(Sender: TObject);
resourcestring
  BookmarkNameEmptyMsg = 'Əlfəcinin (Bookmark) adı daxil edilməyib';
  descriptionNameEmptyMsg = 'Təyinat daxil edilməyib';
begin

  if (DBLookupComboBox1.Text <> '') and (DBEdit3.Text <> '') then
  begin
    with CO_DataMod.Bookmarks do
      Post;
    ModalResult := mrOk;
  end
  else
  begin
    if DBLookupComboBox1.Text = '' then
      Showmessage('Təyinat daxil edilməyib');
    if DBEdit3.Text = '' then
      Showmessage('Əlfəcinin (Bookmark) adı daxil edilməyib');
    with CO_DataMod.Bookmarks do
      Cancel;
  end;

end;

procedure TCO_BookmarkAddEditForm.ActnRejectExecute(Sender: TObject);
begin
  with CO_DataMod.Bookmarks do
    Cancel;
  ModalResult := mrCancel;
end;

procedure TCO_BookmarkAddEditForm.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

end.

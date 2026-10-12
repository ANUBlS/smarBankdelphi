unit BookmarkSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ComCtrls, ActnList, ImgList, ToolWin, StdCtrls, Grids, DBGrids,
  Mask, DBCtrls, Dialogs;

type
  TCO_BookmarkSetup = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionList2: TActionList;
    ActionAddTemplare: TAction;
    ActionEditTemplate: TAction;
    ActionDeleteTemplate: TAction;
    ActionRfreshTemplate: TAction;
    ActionClose: TAction;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    ActnAddBookmark: TAction;
    ActnDeleteBookmark: TAction;
    ActnEditBookmark: TAction;
    ActnNewBookmark: TAction;
    ActnClose: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    OpenDlg: TOpenDialog;
    DBEdit1: TDBEdit;
    procedure ActionAddTemplareExecute(Sender: TObject);
    procedure ActionEditTemplateExecute(Sender: TObject);
    procedure ActionDeleteTemplateExecute(Sender: TObject);
    procedure ActionRfreshTemplateExecute(Sender: TObject);
    procedure ActnAddBookmarkExecute(Sender: TObject);
    procedure ActnEditBookmarkExecute(Sender: TObject);
    procedure ActnDeleteBookmarkExecute(Sender: TObject);
    procedure ActnNewBookmarkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_BookmarkSetup: TCO_BookmarkSetup;

implementation

uses CO_datamod_impl, CO_TemplateAddEditUnt, CO_BookmarkAddEditunt,
  SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TCO_BookmarkSetup.ActionAddTemplareExecute(Sender: TObject);
resourcestring
  rsTemplateCaption = 'Yeni şablon';
var
  i: integer;
begin
 // showmessage('1');
  with CO_DataMod.Templates do
    Insert;
  // CO_TemplAddEditForm.NLSLocalizer1.Caption:= rsTemplateCaption;
  // if not  assaig then
  CO_TemplAddEditForm := TCO_TemplAddEditForm.Create(self);
  i := CO_TemplAddEditForm.ShowModal;
  if i = mrOK then
  begin
    Refresh;
  end;
end;

procedure TCO_BookmarkSetup.ActionEditTemplateExecute(Sender: TObject);
resourcestring
  rsUpdTemplateCaption = 'Şablonun redaktəsi';
begin

  with CO_DataMod.Templates do
    Edit;
  // CO_TemplAddEditForm.NLSLocalizer1.Caption:=  rsUpdTemplateCaption;
   CO_TemplAddEditForm := TCO_TemplAddEditForm.Create(self);
  CO_TemplAddEditForm.ShowModal;
end;

procedure TCO_BookmarkSetup.ActionDeleteTemplateExecute(Sender: TObject);
resourcestring
  TempdeleteMsg = 'Silinsin?';
begin

  if MessageDlg(TempdeleteMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with CO_DataMod.Templates do
      Delete;
  end;

end;

procedure TCO_BookmarkSetup.ActionRfreshTemplateExecute(Sender: TObject);
begin
  with CO_DataMod.Templates do
  begin
    close;
    open;
  end;

end;

procedure TCO_BookmarkSetup.ActnAddBookmarkExecute(Sender: TObject);
resourcestring
  rsBookmarkCaption = 'Yeni';
var
  i: integer;
begin


  with CO_DataMod.Bookmarks do

    Insert;

  i := CO_BookmarkAddEditForm.ShowModal;

  // CO_BookmarkAddEditForm.NLSLocalizer1.Caption := rsBookmarkCaption;
  if i = mrOK then
  begin
    CO_DataMod.Bookmarks.Refresh;
  end;
end;

procedure TCO_BookmarkSetup.ActnEditBookmarkExecute(Sender: TObject);
resourcestring
  rsBookmarkUpdCaption = 'Redaktə';
begin
  with CO_DataMod.Bookmarks do
    Edit;
  // CO_BookmarkAddEditForm.NLSLocalizer1.Caption:=rsBookmarkUpdCaption;
  CO_BookmarkAddEditForm.ShowModal;
end;

procedure TCO_BookmarkSetup.ActnDeleteBookmarkExecute(Sender: TObject);
resourcestring
  BookmarkDelete = 'Silinsin?';
begin

  if MessageDlg(BookmarkDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with CO_DataMod.Bookmarks do
      Delete;
  end;
end;

procedure TCO_BookmarkSetup.ActnNewBookmarkExecute(Sender: TObject);
begin
  with CO_DataMod.Bookmarks do
  begin
    close;
    open;
  end;

end;

procedure TCO_BookmarkSetup.FormCreate(Sender: TObject);
begin

  SBTranslateProc.TranslateAllCompForms(self, sboapiDataModule.OrPack_SL);
end;

end.

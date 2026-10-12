unit BookMarkSetupFormImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TBookMarkSetupForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    DBGrid2: TDBGrid;
    OpenDlg: TOpenDialog;
    ActionList2: TActionList;
    ActionAddTemplare: TAction;
    ActionEditTemplate: TAction;
    ActionDeleteTemplate: TAction;
    ActionRfreshTemplate: TAction;
    ActionClose: TAction;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActnAddBookmark: TAction;
    ActnDeleteBookmark: TAction;
    ActnEditBookmark: TAction;
    ActnNewBookmark: TAction;
    ActnClose: TAction;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookMarkSetupForm: TBookMarkSetupForm;

implementation

uses DatModConstructionImpl, TemplAddEditFormİmpl, BookMarkAddEditFormImpl;

{$R *.dfm}

procedure TBookMarkSetupForm.ToolButton10Click(Sender: TObject);
begin
        with DatModConstruction.Bookmarks do
          begin
           Edit;
           BookMarkAddEditForm:=TBookMarkAddEditForm.Create(self);
           BookMarkAddEditForm.ShowModal;
          end;
end;

procedure TBookMarkSetupForm.ToolButton12Click(Sender: TObject);
resourcestring
           BookmarkDelete = 'Silinməsinə əminsiniz?';
    begin

      if MessageDlg( BookmarkDelete,
                     mtConfirmation,
                     [mbYes, mbNo],
                     0) = mrYes then
      begin
        with DatModConstruction.Bookmarks do
        Delete;
      end;

end;

procedure TBookMarkSetupForm.ToolButton1Click(Sender: TObject);
begin
        with DatModConstruction.Templates do
          begin
           Insert;
           TempAddEditForm:=TTempAddEditForm.Create(self);
           TempAddEditForm.ShowModal;
          end;

end;

procedure TBookMarkSetupForm.ToolButton3Click(Sender: TObject);
begin
         with DatModConstruction.Templates do
          begin
           Edit;
           TempAddEditForm:=TTempAddEditForm.Create(self);
           TempAddEditForm.ShowModal;
          end;
end;

procedure TBookMarkSetupForm.ToolButton5Click(Sender: TObject);
resourcestring
        TempdeleteMsg='Silinməsinə əminsiniz?';
begin
              if MessageDlg(
                   TempdeleteMsg,
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then
       begin
         with DatModConstruction.Templates do
               Delete;
        end;
end;

procedure TBookMarkSetupForm.ToolButton7Click(Sender: TObject);
begin
 with DatModConstruction.Templates do
 begin
   close;
   open;
 end;
end;

procedure TBookMarkSetupForm.ToolButton8Click(Sender: TObject);
begin
  with DatModConstruction.Bookmarks do begin
            Insert;
            BookmarkAddEditForm:=TBookmarkAddEditForm.Create(self);
            BookmarkAddEditForm.ShowModal;
            DatModConstruction.Bookmarks.Refresh;
  end;
end;

procedure TBookMarkSetupForm.ToolButton14Click(Sender: TObject);
begin
 with DatModConstruction.Bookmarks do
   begin
     close;
     open;
   end;
end;

end.

unit frmCategoriesImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, OracleData, ComCtrls, Grids, DBGridEh;

type
  TfrmCategories_new = class(TForm)
    Categories: TOracleDataSet;
    CategoriesCATEGORY: TWideStringField;
    DBGridEh1: TDBGridEh;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    CategoriesDatSrc: TDataSource;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategories_new: TfrmCategories_new;

implementation

{$R *.dfm}
    uses  sboapiDataModuleImpl;
procedure TfrmCategories_new.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then
   Categories.Delete;
end;

procedure TfrmCategories_new.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmCategories_new.FormCreate(Sender: TObject);
begin
  Categories.Open
end;

procedure TfrmCategories_new.FormDestroy(Sender: TObject);
begin
   Categories.CloseAll
end;

procedure TfrmCategories_new.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

end.

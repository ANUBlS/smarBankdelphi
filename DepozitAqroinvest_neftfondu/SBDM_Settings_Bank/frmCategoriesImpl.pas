unit frmCategoriesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, OracleData, ComCtrls, Grids, DBGridEh,
  NLSLocalizer;

type
  TfrmCategories = class(TForm)
    StatusBar1: TStatusBar;
    Categories: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGridEh1: TDBGridEh;
    CategoriesCATEGORY: TWideStringField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
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
  frmCategories: TfrmCategories;

implementation

{$R *.DFM}
uses  sboapiDataModuleImpl;

procedure TfrmCategories.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmCategories.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmCategories.FormCreate(Sender: TObject);
begin
   Categories.Open
end;

procedure TfrmCategories.FormDestroy(Sender: TObject);
begin
   Categories.CloseAll
end;

procedure TfrmCategories.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then
   Categories.Delete;
end;

end.

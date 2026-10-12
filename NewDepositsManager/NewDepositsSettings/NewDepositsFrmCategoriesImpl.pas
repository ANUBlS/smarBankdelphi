unit NewDepositsFrmCategoriesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, OracleData, ComCtrls, Grids, DBGridEh;


type
  TNewDepositsFrmCategories = class(TForm)
    Categories: TOracleDataSet;
    CategoriesCATEGORY: TWideStringField;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    CategoriesDatSrc: TDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
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
  NewDepositsFrmCategories: TNewDepositsFrmCategories;

implementation

{$R *.dfm}
    uses  sboapiDataModuleImpl;
procedure TNewDepositsFrmCategories.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then
   Categories.Delete;
end;

procedure TNewDepositsFrmCategories.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TNewDepositsFrmCategories.FormCreate(Sender: TObject);
begin
  Categories.Open
end;

procedure TNewDepositsFrmCategories.FormDestroy(Sender: TObject);
begin
   Categories.CloseAll
end;

procedure TNewDepositsFrmCategories.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

end.

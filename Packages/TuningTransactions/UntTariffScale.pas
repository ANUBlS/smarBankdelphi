unit UntTariffScale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DBCtrls,Db;

type
  TFormReferences = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GridGroups: TDBGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GridTariffs: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Splitter1: TSplitter;
    Panel3: TPanel;
    EditID: TEdit;
    EditName: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditIDChange(Sender: TObject);
    procedure EditIDExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReferences: TFormReferences;

implementation

uses DataModuleImpl, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormReferences.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormReferences.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then
   Close;
end;

procedure TFormReferences.EditIDKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then
   key :=#0
end;

procedure TFormReferences.EditIDChange(Sender: TObject);
var
  FName :string;
begin
  FName :=copy((Sender as TEdit).Name,5,Length((Sender as TEdit).Name));
  GridGroups.DataSource.DataSet.Locate(FName,(Sender as TEdit).Text,[loCaseInsensitive,loPartialKey]);
end;
procedure TFormReferences.EditIDExit(Sender: TObject);
begin
  with Sender as TEdit do
    Text := '';
end;

end.

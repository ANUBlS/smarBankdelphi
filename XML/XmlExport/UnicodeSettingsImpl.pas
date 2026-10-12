unit UnicodeSettingsImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TntDBGrids, StdCtrls, TntStdCtrls, Buttons,
  dbcgrids;

type
  TDecodingForm = class(TForm)
    btnClose: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SBAdd: TSpeedButton;
    DecodingGrid: TTntDBGrid;
    TntEdit11: TTntEdit;
    TntEdit2: TTntEdit;
    TntEditInvalidChar: TEdit;
    TntEditEquivalent: TTntEdit;
    TntEdit1: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecodingForm: TDecodingForm;

implementation

uses DataModuleImpl, DB;

{$R *.dfm}

procedure TDecodingForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btnClose.Click
end;

procedure TDecodingForm.SBAddClick(Sender: TObject);
var
  ValidCharCode ,InvalidCharCode : Integer;
  ValidChar : WideString;
begin
  InvalidCharCode := StrToInt(TntEditInvalidChar.Text);
  ValidChar := TntEditEquivalent.Text;
  ValidCharCode := ORD(ValidChar[1]);
  with DecodingGrid.DataSource.DataSet do
  begin
    Insert;
    FieldByName('InvalidCharCode').AsInteger :=InValidCharCode;
    FieldByName('ValidCharCode').AsInteger :=ValidCharCode;
    Post;
  end;
  TntEditEquivalent.Text := '';
  TntEditInvalidChar.Text:= '';
end;

end.

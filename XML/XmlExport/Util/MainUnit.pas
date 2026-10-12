unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, DBTables, Mask, DBCtrls, TntDBCtrls,
  ExtCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    SBBrowse: TSpeedButton;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    TableMain: TTable;
    DataSourceMain: TDataSource;
    TntDBEdit1: TTntDBEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    procedure SBBrowseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SBBrowseClick(Sender: TObject);
var
  P : Integer;
begin
  with OpenDialog1 do
  if Execute then
    Edit1.Text := FileName;

  with TableMain do
  begin
    if Active then Close;
    DatabaseName := ExtractFileDir(Edit1.Text);
    TableName := ExtractFileName(Edit1.Text);
    Open;
    with ComboBox1 ,Items do
    begin
      Clear;
      for P:=0 to Fields.Count - 1 do
      Add(Fields[P].DisplayName);
      ItemIndex := 0;
    end;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  P : Word;
  S : WideString;
begin
  S := TntDBEdit1.Text;
  P := StrToInt(Edit2.text);
  Edit3.Text := IntToStr(ORD(s[p]));
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  TntDBEdit1.DataField := ComboBox1.Text
end;

end.

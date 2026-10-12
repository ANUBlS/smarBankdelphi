unit unitsearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TFormSearch = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearch: TFormSearch;

implementation

uses UnitDataBussProc, Bizproces;

{$R *.dfm}

procedure TFormSearch.Button1Click(Sender: TObject);
begin


if edit2.Text='1'   then
Form10.Edit8.Text:=DataModule_bussProc.hesab1.fieldbyname('acc_no').asstring;
if edit2.Text='2'   then
Form10.Edit8.Text:=DataModule_bussProc.hesab1.fieldbyname('acc_no').asstring;
if edit2.Text='3'   then
Form10.Edit7.Text:=DataModule_bussProc.hesab2.fieldbyname('acc_no').asstring;
if edit2.Text='4'   then
Form10.Edit7.Text:=DataModule_bussProc.hesab2.fieldbyname('acc_no').asstring;


Form10.Edit1.Text:=DataModule_bussProc.hesab2.fieldbyname('filial').asstring;


 close;
end;

procedure TFormSearch.Button2Click(Sender: TObject);
begin
DataModule_bussProc.Hesab2.Filtered:=false;
Close;

end;

procedure TFormSearch.DBGrid1DblClick(Sender: TObject);
begin
button1.Click;
end;

procedure TFormSearch.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
   with DataModule_bussProc.Hesab2 do begin
   Filter := 'name = '''+AnsiUpperCase(edit1.Text)+('*')+'''';
  end;
  DataModule_bussProc.Hesab2.Filtered:=true;
end;

end;

procedure TFormSearch.FormShow(Sender: TObject);

var a:integer;
begin

DataModule_bussProc.Hesab2.Filtered:=false;
DataModule_bussProc.Hesab2.Filter:='';

DataModule_bussProc.Hesab2.CloseAll;
DataModule_bussProc.hesab1.CloseAll;
DataModule_bussProc.hesab1.ClearVariables;
DataModule_bussProc.Hesab2.ClearVariables;


if edit2.Text='1'   then
begin
a:=15010;
DataModule_bussProc.Hesab1.SetVariable('balcn',a);
DBGrid1.DataSource:=DataModule_bussProc.DataSource1;
end;

if edit2.Text='2'   then
begin
a:=15020;
DataModule_bussProc.Hesab1.SetVariable('balcn',a);
DBGrid1.DataSource:=DataModule_bussProc.DataSource1;
end;

if edit2.Text='3'   then
begin
 a:=45270;
 DataModule_bussProc.Hesab2.SetVariable('balcn',a);
 DBGrid1.DataSource:=DataModule_bussProc.Dshesab2;
end;


if edit2.Text='4'   then
begin
a:=45280;
DataModule_bussProc.Hesab2.SetVariable('balcn',a);
DBGrid1.DataSource:=DataModule_bussProc.Dshesab2;
end;



DataModule_bussProc.Hesab2.Open;
DataModule_bussProc.Hesab1.Open;
end;

end.

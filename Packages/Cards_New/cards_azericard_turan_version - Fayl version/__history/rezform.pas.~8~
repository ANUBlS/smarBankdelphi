unit rezform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Db, StdCtrls, Grids, DBGrids,oracledata;

type
  THesabatlar = class(TForm)
    ImageList1: TImageList;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Button2: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Hesabatlar: THesabatlar;
  tr:string;

implementation

uses Unit18, opencardunit, closecardunit,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}


procedure LoadPlugin(PluginName :String;PluginParam :String;PluginParam2 :String);
var PluginHandle :THandle;
    exportproc : procedure(s:String;k:String);
begin
   PluginHandle := LoadPackage(ExtractFilePath(Application.ExeName)+PluginName);

   if PluginHandle > 0 then
   begin
      @exportproc := GetProcAddress(PluginHandle,'InitPlugin');
      exportproc(PluginParam,PluginParam2);
   end;
end;


procedure THesabatlar.Edit1Change(Sender: TObject);
begin
  with DataMod_CARDS.hesabat do begin
   Filter := 'id = '''+edit1.Text+('*')+'''';
  end;
end;

procedure THesabatlar.Edit2Change(Sender: TObject);
begin
  with DataMod_CARDS.hesabat do begin
   Filter := 'HESABATLAR = '''+edit2.Text+('*')+'''';
  end;
end;

procedure THesabatlar.DBGrid1TitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (DBGrid1.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(DBGrid1.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure THesabatlar.Button2Click(Sender: TObject);
begin
tr:='13';
LoadPlugin('FileReport.bpl','card',tr);
//cards.Edit4.Text:=x;
end;

procedure THesabatlar.DBGrid1DblClick(Sender: TObject);
begin
Button1.Click;
end;

procedure THesabatlar.Button1Click(Sender: TObject);
begin

IF DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=1 then
opencards.showmodal;
IF DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=2 then
closecards.showmodal;
if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=3 then
//begin
LoadPlugin('FileReport.bpl','FileReport',tr);

if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=4 then
LoadPlugin('FileReport.bpl','KorrReport','');
if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=5 then
LoadPlugin('FileReport.bpl','Hesab','');

if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=6 then
LoadPlugin('FileReport.bpl','EXCELS','');

if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=7 then
LoadPlugin('FileReport.bpl','EXPIRY','');

if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=8 then
LoadPlugin('FileReport.bpl','OP','');


//if DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger=8 then
//LoadPlugin('FileReport.bpl','REZ');


end;

procedure THesabatlar.FormCreate(Sender: TObject);
begin
opencards:=Topencards.Create(Self);
closecards:=Tclosecards.Create(Self);
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

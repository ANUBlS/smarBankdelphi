unit UntTaxPercents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCGrids, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Db, OracleData,
  ExtCtrls, Excel97, OleServer;

type
  TFrmTaxPercents = class(TForm)
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    DBTaxPercents: TDBGrid;
    Panel1: TPanel;
    LabelPrint: TLabel;
    EName: TEdit;
    EFirst_Price: TEdit;
    EAllTaxAmort: TEdit;
    ETaxAmort: TEdit;
    CBGroups: TComboBox;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EFPrice: TEdit;
    EBPrice: TEdit;
    EAmort: TEdit;
    ERest: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ENameExit(Sender: TObject);
    procedure ENameChange(Sender: TObject);
    procedure CBGroupsChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelPrintClick(Sender: TObject);
    procedure LabelPrintMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Rate :array of integer;
    procedure PustToComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
  end;

var
  FrmTaxPercents: TFrmTaxPercents;

implementation

uses MFDataModule, UntMainFacilitiesImpl;

{$R *.DFM}

procedure TFrmTaxPercents.FormCreate(Sender: TObject);
begin
 with DBTaxPercents.DataSource.DataSet do
  if not Active then Open;
 with MainFacilities,MainFDataModule do
  PustToComboID(ODSGroupFilter,'Name','ID',CBGroups);
end;

procedure TFrmTaxPercents.FormDestroy(Sender: TObject);
begin
 with MainFDataModule.ODSTaxPercents do
  begin
   //Close;
   SQL.Clear;
   SQL.Text :='Select * From Wares Order by Balance_price';
   //Open;
  end;
 //TOracleDataSet(DBTaxPercents.DataSource.DataSet).CloseAll;
 SetLength(rate,0);
end;

procedure TFrmTaxPercents.ENameExit(Sender: TObject);
begin
  with Sender as TEdit do
    Text := '';
end;

procedure TFrmTaxPercents.PustToComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
var
   RateIndex :Integer;
   SavePlace :Pointer;
begin
 RateIndex :=0;
 with DataSet do
  begin
   SavePlace :=GetBookmark;
   if Active = false then Open;
   SetLength(Rate,RecordCount);
   ComboBox.Items.Clear;
   ComboBox.Items.Add('Áöòöí ãðóïëàð');
   try
    DisableControls;
    First;
     while not(Eof) do
      begin
       ComboBox.Items.Add(FieldByName(Field).AsString);
       Rate[RateIndex] :=FieldByName(IDfield).AsInteger;
       Next;
       Inc(RateIndex);
      end;
   finally
    GotoBookmark(SavePlace);
    FreeBookmark(SavePlace);
    EnableControls;
   end;
  end;
end;

procedure TFrmTaxPercents.ENameChange(Sender: TObject);
var
  FName :string;
begin
  FName :=copy((Sender as TEdit).Name,2,Length((Sender as TEdit).Name));
  DBTaxPercents.DataSource.DataSet.Locate(FName,(Sender as TEdit).Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmTaxPercents.CBGroupsChange(Sender: TObject);
var
  FirstPrice, BalancePrice :real;
  AllTaxAmort ,TaxAmort :real;
  GroupsID  :Longint;
begin
 if (Sender as TComboBox).ItemIndex = 0 then
  with MainFDataModule.ODSTaxPercents do
   begin
    Close;
    SQL.Clear;
    SQL.Text :='Select * From Wares Order by ID,Balance_price';
    Open;
   end
 else
  with MainFDataModule.ODSTaxPercents do
   begin
    Close;
    SQL.Clear;
    SQL.Text :='Select * From Wares Where GroupsID='+IntToStr(Rate[(Sender as TComboBox).ItemIndex-1])+' Order by ID,Balance_price';
    Open;
   end;
   GroupsID :=Rate[(Sender as TComboBox).ItemIndex-1];
   with MainFacilities do
    SumGroupDetailsForTax(GroupsID,FirstPrice, BalancePrice ,AllTaxAmort ,TaxAmort );

   EFPrice.text := FormatFloat('#,##.00',Firstprice);
   EBPrice.text := FormatFloat('#,##.00',Balanceprice);
   EAmort.text := FormatFloat('#,##.00',AllTaxAmort);
   ERest.text := FormatFloat('#,##.00',TaxAmort);
end;

procedure TFrmTaxPercents.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   V,Sheet,Sheets  :variant;
   cell,row,i,j    : Integer;
begin
 if (key = VK_ESCAPE) then  Close;
 if (key = VK_F2) then
  begin
   try
    V:=ExcelApplication1.Application;
    ExcelApplication1.Connect;
    ExcelApplication1.Visible[0]:=True;
    V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
    Sheet := V.Workbooks[1].Worksheets['Tax'];
    Sheets := V.Sheets;
    Sheets.Item['Tax'].Activate;
    Sheets.Item['Tax'].Range['A6:CA99'].Clear;
    Sheets.Item['Tax'].Range['A6:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
    Sheets.Item['Tax'].Range['A6:CA99'].Font.Name := 'Arial AzLat';
    Sheets.Item['Tax'].Range['A6:CA99'].Font.Size := 10;
    row:=6;
    cell:=1;
    MainFDataModule.ODSTaxPercents.First;
    for j:=1 to MainFDataModule.ODSTaxPercents.RecordCount do
     begin
      cell:=1;
      for i:=0 to MainFDataModule.ODSTaxPercents.FieldCount-4 do
       begin
        sheet.cells[row,cell].Borders.weight:=2;
        Sheet.cells[row,cell]:=MainFDataModule.ODSTaxPercents.Fields[i].AsString;
        cell:=cell+1;
       end;
      row:=row+1;
      MainFDataModule.ODSTaxPercents.Next;
     end;
   finally
    V:=null;
    ExcelApplication1.Disconnect;
   end;
 end;
end;

procedure TFrmTaxPercents.LabelPrintClick(Sender: TObject);
var
   V,Sheet,Sheets  :variant;
   cell,row,i,j    : Integer;
begin
   try
    V:=ExcelApplication1.Application;
    ExcelApplication1.Connect;
    ExcelApplication1.Visible[0]:=True;
    V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
    Sheet := V.Workbooks[1].Worksheets['Tax'];
    Sheets := V.Sheets;
    Sheets.Item['Tax'].Activate;
    Sheets.Item['Tax'].Range['A6:CA99'].Clear;
    Sheets.Item['Tax'].Range['A6:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
    Sheets.Item['Tax'].Range['A6:CA99'].Font.Name := 'Arial AzLat';
    Sheets.Item['Tax'].Range['A6:CA99'].Font.Size := 10;
    row:=6;
    cell:=1;
    MainFDataModule.ODSTaxPercents.First;
    for j:=1 to MainFDataModule.ODSTaxPercents.RecordCount do
     begin
      cell:=1;
      for i:=0 to MainFDataModule.ODSTaxPercents.FieldCount-4 do
       begin
        sheet.cells[row,cell].Borders.weight:=2;
        Sheet.cells[row,cell]:=MainFDataModule.ODSTaxPercents.Fields[i].AsString;
        cell:=cell+1;
       end;
      row:=row+1;
      MainFDataModule.ODSTaxPercents.Next;
     end;
   finally
    V:=null;
    ExcelApplication1.Disconnect;
   end;
end;

procedure TFrmTaxPercents.LabelPrintMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TLabel).Font.Color :=clBlue;
end;

procedure TFrmTaxPercents.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 LabelPrint.Font.Color :=clWindowText;
end;

end.

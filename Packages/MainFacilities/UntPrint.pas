unit UntPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Excel97, OleServer,OracleData;

type
  TFrmPrint = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RBWares: TRadioButton;
    RBGroups: TRadioButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    CBGroupsFilter: TComboBox;
    RBDepartments: TRadioButton;
    RBDifferenceReport: TRadioButton;
    CHBCopyOff: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure RBWaresClick(Sender: TObject);
    procedure RBGroupsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBGroupsFilterChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RBDepartmentsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Rate : array of longint;
    HeadDescription: String;
    procedure PustToComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
    procedure DifferenceReport;
  end;

var
  FrmPrint: TFrmPrint;

implementation

uses MFDataModule, UntMainFacilitiesImpl, UntRptMainF, UntDifferenceReport;

{$R *.DFM}

procedure TFrmPrint.BitBtn1Click(Sender: TObject);
 resourcestring
  InformationMessage =
    '"%s" тарихин€ €сас в€саитл€р щаггында м€лумат ';

var
   V,Sheet,Sheets  :variant;
   cell,row,i,j    : Integer;
   FieldValue      :string;
   FirstPrice, BalancePrice :real;
   AllAmort ,Remainder :real;
begin
if RBGroups.Checked then
 BEGIN
  MainFDataModule.ExcelPreviewGroups.Open;
  V:=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=True;
  V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
  Sheet := V.Workbooks[1].Worksheets['Group'];
  Sheets := V.Sheets;
  Sheets.Item['Group'].Activate;
  Sheets.Item['Group'].Range['A5:CA99'].Clear;
  Sheets.Item['Group'].Range['A5:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['Group'].Range['A5:CA99'].Font.Name := 'Arial AzLat';
  Sheets.Item['Group'].Range['A5:CA99'].Font.Size := 10;
  row:=5;
  cell:=1;
  MainFDataModule.ExcelPreviewGroups.First;
  for j:=1 to MainFDataModule.ExcelPreviewGroups.RecordCount do
   begin
    cell:=1;
    for i:=1 to MainFDataModule.ExcelPreviewGroups.FieldCount-1 do
     begin
      sheet.cells[row,cell].Borders.weight:=2;
      Sheet.cells[row,cell]:=MainFDataModule.ExcelPreviewGroups.Fields[i].AsString;
      cell:=cell+1;
     end;
    row:=row+1;
    MainFDataModule.ExcelPreviewGroups.Next;
   end;
  V :=null;
  ExcelApplication1.Disconnect;
  MainFDataModule.ExcelPreviewGroups.Close;
 END;
 //***********************************************************
if RBWares.Checked then
 BEGIN
  with MainFDataModule do
   begin
    M1.Close;
    if CBGroupsFilter.ItemIndex =0 then
      M1.SQL[7] :=''
    else
     M1.SQL[7] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    M1.Open;
    R1.Close;
    if CBGroupsFilter.ItemIndex =0 then
     R1.SQL[7] :=''
    else
     R1.SQL[7] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    R1.Open;
    ExcelPreviewCurrent.Close;
    if CBGroupsFilter.ItemIndex =0 then
     ExcelPreviewCurrent.SQL[15] :=''
    else
     ExcelPreviewCurrent.SQL[15] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    ExcelPreviewCurrent.Open;
    ExcelPreviewCopyOff.Close;
    if CBGroupsFilter.ItemIndex =0 then
     ExcelPreviewCopyOff.SQL[24] :=' Where not out_num is null  '
    else
     ExcelPreviewCopyOff.SQL[24] :=' Where not out_num is null and GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    ExcelPreviewCopyOff.Open;
   end;
  V:=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=True;
  V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
  Sheet := V.Workbooks[1].Worksheets['Main'];
  Sheets := V.Sheets;
  Sheets.Item['Main'].Activate;
  Sheets.Item['Main'].Range['A6:CA99'].Clear;
  Sheets.Item['Main'].Range['A6:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['Main'].Range['A6:CA99'].Font.Name := 'Arial AzLat';
  Sheets.Item['Main'].Range['A6:CA99'].Font.Size := 8;
  row:=6;
  cell:=1;
  sheet.cells[1,5] :=CBGroupsFilter.Text;
  For j:=1 to MainFDataModule.ExcelPreviewCurrent.RecordCount  do
    BEGIN
     cell:=1;
     For i:=0 to MainFDataModule.ExcelPreviewCurrent.FieldCount-1 do
        begin
         FieldValue :=MainFDataModule.ExcelPreviewCurrent.Fields[i].AsString;
         sheet.cells[row,cell].Borders.weight :=2;
         sheet.cells[row,cell] :=FieldValue;
         cell :=cell+1;
        end;
      row :=row+1;
      MainFDataModule.ExcelPreviewCurrent.Next;
   END;
 if CHBCopyOff.Checked then
 BEGIN
  For j :=1 to MainFDataModule.ExcelPreviewCopyOff.RecordCount  do
   BEGIN
     cell :=1;
     For i :=0 to MainFDataModule.ExcelPreviewCopyOff.FieldCount-1 do
        begin
         FieldValue :=MainFDataModule.ExcelPreviewCopyOff.Fields[i].AsString;
         sheet.cells[row,cell].Borders.weight :=2;
         sheet.cells[row,cell] :=FieldValue;
         cell :=cell+1;
        end;
      row:=row+1;
      MainFDataModule.ExcelPreviewCopyOff.Next;
   END;
 END;
   with MainFacilities,MainFDataModule.ViewGroup do
    SumGroupDetails(Self.Rate[CBGroupsFilter.ItemIndex],FirstPrice, BalancePrice ,AllAmort ,Remainder);

    Sheet.cells[row,7].Font.Size :=12;
    Sheet.cells[row,7] :=FloatToStr(FirstPrice);
    Sheet.cells[row,11].Font.Size :=12;
    Sheet.cells[row,11] :=FloatToStr(AllAmort);

    Sheet.cells[row+2,2].Font.Size :=12;
    Sheet.cells[row+2,4].Font.Size :=12;
    Sheet.cells[row+3,2].Font.Size :=12;
    Sheet.cells[row+3,4].Font.Size :=12;
    Sheet.cells[row+2,2] :='»лкин д€й€рл€р: ';
    Sheet.cells[row+2,4] :=FloatToStr(FirstPrice);
    Sheet.cells[row+3,2] :='…ыьылмыш амортизасийа: ';
    Sheet.cells[row+3,4] :=FloatToStr(AllAmort);
   V :=null;
   ExcelApplication1.Disconnect;
   MainFDataModule.ExcelPreviewCurrent.Close;
   MainFDataModule.ExcelPreviewCopyOff.Close;
  END;

  if RBDepartments.Checked then
    with MainFDataModule.ODSDepartmentsPrint,RptDepartments do
     begin
      if CBGroupsFilter.ItemIndex=0 then
       SQL[4] :=''
      else
       SQL[4] :='Where sector_cod ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);

      if Active then Close;
       Open;
       QRMainName.Caption :=CBGroupsFilter.Text;
       QRDateFormat.Caption :=Format(
         InformationMessage,[FormatDateTime('dd-mmm-yyyy',MainFacilities.GetPresentDate)]);
       Preview;
     end;

 if RBDifferenceReport.Checked then
   DifferenceReport;
end;


procedure TFrmPrint.RBWaresClick(Sender: TObject);
begin
 CBGroupsFilter.Enabled :=(Sender as TRadioButton).Checked;
  if Assigned(Rate) then SetLength(Rate,0);
  HeadDescription :='Ѕцтцн ¬€саитл€р ÷зр€';
   with MainFacilities,MainFDataModule do
    PustToComboID(ODSGroupFilter,'Name','ID',CBGroupsFilter);
end;

procedure TFrmPrint.RBGroupsClick(Sender: TObject);
begin
 CBGroupsFilter.Enabled :=not(Sender as TRadioButton).Checked;
end;

procedure TFrmPrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then Close;
end;

procedure TFrmPrint.PustToComboID(DataSet :TOracleDataSet; Field,IDfield :String; ComboBox :TComboBox);
var
   RateIndex :Integer;
   SavePlace :Pointer;
begin
 RateIndex :=0;
 with DataSet do
  begin
   if Active = false then Open;
   SavePlace :=GetBookmark;
   SetLength(Rate,RecordCount);
   ComboBox.Items.Clear;
   ComboBox.Items.Add(HeadDescription);
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

procedure TFrmPrint.DifferenceReport;
var
  SqlStr  :WideString;
begin
 with MainFDataModule.OPViewWares do
  SqlStr :=CallStringFunction('DifferenceReport',[]);
 try
  RPTDifferenceReport :=TRPTDifferenceReport.Create(self);

   with MainFDataModule.ODSDifferenceReport do
    begin
     if Active = True then CloseAll;
     SetVariable('AStrParam',SqlStr);
     Open;
    end;
    
  RPTDifferenceReport.QRReportTitle.Caption :=FormatDateTime('dd-mmm-yyyy',MainFacilities.GetPresentDate);
  RPTDifferenceReport.Preview;
 finally
  RPTDifferenceReport.Free;
 end;
end;

procedure TFrmPrint.CBGroupsFilterChange(Sender: TObject);
begin
 //ShowMessage(inttostr(CBGroupsFilter.Itemindex)+'  '+Inttostr(Rate[CBGroupsFilter.ItemIndex]))
end;

procedure TFrmPrint.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmPrint.RBDepartmentsClick(Sender: TObject);
begin
 CBGroupsFilter.Enabled :=(Sender as TRadioButton).Checked;
 if Assigned(Rate) then SetLength(Rate,0);
  HeadDescription :='÷муми Ѕанк ÷зр€';
  with MainFacilities,MainFDataModule do
   PustToComboID(ODSDepartments,'Department','ID',CBGroupsFilter);
end;

procedure TFrmPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Assigned(Rate) then
    SetLength(Rate,0);
end;

procedure TFrmPrint.Button1Click(Sender: TObject);
 resourcestring
  InformationMessage =
    '"%s" тарихин€ €сас в€саитл€р щаггында м€лумат ';

var
   V,Sheet,Sheets  :variant;
   cell,row,i,j    : Integer;
   FieldValue      :string;
   FirstPrice, BalancePrice :real;
   AllAmort ,Remainder :real;
begin
if RBGroups.Checked then
 BEGIN
  MainFDataModule.ExcelPreviewGroups.Open;
  V:=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=True;
  V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
  Sheet := V.Workbooks[1].Worksheets['Group'];
  Sheets := V.Sheets;
  Sheets.Item['Group'].Activate;
  Sheets.Item['Group'].Range['A5:CA99'].Clear;
  Sheets.Item['Group'].Range['A5:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['Group'].Range['A5:CA99'].Font.Name := 'Arial AzLat';
  Sheets.Item['Group'].Range['A5:CA99'].Font.Size := 10;
  row:=5;
  cell:=1;
  MainFDataModule.ExcelPreviewGroups.First;
  for j:=1 to MainFDataModule.ExcelPreviewGroups.RecordCount do
   begin
    cell:=1;
    for i:=1 to MainFDataModule.ExcelPreviewGroups.FieldCount-1 do
     begin
      sheet.cells[row,cell].Borders.weight:=2;
      Sheet.cells[row,cell]:=MainFDataModule.ExcelPreviewGroups.Fields[i].AsString;
      cell:=cell+1;
     end;
    row:=row+1;
    MainFDataModule.ExcelPreviewGroups.Next;
   end;
  V :=null;
  ExcelApplication1.Disconnect;
  MainFDataModule.ExcelPreviewGroups.Close;
 END;
 //***********************************************************
if RBWares.Checked then
 BEGIN
  with MainFDataModule do
   begin
    M1.Close;
    if CBGroupsFilter.ItemIndex =0 then
      M1.SQL[7] :=''
    else
     M1.SQL[7] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    M1.Open;
    R1.Close;
    if CBGroupsFilter.ItemIndex =0 then
     R1.SQL[7] :=''
    else
     R1.SQL[7] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    R1.Open;
    ExcelPreviewCurrent.Close;
    if CBGroupsFilter.ItemIndex =0 then
     ExcelPreviewCurrent.SQL[15] :=''
    else
     ExcelPreviewCurrent.SQL[15] :='where  GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    ExcelPreviewCurrent.Open;
    ExcelPreviewCopyOff.Close;
    if CBGroupsFilter.ItemIndex =0 then
     ExcelPreviewCopyOff.SQL[24] :=' Where not out_num is null  '
    else
     ExcelPreviewCopyOff.SQL[24] :=' Where not out_num is null and GroupsID ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);
    ExcelPreviewCopyOff.Open;
   end;
  V:=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0]:=True;
  V.Workbooks.Open(ExtractFilePath(ParamStr(0))+ '/Wares.xls');
  Sheet := V.Workbooks[1].Worksheets['Main'];
  Sheets := V.Sheets;
  Sheets.Item['Main'].Activate;
  Sheets.Item['Main'].Range['A6:CA99'].Clear;
  Sheets.Item['Main'].Range['A6:CA99'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['Main'].Range['A6:CA99'].Font.Name := 'Arial AzLat';
  Sheets.Item['Main'].Range['A6:CA99'].Font.Size := 8;
  row:=6;
  cell:=1;
  sheet.cells[1,5] :=CBGroupsFilter.Text;
  For j:=1 to MainFDataModule.ExcelPreviewCurrent.RecordCount  do
    BEGIN
     cell:=1;
     For i:=0 to MainFDataModule.ExcelPreviewCurrent.FieldCount-1 do
        begin
         FieldValue :=MainFDataModule.ExcelPreviewCurrent.Fields[i].AsString;
         sheet.cells[row,cell].Borders.weight :=2;
         sheet.cells[row,cell] :=FieldValue;
         cell :=cell+1;
        end;
      row :=row+1;
      MainFDataModule.ExcelPreviewCurrent.Next;
   END;
 if CHBCopyOff.Checked then
 BEGIN
  For j :=1 to MainFDataModule.ExcelPreviewCopyOff.RecordCount  do
   BEGIN
     cell :=1;
     For i :=0 to MainFDataModule.ExcelPreviewCopyOff.FieldCount-1 do
        begin
         FieldValue :=MainFDataModule.ExcelPreviewCopyOff.Fields[i].AsString;
         sheet.cells[row,cell].Borders.weight :=2;
         sheet.cells[row,cell] :=FieldValue;
         cell :=cell+1;
        end;
      row:=row+1;
      MainFDataModule.ExcelPreviewCopyOff.Next;
   END;
 END;
   with MainFacilities,MainFDataModule.ViewGroup do
    SumGroupDetails(Self.Rate[CBGroupsFilter.ItemIndex],FirstPrice, BalancePrice ,AllAmort ,Remainder);

    Sheet.cells[row,7].Font.Size :=12;
    Sheet.cells[row,7] :=FloatToStr(FirstPrice);
    Sheet.cells[row,11].Font.Size :=12;
    Sheet.cells[row,11] :=FloatToStr(AllAmort);

    Sheet.cells[row+2,2].Font.Size :=12;
    Sheet.cells[row+2,4].Font.Size :=12;
    Sheet.cells[row+3,2].Font.Size :=12;
    Sheet.cells[row+3,4].Font.Size :=12;
    Sheet.cells[row+2,2] :='»лкин д€й€рл€р: ';
    Sheet.cells[row+2,4] :=FloatToStr(FirstPrice);
    Sheet.cells[row+3,2] :='…ыьылмыш амортизасийа: ';
    Sheet.cells[row+3,4] :=FloatToStr(AllAmort);
   V :=null;
   ExcelApplication1.Disconnect;
   MainFDataModule.ExcelPreviewCurrent.Close;
   MainFDataModule.ExcelPreviewCopyOff.Close;
  END;

  if RBDepartments.Checked then
    with MainFDataModule.ODSDepartmentsPrint,RptDepartments do
     begin
      if CBGroupsFilter.ItemIndex=0 then
       SQL[4] :=''
      else
       SQL[4] :='Where sector_cod ='+IntToStr(Rate[CBGroupsFilter.ItemIndex-1]);

      if Active then Close;
       Open;
       QRMainName.Caption :=CBGroupsFilter.Text;
       QRDateFormat.Caption :=Format(
         InformationMessage,[FormatDateTime('dd-mmm-yyyy',MainFacilities.GetPresentDate)]);
       Preview;
     end;

 if RBDifferenceReport.Checked then
   DifferenceReport;
end;

procedure TFrmPrint.Button2Click(Sender: TObject);
begin
 Close;
end;

end.

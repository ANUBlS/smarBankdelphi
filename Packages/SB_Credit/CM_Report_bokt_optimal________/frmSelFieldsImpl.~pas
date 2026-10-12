unit frmSelFieldsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ExtCtrls,Excel97,DB, NLSLocalizer,Oracle,oracledata,
  ActnList,OleServer;

const
  LCID : DWORD = LOCALE_SYSTEM_DEFAULT;

type

  TFileFormat = (ffXLS, ffHTM, ffCSV, ffXL97);
  TStyleColumnWidth = (cwDefault, cwOwnerWidth, cwAutoFit);
  TBorderWeight = (bwThin, bwMedium, bwThick);
  TBorderLineStyle = (blNone, blDash, blLine, blDoubleLine);
  TSummarySelection = (ssNone, ssValues, ssGiven);
  TSummaryCalculation = (scSUM, scMIN, scMAX);
  TConnectTo = (ctNewInstance, ctNewBook, ctExistBook);

  TCellBorder = class(TPersistent)
  private
    FBackColor : TColor;
    FBorderColor : TColor;
    FBorderWeight : TBorderWeight;
    FBorderLineStyle : TBorderLineStyle;
  published
    property BackColor : TColor read FBackColor write FBackColor default clWhite;
    property BorderColor : TColor read FBorderColor write FBorderColor default clBlack;
    property Weight : TBorderWeight read FBorderWeight write FBorderWeight default bwMedium;
    property LineStyle : TBorderLineStyle read FBorderLineStyle write FBorderLineStyle default blNone;
  end;


  TfrmSelFields = class(TForm)
    Panel1: TPanel;
    CheckExportList: TCheckListBox;
    Button1: TButton;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    NLSLocalizer1: TNLSLocalizer;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    function GetColumnCharacters(IntNumber : Integer) : String;
    procedure ExportFieldData(Dataset :TOracleDataSet);
    procedure ExportTitles(Dataset:TOracleDataSet);
    procedure ExportDataset(Dataset:TOracleDataSet);
    procedure Connect;
    procedure InitWorksheet(const SheetName : String);
    function SheetExist(const SheetName : String) : Boolean;
    procedure ShowExcel;
    procedure Disconnect;
    procedure SetFontAndBorderRange(DelphiFont : TFont; Border : TCellBorder; StrBeginCell, StrEndCell : String);
  public
    ExportList: TStrings;
    ExportedFieldsCount :integer;
    FFieldNames :TStringList;
    FExcelWorksheet :TExcelWorksheet;
    FExcelApplication :TExcelApplication;
    FExcelWorkbook :TExcelWorkbook;
    FWorksheets :TStringList;
    FFontTitles :TFont;
    FBorderTitles : TCellBorder;
    FFontOrientationTitles : Integer;
    FFontData : TFont;
    FBorderData : TCellBorder;
  end;

var
  frmSelFields: TfrmSelFields;

implementation

{$R *.DFM}
uses MISImpl, MISDmImpl,ComObj, ActiveX;

function TfrmSelFields.GetColumnCharacters(IntNumber : Integer) : String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 702 then
      Result:='ZZ'
    else
    begin
      if IntNumber > 26 then begin
       if (IntNumber mod 26)=0 then
        Result:=Chr(64 + (IntNumber div 26)-1)
       else
        Result:=Chr(64 + (IntNumber div 26));
         if (IntNumber mod 26)=0 then
          result:=result+chr(64+26)
         else
          result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

procedure TfrmSelFields.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TfrmSelFields.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(key) = VK_ESCAPE then Close
end;

procedure TfrmSelFields.CheckBox1Click(Sender: TObject);
var
   i, icount: integer;
   IsChecked: boolean;
begin
 IsChecked :=TCheckBox(Sender).Checked;
 with CheckExportList do
  begin
   icount :=Items.Count;
   for  i:=0 to icount-1 do
    Checked[i] :=IsChecked;
  end;
end;

procedure TfrmSelFields.FormShow(Sender: TObject);

//var
//  i: Integer;
begin
 
 {with  CheckExportList.Items, MISForm do
  begin
  //  ExportedFieldsCount := MISData.FieldCount;
    Clear;
    for i := 0  to ExportedFieldsCount - 1  do
     begin
      Add(MISData.Fields[i].DisplayName);
      CheckExportList.Checked[i] := True;
     end;
  end; }
end;

procedure TfrmSelFields.FormCreate(Sender: TObject);
begin
  ExportList :=TStringList.Create;
  FFieldNames :=TStringList.Create;
  FExcelWorksheet := TExcelWorksheet.Create(Self);
  FExcelApplication := TExcelApplication.Create(Self);
  FExcelWorkbook := TExcelWorkbook.Create(Self);
  FWorksheets :=TStringList.Create;

  FFontTitles := TFont.Create;
  FFontTitles.Name := 'Azl Sans Serif';
  
  FBorderTitles := TCellBorder.Create;
  FBorderTitles.FBorderWeight := bwMedium;
  FBorderTitles.FBorderLineStyle := blNone;
  FFontOrientationTitles :=0;

  FFontData := TFont.Create;
  FFontData.Name := 'Azl Sans Serif';

  FBorderData := TCellBorder.Create;
  FBorderTitles.FBackColor := clWhite;
  FBorderTitles.FBorderColor := clBlack;
  FBorderTitles.FBorderWeight := bwMedium;
  FBorderTitles.FBorderLineStyle := blNone;

  FBorderData.FBackColor := clWhite;
  FBorderData.FBorderColor := clBlack;
  FBorderData.FBorderWeight := bwMedium;
  FBorderData.FBorderLineStyle := blNone;

end;

procedure TfrmSelFields.ExportTitles(Dataset:TOracleDataSet);
var
  IntColumn : Integer;
  StrCell : String;
  StrColumn : String;
  xlStrColumn : String;
begin
  with Dataset do
  begin
    FFieldNames.Clear;
    //FColumnCharacters.Clear;

    for IntColumn := 1 to Fields.Count do
    begin

        if CheckExportList.Checked[IntColumn - 1] then
        begin
          FFieldNames.Add(Fields[IntColumn - 1].FieldName);
        //FColumnCharacters.Add(StrColumn);

        StrColumn := GetColumnCharacters(FFieldNames.Count);
        StrCell:=StrColumn+'1';
        xlStrColumn := StrColumn + ':' + StrColumn;

                    // Formatting Colums
        case  Fields[IntColumn - 1].DataType of
            ftString :
              FExcelWorksheet.Range[xlStrColumn,EmptyParam].NumberFormat :='@';
            ftSmallint ,ftInteger ,ftWord :
              FExcelWorksheet.Range[xlStrColumn,EmptyParam].NumberFormat :=TNumericField(Fields[IntColumn - 1]).DisplayFormat;
            ftFloat ,ftCurrency ,ftBCD :
              FExcelWorksheet.Range[xlStrColumn,EmptyParam].NumberFormat :=TNumericField(Fields[IntColumn - 1]).DisplayFormat;
              //'#,##0.00';
            ftDate ,ftTime ,ftDateTime :
              FExcelWorksheet.Range[xlStrColumn,EmptyParam].NumberFormat :='[$-409]d-mmm-yyyy;@';
            ftBoolean : ;
        end; // Case

        // Use DisplayName of column if this is filled in, otherwise use FieldName
        if Fields[IntColumn - 1].DisplayName <> '' then
          FExcelWorksheet.Range[StrCell,StrCell].Value := Fields[IntColumn - 1].DisplayName
        else
          FExcelWorksheet.Range[StrCell,StrCell].Value := Fields[IntColumn - 1].FieldName;
    end;
    end;

  end;
  SetFontAndBorderRange(FFontTitles, FBorderTitles, 'A1', GetColumnCharacters(FFieldNames.Count)+'1');
end;


procedure TfrmSelFields.ExportFieldData(Dataset:TOracleDataSet);
var
  FRecordNo,Dummy,IntColumn : Integer;
  PtBookmark : TBookmark;
  VarValue : Variant;
  Matrix : Variant;
  FName :string;

begin
  FRecordNo := 0;

 with DataSet, CheckExportList do
  begin
   FFieldNames.Clear;
   for Dummy :=0 to FieldCount -1 do
    if  Checked[Dummy]  then
     begin
      FName :=Fields[Dummy].Name;
      System.Delete(FName,1,7);
      FFieldNames.Add(FName);
     end;
  end;

  with Dataset do
  begin
    DisableControls;
    PtBookmark := GetBookmark;
    try

      Matrix := VarArrayCreate([1,Dataset.RecordCount,1,(FFieldNames.Count)],varVariant);;
      //VarArrayCreate([1,Dataset.RecordCount,1,FFieldNames.Count],varVariant);
      VarArrayLock(Matrix);

      First;
      while not EOF do
      begin
        Inc(FRecordNo);

        for IntColumn := 1 to FFieldNames.Count do
        begin
          VarValue := FieldByName(FFieldNames[IntColumn-1]).AsVariant;
          Matrix[FRecordNo,IntColumn] := VarValue;
        end;

        Next;
      end;

      FExcelWorksheet.Range['A2',GetColumnCharacters(FFieldNames.Count)+IntToStr(FRecordNo+1)].Value := Matrix;

    finally
      VarArrayUnLock(Matrix);
      VarClear(Matrix);
      GotoBookmark(PtBookmark);
      FreeBookmark(PtBookmark);
      EnableControls;
    end;
  end;

  SetFontAndBorderRange(FFontData, FBorderData, 'A2', GetColumnCharacters(FFieldNames.Count)+IntToStr(FRecordNo + 1));

end;


procedure TfrmSelFields.ExportDataset(Dataset:TOracleDataSet);
begin

  with Dataset do
  if not Active then
    Exit;

   Connect;

    Screen.Cursor := crHourGlass;
    try
    
      FExcelApplication.ScreenUpdating[LCID] := False;

      InitWorksheet('MIS');

      ExportTitles(DataSet);
      ExportFieldData(DataSet);
      ShowExcel;

    finally
      Disconnect;
      Screen.Cursor := crDefault;
    end;

end;

procedure TfrmSelFields.ShowExcel;
begin
  FExcelApplication.ScreenUpdating[LCID] := True;
  FExcelApplication.Visible[LCID]:=True;
end;

procedure TfrmSelFields.InitWorksheet(const SheetName : String);
begin
  if not SheetExist('MIS') then
  begin
    // Create new worksheet and give him SheetName
    FExcelWorksheet.ConnectTo((FExcelWorkbook.WorkSheets.Add(EmptyParam,
                                                             EmptyParam,
                                                             EmptyParam,
                                                             EmptyParam,
                                                             LCID)
      as _Worksheet));

    FExcelWorksheet.Name := SheetName;
    FWorksheets.Add(SheetName);
  end else
    // Connect to existing Worksheet
    FExcelWorksheet.ConnectTo((FExcelWorkbook.Worksheets.Item[SheetName] as _Worksheet))

end;

function TfrmSelFields.SheetExist(const SheetName : String) : Boolean;
begin
  Result := FWorksheets.IndexOf(SheetName) > -1;
end;


procedure TfrmSelFields.Connect;
begin
  try
      FExcelApplication.ConnectKind := ckNewInstance;//ckRunningOrNew;
      FExcelApplication.Connect;
      FExcelWorkbook.ConnectTo(FExcelApplication.Workbooks.Add(TOleEnum(xlWBATWorksheet), LCID));
  except
    Disconnect;
  end;

end;

procedure TfrmSelFields.Disconnect;
begin

  try
    if not FExcelApplication.Visible[LCID] then
    begin
      FExcelApplication.DisplayAlerts[LCID] := False;
      FExcelApplication.Quit;
    end;
    FExcelWorkbook.Disconnect;
    FExcelWorksheet.Disconnect;
    FExcelApplication.Disconnect;
  except
    // Do nothing
  end;
  
  FWorksheets.Clear;
end;

procedure TfrmSelFields.SetFontAndBorderRange(DelphiFont : TFont; Border : TCellBorder; StrBeginCell, StrEndCell : String);
begin
  // Convert Delphi font to the Excel font
  with FExcelWorksheet.Range[StrBeginCell, StrEndCell].Font do
  begin
    Name := DelphiFont.Name;
    Size := DelphiFont.Size;
    Color := DelphiFont.Color;
    Bold :=  fsBold in DelphiFont.Style;
    Italic := fsItalic in DelphiFont.Style;
    Underline := fsUnderline in DelphiFont.Style;
  end;

  // Titles
  if StrBeginCell = 'A1' then
    FExcelWorksheet.Range[StrBeginCell, StrEndCell].Orientation:=FFontOrientationTitles;

  if Border.FBackColor <> clWhite then
    FExcelWorksheet.Range[StrBeginCell, StrEndCell].Interior.Color := Border.FBackColor;

  if Border.LineStyle <> blNone then
  begin
    with FExcelWorksheet.Range[StrBeginCell, StrEndCell].Borders do
    begin
      Color := Border.BorderColor;
      case Border.Weight of
// possible values xlHairline
//                 xlMedium
//                 xlThick
//                 xlThin
// Abs to prevent warning 'Constant expression violates subrange bounds'
        bwThin : Weight := Abs(xlThin);
        bwMedium : Weight := Abs(xlMedium);
        bwThick : Weight := Abs(xlThick);
      end;

      case Border.LineStyle of
// possible values xlContinuous
//                 xlDash
//                 xlDashDot
//                 xlDashDotDot
//                 xlDot
//                 xlDouble
//                 xlSlantDashDot
//                 xlLineStyleNone
        blDash : LineStyle := Abs(xlDash);
        blLine : LineStyle := Abs(xlContinuous);
        blDoubleLine : LineStyle := Abs(xlDouble);
      end;
    end;
  end;
end;



procedure TfrmSelFields.Action1Execute(Sender: TObject);
begin
   with MISDm do begin
        ExportDataset(MISData)
   end;
end;

end.

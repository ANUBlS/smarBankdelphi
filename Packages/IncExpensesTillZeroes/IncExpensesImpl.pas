unit IncExpensesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, IncExpensesProj_TLB, StdVcl, Db, OracleData, StdCtrls,
  ComCtrls, Buttons, Oracle, ExtCtrls, Excel97, OleServer, ExcelExporter,
  Grids, DBGrids, SBPlgAx50_TLB, ImgList, CheckLst;

type
  TMainIncExpenses = class(TActiveForm, IIncExpenses, IIconExporter)
    PanelAlTop: TPanel;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelApplication1: TExcelApplication;
    Panel1: TPanel;
    GrBoxDate: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPickerBeg: TDateTimePicker;
    DTPickerEnd: TDateTimePicker;
    RGroupReportForm: TRadioGroup;
    GrBoxFilial: TGroupBox;
    CBoxFilial: TComboBox;
    LabelInfo: TLabel;
    ProgBar: TProgressBar;
    OKBtn: TSpeedButton;
    Panel2: TPanel;
    ExcelBtn: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGridIncomes: TDBGrid;
    DBGridExpenses: TDBGrid;
    GBoxExcel: TGroupBox;
    ChBoxMinuses: TCheckBox;
    ChBoxBegEndOstats: TCheckBox;
    ChBoxOtherFilials: TCheckBox;
    ImageList: TImageList;
    LabelTime: TLabel;
    EditSeprAccs: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    GBoxResults: TGroupBox;
    Label7: TLabel;
    StTextEndOstat: TStaticText;
    Label5: TLabel;
    StTextResult: TStaticText;
    Label6: TLabel;
    StTextBegOstat: TStaticText;
    Label3: TLabel;
    StTextIncome: TStaticText;
    Label4: TLabel;
    StTextExpense: TStaticText;
    PanelFilial: TPanel;
    ChListFilial: TCheckListBox;
    GBoxFilial: TGroupBox;
    ChBoxAllFilials: TCheckBox;
    LBoxFilial: TListBox;
    ChBoxZeroes: TCheckBox;
    procedure ActiveFormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure ExcelBtnClick(Sender: TObject);
    procedure ChBoxAllFilialsClick(Sender: TObject);
    procedure ChListFilialClickCheck(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FEvents: IIncExpensesEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_Icon: OLE_HANDLE; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure AddFilials;
    procedure CrFilialStr;
  public
    { Public declarations }
    Branch :array of Integer;
    procedure Initialize; override;

  end;
implementation

uses ComObj, ComServ , SboapiDataModuleImpl, UnitDataMod, SBTranslateProc;
var
//  TimeIndicator: TTime;
  BranchStr  :String;
  AllBranchesChecked :Boolean;
{$R *.DFM}

{ TIncExpenses }

function TMainIncExpenses.Get_Icon: OLE_HANDLE;
const
  ImageIndex =0;
begin
  ImageList.GetIcon(ImageIndex,Icon);
  Result := Icon.Handle;
end;

procedure TMainIncExpenses.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_IncExpensesPage); }
end;

procedure TMainIncExpenses.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IIncExpensesEvents;
end;

procedure TMainIncExpenses.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TMainIncExpenses.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMainIncExpenses.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMainIncExpenses.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMainIncExpenses.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMainIncExpenses.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMainIncExpenses.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMainIncExpenses.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMainIncExpenses.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMainIncExpenses.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMainIncExpenses.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMainIncExpenses.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMainIncExpenses.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMainIncExpenses.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMainIncExpenses.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMainIncExpenses.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMainIncExpenses.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMainIncExpenses.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMainIncExpenses.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMainIncExpenses._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainIncExpenses.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMainIncExpenses.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMainIncExpenses.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMainIncExpenses.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMainIncExpenses.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMainIncExpenses.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMainIncExpenses.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMainIncExpenses.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMainIncExpenses.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMainIncExpenses.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMainIncExpenses.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMainIncExpenses.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMainIncExpenses.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMainIncExpenses.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMainIncExpenses.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMainIncExpenses.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMainIncExpenses.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMainIncExpenses.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainIncExpenses.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMainIncExpenses.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMainIncExpenses.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMainIncExpenses.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMainIncExpenses.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMainIncExpenses.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

//********************************{ - Main - }**************************************

procedure TMainIncExpenses.AddFilials;
var
  BranchIndex :Integer;
begin
  with  DataMod.OrDSFilial do
  try
    Open;
    SetLength(Branch,RecordCount+1);
    First;
    BranchIndex :=0;
    ChListFilial.Items.Clear;
    Branch[BranchIndex] :=-1;
    while not EOF do
    begin
      BranchIndex :=BranchIndex + 1;
      ChListFilial.Items.Add(FieldByName('Name').AsString);
      LBoxFilial.Items.Add(FieldByName('ID').AsString);
      ChListFilial.Checked[BranchIndex-1]:=True;
      Branch[BranchIndex] :=FieldByName('ID').AsInteger;
      Next;
    end;
  finally
  end;
end;

procedure TMainIncExpenses.ActiveFormCreate(Sender: TObject);
var i :integer;
begin
  Application.CreateForm(TDataMod, DataMod);
  DataMod.OrDSSysDat.Close;
  DataMod.OrDSSysDat.Open;
  DTPickerBeg.Date :=DataMod.OrDSSysDatTEK_DAT.AsDateTime;
  DTPickerEnd.Date :=DataMod.OrDSSysDatTEK_DAT.AsDateTime;
  with DataMod.OrDSFilial do begin
   Close;
   Open;
   First;
  end;{with DataMod.OrDSFilial}
  AddFilials;
  {CBoxFilial.Items.Clear;
  CBoxFilial.Items.Add('÷муми банк цзр€');
  for i :=1 to DataMod.OrDSFilial.RecordCount do begin
      CBoxFilial.Items.Add(DataMod.OrDSFilialNAME.AsString);
      DataMod.OrDSFilial.Next;
  end;}{for i :=1 to DataMod.OrDSFilial.RecordCount}
  CBoxFilial.ItemIndex :=0;

   TranslateAllComponents(Self, DataMod.OPack_SL);
end;

procedure TMainIncExpenses.OKBtnClick(Sender: TObject);
var
  i :Integer;
  SumInc, SumExp, SumRes :Real;
begin

  DBGridIncomes.DataSource:=nil;
  DBGridExpenses.DataSource:=nil;
  StTextIncome.Caption:='';
  StTextExpense.Caption:='';
  StTextBegOstat.Caption:='';
  StTextResult.Caption:='';
  StTextEndOstat.Caption:='';
  {with DataMod.OrDSFilialCode do begin
   Close;
   SetVariable('FilialName',CBoxFilial.Text);
   Open;
  end;}{with DataMod.OrDSFilialCode}
  CrFilialStr;

IF RGroupReportForm.ItemIndex = 1 THEN BEGIN
//*******************
//                    B Y   A C C O U N T S
//                                            *********************

 IF AllBranchesChecked = False THEN BEGIN
  //*****************B Y   F I L I A L S********************
  //***************************************************************
  LabelInfo.Caption :='Ё€лир щесабланыр...';
  ProgBar.Position  :=30;
  Application.ProcessMessages;
  with DataMod.OrDSIncomes do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('FilialCode',BranchStr);//DataMod.OrDSFilialCodeID.AsInteger);
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSIncomes.DataSet:=DataMod.OrDSIncomes;
   DBGridIncomes.DataSource:=DataMod.DSIncomes;
  end;{with DataMod.OrDSIncomes}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSBegOstat do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
    Open;
    StTextBegOstat.Caption:=DataMod.OrDSBegOstatSUMER.AsString;
   end;{with DataMod.OrDSBegOstat}
  end;{if ChBoxBegEndOstats.Checked=true}


  LabelInfo.Caption :='’€рж щесабланыр...';
  ProgBar.Position  :=60;
  Application.ProcessMessages;
  with DataMod.OrDSExpenses do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSExpenses.DataSet:=DataMod.OrDSExpenses;
   DBGridExpenses.DataSource:=DataMod.DSExpenses;
  end;{with OrDSExpenses}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSEndOstat do begin
    CloseAll;
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
    Open;
    StTextEndOstat.Caption:=DataMod.OrDSEndOstatSUMER.AsString;
   end;{with DataMod.OrDSEndOstat}
  end;{if ChBoxBegEndOstats.Checked=true}

  LabelInfo.Caption :='...';
  ProgBar.Position  :=0;

  END {IF AllBranchesChecked = False}


  ELSE BEGIN
  //**********G E N E R A L   R E P O R T*************
  //***********************************************
  DataMod.OrDSBankInfo.Close;
  DataMod.OrDSBankInfo.Open;
  LabelInfo.Caption :='Ё€лир щесабланыр...';
  ProgBar.Position  :=30;
  Application.ProcessMessages;
  with DataMod.OrDSIncomesGeneral do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSIncomes.DataSet:=DataMod.OrDSIncomesGeneral;
   DBGridIncomes.DataSource:=DataMod.DSIncomes;
  end;{with DataMod.OrDSIncomesGeneral}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSBegOstatGen do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    Open;
    StTextBegOstat.Caption:=DataMod.OrDSBegOstatGenSUMER.AsString;
   end;{with DataMod.OrDSBegOstatGen}
  end;{if ChBoxBegEndOstats.Checked=true}

  LabelInfo.Caption :='’€рж щесабланыр...';
  ProgBar.Position  :=60;
  Application.ProcessMessages;
  with DataMod.OrDSExpensesGeneral do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSExpenses.DataSet:=DataMod.OrDSExpensesGeneral;
   DBGridExpenses.DataSource:=DataMod.DSExpenses;
  end;{with DataMod.OrDSExpensesGeneral}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSEndOstatGen do begin
    CloseAll;
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    Open;
    StTextEndOstat.Caption:=DataMod.OrDSEndOstatGenSUMER.AsString;
   end;{with DataMod.OrDSBegOstatGen}
  end;{if ChBoxBegEndOstats.Checked=true}

  LabelInfo.Caption :='...';
  ProgBar.Position  :=0;

  END; {ELSE}
END; {IF RGroupReportForm.ItemIndex = 1}

IF RGroupReportForm.ItemIndex = 0 THEN BEGIN


//*******************
//                    B Y   B A L A N C E
//                                            *********************

 IF AllBranchesChecked = False THEN BEGIN
  //*****************B Y   F I L I A L S********************
  //***************************************************************
  LabelInfo.Caption :='Ё€лир щесабланыр...';
  ProgBar.Position  :=30;
  Application.ProcessMessages;
  with DataMod.OrDSIncomesBal do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSIncomes.DataSet:=DataMod.OrDSIncomesBal;
   DBGridIncomes.DataSource:=DataMod.DSIncomes;
  end;{with DataMod.OrDSIncomesBal}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSBegOstat do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
    Open;
    StTextBegOstat.Caption:=DataMod.OrDSBegOstatSUMER.AsString;
   end;{with DataMod.OrDSBegOstat}
  end;{if ChBoxBegEndOstats.Checked=true}


  LabelInfo.Caption :='’€рж щесабланыр...';
  ProgBar.Position  :=60;
  Application.ProcessMessages;
  with DataMod.OrDSExpensesBal do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSExpenses.DataSet:=DataMod.OrDSExpensesBal;
   DBGridExpenses.DataSource:=DataMod.DSExpenses;
  end;{with DataMod.OrDSExpensesBal}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSEndOstat do begin
    CloseAll;
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
    Open;
    StTextEndOstat.Caption:=DataMod.OrDSEndOstatSUMER.AsString;
   end;{with DataMod.OrDSEndOstat}
  end;{if ChBoxBegEndOstats.Checked=true}


  LabelInfo.Caption :='...';
  ProgBar.Position  :=0;

  END {IF AllBranchesChecked = False}


  ELSE BEGIN
  //**********G E N E R A L   R E P O R T*************
  //***********************************************
  DataMod.OrDSBankInfo.Close;
  DataMod.OrDSBankInfo.Open;
  LabelInfo.Caption :='Ё€лир щесабланыр...';
  ProgBar.Position  :=30;
  Application.ProcessMessages;
  with DataMod.OrDSIncGenBal do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSIncomes.DataSet:=DataMod.OrDSIncGenBal;
   DBGridIncomes.DataSource:=DataMod.DSIncomes;
  end;{with OrDSIncGenBal}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSBegOstatGen do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    Open;
    StTextBegOstat.Caption:=DataMod.OrDSBegOstatGenSUMER.AsString;
   end;{with DataMod.OrDSBegOstatGen}
  end;{if ChBoxBegEndOstats.Checked=true}


  LabelInfo.Caption :='’€рж щесабланыр...';
  ProgBar.Position  :=60;
  Application.ProcessMessages;
  with DataMod.OrDSExpGenBal do begin
   CloseAll;
   SetVariable('BegDate',FormatDateTime('dd/mm/yyyy', DTPickerBeg.Date));
   SetVariable('EndDate',FormatDateTime('dd/mm/yyyy', DTPickerEnd.Date));
   SetVariable('SeprAccs',EditSeprAccs.Text);
   Open;
   DataMod.DSExpenses.DataSet:=DataMod.OrDSExpGenBal;
   DBGridExpenses.DataSource:=DataMod.DSExpenses;
  end;{with OrDSExpGenBal}
  if ChBoxBegEndOstats.Checked=true then begin
   with DataMod.OrDSEndOstatGen do begin
    CloseAll;
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    Open;
    StTextEndOstat.Caption:=DataMod.OrDSEndOstatGenSUMER.AsString;
   end;{with DataMod.OrDSEndOstatGen}
  end;{if ChBoxBegEndOstats.Checked=true}


  LabelInfo.Caption :='...';
  ProgBar.Position  :=0;

  END; {ELSE}

END; {IF RGroupReportForm.ItemIndex = 2 THEN BEGIN}

//***** StaticText
  SumInc:=0;
  DBGridIncomes.DataSource.DataSet.First;
  for i:=1 to DBGridIncomes.DataSource.DataSet.RecordCount do
  begin
   SumInc:=SumInc+DBGridIncomes.DataSource.DataSet.FieldByName('Rest').AsFloat;
   DBGridIncomes.DataSource.DataSet.Next;
  end;{for i:=1 to DBGridIncomes.DataSource.DataSet.RecordCount}
  StTextIncome.Caption:=FloatToStr(SumInc);

  SumExp:=0;
  DBGridExpenses.DataSource.DataSet.First;
  for i:=1 to DBGridExpenses.DataSource.DataSet.RecordCount do
  begin
   SumExp:=SumExp+DBGridExpenses.DataSource.DataSet.FieldByName('Rest').AsFloat;
   DBGridExpenses.DataSource.DataSet.Next;
  end;{for i:=1 to DBGridExpenses.DataSource.DataSet.RecordCount}
  StTextExpense.Caption:=FloatToStr(SumExp);

  SumRes:=SumInc-SumExp;
  StTextResult.Caption:=FloatToStr(SumRes);
  ChBoxMinuses.Enabled:=True;
end;

procedure TMainIncExpenses.ExcelBtnClick(Sender: TObject);
var
  V, Sheet, Sheets   :Variant;
  cell, row, i, j    :Integer;
  E_Row1,OpenedXlsCnt:Integer;
begin
  try
  if (DBGridIncomes.DataSource.DataSet.RecordCount =0)
   or (DBGridExpenses.DataSource.DataSet.RecordCount =0)
    then Exit;
  except
   Exit;
  end;   

  DataMod.OrDSBankInfo.Close;
  DataMod.OrDSBankInfo.Open;

//********************** Other filials ****************************
  if ChBoxOtherFilials.Checked = true then begin
  LabelInfo.Caption :='‘илиаллар цзр€ э€лир щесабланыр...';
  ProgBar.Position  :=30;
  Application.ProcessMessages;
  with DataMod.OrDSIncOtherFilials do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    SetVariable('FilialCode',BranchStr);// DataMod.OrDSFilialCodeID.AsInteger);
    if AllBranchesChecked = True then SetVariable('FilialCode','-1');    
    Open;
  end;{with DataMod.OrDSIncOtherFilials}
  LabelInfo.Caption :='‘илиаллар цзр€ х€рж щесабланыр...';
  ProgBar.Position  :=60;
  Application.ProcessMessages;
  with DataMod.OrDSExpOtherFilials do begin
    CloseAll;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.Date));
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.Date));
    SetVariable('FilialCode',BranchStr); //DataMod.OrDSFilialCodeID.AsInteger);
    if ChBoxAllFilials.Checked=true then SetVariable('FilialCode',-1);
    Open;
  end;{with DataMod.OrDSExpOtherFilials}
  LabelInfo.Caption :='';
  ProgBar.Position  :=0;
  Application.ProcessMessages;
  end;{if ChBoxOtherFilials.Checked = true}
//

IF RGroupReportForm.ItemIndex = 1 THEN BEGIN
//*******************
//                    B Y   A C C O U N T S
//                                            *********************

  //***************************************************************
  //**********Excel Application**********
  ExcelApplication1.Disconnect;
  V :=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] :=True;

  V.Workbooks.Open(ExtractFilePath(ExtractFilePath(ParamStr(0)))+ 'IncExp.xls');
  for OpenedXlsCnt :=1 to 100 do
  try
   Sheet := V.Workbooks[OpenedXlsCnt].Worksheets['IncExp'];
   Break;
  except
  end;
  Sheets := V.Sheets;
  Sheets.Item['IncExp'].Activate;
  Sheets.Item['IncExp'].Range['A1:CA1000'].Delete;
  Sheets.Item['IncExp'].Range['A1:CA1000'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['IncExp'].Range['B1:B1000'].NumberFormat := '@';
  Sheets.Item['IncExp'].Range['A1:CA1000'].Font.Name := 'Arial AzLat';
  Sheets.Item['IncExp'].Range['A1:CA1000'].Font.Size := 8;
  Sheets.Item['IncExp'].Range['D1:D1000'].NumberFormat := '# ### ###.00';
  Sheet.cells[1,3].Font.Bold:=true;
  Sheet.cells[1,3]:='';//DataMod.OrDSFilialCodeNAME.AsString;
  Sheet.cells[2,3].Font.Bold:=true;
  Sheet.cells[2,3]:='ЁяЋ»–-’я–∆ ў≈—јЅј“џ';
  Sheet.cells[3,3].Font.Bold:=true;
  Sheet.cells[3,3]:=DateToStr(DTPickerBeg.Date)+'-'+DateToStr(DTPickerEnd.Date);

  //****** I N C O M E   R E P O R T **********
  //**********Caption of Income report**************
  Sheet.cells[5,3].Font.Bold:=true;
  Sheet.cells[5,3]:='Ё€лир щесабаты';
  Sheet.cells[6,1].Font.Bold:=true;
  Sheet.cells[6,1].Borders.weight:=2;
  Sheet.cells[6,1]:='Ѕаланс';
  Sheet.cells[6,2].Font.Bold:=true;
  Sheet.cells[6,2].Borders.weight:=2;
  Sheet.cells[6,2]:='ўесаб';
  Sheet.cells[6,3].Font.Bold:=true;
  Sheet.cells[6,3].Borders.weight:=2;
  Sheet.cells[6,3]:='ўесабын ады';
  Sheet.cells[6,4].Font.Bold:=true;
  Sheet.cells[6,4].Borders.weight:=2;
  Sheet.cells[6,4]:='ћ€бл€ь';
  row:=7;
  cell:=1;
  //********DBGridIncomes.DataSource.DataSet************
  DBGridIncomes.DataSource.DataSet.First;
  for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount do begin
  cell:=1;

  if ChBoxMinuses.Checked=false then begin
  if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin}
  end{if ChBoxMinuses.Checked=false}
  else begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
  end;{else}
   DBGridIncomes.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount}

  //********DBGridExpenses.DataSource.DataSet************
  if ChBoxMinuses.Checked=false then begin
  DBGridExpenses.DataSource.DataSet.First;
  for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount do begin
  cell:=1;
  if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin
  for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=(-1)*DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin}
   DBGridExpenses.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount}
  end;{if ChBoxMinuses.Checked=false}

  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3]:='                                                   ∆яћ»';
  Sheet.cells[row,4].Font.Bold:=true;
  if (DBGridIncomes.DataSource.DataSet.RecordCount<>0) or
     (DBGridExpenses.DataSource.DataSet.RecordCount<>0) then
     Sheet.cells[row,4]:='=SUM(D7:D'+IntToStr(row-1)+')'
  else Sheet.cells[row,4]:=0;

  //********* E X P E N S E   R E P O R T ************
  //***********Caption of Expense report*******
  row:=row+2;
  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3]:='’€рж щесабаты';
  row:=row+1;
  Sheet.cells[row,1].Font.Bold:=true;
  Sheet.cells[row,1].Borders.weight:=2;
  Sheet.cells[row,1]:='Ѕаланс';
  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2].Borders.weight:=2;
  Sheet.cells[row,2]:='ўесаб';
  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3].Borders.weight:=2;
  Sheet.cells[row,3]:='ўесабын ады';
  Sheet.cells[row,4].Font.Bold:=true;
  Sheet.cells[row,4].Borders.weight:=2;
  Sheet.cells[row,4]:='ћ€бл€ь';

  //**********DBGridExpenses.DataSource.DataSet**********
  row:=row+1;
  E_Row1:=row;
  DBGridExpenses.DataSource.DataSet.First;
  for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount do begin
   cell:=1;

  if ChBoxMinuses.Checked=false then begin
   if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin
   for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat>=0}
  end {if ChBoxMinuses.Checked=false}
  else begin
  for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
  end;{else}
   DBGridExpenses.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount}

  //********DBGridIncomes.DataSource.DataSet************
  if ChBoxMinuses.Checked=false then begin
  DBGridIncomes.DataSource.DataSet.First;
  for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount do begin
  cell:=1;
  if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=4 then Sheet.cells[row,cell]:=(-1)*DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin}
   DBGridIncomes.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount}
  end;{if ChBoxMinuses.Checked=false}

  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3]:='                                                   ∆яћ»';
  Sheet.cells[row,4].Font.Bold:=true;
  if (DBGridIncomes.DataSource.DataSet.RecordCount<>0) or
     (DBGridExpenses.DataSource.DataSet.RecordCount<>0) then
  Sheet.cells[row,4]:='=SUM(D'+IntToStr(E_Row1)+':D'+IntToStr((row-1))+')'
  else Sheet.cells[row,4]:=0;

  //******** Incomes-expenses difference*******
  row:=row+3;
  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3]:='                         ћ€нф€€т в€ з€р€р арасында ф€рг';
  Sheet.cells[row,4].Font.Bold:=true;
  Sheet.cells[row,4]:='=SUM(D'+IntToStr(E_Row1-4)+')-SUM(D'+IntToStr(row-3)+')';
  if ChBoxBegEndOstats.Checked=true then begin
   Sheet.cells[row-1,3].Font.Bold:=true;
   Sheet.cells[row-1,3]:='                         ƒюврцн €вв€лин€ галыг';
   Sheet.cells[row-1,4].Font.Bold:=true;
   Sheet.cells[row-1,4]:=StTextBegOstat.Caption;
   Sheet.cells[row+1,3].Font.Bold:=true;
   Sheet.cells[row+1,3]:='                         ƒюврцн сонуна галыг';
   Sheet.cells[row+1,4].Font.Bold:=true;
   Sheet.cells[row+1,4]:=StTextEndOstat.Caption;
  end;{if ChBoxBegEndOstats.Checked=true}

  //******* Other filials**********************
  row:=row+5;
  if ChBoxOtherFilials.Checked=true then begin
  with DataMod do begin
   for i:=1 to OrDSIncOtherFilials.RecordCount do begin
    Sheet.cells[row,1]:=OrDSIncOtherFilialsFILIALNo.AsString;
    Sheet.cells[row,3].Font.Bold:=true;
    Sheet.cells[row,3]:='                         '+OrDSIncOtherFilialsFILIAL.AsString;
    Sheet.cells[row,4]:=OrDSIncOtherFilialsREST.AsString;
    row:=row+1;
    Sheet.cells[row,4]:=OrDSExpOtherFilialsREST.AsString;
    row:=row+1;
    Sheet.cells[row,3].Font.Bold:=true;
    Sheet.cells[row,3]:='                         ћ€нф€€т-х€рж ф€рги';
    Sheet.cells[row,4]:='=SUM(D'+IntToStr(row-2)+')-SUM(D'+IntToStr(row-1)+')';
    row:=row+2;
    OrDSIncOtherFilials.Next;
    OrDSExpOtherFilials.Next;
   end;{for i:=1 to OrDSIncOtherFilials.RecordCount}
  end;{with DataMod}
  end;{if ChBoxOtherFilials.Checked=true}

  V :=null;
  ExcelApplication1.Disconnect;


END {IF RGroupReportForm.ItemIndex = 1}

ELSE BEGIN


//*******************
//                    B Y   B A L A N C E
//                                            *********************


  //***************************************************************
  //**********Excel Application**********
  ExcelApplication1.Disconnect;
  V :=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  ExcelApplication1.Visible[0] :=True;
  V.Workbooks.Open(ExtractFilePath(ExtractFilePath(ParamStr(0)))+ 'IncExpBal.xls');

  for OpenedXlsCnt :=1 to 100 do
  try
   Sheet := V.Workbooks[OpenedXlsCnt].Worksheets['IncExp'];
   Break;
  except
  end;
  Sheets := V.Sheets;
  Sheets.Item['IncExp'].Activate;
  Sheets.Item['IncExp'].Range['A1:CA1000'].Delete;
  Sheets.Item['IncExp'].Range['A1:CA1000'].AutoFormat(1, 0, true, 0, 0, 0, 1);
  Sheets.Item['IncExp'].Range['A1:CA1000'].Font.Name := 'Arial AzLat';
  Sheets.Item['IncExp'].Range['A1:CA1000'].Font.Size := 8;
  Sheets.Item['IncExp'].Range['C1:C1000'].NumberFormat := '# ### ###.00';
  Sheet.cells[1,2].Font.Bold:=true;
  Sheet.cells[1,2]:='';//DataMod.OrDSFilialCodeNAME.AsString;
  Sheet.cells[2,2].Font.Bold:=true;
  Sheet.cells[2,2]:='ЁяЋ»–-’я–∆ ў≈—јЅј“џ';
  Sheet.cells[3,2].Font.Bold:=true;
  Sheet.cells[3,2]:=DateToStr(DTPickerBeg.Date)+'-'+DateToStr(DTPickerEnd.Date);

  //****** I N C O M E   R E P O R T **********
  //**********Caption of Income report**************
  Sheet.cells[5,2].Font.Bold:=true;
  Sheet.cells[5,2]:='Ё€лир щесабаты';
  Sheet.cells[6,1].Font.Bold:=true;
  Sheet.cells[6,1].Borders.weight:=2;
  Sheet.cells[6,1]:='Ѕаланс';
  Sheet.cells[6,2].Font.Bold:=true;
  Sheet.cells[6,2].Borders.weight:=2;
  Sheet.cells[6,2]:='ўесабын ады';
  Sheet.cells[6,3].Font.Bold:=true;
  Sheet.cells[6,3].Borders.weight:=2;
  Sheet.cells[6,3]:='ћ€бл€ь';
  row:=7;
  cell:=1;
  //********DBGridIncomes.DataSource.DataSet************

  DBGridIncomes.DataSource.DataSet.First;
  for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount do begin
  cell:=1;

  if ChBoxMinuses.Checked=false then begin
  if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin}
  end {if ChBoxMinuses.Checked=false}
  else begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
  end; {else}
   DBGridIncomes.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount}



  //********DBGridExpenses.DataSource.DataSet************
  if ChBoxMinuses.Checked=false then begin
  DBGridExpenses.DataSource.DataSet.First;
  for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount do begin
  cell:=1;
  if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin
  for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=(-1)*DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin}
   DBGridExpenses.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount}
  end; {if ChBoxMinuses.Checked=false}

  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2]:='                                                   ∆яћ»';
  Sheet.cells[row,3].Font.Bold:=true;
  if (DBGridIncomes.DataSource.DataSet.RecordCount<>0) or
     (DBGridExpenses.DataSource.DataSet.RecordCount<>0) then
      Sheet.cells[row,3]:='=SUM(C7:C'+IntToStr(row-1)+')'
  else Sheet.cells[row,3]:=0;

  //********* E X P E N S E   R E P O R T ************
  //***********Caption of Expense report*******
  row:=row+2;
  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2]:='’€рж щесабаты';
  row:=row+1;
  Sheet.cells[row,1].Font.Bold:=true;
  Sheet.cells[row,1].Borders.weight:=2;
  Sheet.cells[row,1]:='Ѕаланс';
  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2].Borders.weight:=2;
  Sheet.cells[row,2]:='ўесабын ады';
  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row,3].Borders.weight:=2;
  Sheet.cells[row,3]:='ћ€бл€ь';

  //**********DBGridExpenses.DataSource.DataSet**********
  row:=row+1;
  E_Row1:=row;
  DBGridExpenses.DataSource.DataSet.First;
  for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount do begin
   cell:=1;

  if ChBoxMinuses.Checked=false then begin
   if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat>=0 then begin
   for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat>=0}
  end {if ChBoxMinuses.Checked=false}
  else begin
  for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=DBGridExpenses.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridExpenses.DataSource.DataSet.FieldCount-1}
   row:=row+1;
  end; {else}
   DBGridExpenses.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridExpenses.DataSource.DataSet.RecordCount}

  //********DBGridIncomes.DataSource.DataSet************
  if ChBoxMinuses.Checked=false then begin
  DBGridIncomes.DataSource.DataSet.First;
  for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount do begin
  cell:=1;
  if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin
  for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1 do begin
    Sheet.cells[row,cell].Borders.weight:=2;
    Sheet.cells[row,cell]:=DBGridIncomes.DataSource.DataSet.Fields[i].AsString;
    if cell=3 then Sheet.cells[row,cell]:=(-1)*DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat;
    cell:=cell+1;
   end;{for i :=0 to DBGridIncomes.DataSource.DataSet.FieldCount-1}
   row:=row+1;
   end;{if DBGridIncomes.DataSource.DataSet.FieldByName('REST').AsFloat<0 then begin}
   DBGridIncomes.DataSource.DataSet.Next;
  end;{for j :=1 to DBGridIncomes.DataSource.DataSet.RecordCount}
  end; {if ChBoxMinuses.Checked=false}

  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2]:='                                                   ∆яћ»';
  Sheet.cells[row,3].Font.Bold:=true;
  if (DBGridIncomes.DataSource.DataSet.RecordCount<>0) or
     (DBGridExpenses.DataSource.DataSet.RecordCount<>0) then
     Sheet.cells[row,3]:='=SUM(C'+IntToStr(E_Row1)+':C'+IntToStr((row-1))+')'
  else Sheet.cells[row,3]:=0;

  //********Incomes-expenses difference*******
  row:=row+3;
  Sheet.cells[row,2].Font.Bold:=true;
  Sheet.cells[row,2]:='                         ћ€нф€€т в€ з€р€р арасында ф€рг';
  Sheet.cells[row,3].Font.Bold:=true;
  Sheet.cells[row+1,2].Font.Bold:=true;
  Sheet.cells[row+1,3].Font.Bold:=true;
  Sheet.cells[row,3]:='=SUM(C'+IntToStr(E_Row1-4)+')-SUM(C'+IntToStr(row-3)+')';
  if ChBoxBegEndOstats.Checked=true then begin
   Sheet.cells[row-1,2].Font.Bold:=true;
   Sheet.cells[row-1,2]:='                         ƒюврцн €вв€лин€ галыг';
   Sheet.cells[row-1,3].Font.Bold:=true;
   Sheet.cells[row-1,3]:=StTextBegOstat.Caption;
   Sheet.cells[row+1,2].Font.Bold:=true;
   Sheet.cells[row+1,2]:='                         ƒюврцн сонуна галыг';
   Sheet.cells[row+1,3].Font.Bold:=true;
   Sheet.cells[row+1,3]:=StTextEndOstat.Caption;
  end;{if ChBoxBegEndOstats.Checked=true}

//******* Other filials**********************
  row:=row+5;
  if ChBoxOtherFilials.Checked=true then begin
  with DataMod do begin
   for i:=1 to OrDSIncOtherFilials.RecordCount do begin
    Sheet.cells[row,1]:=OrDSIncOtherFilialsFILIALNo.AsString;
    Sheet.cells[row,2].Font.Bold:=true;
    Sheet.cells[row,2]:='                         '+OrDSIncOtherFilialsFILIAL.AsString;
    Sheet.cells[row,3]:=OrDSIncOtherFilialsREST.AsString;
    row:=row+1;
    Sheet.cells[row,3]:=OrDSExpOtherFilialsREST.AsString;
    row:=row+1;
    Sheet.cells[row,2].Font.Bold:=true;
    Sheet.cells[row,2]:='                         ћ€нф€€т-х€рж ф€рги';
    Sheet.cells[row,3]:='=SUM(C'+IntToStr(row-2)+')-SUM(C'+IntToStr(row-1)+')';
    row:=row+2;
    OrDSIncOtherFilials.Next;
    OrDSExpOtherFilials.Next;
   end;{for i:=1 to OrDSIncOtherFilials.RecordCount}
  end;{with DataMod}
  end;{if ChBoxOtherFilials.Checked=true}

  V :=null;
  ExcelApplication1.Disconnect;
end;
end;

procedure TMainIncExpenses.ChBoxAllFilialsClick(Sender: TObject);
var
  i :Integer;
begin
  DataMod.OrDSFilialCode.Open;
  if ChBoxAllFilials.Checked=true then begin
  for i:=0 to DataMod.OrDSFilialCode.RecordCount-1 do
      ChListFilial.Checked[i]:=true;
  end else begin
  for i:=0 to DataMod.OrDSFilialCode.RecordCount-1 do
      ChListFilial.Checked[i]:=false;
  end;
  ChListFilialClickCheck(Sender);
end;

procedure TMainIncExpenses.ChListFilialClickCheck(Sender: TObject);
var  i :Integer;
begin
  OKBtn.Enabled :=False;
  AllBranchesChecked :=True;
  for i :=0 to (ChListFilial.Items.Count-1) do
  begin
   if ChListFilial.Checked[i]=True then OKBtn.Enabled :=True;
   if ChListFilial.Checked[i]=False then AllBranchesChecked:=False;
  end;{for}
end;

procedure TMainIncExpenses.CrFilialStr;
var
  i :Integer;
  k :Boolean;
begin
  BranchStr:=' ';
  k :=True;
  for i:=0 to (ChListFilial.Items.Count-1) do begin
  if ChListFilial.Checked[i]=true then
     begin
     if k=True then BranchStr:=BranchStr+LBoxFilial.Items[i]
               else BranchStr:=BranchStr+','+LBoxFilial.Items[i];
     k :=False;
     end;
  end;
end;

procedure TMainIncExpenses.ActiveFormDestroy(Sender: TObject);
begin
  Free;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMainIncExpenses,
    CLASS_IncExpenses,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

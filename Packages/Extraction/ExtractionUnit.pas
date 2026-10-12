unit ExtractionUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Extraction_TLB, StdVcl, StdCtrls, ExtCtrls, ComCtrls,
  DBCtrls, Grids, DBGrids, Excel97;

const
  LCID : DWORD = LOCALE_SYSTEM_DEFAULT;

type
  TExtractionForm = class(TActiveForm, IExtractionForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox4: TGroupBox;
    EditCustomers: TEdit;
    GroupBox5: TGroupBox;
    EditBalances: TEdit;
    GroupBox6: TGroupBox;
    EditAccNumber: TEdit;
    DBLookupCustomers: TDBLookupComboBox;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    CBBalancePlane: TComboBox;
    GroupBox2: TGroupBox;
    DTPBeginDate: TDateTimePicker;
    DTPEndDate: TDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBLookupCurrency: TDBLookupComboBox;
    DBLookupBranch: TDBLookupComboBox;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    Panel5: TPanel;
    LogMemo: TMemo;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    procedure ActiveFormCreate(Sender: TObject);
    procedure EditBalancesKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IExtractionFormEvents;
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
  public
    { Public declarations }
    procedure Initialize; override;
    procedure ExportExcel;
  end;

var
   ExtractionForm: TExtractionForm;


implementation

uses ComObj, ComServ, ExtractionDataModuleImpl, SBStoredProc,
  ExtractionReportUnit;

{$R *.DFM}

{ TExtractionForm }

procedure TExtractionForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ExtractionFormPage); }
end;

procedure TExtractionForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IExtractionFormEvents;
end;

procedure TExtractionForm.Initialize;
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

function TExtractionForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TExtractionForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TExtractionForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TExtractionForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TExtractionForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TExtractionForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TExtractionForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TExtractionForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TExtractionForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TExtractionForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TExtractionForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TExtractionForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TExtractionForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TExtractionForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TExtractionForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TExtractionForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TExtractionForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TExtractionForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TExtractionForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TExtractionForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TExtractionForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TExtractionForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TExtractionForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TExtractionForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TExtractionForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TExtractionForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TExtractionForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TExtractionForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TExtractionForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TExtractionForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TExtractionForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TExtractionForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TExtractionForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TExtractionForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TExtractionForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TExtractionForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TExtractionForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TExtractionForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TExtractionForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TExtractionForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TExtractionForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TExtractionForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TExtractionForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

//----------------------------------------------- {-MAIN-} ---------------------------------------------------

procedure TExtractionForm.ActiveFormCreate(Sender: TObject);
begin
 ExtractionForm :=Self;
 ExtractionReport :=TExtractionReport.Create(Self);
 CBBalancePlane.ItemIndex :=0;
 if not Assigned(ExtractionDataModule) then
  ExtractionDataModule :=TExtractionDataModule.Create(Self);
 DBLookupCurrency.KeyValue :=-1;
 DBLookupBranch.KeyValue :=-1;
end;

procedure TExtractionForm.EditBalancesKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',',','.',#8]) then
   Key :=#0
end;

procedure TExtractionForm.Button1Click(Sender: TObject);
var
   BeginDate, EndDate: TDateTime;
begin
 BeginDate :=Int(DTPBeginDate.DateTime);
 EndDate :=Int(DTPEndDate.DateTime);
 with ExtractionDataModule do
 begin
  Accounts.SetVariable('BeginDate',BeginDate);
  Accounts.SetVariable('EndDate',EndDate);
  Transactions.SetVariable('BeginDate',BeginDate);
  Transactions.SetVariable('EndDate',EndDate);
  Accounts.Open;
  Transactions.Open;
  //ExtractionReport.Preview;
 end;

end;



procedure TExtractionForm.ExportExcel;
{
var
  Dummy: Integer;
  R,C,I,J : Integer;
  V : Variant;
  XLWS : ExcelWorkSheet;
  XLApplication : TExcelApplication;
  DataSet: TDataSet;
  FName :String;
}
begin
{
 DataSet :=TransDataModule.Transactions;
 DataSet.Last;
 with DataSet, CheckExportList do
  begin
   ExportList.Clear;
   for Dummy :=0 to FieldCount -1 do
    if  Checked[Dummy]  then
     begin
      FName :=Fields[Dummy].Name;
      System.Delete(FName,1,12);
      ExportList.Add(FName);
     end;
  end;

  I := 0;
  R := DataSet.RecordCount+1;

  if not (ExportList.Count)> 0 then
   C := DataSet.FieldCount
  else
   C:=ExportList.Count;

  V := VarArrayCreate([0,(R),0,(C-1)],varVariant);
  VarArrayLock(V);
  XLApplication := TExcelApplication.Create(Self);

  with  DataSet do
   begin
    Open;
    DisableControls;
    First;
    try
     for J := 0  to C - 1 do
      V[I,J] := FindField(ExportList[J]).DisplayLabel;
      INC(I);
        while not DataSet.Eof do
        begin
          for J := 0 to C - 1 do
            V[I,J] := FindField(ExportList[J]).AsVariant;
          INC(I);
          Next;
        end;
    finally
     EnableControls;
     VarArrayUnlock(V);
    end;
   end;
    //-----------------------------------IMPORT------------------------

    XLApplication.Connect;
    XLApplication.Visible[LCID] := True;
    try
      XLApplication.Workbooks.Add(EmptyParam,LCID);
      XLWS := XLApplication.Sheets[1] as ExcelWorkSheet;
      XLWS.Activate(LCID);

      //XLWS.Cells.Range_['D1',XLWS.Cells.Item[R,C]].NumberFormat :='#,##.00';
      XLWS.Range['A1','CA1'].Font.Bold := True;
      XLWS.Cells.Font.Name :='Azl Sans Serif';
      with XLWS do
       Range['A1',XLWS.Cells.Item[R,C]].Value:=V;
    finally
      XLApplication.Disconnect;
    end;

}
end;


initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TExtractionForm,
    Class_ExtractionForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit IncExpDDImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, IncExpDD_TLB, StdVcl, SBPlgAx50_TLB, ImgList, StdCtrls,
  ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, Excel97, OleServer,
  CMExcelExport;

type
  TIncExpDDMain = class(TActiveForm, IIncExpDDMain, IIconExporter)
    ImageList: TImageList;
    PanelAlTop: TPanel;
    GBoxDates: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DTPickerBeg: TDateTimePicker;
    DTPickerEnd: TDateTimePicker;
    PanelAlClient: TPanel;
    GBoxFilials: TGroupBox;
    CBoxFilial: TComboBox;
    OKBtn: TSpeedButton;
    ExcelBtn: TSpeedButton;
    DBGridIncExpenses: TDBGrid;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelApplication1: TExcelApplication;
    ProgressBar: TProgressBar;
    LabelInfo: TLabel;
    ExcelExporter: TCMExcelExport;
    procedure ActiveFormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure ExcelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IIncExpDDMainEvents;
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
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, SboapiDataModuleImpl, UnitDataMod, SBTranslateProc;

{$R *.DFM}

{ TIncExpDDMain }

function TIncExpDDMain.Get_Icon: OLE_HANDLE;
const
  ImageIndex =0;
begin
  ImageList.GetIcon(ImageIndex,Icon);
  Result := Icon.Handle;
end;

procedure TIncExpDDMain.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_IncExpDDMainPage); }
end;

procedure TIncExpDDMain.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IIncExpDDMainEvents;
end;

procedure TIncExpDDMain.Initialize;
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

function TIncExpDDMain.Get_Active: WordBool;
begin
  Result := Active;
end;

function TIncExpDDMain.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TIncExpDDMain.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TIncExpDDMain.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TIncExpDDMain.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TIncExpDDMain.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TIncExpDDMain.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TIncExpDDMain.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TIncExpDDMain.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TIncExpDDMain.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TIncExpDDMain.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TIncExpDDMain.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TIncExpDDMain.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TIncExpDDMain.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TIncExpDDMain.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TIncExpDDMain.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TIncExpDDMain.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TIncExpDDMain.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TIncExpDDMain._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TIncExpDDMain.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TIncExpDDMain.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TIncExpDDMain.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TIncExpDDMain.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TIncExpDDMain.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TIncExpDDMain.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TIncExpDDMain.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TIncExpDDMain.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TIncExpDDMain.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TIncExpDDMain.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TIncExpDDMain.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TIncExpDDMain.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TIncExpDDMain.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TIncExpDDMain.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TIncExpDDMain.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TIncExpDDMain.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TIncExpDDMain.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TIncExpDDMain.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TIncExpDDMain.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TIncExpDDMain.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TIncExpDDMain.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TIncExpDDMain.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TIncExpDDMain.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TIncExpDDMain.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TIncExpDDMain.ActiveFormCreate(Sender: TObject);
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
  CBoxFilial.Items.Clear;
  CBoxFilial.Items.Add('Цмуми банк цзря');
  for i :=1 to DataMod.OrDSFilial.RecordCount do begin
      CBoxFilial.Items.Add(DataMod.OrDSFilialNAME.AsString);
      DataMod.OrDSFilial.Next;
  end;{for i :=1 to DataMod.OrDSFilial.RecordCount}
  CBoxFilial.ItemIndex :=0;

  TranslateAllComponents(Self, DataMod.OPack_SL);
end;

procedure TIncExpDDMain.OKBtnClick(Sender: TObject);
begin
  if CBoxFilial.ItemIndex =0 then
   with DataMod.OS_IncExpenses do begin
    Close;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.DateTime));
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.DateTime));
    Open;
    DataMod.DSIncExpenses.DataSet :=DataMod.OS_IncExpenses;
   end {with DataMod.OS_IncExpenses} {if CBoxFilial.ItemIndex =0}
   else begin
   with DataMod.OrDSFilialCode do begin
    Close;
    SetVariable('FilialName',CBoxFilial.Text);
    Open;
   end;{with DataMod.OrDSFilialCode}
   with DataMod.OS_IncExpBranch do begin
    Close;
    SetVariable('BegDate',FormatDateTime('dd/mm/yyyy',DTPickerBeg.DateTime));
    SetVariable('EndDate',FormatDateTime('dd/mm/yyyy',DTPickerEnd.DateTime));
    SetVariable('FilialCode',DataMod.OrDSFilialCode.FieldByName('ID').AsInteger);
    Open;
   end;{with DataMod.OS_IncExpBranch}
   DataMod.DSIncExpenses.DataSet :=DataMod.OS_IncExpBranch;
   end;{else -->if CBoxFilial.ItemIndex <>0}
  
  DBGridIncExpenses.DataSource :=DataMod.DSIncExpenses;
end;

procedure TIncExpDDMain.ExcelBtnClick(Sender: TObject);
begin
  with ExcelExporter do
  begin
   if not Connected then Connect;
    ExportDataset(DataMod.DSIncExpenses.DataSet,'Inc_Expenses',true);
    Disconnect;
  end;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TIncExpDDMain,
    Class_IncExpDDMain,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

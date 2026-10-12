unit PaymentReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PaymentReport_TLB, StdVcl, Buttons, StdCtrls, ComCtrls,
  ExtCtrls, Db, OracleData, Grids, DBGrids, CMExcelExport;

type
  TPayment_Report = class(TActiveForm, IPayment_Report)
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    PaymentDataSet: TOracleDataSet;
    PaymentDataSrc: TDataSource;
    SysDataSet: TOracleDataSet;
    SysDataSetTEK_DAT: TDateTimeField;
    SysDataSetPRED_DAT: TDateTimeField;
    SysDataSetARC_DAY: TDateTimeField;
    SysDataSetCLOSE: TIntegerField;
    PaymentDataSetDEBIT: TFloatField;
    PaymentDataSetKREDIT: TFloatField;
    PaymentDataSetOLKE: TStringField;
    PaymentDataSetVALUTE: TStringField;
    PaymentDataSetREPNAME: TStringField;
    PaymentDataSetDEBIT_HES: TStringField;
    PaymentDataSetKREDIT_HES: TStringField;
    Animate1: TAnimate;
    ExcelExport: TCMExcelExport;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IPayment_ReportEvents;
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
  end;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TPayment_Report }

procedure TPayment_Report.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Payment_ReportPage); }
end;

procedure TPayment_Report.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPayment_ReportEvents;
end;

procedure TPayment_Report.Initialize;
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

function TPayment_Report.Get_Active: WordBool;
begin
  Result := Active;
end;

function TPayment_Report.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TPayment_Report.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TPayment_Report.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TPayment_Report.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TPayment_Report.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TPayment_Report.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TPayment_Report.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TPayment_Report.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TPayment_Report.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TPayment_Report.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TPayment_Report.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TPayment_Report.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TPayment_Report.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TPayment_Report.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TPayment_Report.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TPayment_Report.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TPayment_Report.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TPayment_Report._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPayment_Report.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TPayment_Report.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPayment_Report.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TPayment_Report.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPayment_Report.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TPayment_Report.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TPayment_Report.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TPayment_Report.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TPayment_Report.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TPayment_Report.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TPayment_Report.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TPayment_Report.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TPayment_Report.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TPayment_Report.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TPayment_Report.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TPayment_Report.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TPayment_Report.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TPayment_Report.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPayment_Report.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TPayment_Report.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TPayment_Report.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TPayment_Report.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TPayment_Report.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TPayment_Report.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TPayment_Report.SpeedButton1Click(Sender: TObject);
var
dat,dat1:string;
begin
  Animate1.Visible:=True;
  Animate1.Active:=True;
  Animate1.CommonAVI:=aviFindFolder ;
dat:=DateToStr(DateTimePicker1.DateTime);
dat1:=DateToStr(DateTimePicker2.DateTime);

with PaymentDataSet do begin
close;
SetVariable('dat', dat);
SetVariable('dat1',dat1);
open;
end;
  Animate1.Visible:=false;
  Animate1.Active :=false;
end;

procedure TPayment_Report.ActiveFormCreate(Sender: TObject);
begin
SysDataSet.open;
PaymentDataSet.open;
DateTimePicker1.DateTime:= SysDataSet.FieldbyName('TEK_DAT').asDateTime ;
DateTimePicker2.DateTime:= SysDataSet.FieldbyName('TEK_DAT').asDateTime
end;

procedure TPayment_Report.ActiveFormDestroy(Sender: TObject);
begin
PaymentDataSet.close;
SysDataSet.close;
end;

procedure TPayment_Report.SpeedButton2Click(Sender: TObject);
begin
with ExcelExport do
   begin
      Connect;
      ExportDataset(PaymentDataSet,'Tediye',True,false);
      Disconnect;
   end
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TPayment_Report,
    Class_Payment_Report,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

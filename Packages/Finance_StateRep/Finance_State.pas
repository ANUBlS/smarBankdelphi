unit Finance_State;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Finance_StateRep_TLB, StdVcl, StdCtrls, ComCtrls;

type
  TFinance_StateForm = class(TActiveForm, IFinance_State)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DTP1: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    procedure ActiveFormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFinance_StateEvents;
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

var
  Finance_StateForm : TFinance_StateForm;
  CurrentDate : TdateTime;
implementation

uses ComObj, ComServ,  sboapiDataModuleImpl, UnitMainReport, SBTranslateProc;

{$R *.DFM}

{ TFinance_State }

procedure TFinance_StateForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Finance_StatePage); }
end;

procedure TFinance_StateForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFinance_StateEvents;
end;

procedure TFinance_StateForm.Initialize;
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

function TFinance_StateForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFinance_StateForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFinance_StateForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFinance_StateForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFinance_StateForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFinance_StateForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFinance_StateForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFinance_StateForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFinance_StateForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFinance_StateForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFinance_StateForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFinance_StateForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFinance_StateForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFinance_StateForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFinance_StateForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFinance_StateForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFinance_StateForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFinance_StateForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFinance_StateForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFinance_StateForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFinance_StateForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFinance_StateForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFinance_StateForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFinance_StateForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFinance_StateForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFinance_StateForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFinance_StateForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFinance_StateForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFinance_StateForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFinance_StateForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFinance_StateForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFinance_StateForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFinance_StateForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFinance_StateForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFinance_StateForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFinance_StateForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFinance_StateForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFinance_StateForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFinance_StateForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFinance_StateForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFinance_StateForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFinance_StateForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFinance_StateForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFinance_StateForm.ActiveFormCreate(Sender: TObject);
begin
  Finance_StateForm := Self;
  with sboapiDataModule do
    CurrentDate:= SBOperationDay.CallDateFunction('get_date', []);
  DTP1.Date := CurrentDate;
  SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFinance_StateForm.Button1Click(Sender: TObject);
begin
 try
  Screen.Cursor := crSQLWait;
  if not Assigned(QRFinanceRep) then
  QRFinanceRep := TQRFinanceRep.Create(self);
  with QRFinanceRep, ODSetRep do
    begin

     SetVariable('In_Date', FormatDateTime('dd-mmm-yyyy', DTP1.date));
     Active := not Active;
     Open;
     QRLDate.Caption := FormatDateTime('dd-mmm-yyyy', DTP1.date);
     QRYearActive.Caption := FormatDateTime('yyyy', DTP1.date);
     QRYearPassiv.Caption := FormatDateTime('yyyy', DTP1.date);
     Screen.Cursor := crDefault;
     Preview;

    end;
  finally
//  QRFinanceRep.Free;
  Screen.Cursor := crDefault;
 end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFinance_StateForm,
    Class_Finance_State,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

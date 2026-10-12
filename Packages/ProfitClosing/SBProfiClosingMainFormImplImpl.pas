unit SBProfiClosingMainFormImplImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ProfitClosing_TLB, StdVcl;

type
  TSBProfiClosingMainFormImpl = class(TActiveForm, ISBProfiClosingMainFormImpl)
  private
    { Private declarations }
    FEvents: ISBProfiClosingMainFormImplEvents;
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

uses ComObj, ComServ;

{$R *.DFM}

{ TSBProfiClosingMainFormImpl }

procedure TSBProfiClosingMainFormImpl.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SBProfiClosingMainFormImplPage); }
end;

procedure TSBProfiClosingMainFormImpl.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISBProfiClosingMainFormImplEvents;
end;

procedure TSBProfiClosingMainFormImpl.Initialize;
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

function TSBProfiClosingMainFormImpl.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSBProfiClosingMainFormImpl.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSBProfiClosingMainFormImpl.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSBProfiClosingMainFormImpl.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSBProfiClosingMainFormImpl.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSBProfiClosingMainFormImpl.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSBProfiClosingMainFormImpl.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSBProfiClosingMainFormImpl.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSBProfiClosingMainFormImpl.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSBProfiClosingMainFormImpl.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSBProfiClosingMainFormImpl.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSBProfiClosingMainFormImpl.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSBProfiClosingMainFormImpl.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSBProfiClosingMainFormImpl.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSBProfiClosingMainFormImpl.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSBProfiClosingMainFormImpl.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSBProfiClosingMainFormImpl.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSBProfiClosingMainFormImpl.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSBProfiClosingMainFormImpl._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBProfiClosingMainFormImpl.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSBProfiClosingMainFormImpl.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSBProfiClosingMainFormImpl.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSBProfiClosingMainFormImpl.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSBProfiClosingMainFormImpl.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSBProfiClosingMainFormImpl.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSBProfiClosingMainFormImpl.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSBProfiClosingMainFormImpl.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSBProfiClosingMainFormImpl.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_HelpFile(
  const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSBProfiClosingMainFormImpl.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSBProfiClosingMainFormImpl.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSBProfiClosingMainFormImpl,
    Class_SBProfiClosingMainFormImpl,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

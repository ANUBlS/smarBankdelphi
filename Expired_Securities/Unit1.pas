unit Unit1;

{$WARN SYMBOL_PLATFORM OFF}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Newocx_TLB, StdVcl;

type
  Tnew = class(TActiveForm, Inew)
  private
    { Private declarations }
    FEvents: InewEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ Tnew }

procedure Tnew.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_newPage); }
end;

procedure Tnew.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as InewEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure Tnew.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function Tnew.Get_Active: WordBool;
begin
  Result := Active;
end;

function Tnew.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function Tnew.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function Tnew.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function Tnew.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function Tnew.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function Tnew.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function Tnew.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function Tnew.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function Tnew.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function Tnew.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function Tnew.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function Tnew.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function Tnew.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function Tnew.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function Tnew.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function Tnew.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function Tnew.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function Tnew.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function Tnew.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function Tnew.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function Tnew.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function Tnew.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function Tnew.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function Tnew.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function Tnew.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function Tnew.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function Tnew.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function Tnew.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function Tnew.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function Tnew.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function Tnew.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure Tnew._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tnew.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure Tnew.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure Tnew.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure Tnew.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure Tnew.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure Tnew.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure Tnew.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure Tnew.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure Tnew.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure Tnew.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure Tnew.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure Tnew.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure Tnew.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure Tnew.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure Tnew.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure Tnew.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure Tnew.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure Tnew.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure Tnew.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure Tnew.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure Tnew.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure Tnew.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tnew.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure Tnew.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure Tnew.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure Tnew.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure Tnew.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure Tnew.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure Tnew.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure Tnew.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure Tnew.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure Tnew.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure Tnew.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure Tnew.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    Tnew,
    Class_new,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

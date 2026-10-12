unit Toksikimpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Toksik_TLB, StdVcl, ComCtrls, ToolWin, ExtCtrls, Grids,
  XDBGrids, ImgList;

type
  TToksik = class(TActiveForm, IToksik)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    XDBGrid1: TXDBGrid;
    ImageList1: TImageList;
    ToolButton10: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: IToksikEvents;
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
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
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
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
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

uses ComObj, ComServ, NewToksikForm;

{$R *.DFM}

{ TToksik }

procedure TToksik.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ToksikPage); }
end;

procedure TToksik.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IToksikEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TToksik.Initialize;
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

function TToksik.Get_Active: WordBool;
begin
  Result := Active;
end;

function TToksik.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TToksik.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TToksik.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TToksik.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TToksik.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TToksik.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TToksik.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TToksik.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TToksik.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TToksik.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TToksik.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TToksik.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TToksik.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TToksik.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TToksik.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TToksik.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TToksik.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TToksik.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TToksik.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TToksik.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TToksik.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TToksik.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TToksik.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TToksik.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TToksik.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TToksik.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TToksik.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TToksik.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TToksik.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TToksik.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TToksik.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TToksik._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TToksik.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TToksik.ActiveFormCreate(Sender: TObject);
begin
  FormNewToksik:=TFormNewToksik.Create(self);
end;

procedure TToksik.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TToksik.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TToksik.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TToksik.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TToksik.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TToksik.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TToksik.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TToksik.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TToksik.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TToksik.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TToksik.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TToksik.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TToksik.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TToksik.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TToksik.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TToksik.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TToksik.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TToksik.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TToksik.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TToksik.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TToksik.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TToksik.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TToksik.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TToksik.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TToksik.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TToksik.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TToksik.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TToksik.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TToksik.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TToksik.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TToksik.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TToksik.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TToksik.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TToksik.ToolButton1Click(Sender: TObject);
begin
  FormNewToksik.ShowModal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TToksik,
    Class_Toksik,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

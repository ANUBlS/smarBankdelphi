unit ExecutionManagers;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Project1_TLB, StdVcl;

type
  TExecutionManager = class(TActiveForm, IExecutionManager)
  private
    { Private declarations }
    FEvents: IExecutionManagerEvents;
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

uses ComObj, ComServ;

{$R *.DFM}

{ TExecutionManager }

procedure TExecutionManager.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ExecutionManagerPage); }
end;

procedure TExecutionManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IExecutionManagerEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TExecutionManager.Initialize;
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

function TExecutionManager.Get_Active: WordBool;
begin
  Result := Active;
end;

function TExecutionManager.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TExecutionManager.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TExecutionManager.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TExecutionManager.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TExecutionManager.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TExecutionManager.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TExecutionManager.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TExecutionManager.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TExecutionManager.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TExecutionManager.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TExecutionManager.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TExecutionManager.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TExecutionManager.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TExecutionManager.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TExecutionManager.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TExecutionManager.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TExecutionManager.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TExecutionManager.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TExecutionManager.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TExecutionManager.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TExecutionManager.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TExecutionManager.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TExecutionManager.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TExecutionManager.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TExecutionManager.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TExecutionManager.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TExecutionManager.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TExecutionManager.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TExecutionManager.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TExecutionManager.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TExecutionManager.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TExecutionManager._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TExecutionManager.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TExecutionManager.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TExecutionManager.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TExecutionManager.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TExecutionManager.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TExecutionManager.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TExecutionManager.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TExecutionManager.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TExecutionManager.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TExecutionManager.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TExecutionManager.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TExecutionManager.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TExecutionManager.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TExecutionManager.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TExecutionManager.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TExecutionManager.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TExecutionManager.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TExecutionManager.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TExecutionManager.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TExecutionManager.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TExecutionManager.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TExecutionManager.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TExecutionManager.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TExecutionManager.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TExecutionManager.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TExecutionManager.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TExecutionManager.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TExecutionManager.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TExecutionManager.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TExecutionManager.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TExecutionManager.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TExecutionManager.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TExecutionManager.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TExecutionManager.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TExecutionManager,
    Class_ExecutionManager,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

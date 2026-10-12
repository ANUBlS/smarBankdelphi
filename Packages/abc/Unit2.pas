unit Unit2;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Project2_TLB, StdVcl, DB, OracleData, StdCtrls, Grids,
  DBGrids, Mask, DBCtrlsEh;

type
  Tsa = class(TActiveForm, Isa)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IsaEvents;
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

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ Tsa }

procedure Tsa.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_saPage); }
end;

procedure Tsa.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IsaEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure Tsa.Initialize;
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

function Tsa.Get_Active: WordBool;
begin
  Result := Active;
end;

function Tsa.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function Tsa.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function Tsa.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function Tsa.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function Tsa.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function Tsa.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function Tsa.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function Tsa.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function Tsa.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function Tsa.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function Tsa.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function Tsa.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function Tsa.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function Tsa.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function Tsa.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function Tsa.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function Tsa.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function Tsa.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function Tsa.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function Tsa.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function Tsa.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function Tsa.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function Tsa.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function Tsa.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function Tsa.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function Tsa.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function Tsa.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function Tsa.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function Tsa.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function Tsa.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function Tsa.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure Tsa._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tsa.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure Tsa.Button1Click(Sender: TObject);
begin
DBDateTimeEditEh1.Value:=OracleDataSet1.FieldByName('SAMELYDATE').AsVariant;
end;

procedure Tsa.Button2Click(Sender: TObject);
begin
DBDateTimeEditEh1.Clear;
end;

procedure Tsa.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure Tsa.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure Tsa.DBGrid1DblClick(Sender: TObject);
begin
DBDateTimeEditEh1.Value:=OracleDataSet1.FieldByName('SAMELYDATE').AsVariant;
end;

procedure Tsa.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure Tsa.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure Tsa.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure Tsa.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure Tsa.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure Tsa.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure Tsa.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure Tsa.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure Tsa.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure Tsa.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure Tsa.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure Tsa.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure Tsa.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure Tsa.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure Tsa.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure Tsa.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure Tsa.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure Tsa.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure Tsa.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tsa.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure Tsa.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure Tsa.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure Tsa.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure Tsa.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure Tsa.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure Tsa.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure Tsa.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure Tsa.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure Tsa.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure Tsa.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure Tsa.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    Tsa,
    Class_sa,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

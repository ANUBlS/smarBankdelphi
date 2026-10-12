unit ProblemCreditManagerImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Project1_TLB, StdVcl, StdCtrls, ExtCtrls, DBGridEhGrouping,
  GridsEh, DBGridEh,Oracle, OracleData, DBCtrls, Buttons,DB, Grids, XDBGrids;

type
  TProblemCreditManager = class(TActiveForm, IProblemCreditManager)
    Panel1: TPanel;
    PanelFilter: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    SpeedButton2: TSpeedButton;
    XDBGrid1: TXDBGrid;
    procedure ActiveFormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CalcGridDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IProblemCreditManagerEvents;
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

uses ComObj, ComServ, DataMPrCrImpl, InfoFrmImpl;

{$R *.DFM}

{ TProblemCreditManager }
 const
  LoadingFailed : Boolean = True;
  DataColIndex : Integer = 0;
procedure TProblemCreditManager.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ProblemCreditManagerPage); }
end;

procedure TProblemCreditManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IProblemCreditManagerEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TProblemCreditManager.Initialize;
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

function TProblemCreditManager.Get_Active: WordBool;
begin
  Result := Active;
end;

function TProblemCreditManager.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TProblemCreditManager.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TProblemCreditManager.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TProblemCreditManager.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TProblemCreditManager.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TProblemCreditManager.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TProblemCreditManager.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TProblemCreditManager.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TProblemCreditManager.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TProblemCreditManager.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TProblemCreditManager.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TProblemCreditManager.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TProblemCreditManager.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TProblemCreditManager.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TProblemCreditManager.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TProblemCreditManager.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TProblemCreditManager.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TProblemCreditManager.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TProblemCreditManager.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TProblemCreditManager.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TProblemCreditManager.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TProblemCreditManager.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TProblemCreditManager.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TProblemCreditManager.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TProblemCreditManager.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TProblemCreditManager.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TProblemCreditManager.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TProblemCreditManager.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TProblemCreditManager.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TProblemCreditManager.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TProblemCreditManager.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TProblemCreditManager._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TProblemCreditManager.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TProblemCreditManager.ActiveFormCreate(Sender: TObject);
begin
  DataMPrCredit := TDataMPrCredit.Create(Self);
  InfoFrm :=TInfoFrm.Create(Self);
end;
 procedure TProblemCreditManager.Button1Click(Sender: TObject);
begin
InfoFrm.ShowModal;
end;

procedure TProblemCreditManager.CalcGridDblClick(Sender: TObject);
begin
With DataMPrCredit.CreditInfoDSet do
begin
 close ;
 SetVariable('id',DataMPrCredit.IntCache.FieldByName('id').AsInteger);
 open;
end;
  InfoFrm.ShowModal;
end;


procedure TProblemCreditManager.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TProblemCreditManager.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TProblemCreditManager.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TProblemCreditManager.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TProblemCreditManager.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TProblemCreditManager.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TProblemCreditManager.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TProblemCreditManager.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TProblemCreditManager.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TProblemCreditManager.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TProblemCreditManager.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TProblemCreditManager.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TProblemCreditManager.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);

begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TProblemCreditManager.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TProblemCreditManager.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TProblemCreditManager.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TProblemCreditManager.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TProblemCreditManager.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TProblemCreditManager.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TProblemCreditManager.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TProblemCreditManager.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TProblemCreditManager.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TProblemCreditManager.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TProblemCreditManager.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TProblemCreditManager.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TProblemCreditManager.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TProblemCreditManager.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TProblemCreditManager.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TProblemCreditManager.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TProblemCreditManager.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TProblemCreditManager.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TProblemCreditManager.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TProblemCreditManager.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TProblemCreditManager.SpeedButton1Click(Sender: TObject);
begin
   PanelFilter.Visible := not PanelFilter.Visible;
      if( SpeedButton2.AllowAllUp ) then
  begin
    SpeedButton2.AllowAllUp := False;
    SpeedButton2.Down := True;
  end else
  begin
    SpeedButton2.AllowAllUp := True;
    SpeedButton2.Down := False;
  end;
end;

procedure TProblemCreditManager.SpeedButton2Click(Sender: TObject);
begin
PanelFilter.Visible := not PanelFilter.Visible;

  if( SpeedButton2.AllowAllUp ) then
  begin
    SpeedButton2.AllowAllUp := False;
    SpeedButton2.Down := True;
  end else
  begin
    SpeedButton2.AllowAllUp := True;
    SpeedButton2.Down := False;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TProblemCreditManager,
    Class_ProblemCreditManager,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit autoImpl1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, autoProj1_TLB, StdVcl, StdCtrls, Buttons, DBCtrls, Grids,
  DBGrids, ExtCtrls, ComCtrls;

type
  Tauto = class(TActiveForm, Iauto)
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IautoEvents;
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

uses ComObj, ComServ,DMautoImpl;//,sboapiDataModuleImpl,SBTranslateProc;


{$R *.DFM}

{ Tauto }

procedure Tauto.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_autoPage); }
end;

procedure Tauto.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IautoEvents;
end;

procedure Tauto.Initialize;
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

function Tauto.Get_Active: WordBool;
begin
  Result := Active;
end;

function Tauto.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function Tauto.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function Tauto.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function Tauto.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function Tauto.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function Tauto.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function Tauto.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function Tauto.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function Tauto.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function Tauto.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function Tauto.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function Tauto.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function Tauto.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function Tauto.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function Tauto.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function Tauto.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function Tauto.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure Tauto._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tauto.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure Tauto.BitBtn1Click(Sender: TObject);
begin
  {DMauto.ODSMain.Refresh;
  DMauto.ODSChilde.Refresh;
  DMauto.ODSStates.Refresh; }
end;

procedure Tauto.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure Tauto.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure Tauto.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure Tauto.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure Tauto.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure Tauto.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure Tauto.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure Tauto.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure Tauto.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure Tauto.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure Tauto.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure Tauto.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure Tauto.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure Tauto.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure Tauto.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure Tauto.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure Tauto.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tauto.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure Tauto.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure Tauto.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure Tauto.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure Tauto.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure Tauto.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    Tauto,
    Class_auto,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

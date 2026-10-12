unit TSaldoEditorImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, SaldoEditor_TLB, StdVcl, StdCtrls, Grids, DBGrids,
  ComCtrls, ExtCtrls, DBCtrls, ToolWin;

type
  TSaldoEditor_ = class(TActiveForm, ISaldoEditor)
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    ToolButton1: TToolButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
  private
    { Private declarations }
    FEvents: ISaldoEditorEvents;
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
    { TODO: Change all instances of type [ITSaldoEditorEvents] to [ISaldoEditorEvents].}
 { Delphi was not able to update this file to reflect
   The change of the name of your event interface
   because of the presence of instance variables. 
   The type library was updated but you must update 
   this implementation file by hand. }
end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TTSaldoEditor }

procedure TSaldoEditor_.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TSaldoEditorPage); }
end;

procedure TSaldoEditor_.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISaldoEditorEvents;
end;

procedure TSaldoEditor_.Initialize;
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

function TSaldoEditor_.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSaldoEditor_.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSaldoEditor_.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSaldoEditor_.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSaldoEditor_.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSaldoEditor_.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSaldoEditor_.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSaldoEditor_.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSaldoEditor_.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSaldoEditor_.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSaldoEditor_.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSaldoEditor_.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSaldoEditor_.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSaldoEditor_.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSaldoEditor_.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSaldoEditor_.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSaldoEditor_.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSaldoEditor_.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSaldoEditor_._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSaldoEditor_.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSaldoEditor_.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSaldoEditor_.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSaldoEditor_.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSaldoEditor_.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSaldoEditor_.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSaldoEditor_.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSaldoEditor_.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSaldoEditor_.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSaldoEditor_.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSaldoEditor_.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSaldoEditor_.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSaldoEditor_.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSaldoEditor_.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSaldoEditor_.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSaldoEditor_.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSaldoEditor_.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSaldoEditor_.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSaldoEditor_.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSaldoEditor_.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSaldoEditor_.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSaldoEditor_.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSaldoEditor_.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSaldoEditor_.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSaldoEditor_,
    Class_SaldoEditor_,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

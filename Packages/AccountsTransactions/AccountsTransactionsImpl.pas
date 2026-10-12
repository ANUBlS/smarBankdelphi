unit AccountsTransactionsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, AccountsTransactions_TLB, StdVcl, Grids, DBGrids,
  ExtCtrls, ToolWin, ComCtrls;

type
  TFormAccountsTransactions = class(TActiveForm, IFormAccountsTransactions)
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    DBGridACT_TYPES: TDBGrid;
    DBGridACT_Accounts: TDBGrid;
    Panel2: TPanel;
    DBGridACCOUNT: TDBGrid;
    procedure ActiveFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFormAccountsTransactionsEvents;
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

uses ComObj, ComServ, UnitDataMod;

{$R *.DFM}

{ TFormAccountsTransactions }

procedure TFormAccountsTransactions.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FormAccountsTransactionsPage); }
end;

procedure TFormAccountsTransactions.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFormAccountsTransactionsEvents;
end;

procedure TFormAccountsTransactions.Initialize;
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

function TFormAccountsTransactions.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFormAccountsTransactions.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFormAccountsTransactions.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFormAccountsTransactions.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFormAccountsTransactions.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFormAccountsTransactions.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFormAccountsTransactions.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFormAccountsTransactions.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFormAccountsTransactions.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFormAccountsTransactions.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFormAccountsTransactions.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFormAccountsTransactions.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFormAccountsTransactions.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFormAccountsTransactions.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFormAccountsTransactions.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFormAccountsTransactions.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFormAccountsTransactions.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFormAccountsTransactions.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFormAccountsTransactions._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFormAccountsTransactions.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFormAccountsTransactions.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFormAccountsTransactions.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFormAccountsTransactions.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFormAccountsTransactions.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFormAccountsTransactions.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFormAccountsTransactions.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFormAccountsTransactions.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFormAccountsTransactions.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFormAccountsTransactions.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFormAccountsTransactions.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFormAccountsTransactions.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFormAccountsTransactions.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFormAccountsTransactions.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFormAccountsTransactions.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFormAccountsTransactions.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFormAccountsTransactions.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFormAccountsTransactions.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFormAccountsTransactions.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFormAccountsTransactions.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFormAccountsTransactions.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFormAccountsTransactions.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFormAccountsTransactions.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFormAccountsTransactions.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFormAccountsTransactions.ActiveFormCreate(Sender: TObject);
begin
  with DataMod do begin
   OrDSAccount.Open;
   OrDSACT_TYPES.Open;
   OrDSACT_ACCOUNTS.Open;
  end; {with DataMod}
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFormAccountsTransactions,
    Class_FormAccountsTransactions,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

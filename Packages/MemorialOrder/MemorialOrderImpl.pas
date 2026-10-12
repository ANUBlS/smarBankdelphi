unit MemorialOrderImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MemorialOrder_TLB, StdVcl, ExtCtrls, ImgList, ComCtrls,
  ToolWin, Grids, DBGrids, StdCtrls, SearchCombo;

type
  TfrmMemorialOrder = class(TActiveForm, IfrmMemorialOrder)
    Panel1: TPanel;
    Panel2: TPanel;
    FilterPanel: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    RefreshTB: TToolButton;
    ToolButton2: TToolButton;
    ShowReportTB: TToolButton;
    MOrdImages: TImageList;
    TransactionsViewer: TDBGrid;
    ToolButton1: TToolButton;
    ShowFilterPanelTB: TToolButton;
    GroupBox1: TGroupBox;
    DTPFirstDate: TDateTimePicker;
    GroupBox2: TGroupBox;
    CurrencysCB: TSearchCombo;
    GroupBox3: TGroupBox;
    BranchesCB: TSearchCombo;
    GroupBox5: TGroupBox;
    UsersCB: TSearchCombo;
    SelfTransactionsCB: TCheckBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    DebetAccsEdit: TEdit;
    DebetAccTypeCB: TCheckBox;
    GroupBox8: TGroupBox;
    CreditAccsEdit: TEdit;
    CreditAccTypeCB: TCheckBox;
    UseFilterCB: TCheckBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RadioGroup1: TRadioGroup;
    GroupBox9: TGroupBox;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    DTPLastDate: TDateTimePicker;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    procedure ActiveFormCreate(Sender: TObject);
    procedure SelfTransactionsCBClick(Sender: TObject);
    procedure ShowFilterPanelTBClick(Sender: TObject);
    procedure UseFilterCBClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IfrmMemorialOrderEvents;
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

uses ComObj, ComServ, MOrdDataModImpl, TuningAccountsUnit;

{$R *.DFM}

{ TfrmMemorialOrder }

procedure TfrmMemorialOrder.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_frmMemorialOrderPage); }
end;

procedure TfrmMemorialOrder.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfrmMemorialOrderEvents;
end;

procedure TfrmMemorialOrder.Initialize;
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

function TfrmMemorialOrder.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmMemorialOrder.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmMemorialOrder.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmMemorialOrder.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmMemorialOrder.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmMemorialOrder.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmMemorialOrder.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfrmMemorialOrder.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmMemorialOrder.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmMemorialOrder.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmMemorialOrder.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmMemorialOrder.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmMemorialOrder.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmMemorialOrder.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmMemorialOrder.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmMemorialOrder.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmMemorialOrder.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmMemorialOrder.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmMemorialOrder._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmMemorialOrder.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfrmMemorialOrder.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfrmMemorialOrder.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfrmMemorialOrder.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfrmMemorialOrder.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfrmMemorialOrder.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfrmMemorialOrder.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfrmMemorialOrder.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfrmMemorialOrder.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmMemorialOrder.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmMemorialOrder.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmMemorialOrder.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmMemorialOrder.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmMemorialOrder.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfrmMemorialOrder.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmMemorialOrder.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmMemorialOrder.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmMemorialOrder.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmMemorialOrder.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfrmMemorialOrder.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmMemorialOrder.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmMemorialOrder.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmMemorialOrder.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmMemorialOrder.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfrmMemorialOrder.ActiveFormCreate(Sender: TObject);
begin
  MOrdDataMod := TMOrdDataMod.Create(Self);
  frmTuning := TfrmTuning.Create(Self);
  UseFilterCBClick(UseFilterCB);
end;

procedure TfrmMemorialOrder.SelfTransactionsCBClick(Sender: TObject);
begin
  with Sender as TCheckBox do
  UsersCB.Enabled := not Checked
end;

procedure TfrmMemorialOrder.ShowFilterPanelTBClick(Sender: TObject);
begin
  with Sender as TToolButton do
  FilterPanel.Visible := Down;
end;

procedure TfrmMemorialOrder.UseFilterCBClick(Sender: TObject);
var
  Enable : Boolean;
begin
  Enable := (Sender as TCheckBox).Checked;
  DebetAccsEdit.Enabled  := Enable;
  DebetAccTypeCB.Enabled  := Enable;
  CreditAccsEdit.Enabled := Enable;
  CreditAccTypeCB.Enabled := Enable;
  
  if not Enable then
  begin
    DebetAccsEdit.Color := clGrayText;
    CreditAccsEdit.Color := clGrayText;
  end else
  begin
    DebetAccsEdit.Color := clWhite;
    CreditAccsEdit.Color := clWhite;
  end;

end;

procedure TfrmMemorialOrder.ToolButton4Click(Sender: TObject);
begin
  frmTuning.ShowModal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmMemorialOrder,
    Class_frmMemorialOrder,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit TransactionsDocumentImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, TransactionsDocument_TLB, StdVcl, ComCtrls, ToolWin,
  ExtCtrls, ActnList, ImgList, Grids, DBGrids, StdCtrls, CurrencyEdit,
  DBCtrls, DBViewComboBox, Buttons, Mask, Menus;

type
  TTransactionsDocumentX = class(TActiveForm, ITransactionsDocumentX)
    ActionList1: TActionList;
    ImageList1: TImageList;
    TopAction: TAction;
    PriorAction: TAction;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    NextAction: TAction;
    LastAction: TAction;
    Update: TAction;
    ToolButton6: TToolButton;
    ToggleFilterAction: TAction;
    ToolButton7: TToolButton;
    Panel4: TPanel;
    ToolButton10: TToolButton;
    PreviewAction: TAction;
    PrintAction: TAction;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    MaskEdit1: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton5: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox5: TGroupBox;
    DBViewComboBox7: TDBViewComboBox;
    GroupBox6: TGroupBox;
    Bevel3: TBevel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioButton2: TRadioButton;
    CheckBox7: TCheckBox;
    RadioButton1: TRadioButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    DebitCurrencyCB: TDBViewComboBox;
    CheckBox2: TCheckBox;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    DBText1: TDBText;
    Label4: TLabel;
    DebitBalanceCB: TDBViewComboBox;
    TabSheet4: TTabSheet;
    DBText2: TDBText;
    DebitAccountCB: TDBViewComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    CreditCurrencyCB: TDBViewComboBox;
    CheckBox1: TCheckBox;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    DBText3: TDBText;
    Label6: TLabel;
    CreditBalanceCB: TDBViewComboBox;
    TabSheet6: TTabSheet;
    DBText4: TDBText;
    CreditAccountCB: TDBViewComboBox;
    TabSheet8: TTabSheet;
    GroupBox9: TGroupBox;
    ListBox1: TListBox;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox10: TGroupBox;
    Panel10: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ListBox2: TListBox;
    ToolBar2: TToolBar;
    TabSheet7: TTabSheet;
    GroupBox8: TGroupBox;
    GroupBox7: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Panel6: TPanel;
    Label7: TLabel;
    AmountEdit: TCurrencyEdit;
    Panel7: TPanel;
    LessButton: TSpeedButton;
    EqualButton: TSpeedButton;
    MoreButton: TSpeedButton;
    NotEqualButton: TSpeedButton;
    SpeedButton6: TSpeedButton;
    CheckBox8: TCheckBox;
    Label8: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Action6: TAction;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBGrid1: TDBGrid;
    procedure ToggleFilterActionExecute(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure UpdateExecute(Sender: TObject);
    procedure PreviewActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure TopActionExecute(Sender: TObject);
    procedure PriorActionExecute(Sender: TObject);
    procedure NextActionExecute(Sender: TObject);
    procedure LastActionExecute(Sender: TObject);
  private
    { Private declarations }
    FEvents: ITransactionsDocumentXEvents;
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
    procedure PrepareTable;
    procedure PrepareReport;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, TransactionsDocDataModUnit, UnRep, ReportUnit;

{$R *.DFM}

{ TTransactionsDocumentX }

procedure TTransactionsDocumentX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TransactionsDocumentXPage); }
end;

procedure TTransactionsDocumentX.PrepareTable;
var
  op_name : string;
  Begdate, Enddate : TDateTime;
begin
  Begdate:= Trunc(DateTimePicker1.datetime);
  Enddate:= Trunc(DateTimePicker2.datetime);
  with TransactionsDocDataMod.TransDocPackage do
    begin
      CallProcedure('getextraction', [
                    Begdate,
                    Enddate
                    ]);
    end;
  with TransactionsDocDataMod.TransDocPackage do
    begin
      op_name := CallStringFunction('GetUserName', [])
    end;
  with TransactionsDocDataMod.ProvarchData do
    begin
      Close;
      with SQL do begin
        Clear;
        Add('select * from Trans_' + op_name);
      end;
      Open;
    end;
end;

procedure TTransactionsDocumentX.PrepareReport;
begin
  if not Assigned(TransactionsDocReportForm) then
    TransactionsDocReportForm := TTransactionsDocReportForm.Create(nil);
end;

procedure TTransactionsDocumentX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITransactionsDocumentXEvents;
end;

procedure TTransactionsDocumentX.Initialize;
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

function TTransactionsDocumentX.Get_Active: WordBool;
begin
  Result := Active;
end;

function TTransactionsDocumentX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TTransactionsDocumentX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TTransactionsDocumentX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTransactionsDocumentX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTransactionsDocumentX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TTransactionsDocumentX.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTransactionsDocumentX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTransactionsDocumentX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTransactionsDocumentX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTransactionsDocumentX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TTransactionsDocumentX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTransactionsDocumentX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTransactionsDocumentX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTransactionsDocumentX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTransactionsDocumentX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTransactionsDocumentX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTransactionsDocumentX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTransactionsDocumentX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTransactionsDocumentX.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTransactionsDocumentX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTransactionsDocumentX.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTransactionsDocumentX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTransactionsDocumentX.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTransactionsDocumentX.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTransactionsDocumentX.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTransactionsDocumentX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTransactionsDocumentX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTransactionsDocumentX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTransactionsDocumentX.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTransactionsDocumentX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTransactionsDocumentX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TTransactionsDocumentX.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTransactionsDocumentX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTransactionsDocumentX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTransactionsDocumentX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTransactionsDocumentX.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTransactionsDocumentX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TTransactionsDocumentX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTransactionsDocumentX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTransactionsDocumentX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTransactionsDocumentX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTransactionsDocumentX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TTransactionsDocumentX.ToggleFilterActionExecute(Sender: TObject);
begin
  with Sender as TAction do
  begin
    Checked := not Checked;
    Panel1.Visible := Checked;
  end;
end;

procedure TTransactionsDocumentX.SpeedButton5Click(Sender: TObject);
begin
  ToggleFilterAction.Execute;
end;

procedure TTransactionsDocumentX.ActiveFormCreate(Sender: TObject);
begin
  if not Assigned(TransactionsDocDataMod) then
    TransactionsDocDataMod := TTransactionsDocDataMod.Create(nil);
  with TransactionsDocDataMod.SysdatData do begin
    Open;
    DateTimePicker1.DateTime:= FieldByName('Tek_dat').AsDateTime;
    DateTimePicker2.DateTime:= FieldByName('Tek_dat').AsDateTime;
  end;
end;

procedure TTransactionsDocumentX.UpdateExecute(Sender: TObject);
begin
  PrepareTable;
end;

procedure TTransactionsDocumentX.PreviewActionExecute(Sender: TObject);
begin
  PrepareReport;
  TransactionsDocReportForm.QuickRep1.Preview;
end;

procedure TTransactionsDocumentX.PrintActionExecute(Sender: TObject);
begin
  PrepareReport;
  TransactionsDocReportForm.QuickRep1.Print;
end;

procedure TTransactionsDocumentX.TopActionExecute(Sender: TObject);
begin
  TransactionsDocDataMod.ProvarchData.First;
end;

procedure TTransactionsDocumentX.PriorActionExecute(Sender: TObject);
begin
  TransactionsDocDataMod.ProvarchData.Prior;
end;

procedure TTransactionsDocumentX.NextActionExecute(Sender: TObject);
begin
  TransactionsDocDataMod.ProvarchData.Next;
end;

procedure TTransactionsDocumentX.LastActionExecute(Sender: TObject);
begin
  TransactionsDocDataMod.ProvarchData.Last;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTransactionsDocumentX,
    Class_TransactionsDocumentX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

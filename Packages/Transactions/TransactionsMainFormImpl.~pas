unit TransactionsMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ExtCtrls, Db, OracleData, Menus, ImgList, ActnList, Mask, DBCtrls,
  StdCtrls, Grids, DBGrids, CurrencyEdit, DBViewComboBox, ComCtrls,
  ToolWin, Buttons, ActiveX, AxCtrls, Transactions_TLB, StdVcl, SBPlgAx50_TLB,
  SBSrvIntf, SBTransaction, HintBox, SearchCombo;

type
  TByteSet = set of TTransactionStatusInt;

const
  FlagSet_Commited = 0;
  FlagSet_Rejected = 1;

type
  TFlagSetInt = FlagSet_Commited..FlagSet_Rejected;

const
  MaxFlagSet = 2;
  FlagSets: array[TFlagSetInt] of TByteSet = (
    [atsDelayed, atsRejected], [atsDelayed, atsRejected]
  );

type
  TTransactionsMainForm = class(
      TActiveForm,
      ITransactionsMainForm,
      IIconExporter,
      IParamInput)
    TrsActionList: TActionList;
    AddTransaction: TAction;
    EditTransaction: TAction;
    DeleteTransaction: TAction;
    RefreshAction: TAction;
    ToggleFilterAction: TAction;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    EditTransaction1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    FilterGB: TGroupBox;
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ResetFilter: TAction;
    UseFilter: TAction;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    DBText1: TDBText;
    Label2: TLabel;
    DebitBalanceCB: TDBViewComboBox;
    TabSheet4: TTabSheet;
    DBText2: TDBText;
    DebitAccountCB: TDBViewComboBox;
    Panel3: TPanel;
    CheckBox2: TCheckBox;
    DebitCurrencyCB: TDBViewComboBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    DBText3: TDBText;
    Label5: TLabel;
    CreditBalanceCB: TDBViewComboBox;
    TabSheet6: TTabSheet;
    DBText4: TDBText;
    CreditAccountCB: TDBViewComboBox;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CreditCurrencyCB: TDBViewComboBox;
    GroupBox6: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioButton2: TRadioButton;
    CheckBox7: TCheckBox;
    FilterActionList: TActionList;
    FilterNationalCurrency: TAction;
    FilterForeignCurrency: TAction;
    FilterMultyCurrency: TAction;
    FilterRateDifference: TAction;
    FilterProfitDebit: TAction;
    FilterTransactionsSelected: TAction;
    FilterDebitUse: TAction;
    FilterCreditUse: TAction;
    FilterTransactionsAll: TAction;
    RadioButton1: TRadioButton;
    Bevel3: TBevel;
    Panel4: TPanel;
    ToolBar3: TToolBar;
    TransactionIDSearchEdit: TEdit;
    TransactionDebitAccNoSearchEdit: TEdit;
    TransactionDebetCurrencySearchEdit: TEdit;
    TransactionCreditAccNoSearchEdit: TEdit;
    TransactionCreditCurrencySearchEdit: TEdit;
    TransactionDebitAmountSearchEdit: TEdit;
    TransactionCreditAmountSearchEdit: TEdit;
    BrowseGrid: TDBGrid;
    DebitAccountData: TOracleDataSet;
    DebitAccountDataID: TFloatField;
    DebitAccountDataACCOUNTNO: TStringField;
    DebitAccountDataNAME: TStringField;
    DebitAccountsSource: TDataSource;
    CreditAccountData: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    CreditAccountsSource: TDataSource;
    DebitBalanceData: TOracleDataSet;
    DebitBalanceSource: TDataSource;
    CreditBalanceSource: TDataSource;
    CreditBalanceData: TOracleDataSet;
    DebitCurrencyData: TOracleDataSet;
    DebitCurrency: TDataSource;
    CreditCurrency: TDataSource;
    CreditCurrencyData: TOracleDataSet;
    TabSheet7: TTabSheet;
    FilterDebitAmount: TAction;
    FilterCreditAmount: TAction;
    FilterLAmount: TAction;
    GroupBox8: TGroupBox;
    GroupBox7: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Panel6: TPanel;
    Label6: TLabel;
    AmountEdit: TCurrencyEdit;
    Panel7: TPanel;
    LessButton: TSpeedButton;
    EqualButton: TSpeedButton;
    MoreButton: TSpeedButton;
    Panel8: TPanel;
    CheckBox8: TCheckBox;
    FilterAmountUse: TAction;
    Panel9: TPanel;
    Button1: TButton;
    FilterAmountApply: TAction;
    NotEqualButton: TSpeedButton;
    TabSheet8: TTabSheet;
    GroupBox9: TGroupBox;
    ListBox1: TListBox;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox10: TGroupBox;
    Panel10: TPanel;
    ListBox2: TListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    OrderAddField: TAction;
    OrderRemoveField: TAction;
    OrderFieldUp: TAction;
    OrderFieldDown: TAction;
    CommitTransaction: TAction;
    CommitTransaction1: TMenuItem;
    ToolButton6: TToolButton;
    FilterCommited: TAction;
    FilterRejected: TAction;
    FilterDelayed: TAction;
    ToolButton9: TToolButton;
    RejectTransaction: TAction;
    LogMemo: TMemo;
    HintsPanel: TPanel;
    RejectReasonPanel: TPanel;
    RejectReasonDBEdit: TDBEdit;
    DestinationPanel: TPanel;
    DestinationEdit: TDBEdit;
    Label3: TLabel;
    RejectedPaintBox: TPaintBox;
    Label7: TLabel;
    SelectAllAction: TAction;
    N4: TMenuItem;
    SelectAllAction1: TMenuItem;
    GroupBox11: TGroupBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Reject1: TMenuItem;
    ToolButton10: TToolButton;
    DatePanel: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    SystemDateLabel: TLabel;
    Label10: TLabel;
    FromDateEdit: TDateTimePicker;
    ToDateEdit: TDateTimePicker;
    TabSheet9: TTabSheet;
    OrderFieldCB: TComboBox;
    Label11: TLabel;
    TransactionTransactionDateSearchEdit: TEdit;
    TransactionLAmountSearchEdit: TEdit;
    FirstRec: TAction;
    LastRec: TAction;
    N5: TMenuItem;
    FirstRec1: TMenuItem;
    LastRec1: TMenuItem;
    HintBox: THintBox;
    CommisionViewer: TDBGrid;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    ActionCommision: TAction;
    N7: TMenuItem;
    Splitter1: TSplitter;
    GroupBox13: TGroupBox;
    scbCFilial: TSearchCombo;
    GroupBox12: TGroupBox;
    scbDFilial: TSearchCombo;
    GroupBox5: TGroupBox;
    scbOperator: TSearchCombo;
    ToolButton11: TToolButton;
    procedure AddTransactionExecute(Sender: TObject);
    procedure DeleteTransactionExecute(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormActivate(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure BrowseGridDblClick(Sender: TObject);
    procedure DeleteTransactionUpdate(Sender: TObject);
    procedure TransactionIDSearchEditChange(Sender: TObject);
    procedure TransactionIDSearchEditExit(Sender: TObject);
    procedure EditTransactionExecute(Sender: TObject);
    procedure N3DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToggleFilterActionExecute(Sender: TObject);
    procedure ToggleRBFilterAction(Sender: TObject);
    procedure FilterNationalCurrencyExecute(Sender: TObject);
    procedure FilterDebitUseExecute(Sender: TObject);
    procedure AccsFilterChanged(DataSet: TDataSet);
    procedure DebitBalanceCBEnter(Sender: TObject);
    procedure DebitAccountCBEnter(Sender: TObject);
    procedure CreditBalanceCBEnter(Sender: TObject);
    procedure CreditAccountCBEnter(Sender: TObject);
    procedure DebitCurrencyCBEnter(Sender: TObject);
    procedure CreditCurrencyCBEnter(Sender: TObject);
    procedure FilterAmountApplyExecute(Sender: TObject);
    procedure FilterAmountUseExecute(Sender: TObject);
    procedure FilterDebitAmountExecute(Sender: TObject);
    procedure LessButtonClick(Sender: TObject);
    procedure CommitTransactionExecute(Sender: TObject);
    procedure CommitTransactionUpdate(Sender: TObject);
    procedure ToggleChecked(Sender: TObject);
    procedure BrowseGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RejectTransactionExecute(Sender: TObject);
    procedure RejectedPaintBoxPaint(Sender: TObject);
    procedure RejectTransactionUpdate(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
    procedure FromDateEditChange(Sender: TObject);
    procedure ToDateEditChange(Sender: TObject);
    procedure OrderFieldCBChange(Sender: TObject);
    procedure FirstRecExecute(Sender: TObject);
    procedure LastRecExecute(Sender: TObject);
    procedure FirstRecUpdate(Sender: TObject);
    procedure LastRecUpdate(Sender: TObject);
    procedure CommisionViewerEnter(Sender: TObject);
    procedure CommisionViewerExit(Sender: TObject);
    procedure CommisionViewerDblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ActionCommisionExecute(Sender: TObject);
    procedure scbOperatorChange(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
  private
    { Private declarations }
    FJustCreated: Boolean;
    FEvents: ITransactionsMainFormEvents;
    FRefreshOnFilterChange: Boolean;
    FAmountCondition: String;
    FViewMode: Boolean;
    FDelayedByDefault: Boolean;
    FSelectionChanged: array[0..MaxFlagSet-1] of Boolean;
    FCurrentDateOnly: Boolean;
    FFromDate: TDateTime;
    FToDate: TDateTime;
    FCurrentDate: TDateTime;
    FUpdateChangeMode: Boolean;
    FLastAllowTransactionUpdate: Boolean;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure SetViewMode(Value: Boolean);
    function ThereAreStatus(FlagSet: Integer): Boolean;
    procedure SetCurrentDateOnly(Value: Boolean);
    procedure UpdateToDate;
    function AllowTransactionUpdate: Boolean;
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
    procedure FilterChanged; virtual;
    {IIconExporter}
    function Get_Icon: OLE_HANDLE; safecall;
    {IParamInput}
    procedure Set_Params(const Name: WideString; Value: OleVariant); safecall;
  public
    { Public declarations }
    isCommisionTransaction : boolean;
    FActionFirstlyExecute : boolean;
    function AccountCurrencyID(accountID :longint) : word;
    procedure Initialize; override;
    property RefreshOnFilterChange: Boolean read FRefreshOnFilterChange write FRefreshOnFilterChange;
    procedure MouseWheelHandler(var Message: TMessage); override;
    property ViewMode: Boolean read FViewMode write SetViewMode;
    procedure TransactionScrolled;
    property CurrentDateOnly: Boolean read FCurrentDateOnly write SetCurrentDateOnly;
  end;

implementation

uses ComObj, ComServ, TransactionPropertiesForm_Unit,
  TransactionsDataModuleImpl, TrDescrForm_Unit, SBCore,
  TemporaryTransactionCommitFormImpl, SBSettings;

{$R *.DFM}

{ TTransactionsMainForm }

procedure TTransactionsMainForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TransactionsMainFormPage); }
end;

procedure TTransactionsMainForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITransactionsMainFormEvents;
end;

procedure TTransactionsMainForm.Initialize;
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

function TTransactionsMainForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TTransactionsMainForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TTransactionsMainForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TTransactionsMainForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTransactionsMainForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTransactionsMainForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TTransactionsMainForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTransactionsMainForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTransactionsMainForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTransactionsMainForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTransactionsMainForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TTransactionsMainForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTransactionsMainForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTransactionsMainForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTransactionsMainForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTransactionsMainForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTransactionsMainForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTransactionsMainForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTransactionsMainForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTransactionsMainForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTransactionsMainForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTransactionsMainForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTransactionsMainForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTransactionsMainForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTransactionsMainForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTransactionsMainForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTransactionsMainForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTransactionsMainForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTransactionsMainForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTransactionsMainForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTransactionsMainForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTransactionsMainForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TTransactionsMainForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTransactionsMainForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTransactionsMainForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTransactionsMainForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTransactionsMainForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTransactionsMainForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TTransactionsMainForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTransactionsMainForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTransactionsMainForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTransactionsMainForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTransactionsMainForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

  { Custom code begin }

  { Form level event handlers }

procedure TTransactionsMainForm.ActiveFormCreate(Sender: TObject);
var
  Index: Integer;
begin
  FRefreshOnFilterChange := True;
  FActionFirstlyExecute := True;
  for Index := 0 to MaxFlagSet-1 do
    FSelectionChanged[Index] := True;

  FUpdateChangeMode := True;

  TrDescrForm := TTrDescrForm.Create(Self);
  TransactionsDataModule := TTransactionsDataModule.Create(nil);
  TransactionsDataModule.MainForm := Self;
  FJustCreated := True;
  TransactionPropertiesForm := TTransactionPropertiesForm.Create(nil);

  FFromDate := -1;
  FToDate := -1;
  SystemDateLabel.Caption := DateToStr(Sb_GetSystemDate);
  FromDateEdit.DateTime := Sb_GetSystemDate;
  FromDateEdit.OnChange(FromDateEdit);

  ToDateEdit.DateTime := FromDateEdit.DateTime;
  ToDateEdit.OnChange(ToDateEdit);
  
//  RefreshAction.Execute;

  FDelayedByDefault := Sb_GetOption('SBTransactionsDelayedByDefault');
  TransactionsDataModule.TransactionsDelayedByDefault := FDelayedByDefault;

  OrderFieldCB.ItemIndex := 0;

  FCurrentDate := Sb_GetSystemDate();
  FRefreshOnFilterChange := False;
end;

procedure TTransactionsMainForm.ActiveFormActivate(Sender: TObject);
begin
  if not FJustCreated then
  begin
    FJustCreated := False;
//    TransactionsDataModule.TransactionsData.Refresh;
  end;
end;

procedure TTransactionsMainForm.ActiveFormDestroy(Sender: TObject);
begin
  TransactionPropertiesForm.Release;
end;

  { Actions. Update/Execute event handlers }

  { Action: AddTransaction }
  { There are no update event handler}

procedure TTransactionsMainForm.AddTransactionExecute(Sender: TObject);
begin
  with TransactionPropertiesForm do
  begin
    TransactionDate := ToDateEdit.DateTime;
    if New then
    begin
      UpdateToDate;
      RefreshAction.Execute;
    end;
  end;
end;

  { Action: DeleteTransaction }

procedure TTransactionsMainForm.DeleteTransactionUpdate(Sender: TObject);
begin
  {$B-}
  with Sender as TAction do
    Enabled :=
      BrowseGrid.Focused
      and AllowTransactionUpdate
      and TransactionsDataModule.Transactions.DataSet.Active
      and (TransactionsDataModule.Transactions.DataSet.RecordCount <> 0);
  {$B+}
end;

procedure TTransactionsMainForm.DeleteTransactionExecute(Sender: TObject);

{  function CheckIsLastTrsSelected: Boolean;

    procedure CheckRow;
    begin
      if BrowseGrid.DataSource.DataSet.FieldByName('TransactionDate').AsDateTime < FCurrentDate then
        Result := True;
    end;

  var
    Index: Integer;
  begin
    Result := False;
    with BrowseGrid, SelectedRows, DataSource.DataSet do
      if Count = 0 then
        CheckRow
      else
      for Index := 0 to Count-1 do
      begin
        GotoBookmark(TBookmark(Items[Index]));
        CheckRow;
        if Result then
          break;
      end;
  end;}

var
  DeleteAll: Boolean;
  DeleteThis: Boolean;
  Index: Integer;
  ProcessedCount: Integer;
  Deleted: Boolean;
begin
  Deleted := False;
{  if CheckIsLastTrsSelected then
    MessageDlg('Чашмысыз?', mtWarning, [mbOk], 0);}
  with BrowseGrid, SelectedRows, DataSource.DataSet do
  begin
    if Count = 0 then
      CurrentRowSelected := RecordCount <> 0;
    DeleteAll := False;
    ProcessedCount := 0;
    Index := 0;
    while Index < Count do
    begin
      GotoBookmark(TBookmark(Items[Index]));
      DeleteThis := False;
      if not DeleteAll then
        case MessageDlg(Format('Ямялиййат #%d силинсинми?', [FieldByName('ID').AsInteger]), mtConfirmation, [mbYes, mbNo, mbAll, mbCancel], 0) of
        mrYes:
          DeleteThis := True;
        mrAll:
          if MessageDlg(Format('%d ямялиййатлар силинсинми?', [Count-ProcessedCount]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
          begin
            DeleteAll := True;
            DeleteThis := True;
          end
          else
            dec(Index);
        mrCancel:
          break;
        end
      else
        DeleteThis := True;
      if DeleteThis then
        with TransactionsDataModule.Transactions do
        begin
          Sb_DeleteTransaction(FieldByName('ID').AsInteger, AddTransactionStdFlags);
          Sb_Commit;
          Deleted := True;
        end;
      Inc(ProcessedCount);
      Inc(Index);
    end;
  end;
  if Deleted then
    RefreshAction.Execute;
end;

  { Action: EditTransaction }
  { There are no update event handler}

procedure TTransactionsMainForm.EditTransactionExecute(Sender: TObject);
begin
  with TransactionPropertiesForm do
    if View(TransactionsDataModule.Transactions.DataSet.FieldByName('ID').AsInteger, not AllowTransactionUpdate) then
    begin
      UpdateToDate;
      RefreshAction.Execute;
    end;
end;

  { Action: RefreshTransaction }
  { There are no update event handler}

procedure TTransactionsMainForm.RefreshActionExecute(Sender: TObject);

  function BuildQuery: String;

    function BoolToInt(value: Boolean): Integer;
    begin
      if Value then
        Result := 1
      else
        Result := 0;
    end;

  var

    NationalCurrency, ForeignCurrency, MultyCurrency,
    DebitCredit, RateDifference, ProfitDebit: Boolean;

		DebitBalance, CreditBalance, DebitAccID,
    CreditAccID, DebitCurrencyID, CreditCurrencyID,
    FilialDebitId,FilialCreditId,OperatorId: Integer;
//		DebitAmount, CreditAmount, LAmount: Currency;

//		OrderBy: String;
    AmountCondition: String;
    OrderFields: String;

  begin

    if FilterTransactionsAll.Checked then
    begin
      NationalCurrency := True;
      ForeignCurrency := True;
      MultyCurrency := True;
      DebitCredit := True;
      RateDifference := True;
      ProfitDebit := True;
    end
    else
    begin
      NationalCurrency := FilterNationalCurrency.Checked;
      ForeignCurrency := FilterForeignCurrency.Checked;
      MultyCurrency := FilterMultyCurrency.Checked;
      DebitCredit := FilterProfitDebit.Checked;
      RateDifference := FilterRateDifference.Checked;
      ProfitDebit := FilterProfitDebit.Checked;
    end;

     if scbDFilial.ItemIndex>0 then
      FilialDebitId:=TransactionsDataModule.FilialsData.FieldByName('ID').AsInteger
     else FilialDebitId:=-1;

     if scbCFilial.ItemIndex>0 then
      FilialCreditId:=TransactionsDataModule.FilialsCData.FieldByName('ID').AsInteger
     else FilialCreditId:=-1;

     if scbOperator.ItemIndex>0 then
       OperatorId:=TransactionsDataModule.UsData.FieldByName('ID').AsInteger
     else OperatorId:=-1;

    if FilterDebitUse.Checked then
    begin
      if DebitBalanceCB.ItemIndex <> -1 then
        DebitBalance := DebitBalanceSource.DataSet.FieldByName('No').AsInteger
      else
        DebitBalance := 0;
      if DebitAccountCB.ItemIndex <> -1 then
        DebitAccID := DebitAccountsSource.DataSet.FieldByName('ID').AsInteger
      else
        DebitAccID := 0;
      if DebitCurrencyCB.ItemIndex <> -1 then
        DebitCurrencyID := DebitCurrency.DataSet.FieldByName('CurrencyID').AsInteger
      else
        DebitCurrencyID := -1;
    end
    else
    begin
      DebitBalance := 0;
      DebitAccID := 0;
      DebitCurrencyID := -1;
    end;

    if FilterCreditUse.Checked then
    begin
      if CreditBalanceCB.ItemIndex <> -1 then
        CreditBalance := CreditBalanceSource.DataSet.FieldByName('No').AsInteger
      else
        CreditBalance := 0;
      if CreditAccountCB.ItemIndex > -1 then
        CreditAccID := CreditAccountsSource.DataSet.FieldByName('ID').AsInteger
      else
        CreditAccID := 0;
      if CreditCurrencyCB.ItemIndex <> -1 then
        CreditCurrencyID := CreditCurrency.DataSet.FieldByName('CurrencyID').AsInteger
      else
        CreditCurrencyID := -1;
    end
    else
    begin
      CreditBalance := 0;
      CreditAccID := 0;
      CreditCurrencyID := -1;
    end;

    if FilterAmountUse.Checked then
      AmountCondition := Format('(%s)', [FAmountCondition])
    else
      AmountCondition := '';

    case OrderFieldCB.ItemIndex of
      0: OrderFields := 'p.ID';
      1: OrderFields := 'p.DebitAccNo';
      2: OrderFields := 'p.CreditAccNo';
      3: OrderFields := 'p.DebitCurrencySName';
      4: OrderFields := 'p.CreditCurrencySName';
      5: OrderFields := 'p.DebitAmount';
      6: OrderFields := 'p.CreditAmount';
      7: OrderFields := 'p.LAmount';
    else
      OrderFields := '';
    end;

    if OrderFields <> '' then
      OrderFields := Format('p.TransactionDate, %s', [OrderFields])
    else
      OrderFields := 'p.TransactionDate';

    with TransactionsDataModule.SBReport do
      Result :=
        CallStringFunction('TrBuildQuery', [
          'FromDate', FFromDate,
          'ToDate', FToDate,
          'NationalCurrency', NationalCurrency,
          'ForeignCurrency', ForeignCurrency,
          'MultyCurrency', MultyCurrency,
          'RateDifference', RateDifference,
          'ProfitDebit',ProfitDebit,
          'DebitCredit', DebitCredit,
	  	    'DebitBalance', DebitBalance,
		      'CreditBalance', CreditBalance,
		      'DebitAccID', DebitAccID,
		      'CreditAccID', CreditAccID,
  		    'DebitCurrencyID', DebitCurrencyID,
	  	    'CreditCurrencyID', CreditCurrencyID,
		      'DebitAmount', 0,
		      'CreditAmount', 0,
		      'LAmount', 0,
          'OrderBy', OrderFields,
          'CustomBoolPrefix', 'AND',
          'CustomCondition', AmountCondition,
          'Delayed', FilterDelayed.Checked,
          'Commited', FilterCommited.Checked,
          'Rejected', FilterRejected.Checked,
          'FilialsDebit',FilialDebitId,
          'FilialsCredit',FilialCreditId ,
          'OperatorId',OperatorId
          ]);
    LogMemo.Lines.Add('Refresh');
  end;

var
  SavedPos: Integer;

begin
  if (FFromDate <> -1) and (FToDate <> -1) then
  begin
    if FFromDate > FToDate then
      MessageDlg('Тарихляри дцзгцн дахил един', mtError, [mbOk], 0)
    else
    with TransactionsDataModule.TransactionsData do
    begin
      SavedPos := RecNo;
      Close;
      with SQL do
        Text := BuildQuery;
      Open;
      if SavedPos >= RecordCount then
      begin
        if RecordCount <> 0 then
          RecNo := RecordCount;
      end
      else
        RecNo := SavedPos;
    end;
  end;
end;

  { Action: ToggleFilterAction }
  { There are no update event handler}

procedure TTransactionsMainForm.ToggleFilterActionExecute(Sender: TObject);
begin
  with Sender as TAction do
  begin
    Checked := not Checked;
    FilterGB.Visible := Checked;
  end;
end;

  { Action: CommitTransaction }

procedure TTransactionsMainForm.CommitTransactionUpdate(Sender: TObject);
begin
  {$B-}
  with Sender as TAction, TransactionsDataModule.Transactions.DataSet do
    Enabled :=
      Active
      and (RecordCount <> 0)
      and ThereAreStatus(FlagSet_Commited);
  {$B+}
    //(FieldByName('status').AsInteger in [atsDelayed, atsRejected])
end;

procedure TTransactionsMainForm.CommitTransactionExecute(Sender: TObject);
var
  TempID: Integer;
  IDs: TConstArray;
  IDIndex: Integer;
  Index: Integer;
  Status: Integer;
  Commited: Boolean;
begin
  with BrowseGrid, SelectedRows, DataSource.DataSet do
    if Count = 0 then
    begin
      SetLength(IDs, 1);
      IDs[0] := FieldByName('ID').AsString;
    end
    else
    begin
      IDIndex := 0;
      DisableControls;
      try
        for Index := 0 to Count-1 do
        begin
          GotoBookmark(TBookmark(Items[Index]));
          Status := FieldByname('Status').AsInteger;
          if Status in [atsDelayed, atsRejected] then
          begin
            SetLength(IDs, IDIndex+1);
            IDs[IDIndex] := FieldByName('ID').AsString;
            Inc(IDIndex);
          end;
        end;
      finally
        EnableControls;
      end;
    end;
  TempID := Sb_CommitDelayedTransactions(IDs, False);
  with TTemporaryTransactionCommitForm.Create(Self) do
  try
    Commited := Execute(TempID, 'Tastig edilmasi', False, False);
  finally
    Release;
  end;

  Sb_TransactionsTempDelete(TempID);
  if Commited then
    Sb_CommitDelayedTransactions(IDs, True);
  Sb_Commit;
  if Commited then
    RefreshAction.Execute;
end;

  { Action: RejectTransaction }

procedure TTransactionsMainForm.RejectTransactionUpdate(Sender: TObject);
begin
  {$B-}
  with Sender as TAction, TransactionsDataModule.Transactions.DataSet do
    Enabled :=
      Active
      and (RecordCount <> 0)
      and (ThereAreStatus(FlagSet_Rejected));
  {$B+}
end;

procedure TTransactionsMainForm.RejectTransactionExecute(Sender: TObject);

var
  RejectReason: String;
  Updated: Boolean;

  procedure ProcessRow;
  var
    Status: Integer;
  begin
    with TransactionsDataModule.Transactions.DataSet do
    begin
      Status := FieldByName('Status').AsInteger;
      if Status in [atsDelayed, atsRejected] then
      begin
        Sb_RejectTransaction(
          FieldByName('ID').AsInteger,
          RejectReason);
        Updated := True;
      end;
    end;
  end;

var
  Index: Integer;
begin
  if InputQuery('Tayinatini daxil edin', 'Tayinat: ', RejectReason) then
  begin
    Updated := False;
    try
      with BrowseGrid, SelectedRows, DataSource.DataSet do
        if Count = 0 then
          ProcessRow
        else
          for Index := 0 to Count-1 do
          begin
            GotoBookmark(TBookmark(Items[Index]));
            ProcessRow;
          end;
    except
      Sb_Rollback;
      raise;
    end;
    if Updated then
    begin
      Sb_Commit;
      RefreshAction.Execute;
    end;
  end;
end;

  { Action: SelectAllAction }
  { There are no update event handler}

procedure TTransactionsMainForm.SelectAllActionExecute(Sender: TObject);
begin
  with BrowseGrid, SelectedRows, DataSource.DataSet do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        CurrentRowSelected := True;
        Next;
      end;
    finally
      EnableControls;
    end;
    TransactionScrolled;
  end;
end;

procedure TTransactionsMainForm.BrowseGridDblClick(Sender: TObject);
begin
  EditTransaction.Execute;
end;

procedure TTransactionsMainForm.TransactionIDSearchEditChange(
  Sender: TObject);
begin
  BrowseGrid.SelectedRows.Clear;
  with TransactionsDataModule.TransactionsData, Sender as TEdit do
    if Text <> '' then
      SearchRecord(Copy(Name, 12, Length(Name) - 21), Text,
        [srForward, srFromBeginning, srIgnoreCase, srPartialMatch]);
end;

procedure TTransactionsMainForm.TransactionIDSearchEditExit(
  Sender: TObject);
begin
  with Sender as TEdit do
    Text := '';
end;

procedure TTransactionsMainForm.N3DrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);
            
            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;
end;

procedure TTransactionsMainForm.SpeedButton5Click(Sender: TObject);
begin
  ToggleFilterAction.Execute;
end;

procedure TTransactionsMainForm.ToggleRBFilterAction(
  Sender: TObject);

  procedure SetIfSpecified(Action: TAction);
  begin
    Action.Checked := Sender = Action;
  end;

begin
  SetIfSpecified(FilterTransactionsSelected);
  SetIfSpecified(FilterTransactionsAll);
  FilterChanged;
end;

procedure TTransactionsMainForm.FilterNationalCurrencyExecute(
  Sender: TObject);
begin
  with Sender as TAction do
  begin
    Checked := not Checked;

    if not (
      FilterNationalCurrency.Checked
      or FilterForeignCurrency.Checked
      or FilterMultyCurrency.Checked
      or FilterRateDifference.Checked
      or FilterProfitDebit.Checked)
    then
    begin
      //raise EInvalidOperation.Create('Can''not unselect all checkboxes - nothing to view');
      Checked := True;
      HintBox.ShowMessage('Can''not unselect all checkboxes - nothing to view');
    end;
  end;

  FilterTransactionsSelected.Execute;
end;

procedure TTransactionsMainForm.MouseWheelHandler(var Message: TMessage);
var
  Step: Byte;
  I: Integer;
begin
  if BrowseGrid.Focused then
  begin
    BrowseGrid.SelectedRows.Clear;
    with TCMMouseWheel(Message), TransactionsDataModule.Transactions.DataSet do
    begin
      if ssCtrl in ShiftState then
        Step := 3
      else
        Step := 1;
      if WheelDelta < 0 then
        for I := 1 to Step do
          Next
//        RecNo := RecNo + Step
      else
        for I := 1 to Step do
          Prior;
//        RecNo := RecNo - Step;
    end;
  end;
end;

procedure TTransactionsMainForm.FilterChanged;
begin
  if FRefreshOnFilterChange then
    RefreshAction.Execute;
end;

procedure TTransactionsMainForm.FilterDebitUseExecute(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
  FilterChanged;
end;

procedure TTransactionsMainForm.AccsFilterChanged(DataSet: TDataSet);
begin
  FilterChanged;
end;

procedure TTransactionsMainForm.DebitBalanceCBEnter(Sender: TObject);
begin
//  DebitAccountData.RecNo := -1;
  DebitAccountCB.ItemIndex := -1;
  DebitCurrencyCB.ItemIndex := -1;
end;

procedure TTransactionsMainForm.DebitAccountCBEnter(Sender: TObject);
begin
//  DebitBalanceData.RecNo := -1;
  DebitBalanceCB.ItemIndex := -1;
  DebitCurrencyCB.ItemIndex := -1;
end;

procedure TTransactionsMainForm.CreditBalanceCBEnter(Sender: TObject);
begin
//  CreditAccountData.RecNo := -1;
  CreditAccountCB.ItemIndex := -1;
  CreditCurrencyCB.ItemIndex := -1;
end;

procedure TTransactionsMainForm.CreditAccountCBEnter(Sender: TObject);
begin
//  CreditBalanceData.RecNo := -1;
  CreditBalanceCB.ItemIndex := -1;
  CreditCurrencyCB.ItemIndex := -1;
end;

procedure TTransactionsMainForm.DebitCurrencyCBEnter(Sender: TObject);
begin
  DebitBalanceCB.ItemIndex := -1;
  DebitAccountCB.ItemIndex := -1;
end;

procedure TTransactionsMainForm.CreditCurrencyCBEnter(Sender: TObject);
begin
  CreditBalanceCB.ItemIndex := -1;
  CreditAccountCB.ItemIndex := -1;   
end;

procedure TTransactionsMainForm.FilterAmountApplyExecute(Sender: TObject);
var
  FieldName, Sign, Value: String;
begin
  if FilterDebitAmount.Checked then
    FieldName := 'Ammount'
  else
  if FilterCreditAmount.Checked then
    FieldName := 'Ammount_C'
  else
  if FilterLAmount.Checked then
    FieldName := 'LAmmount'
  else
    raise EInvalidOperation.Create('No one of amount filter checkboxes checked');
  if LessButton.Down then
    Sign := '<='
  else
  if EqualButton.Down then
    Sign := '='
  else
  if MoreButton.Down then
    Sign := '>='
  else
  if NotEqualButton.Down then
    Sign := '<>'
  else
    raise EInvalidOperation.Create('No one of sign buttons not checked');
  Value := CurrToStrF(AmountEdit.Value, ffGeneral, 2);
  FAmountCondition := Format('(p.%s %s %s)', [FieldName, Sign, Value]);
  FilterChanged;
end;

procedure TTransactionsMainForm.FilterAmountUseExecute(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
  FilterAmountApply.Execute;
  {FilterChanged will be called from FilterAmountApply.Execute}
end;

procedure TTransactionsMainForm.FilterDebitAmountExecute(Sender: TObject);
  procedure SetIfSpecified(Action: TAction);
  begin
    Action.Checked := Sender = Action;
  end;
begin
  SetIfSpecified(FilterDebitAmount);
  SetIfSpecified(FilterCreditAmount);
  SetIfSpecified(FilterLAmount);
  FilterAmountApply.Execute;
end;

procedure TTransactionsMainForm.LessButtonClick(Sender: TObject);
begin
  FilterAmountApply.Execute;
end;

function TTransactionsMainForm.Get_Icon: OLE_HANDLE;
const
  IconIndex = 6;
begin
  ImageList.GetIcon(IconIndex, Icon);
  Result := Icon.Handle;
end;

procedure TTransactionsMainForm.Set_Params(const Name: WideString; Value: OleVariant);
begin
  if Name = 'ViewMode' then
    ViewMode := Value = 'Commited'
  else
  if Name = 'CurrentDateOnly' then
    CurrentDateOnly := Value;
end;

procedure TTransactionsMainForm.SetViewMode(Value: Boolean);
begin
  if (FViewMode <> Value) or (not TransactionsDataModule.Transactions.DataSet.Active) then
  begin
    FViewMode := Value;
    if FViewMode then
      Caption := 'Tastiq olunmus amaliyyatlar'
    else
      Caption := 'Delayed transactions';
    RefreshAction.Execute;
    UpdateActions;
  end;
end;

procedure TTransactionsMainForm.ToggleChecked(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
  //RefreshAction.Execute;
end;

procedure TTransactionsMainForm.BrowseGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;
begin
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
      atsCommited:
        ImageIndex := 7;
      atsRejected:
        ImageIndex := 8;
      atsDelayed:
        ImageIndex := 9;
      else
      if DataSource.DataSet.State <> dsInsert then
        raise EDataCorrupted.CreateFmt('Unknown state in transactions dataset: %d, ID=%d', [DataSource.DataSet.FieldByName('Status').AsInteger, DataSource.DataSet.FieldByName('ID').AsInteger])
      else
        ImageIndex := -1;
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TTransactionsMainForm.TransactionScrolled;
var
  Index: Integer;
begin
{  if RejectReasonPanel.Enabled then
    RejectReasonPanel.Font.Color := clBlack
  else
    RejectReasonPanel.Font.Color := clSilver;}
  if not TransactionsDataModule.Transactions.DataSet.ControlsDisabled then
  begin
    RejectReasonPanel.Enabled := TransactionsDataModule.Transactions.DataSet.FieldByName('status').AsInteger = atsRejected;
    RejectedPaintBox.Repaint;
    for Index := 0 to MaxFlagSet-1 do
      FSelectionChanged[Index] := True;
    FUpdateChangeMode := True;
  end;
end;

procedure TTransactionsMainForm.RejectedPaintBoxPaint(Sender: TObject);
begin
  with Sender as TPaintBox do
    ImageList.Draw(Canvas, 0, 0, 8, TransactionsDataModule.Transactions.DataSet.FieldByName('status').AsInteger = atsRejected);
end;

function TTransactionsMainForm.ThereAreStatus(FlagSet: Integer): Boolean;

  procedure CheckRow;
  begin
    Result := BrowseGrid.DataSource.DataSet.FieldByName('Status').AsInteger in FlagSets[FlagSet];
  end;

var
  SavedPos: TBookmark;
  Index: Integer;

const
  LastSelection: array[0..MaxFlagSet-1] of Boolean = (False, False);

begin
  if FSelectionChanged[FlagSet] then
  begin
    with BrowseGrid, DataSource.DataSet, SelectedRows do
    begin
      if (Count = 1) or (Count = 0) then
        CheckRow
      else
      begin
        DisableControls;
        SavedPos := GetBookmark;
        try
          for Index := 0 to Count-1 do
          begin
            GotoBookmark(TBookmark(Items[Index]));
            CheckRow;
            if Result then
              break;
          end;
        finally
          GotoBookmark(SavedPos);
          EnableControls;
        end;
      end;
    end;
    LastSelection[FlagSet] := Result;
    FSelectionChanged[FlagSet] := False;
  end
  else
    Result := LastSelection[FlagSet];
end;

procedure TTransactionsMainForm.SetCurrentDateOnly(Value: Boolean);
begin
  FCurrentDateOnly := Value;
  DatePanel.Visible := CurrentDateOnly;
end;

procedure TTransactionsMainForm.FromDateEditChange(Sender: TObject);
begin
  with Sender as TDateTimePicker do
    if DateTime <> FFromDate then
    begin
      FFromDate := DateTime;
      RefreshAction.Execute;
    end;
end;

procedure TTransactionsMainForm.ToDateEditChange(Sender: TObject);
begin
  with Sender as TDateTimePicker do
    if DateTime <> FToDate then
    begin
      FToDate := DateTime;
      RefreshAction.Execute;
    end;
end;

procedure TTransactionsMainForm.UpdateToDate;
begin
  with TransactionPropertiesForm do
  begin
    ToDateEdit.DateTime := TransactionDate;
    FToDate := TransactionDate;
  end;
end;

procedure TTransactionsMainForm.OrderFieldCBChange(Sender: TObject);
begin
  RefreshAction.Execute;
end;

procedure TTransactionsMainForm.FirstRecExecute(Sender: TObject);
begin
  TransactionsDataModule.TransactionsData.First;
end;

procedure TTransactionsMainForm.LastRecExecute(Sender: TObject);
begin
  TransactionsDataModule.TransactionsData.Last;
end;

procedure TTransactionsMainForm.FirstRecUpdate(Sender: TObject);
begin
  BrowseGrid.SelectedRows.Clear;
  with Sender as TAction, TransactionsDataModule.TransactionsData do
    Enabled := RecNo <> 1;
end;

procedure TTransactionsMainForm.LastRecUpdate(Sender: TObject);
begin
  BrowseGrid.SelectedRows.Clear;
  with Sender as TAction, TransactionsDataModule.TransactionsData do
    Enabled := RecNo <> RecordCount;
end;

function TTransactionsMainForm.AllowTransactionUpdate: Boolean;

  Function CheckRow: Boolean;
  begin
    with BrowseGrid.DataSource.DataSet do
      Result := FieldByName('TransactionDate').AsDateTime = FCurrentDate;
  end;

var
  Index: Integer;
  LastPos: TBookmark;
begin
  if FUpdateChangeMode then
  begin
    Result := True;
    with BrowseGrid, DataSource.DataSet, SelectedRows do
      if (Count = 0) or (Count = 1) then
        Result := CheckRow
      else
      begin
        DisableControls;
        LastPos := GetBookmark;
        try
          for Index := 0 to Count-1 do
          begin
            GotoBookmark(TBookmark(Items[Index]));
            Result := CheckRow;
            if not Result then
              break;
          end;
        finally
          GotoBookmark(LastPos);
          EnableControls;
        end;
      end;
    FUpdateChangeMode := False;
    FLastAllowTransactionUpdate := Result;
  end
  else
    Result := FLastAllowTransactionUpdate;
end;

procedure TTransactionsMainForm.CommisionViewerEnter(Sender: TObject);
begin
 isCommisionTransaction := true;
end;

procedure TTransactionsMainForm.CommisionViewerExit(Sender: TObject);
begin
 isCommisionTransaction := false;
end;

procedure TTransactionsMainForm.CommisionViewerDblClick(Sender: TObject);
var
 TempDebit , TempCredit :longint;
 TempDebitCurrency , TempCreditCurrency :integer;
begin
// AddTransactionExecute(sender);
 if not((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
  with TransactionPropertiesForm,TransactionsDataModule do
   begin
    TempDebit := ODSCommisionTrans.FieldByName('Debt').AsInteger;
    TempCredit :=ODSCommisionTrans.FieldByName('Credit').AsInteger;
    TempDebitCurrency :=AccountCurrencyID(ODSCommisionTrans.FieldByName('Debt').AsInteger);
    TempCreditCurrency :=AccountCurrencyID(ODSCommisionTrans.FieldByName('Credit').AsInteger);
    TransactionDate := ToDateEdit.DateTime;

    FMode := tmNew;
    Caption := 'Adding new transaction';
    Reset;
    FReadOnly := False;

    DebitCurrency.DataSet.Locate('ID',TempDebitCurrency,[]);
    CreditCurrency.DataSet.Locate('ID',TempCreditCurrency,[]);
    DebitAccs.DataSet.Locate('ID',TempDebit,[]);
    CreditAccs.DataSet.Locate('ID',TempCredit,[]);
    Transactions.DataSet.FieldByName('Name').AsString :=ODSCommisionTrans.FieldByName('Assignment').AsString;
    
    ShowModal;
    UpdateToDate;
    RefreshAction.Execute;
  end
end;

function TTransactionsMainForm.AccountCurrencyID(accountID :longint) : word;
const
 cName = 'GetAccountCurrencyID';
begin
 with TransactionsDataModule.OPComplexTrans do
  Result := CallIntegerFunction(cName,[accountID]);
end;

procedure TTransactionsMainForm.N6Click(Sender: TObject);
begin
 CommisionViewer.DataSource.DataSet.Refresh;
end;

procedure TTransactionsMainForm.ActionCommisionExecute(Sender: TObject);
begin
 CommisionViewer.Visible :=not CommisionViewer.Visible;
end;

procedure TTransactionsMainForm.scbOperatorChange(Sender: TObject);
begin
 FilterChanged;
end;

procedure TTransactionsMainForm.ToolButton11Click(Sender: TObject);
const
    cs_name = 'EXCHANGE_CALLBACK';
begin
 with TransactionsDataModule.OraclePackage do
  CallProcedure(cs_name, []);
  Sb_Commit;
  RefreshAction.Execute;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTransactionsMainForm,
    Class_TransactionsMainForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

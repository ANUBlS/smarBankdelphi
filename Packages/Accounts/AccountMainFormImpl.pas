unit AccountMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Accounts_TLB, StdVcl, ToolWin, ComCtrls, Grids, DBGrids,
  ActnList, ExtCtrls, ImgList, Db, OracleData, Menus, StdCtrls, Buttons,
  Oracle, DBViewComboBox, AccountPropertiesForm_Unit, SBPlgAx50_TLB,
  HintBox, SearchCombo;

type
  TAccountMainForm = class(
      TActiveForm,
      IAccountMainForm,
      IMenuExporter,
      IIconExporter)
    ActionList1: TActionList;
    Add: TAction;
    Close: TAction;
    Edit: TAction;
    Refresh: TAction;
    ToggleFilter: TAction;
    ActiveAccounts: TAction;
    ClosedAccounts: TAction;
    AllAccounts: TAction;
    UseBalanceFilter: TAction;
    ApplyFilter: TAction;
    ResetFilter: TAction;
    UseCustomerFilter: TAction;
    UseCurrencyFilter: TAction;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    FilterGB: TGroupBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    SAccNameLabel: TLabel;
    CheckBox1: TCheckBox;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    CustomerIDSearchEdit: TEdit;
    GroupBox5: TGroupBox;
    CheckBox3: TCheckBox;
    ControlBar1: TControlBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    FilterButton: TToolButton;
    ImageList1: TImageList;
    DBViewComboBox1: TDBViewComboBox;
    CustomerNameCB: TDBViewComboBox;
    CurrencyNameCB: TDBViewComboBox;
    AccNoSearchEdit: TEdit;
    SAccSearchEdit: TEdit;
    CurrencySNameSearchEdit: TEdit;
    AccNameSearchEdit: TEdit;
    AmountSearchEdit: TEdit;
    LAmountSearchEdit: TEdit;
    OpenDateSearchEdit: TEdit;
    CloseDateSearchEdit: TEdit;
    ToolButton9: TToolButton;
    AccSearchDirectionPopupMenu: TPopupMenu;
    SearchForward: TAction;
    SearchBackward: TAction;
    Action11: TMenuItem;
    Action21: TMenuItem;
    FindAccount: TAction;
    AccOrderPopupMenu: TPopupMenu;
    OrderAccNo: TAction;
    OrderAccName: TAction;
    OrderAccNo1: TMenuItem;
    OrderAccName1: TMenuItem;
    OrderAccCurrency: TAction;
    OrderAccCurrency1: TMenuItem;
    AccOrderButton: TToolButton;
    ViewTransactions: TAction;
    AccGridPopupMenu: TPopupMenu;
    Add1: TMenuItem;
    Edit1: TMenuItem;
    Close1: TMenuItem;
    OrderItem: TMenuItem;
    AllAccounts1: TMenuItem;
    ClosedAccounts1: TMenuItem;
    ActiveAccounts1: TMenuItem;
    N2: TMenuItem;
    ApplyFilter1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ResetFilter1: TMenuItem;
    N6: TMenuItem;
    N1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ViewStates: TAction;
    ViewStates1: TMenuItem;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit2: TMenuItem;
    File11: TMenuItem;
    File21: TMenuItem;
    HintPanel: TPanel;
    ErrorHintBox: THintBox;
    N9: TMenuItem;
    ReOpen: TAction;
    CustomAction: TAction;
    GroupBox6: TGroupBox;
    CheckBox4: TCheckBox;
    FilialNameCB: TDBViewComboBox;
    UseFilialFilter: TAction;
    GroupBox7: TGroupBox;
    Arest: TAction;
    SafeRefresh: TAction;
    CBAccSymbols: TDBViewComboBox;
    CBUseAccFlags: TCheckBox;
    Memo1: TMemo;
    LTimeShow: TLabel;
    ToolButton5: TToolButton;
    procedure SAccsDataAfterScroll(Sender: TObject);
    procedure CustomersDataAfterScroll(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToggleFilterExecute(Sender: TObject);
    procedure ActiveAccountsExecute(Sender: TObject);
    procedure ToggleChecked(Sender: TObject);
    procedure ToggleAndRefresh(Sender: TObject);
    procedure CustomerIDSearchEditChange(Sender: TObject);
    procedure AccNoSearchEditExit(Sender: TObject);
    procedure FindAccountExecute(Sender: TObject);
    procedure FindAccountUpdate(Sender: TObject);
    procedure SearchForwardExecute(Sender: TObject);
    procedure OrderAccNoExecute(Sender: TObject);
    procedure AddExecute(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure CurrencyNameCBChange(Sender: TObject);
    procedure CloseExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ViewTransactionsExecute(Sender: TObject);
    procedure DrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure ViewStatesExecute(Sender: TObject);
    procedure CloseUpdate(Sender: TObject);
    procedure ErrorHintBoxAfterMessage(Sender: TObject);
    procedure ErrorHintBoxAfterHide(Sender: TObject);
    procedure CustomActionUpdate(Sender: TObject);
    procedure ArestExecute(Sender: TObject);
    procedure SafeRefreshExecute(Sender: TObject);
    procedure LTimeShowClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    FAccountPropertiesForm: TAccountPropertiesForm;
    FFirstSearch: Boolean;
    FJustCreated: Boolean;
    FEvents: IAccountMainFormEvents;
    function BuildAccsQuery: String;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure RefreshAction(Sender: TObject; Action: TAction);
    procedure RefreshActions(Sender: TObject; const Actions: array of TAction);
    function FindFocusedAccSearchEdit: TEdit;
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
    procedure AboutBox; safecall;
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
    procedure Set_Visible(Value: WordBool); safecall;  function IAccountMainForm.Get_Color = IAccountMainForm_Get_Color;
    function IAccountMainForm.Get_Font = IAccountMainForm_Get_Font;
    procedure IAccountMainForm._Set_Font = IAccountMainForm__Set_Font;
    procedure IAccountMainForm.Set_Color = IAccountMainForm_Set_Color;
    procedure IAccountMainForm.Set_Font = IAccountMainForm_Set_Font;
    function IAccountMainForm_Get_Color: OLE_COLOR; safecall;
    function IAccountMainForm_Get_Font: IFontDisp; safecall;
    procedure IAccountMainForm__Set_Font(const Value : IFontDisp); safecall;
    procedure IAccountMainForm_Set_Color(Value : OLE_COLOR); safecall;
    procedure IAccountMainForm_Set_Font(var Value : IFontDisp); safecall;
    function Get_SharedMenu: Integer; safecall;
    function Get_Icon: OLE_HANDLE; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;

implementation

uses ComObj, ComServ, AccountAboutImpl, sboapiDataModuleImpl,
  AccountDataModuleImpl, SBAccount, AccTransactionsFormImpl,
  StartEndDateInputImpl, SBCore, AccStatesImpl, SecurityBrowserImpl, SBSecurity;

{$R *.DFM}

{ TAccountMainForm }

const
  SAccountsQuery =
    'SELECT'#13#10+
    '  acc.ID AS AccID,'#13#10+
    '  acc.ACC_NO AS AccNo,'#13#10+
    '  acc.NAME AS AccName,'#13#10+
    '  acc.OPEN_DAT AS OpenDate,'#13#10+
    '  acc.CLOSE_DAT AS CloseDate,'#13#10+
    '  acc.VAL_ACC AS CurrencyID,'#13#10+
    '  acc.bal_cn1 AS SAcc,'#13#10+
    '  acc.bal_cn2 AS SAcc2,'#13#10+
    '  acc.bal_cn3 AS SAcc3,'#13#10+
    '  acc.bal_cn4 AS SAcc4,'#13#10+
    '  acc.KLI_ID as CustomerID,'#13#10+
    '  acc.PAIR_ACC as PairAcc,'#13#10+
    '  acc.Limit as AccLimit,'#13#10+
    '  acc.SIM_OTCET as ReportSymbol,'#13#10+
    '  acc.tipacc as AccFlags ,'#13#10+
    '  acc.FILIAL as FilialID,'#13#10+
    '  acc.Insider as Insider,'#13#10+
    '  t.OSTAT AS Amount,'#13#10+
    '  t.POK_OSTAT AS LAmount,'#13#10+
    '  t.OBR_D AS DebitTurnover,'#13#10+
    '  t.OBR_K AS CreditTurnover,'#13#10+
    '  t.POK_OBR_D AS DebitLTurnover,'#13#10+
    '  t.POK_OBR_K AS CreditLTurnover,'#13#10+
    '  Currency.VAL_NAME AS CurrencySName,'#13#10+
    '  dsb.OSTAT as DayStartAmount,'#13#10+
    '  dsb.POK_OSTAT as DayStartLAmount,'#13#10+
    '  dlb.OSTAT as DelayedAmount,'#13#10+
    '  dlb.POK_OSTAT as DelayedLAmount,'#13#10+
    '  acc.sid#,'#13#10+
    '  acc.rowid'#13#10+
    'FROM'#13#10+
    '  ACCOUNT acc,'#13#10+
    '  TENOSTAT t,'#13#10+
    '  TEMPOST dsb,'#13#10+
    '  LAZYREST dlb,'#13#10+
    '  AVALUTE Currency'#13#10+
    'WHERE'#13#10+
    '  (t.ACC_ID = acc.ID)'#13#10+
    '  AND (Currency.VALUTE = acc.VAL_ACC)'#13#10+
    '  AND (dsb.ACC_ID = acc.ID)'#13#10+
    '  AND (dlb.ACC_ID = acc.ID)';

procedure TAccountMainForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_AccountMainFormPage); }
end;

procedure TAccountMainForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAccountMainFormEvents;
end;

procedure TAccountMainForm.Initialize;
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

procedure TAccountMainForm.MouseWheelHandler(var Message: TMessage);
begin
//  inherited;
  with TCMMouseWheel(Message), AccountDataModule.Accounts.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
  DBGrid1.Repaint;
end;

function TAccountMainForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TAccountMainForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TAccountMainForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TAccountMainForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TAccountMainForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TAccountMainForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TAccountMainForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TAccountMainForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TAccountMainForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TAccountMainForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TAccountMainForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TAccountMainForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TAccountMainForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TAccountMainForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TAccountMainForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TAccountMainForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TAccountMainForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TAccountMainForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TAccountMainForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountMainForm.AboutBox;
begin
  ShowAccountMainFormAbout;
end;

procedure TAccountMainForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TAccountMainForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TAccountMainForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TAccountMainForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TAccountMainForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TAccountMainForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TAccountMainForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TAccountMainForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TAccountMainForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TAccountMainForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TAccountMainForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TAccountMainForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TAccountMainForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TAccountMainForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TAccountMainForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TAccountMainForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TAccountMainForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TAccountMainForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountMainForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TAccountMainForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TAccountMainForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TAccountMainForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TAccountMainForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TAccountMainForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TAccountMainForm.BuildAccsQuery: String;
begin
  Result := SAccountsQuery;
  if ApplyFilter.Checked then
    with AccountDataModule do
    begin
      if ActiveAccounts.Checked then
//  amt to use replace next row with comment row when have partition
       Result := Result + ' AND (acc.CLOSE_DAT IS NULL)'#13#10
//   Insert(' PARTITION (ACTIVACC) ', Result, Pos('ACCOUNT ', Result)+Length('ACCOUNT '))
//     Insert('_active', Result, Pos('ACCOUNT ', Result)+Length('ACCOUNT'))
      else
       if ClosedAccounts.Checked then
//  amt to use replace next row with comment row when have partition
        Result := Result + ' AND (acc.CLOSE_DAT IS NOT NULL)'#13#10;
//    Insert(' PARTITION (CLOSEACC) ', Result, Pos('ACCOUNT ', Result)+Length('ACCOUNT '));
//      Insert('_closed', Result, Pos('ACCOUNT ', Result)+Length('ACCOUNT'));
      if UseBalanceFilter.Checked then
        Result := Result + Format(' AND (acc.BAL_CN1 = %d)'#13#10, [SAccs.DataSet.FieldByName('BAL_CN').AsInteger]);
      if UseCustomerFilter.Checked then
        Result := Result + Format(' AND (acc.KLI_ID = %d)'#13#10, [Customers.DataSet.FieldByName('ID').AsInteger]);
      if UseCurrencyFilter.Checked then
        Result := Result + Format(' AND (acc.VAL_ACC = %d)'#13#10, [Currency.DataSet.FieldByName('VALUTE').AsInteger]);
      if UseFilialFilter.Checked then
        Result := Result + Format(' AND (acc.FILIAL = %d)'#13#10, [Filials.DataSet.FieldByName('ID').AsInteger]);
      if CBUseAccFlags.Checked then
        Result := Result + ' AND (acc.tipacc like '+''''+'%'+AccountFlagsData.FieldByName('Symbol').AsString[1]+'%'+''''+'  )'#13#10;

      memo1.text:=result; // amt 30-apr-05
    end;
  if OrderAccNo.Checked then
    Result := Result + 'ORDER BY acc.ACC_NO'#13#10
  else
  if OrderAccName.Checked then
    Result := Result + 'ORDER BY acc.NAME'#13#10
  else
  if OrderAccCurrency.Checked then
    Result := Result + 'ORDER BY acc.VAL_ACC'#13#10;
//memo1.Text:=Result;
end;

procedure TAccountMainForm.RefreshExecute(Sender: TObject);
var
 TBeg,TEnd: Ttime;
{  SavedPos: Integer;}
begin
TBeg:=Time();
  AccountDataModuleImpl.Initialize;
  with AccountDataModule, AccountsData do
  begin
//    SavedPos := RecNo;
    CloseAll;
    with SQL do
      Text :=BuildAccsQuery;
    {Is this needed???}
    Session := sboapiDataModule.SBSession;
    Open;
TEnd:=Time();
LTimeShow.Caption:=TimeToStr(TBeg)+' - '+TimeToStr(TEnd);
  {  if SavedPos < RecordCount then
      RecNo := SavedPos
    else
      RecNo := RecordCount;}
    AccFlagsData.Refresh;
  end;
end;

procedure TAccountMainForm.SpeedButton1Click(Sender: TObject);
begin
  ToggleFilter.Execute;
end;

procedure TAccountMainForm.ToggleFilterExecute(Sender: TObject);
begin
  with Sender as TAction do
  begin
    Checked := not Checked;
    FilterGB.Visible := Checked;
  end;
end;

procedure TAccountMainForm.RefreshAction(Sender: TObject; Action: TAction);
begin
  Action.Checked := Action = Sender;
end;

procedure TAccountMainForm.RefreshActions(Sender: TObject; const Actions: array of TAction);
var
  Index: Integer;
begin
  for Index := Low(Actions) to High(Actions) do
    RefreshAction(Sender, Actions[Index]);
end;

procedure TAccountMainForm.ActiveAccountsExecute(Sender: TObject);
begin
  RefreshActions(Sender, [AllAccounts, ActiveAccounts, ClosedAccounts]);
  //Refresh.Execute;
end;

procedure TAccountMainForm.ToggleChecked(Sender: TObject);
begin
  with Sender as TAction do
    Checked := not Checked;
end;

procedure TAccountMainForm.ToggleAndRefresh(Sender: TObject);
begin
//  RefreshActions(Sender, [ApplyFilter, ResetFilter]);
  ToggleChecked(Sender);
end;

procedure TAccountMainForm.SAccsDataAfterScroll(Sender: TObject);
begin
  SAccNameLabel.Caption := AccountDataModule.SAccsData.FieldByName('BALNAME').AsString;
//  Refresh.Execute;
end;

procedure TAccountMainForm.CustomerIDSearchEditChange(Sender: TObject);
begin
  with Sender as TEdit do
    if AccountDataModule.Customers.DataSet.Locate(
      Copy(Name, 9, Length(Name)-18),
      Text,
      [loCaseInsensitive, loPartialKey])
    then
      CustomerNameCB.ItemIndex := AccountDataModule.Customers.DataSet.RecNo-1;
end;

procedure TAccountMainForm.CustomersDataAfterScroll(Sender: TObject);
begin
  //Refresh.Execute;
end;

procedure TAccountMainForm.AccNoSearchEditExit(Sender: TObject);

  procedure ClearIfNotFocused(Edit: TEdit); overload;
  begin
    if not Edit.Focused then
      Edit.Clear;
  end;

begin
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(SAccSearchEdit);
  ClearIfNotFocused(CurrencySNameSearchEdit);
  ClearIfNotFocused(AccNameSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ClearIfNotFocused(AccNoSearchEdit);
  ErrorHintBox.Hide;
  FFirstSearch := True;
end;

procedure TAccountMainForm.FindAccountExecute(Sender: TObject);
var
  SearchOptions: TSearchRecordOptions;
  FieldName: String;
begin
  SearchOptions := [srPartialMatch];
  if SearchForward.Checked then
    Include(SearchOptions, srForward)
  else
    Include(SearchOptions, srBackward);
  if FFirstSearch then
    Include(SearchOptions, srFromBeginning)
  else
    Include(SearchOptions, srFromCurrent);
  with AccountDataModule.AccountsData, FindFocusedAccSearchEdit do
    if (Text <> '') and Focused then
    begin
      FieldName := Copy(Name, 1, Length(Name) - 10);
      if not SearchRecord(
        FieldName,
        Text,
        SearchOptions)
      then
        ErrorHintBox.ShowMessage(
          Format(
            'ўесаб тапылмыйыб: %s=%s', [
            FieldByName(FieldName).DisplayName,
            Text
          ])
        );
    end;
  FFirstSearch := False;
end;

function TAccountMainForm.FindFocusedAccSearchEdit: TEdit;
var
  Control: TWinControl;
begin
  Control := ActiveControl;
  if
    (Control = AccNoSearchEdit)
    or (Control = AccNameSearchEdit)
    or (Control = CurrencySNameSearchEdit)
    or (Control = SAccSearchEdit)
    or (Control = AmountSearchEdit)
    or (Control = LAmountSearchEdit)
    or (Control = OpenDateSearchEdit)
    or (Control = CloseDateSearchEdit)
  then
    Result := Control as TEdit
  else
    Result := nil;
end;

procedure TAccountMainForm.FindAccountUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := FindFocusedAccSearchEdit <> nil;
end;

procedure TAccountMainForm.SearchForwardExecute(Sender: TObject);
begin
  RefreshActions(Sender, [SearchForward, SearchBackward]);
end;

procedure TAccountMainForm.OrderAccNoExecute(Sender: TObject);
begin
  RefreshActions(Sender, [OrderAccNo, OrderAccName, OrderAccCurrency]);
  Refresh.Execute;
end;

procedure TAccountMainForm.AddExecute(Sender: TObject);
begin
  if FAccountPropertiesForm.New then
    SafeRefresh.Execute;
end;

procedure TAccountMainForm.ActiveFormCreate(Sender: TObject);
begin
  FJustCreated := True;
  CBAccSymbols.ItemIndex := 0;
  FAccountPropertiesForm := TAccountPropertiesForm.Create(Self);
  Refresh.Execute;
end;

procedure TAccountMainForm.EditExecute(Sender: TObject);
begin
  if FAccountPropertiesForm.Edit then
    SafeRefresh.Execute;
end;

procedure TAccountMainForm.CurrencyNameCBChange(Sender: TObject);
begin
// if UseCurrencyFilter.Checked then
//  Refresh.Execute;
end;

procedure TAccountMainForm.CloseExecute(Sender: TObject);
begin
  with AccountDataModule.Accounts.DataSet do
    if (FieldByName('Amount').AsCurrency <> 0) or (FieldByName('LAmount').AsCurrency <> 0) then
      ErrorHintBox.ShowMessage('You can not close account, if they have positive balance')
    else
      if MessageDlg('Are you sure you want to close this account?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Sb_CloseAccount(AccountDataModule.Accounts.DataSet.FieldByName('AccID').AsInteger);
        Self.SafeRefresh.Execute;
      end;
end;

procedure TAccountMainForm.DBGrid1DblClick(Sender: TObject);
begin
  Edit.Execute;
end;

procedure TAccountMainForm.ViewTransactionsExecute(Sender: TObject);
var
  AStartDate, AEndDate: TDateTime;
begin
  with TStartEndDateInputForm.Create(Self) do
  try
    StartDate := Sb_GetSystemDate();
    EndDate := StartDate;
    if not Execute then
      exit;
    AStartDate := StarTDate;
    AEndDate := EndDate;
  finally
    Release;
  end;
  with TAccTransactionsForm.Create(Self) do
  try
    StartDate := AStartDate;
    EndDate := AEndDate;
    ShowModal;
  finally
    Release;
  end;
end;

procedure TAccountMainForm.DrawMenuItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
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
        Brush.Color := clNavy
      else
        Brush.Color := clBtnFace;
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

procedure TAccountMainForm.ViewStatesExecute(Sender: TObject);
begin
  with TAccStatesForm.Create(Self) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

function TAccountMainForm.IAccountMainForm_Get_Color: OLE_COLOR;
begin

end;

function TAccountMainForm.IAccountMainForm_Get_Font: IFontDisp;
begin

end;

procedure TAccountMainForm.IAccountMainForm_Set_Font(var Value : IFontDisp);
begin

end;

procedure TAccountMainForm.IAccountMainForm_Set_Color(Value : OLE_COLOR);
begin

end;

procedure TAccountMainForm.IAccountMainForm__Set_Font(const Value : IFontDisp);
begin

end;

function TAccountMainForm.Get_SharedMenu: Integer;
begin
  Result := MainMenu1.Handle;
end;

procedure TAccountMainForm.CloseUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := AccountDataModule.Accounts.DataSet.FieldByName('CloseDate').IsNull;
end;

procedure TAccountMainForm.ErrorHintBoxAfterMessage(Sender: TObject);
begin
  HintPanel.Visible := True;
end;

procedure TAccountMainForm.ErrorHintBoxAfterHide(Sender: TObject);
begin
  HintPanel.Visible := False;
end;

function TAccountMainForm.Get_Icon: OLE_HANDLE;
const
  IconIndex = 13;
begin
  ImageList1.GetIcon(IconIndex, Icon);
  Result := Icon.Handle;
end;

procedure TAccountMainForm.CustomActionUpdate(Sender: TObject);
begin
//  with Sender as TActio
end;

procedure TAccountMainForm.ArestExecute(Sender: TObject);
begin
with Sender as TAction do
 Checked:=not(Checked);
DBGrid1.Repaint;
end;

procedure TAccountMainForm.SafeRefreshExecute(Sender: TObject);
var
  SavedPos: Integer;
begin
  with AccountDataModule, AccountsData do
  begin
    SavedPos := FieldByName('AccID').AsInteger;
    Refresh;
    Locate('AccID',SavedPos,[]);
  end;
end;


procedure TAccountMainForm.LTimeShowClick(Sender: TObject);
begin
 memo1.BringToFront;
 memo1.visible:=not memo1.Visible;
end;


procedure TAccountMainForm.Button1Click(Sender: TObject);
begin
 with AccountDataModule do
  AccountsData.SQL.Assign(Memo1.Lines);
end;

procedure TAccountMainForm.ToolButton5Click(Sender: TObject);
var
 TBeg,TEnd: Ttime;
{  SavedPos: Integer;}
begin
TBeg:=Time();
  AccountDataModuleImpl.Initialize;
  with AccountDataModule, AccountsData do
  begin
//    SavedPos := RecNo;
    CloseAll;
    with SQL do
      Text :=Memo1.Lines.Text;
      //BuildAccsQuery;
    {Is this needed???}
    Session := sboapiDataModule.SBSession;
    Open;
TEnd:=Time();
LTimeShow.Caption:=TimeToStr(TBeg)+' - '+TimeToStr(TEnd);
  {  if SavedPos < RecordCount then
      RecNo := SavedPos
    else
      RecNo := RecordCount;}
    AccFlagsData.Refresh;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TAccountMainForm,
    Class_AccountMainForm,
    2,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

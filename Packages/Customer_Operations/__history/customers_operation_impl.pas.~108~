unit customers_operation_impl;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, customer_operations_TLB, StdVcl, StdCtrls, SearchCombo,
  ExtCtrls, ComCtrls, Grids, DBGrids, ToolWin, Buttons, Db, OracleData,
  ImgList, Menus, ActnList, Mask, DBCtrls, Variants;

type
  TOperationMode = (omInsert, omEdit, omCommission);
  TTransactionState = (tsCommit, tsDelete, tsReject);

const

  tsDelayed = 1;
  tsCommited = 2;
  tsRejected = 3;

  BooleanPrefix = ' AND ';

resourcestring
  cs_CommitInformation = 'Ümumi əməliyyatlar: %d' + #13 +
    'Təsdiqlənmiş əməliyyatlar: %d' + #13 + 'Təsdiqlənməmiş əməliyyatlar: %d';
  cs_RejectInformation = 'Ümumi əməliyyatlar: %d' + #13 +
    'İnkar edilmiş əməliyyatlar: %d' + #13 + 'İnkar edilməmiş əməliyyatlar: %d';

type
  TAccOrder = (aotAccNo, aotAccName, aotAccCurrency, aotAccOpenDate,
    aotNoOrder);

  TCO_Main = class(TActiveForm, IActiveFormX)
    CustomerGB: TGroupBox;
    Panel1: TPanel;
    CustomerSearchBar: TToolBar;
    EditID: TEdit;
    EditINN: TEdit;
    EditName: TEdit;
    DBGridCustomers: TDBGrid;
    GroupBox1: TGroupBox;
    DBGridAccounts: TDBGrid;
    GroupBox3: TGroupBox;
    ControlBar2: TControlBar;
    AccountViewSettingsPanel: TPanel;
    AccountsOrderPanel: TPanel;
    Label2: TLabel;
    SearchAcc: TEdit;
    AccountCurrencyPanel: TPanel;
    Label5: TLabel;
    SearchName: TEdit;
    PopupMenuAccounts: TPopupMenu;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    TransOutgoing: TMenuItem;
    TransIncoming: TMenuItem;
    ImageList: TImageList;
    DBGridTransactions: TDBGrid;
    DBEdit1: TDBEdit;
    N3: TMenuItem;
    N4: TMenuItem;
    PopupMenuTransactions: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    D1: TMenuItem;
    ActionList: TActionList;
    ActionRefresh: TAction;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionShowFilter: TAction;
    ActionSpeedSearch: TAction;
    ActionSelectAll: TAction;
    ActionCommit: TAction;
    ActionLoadFilters: TAction;
    ActionFilter: TAction;
    ActionStepCommit: TAction;
    ActionReject: TAction;
    ActionCommission: TAction;
    PopupMenuCustomers: TPopupMenu;
    N9: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N12: TMenuItem;
    TransDebit: TMenuItem;
    N18: TMenuItem;
    N101: TMenuItem;
    ActionList1: TActionList;
    Refresh: TAction;
    actSettings: TAction;
    Add: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    DateEdit: TMaskEdit;
    TransCredit: TMenuItem;
    ComplexTrD: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N1: TMenuItem;
    RichEdit1: TRichEdit;
    EditNAME1: TEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure AddExecute(Sender: TObject);
    procedure CustomerIDSearchEditExit(Sender: TObject);
    procedure DBGridAccountsCellClick(Column: TColumn);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure TransIncomingClick(Sender: TObject);
    procedure TransOutgoingClick(Sender: TObject);
    procedure SearchAccKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridTransactionsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SearchAccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridTransactionsTitleClick(Column: TColumn);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure ActionStepCommitExecute(Sender: TObject);
    procedure ActionCommitExecute(Sender: TObject);
    procedure DBGridCustomersCellClick(Column: TColumn);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure TransDebitClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure DateEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditINNKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditIDKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridCustomersDblClick(Sender: TObject);
    procedure DBGridCustomersKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridAccountsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TransCreditClick(Sender: TObject);
    procedure DBGridAccountsDblClick(Sender: TObject);
    procedure DBGridTransactionsDblClick(Sender: TObject);
    procedure PopupMenuTransactionsPopup(Sender: TObject);
    procedure ComplexTrDClick(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure DBGridCustomersTitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure ActionSpeedSearchExecute(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditINNKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FEvents: IActiveFormXEvents;
    FUseAccOrder: Boolean;
    FAccOrder: TAccOrder;

    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);

  protected
    FCurrentDate: TDateTime;
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage
      : TDefinePropertyPage); override;
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
    procedure SetCurrentDate(Value: TDateTime);
  public
    { Public declarations }
    RequiredOrderByField: variant;
    OperationMode: TOperationMode;

    LastTransactionID: Longint;

    TransactionState: TTransactionState;
    property CurrentDate: TDateTime read FCurrentDate write SetCurrentDate;

    procedure Initialize; override;
    property UseAccOrder: Boolean read FUseAccOrder;
    property AccOrder: TAccOrder read FAccOrder;
    function FlagEnabled(Flag: Word): Boolean;
    procedure GetCustomerInfo(CustID: Integer; var CustName: String;
      var CustInn: String);
    procedure Focus;
    function ExtractMonth(DateTime: TDateTime; DecimalSymbol: string): string;
    function CommitTransaction(TransactionID: Longint): Longint;
    procedure SBCommit();
    procedure InitData;
    procedure DeleteTransaction(TransactionID: Longint);
    function CommitTransactions(TransactionIDs: WideString): Longint;

    // procedure InitProperties;
    procedure GotoTransaction(ID: Longint);
    function IOCheck(Reference: Integer): Boolean;
    procedure CreateOrderRpt(IOCome: Boolean; CustID: Longint);
    procedure GetBankInfo(var BankName, BankInn: String);
    // procedure MouseWheelHandler(var Message: TMessage); override;

  end;

var
  OperationIDs, CurrencyIDs: TStringList;

implementation

uses ComObj, ComServ, SBCore, SBCustomer, sboapiDataModuleImpl,
  UnitFrmZoom, co_properties_unit, co_commission_unit,
  CO_TransactionPropertiesImpl, co_statement_impl, co_st_check, co_memorial,
  CO_Interval_unit, InFormUnit, OutForm_Unit, CO_In_Unit,
  CO_Out_Unit, TransactionDataModuleUnit, FormAcc_Unit, CurrencyToHR_Azeri_Impl,
  CO_reportUnit,
  CO_AccSettings_Unit, P_AccState_Unit, P_AccTransaction_Unit,
  P_Interval_Unit, CO_Transact_Unitp, UnitCustProps, uAccViewFormImpl,
  uTrViewFormImpl, UnitBProc, co_Order_Rep_unit, co_order_qrep_unit,
  BookmarkSetup, CO_TemplateAddEditUnt, CO_BookmarkAddEditunt,
  CO_frmWReportImpl, UnitOrderInfo, SBTranslateProc, CO_datamod_impl;

{$R *.DFM}
{ TActiveFormX }

procedure TCO_Main.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
    DefinePropertyPage(Class_ActiveFormXPage); }
end;

procedure TCO_Main.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveFormXEvents;
end;

procedure TCO_Main.Initialize;
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

function TCO_Main.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCO_Main.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCO_Main.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCO_Main.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCO_Main.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCO_Main.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCO_Main.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCO_Main.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCO_Main.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCO_Main.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCO_Main.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCO_Main.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCO_Main.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCO_Main.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCO_Main.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCO_Main.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCO_Main.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCO_Main.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCO_Main._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCO_Main.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnActivate;
end;

procedure TCO_Main.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnClick;
end;

procedure TCO_Main.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnCreate;
end;

procedure TCO_Main.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDblClick;
end;

procedure TCO_Main.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDeactivate;
end;

procedure TCO_Main.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnDestroy;
end;

procedure TCO_Main.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then
    FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCO_Main.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then
    FEvents.OnPaint;
end;

procedure TCO_Main.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCO_Main.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCO_Main.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCO_Main.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCO_Main.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCO_Main.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCO_Main.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCO_Main.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCO_Main.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCO_Main.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCO_Main.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCO_Main.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCO_Main.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCO_Main.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCO_Main.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCO_Main.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

{ procedure TCO_Main.AddExecute(Sender: TObject);
  begin
  try
  CO_PropertiesForm :=TCO_PropertiesForm.Create(self);

  CO_PropertiesForm.Showmodal;
  finally
  CO_PropertiesForm.Release;

  end;
  end; }

function TCO_Main.FlagEnabled(Flag: Word): Boolean;

  procedure CheckRow;
  begin
    Result := DBGridTransactions.DataSource.DataSet.FieldByName('Status')
      .AsInteger = Flag;
  end;

var
  SavedPos: TBookmark;
  Index: Integer;

begin
  Result := False;
  with DBGridTransactions, SelectedRows, DataSource.DataSet do
  begin
    if (Count = 1) or (Count = 0) then
      CheckRow
    else
    begin
      DisableControls;
      SavedPos := GetBookmark;
      try
        for Index := 0 to Count - 1 do
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
end;

procedure TCO_Main.InitData;
const
  c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
  i: Word;
begin
  with CO_Datamod do
    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TDataSet) then
        if (Components[i] as TDataSet).Tag = 1 then
          try
            (Components[i] as TDataSet).Open;
          except
            raise Exception.Create(Format(c_err_message,
              [(Components[i] as TDataSet).Name]));
          end;
end;

procedure TCO_Main.ActiveFormCreate(Sender: TObject);
begin
  CO_Datamod := TCO_DataMod.Create(Self);
  // FrmCustProps := TFrmCustProps.Create(Self);
  // CO_Report :=TCO_Report.Create(Self);
  // QRep_Order:=TQRep_Order.Create(Self);
  // QuickRep_Order:=TQuickRep_Order.Create(Self);
  // CO_BookmarkSetup:=TCO_BookmarkSetup.Create(Self);
  // CO_TemplAddEditForm:=TCO_TemplAddEditForm.Create(Self);
  // CO_BookmarkAddEditForm:=TCO_BookmarkAddEditForm.Create(Self);
  // CO_frmWReport:=TCO_frmWReport.Create(Self);
  with CO_Datamod do
  begin
    Customers.Open;
    CurrentDate := Sysdat.FieldByName('tek_dat').AsDateTime;
    TransactionState := tsDelete;
  end;

  SBTranslateProc.TranslateAllComponents(Self, sboapiDataModule.OrPack_SL);
end;

procedure MenuShrift(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  { with ACanvas, Sender as TMenuItem do
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

    FillRect(Bar);
    TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
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
    end; }
end;

procedure TCO_Main.SetCurrentDate(Value: TDateTime);
begin
  FCurrentDate := Value;
  // DTPCurrentDate.DateTime := Int(Value);
end;

function TCO_Main.ExtractMonth(DateTime: TDateTime;
  DecimalSymbol: string): string;
const
  Months: array [1 .. 12] of string = ('yanvar', 'fevral', 'mart', 'aprel',
    'may', 'iyun', 'iyul', 'avqust', 'sentyabr', 'oktyabr', 'noyabr', 'dekabr');
var
  Year, Month, Day: Word;
begin
  DecodeDate(DateTime, Year, Month, Day);
  Result := IntToStr(Day) + DecimalSymbol + Months[Month] + DecimalSymbol +
    IntToStr(Year);
end;

procedure TCO_Main.CustomerIDSearchEditExit(Sender: TObject);
begin
  (Sender as TEdit).Text := '';
end;

procedure TCO_Main.GotoTransaction(ID: Longint);
begin
  with TransactionDataModule.Transactions do
    Locate('ID', ID, []);
end;

procedure TCO_Main.Focus;
begin
  if DBGridTransactions.CanFocus then
    DBGridTransactions.SetFocus;
end;

procedure TCO_Main.DBGridAccountsCellClick(Column: TColumn);
begin
  SearchAcc.Text := CO_Datamod.Account.FieldByName('AccNo').AsString;
  SearchName.Text := CO_Datamod.Account.FieldByName('AccName').AsString;
end;

procedure TCO_Main.N10Click(Sender: TObject);
begin
  If CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else
  begin
    try
      CO_St_Form := TCO_St_Form.Create(Self);
      CO_St_Form.Showmodal;
    finally
      CO_St_Form.Release;
    end;
  end;
end;

procedure TCO_Main.N11Click(Sender: TObject);

var
  AStartDate, AEndDate: TDateTime;
begin
  If CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else
  begin
    CO_MemorialForm := TCO_MemorialForm.Create(Self);
    FormInterval := TFormInterval.Create(Self);

    with FormInterval do
    begin
      StartDateEdit.DateTime := CO_Datamod.Sysdat.FieldByName('tek_dat')
        .AsDateTime;
      EndDateEdit.DateTime := StartDateEdit.DateTime;

      if Showmodal = mrOK then
      begin
        AStartDate := StartDateEdit.DateTime;
        AEndDate := EndDateEdit.DateTime;

        with CO_MemorialForm do
        begin
          OpenDataControls(AStartDate, AEndDate);
          Showmodal;
        end;

      end;

    end;
  end;
end;

procedure TCO_Main.Edit1Change(Sender: TObject);
begin
  with CO_Datamod.Customers do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From customers Where inn=''' + EditINN.Text + '''');
    Open;
    DBGridAccounts.Options := [dgRowSelect, dgAlwaysShowEditor, dgTitles,
      dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

    with CO_Datamod.Account do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from juraccs where ACCKLID=''' +
        CO_Datamod.Customers.FieldByName('ID').AsString + ''' ');
      Open;
      Refresh;

      with CO_Datamod.provarch do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from prov_t where debit = ''' +
          CO_Datamod.Account.FieldByName('accno').AsString + ''' or credit = '''
          + CO_Datamod.Account.FieldByName('accno').AsString + ''' ');
        Open;
        Refresh;

      end;
    end;
  end;
end;

procedure TCO_Main.TransOutgoingClick(Sender: TObject);
begin
  RichEdit1.Text := CO_Datamod.Account.FieldByName('TipAcc').AsString;
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else if RichEdit1.FindText('C', 0, Length(RichEdit1.Text), []) <> -1 then
  begin
    ShowMessage('Hesaba Kredit həbsi qoyulub');
    Exit;
  end
  else
    with CO_TransTypeIncOut do
    begin
      CO_TransTypeIncOut := TCO_TransTypeIncOUT.Create(Self);
      IncOut := 2; { outgoing }
      Showmodal;
    end;
end;

procedure TCO_Main.TransIncomingClick(Sender: TObject);
begin
  RichEdit1.Text := CO_Datamod.Account.FieldByName('TipAcc').AsString;
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else if RichEdit1.FindText('D', 0, Length(RichEdit1.Text), []) <> -1 then
  begin
    ShowMessage('Hesaba Debet həbsi qoyulub');
    Exit;
  end
  else
    with CO_TransTypeIncOut do
    begin
      CO_TransTypeIncOut := TCO_TransTypeIncOUT.Create(Self);
      IncOut := 1; { incoming }
      Showmodal;
    end;
end;

procedure TCO_Main.SearchAccKeyPress(Sender: TObject; var Key: Char);
Var
  acc_no: String;
begin
  if not(Key = #13) then
    Exit;
  with CO_Datamod, Account do
  begin
    if not(Customers.State = dsInsert) then
      SetVariable('CID', null);
    SetVariable('p_AccNO', SearchAcc.Text + '%');
    if not Active then
      Open
    else
      Refresh;
  end;

  if CO_Datamod.Account.RecordCount > 0 then
  begin
    acc_no := CO_Datamod.Account.FieldByName('ACCNO').AsVariant;

    CO_Datamod.Customers.Locate('ID', CO_Datamod.Account.FieldByName('ACCKLID')
      .AsInteger, [loCaseInsensitive, loPartialKey]);

    // acc_no <>''  then
    CO_Datamod.Account.Locate('ACCNO', acc_no,
      [loCaseInsensitive, loPartialKey]);
  end;

  { if not (key=#13) then Exit;
    with P_DataModule, Account do begin
    if not (P_Customers.State =dsInsert) then
    SetVariable('CID', null);
    SetVariable('p_AccNO', SearchAcc.Text);
    if not Active then Open else Refresh;
    end;
    P_DataModule.p_Customers.Locate
    ('ID',P_DataModule.Account.Fieldbyname('CUSTID').AsInteger, [loCaseInsensitive, loPartialKey]);

  }
end;

procedure TCO_Main.DBGridTransactionsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ImageIndex: Integer;
begin
  ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
        tsCommited:
          ImageIndex := 7;
        tsRejected:
          ImageIndex := 8;
        tsDelayed:
          ImageIndex := 9;
      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TCO_Main.SearchAccKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (EditINN.Text <> '') or (EditID.Text <> '') or (EditName.Text <> '') or
    (DateEdit.Text <> '') or (SearchName.Text <> '') then
    EditID.Text := '';
  EditINN.Text := '';
  DateEdit.Text := '';
  SearchName.Text := '';
  EditName.Text := '';
end;

procedure TCO_Main.SearchNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    with CO_Datamod.Account do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from juraccs Where upper(accname) like upper(''%' +
        SearchName.Text + '%'') and rownum=1');
      Open;
      DBGridAccounts.Options := [dgRowSelect, dgAlwaysShowEditor, dgTitles,
        dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
        dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
      with CO_Datamod.Customers do
      begin
        Locate('id', CO_Datamod.Account.FieldByName('accklid').AsVariant, []);

        DBGridAccounts.Options := [dgRowSelect, dgAlwaysShowEditor, dgTitles,
          dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
          dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit,
          dgMultiSelect];
        // ---------------------------------------------------------------------------------------------------
        with CO_Datamod.Transactions do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from transactionsp where debitid = ''' +
            DBEdit1.Text + ''' or creditid = ''' + DBEdit1.Text + '''  ');
          Open;
          Refresh;
          // ---------------------------------------------------------------------------------------------------
          DBGridAccounts.Options := [dgRowSelect, dgAlwaysShowEditor, dgTitles,
            dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
            dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit,
            dgMultiSelect];
          if (EditINN.Text <> '') or (EditID.Text <> '') or
            (EditName.Text <> '') or (DateEdit.Text <> '') or
            (SearchAcc.Text <> '') then
            EditID.Text := '';
          EditINN.Text := '';
          DateEdit.Text := '';
          SearchAcc.Text := '';
          EditName.Text := '';
        end;
      end;
    end;

end;

procedure TCO_Main.GetCustomerInfo(CustID: Integer; var CustName: String;
  var CustInn: String);
begin
  with CO_Datamod.OPCash do
  begin
    CallProcedure('GetCustomerInfo', [CustID, '', '']);
    CustInn := GetParameter(1);
    CustName := GetParameter(2);
  end;
end;

procedure TCO_Main.DBGridTransactionsTitleClick(Column: TColumn);

var
  TitleName: string;
begin
  TitleName := Column.FieldName;
  with CO_Datamod.Transactions do
  begin
    SetVariable('Title', TitleName);
    Refresh;
  end;
end;

procedure TCO_Main.N6Click(Sender: TObject);

var
  ValuteName, withManat, NoManat, WithCoin: string;
  ManatPosition, i: Integer;
  CustName, CustInn: string;
  TransactionID: string;
begin
  If CO_Datamod.Transactions.IsEmpty then
  begin
    ShowMessage('Heç bir əməliyyat qeyd edilməyib');
    Exit;
  end
  else
  begin
    NoManat := '';
    try
      with CO_Datamod.Transactions do
      begin
        GetCustomerInfo(FieldByName('creditid').AsInteger, CustName, CustInn);
        TransactionID := FieldByName('ID').AsString;
        Filter := ' ID=' + TransactionID;
        Filtered := True;
      end;
      with CO_Datamod, ODSValuteName do
      begin
        Close;
        SetVariable('valute',
          Transactions.FieldByName('debitcurrencyid').Value);
        ODSValuteName.Open;
        ValuteName := AnsiLowerCase(FieldByName('Valu_name').AsString);
      end;

      withManat := CurrencyToHR_Azeri
        (Trunc(CO_Datamod.Transactions.FieldByName('creditamount')
        .AsFloat), 0, [0]);

      ManatPosition := POS('manat', withManat);
      if ManatPosition > 0 then
        for i := 1 to ManatPosition - 1 do
          NoManat := NoManat + withManat[i];

      WithCoin := FloatToStr
        (Frac(StrToFloat(CO_Datamod.Transactions.FieldByName('creditamount')
        .AsString)));
      if WithCoin <> '0' then
      begin
        Delete(WithCoin, 1, 2);
        if Length(WithCoin) < 2 then
          WithCoin := WithCoin + '0'
        else if Length(WithCoin) > 2 then
          Delete(WithCoin, 3, Length(WithCoin));
        WithCoin := WithCoin + ' ' + CO_Datamod.ODSValuteName.FieldByName
          ('valu_bala').AsString;
      end { if WithCoin<>'0' }
      else
        WithCoin := '';

      ValuteName := AnsiLowerCase(CO_Datamod.ODSValuteName.FieldByName
        ('Valu_name').AsString + '  ' + WithCoin);

      if NoManat = EmptyStr then
        NoManat := '0 ';

      if not Assigned(CO_Report) then
        CO_Report := TCO_Report.Create(Self);
      CO_Datamod.ODSCASHINFO.Close;
      CO_Datamod.ODSCASHINFO.SetVariable('id',
        CO_Datamod.Transactions.FieldByName('ID').AsInteger);
      CO_Datamod.ODSCASHINFO.Open;
      CO_Datamod.Trdestination.Refresh;
      CO_Report.ODSBank.Open;
      CO_Report.QRAMMOUNT1.Caption := NoManat + ValuteName;
      CO_Report.QRAMMOUNT2.Caption := NoManat + ValuteName;
      CO_Report.Preview;
    finally
      with CO_Datamod.Transactions do
        Filtered := False;
      CO_Report.ODSBank.Close;
    end;
  end;
end;

function TCO_Main.CommitTransaction(TransactionID: Longint): Longint;
begin
  with CO_Datamod.SBTransaction do
    Result := CallIntegerFunction(cs_commit_transaction,
      ['TransactionID', TransactionID, 'CommitTemp', True]);

end;

procedure TCO_Main.SBCommit();
begin
  sboapiDataModule.SBSession.Commit
end;

procedure TCO_Main.N8Click(Sender: TObject);
var
  i: Integer;
  ID: Longint;
  WillRefresh: Boolean;
  Status, CommitedCount, ErrorCount: Word;
  LastErrorMessage: String;
begin
  CommitedCount := 0;
  ErrorCount := 0;
  WillRefresh := False;
  with TransactionDataModule, DBGridTransactions, SelectedRows,
    DataSource.DataSet do
    if MessageDlg('Əməliyyatlar təsdiqlənsin?', mtConfirmation,
      [mbYes, mbCancel], 0) = mrYes then
    begin
      DisableControls;
      try
        Application.ProcessMessages;
        if Count = 0 then
          CurrentRowSelected := True;
        for i := 0 to Count - 1 do
          try
            GotoBookmark(TBookmark(Items[i]));
            Status := FieldByName('Status').AsInteger;
            if Status in [tsDelayed, tsRejected] then
            begin
              ID := FieldByName('ID').AsInteger;
              CommitTransaction(ID);
              WillRefresh := True;
              Inc(CommitedCount);
              SBCommit();
            end;
          except
            on E: Exception do
            begin
              LastErrorMessage := E.Message;
              Inc(ErrorCount);
              Continue;
            end;
          end;
      finally
        if ErrorCount > 0 then
          if ErrorCount = 1 then
            MessageDlg(LastErrorMessage, mtConfirmation, [mbOk], 0)
          else
            MessageDlg(Format(cs_CommitInformation, [CommitedCount + ErrorCount,
              CommitedCount, ErrorCount]), mtConfirmation, [mbOk], 0);

        EnableControls;

        if WillRefresh then
        begin
          TransactionState := tsCommit;
          CO_Datamod.Transactions.Close;
          CO_Datamod.Transactions.Open;
        end;

      end;
    end;

end;

function TCO_Main.CommitTransactions(TransactionIDs: WideString): Longint;
begin
  with CO_Datamod.SBTransaction do
    Result := CallIntegerFunction(cs_commit_delayed_transactions,
      ['OverloadIDsStr', TransactionIDs, 'CommitTemp', True]);
end;

procedure TCO_Main.D1Click(Sender: TObject);
var
  i: Integer;
  IDs: WideString;
  Status, TrCount: Word;
begin
  IDs := '';
  TrCount := 0;
  with DBGridTransactions, SelectedRows, DataSource.DataSet do
    if Count = 0 then
    begin
      Inc(TrCount);
      IDs := FieldByName('ID').AsString;
    end
    else
    begin
      DisableControls;
      try
        for i := 0 to Count - 1 do
        begin
          GotoBookmark(TBookmark(Items[i]));
          Status := FieldByName('Status').AsInteger;
          if Status in [tsDelayed, tsRejected] then
          begin
            Inc(TrCount);
            IDs := IDs + ',' + FieldByName('ID').AsString;
          end;
        end;
        System.Delete(IDs, 1, 1);
      finally
        EnableControls;
      end;
    end;
  if MessageDlg(Format('%d sayda əməliyyat təsdiqlənsin?', [TrCount]),
    mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    with TransactionDataModule do
    begin
      CommitTransactions(IDs);
      SBCommit();

    end;
end;

procedure TCO_Main.ActionStepCommitExecute(Sender: TObject);

var
  i: Integer;
  ID: Longint;
  WillRefresh: Boolean;
  Status, CommitedCount, ErrorCount: Word;
  LastErrorMessage: String;
  qaccid, qtrid: Integer;
begin
  If CO_Datamod.Transactions.IsEmpty then
  begin
    ShowMessage('Heç bir əməliyyat qeyd edilməyib');
    Exit;
  end
  else
  begin
    CommitedCount := 0;
    ErrorCount := 0;
    WillRefresh := False;
    if CO_Datamod.Transactions.FieldByName('Status').AsInteger = 2 then
      ShowMessage('Əməliyyat artıq təsdiqlənib!')
    else
    begin

      with TransactionDataModule, DBGridTransactions, SelectedRows,
        DataSource.DataSet do
        if MessageDlg('Əməliyyatlar təsdiqlənsin?', mtConfirmation,
          [mbYes, mbCancel], 0) = mrYes then
        begin
          DisableControls;
          try
            Application.ProcessMessages;
            if Count = 0 then
              CurrentRowSelected := True;
            for i := 0 to Count - 1 do
              try
                GotoBookmark(TBookmark(Items[i]));
                Status := FieldByName('Status').AsInteger;
                if Status in [tsDelayed, tsRejected] then
                begin
                  ID := FieldByName('ID').AsInteger;
                  CommitTransaction(ID);
                  WillRefresh := True;
                  Inc(CommitedCount);
                  SBCommit();
                end;
              except
                on E: Exception do
                begin
                  LastErrorMessage := E.Message;
                  Inc(ErrorCount);
                  Continue;
                end;
              end;
          finally
            if ErrorCount > 0 then
              if ErrorCount = 1 then
                MessageDlg(LastErrorMessage, mtConfirmation, [mbOk], 0)
              else
                MessageDlg(Format(cs_CommitInformation,
                  [CommitedCount + ErrorCount, CommitedCount, ErrorCount]),
                  mtConfirmation, [mbOk], 0);

            EnableControls;

            if WillRefresh then
            begin
              TransactionState := tsCommit;
              qtrid := CO_Datamod.TransactionsID.AsInteger;
              qaccid := CO_Datamod.Account.FieldByName('id').AsInteger;
              CO_Datamod.Transactions.Close;
              CO_Datamod.Transactions.Open;
              CO_Datamod.Account.Close;
              CO_Datamod.Account.Open;
              CO_Datamod.Account.Locate('id', qaccid, []);
              CO_Datamod.Transactions.Locate('id', qtrid, []);
            end;

          end;
        end;
    end;
  end;
end;

procedure TCO_Main.ActionCommitExecute(Sender: TObject);

var
  i: Integer;
  IDs: WideString;
  Status, TrCount: Word;
begin
  IDs := '';
  TrCount := 0;
  with DBGridTransactions, SelectedRows, DataSource.DataSet do
    if Count = 0 then
    begin
      Inc(TrCount);
      IDs := FieldByName('ID').AsString;
    end
    else
    begin
      DisableControls;
      try
        for i := 0 to Count - 1 do
        begin
          GotoBookmark(TBookmark(Items[i]));
          Status := FieldByName('Status').AsInteger;
          if Status in [tsDelayed, tsRejected] then
          begin
            Inc(TrCount);
            IDs := IDs + ',' + FieldByName('ID').AsString;
          end;
        end;
        System.Delete(IDs, 1, 1);
      finally
        EnableControls;
      end;
    end;
  if MessageDlg(Format('%d sayda əməliyyat təsdiqlənsin?', [TrCount]),
    mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    with TransactionDataModule do
    begin
      CommitTransactions(IDs);
      SBCommit();

    end;
end;

procedure TCO_Main.DBGridCustomersCellClick(Column: TColumn);
begin
  if (EditINN.Text <> '') or (EditName.Text <> '') or (DateEdit.Text <> '') then
  begin
    EditINN.Text := '';
    DateEdit.Text := '';
    EditName.Text := '';
  end;

  if not CO_Datamod.Account.IsEmpty then
  begin
    if not CO_Datamod.Account.FieldByName('ACCNO').IsNull then
      SearchAcc.Text := CO_Datamod.Account.FieldByName('ACCNO').AsVariant
    else
      SearchAcc.Text := '';
    if not CO_Datamod.Account.FieldByName('ACCNAME').IsNull then
      SearchName.Text := CO_Datamod.Account.FieldByName('ACCNAME').AsVariant
    else
      SearchName.Text := '';
  end;
end;

procedure TCO_Main.N9Click(Sender: TObject);
begin
  CO_Datamod.Customers.Close;
  CO_Datamod.Customers.Open;
end;

procedure TCO_Main.N13Click(Sender: TObject);
begin
  P_AccState := TP_AccState.Create(Self);
  with CO_Datamod.Account do
    if IsEmpty then
    begin
      ShowMessage('Heç bir hesab qeyd olunmayıb');
      Exit;
    end
    else
    begin
      with P_AccState do
        Showmodal;

    end;

end;

procedure TCO_Main.N14Click(Sender: TObject);
begin
  if not Assigned(FormAccount) then
    FormAccount := TFormAccount.Create(Self);
  FormAccount.Showmodal;
end;

procedure TCO_Main.N15Click(Sender: TObject);
var
  AStartDate, AEndDate: TDateTime;
begin
  FormAccTransaction := TFormAccTransaction.Create(Self);
  P_interval := TP_Interval.Create(Self);
  with CO_Datamod.Account do
    if IsEmpty then
    begin
      ShowMessage('Heç bir hesab qeyd olunmayıb');
      Exit;
    end
    else
    begin

      CO_Datamod.Sysdat.Open;
      with P_interval do
      begin
        StartDateEdit.DateTime := CO_Datamod.Sysdat.FieldByName('tek_dat')
          .AsDateTime;
        EndDateEdit.DateTime := StartDateEdit.DateTime;

        if Showmodal = mrOK then
        begin
          AStartDate := StartDateEdit.DateTime;
          AEndDate := EndDateEdit.DateTime;

          with FormAccTransaction do
          begin
            OpenDataControls(AStartDate, AEndDate);
            Showmodal;
          end;
        end;
      end;
    end;
end;

procedure TCO_Main.N16Click(Sender: TObject);
begin
  begin
    CO_AccSettings := TCO_AccSettings.Create(Self);
    CO_AccSettings.Showmodal;

  end;
end;

procedure TCO_Main.TransDebitClick(Sender: TObject);
begin
  RichEdit1.Text := CO_Datamod.Account.FieldByName('TipAcc').AsString;
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else if RichEdit1.FindText('D', 0, Length(RichEdit1.Text), []) <> -1 then
  begin
    ShowMessage('Hesaba Debet həbsi qoyulub');
    Exit;
  end
  else
  begin
    if not Assigned(co_Transactions) then
      co_Transactions := TCO_Transactions.Create(Self);
    with co_Transactions { , CO_DataMod } do
    begin
      TransTypeIncOutDC := 3;
      Showmodal;
    end;
  end;
end;

procedure TCO_Main.DeleteTransaction(TransactionID: Longint);
begin
  with CO_Datamod.SBTransaction do
    CallProcedure(cs_del_transaction, ['TransactionID', TransactionID]);
end;

procedure TCO_Main.N18Click(Sender: TObject);
var
  Index: Integer;
  WaitNextConfirm, WillRefresh: Boolean;
  TransactionID: Integer;
  qaccid, qtrid: Integer;
begin
  CO_Datamod.SB_ACA.CallProcedure('CheckObjectAccess',
    ['Transaction', 'delete']);
  WaitNextConfirm := True;
  WillRefresh := False;
  with DBGridTransactions, SelectedRows, DataSource.DataSet, CO_Datamod do
    try
      if Count = 0 then
        CurrentRowSelected := True;
      for Index := 0 to Count - 1 do
      begin
        GotoBookmark(Pointer(Items[Index]));
        TransactionID := FieldByName('ID').AsInteger;

        if WaitNextConfirm then
          case MessageDlg(Format('Əməliyyat #%d ləğv edilsin?', [TransactionID]
            ), mtConfirmation, [mbYes, mbNo, mbCancel, mbYesToAll], 0) of
            mrNo:
              Continue;
            mrCancel:
              break;
            mrYesToAll:
              if MessageDlg(Format('%d sayda əməliyyat ləğv edilsin?',
                [Count - Index]), mtConfirmation, [mbYes, mbCancel], 0)
                = mrYes then
                WaitNextConfirm := False
              else
                Continue;
          end;
        Application.ProcessMessages;

        with ODS_VidOPTrDel do
        begin { H.R. 05.10.2010 }
          Close;
          SetVariable('v_ID', DBGridTransactions.DataSource.DataSet.FieldByName
            ('OperationCode').AsInteger);
          Open;
        end;
        if ODS_VidOPTrDel.FieldByName('Cnt').AsInteger = 1 then
        begin
          ShowMessage('Bu tip əməliyyatı bu moduldan ləğv etmək olmaz');
          Continue;
        end; { *** H.R. 05.10.2010 }

        if DBGridTransactions.SelectedRows.Count > 1 then
        begin { H.R. 17.03.2011 }
          try
            DeleteTransaction(TransactionID);
          except
          end;
        end
        else
          DeleteTransaction(TransactionID);
        WillRefresh := True;
        SBCommit;
        TransactionState := tsDelete;
      end;
    finally
    end;
  qtrid := CO_Datamod.TransactionsID.AsInteger;
  qaccid := CO_Datamod.Account.FieldByName('ID').AsInteger;
  CO_Datamod.Transactions.Close;
  CO_Datamod.Transactions.Open;
  CO_Datamod.Transactions.Locate('ID', qtrid, []);
  CO_Datamod.Account.Close;
  CO_Datamod.Account.Open;
  CO_Datamod.Account.Locate('ID', qaccid, []);
end;

procedure TCO_Main.AddExecute(Sender: TObject);
begin
  if not Assigned(FrmCustProps) then
    FrmCustProps := TFrmCustProps.Create(Self);
  if FrmCustProps.New then
    Refresh.Execute;
end;

procedure TCO_Main.RefreshExecute(Sender: TObject);
var
  SavedPos: Integer;
begin
  with CO_Datamod.Customers do
  begin
    SavedPos := RecNo;
    Close;
    Open;
    if SavedPos > RecordCount then
      RecNo := RecordCount
    else
      RecNo := SavedPos;
  end;

end;

procedure TCO_Main.N19Click(Sender: TObject);
begin
  if not Assigned(FrmCustProps) then
    FrmCustProps := TFrmCustProps.Create(Self);
  FrmCustProps.Edit(CO_Datamod.CustData.DataSet.FieldByName('ID').AsInteger);
  Refresh.Execute;
end;

procedure TCO_Main.N20Click(Sender: TObject);
begin
  if CO_Datamod.Account.RecordCount <> 0 then
    MessageDlg('Müştərinin açıq hesabları var', mtError, [mbOk], 0)
  else if MessageDlg('Müştəri qeydiyyatdan çıxarılsın?', mtConfirmation,
    [mbYes, mbCancel], 0) = mrYes then
  begin
    Sb_CloseCustomer(CO_Datamod.CustData.DataSet.FieldByName('ID').AsInteger);
    Refresh.Execute;
  end;
end;

procedure TCO_Main.DateEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    CO_Datamod.Customers.Locate('OPEN_DAT',
      variant((Sender as TMaskEdit).Text), []);
end;

procedure TCO_Main.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    // New Addition
    EditNAME1.Text := EditName.Text;
    { Replace I, i, İ, i }
    with EditNAME1 do
    begin
      Text := StringReplace(Text, 'i', '`', [rfReplaceAll]);
      Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
      Text := StringReplace(Text, 'İ', '`', [rfReplaceAll]);
      Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
      Text := StringReplace(Text, 'ı', '`', [rfReplaceAll]);
    end;

    // ActionSpeedSearchExecute(Sender);
    ActionSpeedSearchExecute(EditNAME1);
  end;
end;

procedure TCO_Main.ActionSpeedSearchExecute(Sender: TObject);
var
  SearchField: string;
  SearchOptions: TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase, srPartialMatch];

  with Sender as TEdit do
  begin
    SearchField := copy(Name, 5, Length(Name));
    with TOracleDataSet(DBGridCustomers.DataSource.DataSet) do
      if not SearchRecord(SearchField, Text, SearchOptions + [srFromCurrent,
        srForward]) then
        if MessageDlg('Axtarış sona çatdı.' + #13 + 'Əvvəldən başlansın?',
          mtInformation, [mbNo, mbYes], 0) = mrYes then
          if not SearchRecord(SearchField, Text,
            SearchOptions + [srFromBeginning]) then
            MessageDlg('Yazı tapılmayıb!', mtInformation, [mbOk], 0);
  end;

end;

procedure TCO_Main.EditNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  { if key=vk_return then
    if NamEdit.Text<>'' then DBGridCustomers.DataSource.DataSet.Locate('Name', NamEdit.Text, [loCaseInsensitive, loPartialKey]);
  }
end;

procedure TCO_Main.EditINNKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ActionSpeedSearchExecute(Sender);
  end;

end;

procedure TCO_Main.EditINNKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if key=vk_return then
    if INNEdit.Text<>'' then CO_DataMod.Customers.Locate('INN',INNEdit.Text,[loCaseInsensitive, loPartialKey]);
  }
end;

procedure TCO_Main.EditIDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ActionSpeedSearchExecute(Sender);
  end;
end;

procedure TCO_Main.EditIDKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  { if key=vk_return then
    if IDEdit.Text<>'' then CO_DataMod.Customers.Locate('ID',IDEdit.Text,[loCaseInsensitive, loPartialKey]);
  }
end;

procedure TCO_Main.DBGridCustomersDblClick(Sender: TObject);
begin
  N19Click(Sender);
end;

procedure TCO_Main.DBGridCustomersKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    DBGridCustomersCellClick(DBGridCustomers.columns[0]);
end;

procedure TCO_Main.DBGridAccountsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_return then
    DBGridAccountsCellClick(DBGridAccounts.columns[0]);
end;

procedure TCO_Main.TransCreditClick(Sender: TObject);
begin
  RichEdit1.Text := CO_Datamod.Account.FieldByName('TipAcc').AsString;
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else if RichEdit1.FindText('C', 0, Length(RichEdit1.Text), []) <> -1 then
  begin
    ShowMessage('Hesaba Kredit həbsi qoyulub');
    Exit;
  end
  else
  begin
    if not Assigned(co_Transactions) then
      co_Transactions := TCO_Transactions.Create(Self);
    with co_Transactions, CO_Datamod do
    begin
      TransTypeIncOutDC := 4;
      Showmodal;
    end;
  end;
end;

procedure TCO_Main.DBGridAccountsDblClick(Sender: TObject);
begin
  frmAccInfo := TfrmAccInfo.Create(Self);
  with frmAccInfo, CO_Datamod do
  begin
    AccountID := Account.FieldByName('ID').AsInteger;
    ShowAccInfo;
    Showmodal;
  end;
end;

procedure TCO_Main.DBGridTransactionsDblClick(Sender: TObject);
begin
  frmTrView := TfrmTrView.Create(Self);
  with frmTrView, CO_Datamod do
  begin
    TrID := Transactions.FieldByName('ID').AsInteger;
    ShowTrInfo;
    Showmodal;
  end;
end;

procedure TCO_Main.PopupMenuTransactionsPopup(Sender: TObject);
begin
  CO_Datamod.ODSCASH.Open;

  N6.Enabled :=

    (DBGridTransactions.DataSource.DataSet.FieldByName('DEBITBALCN')
    .AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName('CASHBALANCENATIONAL')
    .AsInteger)) or (DBGridTransactions.DataSource.DataSet.FieldByName
    ('DEBITBALCN').AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName
    ('CASHBALANCEENGLISH').AsInteger));

  { (copy(DBGridTransactions.columns[3].Field.AsString,1,4)='1001')or
    (copy(DBGridTransactions.columns[3].Field.AsString,1,4)='1011'); }

  N21.Enabled :=
    ((DBGridTransactions.DataSource.DataSet.FieldByName('DEBITBALCN')
    .AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName('CASHBALANCENATIONAL')
    .AsInteger)) or (DBGridTransactions.DataSource.DataSet.FieldByName
    ('DEBITBALCN').AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName
    ('CASHBALANCEENGLISH').AsInteger))) or
    ((DBGridTransactions.DataSource.DataSet.FieldByName('CREDITBALCN')
    .AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName('CASHBALANCENATIONAL')
    .AsInteger)) or (DBGridTransactions.DataSource.DataSet.FieldByName
    ('CREDITBALCN').AsString = IntToStr(CO_Datamod.ODSCASH.FieldByName
    ('CASHBALANCEENGLISH').AsInteger)));

  { ((copy(DBGridTransactions.columns[3].Field.AsString,1,4)=IntToStr(CO_DataMod.ODSCASH.FieldByName('CASHBALANCENATIONAL').AsInteger)) or
    (copy(DBGridTransactions.columns[3].Field.AsString,1,4)=IntToStr(CO_DataMod.ODSCASH.FieldByName('CASHBALANCEENGLISH').AsInteger)))or

    ((copy(DBGridTransactions.columns[5].Field.AsString,1,4)=IntToStr(CO_DataMod.ODSCASH.FieldByName('CASHBALANCENATIONAL').AsInteger)) or
    (copy(DBGridTransactions.columns[5].Field.AsString,1,4)=IntToStr(CO_DataMod.ODSCASH.FieldByName('CASHBALANCEENGLISH').AsInteger)));
  }
  CO_Datamod.ODSCASH.Close;

end;

procedure TCO_Main.ComplexTrDClick(Sender: TObject);
begin
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else
  begin
    FormBProc := TFormBProc.Create(Self);
    FormBProc.Showmodal;
  end;
end;

procedure TCO_Main.N21Click(Sender: TObject);
var
  TransactionID: String;
  SavePlace: TBookmark;
begin
  CO_Datamod.Settings.Open;
  if not Assigned(QRep_Order) then
    QRep_Order := TQRep_Order.Create(Self);
  if not Assigned(QuickRep_Order) then
    QuickRep_Order := TQuickRep_Order.Create(Self);
  // QRDbtext27 co_datamod
  // QRep_Order.QRLabel19:=co_datamod
  // ShowMessage(CO_DataMod.Settings.fieldbyname('HANDOVER').asstring);

  if trim(CO_Datamod.Settings.FieldByName('HANDOVER').AsString) = '0' then
  begin
    QRep_Order.QRShape6.Enabled := False;
    QRep_Order.QRLabel5.Enabled := False;
    QRep_Order.QRShape37.Enabled := False;
    QRep_Order.QRLabel47.Enabled := False;
    QRep_Order.QRShape23.Enabled := False;
    QRep_Order.QRLabel23.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('HANDOVER').AsString) = '1' then
  begin
    QRep_Order.QRShape6.Enabled := True;
    QRep_Order.QRLabel5.Enabled := True;
    QRep_Order.QRShape37.Enabled := True;
    QRep_Order.QRLabel47.Enabled := True;
    QRep_Order.QRShape23.Enabled := True;
    QRep_Order.QRLabel23.Enabled := True;

  end;
  if trim(CO_Datamod.Settings.FieldByName('Chief').AsString) = '0' then
  begin
    QRep_Order.QRShape2.Enabled := False;
    QRep_Order.QRLabel48.Enabled := False;
    QRep_Order.QRShape38.Enabled := False;
    QRep_Order.QRLabel10.Enabled := False;
    QRep_Order.QRShape24.Enabled := False;
    QRep_Order.QRLabel28.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('Chief').AsString) = '1' then
  begin
    QRep_Order.QRShape2.Enabled := True;
    QRep_Order.QRLabel48.Enabled := True;
    QRep_Order.QRShape38.Enabled := True;
    QRep_Order.QRLabel10.Enabled := True;
    QRep_Order.QRShape24.Enabled := True;
    QRep_Order.QRLabel28.Enabled := True;
  end;

  if trim(CO_Datamod.Settings.FieldByName('Operator').AsString) = '0' then
  begin
    QRep_Order.QRShape40.Enabled := False;
    QRep_Order.QRLabel49.Enabled := False;
    QRep_Order.QRShape25.Enabled := False;
    QRep_Order.QRLabel31.Enabled := False;
    QRep_Order.QRShape4.Enabled := False;
    QRep_Order.QRLabel11.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('Operator').AsString) = '1' then
  begin
    QRep_Order.QRShape40.Enabled := True;
    QRep_Order.QRLabel49.Enabled := True;
    QRep_Order.QRShape25.Enabled := True;
    QRep_Order.QRLabel31.Enabled := True;
    QRep_Order.QRShape4.Enabled := True;
    QRep_Order.QRLabel11.Enabled := True;
  end;
  if trim(CO_Datamod.Settings.FieldByName('Cashier').AsString) = '0' then
  begin
    QRep_Order.QRShape41.Enabled := False;
    QRep_Order.QRLabel50.Enabled := False;
    QRep_Order.QRShape26.Enabled := False;
    QRep_Order.QRLabel32.Enabled := False;
    QRep_Order.QRShape5.Enabled := False;
    QRep_Order.QRLabel12.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('Cashier').AsString) = '1' then
  begin
    QRep_Order.QRShape41.Enabled := True;
    QRep_Order.QRLabel50.Enabled := True;
    QRep_Order.QRShape26.Enabled := True;
    QRep_Order.QRLabel32.Enabled := True;
    QRep_Order.QRShape5.Enabled := True;
    QRep_Order.QRLabel12.Enabled := True;
  end;

  // ------------------------------------------Modified by  for AZNEQ.BANK on 17.08.2006
  if trim(CO_Datamod.Settings.FieldByName('Controller').AsString) = '1' then
  begin
    QRep_Order.QRShape82.Enabled := True;
    QRep_Order.QRLabel83.Enabled := True;
    QRep_Order.QRShape84.Enabled := True;
    QRep_Order.QRLabel85.Enabled := True;
    QRep_Order.QRShape86.Enabled := True;
    QRep_Order.QRLabel87.Enabled := True;
  end;
  if trim(CO_Datamod.Settings.FieldByName('Controller').AsString) = '0' then
  begin
    QRep_Order.QRShape82.Enabled := False;
    QRep_Order.QRLabel83.Enabled := False;
    QRep_Order.QRShape84.Enabled := False;
    QRep_Order.QRLabel85.Enabled := False;
    QRep_Order.QRShape86.Enabled := False;
    QRep_Order.QRLabel87.Enabled := False;
  end;

  // -------------------OUT--------------------------------------
  if trim(CO_Datamod.Settings.FieldByName('Amount').AsString) = '0' then
  begin
    QuickRep_Order.QRShape3.Enabled := False;
    QuickRep_Order.QRLabel11.Enabled := False;
    QuickRep_Order.QRShape29.Enabled := False;
    QuickRep_Order.QRLabel47.Enabled := False;
    QuickRep_Order.QRShape18.Enabled := False;
    QuickRep_Order.QRLabel12.Enabled := False;

  end;
  if trim(CO_Datamod.Settings.FieldByName('Amount').AsString) = '1' then
  begin
    QuickRep_Order.QRShape3.Enabled := True;
    QuickRep_Order.QRLabel11.Enabled := True;
    QuickRep_Order.QRShape29.Enabled := True;
    QuickRep_Order.QRLabel47.Enabled := True;
    QuickRep_Order.QRShape18.Enabled := True;
    QuickRep_Order.QRLabel12.Enabled := True;

  end;
  if trim(CO_Datamod.Settings.FieldByName('chief_out').AsString) = '0' then
  begin
    QuickRep_Order.QRShape19.Enabled := False;
    QuickRep_Order.QRLabel14.Enabled := False;
    QuickRep_Order.QRShape32.Enabled := False;
    QuickRep_Order.QRLabel9.Enabled := False;
    QuickRep_Order.QRShape33.Enabled := False;
    QuickRep_Order.QRLabel39.Enabled := False;

  end;
  if trim(CO_Datamod.Settings.FieldByName('chief_out').AsString) = '1' then
  begin
    QuickRep_Order.QRShape19.Enabled := True;
    QuickRep_Order.QRLabel14.Enabled := True;
    QuickRep_Order.QRShape32.Enabled := True;
    QuickRep_Order.QRLabel9.Enabled := True;
    QuickRep_Order.QRShape33.Enabled := True;
    QuickRep_Order.QRLabel39.Enabled := True;
  end;

  if trim(CO_Datamod.Settings.FieldByName('accountant').AsString) = '0' then
  begin
    QuickRep_Order.QRShape31.Enabled := False;
    QuickRep_Order.QRLabel16.Enabled := False;
    QuickRep_Order.QRShape30.Enabled := False;
    QuickRep_Order.QRLabel40.Enabled := False;
    QuickRep_Order.QRShape20.Enabled := False;
    QuickRep_Order.QRLabel10.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('accountant').AsString) = '1' then
  begin
    QuickRep_Order.QRShape31.Enabled := True;
    QuickRep_Order.QRLabel16.Enabled := True;
    QuickRep_Order.QRShape30.Enabled := True;
    QuickRep_Order.QRLabel40.Enabled := True;
    QuickRep_Order.QRShape20.Enabled := True;
    QuickRep_Order.QRLabel10.Enabled := True;
  end;

  if trim(CO_Datamod.Settings.FieldByName('operator_out').AsString) = '0' then
  begin
    QuickRep_Order.QRShape35.Enabled := False;
    QuickRep_Order.QRLabel50.Enabled := False;
    QuickRep_Order.QRShape34.Enabled := False;
    QuickRep_Order.QRLabel42.Enabled := False;
    QuickRep_Order.QRShape5.Enabled := False;
    QuickRep_Order.QRLabel4.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('operator_out').AsString) = '1' then
  begin
    QuickRep_Order.QRShape35.Enabled := True;
    QuickRep_Order.QRLabel50.Enabled := True;
    QuickRep_Order.QRShape34.Enabled := True;
    QuickRep_Order.QRLabel42.Enabled := True;
    QuickRep_Order.QRShape5.Enabled := True;
    QuickRep_Order.QRLabel4.Enabled := True;
  end;
  if trim(CO_Datamod.Settings.FieldByName('cashier_out').AsString) = '0' then
  begin
    QuickRep_Order.QRShape21.Enabled := False;
    QuickRep_Order.QRLabel46.Enabled := False;
    QuickRep_Order.QRShape14.Enabled := False;
    QuickRep_Order.QRLabel3.Enabled := False;
    QuickRep_Order.QRShape13.Enabled := False;
    QuickRep_Order.QRLabel52.Enabled := False;
  end;
  if trim(CO_Datamod.Settings.FieldByName('cashier_out').AsString) = '1' then
  begin
    QuickRep_Order.QRShape21.Enabled := True;
    QuickRep_Order.QRLabel46.Enabled := True;
    QuickRep_Order.QRShape14.Enabled := True;
    QuickRep_Order.QRLabel3.Enabled := True;
    QuickRep_Order.QRShape13.Enabled := True;
    QuickRep_Order.QRLabel52.Enabled := True;
  end;

  // ------------------------------------------Modified by for AZNEQ.BANK on 17.08.2006
  if trim(CO_Datamod.Settings.FieldByName('controller_out').AsString) = '1' then
  begin
    QuickRep_Order.QRShape91.Enabled := True;
    QuickRep_Order.QRLabel90.Enabled := True;
    QuickRep_Order.QRShape93.Enabled := True;
    QuickRep_Order.QRLabel92.Enabled := True;
    QuickRep_Order.QRShape95.Enabled := True;
    QuickRep_Order.QRLabel94.Enabled := True;
  end;
  if trim(CO_Datamod.Settings.FieldByName('controller_out').AsString) = '0' then
  begin
    QuickRep_Order.QRShape91.Enabled := False;
    QuickRep_Order.QRLabel90.Enabled := False;
    QuickRep_Order.QRShape93.Enabled := False;
    QuickRep_Order.QRLabel92.Enabled := False;
    QuickRep_Order.QRShape95.Enabled := False;
    QuickRep_Order.QRLabel94.Enabled := False;

  end;
  try
    CO_Datamod.ODSLogo.Open;
    with CO_Datamod.Transactions do
    begin
      TransactionID := FieldByName('ID').AsString;
      Filter := ' ID=' + TransactionID;
      Filtered := True;
      if IOCheck(FieldByName('debitbalance').AsInteger) then
        CreateOrderRpt(False, CO_Datamod.Customers.FieldByName('ID').AsInteger)
      else
        CreateOrderRpt(True, CO_Datamod.Customers.FieldByName('ID').AsInteger)
    end;

  finally
    CO_Datamod.Transactions.GotoBookmark(Pointer(SavePlace));
    CO_Datamod.Transactions.Filtered := False;
    CO_Datamod.ODSLogo.Close;
    CO_Datamod.Settings.Close;
  end;
end;

function TCO_Main.IOCheck(Reference: Integer): Boolean;
begin
  with CO_Datamod.OPCash do
    Result := CallBooleanFunction('CheckOICome', [Reference]);
end;

procedure TCO_Main.GetBankInfo(var BankName, BankInn: String);
begin
  with CO_Datamod.OPCash do
  begin
    CallProcedure('GetBankInfo', [BankName, BankInn]);
    BankName := GetParameter(0);
    BankInn := GetParameter(1);
  end;
end;

procedure TCO_Main.CreateOrderRpt(IOCome: Boolean; CustID: Longint);
var
  BankName, BankInn: String;
  CustName, CustInn: String;
  V: variant;
  withManat, WithCoin: String;
  ManatPosition, i: Word;
  ValuteName, NoManat: String;
begin

  CO_Datamod.dscashinfo.CloseAll;
  CO_Datamod.dscashinfo.SetVariable(':id',
    CO_Datamod.Transactions.FieldByName('id').AsInteger);
  CO_Datamod.dscashinfo.Open;
  CO_Datamod.dscashinfo.Refresh;

  V := Integer(Trunc(CO_Datamod.Transactions.FieldByName('TRANSACTIONDATE')
    .AsDateTime));
  NoManat := '';
  GetBankInfo(BankName, BankInn);
  GetCustomerInfo(CustID, CustName, CustInn);
  // ****************************
  if not IOCome then
    withManat := CurrencyToHR_Azeri
      (Trunc(CO_Datamod.Transactions.FieldByName('creditamount')
      .AsFloat), 0, [0])
  else
    withManat := CurrencyToHR_Azeri
      (Trunc(CO_Datamod.Transactions.FieldByName('debitamount')
      .AsFloat), 0, [0]);

  ManatPosition := POS('manat', withManat);
  if ManatPosition > 0 then
    for i := 1 to ManatPosition - 1 do
      NoManat := NoManat + '' + withManat[i];
  if NoManat = EmptyStr then
    NoManat := '0 ';

  with CO_Datamod do
  begin
    ODSValuteName.Close;
    ODSValuteName.SetVariable('valute',
      Transactions.FieldByName('DEBITCURRENCYID').Value);
    ODSValuteName.Open;
    WithCoin := CurrToStr
      (Frac(StrToFloat(CO_Datamod.Transactions.FieldByName('DEBITAMOUNT')
      .AsString)));
    if WithCoin <> '0' then
    begin
      Delete(WithCoin, 1, 2);
      if Length(WithCoin) < 2 then
        WithCoin := WithCoin + '0'
      else if Length(WithCoin) > 2 then
        Delete(WithCoin, 3, Length(WithCoin));
      ValuteName := (ODSValuteName.FieldByName('Valu_name').AsString + ' ' +
        WithCoin + ' ' + ODSValuteName.FieldByName('valu_bala').AsString);
    end
    else
      ValuteName := (ODSValuteName.FieldByName('Valu_name').AsString);

  end;
  // //*****************************************
  if not IOCome then
  begin
    with QRep_Order do
    begin
      CO_Datamod.ODSCASHINFO.Close;
      CO_Datamod.ODSCASHINFO.SetVariable('id',
        CO_Datamod.Transactions.FieldByName('ID').AsInteger);
      CO_Datamod.ODSCASHINFO.Open;
      CO_Datamod.Transactions.Refresh;
      QRLBankName.Caption := BankName;
      QRLBankName1.Caption := BankName;
      QRLBankName2.Caption := BankName;
      QRLBankInn.Caption := BankInn;
      QRLBankInn1.Caption := BankInn;
      QRLBankInn2.Caption := BankInn;
      QRInn.Caption := CustInn;
      QRInn1.Caption := CustInn;
      QRInn2.Caption := CustInn;
      QRLAmount.Caption := NoManat + '' + ValuteName;
      QRLAmount1.Caption := NoManat + '' + ValuteName;
      QRLAmount2.Caption := NoManat + '' + ValuteName;
      { if  not (co_datamod.dscashinfo.IsEmpty) then
        begin
        QRDBtext18.DataSet:=co_datamod.dscashinfo;
        QRDBtext18.DataField:='issuedby';

        QRDBtext26.DataSet:=co_datamod.dscashinfo;
        QRDBtext26.DataField:='fromwhen';

        QRDBtext27.DataSet:=co_datamod.dscashinfo;
        QRDBtext27.DataField:='seria';

        QRDBtext16.DataSet:=co_datamod.dscashinfo;
        QRDBtext16.DataField:='person_doc';

        QRDBtext28.DataSet:=co_datamod.dscashinfo;
        QRDBtext28.DataField:='docnumber';


        // second copy



        QRDBtext12.DataSet:=co_datamod.dscashinfo;
        QRDBtext12.DataField:='issuedby';

        QRDBtext17.DataSet:=co_datamod.dscashinfo;
        QRDBtext17.DataField:='fromwhen';

        QRDBtext14.DataSet:=co_datamod.dscashinfo;
        QRDBtext14.DataField:='seria';

        QRDBtext13.DataSet:=co_datamod.dscashinfo;
        QRDBtext13.DataField:='person_doc';

        QRDBtext15.DataSet:=co_datamod.dscashinfo;
        QRDBtext15.DataField:='docnumber';


        // third copy



        QRDBtext38.DataSet:=co_datamod.dscashinfo;
        QRDBtext38.DataField:='issuedby';

        QRDBtext32.DataSet:=co_datamod.dscashinfo;
        QRDBtext32.DataField:='fromwhen';

        QRDBtext34.DataSet:=co_datamod.dscashinfo;
        QRDBtext34.DataField:='seria';

        QRDBtext35.DataSet:=co_datamod.dscashinfo;
        QRDBtext35.DataField:='person_doc';

        QRDBtext33.DataSet:=co_datamod.dscashinfo;
        QRDBtext33.DataField:='docnumber';







        end
        else
        begin
        QRDBtext18.DataSet:=co_datamod.Transactions;
        QRDBtext18.DataField:='issued_by';

        QRDBtext27.DataSet:=co_datamod.Transactions;
        QRDBtext27.DataField:='seria';

        QRDBtext16.DataSet:=co_datamod.Transactions;
        QRDBtext16.DataField:='person_doc';

        QRDBtext28.DataSet:=co_datamod.transactions;
        QRDBtext28.DataField:='docnumber';

        QRDBtext26.DataSet:=co_datamod.transactions;
        QRDBtext26.DataField:='fromwhen';

        // second copy



        QRDBtext12.DataSet:=co_datamod.Transactions;
        QRDBtext12.DataField:='issuedby';

        QRDBtext17.DataSet:=co_datamod.Transactions;
        QRDBtext17.DataField:='fromwhen';

        QRDBtext14.DataSet:=co_datamod.Transactions;
        QRDBtext14.DataField:='seria';

        QRDBtext13.DataSet:=co_datamod.Transactions;
        QRDBtext13.DataField:='person_doc';

        QRDBtext15.DataSet:=co_datamod.Transactions;
        QRDBtext15.DataField:='docnumber';




        // third copy



        QRDBtext38.DataSet:=co_datamod.Transactions;
        QRDBtext38.DataField:='issuedby';

        QRDBtext32.DataSet:=co_datamod.Transactions;
        QRDBtext32.DataField:='fromwhen';

        QRDBtext34.DataSet:=co_datamod.Transactions;
        QRDBtext34.DataField:='seria';

        QRDBtext35.DataSet:=co_datamod.Transactions;
        QRDBtext35.DataField:='person_doc';

        QRDBtext33.DataSet:=co_datamod.Transactions;
        QRDBtext33.DataField:='docnumber';





        end; }
      Preview;
    end
  end
  else
  begin
    with QuickRep_Order do
    begin
      CO_Datamod.ODSCASHINFO.Close;
      CO_Datamod.ODSCASHINFO.SetVariable('id',
        CO_Datamod.Transactions.FieldByName('ID').AsInteger);
      CO_Datamod.ODSCASHINFO.Open;
      CO_Datamod.Transactions.Refresh;
      QRLBankInn.Caption := BankInn;
      QRLBankInn1.Caption := BankInn;
      QRLBankInn2.Caption := BankInn;
      QRLBankName.Caption := BankName;
      QRLBankName1.Caption := BankName;
      QRLBankName2.Caption := BankName;
      QRInn1.Caption := CustInn;
      QRInn2.Caption := CustInn;
      QRInn3.Caption := CustInn;
      QRLAmmount.Caption := NoManat + '' + ValuteName;
      QRLAmmount1.Caption := NoManat + '' + ValuteName;
      QRLAmmount2.Caption := NoManat + '' + ValuteName;
      { if  not (co_datamod.dscashinfo.IsEmpty) then
        begin
        QRDBtext31.DataSet:=co_datamod.dscashinfo;
        QRDBtext31.DataField:='issuedby';

        QRDBtext32.DataSet:=co_datamod.dscashinfo;
        QRDBtext32.DataField:='issuedby';

        QRDBtext33.DataSet:=co_datamod.dscashinfo;
        QRDBtext33.DataField:='issuedby';
        end
        else
        begin
        QRDBtext31.DataSet:=co_datamod.ODSTransactionsViewer;
        QRDBtext31.DataField:='issuedby';

        QRDBtext32.DataSet:=co_datamod.ODSTransactionsViewer;
        QRDBtext32.DataField:='issuedby';

        QRDBtext33.DataSet:=co_datamod.ODSTransactionsViewer;
        QRDBtext33.DataField:='issued_by';



        end; }
      Preview;
    end
  end;

end;

procedure TCO_Main.N23Click(Sender: TObject);
begin
  if CO_Datamod.Account.IsEmpty then
  begin
    ShowMessage('Heç bir hesab qeyd olunmayıb');
    Exit;
  end
  else
  begin
    CO_Datamod.CustomerInfoDataSet.Close;
    CO_Datamod.CustomerInfoDataSet.SetVariable('ContractID',
      DBGridAccounts.DataSource.DataSet.FieldByName('ID').AsInteger);
    CO_Datamod.CustomerInfoDataSet.Open;
    CO_Datamod.Templates.Close;
    CO_Datamod.Templates.Open;
    if not Assigned(CO_frmWReport) then
      CO_frmWReport := TCO_frmWReport.Create(Self);
    CO_frmWReportImpl.CO_frmWReport.Showmodal;
  end;
end;

procedure TCO_Main.N22Click(Sender: TObject);
begin
  CO_Datamod.Templates.Open;
  CO_Datamod.Bookmarks.Open;
  CO_Datamod.Fields.Open;
  if not Assigned(CO_BookmarkSetup) then
    CO_BookmarkSetup := TCO_BookmarkSetup.Create(Self);
  BookmarkSetup.CO_BookmarkSetup.Showmodal;
end;

procedure TCO_Main.DBGridCustomersTitleClick(Column: TColumn);
begin
  with CO_Datamod.Customers do
  begin
    SetVariable('Title', Column.FieldName);
    Refresh;
  end;
end;

procedure TCO_Main.N1Click(Sender: TObject);
begin
  if not Assigned(FormOrderInfo) then
    FormOrderInfo := TFormOrderInfo.Create(Self);
  FormOrderInfo.Showmodal;
end;

initialization

TActiveFormFactory.Create(ComServer, TActiveFormControl, TCO_Main,
  Class_CO_Main, 1, '', OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
  tmApartment);

end.

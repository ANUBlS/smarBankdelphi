unit phy_cust_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs, Db,
  ActiveX, AxCtrls, P_Customers_TLB, StdVcl, ActnList, NLSLocalizer,Oracle,Oracledata,
  ImgList, Menus, Mask, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  ToolWin, ComCtrls;
 type
  TOperationMode = (omInsert, omEdit, omCommission);
  TTransactionState = (tsCommit, tsDelete, tsReject);
   const

  tsDelayed       = 1;
  tsCommited      = 2;
  tsRejected      = 3;

  BooleanPrefix = ' AND ';

  resourcestring
   cs_CommitInformation = 'Цмуми ямялиййатлар: %d'+#13+'Тясдиглянмиш ямялиййатлар: %d'+#13+'Тясдиглянмямиш ямялиййатлар: %d';
   cs_RejectInformation = 'Цмуми ямялиййатлар: %d'+#13+'Инкаредилмиш ямялиййатлар: %d'+#13+'Инкаредилмямиш ямялиййатлар: %d';

type
  TP_Customers_Form = class(TActiveForm, IActiveFormX)
    CustomerGB: TGroupBox;
    Panel1: TPanel;
    CustomerSearchBar: TToolBar;
    idedit: TEdit;
    paspedit: TEdit;
    namedit: TEdit;
    dateedit: TMaskEdit;
    CustomerGrid: TDBGrid;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ControlBar2: TControlBar;
    AccountViewSettingsPanel: TPanel;
    AccountsOrderPanel: TPanel;
    Label2: TLabel;
    searchacc: TEdit;
    AccountCurrencyPanel: TPanel;
    Label5: TLabel;
    searchname: TEdit;
    DBEdit1: TDBEdit;
    GroupBox3: TGroupBox;
    GridTransactions: TDBGrid;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    D1: TMenuItem;
    NLSLocalizer1: TNLSLocalizer;
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
    PopupMenu3: TPopupMenu;
    N9: TMenuItem;
    EditSerial: TEdit;
    N13: TMenuItem;
    N14: TMenuItem;
    NLSLocalizer2: TNLSLocalizer;
    N15: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N12: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    procedure N3DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N7DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N2DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N11DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N5DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N6DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure D1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N9DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N12DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N9Click(Sender: TObject);
    procedure searchaccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure searchaccKeyPress(Sender: TObject; var Key: Char);
    procedure ActiveFormCreate(Sender: TObject);
    procedure searchnameKeyPress(Sender: TObject; var Key: Char);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure GridTransactionsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GridTransactionsTitleClick(Column: TColumn);
    procedure N14Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ideditChange(Sender: TObject);
    procedure paspeditChange(Sender: TObject);
    procedure EditSerialChange(Sender: TObject);
    procedure nameditChange(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N13DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure CustomerGridCellClick(Column: TColumn);
    procedure N14DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N15DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N15Click(Sender: TObject);
    procedure CustomerGridDblClick(Sender: TObject);
    procedure EditSerialKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCommitExecute(Sender: TObject);
    procedure ActionStepCommitExecute(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N16DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N17DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N18DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N19DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N20DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N21DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N18Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure CustomerGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dateeditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AccSelKliID;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure paspeditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ideditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSerialKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nameditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FEvents: IActiveFormXEvents;
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
     TransactionState: TTransactionState;
    function CommitTransactions(TransactionIDs: WideString): Longint;
    procedure SBCommit();
     function CommitTransaction(TransactionID: Longint): Longint;
     procedure GetCustomerInfo(CustID: Integer; var CustName: String; var CustInn: String);
      procedure DeleteTransaction(TransactionID: Longint);

    procedure Initialize; override;

  end;

implementation

uses ComObj, ComServ,SBCore,  P_CO_Cust,P_Datamod_Unit,sboapiDataModuleImpl,
  P_CO_Account_Unit, p_CO_Statement_Unit, P_CO_ST_Unit, P_CO_Memorial_Unit,CurrencyToHR_Azeri_Impl,
  P_CO_Interval, P_CO_Cust_Settings, P_Inform_Unit, P_OutForm_Unit,
  P_CO_Out_Unit, P_CO_In_Form, P_Upd_Cust_Form, P_CO_Report_Unit,
  P_AccSettings_Unit, P_AccState_Unit, P_AccTransaction_Unit, P_Interval,
  P_Transaction_Unit, CustInfoFormImpl;

{$R *.DFM}

{ TActiveFormX }

procedure TP_Customers_Form.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ActiveFormXPage); }
end;

procedure TP_Customers_Form.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveFormXEvents;
end;

procedure TP_Customers_Form.Initialize;
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

function TP_Customers_Form.Get_Active: WordBool;
begin
  Result := Active;
end;

function TP_Customers_Form.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TP_Customers_Form.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TP_Customers_Form.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TP_Customers_Form.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TP_Customers_Form.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TP_Customers_Form.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TP_Customers_Form.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TP_Customers_Form.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TP_Customers_Form.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TP_Customers_Form.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TP_Customers_Form.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TP_Customers_Form.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TP_Customers_Form.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TP_Customers_Form.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TP_Customers_Form.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TP_Customers_Form.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TP_Customers_Form.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TP_Customers_Form._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TP_Customers_Form.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TP_Customers_Form.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TP_Customers_Form.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TP_Customers_Form.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TP_Customers_Form.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TP_Customers_Form.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TP_Customers_Form.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TP_Customers_Form.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TP_Customers_Form.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TP_Customers_Form.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TP_Customers_Form.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TP_Customers_Form.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TP_Customers_Form.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TP_Customers_Form.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TP_Customers_Form.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TP_Customers_Form.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TP_Customers_Form.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TP_Customers_Form.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TP_Customers_Form.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TP_Customers_Form.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TP_Customers_Form.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TP_Customers_Form.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TP_Customers_Form.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TP_Customers_Form.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;
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
  end;
end;

procedure TP_Customers_Form.N3DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N7DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N2DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N10DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N11DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N5DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N6DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N8DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.D1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N9DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N12DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TP_Customers_Form.N9Click(Sender: TObject);
begin
  P_CO_Cust_Form :=TP_CO_Cust_Form.Create(self);
  P_CO_Cust_Form.Showmodal;
  P_DataModuleFS.P_Customers.Last;
end;

function TP_Customers_Form.CommitTransaction(TransactionID: Longint): Longint;
begin
 with P_DataModuleFS.SB_TRANSACTION do
  Result :=CallIntegerFunction(
              cs_commit_transaction, [
              'TransactionID', TransactionID,
              'CommitTemp', True]);

end;
function TP_Customers_Form.CommitTransactions(TransactionIDs: WideString): Longint;
begin
 with P_DataModuleFS.SB_TRANSACTION do
  Result :=CallIntegerFunction(
              cs_commit_delayed_transactions, [
              'OverloadIDsStr', TransactionIDs,
              'CommitTemp', True]);
end;
procedure TP_Customers_Form.searchaccKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (paspedit.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    idedit.text :='';
    paspedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';

end;

procedure TP_Customers_Form.AccSelKliID;
begin
with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from fsaccs where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
end;
end;

procedure TP_Customers_Form.searchaccKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key=#13) then exit;
with P_DataModuleFS,account do begin
Close;
SQL.Clear;
SQL.Add('Select * From FSACCS Where accno like '''+searchacc.text+'%'' and rownum=1');
Open;         
first;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

   P_DataModuleFS.p_customers.Locate
   ('id',P_DataModuleFS.Account.Fieldbyname('CUSTID').asinteger,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
            //--------------------KNN-------------------------------------------------------------------------------
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];


 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
 //Modified---TKenan on 22.08.06
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
   if (searchname.text <>'')then
    idedit.text :='';
    paspedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
    Editserial.text :='';
   end;
       end;
end;

procedure TP_Customers_Form.ActiveFormCreate(Sender: TObject);
begin

P_DataModuleFS :=TP_DataModuleFS.Create(Self);

P_InForm :=TP_InForm.Create(Self);
P_OutForm :=TP_OutForm.Create(Self);
P_CO_Report :=TP_CO_Report.Create(Self);
P_DataModuleFS.P_Customers.Open;
CustInfoForm := TCustInfoForm.Create(Self);
//P_CO_Statement_Form :=TP_CO_Statement_Form.create(Self);
end;

procedure TP_Customers_Form.searchnameKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 then
with P_DataModuleFS,account do begin
Close;
SQL.Clear;
SQL.Add('Select * From FSACCS Where upper(accname) like upper(''%'+searchname.text+'%'') and rownum=1');
Open;
first;
 p_customers.Locate
   ('id',P_DataModuleFS.Account.Fieldbyname('CUSTID').asinteger,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
{ with CO_DataMod.customers do begin
       Close;
        SQL.clear;
         SQL.add('select * from customers where id='''+CO_DataMod.account.fieldbyname('accklid').asstring+''' ');
           Open;
           Refresh;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 } //--------------------KNN-------------------------------------------------------------------------------
 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;
  //--------------------KNN-------------------------------------------------------------------------------
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  if (paspedit.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchacc.text <>'')then
          idedit.text :='';
          paspedit.text :='';
         dateedit.Text :='';
        searchacc.text :='';
      namedit.text :='';
        end;
         end;
          end;



procedure TP_Customers_Form.N10Click(Sender: TObject);
begin
If  P_DataModuleFS.Account.IsEmpty then  begin
ShowMessage('Щеч бир щесаб гейд олунмайыб');
Exit;
end
else  begin
   P_CO_St :=TP_CO_St.Create(self);
     P_CO_St.Showmodal;

        end;
         end;

procedure TP_Customers_Form.N11Click(Sender: TObject);

 var
  AStartDate, AEndDate: TDateTime;
begin
P_CO_MemorialForm :=TP_CO_MemorialForm.Create(self);
P_CO_IntervalForm :=TP_CO_IntervalForm.Create(self);
  

If  P_DataModuleFS.Account.IsEmpty then  begin
ShowMessage('Щеч бир щесаб гейд олунмайыб');
Exit;
end
else  begin
  with P_CO_IntervalForm do
 begin
   StartDateEdit.DateTime :=P_DataModuleFS.Sysdat.FieldByName('tek_dat').AsDateTime;
   EndDateEdit.DateTime :=StartDateEdit.DateTime;

   if ShowModal = mrOK then
   begin
    AStartDate :=StartDateEdit.DateTime;
    AEndDate :=EndDateEdit.DateTime;

    with P_CO_MemorialForm do
    begin
     OpenDataControls(AStartDate, AEndDate);
     ShowModal;
    end;

   end;


end;

end;
        end;//--Modified by TKenan on 03.12.2006
procedure TP_Customers_Form.GridTransactionsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

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


procedure TP_Customers_Form.GridTransactionsTitleClick(Column: TColumn);
var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with P_DataModuleFS.Transactions do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;
end;
          

procedure TP_Customers_Form.N14Click(Sender: TObject);
const
table_name='Customers_Physical';
var
v_id :integer;
v_name :string;
begin
If  P_DataModuleFS.P_Customers.IsEmpty then  begin
ShowMessage('Щеч бир мцштяри гейд олунмайыб');
Exit;
end
else begin
with P_DataModuleFS do begin
v_id:=P_Customers.FieldByName('Id').AsInteger;
v_name :=P_Customers.Fieldbyname('cust_name').asstring;
 if  MessageDlg(Format('%s адлы мцштяри силинсин?',[v_name]),mtConfirmation,mbYesNoCancel,0)=mrYes then
           physical_customers.CallProcedure('del_fromTable',[table_name,v_id]);
           P_Customers.Close;
           P_Customers.Open;
  end;{if}
 end;{with}end;



procedure TP_Customers_Form.N2Click(Sender: TObject);
begin
  If  P_DataModuleFS.Account.IsEmpty then  begin
    ShowMessage('Щеч бир щесаб гейд олунмайыб');
    Exit;
  end else  begin
    if P_DataModuleFS.Account.FieldByName('TYPEID').AsInteger<>1 then begin
      P_CO_OUt :=TP_CO_OUt.Create(self);
      P_CO_OUt.Showmodal;
      P_CO_OUt.Free;
    end else begin
      P_CO_IN :=TP_CO_IN.Create(self);
      P_CO_IN.Showmodal;
      P_CO_IN.Free;
    end;
  end;
end;

procedure TP_Customers_Form.N1Click(Sender: TObject);
begin
  If  P_DataModuleFS.Account.IsEmpty then  begin
    ShowMessage('Щеч бир щесаб гейд олунмайыб');
    Exit;
  end else  begin
    if P_DataModuleFS.Account.FieldByName('TYPEID').AsInteger=1 then begin
      P_CO_OUt :=TP_CO_OUt.Create(self);
      P_CO_OUt.Showmodal;
      P_CO_OUt.Free;
    end else begin
      P_CO_IN :=TP_CO_IN.Create(self);
      P_CO_IN.Showmodal;
      P_CO_IN.Free;
    end;
  end;
end;


procedure TP_Customers_Form.ideditChange(Sender: TObject);
begin
P_DataModuleFS.Transactions.Close;
P_DataModuleFS.Transactions.Open;


 if idedit.Text<>'' then
   P_DataModuleFS.p_customers.Locate
   ('id',idedit.Text,[loCaseInsensitive, loPartialKey]);
CustomerGrid.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

 with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
  //--------------------KNN-------------------------------------------------------------------------------

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;

    //--------------------KNN-------------------------------------------------------------------------------

  if (idedit.text<>'') then
    searchacc.text :='';
    paspedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
    editserial.text :='';

     end; end;

        end;
         

procedure TP_Customers_Form.paspeditChange(Sender: TObject);
begin
P_DataModuleFS.Transactions.Close;
P_DataModuleFS.Transactions.Open;
 if paspedit.Text<>'' then
   P_DataModuleFS.p_customers.Locate
   ('PASSP_NUMBER',paspedit.Text,[loCaseInsensitive, loPartialKey]);
CustomerGrid.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

 with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
 //--------------------KNN------------------------------------------------

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
//--------------------KNN-------------------------------------------------
    if (paspedit.text<>'') then
    idedit.text :='';
    searchacc.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
    Editserial.text :='';
//--------------------KNN-------------------------------------------------
end;
   end;
end;
procedure TP_Customers_Form.EditSerialChange(Sender: TObject);
begin
P_DataModuleFS.Transactions.Close;
P_DataModuleFS.Transactions.Open;
if EditSerial.Text<>'' then
   P_DataModuleFS.p_customers.Locate
   ('passport',EditSerial.Text,[loCaseInsensitive, loPartialKey]);
CustomerGrid.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];


with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
 //--------------------KNN------------------------------------------------

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
//--------------------KNN-------------------------------------------------
  if (editserial.text<>'')then
    idedit.text :='';
    searchacc.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
    paspedit.text :='';
//--------------------KNN-------------------------------------------------
end;
   end;
end;

procedure TP_Customers_Form.nameditChange(Sender: TObject);
begin
P_DataModuleFS.Transactions.Close;
P_DataModuleFS.Transactions.Open;
 if namedit.Text<>'' then
   P_DataModuleFS.p_customers.Locate
   ('cust_name',namedit.Text,[loCaseInsensitive, loPartialKey]);
CustomerGrid.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
 //--------------------KNN------------------------------------------------

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
//--------------------KNN-------------------------------------------------
  if (namedit.text<>'')then
    idedit.text :='';
    searchacc.text :='';
    dateedit.Text :='';
    searchname.text :='';
    editserial.text :='';
    paspedit.text :='';
//--------------------KNN-------------------------------------------------
end;
   end;  end;



procedure TP_Customers_Form.N13Click(Sender: TObject);
begin
P_DataModuleFS.P_Customers.Close;
P_DataModuleFS.P_Customers.Open;
end;

procedure TP_Customers_Form.N13DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.CustomerGridCellClick(Column: TColumn);
begin
idedit.text :='';
   P_DataModuleFS.p_customers.Locate
   ('id',idedit.Text,[loCaseInsensitive, loPartialKey]);
CustomerGrid.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

 with P_DataModuleFS.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where custid='''+P_DataModuleFS.p_customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
  //--------------------KNN-------------------------------------------------------------------------------

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;

    //--------------------KNN-------------------------------------------------------------------------------

  if (paspedit.text<>'') or (searchacc.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    searchacc.text :='';
    paspedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
     end; end;


end;

procedure TP_Customers_Form.SBCommit();
begin
 sboapiDataModule.SBSession.Commit
end;

procedure TP_Customers_Form.N14DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N15DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N15Click(Sender: TObject);
begin
If  P_DataModuleFS.P_Customers.IsEmpty then  begin
ShowMessage('Щеч бир мцштяри гейд олунмайыб');
Exit;
end
else begin
P_Upd_Cust :=TP_Upd_Cust.Create(Self);
P_Upd_Cust.Showmodal;
end;
         end;
procedure TP_Customers_Form.CustomerGridDblClick(Sender: TObject);
begin
P_Upd_Cust :=TP_Upd_Cust.Create(Self);
P_Upd_Cust.Showmodal;
end;

procedure TP_Customers_Form.EditSerialKeyPress(Sender: TObject;
  var Key: Char);
begin
     key := UpCase(key);
end;

procedure TP_Customers_Form.ActionCommitExecute(Sender: TObject);

var
   i: Integer;
   IDs: WideString;
   Status, TrCount: Word;
begin

 IDs :='';
 TrCount :=0;
 with GridTransactions, SelectedRows, DataSource.DataSet do
  if Count = 0 then
   begin
    Inc(TrCount);
    IDs := FieldByName('ID').AsString;
   end
  else
  begin
   DisableControls;
   try
    for i :=0 to Count -1 do
    begin
     GotoBookmark(TBookmark(Items[i]));
     Status :=FieldByname('Status').AsInteger;
     if Status in [tsDelayed, tsRejected] then
     begin
      Inc(TrCount);
      IDs :=IDs + ',' + FieldByName('ID').AsString;
     end;
    end;
   System.Delete(IDs, 1, 1);
   finally
    EnableControls;
   end;
  end;
  if MessageDlg(Format('%d сайда ямялиййат тясдиглянсинми?', [TrCount]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
  with P_DataModuleFS do
  begin
   CommitTransactions(IDs);
   SBCommit();
  
  end;
end;
 

procedure TP_Customers_Form.ActionStepCommitExecute(Sender: TObject);

var
   i: Integer;
   ID: Longint;
   WillRefresh: Boolean;
   Status, CommitedCount, ErrorCount: Word;
   LastErrorMessage: String;
   qaccid, qtrid: Integer;
begin
If  P_DataModuleFS.Transactions.IsEmpty then  begin
ShowMessage('Щеч бир ямялиййат гейд олунмайыб');
Exit;
end
else  begin

 CommitedCount :=0;
 ErrorCount :=0;
 WillRefresh :=False;
 begin


 with P_DataModuleFS, GridTransactions, SelectedRows, DataSource.DataSet do
      if P_DataModuleFS.Transactions.FieldByName('Status').asinteger=2 then
ShowMessage('Ямялиййат артыг тясдигляниб!')
else begin

  if MessageDlg('Ямялиййатлар тясдиглянсинми?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
  begin
   DisableControls;
   try
    Application.ProcessMessages;
    if Count = 0 then CurrentRowSelected :=True;
    for i :=0 to Count -1 do
    try
     GotoBookmark(TBookmark(Items[i]));
     Status :=FieldByname('Status').AsInteger;
     if Status in [tsDelayed, tsRejected] then
     begin
      ID := FieldByName('ID').AsInteger;
      CommitTransaction(ID);
      WillRefresh :=True;
      Inc(CommitedCount);
      SBCommit();
     end;
    except
     on E: Exception do
      begin
       LastErrorMessage :=E.Message;
       Inc(ErrorCount);
       Continue;
      end;
    end;
   finally
    if ErrorCount > 0 then
     if ErrorCount = 1 then
      MessageDlg(LastErrorMessage, mtConfirmation, [mbOk], 0)
     else
      MessageDlg(Format(cs_CommitInformation, [CommitedCount + ErrorCount, CommitedCount, ErrorCount]), mtConfirmation, [mbOk], 0);

    EnableControls;

    if WillRefresh then
    begin
     TransactionState :=tsCommit;
    qaccid := P_DataModuleFS.Account.fieldbyname('ID').AsInteger;
    qtrid := P_DataModuleFS.TransactionsID.AsInteger;
    P_DataModuleFS.Transactions.Close;
    P_DataModuleFS.Transactions.Open;
    P_DataModuleFS.Account.Close;
    P_DataModuleFS.Account.Open;
    P_DataModuleFS.Account.Locate('id', qaccid, []);
    P_DataModuleFS.Transactions.Locate('id', qtrid, []);
    end;

   end;
  end;
end;  end;end;     end;
 procedure TP_Customers_Form.GetCustomerInfo(CustID: Integer; var CustName: String; var CustInn: String);
begin
   with  P_DataModuleFS.OPCash  do
   begin
     CallProcedure('GetCustomerInfo',[CustID,'','']);
     CustInn  :=GetParameter(1);
     CustName :=GetParameter(2);
   end;  end;
procedure TP_Customers_Form.N6Click(Sender: TObject);
 var
    ValuteName,   withManat, NoManat,WithCoin:string;
       ManatPosition, i: integer;
        CustName, CustInn: string;
  TransactionID: string;
begin
 { CO_DataMod.Transactions.open;
  id :=CO_DataMod.Transactions.FieldByName('id').asstring;
   try
     with CO_Report,CO_DataMod.Transactions do
       begin
         Filter:=' id= '+id;
           Filtered :=true;
               Preview;   }
If  P_DataModuleFS.Transactions.IsEmpty then  begin
ShowMessage('Щеч бир ямялиййат гейд олунмайыб');
Exit;
end
else  begin
  NoManat :='';
 try
    with   P_DataModuleFS.Transactions do
   begin
    GetCustomerInfo(FieldByName('creditid').AsInteger,CustName,CustInn);
    TransactionID :=FieldByName('ID').AsString;
    Filter :=' ID='+TransactionID;
    Filtered :=True;
     end;
  with P_DataModuleFS, ODSValuteName do
    begin
     Close;
     SetVariable('valute',Transactions.FieldByName('debitcurrencyid').Value);
     ODSValuteName.Open;
     ValuteName :=AnsiLowerCase(FieldByname('Valu_name').Asstring);
    end;

   WithManat :=CurrencyToHR_Azeri(Trunc(P_DataModuleFS.Transactions.FieldByName('creditamount').AsFloat),0,[0]);

    ManatPosition :=POS('манат',WithManat);
   if ManatPosition>0 then
    for i:=1 to ManatPosition-1 do
     NoManat :=NoManat + WithManat[i] ;

   WithCoin :=FloatToStr(Frac(StrToFloat(P_DataModuleFS.Transactions.FieldByName('creditamount').Asstring)));
   if WithCoin<>'0' then begin
    Delete(WithCoin,1,2);
    if length(WithCoin) < 2 then WithCoin :=WithCoin+'0'
     else
     if length(WithCoin) > 2 then Delete(WithCoin,3,length(WithCoin));
    WithCoin :=WithCoin+' '+P_DataModuleFS.ODSValuteName. FieldByName('valu_bala').AsString;
   end {if WithCoin<>'0'}
   else WithCoin:='';

  ValuteName :=AnsiLowerCase(P_DataModuleFS.ODSValuteName.FieldByname('Valu_name').Asstring+'  '+WithCoin);

    if NoManat=EmptyStr then NoManat:='0 ';

    P_CO_Report.ODSBank.Open;
    P_CO_Report.QRAMMOUNT1.Caption :=NoManat + ValuteName;
    P_CO_Report.QRAMMOUNT2.Caption :=NoManat + ValuteName;
    P_CO_Report.Preview;
    finally
     with   P_DataModuleFS.Transactions do
      Filtered :=false;
    P_CO_Report.ODSBank.Close;

  end;
    end;  end;

procedure  TP_Customers_Form.N16DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.DBGrid1CellClick(Column: TColumn);
begin

 with P_DataModuleFS.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from transactionsp where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;


end;
     end;

procedure TP_Customers_Form.N17DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N19Click(Sender: TObject);
begin

P_AccState :=TP_AccState.Create(Self);
with P_DataModuleFS.Account do
 if IsEmpty then
    begin
     ShowMessage('Щеч бир щесаб гейд олунмайыб!');
     Exit;
    end
  else begin
 with P_AccState   do
  ShowModal;

end;

end;

procedure TP_Customers_Form.N20Click(Sender: TObject);
var
  AStartDate, AEndDate: TDateTime;
begin

FormAccTransaction :=TFormAccTransaction.Create(Self);
FormInterval :=TFormInterval.Create(Self);
  with P_DataModuleFS.Account do
 if IsEmpty then
    begin
     ShowMessage('Щеч бир щесаб гейд олунмайыб!');
     Exit;
    end
  else begin

  P_DataModuleFS.Sysdat.Open;
 with FormInterval do
 begin
   StartDateEdit.DateTime :=P_DataModuleFS.Sysdat.FieldByName('tek_dat').AsDateTime;
   EndDateEdit.DateTime :=StartDateEdit.DateTime;

   if ShowModal = mrOK then
   begin
    AStartDate :=StartDateEdit.DateTime;
    AEndDate :=EndDateEdit.DateTime;

    with FormAccTransaction do
    begin
     OpenDataControls(AStartDate, AEndDate);
     ShowModal;
    end;

   end;
 end;  

end;
       end;
procedure TP_Customers_Form.N21Click(Sender: TObject);
begin
P_AccSettings :=TP_AccSettings.Create(Self);
P_AccSettings.ShowModal;
         end;

procedure TP_Customers_Form.N18DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N19DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N20DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N21DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TP_Customers_Form.N18Click(Sender: TObject);
begin
  begin
P_CO_Account_Form :=TP_CO_Account_Form.Create(Self);
P_CO_Account_Form.Showmodal;

     end; end;
procedure TP_Customers_Form.N16Click(Sender: TObject);
begin
P_Transaction :=TP_Transaction.Create(Self);
P_Transaction.ShowModal;
GridTransactions.DataSource.DataSet.Refresh;
end;
 procedure TP_Customers_Form.DeleteTransaction(TransactionID: Longint);
begin
 with P_DataModuleFS.SB_TRANSACTION do
  CallProcedure(cs_del_transaction, ['TransactionID', TransactionID]);
end;

procedure TP_Customers_Form.N17Click(Sender: TObject);

var
   Index :Integer;
   WaitNextConfirm, WillRefresh: Boolean;
   TransactionID :Integer;
   qaccid, qtrid: Integer;
begin
  WaitNextConfirm := True;
  with  GridTransactions, SelectedRows, DataSource.DataSet, P_DataModuleFS do
  try
    if Count = 0 then CurrentRowSelected := True;
    for  Index :=0 to  Count - 1 do
    begin
      GotoBookmark(Pointer(Items[Index]));
      TransactionID :=FieldbyName('ID').AsInteger;

      if  WaitNextConfirm  then
      case MessageDlg(
        Format('Ямялиййат #%d силинсинми?',[TransactionID])
       ,mtConfirmation
       ,[mbYes, mbNo ,mbCancel ,mbYesToAll]
       ,0
       )   of
        mrNo       : Continue;
        mrCancel   : Break;
        mrYesToAll :
          if MessageDlg(Format('%d  сайда ямялиййат силинсинми?', [Count - Index]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
           WaitNextConfirm :=False
          else
           Continue; 
      end;
       Application.ProcessMessages;
      DeleteTransaction(TransactionID);
      WillRefresh :=True;
      SBCommit;
      TransactionState :=tsDelete;
    end;
  finally

end;
    qaccid := P_DataModuleFS.Account.fieldbyname('ID').AsInteger;
    qtrid := P_DataModuleFS.TransactionsID.AsInteger;
    P_DataModuleFS.Transactions.Close;
    P_DataModuleFS.Transactions.Open;
    P_DataModuleFS.Account.Close;
    P_DataModuleFS.Account.Open;
    P_DataModuleFS.Account.Locate('id', qaccid, []);
    P_DataModuleFS.Transactions.Locate('id', qtrid, []);

  end;
procedure TP_Customers_Form.CustomerGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
    CustomerGridCellClick(CustomerGrid.Columns[0]);
end;

procedure TP_Customers_Form.dateeditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    with P_DataModuleFS, P_Customers do begin
       Locate('OPENDATE',Variant((Sender as TMaskEdit).Text),[]);
       AccSelKliID;
       TransactionsData.DataSet.Close;
    end;
end;

procedure TP_Customers_Form.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  if key=vk_return then
    DBGrid1CellClick(DBGrid1.Columns[0]);
end;

procedure TP_Customers_Form.paspeditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    paspeditchange(Sender);
end;

procedure TP_Customers_Form.ideditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    ideditchange(Sender);
end;

procedure TP_Customers_Form.EditSerialKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    EditSerialChange(Sender);
end;

procedure TP_Customers_Form.nameditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    nameditchange(Sender);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TP_Customers_Form,
    Class_P_Customers_Form,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

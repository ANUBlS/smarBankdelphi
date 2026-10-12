                                   {------------------------------------}
                                   {(c) Smart Systems Technology Ltd.   }
                                   {            2006                    }
                                   {          Customer's Operations     }
                                   {                   Kenan MEMMEDOV   }
                                   {------------------------------------}


unit customers_operation_impl;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ActiveX, AxCtrls, customer_operations_TLB, StdVcl, StdCtrls, SearchCombo,
  ExtCtrls, ComCtrls, Grids, DBGrids, ToolWin, Buttons, Db, OracleData,
  ImgList, Menus, ActnList, Mask, DBCtrls, NLSLocalizer;
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
  TAccOrder = (aotAccNo, aotAccName, aotAccCurrency, aotAccOpenDate, aotNoOrder);

  TCO_Main = class(TActiveForm, IActiveFormX)
    GroupBox3: TGroupBox;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList: TImageList;
    GridTransactions: TDBGrid;
    N4: TMenuItem;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    NLSLocalizer1: TNLSLocalizer;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CustomerGB: TGroupBox;
    Panel1: TPanel;
    CustomerSearchBar: TToolBar;
    idedit: TEdit;
    innedit: TEdit;
    namedit: TEdit;
    dateedit: TEdit;
    CustomerGrid: TDBGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    DBGrid2: TDBGrid;
    PopupMenu3: TPopupMenu;
    N9: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    GroupBox1: TGroupBox;
    noedit: TEdit;
    passpedit: TEdit;
    nameedit: TEdit;
    datedit: TEdit;
    ControlBar2: TControlBar;
    AccountViewSettingsPanel: TPanel;
    AccountsOrderPanel: TPanel;
    Label2: TLabel;
    searchacc: TEdit;
    AccountCurrencyPanel: TPanel;
    Label5: TLabel;
    searchname: TEdit;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    N14: TMenuItem;
    N3: TMenuItem;
    N15: TMenuItem;
    procedure AddExecute(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure CustomerIDSearchEditExit(Sender: TObject);
    procedure inneditChange(Sender: TObject);
    procedure N12DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N15DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N16DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N13DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N14DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N7DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N10DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N11DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N8DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N9DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure noeditChange(Sender: TObject);
    procedure nameditChange(Sender: TObject);
    procedure ideditChange(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N2DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure searchClick(Sender: TObject);
    procedure searchaccKeyPress(Sender: TObject; var Key: Char);
    procedure GridTransactionsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure searchaccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure searchnameKeyPress(Sender: TObject; var Key: Char);
    procedure N3DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N5DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure GridTransactionsTitleClick(Column: TColumn);
    procedure N6Click(Sender: TObject);
    procedure N6DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure N8Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure ActionStepCommitExecute(Sender: TObject);
    procedure ActionCommitExecute(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure passpeditChange(Sender: TObject);
    procedure nameeditChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
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
    procedure GetCustomerInfo(CustID: Integer; var CustName: String; var CustInn: String);
        procedure Focus;
     function ExtractMonth(DateTime: TDateTime; DecimalSymbol: string): string;
     function CommitTransaction(TransactionID: Longint): Longint;
     procedure SBCommit();
    procedure InitData;
    function CommitTransactions(TransactionIDs: WideString): Longint;

   // procedure InitProperties;
    procedure GotoTransaction(ID: Longint);
  //  procedure MouseWheelHandler(var Message: TMessage); override;

  end;  var
       OperationIDs, CurrencyIDs: TStringList;





implementation
uses    ComObj, ComServ,
        SBCore, SBCustomer, sboapiDataModuleImpl,
  UnitFrmZoom, co_properties_unit, CO_datamod_impl, co_commission_unit,
  CO_TransactionPropertiesImpl, co_statement_impl, co_st_check, co_memorial,
  CO_Interval_unit, InFormUnit, CO_transact_unit, OutForm_Unit, CO_In_Unit,
  CO_Out_Unit, TransactionDataModuleUnit, FormAcc_Unit,CurrencyToHR_Azeri_Impl, CO_reportUnit,
  CO_Customers, CO_Settings_Unit, CO_Upd_Cust_Unit;

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
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCO_Main.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCO_Main.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCO_Main.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCO_Main.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCO_Main.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCO_Main.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCO_Main.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
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

procedure TCO_Main.AddExecute(Sender: TObject);
begin
try
CO_PropertiesForm :=TCO_PropertiesForm.Create(self);

  CO_PropertiesForm.Showmodal;
  finally
  CO_PropertiesForm.Release;

end;
end;


function TCO_Main.FlagEnabled(Flag: Word): Boolean;

  procedure CheckRow;
  begin
    Result := GridTransactions.DataSource.DataSet.FieldByName('Status').AsInteger = Flag;
  end;

var
  SavedPos: TBookmark;
  Index: Integer;

begin
  Result :=False;
  with GridTransactions, SelectedRows, DataSource.DataSet do
  begin
   if (Count = 1) or (Count = 0) then
     CheckRow
   else
   begin
    DisableControls;
    SavedPos := GetBookmark;
    try
      for Index := 0 to Count -1 do
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
  for i :=0 to ComponentCount -1 do
  if (Components[i] is TDataSet) then
   if (Components[i] as TDataSet).Tag = 1 then
   try
     (Components[i] as TDataSet).Open;
   except
     raise Exception.Create(Format(c_err_message, [(Components[i] as TDataSet).Name]));
   end;
end;


procedure TCO_Main.ActiveFormCreate(Sender: TObject);
begin
  CO_datamod :=TCO_DataMod.Create(Self);
  Co_PropertiesForm := TCo_PropertiesForm.Create(Self);
  CO_Report :=TCO_Report.Create(Self);
  CO_DataMod.Customers.oPEN;
  // provdate.date :=CO_DataMod.Sysdat.fieldbyname('tek_dat').asdatetime;
   with CO_DataMod do
 begin
  CurrentDate :=Sysdat.FieldByName('tek_dat').AsDateTime;

 TransactionState :=tsDelete;
  end;
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

procedure TCO_Main.SetCurrentDate(Value: TDateTime);
begin
  FCurrentDate := Value;
  //DTPCurrentDate.DateTime := Int(Value);
end;

function TCO_Main.ExtractMonth(DateTime: TDateTime; DecimalSymbol: string): string;
 const
    Months: array [1..12] of string =(
     'йанвар','феврал','март','апрел','май','ийун','ийул','август','сентйабр','октйабр','нойабр','декабр'
      );
var
  Year, Month, Day : Word;
begin
  DecodeDate(DateTime, Year, Month, Day);
  Result :=IntToStr(Day) + DecimalSymbol + Months[month] + DecimalSymbol + IntToStr(year);
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
 if GridTransactions.CanFocus then
  GridTransactions.SetFocus;
end;
procedure TCO_Main.inneditChange(Sender: TObject);
begin
CO_DataMod.Transactions.Close;
CO_DataMod.Transactions.Open;
 if idedit.Text<>'' then
   CO_DataMod.customers.Locate
   ('id',idedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 with CO_DataMod.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where ACCKLID='''+CO_DataMod.customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
 //--------------------KNN------------------------------------------------

 with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
//--------------------KNN-------------------------------------------------
    if (searchacc.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    idedit.text :='';
    searchacc.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
//--------------------KNN-------------------------------------------------
end;
   end;  end;
procedure TCO_Main.nameditChange(Sender: TObject);
begin
CO_DataMod.Transactions.Close;
CO_DataMod.Transactions.Open;
 if idedit.Text<>'' then
   CO_DataMod.customers.Locate
   ('id',idedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 with CO_DataMod.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where ACCKLID='''+CO_DataMod.customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
 //--------------------KNN-------------------------------------------------------------------------------
 with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
            Refresh;
//--------------------KNN-------------------------------------------------------------------------------

 if (searchacc.text<>'') or (idedit.text<>'')or (innedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    idedit.text :='';
      searchacc.text :='';
       dateedit.Text :='';
        searchname.text :='';
         innedit.text :='';
          end;
           end;
            end;
               
procedure TCO_Main.N12DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N15DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N16DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N13DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N14DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TCO_Main.N7DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N10DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N11DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N8DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.N9DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.DBGrid1TitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with CO_DataMod.Account do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;  end;


procedure TCO_Main.DBGrid1CellClick(Column: TColumn);
begin
with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn  where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
               
Searchacc.Text :=CO_Datamod.Account.fieldbyname('accno').asstring;
Searchname.Text :=CO_Datamod.Account.fieldbyname('accname').asstring;
//Idedit.text :=CO_DataMod.Customers.fieldbyname('id').Asstring;
end;
                 end;
procedure TCO_Main.N10Click(Sender: TObject);
begin
try
   CO_St_Form :=TCO_St_Form.Create(self);
     CO_St_Form.Showmodal;
       finally
        CO_St_Form.Release;
        end;
          end;

procedure TCO_Main.N11Click(Sender: TObject);

 var
  AStartDate, AEndDate: TDateTime;
begin
CO_MemorialForm :=TCO_MemorialForm.Create(self);
FormInterval :=TFormInterval.Create(self);
  


  with FormInterval do
 begin
   StartDateEdit.DateTime :=CO_Datamod.Sysdat.FieldByName('tek_dat').AsDateTime;
   EndDateEdit.DateTime :=StartDateEdit.DateTime;

   if ShowModal = mrOK then
   begin
    AStartDate :=StartDateEdit.DateTime;
    AEndDate :=EndDateEdit.DateTime;

    with CO_MemorialForm do
    begin
     OpenDataControls(AStartDate, AEndDate);
     ShowModal;
    end;

   end;


end;
    end;
procedure TCO_Main.noeditChange(Sender: TObject);
begin


 if noedit.Text<>'' then
   CO_DataMod.physical_customers.Locate
   ('id',noedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

    //--------------------KNN-------------------------------------------------------------------------------

 with CO_DataMod.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where ACCKLID in (select id from customers_physical where id='''+noedit.text+''') ');
           Open;
           Refresh;
  if (noedit.text<>'')  then
    passpedit.text :='';
    nameedit.text :='';
    datedit.Text :='';
 
     end;

               end;


procedure TCO_Main.ideditChange(Sender: TObject);
begin
CO_DataMod.Transactions.Close;
CO_DataMod.Transactions.Open;


{with CO_DataMod.customers do begin
Close;
SQL.Clear;
SQL.Add('Select * From customers Where id='''+idedit.text+'''');
Open;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 }

 if idedit.Text<>'' then
   CO_DataMod.customers.Locate
   ('id',idedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

 with CO_DataMod.Account do begin
       Close;
       SQL.clear;
         SQL.add('select * from FSACCS where ACCKLID='''+CO_DataMod.customers.fieldbyname('ID').asstring+''' ');
           Open;
           Refresh;
  //--------------------KNN-------------------------------------------------------------------------------

 with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;

    //--------------------KNN-------------------------------------------------------------------------------

  if (innedit.text<>'') or (searchacc.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    searchacc.text :='';
    innedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
     end; end;

        end;


procedure TCO_Main.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TCO_Main.N2DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin

MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TCO_Main.N2Click(Sender: TObject);
begin

try
CO_In_Form :=TCO_In_Form.Create(self);
 CO_In_Form.Showmodal;
  finally
  CO_In_Form.Release;
  end;

  end;



procedure TCO_Main.N1Click(Sender: TObject);
begin
try
CO_Out_Form :=TCO_Out_Form.Create(self);
 CO_Out_Form.Showmodal;
  finally
  CO_Out_Form.Release;

 end;
     end;
procedure TCO_Main.searchClick(Sender: TObject);

begin
showmessage('knn');
end;

procedure TCO_Main.searchaccKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
with CO_DataMod.account do begin
Close;
SQL.Clear;
SQL.Add('Select * From FSACCS Where accno='''+searchacc.text+'''');
Open;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

   CO_DataMod.customers.Locate
   ('id',CO_DataMod.Account.Fieldbyname('ACCKLID').asinteger,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
            //--------------------KNN-------------------------------------------------------------------------------
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];


 with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+''' ');
           Open;
           Refresh;
 //Modified---TKenan on 22.08.06
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
   if (innedit.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    idedit.text :='';
    innedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
   end;
       end; end;

       

procedure TCO_Main.GridTransactionsDrawColumnCell(Sender: TObject;
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

procedure TCO_Main.searchaccKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (innedit.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    idedit.text :='';
    innedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';
end;

procedure TCO_Main.searchnameKeyPress(Sender: TObject; var Key: Char);
begin

with CO_DataMod.account do begin
Close;
SQL.Clear;
SQL.Add('Select * From FSACCS Where accname='''+searchname.text+'''');
Open;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
 with CO_DataMod.customers do begin
       Close;
        SQL.clear;
         SQL.add('select * from customers where id='''+CO_DataMod.account.fieldbyname('accklid').asstring+''' ');
           Open;
           Refresh;
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  //--------------------KNN-------------------------------------------------------------------------------
 with CO_DataMod.Transactions do begin
       Close;
        SQL.clear;
         SQL.add('select * from trans_knn where debitid = '''+dbedit1.text+''' or creditid = '''+dbedit1.text+'''  ');
           Open;
           Refresh;
  //--------------------KNN-------------------------------------------------------------------------------
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
  if (innedit.text<>'') or (idedit.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchacc.text <>'')then
          idedit.text :='';
          innedit.text :='';
         dateedit.Text :='';
        searchacc.text :='';
      namedit.text :='';
        end;
         end;
          end;

end;


procedure TCO_Main.N3DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure TCO_Main.GetCustomerInfo(CustID: Integer; var CustName: String; var CustInn: String);
begin
   with  CO_DataMod.OPCash  do
   begin
     CallProcedure('GetCustomerInfo',[CustID,'','']);
     CustInn  :=GetParameter(1);
     CustName :=GetParameter(2);
   end;
end;



procedure TCO_Main.N5DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure TCO_Main.GridTransactionsTitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with CO_DataMod.Transactions do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;
end;



procedure TCO_Main.N6Click(Sender: TObject);

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
  NoManat :='';
 try
    with   CO_DataMod.Transactions do
   begin
    GetCustomerInfo(FieldByName('creditid').AsInteger,CustName,CustInn);
    TransactionID :=FieldByName('ID').AsString;
    Filter :=' ID='+TransactionID;
    Filtered :=True;
     end;
  with CO_DataMod, ODSValuteName do
    begin
     Close;
     SetVariable('valute',Transactions.FieldByName('debitcurrencyid').Value);
     ODSValuteName.Open;
     ValuteName :=AnsiLowerCase(FieldByname('Valu_name').Asstring);
    end;

   WithManat :=CurrencyToHR_Azeri(Trunc(CO_DataMod.Transactions.FieldByName('creditamount').AsFloat),0,[0]);

    ManatPosition :=POS('манат',WithManat);
   if ManatPosition>0 then
    for i:=1 to ManatPosition-1 do
     NoManat :=NoManat + WithManat[i] ;

   WithCoin :=FloatToStr(Frac(StrToFloat(CO_DataMod.Transactions.FieldByName('creditamount').Asstring)));
   if WithCoin<>'0' then begin
    Delete(WithCoin,1,2);
    if length(WithCoin) < 2 then WithCoin :=WithCoin+'0'
     else
     if length(WithCoin) > 2 then Delete(WithCoin,3,length(WithCoin));
    WithCoin :=WithCoin+' '+CO_DataMod.ODSValuteName. FieldByName('valu_bala').AsString;
   end {if WithCoin<>'0'}
   else WithCoin:='';

  ValuteName :=AnsiLowerCase(CO_DataMod.ODSValuteName.FieldByname('Valu_name').Asstring+'  '+WithCoin);

    if NoManat=EmptyStr then NoManat:='0 ';

    CO_Report.ODSBank.Open;
    CO_Report.QRAMMOUNT1.Caption :=NoManat + ValuteName;
    CO_Report.QRAMMOUNT2.Caption :=NoManat + ValuteName;
    CO_Report.Preview;
    finally
     with   CO_DataMod.Transactions do
      Filtered :=false;
    CO_Report.ODSBank.Close;
    CO_DataMod.Buyer.close;
    CO_DataMod.Buyer.open;
  end;














       end;





procedure TCO_Main.N6DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;
 function TCO_Main.CommitTransaction(TransactionID: Longint): Longint;
begin
 with CO_DataMod.SBTransaction do
  Result :=CallIntegerFunction(
              cs_commit_transaction, [
              'TransactionID', TransactionID,
              'CommitTemp', True]);

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
 CommitedCount :=0;
 ErrorCount :=0;
 WillRefresh :=False;
 with TransactionDataModule, GridTransactions, SelectedRows, DataSource.DataSet do
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
    CO_DataMod.Transactions.Close;
    CO_DataMod.Transactions.Open;
    end;

   end;
  end;

end;
function TCO_Main.CommitTransactions(TransactionIDs: WideString): Longint;
begin
 with CO_DataMod.SBTransaction do
  Result :=CallIntegerFunction(
              cs_commit_delayed_transactions, [
              'OverloadIDsStr', TransactionIDs,
              'CommitTemp', True]);
end;



procedure TCO_Main.D1Click(Sender: TObject);
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
begin
 CommitedCount :=0;
 ErrorCount :=0;
 WillRefresh :=False;
 with TransactionDataModule, GridTransactions, SelectedRows, DataSource.DataSet do
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
    CO_DataMod.Transactions.Close;
    CO_DataMod.Transactions.Open;
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
  with TransactionDataModule do
  begin
   CommitTransactions(IDs);
   SBCommit();
  
  end;
end;

procedure TCO_Main.N9Click(Sender: TObject);
begin
CO_Cust_Form :=TCO_Cust_Form.Create(Self);
CO_Cust_Form.showmodal;

end;

procedure TCO_Main.N13Click(Sender: TObject);
begin
CO_Settings :=TCO_Settings.Create(Self);
CO_Settings.Showmodal;
end;

procedure TCO_Main.passpeditChange(Sender: TObject);
begin

 if passpedit.Text<>'' then
   CO_DataMod.physical_customers.Locate
   ('PASSP_NUMBER',passpedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

    //--------------------KNN-------------------------------------------------------------------------------

   if (passpedit.text<>'')  then
    noedit.text :='';
    nameedit.text :='';
    datedit.Text :='';
end;

procedure TCO_Main.nameeditChange(Sender: TObject);
begin

 if nameedit.Text<>'' then
   CO_DataMod.physical_customers.Locate
   ('BYR_NAME',nameedit.Text,[loCaseInsensitive, loPartialKey]);
DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

    //--------------------KNN-------------------------------------------------------------------------------

  if (innedit.text<>'') or (searchacc.text<>'')or (namedit.text<>'') or (dateedit.text<>'') or (searchname.text <>'')then
    searchacc.text :='';
    innedit.text :='';
    dateedit.Text :='';
    searchname.text :='';
    namedit.text :='';

end;

procedure TCO_Main.DBGrid2DblClick(Sender: TObject);
begin
CO_Upd_Cust :=TCO_Upd_Cust.Create(Self);
CO_Upd_Cust.Showmodal;
end;

procedure TCO_Main.N14Click(Sender: TObject);
begin
CO_Upd_Cust :=TCO_Upd_Cust.Create(Self);
CO_Upd_Cust.Showmodal;
end;

procedure TCO_Main.N15Click(Sender: TObject);
begin
  FormAccount :=TFormAccount.Create(self);
     FormAccount.Showmodal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCO_Main,
    Class_CO_Main,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

 unit TransactionsViewerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, TransactionsViewer_TLB, StdVcl, ExtCtrls, ComCtrls,
  StdCtrls, Db, OracleData, Grids, DBGrids, ExcelExporter, Mask, DBCtrls,
  SearchCombo, ActnList, Buttons, CheckLst, Oracle;

type
  TFrmTransactionsViewer = class(TActiveForm, IFrmTransactionsViewer)
    rrr: TPanel;
    gb: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    EditDebt: TEdit;
    EditCredit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TransactionsExporter: TExcelExporter;
    RG1: TRadioGroup;
    RG2: TRadioGroup;
    ActionList1: TActionList;
    ActionFilter: TAction;
    GroupBox3: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PanelFilter: TPanel;
    PageControl1: TPageControl;
    TabSheetFilter: TTabSheet;
    PanelF: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    CBDebetFilial: TCheckBox;
    Panel4: TPanel;
    CBOperator: TCheckBox;
    DBLookup2: TDBLookupComboBox;
    DBLookup3: TDBLookupComboBox;
    CBOperationTypes: TCheckListBox;
    StaticText1: TStaticText;
    CLBCurrency: TCheckListBox;
    StaticText2: TStaticText;
    ActionLoadFilters: TAction;
    Panel1: TPanel;
    TransactionsViewer: TDBGrid;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    DBLookup1: TDBLookupComboBox;
    CBCreditFilial: TCheckBox;
    Panel6: TPanel;
    CheckBox1: TCheckBox;
    Panel7: TPanel;
    Panel8: TPanel;
    EditSumAmount: TEdit;
    Panel9: TPanel;
    EditSumAmountC: TEdit;
    Panel10: TPanel;
    EditSumLAmount: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure CBCurrencyClick(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure DBLookup1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ActionLoadFiltersExecute(Sender: TObject);
    procedure CBOperationTypesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheetFilterShow(Sender: TObject);
    procedure CBDebetFilialClick(Sender: TObject);
    procedure TransactionsViewerTitleClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFrmTransactionsViewerEvents;
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
    OperationCount: word;
    RequiredOrderField: variant;
    
    procedure SetAddress;
    procedure Initialize; override;
    procedure GetFieldValue;
    function GenerateBalanceFilter(FieldName, Balance: String): String;
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;

var
   FrmTransactionsViewer: TFrmTransactionsViewer;
   OperationIDs, CurrencyIDs: TStringList;


implementation

uses ComObj, ComServ ,sboapiDataModuleImpl,
  TransactionsViewerDataModuleUnit, TransactionViewerRptUnit,
  ExportFormImpl, SBStoredProc;

{$R *.DFM}

{ TFrmTransactionsViewer }

procedure TFrmTransactionsViewer.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmTransactionsViewerPage); }
end;

procedure TFrmTransactionsViewer.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmTransactionsViewerEvents;
end;

procedure TFrmTransactionsViewer.Initialize;
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

function TFrmTransactionsViewer.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmTransactionsViewer.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmTransactionsViewer.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmTransactionsViewer.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmTransactionsViewer.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmTransactionsViewer.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmTransactionsViewer.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmTransactionsViewer.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmTransactionsViewer.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmTransactionsViewer.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmTransactionsViewer.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmTransactionsViewer.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmTransactionsViewer.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmTransactionsViewer.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmTransactionsViewer.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmTransactionsViewer.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmTransactionsViewer.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmTransactionsViewer.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmTransactionsViewer._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmTransactionsViewer.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmTransactionsViewer.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmTransactionsViewer.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmTransactionsViewer.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmTransactionsViewer.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmTransactionsViewer.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmTransactionsViewer.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmTransactionsViewer.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmTransactionsViewer.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmTransactionsViewer.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmTransactionsViewer.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmTransactionsViewer.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmTransactionsViewer.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmTransactionsViewer.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmTransactionsViewer.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmTransactionsViewer.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmTransactionsViewer.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmTransactionsViewer.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmTransactionsViewer.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmTransactionsViewer.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmTransactionsViewer.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmTransactionsViewer.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmTransactionsViewer.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmTransactionsViewer.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFrmTransactionsViewer.Button2Click(Sender: TObject);
begin
 if not Assigned(ExportForm) then
  ExportForm :=TExportForm.Create(Self);
  ExportForm.ShowModal;
end;


procedure TFrmTransactionsViewer.Button3Click(Sender: TObject);
begin
 with TransactionsRpt do
  Preview;
end;

//---------------------------------------------------------------------------------------------------------------------

procedure TFrmTransactionsViewer.SetAddress;
begin
 if not(Assigned(OperationIDs)) then
  OperationIDs:=TStringList.Create
 else
  OperationIDs.Clear;

 if not(Assigned(CurrencyIDs)) then
  CurrencyIDs:=TStringList.Create
 else
  CurrencyIDs.Clear;

 CBOperationTypes.Tag:=Integer(@OperationIDs);
 CLBCurrency.Tag:=Integer(@CurrencyIDs);
end;

procedure TFrmTransactionsViewer.GetFieldValue;
var
   AmmountValue: currency;
   AmmountCValue: currency;
   LAmmountValue: currency;
begin
 AmmountValue :=0.00;
 AmmountCValue :=0.00;
 LAmmountValue :=0.00;
 with TransDataModule.Transactions do
 begin
  if not Active then Exit;
  DisableControls;
  First;
  try
   while not Eof do
   begin
    AmmountValue :=AmmountValue + FieldByName('AMMOUNT').AsCurrency;
    AmmountCValue :=AmmountCValue + FieldByName('AMMOUNT_C').AsCurrency;
    LAmmountValue :=LAmmountValue + FieldByName('LAMMOUNT').AsCurrency;
    Next;
   end;
  finally
   EnableControls;
  end;
  First;
 end;
 EditSumAmount.Text :=CurrToStrF(AmmountValue, ffCurrency, 2);
 EditSumAmountC.Text :=CurrToStrF(AmmountCValue, ffCurrency, 2);
 EditSumLAmount.Text :=CurrToStrF(LAmmountValue, ffCurrency, 2);
end;

procedure TFrmTransactionsViewer.ActiveFormCreate(Sender: TObject);
begin
  FrmTransactionsViewer :=Self;
  TransDataModule := TTransDataModule.Create(Self);
  TransactionsRpt := TTransactionsRpt.Create(Self);
  DateTimePicker1.DateTime := TransDataModule.SYSDAT.FieldByName('TEK_DAT').AsDateTime;
  DateTimePicker2.DateTime := TransDataModule.SYSDAT.FieldByName('TEK_DAT').AsDateTime;
  OperationIDs :=TStringList.Create;
  {with TransDataModule.OpertaionTypes, CBOperationTypes do
   begin
    Open;
    OperationCount :=RecordCount;
    While not Eof do
     begin
      Items.Add(FieldByName('Name').AsString);
      Checked[RecNo-1] :=True;
      OperationIDs.Add(FieldByName('ID').AsString);
      Next;
    end;
   end;}
  SetAddress;
  RequiredOrderField :=TransDataModule.Transactions.GetVariable('Title');
end;

procedure TFrmTransactionsViewer.CBCurrencyClick(Sender: TObject);
var
   DBLookup: TDBLookupComboBox;
   DBLookupName: string[10];
   DBLookupNo: string[1];
begin
 with TCheckBox(Sender) do
  DBLookupNo :=IntToStr(Tag);
  DBLookupName :='DBLookup'+DBLookupNo;
  DBLookup :=TDBLookupComboBox(FindComponent(DBLookupName));

  if TCheckBox(Sender).Checked then
   begin
    DBLookup.ListSource.DataSet.First;
    DBLookup.KeyValue :=DBLookup.ListSource.DataSet.FieldByName(DBLookup.KeyField).AsInteger;
   end
  else
   DBLookup.KeyValue :=-1;

  ActionFilterExecute(Sender);
end;

procedure TFrmTransactionsViewer.ActionFilterExecute(Sender: TObject);

  function  CheckFiltred(IsChecked :Boolean;const FilterStr :String;Args :array of const):String;
  begin
     Result :='';
     if  IsChecked  then
      Result :=Format(FilterStr,Args);
  end;

  function AddBoolPrefix(WillAdd: boolean): string;
  begin
   Result :=' ';
   if WillAdd then Result :=' AND ';
  end;

  function GenerateFilter(CheckListBox: TCheckListBox; const FilterConst: string; ICount: word): string;
  var
     Position, i: word;
     Filter: string;
  begin
  Result :='';
   with CheckListBox,Items do
    begin
     Position :=0;
     if not(Count>0) then Exit;
     if not Checked[0] then
      if ICount= 1 then
       Filter :=Format(FilterConst,[StrToInt(TStringList(Pointer(Tag)^).Strings[0])])
      else
       Filter :=Format(FilterConst,[StrToInt(TStringList(Pointer(Tag)^).Strings[0]),StrToInt(TStringList(Pointer(Tag)^).Strings[0])])
     else
      Filter :='';

     for i :=1 to Items.Count -1 do
      if not Checked[i] then
       begin

        if ICount= 1 then
         Filter :=Filter + AddBoolPrefix(not Checked[Position]) + Format(FilterConst,[StrToInt(TStringList(Pointer(Tag)^).Strings[i])])
        else
         Filter :=Filter + AddBoolPrefix(not Checked[Position]) + Format(FilterConst,[StrToInt(TStringList(Pointer(Tag)^).Strings[i]),StrToInt(TStringList(Pointer(Tag)^).Strings[i])]);

        Position :=i;
       end;
    end;
    Result :=Filter;
  end;

const
    CurrencyFilter ='((DCurrency<>%d)AND(KCurrency<>%d))';
    DebetFilialFilter = '(DebetFilial=%d)';
    CreditFilialFilter = '(CreditFilial=%d)';
    OperatorFilter = '(Operator=%d)';
    OperationTypeFilter='(OperationType<>%d)';
var
   CurrencyF:      string;
   DebetFilialF:   string;
   CreditFilialF:  string;
   OperatorF:      string;
   OperationTypeF: string;
   FilterStr:      string;
begin
  FilterStr :='';
  OperationTypeF :='';

   DebetFilialF :=CheckFiltred(
                      CBDebetFilial.Checked
                     ,DebetFilialFilter
                     ,[DBLookup2.ListSource.DataSet.FieldByName('ID').AsInteger]
                     );
   CreditFilialF :=CheckFiltred(
                      CBCreditFilial.Checked
                     ,CreditFilialFilter
                     ,[DBLookup1.ListSource.DataSet.FieldByName('ID').AsInteger]
                     );
   OperatorF :=CheckFiltred(
                      CBOperator.Checked
                     ,OperatorFilter
                     ,[DBLookup3.ListSource.DataSet.FieldByName('ID').AsInteger]
                     );

   CurrencyF :=GenerateFilter(CLBCurrency,CurrencyFilter,2);
   OperationTypeF :=GenerateFilter(CBOperationTypes,OperationTypeFilter,1);

    FilterStr :=CurrencyF;

    if  DebetFilialF <> '' then
    if  FilterStr=''  then
      FilterStr :=DebetFilialF
    else
      FilterStr :=FilterStr + 'AND' + DebetFilialF;

    if  CreditFilialF <> '' then
    if  FilterStr=''  then
      FilterStr :=CreditFilialF
    else
      FilterStr :=FilterStr + 'AND' + CreditFilialF;

    if  OperatorF <> '' then
    if  FilterStr=''  then
      FilterStr :=OperatorF
    else
      FilterStr :=FilterStr + 'AND' +OperatorF;

    if  OperationTypeF <> '' then
    if  FilterStr=''  then
      FilterStr :=OperationTypeF
    else
      FilterStr :=FilterStr + 'AND' +OperationTypeF;

 with TransactionsViewer.DataSource.DataSet do
  begin
    Filtered :=False;
    Filter :=FilterStr;
    Filtered :=True;
  end;
 GetFieldValue;
end;

procedure TFrmTransactionsViewer.DBLookup1Click(Sender: TObject);
begin
 ActionFilterExecute(Sender);
end;

function TFrmTransactionsViewer.GenerateBalanceFilter(FieldName, Balance: String): String;
begin
 Result :=' AND Substr(' + FieldName + ', 1, ' + ' Length(' + Balance + ')) = ' + Balance;
end;

procedure TFrmTransactionsViewer.Button4Click(Sender: TObject);
var
  d1,d2 :TDateTime;
begin
  Screen.Cursor := crSQLWait;
  d1 := trunc(DateTimePicker1.DateTime);
  d2 := trunc(DateTimePicker2.DateTime);
  try
  with  TransDataModule.Transactions  do
  begin
    if  Active  then CloseAll;

    if Trim(EditDebt.Text)<>'' then
     case RG1.ItemIndex of
      0:
        begin
         SQL[23] := '  AND(a1.bal_cn1 IN (';
         SQL[24] := EditDebt.Text + '))';
        end;
      1:
        begin
         SQL[23] := '  AND(a1.Acc_No  IN (';
         SQL[24] := StrToComma(EditDebt.Text) + '))';
        end;
      2:
        begin
         SQL[23] := GenerateBalanceFilter('a1.bal_cn1', EditDebt.Text);
         SQL[24] := '';
        end;
     end
    else
     begin
      SQL[23] := '';
      SQL[24] := '';
     end;

    if Trim(EditCredit.Text)<>'' then
     case RG2.ItemIndex of
      0:
        begin
         SQL[26] := '  AND(a2.bal_cn1 IN (';
         SQL[27] := EditCredit.Text + '))';
        end;
      1:
        begin
         SQL[26] := '  AND(a2.Acc_No  IN (';
         SQL[27] := StrToComma(EditCredit.Text) + '))'
        end;
      2:
        begin
         SQL[26] := GenerateBalanceFilter('a2.bal_cn1', EditCredit.Text);
         SQL[27] := '';
        end;
      end
    else
     begin
      SQL[26] := '';
      SQL[27] := '';
     end;

    if (RG1.ItemIndex = 1)
      and (TrimAll(EditDebt.Text) <> EmptyStr)
      and (EditDebt.Text = EditCredit.Text)
      and (RG1.ItemIndex = RG2.ItemIndex) then
     begin
      SQL[23] := '  AND((a1.Acc_No  IN (';
      SQL[26] := '  OR(a2.Acc_No  IN (';
      SQL[27] := StrToComma(EditCredit.Text) + ')))'
     end;

    SetVariable('d1',d1);
    SetVariable('d2',d2);
    Open;
  end;
  GetFieldValue;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTransactionsViewer.Button5Click(Sender: TObject);
begin
 PanelFilter.Visible :=not PanelFilter.Visible;
end;

procedure TFrmTransactionsViewer.ActionLoadFiltersExecute(Sender: TObject);
begin
 CBOperationTypes.Clear;
 TStringList(Pointer(CBOperationTypes.Tag)^).Clear;
 CLBCurrency.Clear;
 TStringList(Pointer(CLBCurrency.Tag)^).Clear;
 with TransDataModule do
  begin
   OperationTypes.Execute;
   Currency.Execute;
  end;      
end;

procedure TFrmTransactionsViewer.CBOperationTypesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_F5) then
  ActionLoadFilters.Execute;
end;

procedure TFrmTransactionsViewer.TabSheetFilterShow(Sender: TObject);
begin
  ActionLoadFiltersExecute(Sender);
end;

procedure TFrmTransactionsViewer.CBDebetFilialClick(Sender: TObject);
var
   DBLookup: TDBLookupComboBox;
   DBLookupName: string[10];
   DBLookupNo: string[1];
begin
 with TCheckBox(Sender) do
  DBLookupNo :=IntToStr(Tag);
  DBLookupName :='DBLookup'+DBLookupNo;
  DBLookup :=TDBLookupComboBox(FindComponent(DBLookupName));

  if TCheckBox(Sender).Checked then
   begin
    DBLookup.ListSource.DataSet.First;
    DBLookup.KeyValue :=DBLookup.ListSource.DataSet.FieldByName(DBLookup.KeyField).AsInteger;
   end
  else
   DBLookup.KeyValue :=-1;

  ActionFilterExecute(Sender);
end;

procedure TFrmTransactionsViewer.MouseWheelHandler(var Message: TMessage);
begin
 Inherited;
 if (TransactionsViewer.Focused) and not(TransactionsViewer.DataSource.DataSet.IsEmpty) then
  with TCMMouseWheel(Message), TransactionsViewer.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
end;


procedure TFrmTransactionsViewer.TransactionsViewerTitleClick(
  Column: TColumn);
var
   TitleName :string;
begin
 if TransactionsViewer.DataSource.DataSet.IsEmpty then Exit;
 Screen.Cursor := crHourGlass;
 TitleName :=Column.FieldName;
  try
   with TOracleDataSet(TransactionsViewer.DataSource.DataSet) do
    begin
     SetVariable('Title',TitleName);
     Refresh;
     SetVariable('Title',RequiredOrderField);
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TFrmTransactionsViewer.CheckBox1Click(Sender: TObject);
begin
 with TransactionsViewer do
  begin
   Columns[10].Visible :=TCheckBox(Sender).Checked;
   Columns[10].Width :=100;
  end; 
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmTransactionsViewer,
    Class_FrmTransactionsViewer,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.                                               

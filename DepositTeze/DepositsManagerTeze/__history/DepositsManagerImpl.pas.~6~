unit DepositsManagerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ActiveX, AxCtrls, DepositsManager_TLB, StdVcl, ComCtrls, ToolWin,
  ExtCtrls, Menus, ImgList, Grids, StdCtrls, Buttons,Dialogs,
  DBViewComboBox, Mask, DBCtrlsEh, Oracle,Oracledata, ActnList,
  CMExcelExport, XDBGrids, DBLookupEh;

const   csUnknown   = -9;
        csCalculated=-10;
        csDisabled  =-11;


type
  TfrmDepositsManager = class(TActiveForm, IDepositsManager)
    ImageList: TImageList;
    LastPopupMenu: TPopupMenu;
    miContract: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N35: TMenuItem;
    ActionsMenu: TPopupMenu;
    miDeposit: TMenuItem;
    miWithdraw: TMenuItem;
    miCapitalization: TMenuItem;
    miUntimelyWithdraw: TMenuItem;
    N12: TMenuItem;
    Panel1: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton14: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    TBFilteration: TToolButton;
    FilterPanel: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    CBCurrency: TCheckBox;
    GroupBox2: TGroupBox;
    CBpersons: TCheckBox;
    GroupBox3: TGroupBox;
    CBClientType: TCheckBox;
    GroupBox4: TGroupBox;
    CBFilial: TCheckBox;
    GroupBox5: TGroupBox;
    CBContractType: TCheckBox;
    PanelMain: TPanel;
    SearchPanel: TGroupBox;
    Panel4: TPanel;
    StaticText1: TStaticText;
    EditContractNo: TEdit;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EditContractAccNo: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EditInterestAccNo: TEdit;
    Panel9: TPanel;
    StaticText4: TStaticText;
    EditSTOPCALCULATIONDATE: TEdit;
    Panel10: TPanel;
    StaticText5: TStaticText;
    EditFacticalDebt: TEdit;
    Panel11: TPanel;
    StaticText6: TStaticText;
    EditCustomerName: TEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    StatusImages: TImageList;
    ActionList1: TActionList;
    ActnSearch: TAction;
    ActnFilter: TAction;
    ActnRefresh: TAction;
    PopupMenuSettings: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    GroupBox9: TGroupBox;
    LCBStatus: TComboBox;
    CBStatus: TCheckBox;
    GroupBox7: TGroupBox;
    Label1: TLabel;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    CBOpendat: TCheckBox;
    EExport: TCMExcelExport;
    GroupBox6: TGroupBox;
    BitBtnexp: TBitBtn;
    N14: TMenuItem;
    MainGrid: TXDBGrid;
    N15: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton11: TToolButton;
    RepairMenu: TPopupMenu;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N36: TMenuItem;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure TBFilterationClick(Sender: TObject);
    procedure ActnSearchExecute(Sender: TObject);
    procedure EditContractNoKeyPress(Sender: TObject; var Key: Char);
    procedure EditContractNoExit(Sender: TObject);
    procedure ActnFilterExecute(Sender: TObject);
    procedure CBCurrencyClick(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure ActnRefreshExecute(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure DTPCloseDateChange(Sender: TObject);
    procedure BitBtnexpClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IDepositsManagerEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure PrepareFilter;
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
    function BuildFilterString :String ;
    
  end;

implementation

uses ComObj, ComServ,DMDepositManagerImpl,
                     CommonDeclsImpl;

{$R *.DFM}

{ TDepositsManager }

procedure TfrmDepositsManager.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_DepositsManagerPage); }
end;

procedure TfrmDepositsManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IDepositsManagerEvents;
end;

procedure TfrmDepositsManager.Initialize;
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

function TfrmDepositsManager.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmDepositsManager.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmDepositsManager.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmDepositsManager.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmDepositsManager.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmDepositsManager.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmDepositsManager.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfrmDepositsManager.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmDepositsManager.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmDepositsManager.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmDepositsManager.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmDepositsManager.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmDepositsManager.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmDepositsManager.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmDepositsManager.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmDepositsManager.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmDepositsManager.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmDepositsManager.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmDepositsManager._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmDepositsManager.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfrmDepositsManager.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfrmDepositsManager.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfrmDepositsManager.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfrmDepositsManager.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfrmDepositsManager.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfrmDepositsManager.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfrmDepositsManager.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfrmDepositsManager.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmDepositsManager.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmDepositsManager.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmDepositsManager.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmDepositsManager.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmDepositsManager.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfrmDepositsManager.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmDepositsManager.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmDepositsManager.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmDepositsManager.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmDepositsManager.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfrmDepositsManager.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmDepositsManager.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmDepositsManager.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmDepositsManager.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmDepositsManager.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfrmDepositsManager.ActiveFormCreate(Sender: TObject);

begin
   DMDepositsManager := TDMDepositsManager.Create(Self);
   PrepareFilter;
   ApplicationPath := ExtractFilePath(Application.ExeName);
   CommonApplication := Application;
   CommonGrid := MainGrid;

   with DMDepositsManager do
   begin
      Get_FilialID := FilialID.FieldByname('kod_fil').AsInteger;
      Get_BankDate := BankDate.FieldByname('Tek_Dat').AsDateTime;
   end;

   DTPOpenDate.DateTime := Get_BankDate ;
   DTPCloseDate.DateTime := Get_BankDate;
end;

procedure TfrmDepositsManager.ActiveFormDestroy(Sender: TObject);
begin
   DMDepositsManager.Free
end;


procedure TfrmDepositsManager.TBFilterationClick(Sender: TObject);
begin
   FilterPanel.Visible :=not FilterPanel.Visible;
   DTPOpenDate.DateTime := Get_BankDate;
   DTPCloseDate.DateTime := Get_BankDate;
   TBFilteration.Down :=FilterPanel.Visible; 
end;

procedure TfrmDepositsManager.ActnSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    MainGrid.SelectedRows.Clear;
    with  TOracleDataSet(MainGrid.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatıb.'+#13+'əvvəldən başlamaq istəyirsinizmi?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;

end;

procedure TfrmDepositsManager.EditContractNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) = VK_RETURN
  then  ActnSearchExecute(Sender)
end;

procedure TfrmDepositsManager.EditContractNoExit(Sender: TObject);
begin
  with (Sender as TEdit) do
       Text := '' 
end;

function TfrmDepositsManager.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant;check :boolean);
  const
     csFormat = '(%s=%s)';
  var
    Temp,op : String;

  begin

     if check then op := ' and ' else op := ' or ';

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + op + Temp;
    end;

  end;

  procedure  ConcatFilter1(var S: String; var Prefix : String);
  begin
     if (S <> '') and (Prefix <> '') then S := S+' and '+Prefix;
     if (S = '') and (Prefix <> '') then S := Prefix;
  end;

  
var  FStatus,FopenDat1,FopenDat2,FopenDat : String;
begin
  Result := '';
  FStatus := '';
  FopenDat1 := '';
  FopenDat2 := '';
  FopenDat := '';

  ConcatFilter(Result,'CURRENCY',CBCurrency.Checked,DBLookupComboboxEh1.KeyValue,true);
  ConcatFilter(Result,'branchid',CBFilial.Checked,DBLookupComboboxEh2.KeyValue,true);
  ConcatFilter(Result,'contracttype',CBContractType.Checked,DBLookupComboboxEh3.KeyValue,true);
  ConcatFilter(Result,'clienttype',CBpersons.Checked,DBLookupComboboxEh4.KeyValue,true);
  ConcatFilter(Result,'personaltype',CBClientType.Checked,DBLookupComboboxEh5.KeyValue,true);
  //ConcatFilter(Result,'usid',CBUsers.Checked,LCBUsers.KeyValue,true);

  if CBStatus.Checked then
     Case LCBStatus.ItemIndex of
          0: FStatus := '(status = 1)';
          1: FStatus := '(Status = 0)';
     end;

  if CBOpendat.Checked then
  begin
     FopenDat1 := ' opendate >=  '''+FormatDateTime('dd/MM/yyyy',DTPOpenDate.Date)+'''';
     FopenDat2 := ' opendate <=  '''+FormatDateTime('dd/MM/yyyy',DTPCloseDate.Date)+'''';
     FopenDat := '('+'('+FopenDat1+')'+' and '+'('+FopenDat2+')'+')';
  end;


  ConcatFilter1(Result,FStatus);
  ConcatFilter1(Result,FopenDat);

end;


procedure TfrmDepositsManager.ActnFilterExecute(Sender: TObject);
begin
   with MainGrid,SelectedRows do
        Clear; 
   with MainGrid,DataSource.DataSet do
   begin
      Cursor := crSqlWait;
      Filtered := False;
      Filter := BuildFilterString;
      Filtered := true;
      Cursor := crDefault;
   end;
end;

procedure TfrmDepositsManager.CBCurrencyClick(Sender: TObject);
begin
  ActnFilterExecute(sender); 
end;

procedure TfrmDepositsManager.DBLookupComboboxEh1Change(Sender: TObject);
begin
   ActnFilterExecute(sender);
end;

procedure TfrmDepositsManager.PrepareFilter;
begin
   with DMDepositsManager do
   begin
      DBLookupComboboxEh1.KeyValue := Valutes.fieldByName('Valute').AsInteger;
      DBLookupComboboxEh2.KeyValue := Filials.fieldByName('id').AsInteger;
      DBLookupComboboxEh3.KeyValue := DepositTypes.fieldByName('id').AsInteger;
      DBLookupComboboxEh4.KeyValue := Categories.fieldByName('id').AsInteger;
      DBLookupComboboxEh5.KeyValue := persons.fieldByName('id').AsInteger;
      //LCBUsers.KeyValue := users.fieldByName('id').AsInteger;
      LCBStatus.ItemIndex := 0;
   end;
end;



procedure TfrmDepositsManager.N35Click(Sender: TObject);
begin
  SearchPanel.Visible := not SearchPanel.Visible
end;

procedure TfrmDepositsManager.N16Click(Sender: TObject);
begin
   LoadPlugin('SBDM_Contract.bpl','InsertContract');
end;

procedure TfrmDepositsManager.N17Click(Sender: TObject);
begin
   LoadPlugin('SBDM_Contract.bpl','EditContract');
end;

procedure TfrmDepositsManager.ActnRefreshExecute(Sender: TObject);
var
    SaveID :Integer;
begin

   MainGrid.SelectedRows.Clear;

   with DMDepositsManager,DepositsData do
   begin
      SaveID := Get_SelectedContID;
      Refresh;
      Locate('ID',SaveID,[]);
   end;
end;

procedure TfrmDepositsManager.N23Click(Sender: TObject);
begin
   LoadPlugin('SBDM_ApplyMoney.bpl','');
end;

procedure TfrmDepositsManager.N25Click(Sender: TObject);
begin
   LoadPlugin('SBDM_ExtractMoney.bpl','');
end;

procedure TfrmDepositsManager.N24Click(Sender: TObject);
begin
   LoadPlugin('SBDM_Capitalize.bpl','');
end;

procedure TfrmDepositsManager.N26Click(Sender: TObject);
begin
   LoadPlugin('SBDM_UntimelyEtMoney.bpl','');
end;

procedure TfrmDepositsManager.N27Click(Sender: TObject);
begin
  LoadPlugin('SBDM_PercentConverting.bpl','');
end;

procedure TfrmDepositsManager.N1Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Settings.bpl','showrefer');
end;

procedure TfrmDepositsManager.N2Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Settings.bpl','showcccgroups');
end;

procedure TfrmDepositsManager.N3Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Settings.bpl','showcategories');
end;

procedure TfrmDepositsManager.N4Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Settings.bpl','showdeposittypes');
end;

procedure TfrmDepositsManager.N20Click(Sender: TObject);
begin
  LoadPlugin('SBDM_ContractReport.bpl',''); 
end;

procedure TfrmDepositsManager.N5Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Settings.bpl','showaccountturning');
end;

procedure TfrmDepositsManager.N6Click(Sender: TObject);
begin
   LoadPlugin('SBDM_WRSetup.bpl','showSBWRBookmarkSetup');
end;

procedure TfrmDepositsManager.N21Click(Sender: TObject);
begin
  LoadPlugin('SBDM_WReport.bpl','');
end;

procedure TfrmDepositsManager.N7Click(Sender: TObject);
begin
  LoadPlugin('SBDM_PercentSettings.bpl','');
end;

procedure TfrmDepositsManager.N18Click(Sender: TObject);
const  CfMsg = 'Müqavilə bağlanır, əminsinizmi?';
       CfSelMsg = 'Seçilmiş müqavilələr bağlanır, əminsinizmi?';

var Cf :String;
    i :Integer;
begin
  with MainGrid,SelectedRows do
       if Count > 1 then Cf := CfSelMsg else Cf := CfMsg;

  if MessageDlg(
        Cf
       ,mtConfirmation
       ,[mbYes, mbNo ]
       ,0
       )  = mrNo Then exit ;

   with MainGrid,SelectedRows,DataSource.DataSet do
   begin

      for i := 0 to Count - 1 do
      begin
         GotoBookmark(Pointer(Items[i]));
         DMDepositsManager.Stored_Programs.CallProcedure('CloseDeposit',['ContractID',FieldByName('ID').AsInteger]);
      end;

      Refresh;
   end;

end;

procedure TfrmDepositsManager.N19Click(Sender: TObject);
var
   CalculationEnabled :Boolean;
   ConFMsg :string;
begin
   with DMDepositsManager,Stored_Programs do
   CalculationEnabled := CallBooleanFunction('IsCalculationEnabled',['ContractID',get_SelectedContID]);
   if  CalculationEnabled  then
     ConFMsg :='Faizlərin hesablanması dayandırılır əminsinizmi?'
   else
    ConFMsg :='Faizlərin hesablanmasını davam etdirilir əminsinizmi?';
   if MessageDlg(ConFMsg,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    with DMDepositsManager,Stored_Programs do
    begin
       if  CalculationEnabled then
           CallProcedure('DisableCalculation',['ContractID',get_SelectedContID])
       else
          CallProcedure('EnableCalculation',['ContractID',get_SelectedContID])
    end;
      
end;

procedure TfrmDepositsManager.N30Click(Sender: TObject);
begin
  LoadPlugin('SBDM_PeriodReport.bpl','');
end;

procedure TfrmDepositsManager.N8Click(Sender: TObject);
begin
  LoadPlugin('SBDM_Prolongation.bpl','');
end;

procedure TfrmDepositsManager.N10Click(Sender: TObject);
begin
     LoadPlugin('SBDM_Filter.bpl','');
end;

procedure TfrmDepositsManager.DTPCloseDateChange(Sender: TObject);
begin
  DBLookupComboboxEh1Change(nil);
end;

procedure TfrmDepositsManager.BitBtnexpClick(Sender: TObject);
begin
   with EExport do
   begin
      MainGrid.DataSource.DataSet.Last;
      Connect;
      ExportDataset(MainGrid.DataSource.DataSet,'Depozitlər',True);
      Disconnect;
   end;
end;

procedure TfrmDepositsManager.N11Click(Sender: TObject);
begin
   LoadPlugin('SBDM_Report.bpl','');
end;

procedure TfrmDepositsManager.N13Click(Sender: TObject);
begin
  LoadPlugin('SBDM_ReportofBalance.bpl','');
end;

procedure TfrmDepositsManager.N14Click(Sender: TObject);
begin
  LoadPlugin('Sbdm_Shedule.bpl','');
end;

procedure TfrmDepositsManager.N15Click(Sender: TObject);
begin
  LoadPlugin('SBDM_PartialPayment.bpl','');
end;

procedure TfrmDepositsManager.N31Click(Sender: TObject);
begin
  LoadPlugin('SBDM_PeriodReport.bpl','');
end;

procedure TfrmDepositsManager.N32Click(Sender: TObject);
begin
    LoadPlugin('SBDM_Report.bpl','');
end;

procedure TfrmDepositsManager.N33Click(Sender: TObject);
begin
  LoadPlugin('SBDM_ReportofBalance.bpl','');
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmDepositsManager,
    Class_frmDepositsManager,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

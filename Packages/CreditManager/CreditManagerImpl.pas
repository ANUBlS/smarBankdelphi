              {=================================================}
              {                                                 }
              {   Smart  Credits Manager.  Version 2.0          }
              {   (c) Smart   Systems  Technology  Ltd.         }
              {                                     2002.       }
              {   All Rights Reserved                           }
              {                                                 }
              {=================================================}
unit CreditManagerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, CreditManager_TLB, StdVcl, ExtCtrls, ImgList, ToolWin,
  ComCtrls,  Grids, DBGrids, StdCtrls, Db, OracleData,Oracle,
  Buttons,  Menus,SBPlgAx50_TLB, DBViewComboBox, ActnList, ExcelExporter;


const   csUnknown   = -9;
const   csCalculated=-10;
const   csDisabled  =-11;

type
   EUserError = class(Exception);
type
  TFrmCreditManager = class(TActiveForm, IFrmCreditManager,IIconExporter)
    ImageList1: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    MainToolBar: TToolBar;
    TBNew: TToolButton;
    ToolButton2: TToolButton;
    TBEdit: TToolButton;
    ToolButton4: TToolButton;
    TBRefresh: TToolButton;
    ToolButton6: TToolButton;
    TBBalance: TToolButton;
    ToolButton8: TToolButton;
    TBFilter: TToolButton;
    TBOperation: TToolButton;
    FilterPanel: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Splitter: TSplitter;
    Panel5: TPanel;
    BtnCloseFilterPanel: TButton;
    GroupBox2: TGroupBox;
    DropDownMenu: TPopupMenu;
    miTranch: TMenuItem;
    miOverdue: TMenuItem;
    miPayment: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton1: TToolButton;
    TBReferences: TToolButton;
    MainMenu: TPopupMenu;
    miContractState: TMenuItem;
    miEditContract: TMenuItem;
    miInsert: TMenuItem;
    ContractsViewer: TDBGrid;
    miProlongation: TMenuItem;
    miEnableDisableCalculation: TMenuItem;
    miSelectAll: TMenuItem;
    miConvertSelected: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Trach1: TMenuItem;
    Expire1: TMenuItem;
    Payment1: TMenuItem;
    Prolongation1: TMenuItem;
    StatusImages: TImageList;
    GroupBox3: TGroupBox;
    CBCurrency: TCheckBox;
    DBViewComboBox1: TDBViewComboBox;
    GroupBox4: TGroupBox;
    CBContractType: TCheckBox;
    DBViewComboBox2: TDBViewComboBox;
    GroupBox5: TGroupBox;
    CBClientType: TCheckBox;
    DBViewComboBox3: TDBViewComboBox;
    N5: TMenuItem;
    miFilter: TMenuItem;
    miCalculateds: TMenuItem;
    miCalculationStopped: TMenuItem;
    miNotCalculated: TMenuItem;
    Panel6: TPanel;
    CBNotCalculated: TCheckBox;
    CBCalcStopped: TCheckBox;
    CBCalculated: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    miPanelofFilter: TMenuItem;
    ActionList: TActionList;
    FilterAction: TAction;
    N6: TMenuItem;
    CloseCurrentContract1: TMenuItem;
    N7: TMenuItem;
    miExport: TMenuItem;
    miRefresh: TMenuItem;
    SearchPanel: TGroupBox;
    Panel3: TPanel;
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
    EditContractAccName: TEdit;
    Panel10: TPanel;
    StaticText5: TStaticText;
    EditFacticalDebt: TEdit;
    Panel11: TPanel;
    StaticText6: TStaticText;
    EditOverdueDebt: TEdit;
    miSearchPanel: TMenuItem;
    SearchAction: TAction;
    N8: TMenuItem;
    miReserveCont: TMenuItem;
    N9: TMenuItem;
    procedure TBFilterClick(Sender: TObject);
    procedure BtnCloseFilterPanelClick(Sender: TObject);
    procedure TBRefreshClick(Sender: TObject);
    procedure miContractStateClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure miEditContractClick(Sender: TObject);
    procedure TBReferencesClick(Sender: TObject);
    procedure miInsertClick(Sender: TObject);
    procedure miTranchClick(Sender: TObject);
    procedure miProlongationClick(Sender: TObject);
    procedure miOverdueClick(Sender: TObject);
    procedure miPaymentClick(Sender: TObject);
    procedure miEnableDisableCalculationClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure miConvertSelectedClick(Sender: TObject);
    procedure miNotCalculatedClick(Sender: TObject);
    procedure miPanelofFilterClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure miCalculationStoppedClick(Sender: TObject);
    procedure miCalculatedsClick(Sender: TObject);
    procedure CloseCurrentContract1Click(Sender: TObject);
    procedure ContractsViewerTitleClick(Column: TColumn);
    procedure miExportClick(Sender: TObject);
    procedure miContractStateDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure miSearchPanelClick(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure EditContractNoKeyPress(Sender: TObject; var Key: Char);
    procedure EditContractNoExit(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ContractsViewerDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure miReserveContClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFrmCreditManagerEvents;
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
    function Get_Icon: OLE_HANDLE; safecall;
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
    procedure Set_Visible(Value: WordBool); safecall;  function IFrmCreditManager.Get_Color = IFrmCreditManager_Get_Color;
    function IFrmCreditManager.Get_Font = IFrmCreditManager_Get_Font;
    procedure IFrmCreditManager._Set_Font = IFrmCreditManager__Set_Font;
    procedure IFrmCreditManager.Set_Color = IFrmCreditManager_Set_Color;
    procedure IFrmCreditManager.Set_Font = IFrmCreditManager_Set_Font;
    function IFrmCreditManager_Get_Color: OLE_COLOR; safecall;
    function IFrmCreditManager_Get_Font:IFontDisp ; safecall;
    procedure IFrmCreditManager__Set_Font(const Value :IFontDisp); safecall;
    procedure IFrmCreditManager_Set_Color(Value :OLE_COLOR); safecall;
    procedure IFrmCreditManager_Set_Font(var Value :IFontDisp); safecall;
  public
    { Public declarations }
    FBankDate : TDateTime;
    function  Prolongation(ContractID :LongInt):Boolean;
    function  Tranch(ContractID :LongInt) :Boolean;
    function  Expire(ContractID :LongInt):Boolean;
    function  ReserveCont(ContractID :LongInt):Boolean;
    function  Payment(ContractID :LongInt):Boolean;
    function  GetContractID :LongInt;
    function  NewContract : Boolean;
    function  EditContract :Boolean;
    procedure SafeRefresh;
    function  PercentConverting:Boolean;
    function  ConvertSelected(ContractID :LongInt) :LongInt;
    procedure Initialize; override;
    procedure MouseWheelHandler(var Message: TMessage); override;
    procedure PaymentsPlane(ContractID : Integer; ContractNum : String);
  end;

implementation

uses ComObj, ComServ,UntContractConclusion,UntConclusionDataModule,UntPercents,
     UntReferences,sbcmMainDataModule,UntContractState,UntCreditTranches,UntProlongations,
     UntExpite,UntPayments,StoredProgramsUnit,UntPercentConverting,
     UntConvertionProgress,DataModuleStoredPrograms, UntDataModule, PaymentsPlaneUnit ,
     ExportUnit ,ReserveContUnit, ReserveHistoryUnit;

{$R *.DFM}

{ TFrmCreditManager }

var
  MonthlyAlert : Boolean;
  AlertInterval : Integer;

procedure TFrmCreditManager.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmCreditManagerPage); }
end;

procedure TFrmCreditManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmCreditManagerEvents;
end;

procedure TFrmCreditManager.Initialize;
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

function TFrmCreditManager.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmCreditManager.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmCreditManager.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmCreditManager.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmCreditManager.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmCreditManager.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmCreditManager.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmCreditManager.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmCreditManager.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmCreditManager.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmCreditManager.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmCreditManager.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmCreditManager.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmCreditManager.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmCreditManager.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmCreditManager.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmCreditManager.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmCreditManager.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmCreditManager._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmCreditManager.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmCreditManager.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmCreditManager.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmCreditManager.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmCreditManager.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmCreditManager.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmCreditManager.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmCreditManager.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmCreditManager.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmCreditManager.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmCreditManager.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmCreditManager.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmCreditManager.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmCreditManager.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmCreditManager.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmCreditManager.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmCreditManager.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmCreditManager.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmCreditManager.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmCreditManager.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmCreditManager.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmCreditManager.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmCreditManager.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmCreditManager.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
function TFrmCreditManager.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 7;
begin
  ImageList1.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;
//************************************************************************
function  TFrmCreditManager.GetContractID :LongInt;
begin
  Result :=MainDataModule.Contracts.FieldByName('ID').AsInteger;
end;

function TFrmCreditManager.NewContract : Boolean;
begin
  with  TFrmContract.Create(Self) do
  try
    FOpMode :=omInsert;
    FContractType :=ContractTypeByName('CREDIT');
    Result := ShowModal = mrOk;
  finally
    Release;
  end;
end;
function TFrmCreditManager.EditContract:Boolean;
begin
  with  TFrmContract.Create(Self) do
  try
    FOpMode :=omEdit;
    FContractType :=ContractTypeByName('CREDIT');;
    Result :=(ShowModal=mrOk);
  finally
    Release;
  end;
end;
procedure TFrmCreditManager.PaymentsPlane(ContractID : Integer ; ContractNum : String);
begin
  with  TFrmPaymentPlane.Create(Self) do
  try
    FContractID := ContractID;
    Caption := Caption + ContractNum;
    ShowModal;
  finally
    Release
  end;
end;
procedure TFrmCreditManager.SafeRefresh;
var
   SavePlace :TBookmark;
begin
  with MainDataModule.Contracts do
  begin
    SavePlace :=GetBookmark;
    Refresh;
    try
      GotoBookmark(SavePlace);
     except
       //Null
     end;
  end;
end;
function TFrmCreditManager.PercentConverting:Boolean;
begin
   with  TFrmPercentConvert.Create(Self) do
   try
     Result :=(ShowModal=mrOk);
   finally
    Release;
   end;
end;
function TFrmCreditManager.Prolongation(ContractID :LongInt):Boolean;
begin
  with  TFrmProlongation.Create(Self)  do
  try
    FContractID :=ContractID;
    Result :=(ShowModal=mrOk);
  finally
    Release;  
  end;
end;
procedure TFrmCreditManager.TBFilterClick(Sender: TObject);
begin
//   (Sender as TToolButton).Down :=not (Sender as TToolButton).Down;
   FilterPanel.Visible := (Sender as TToolButton).Down; 
end;

procedure TFrmCreditManager.BtnCloseFilterPanelClick(Sender: TObject);
begin
   FilterPanel.Hide;
   TBFilter.Down :=False;
end;

procedure TFrmCreditManager.TBRefreshClick(Sender: TObject);
begin
    SafeRefresh;
end;

procedure TFrmCreditManager.miContractStateClick(Sender: TObject);
var
  ContractID : Integer;
begin
  ContractID :=GetContractID;
  with TFrmContractState.Create(Self) do
  try
    FContractID :=ContractID;
    ShowModal;
  finally
    Release
  end
end;

procedure TFrmCreditManager.ActiveFormCreate(Sender: TObject);
begin

   MainDataModule :=TMainDataModule.Create(Self);
   ContDataModule :=TContDataModule.Create(Self);
   FrmReferences :=TFrmReferences.Create(Self);
   DataModuleRefer :=TDataModuleRefer.Create(Self);
   FBankDate := GetBankDate;
   FrmProgress :=TFrmProgress.Create(Self);
   FrmExport := TFrmExport.Create(Self);
   ContractsViewer.DataSource :=MainDataModule.DataSrcContracts;
   MonthlyAlert := SBCMGetOption('cmrAlertBeforePayment') = 'ON';
   AlertInterval := SBCMGetOption('cmrAlertDaysInterval');

end;

procedure TFrmCreditManager.miEditContractClick(Sender: TObject);
begin
 if EditContract  then
   SafeRefresh;
end;

procedure TFrmCreditManager.TBReferencesClick(Sender: TObject);
begin
  FrmReferences.ShowModal;
end;

procedure TFrmCreditManager.miInsertClick(Sender: TObject);
begin
 if NewContract then
  MainDataModule.Contracts.Refresh;
end;
function TFrmCreditManager.Tranch(ContractID :LongInt):Boolean;
begin
  with  TFrmTranches.Create(Self) do
  try
    FContractID :=ContractID;
    Result :=(ShowModal=mrOk);
   finally
     Release;
   end;
end;
function TFrmCreditManager.Payment(ContractID :LongInt):Boolean;
begin
  with  TFrmPayments.Create(Self) do
  try
    FContractID :=ContractID;
    Result :=(ShowModal=mrOk);
  finally
    Release;
  end;
end;
function TFrmCreditManager.Expire(ContractID :LongInt) :Boolean;
begin
   with  TFrmExpire.Create(Self) do
   try
     FContractID :=ContractID;
     Result :=(ShowModal=mrOk);
   finally
     Release;
   end;
end;
function TFrmCreditManager.ReserveCont(ContractID :LongInt) :Boolean;
begin
   with  TFrmReserveCont.Create(Self) do
   try
     FContractID :=ContractID;
     Result :=(ShowModal=mrOk);
   finally
     Release;
   end;
end;
procedure TFrmCreditManager.miTranchClick(Sender: TObject);
begin
  if Tranch(GetContractID) then
    SafeRefresh;
end;

procedure TFrmCreditManager.miProlongationClick(Sender: TObject);
begin
  if Prolongation(GetContractID) then
      SafeRefresh;
end;

procedure TFrmCreditManager.miOverdueClick(Sender: TObject);
begin
  if Expire(GetContractID) then
    SafeRefresh;
end;

procedure TFrmCreditManager.miPaymentClick(Sender: TObject);
begin
  if Payment(GetContractID) then
    SafeRefresh;
end;

procedure TFrmCreditManager.miEnableDisableCalculationClick(
  Sender: TObject);
var
   CalculationEnabled :Boolean;
   QueryStr :string;
begin
   CalculationEnabled :=IsCalculationEnabled(GetContractID);
   if  CalculationEnabled  then
     QueryStr :='Are you sure to Disable Calculation for this contract?'
   else
    QueryStr :='Are you sure to Enable Calculation for this contract?';
   if MessageDlg(QueryStr,mtConfirmation,[mbYes,mbNo],0)=mrYes then
    SetCalculationEnabled(GetContractID,not CalculationEnabled);
end;

function TFrmCreditManager.ConvertSelected(ContractID :LongInt):LongInt;
begin
   with  ContDataModule.ConvertingPackage do
    CallProcedure('ConvertingLazyPercents',[
                                  ContractID
                                 ,FBankDate
                                ]);
    Result := 0;
end;
procedure TFrmCreditManager.MouseWheelHandler(var Message: TMessage);
begin
  if ContractsViewer.Focused then
  begin
    ContractsViewer.SelectedRows.Clear;
    with TCMMouseWheel(Message), ContractsViewer.DataSource.DataSet do
      if WheelDelta < 0 then
        Next
      else
        Prior;
  end;
end;

procedure TFrmCreditManager.miSelectAllClick(Sender: TObject);
begin
  with ContractsViewer,SelectedRows,MainDataModule.Contracts do 
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
  end;
end;

procedure TFrmCreditManager.miConvertSelectedClick(Sender: TObject);
const
   ResulTitle = '  : Errors Found On Convertion Percents';
var
  SelRowsCount :Integer;
  SelRowIndex  :Integer;
  Aborted :Integer;
begin
    with ContractsViewer,SelectedRows,DataSource.DataSet  do
    begin
      Aborted :=0;
      with  ContDataModule.ConvertingPackage do
        CallProcedure('DelDefferedTransactions',[]);
        
      SelRowsCount :=Count;
      if   MessageDlg('Convert Percents Now?'
              ,mtConfirmation
              ,[mbYes,mbNo],0
              )<>mrYes then Abort;

      with  FrmProgress,ProgressBar  do
      begin
        Max :=SelRowsCount;
        Position :=0;
        NoteMemo.Lines.Clear;
        NoteMemo.Hide;
        BtnDetails.Enabled :=False;
        FrmProgress.Show;
      end;
      Application.ProcessMessages;
    try
      for  SelRowIndex :=0  to  SelRowsCount-1 do
      try
        GotoBookmark(Pointer(Items[SelRowIndex]));
        FrmProgress.ProgressBar.StepIt;
        FrmProgress.CurrentContractLabel.Caption :=FieldByName('ContractNo').AsString;
        ConvertSelected(GetContractID);
      except
          FrmProgress.NoteMemo.Lines.Add('Could Not Converting Percents for #'
                                +FieldByName('ContractNo').AsString
                              );
          Inc(Aborted);
          Continue;
      end;
    finally
         FrmProgress.ProgressBar.Position :=0;
         FrmProgress.LblResult.Caption :=IntToStr(Aborted)+ResulTitle;
         FrmProgress.BtnDetails.Enabled :=True;
         FrmProgress.CurrentContractLabel.Caption :='';
         FrmProgress.Close;
         if PercentConverting then
           SafeRefresh;
      end;
    end;
end;

function TFrmCreditManager.IFrmCreditManager_Get_Color: OLE_COLOR;
begin

end;

function TFrmCreditManager.IFrmCreditManager_Get_Font: IFontDisp;
begin

end;

procedure TFrmCreditManager.IFrmCreditManager__Set_Font(const Value :IFontDisp);
begin

end;

procedure TFrmCreditManager.IFrmCreditManager_Set_Color(Value :OLE_COLOR);
begin

end;

procedure TFrmCreditManager.IFrmCreditManager_Set_Font(var Value :IFontDisp);
begin

end;

procedure TFrmCreditManager.miNotCalculatedClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked :=not (Sender as TMenuItem).Checked;
   CBNotCalculated.Checked :=(Sender as TMenuItem).Checked;
end;

procedure TFrmCreditManager.miPanelofFilterClick(Sender: TObject);
begin
   FilterPanel.Visible :=not FilterPanel.Visible;
   TBFilter.Down :=FilterPanel.Visible;
end;

procedure TFrmCreditManager.FilterActionExecute(Sender: TObject);

  function  CheckFiltred(IsChecked :Boolean;const FilterStr :String;Args :array of const):String;
  begin
     Result :='';
     if  IsChecked  then
      Result :=Format(FilterStr,Args);
  end;

const
    CurrencyFilter = '(ContractCurrencyID=%d)';
    ContractTypeFilter = '(ContractType=%d)';
    CustomerTypeFilter = '(ClientType=%d)';
    StatusFilter = '((Status=%d)OR(Status=%d)OR(Status=%d))';
var
  S_Calculated :Integer;
  S_Disabled   :Integer;
  S_Unknown    :Integer;
  HasStatusFilter :Boolean;

  CurrencyF :string;
  ContTypeF :string;
  CustTypeF :string;
  StatusF   :string;

  FilterStr :string;
begin
  FilterStr :='';

  with  ContDataModule do
  begin
    CurrencyF :=CheckFiltred(
                     CBCurrency.Checked
                    ,CurrencyFilter
                    ,[Currencys.FieldByName('Valute').AsInteger]
                    );
    ContTypeF :=CheckFiltred(
                     CBContractType.Checked
                    ,ContractTypeFilter
                    ,[CreditTypes.FieldByName('ID').AsInteger]
                    );
    CustTypeF :=CheckFiltred(
                     CBClientType.Checked
                    ,CustomerTypeFilter
                    ,[Categories.FieldByName('ID').AsInteger]
                    );

    S_Calculated :=Word(CBCalculated.Checked)*CBCalculated.Tag;
    S_Disabled   :=Word(CBNotCalculated.Checked)*CBNotCalculated.Tag;
    S_Unknown    :=Word(CBCalcStopped.Checked)*CBCalcStopped.Tag;

    miNotCalculated.Checked :=CBNotCalculated.Checked;
    miCalculateds.Checked :=CBCalculated.Checked;
    miCalculationStopped.Checked :=CBCalcStopped.Checked;

    HasStatusFilter :=True;//(S_Calculated+S_Disabled+S_Unknown)<>0;

    StatusF   :=CheckFiltred(
                     HasStatusFilter
                    ,StatusFilter
                    ,[S_Calculated,S_Unknown,S_Disabled]
                    );

    FilterStr :=CurrencyF;

    if  ContTypeF<>'' then
    if  FilterStr=''  then
      FilterStr :=ContTypeF
    else
      FilterStr :=FilterStr + 'AND' + ContTypeF;

    if  CustTypeF<>'' then
    if  FilterStr=''  then
      FilterStr :=CustTypeF
    else
      FilterStr :=FilterStr + 'AND' +CustTypeF;

    if  StatusF<>''  then
    if  FilterStr='' then
      FilterStr :=StatusF
    else
      FilterStr :=FilterStr + 'AND' + StatusF;
  end;

  with  MainDataModule.Contracts  do
  begin
    Filtered :=False;
    Filter :=FilterStr;
    Filtered :=True;
  end;

end;

procedure TFrmCreditManager.miCalculationStoppedClick(Sender: TObject);
begin
   (Sender as TMenuItem).Checked :=not (Sender as TMenuItem).Checked;
   CBCalcStopped.Checked :=(Sender as TMenuItem).Checked;
end;

procedure TFrmCreditManager.miCalculatedsClick(Sender: TObject);
begin
   (Sender as TMenuItem).Checked :=not (Sender as TMenuItem).Checked;
   CBCalculated.Checked :=(Sender as TMenuItem).Checked;
end;

procedure TFrmCreditManager.CloseCurrentContract1Click(Sender: TObject);
var
   Index :Integer;
   WaitNextConfirm :Boolean;
   ContractID :Integer;
   ContractName :String;
begin
  WaitNextConfirm :=True;
  with  ContractsViewer
         ,SelectedRows
         ,DataSource.DataSet do
  try
    for  Index :=0 to  Count - 1 do
    begin
      GotoBookmark(Pointer(Items[Index]));
      ContractID :=GetContractID;
      ContractName :=FieldByName('ContractNo').AsString;
      
      if  WaitNextConfirm  then
      case MessageDlg(
        Format('Are You Sure to Close  #%S',[ContractName])
       ,mtConfirmation
       ,[mbYes, mbNo ,mbCancel ,mbYesToAll]
       ,0
       )   of
        mrNo       : Continue;
        mrCancel   : Break;
        mrYesToAll : WaitNextConfirm :=False;
      end; //Case
      CloseContract(ContractID);
    end;
  finally
    Clear;
    Refresh;
  end;
end;

procedure TFrmCreditManager.ContractsViewerTitleClick(Column: TColumn);
var
  OrderKind :string;
begin
   if Column.Index = 2 then Exit;
   OrderKind := Copy(Column.Field.Name,10,Length(Column.Field.Name));
   Screen.Cursor := crHourGlass;
   try
       with TOracleDataSet(ContractsViewer.DataSource.DataSet) do
       begin
         if  Active  then  CloseAll;
         SetVariable('OrderKind',OrderKind);
         Open
       end;
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TFrmCreditManager.miExportClick(Sender: TObject);
begin
  FrmExport.ShowModal
end;

procedure TFrmCreditManager.miContractStateDrawItem(Sender: TObject;
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
      Charset := DEFAULT_CHARSET;
      Name := 'Azl Sans Serif';
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
    TextOut(ARect.Right-TextWidth(SText)-7, ARect.Top+1, SText);
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

procedure TFrmCreditManager.miSearchPanelClick(Sender: TObject);
begin
    SearchPanel.Visible := not SearchPanel.Visible
end;

procedure TFrmCreditManager.SearchActionExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do          
  begin
    SearchField := copy(Name,5,length(Name));
    ContractsViewer.SelectedRows.Clear;
    with  TOracleDataSet(ContractsViewer.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Record has reached the End of file.'+#13+'Continue from Top of file?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Record Not Found!',mtInformation,[mbOK],0);
  end;
end;

procedure TFrmCreditManager.EditContractNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13  then
  SearchActionExecute(Sender);
end;

procedure TFrmCreditManager.EditContractNoExit(Sender: TObject);
begin
  with Sender as TEdit do
  Text := '';
end;

procedure TFrmCreditManager.N8Click(Sender: TObject);
begin
  PaymentsPlane(GetContractID,ContractsViewer.DataSource.DataSet.FieldByName('ContractNo').AsString);
end;
{const  DataColIndex = 2;

var
    ImageIndex :Integer;
begin
{  ImageIndex :=-1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
      csUnknown:
        ImageIndex := 0;
      csCalculated:
        ImageIndex := 1;
      csDisabled:
        ImageIndex := 2;
      end;   //Case
      if   (DataCol = DataColIndex)   then
      StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
  //(Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;}

procedure TFrmCreditManager.ContractsViewerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

const  DataColIndex = 2;

var
    ImageIndex :Integer;
begin
  ImageIndex :=-1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
      csUnknown:
        ImageIndex := 0;
      csCalculated:
        ImageIndex := 1;
      csDisabled:
        ImageIndex := 2;
      end;   //Case
      if   (DataCol = DataColIndex)   then
      StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end;

procedure TFrmCreditManager.miReserveContClick(Sender: TObject);
begin
  ReserveCont(GetContractID)
end;

procedure TFrmCreditManager.N9Click(Sender: TObject);
begin
  with TFrmHistory.Create(Self) do
  try
    ShowModal
  finally
    Release
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmCreditManager,
    Class_FrmCreditManager,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

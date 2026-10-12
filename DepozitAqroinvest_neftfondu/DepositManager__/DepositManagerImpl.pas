unit DepositManagerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, DepositManager_TLB, StdVcl, ImgList, ComCtrls, ToolWin,
  ExtCtrls, Menus, Grids, DBGrids, SBPlgAx50_TLB,DB, Buttons, StdCtrls,
  DBViewComboBox, ActnList ,Oracle,OracleData;

const   csUnknown   = -9;
        csCalculated=-10;
        csDisabled  =-11;

type
  TFrmDepositManager = class(TActiveForm, IFrmDepositManager ,IIconExporter)
    ImageList: TImageList;
    MainPopupMenu: TPopupMenu;
    FilterPanel: TPanel;
    PanelMain: TPanel;
    DepositsViewer: TDBGrid;
    miNew: TMenuItem;
    Panel1: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton6: TToolButton;
    ToolButton14: TToolButton;
    ToolButton5: TToolButton;
    TBFilteration: TToolButton;
    miEdit: TMenuItem;
    ActionsMenu: TPopupMenu;
    miDeposit: TMenuItem;
    miWithdraw: TMenuItem;
    miCapitalization: TMenuItem;
    miUntimelyWithdraw: TMenuItem;
    N1: TMenuItem;
    miConvertPercents: TMenuItem;
    N2: TMenuItem;
    miSelectAll: TMenuItem;
    TBCloseDeposit: TToolButton;
    miShowCollection: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    CurrencyViewer: TDBViewComboBox;
    GroupBox2: TGroupBox;
    TypesViewer: TDBViewComboBox;
    GroupBox3: TGroupBox;
    CategoriesViewer: TDBViewComboBox;
    CBCurrency: TCheckBox;
    CBContractType: TCheckBox;
    CBClientType: TCheckBox;
    ActionList1: TActionList;
    FilterAction: TAction;
    ToolButton12: TToolButton;
    N5: TMenuItem;
    miCloseCurrentCont: TMenuItem;
    N6: TMenuItem;
    miDepositMoney: TMenuItem;
    miCapitalizationMoney: TMenuItem;
    miWithdrawMoney: TMenuItem;
    miUntimelyWithdrawMoney: TMenuItem;
    N4: TMenuItem;
    miExport: TMenuItem;
    miShowAdditionalDeposits: TMenuItem;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    CBNotCalculated: TCheckBox;
    CBCalcStopped: TCheckBox;
    CBCalculated: TCheckBox;
    StatusImages: TImageList;
    EnableDisableCalculation1: TMenuItem;
    N7: TMenuItem;
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
    EditLastWCDate: TEdit;
    Panel10: TPanel;
    StaticText5: TStaticText;
    EditFacticalDebt: TEdit;
    Panel11: TPanel;
    StaticText6: TStaticText;
    EditContractAccName: TEdit;
    SearchAction: TAction;
    N8: TMenuItem;
    procedure miNewClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure TBFilterationClick(Sender: TObject);
    procedure miDepositClick(Sender: TObject);
    procedure miWithdrawClick(Sender: TObject);
    procedure miCapitalizationClick(Sender: TObject);
    procedure miConvertPercentsClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure TBCloseDepositClick(Sender: TObject);
    procedure miShowCollectionClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure miExportClick(Sender: TObject);
    procedure miShowAdditionalDepositsClick(Sender: TObject);
    procedure miUntimelyWithdrawClick(Sender: TObject);
    procedure DepositsViewerDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DepositsViewerTitleClick(Column: TColumn);
    procedure EnableDisableCalculation1Click(Sender: TObject);
    procedure miNewDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure SearchActionExecute(Sender: TObject);
    procedure EditContractNoExit(Sender: TObject);
    procedure EditContractNoKeyPress(Sender: TObject; var Key: Char);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFrmDepositManagerEvents;
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
    function  Get_Icon: OLE_HANDLE; safecall;
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
    procedure Set_Visible(Value: WordBool); safecall;  function IFrmDepositManager.Get_Color = IFrmDepositManager_Get_Color;
    function IFrmDepositManager.Get_Font = IFrmDepositManager_Get_Font;
    procedure IFrmDepositManager._Set_Font = IFrmDepositManager__Set_Font;
    procedure IFrmDepositManager.Set_Color = IFrmDepositManager_Set_Color;
    procedure IFrmDepositManager.Set_Font = IFrmDepositManager_Set_Font;

    function IFrmDepositManager_Get_Color: OLE_COLOR; safecall;
    function IFrmDepositManager_Get_Font: IFontDisp; safecall;
    procedure IFrmDepositManager__Set_Font(const Value : IFontDisp); safecall;
    procedure IFrmDepositManager_Set_Color(Value : OLE_COLOR); safecall;
    procedure IFrmDepositManager_Set_Font(var Value : IFontDisp); safecall;

  public
    { Public declarations }
    procedure MouseWheelHandler(var Message: TMessage); override;
    function ConvertDeposits(ContractID :LongInt;HDate :TDateTime) : Integer;
    function  GetContractID :LongInt;
    function  NewContract :Boolean;
    procedure ShowReferences;
    procedure SafeRefresh;
    function  EditContract:Boolean;
    function  UntimelyWithdraw(ContractID : Integer) : Boolean;
    function  DepositMoney(ContractID :LongInt)  :Boolean;
    function  WithDrawMoney(ContractID :LongInt) :Boolean;
    function  Capitalization ( ContractID : LongInt ) : Boolean ;
    function  ShowCollections(ContractID : LongInt) : Boolean;
    procedure Initialize; override;
  end;

implementation

uses
     ComObj, ComServ,DataModuleStoredPrograms,StoredProgramsUnit,
     UntReferences,DepositDataModuleUnit,NewDepositUnit,UnitDepositMoney,
     WithDrawUnit,CapitalizationUnit, UntDataModule, ProgressUnit,
     CollectionUnit,ExportUnit , TrafficUnit ,UntimelyWithdrawUnit;

{$R *.DFM}

{ TFrmDepositManager }

procedure TFrmDepositManager.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmDepositManagerPage); }
end;

procedure TFrmDepositManager.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmDepositManagerEvents;
end;

procedure TFrmDepositManager.Initialize;
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

function TFrmDepositManager.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmDepositManager.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmDepositManager.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmDepositManager.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmDepositManager.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmDepositManager.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmDepositManager.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmDepositManager.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmDepositManager.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmDepositManager.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmDepositManager.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmDepositManager.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmDepositManager.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmDepositManager.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmDepositManager.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmDepositManager.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmDepositManager.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmDepositManager.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmDepositManager._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmDepositManager.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmDepositManager.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmDepositManager.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmDepositManager.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmDepositManager.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmDepositManager.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmDepositManager.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmDepositManager.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmDepositManager.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmDepositManager.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmDepositManager.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmDepositManager.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmDepositManager.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmDepositManager.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmDepositManager.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmDepositManager.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmDepositManager.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmDepositManager.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmDepositManager.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmDepositManager.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmDepositManager.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmDepositManager.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmDepositManager.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmDepositManager.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
function TFrmDepositManager.IFrmDepositManager_Get_Color: OLE_COLOR;
begin

end;

function TFrmDepositManager.IFrmDepositManager_Get_Font: IFontDisp;
begin

end;

procedure TFrmDepositManager.IFrmDepositManager__Set_Font(const Value : IFontDisp);
begin

end;

procedure TFrmDepositManager.IFrmDepositManager_Set_Color(Value : OLE_COLOR);
begin

end;

procedure TFrmDepositManager.IFrmDepositManager_Set_Font(var Value : IFontDisp);
begin

end;


        {******************************************************}
        {********(c) Smart Systems Technology LTD.*************}
        {********************************1996-2002*************}
        {******************************************************}
        {******************************************************}

function TFrmDepositManager.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 3;
begin
  StatusImages.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;
procedure TFrmDepositManager.miNewClick(Sender: TObject);
begin
  if  NewContract  then
   DepositsViewer.DataSource.DataSet.Refresh;
end;
procedure TFrmDepositManager.ShowReferences;
begin
  FrmReferences.ShowModal;
end;

procedure TFrmDepositManager.SafeRefresh;
var
   SavePlace :TBookmark;
begin
  with DepositsViewer.DataSource.DataSet do
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

function TFrmDepositManager.GetContractID :LongInt;
begin
    Result :=DepositsViewer.DataSource.DataSet.FieldByName('ID').AsInteger;
end;

function TFrmDepositManager.NewContract :Boolean;
begin
  with TFrmNewDeposit.Create(Self) do
  try
    FOperationMode :=omInsert;
    FContractType:=ContractTypeByName('DEPOSIT');
    Result :=ShowModal=mrOk;
  finally
    Release;
  end;
end;

function TFrmDepositManager.EditContract:Boolean;
begin
  with TFrmNewDeposit.Create(Self) do
  try
    FOperationMode :=omEdit;
    FContractID :=GetContractID;
    FContractType:=ContractTypeByName('DEPOSIT');
    Result :=ShowModal=mrOk;
  finally
    Release;
  end;
end;

function  TFrmDepositManager.DepositMoney(ContractID :LongInt):Boolean;
begin
  with  TFrmDepositMoney.Create(Self)  do
  try
    FContractID :=ContractID;
    Result :=ShowModal=mrOk;
  finally
    Release;
  end;
end;

function  TFrmDepositManager.WithDrawMoney(ContractID :LongInt) :Boolean;
begin
   with  TFrmWithDraw.Create(Self) do
   try
     FContractID :=ContractID;
     Result :=ShowModal=mrOk;
   finally
      Release;
   end;
end;

function  TFrmDepositManager.UntimelyWithdraw(ContractID : Integer) : Boolean;
begin
  with  TFrmUntimelyWithdraw.Create(Self) do
  try
   FContractID := ContractID;
   Result := ShowModal = mrOk;
  finally
    Release
  end
end;

function  TFrmDepositManager.Capitalization ( ContractID : LongInt ) : Boolean;
begin
  with  TFrmCapitalization.Create(Self) do
  try
    FContractID := ContractID;
    Result := ShowModal = mrOK;
  finally
    Release;
  end;
end;

procedure TFrmDepositManager.MouseWheelHandler(var Message: TMessage);
begin
  if DepositsViewer.Focused then
  begin
    DepositsViewer.SelectedRows.Clear;
    with TCMMouseWheel(Message), DepositsViewer.DataSource.DataSet do
      if WheelDelta < 0 then
        Next
      else
        Prior;
  end;
end;

function TFrmDepositManager.ConvertDeposits(ContractID :LongInt;HDate :TDateTime) : Integer;
begin
  with DataModDeposits.DepositsConvPackage do
    Result := CallIntegerFunction('ConverDeposits',[
                  ContractID
                 ,HDate
                 ]);
end;

function  TFrmDepositManager.ShowCollections(ContractID : LongInt) : Boolean;
begin
  with  TFrmCollection.Create(Self) do
  try
    FContractID := ContractID;
    Result := ShowModal = mrOk;
  finally
    Release
  end;
end;

                  {********************************}


procedure TFrmDepositManager.ActiveFormCreate(Sender: TObject);
begin
   FrmReferences   := TFrmReferences.Create(Self);
   DataModuleRefer := TDataModuleRefer.Create(Self);
   DepositDataModule := TDepositDataModule.Create(Self);
   DepositsViewer.DataSource := DepositDataModule.DataSrcDeposit;
   ProgressForm := TProgressForm.Create(Self);
   FrmExport := TFrmExport.Create(Self);
   DataModDeposits := TDataModDeposits.Create(Self)
end;

procedure TFrmDepositManager.ToolButton11Click(Sender: TObject);
begin
  ShowReferences
end;

procedure TFrmDepositManager.ToolButton7Click(Sender: TObject);
begin
  DepositsViewer.SelectedRows.Clear;
  DepositsViewer.DataSource.DataSet.Refresh;
end;

procedure TFrmDepositManager.miEditClick(Sender: TObject);
begin
   if  EditContract  then
    DepositsViewer.DataSource.DataSet.Refresh;
end;

procedure TFrmDepositManager.TBFilterationClick(Sender: TObject);
begin
   FilterPanel.Visible :=not FilterPanel.Visible;
   TBFilteration.Down :=FilterPanel.Visible;
end;

procedure TFrmDepositManager.miDepositClick(Sender: TObject);
begin
  if  DepositMoney(GetContractID)  then
    SafeRefresh;
end;

procedure TFrmDepositManager.miWithdrawClick(Sender: TObject);
begin
  if WithDrawMoney(GetContractID) then
    SafeRefresh;
end;

procedure TFrmDepositManager.miCapitalizationClick(Sender: TObject);
begin
   if Capitalization(GetContractID) then
     SafeRefresh;
end;

procedure TFrmDepositManager.miConvertPercentsClick(Sender: TObject);
const
   NoErrorTitle         = ' Converting Percents succesful processed.';
   ResulTitle           = ' "Errors" Found On Converting Percents! ';
   CapitalizationsTitle = ' %d Capitalizations Processed .';
   WithdrawTitle        = ' %d Withdraws Processed .';
var
  SelRowsCount :Integer;
  SelRowIndex  :Integer;
  Aborted , ConvResult :Integer;
  CapitalizationCount,WithdrawCount :Integer;
  ErrMessage : String;
  HDate : TDateTime;
begin
    with DepositsViewer,SelectedRows,DataSource.DataSet  do
    begin
      Aborted :=0;
      CapitalizationCount :=0;
      WithdrawCount := 0;
      HDate := GetBankDate;
      SelRowsCount :=Count;
      if   MessageDlg('Convert Percents Now?'
              ,mtConfirmation
              ,[mbYes,mbNo],0
              )<>mrYes then Abort;

      with  ProgressForm,ProgressBar  do
      begin
        Max :=SelRowsCount;
        Position :=0;
        DetailsMemo.Lines.Clear;
        DetailsMemo.Hide;
        BtnDetails.Enabled :=False;
        ProgressForm.Show;
        STContractsCount.Caption := Format('Мцгавилялярин сайы %d',[SelRowsCount]);
      end;
      Application.ProcessMessages;
    try
      for  SelRowIndex :=0  to  SelRowsCount-1 do
      try
        GotoBookmark(Pointer(Items[SelRowIndex]));
        ProgressForm.ProgressBar.StepIt;
        ProgressForm.CurrentDeposit.Caption :=FieldByName('ContractNo').AsString;
        ConvResult := ConvertDeposits(GetContractID,HDate);
        case ConvResult of
         2 :  INC(WithdrawCount) ;
         1 :  INC(CapitalizationCount) ;
        end;
      except
        on E:EOracleError do
        begin
          ErrMessage := E.Message;
          ErrMessage := copy(ErrMessage,0,Pos('^',ErrMessage));
          ProgressForm.DetailsMemo.Lines.Add(' #'
                                +FieldByName('ContractNo').AsString +' << ' + ErrMessage + ' >> '
                              );
          ProgressForm.DetailsMemo.Lines.Add('');
          Inc(Aborted);
          Continue;
        end;
      end;
    finally
         with ProgressForm do
         begin
           ProgressBar.Position :=0;
           if Aborted <> 0 then
           begin
             LblResult.Font.Color := clRed;
             LblResult.Caption :=IntToStr(Aborted)+ResulTitle
           end
           else
           begin
             LblResult.Font.Color := clGreen;
             LblResult.Caption := NoErrorTitle;
           end;
           STCapitalizationsCount.Caption := Format(CapitalizationsTitle,[CapitalizationCount]);
           STWithdrawsCount.Caption := Format(WithdrawTitle,[WithdrawCount]);
           BtnDetails.Enabled :=True;
           CurrentDeposit.Caption :='';
         end;
         SafeRefresh;
      end;
    end;
end;

procedure TFrmDepositManager.miSelectAllClick(Sender: TObject);
begin
  with DepositsViewer,SelectedRows,DataSource.DataSet do
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

procedure TFrmDepositManager.TBCloseDepositClick(Sender: TObject);
var
   Index :Integer;
   WaitNextConfirm :Boolean;
   ContractID :Integer;
   ContractName :String;
begin
  WaitNextConfirm :=True;
  with  DepositsViewer
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
      CloseDeposit(ContractID);
    end;
  finally
    Clear;
    Refresh;
  end;
end;
procedure TFrmDepositManager.miShowCollectionClick(Sender: TObject);
begin
  ShowCollections(GetContractID);
end;

procedure TFrmDepositManager.FilterActionExecute(Sender: TObject);

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

  with  DataModDeposits do
  begin
    CurrencyF :=CheckFiltred(
                     CBCurrency.Checked
                    ,CurrencyFilter
                    ,[CurrencysData.FieldByName('CurrencyID').AsInteger]
                    );
    ContTypeF :=CheckFiltred(
                     CBContractType.Checked
                    ,ContractTypeFilter
                    ,[DepositTypes.FieldByName('ID').AsInteger]
                    );
    CustTypeF :=CheckFiltred(
                     CBClientType.Checked
                    ,CustomerTypeFilter
                    ,[CategoriesData.FieldByName('ID').AsInteger]
                    );

    S_Calculated :=Word(CBCalculated.Checked)*CBCalculated.Tag;
    S_Disabled   :=Word(CBNotCalculated.Checked)*CBNotCalculated.Tag;
    S_Unknown    :=Word(CBCalcStopped.Checked)*CBCalcStopped.Tag;


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

  with  DepositsViewer.DataSource.DataSet  do
  begin
    Filtered :=False;
    Filter :=FilterStr;
    Filtered :=True;
  end;

end;

procedure TFrmDepositManager.miExportClick(Sender: TObject);
begin
  FrmExport.ShowModal;
end;

procedure TFrmDepositManager.miShowAdditionalDepositsClick(
  Sender: TObject);
begin
  with TFrmTraffic.Create(Self) do
  try
    FContractID := GetContractID;
    ShowModal;
  finally
    Release
  end;
end;

procedure TFrmDepositManager.miUntimelyWithdrawClick(Sender: TObject);
begin
  UntimelyWithdraw(GetContractID);
end;

procedure TFrmDepositManager.DepositsViewerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
    DataColIndex = 1;
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
      if   (DataCol = 1)   then
        StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TFrmDepositManager.DepositsViewerTitleClick(Column: TColumn);
var
  OrderKind :string;
begin
   if Column.Index = 1 then Exit;
   OrderKind := Copy(Column.Field.Name,9,Length(Column.Field.Name));
   Screen.Cursor := crHourGlass;
   try
       with TOracleDataSet(DepositsViewer.DataSource.DataSet) do
       begin
         if  Active  then  CloseAll;
         SetVariable('OrderClause',OrderKind);
         Open
       end;
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TFrmDepositManager.EnableDisableCalculation1Click(
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

procedure TFrmDepositManager.miNewDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with ACanvas.Font do
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

procedure TFrmDepositManager.SearchActionExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    DepositsViewer.SelectedRows.Clear;
    with  TOracleDataSet(DepositsViewer.DataSource.DataSet) do
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

procedure TFrmDepositManager.EditContractNoExit(Sender: TObject);
begin
  with Sender as TEdit do
  Text := '';

end;

procedure TFrmDepositManager.EditContractNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13  then
  SearchActionExecute(Sender);
end;

procedure TFrmDepositManager.N8Click(Sender: TObject);
begin
  SearchPanel.Visible := not SearchPanel.Visible
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmDepositManager,
    Class_FrmDepositManager,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

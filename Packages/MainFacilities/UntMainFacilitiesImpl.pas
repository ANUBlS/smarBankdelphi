                                    {=============================================}
                                    {               Assets 1.0                    }
                                    {                                             }
                                    {             Nariman Narimanov               }
                                    {          Smart Systems Technolgy LTD.       }
                                    {                              (1995-2003)    }
                                    {=============================================}

// Balance accounts for Main Facilities:
//          2911,2921,2931,2941,2991,9121,9122,9123,9124,9129,2912,2922,2932,2924,2992,2912,2922,2932,2942,2992

unit UntMainFacilitiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MainFacilitiesProj_TLB, StdVcl, StdCtrls, Grids,
  DBGrids, ExtCtrls, ImgList, ComCtrls, ToolWin, Mask, DBCtrls, Buttons,
  Excel97, OleServer,SBPlgAx50_TLB, ActnList, Menus,DB,Oracledata;


const
      csNewWares = 0;
      csOldWares = 1;
      csDisableCalculate = 2;
const
      ZoomIndex =22;       

type
    TObjectKind = (okWares , okGroups);
    TOperationMode = (omAdd , omEdit);
type
  TMainFacilities = class(TActiveForm, IMainFacilities,IIconExporter)
    Panel1: TPanel;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButtonAdd: TToolButton;
    ToolButtonTakeOff: TToolButton;
    ToolButton4: TToolButton;
    ToolButtonEdit: TToolButton;
    PanelWares: TPanel;
    WaresViewer: TDBGrid;
    ImageList: TImageList;
    ToolButton9: TToolButton;
    PanelGoups: TPanel;
    GroupsViewer: TDBGrid;
    Splitter: TSplitter;
    ToolButton17: TToolButton;
    ToolButton2: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    PopupMenuWares: TPopupMenu;
    Traffic1: TMenuItem;
    Inventarcard1: TMenuItem;
    ActionListWares: TActionList;
    ActionTraffic: TAction;
    ActionInventarCard: TAction;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButtonTraffic: TToolButton;
    ActionUpdate: TAction;
    Update1: TMenuItem;
    ActionPrint: TAction;
    TakOff1: TMenuItem;
    ActionTakeOff: TAction;
    Line1: TMenuItem;
    PanelSearch: TPanel;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ActionSearch: TAction;
    Print1: TMenuItem;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Line2: TMenuItem;
    Search1: TMenuItem;
    N1: TMenuItem;
    ActionSpeedSeacrh: TAction;
    Panel6: TPanel;
    EFirst_Price: TEdit;
    StaticText1: TStaticText;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EBalance_Price: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EAllAmort: TEdit;
    ActionCalculatePercents: TAction;
    ActionZoom: TAction;
    Zoom1: TMenuItem;
    ActionListGroups: TActionList;
    ActAdd: TAction;
    ActUpdate: TAction;
    ActZoom: TAction;
    PopupMenuGroups: TPopupMenu;
    Add1: TMenuItem;
    Update2: TMenuItem;
    Zoom2: TMenuItem;
    N3: TMenuItem;
    ActionAdd: TAction;
    Add2: TMenuItem;
    ImageState: TImageList;
    ToolButton8: TToolButton;
    ActDelete: TAction;
    N4: TMenuItem;
    N2: TMenuItem;
    TotalResultPanel: TPanel;
    Panel2: TPanel;
    StaticText5: TStaticText;
    DBEdit3: TDBEdit;
    Panel12: TPanel;
    StaticText6: TStaticText;
    DBEdit4: TDBEdit;
    Panel13: TPanel;
    StaticText7: TStaticText;
    DBEdit5: TDBEdit;
    Panel14: TPanel;
    StaticText8: TStaticText;
    DBEdit6: TDBEdit;
    Panel3: TPanel;
    StaticText9: TStaticText;
    DBEdit7: TDBEdit;
    Panel10: TPanel;
    StaticText10: TStaticText;
    DBEdit8: TDBEdit;
    Panel5: TPanel;
    Edit1: TEdit;
    StaticText11: TStaticText;
    NFirst: TMenuItem;
    NLast: TMenuItem;
    ActionSelectAll: TAction;
    N5: TMenuItem;
    Yekun1: TMenuItem;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure GroupsViewerEnter(Sender: TObject);
    procedure WaresViewerEnter(Sender: TObject);
    procedure GroupsViewerDblClick(Sender: TObject);
    procedure WaresViewerDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure WaresViewerTitleClick(Column: TColumn);
    procedure ToolButton16Click(Sender: TObject);
    procedure WaresViewerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionInventarCardExecute(Sender: TObject);
    procedure ActionTrafficExecute(Sender: TObject);
    procedure ActionUpdateExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionTakeOffExecute(Sender: TObject);
    procedure EFirst_PriceChange(Sender: TObject);
    procedure EFirst_PriceExit(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure Traffic1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure ActionSpeedSeacrhExecute(Sender: TObject);
    procedure EFirst_PriceKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCalculatePercentsExecute(Sender: TObject);
    procedure ActionZoomExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActDeleteExecute(Sender: TObject);
    procedure NFirstClick(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure WaresViewerExit(Sender: TObject);
    procedure Yekun1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IMainFacilitiesEvents;
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
    function Get_Icon: OLE_HANDLE; safecall;
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
    Rate :array of longint;
    ObjectKind :TObjectKind;
    OpeartionMode :TOperationMode;
    procedure SumGroupDetailsForTax(GroupsID :integer; var FirstPrice, BalancePrice ,AllTaxAmort ,TaxAmort :real);
    procedure SumGroupDetails(GroupsID :integer; var FirstPrice, BalancePrice ,AllAmort ,Remainder :real);
    procedure SumModernedWares(GroupsID :integer; var ModernSumma :real);
    procedure SumRepairedWares(GroupsID :integer; var RepairSumma :real);
    function GetPresentDate :TDateTime;
    procedure StopCalculate(ObjectID :longint);
    procedure delete_MainGroup(GroupID :longint);
    procedure Initialize; override;
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;
var
   MainFacilities:TMainFacilities;

implementation

uses ComObj, ComServ, MFDataModule, UntAddWares,
  UntAddGroups,UntDelWares, UntQuery, UntPrint, InventarCard, UntRptMainF,
  UntTaxPercents, UntTraffics, UntCloseYear,UntMainTransactions;

{$R *.DFM}

{ TMainFacilities }

function TMainFacilities.Get_Icon: OLE_HANDLE;
const
  ImageIndex =8;
begin
  ImageList.GetIcon(ImageIndex,Icon);
  Result := Icon.Handle;
end;

procedure TMainFacilities.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MainFacilitiesPage); }
end;

procedure TMainFacilities.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMainFacilitiesEvents;
end;

procedure TMainFacilities.Initialize;
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

function TMainFacilities.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMainFacilities.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMainFacilities.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMainFacilities.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMainFacilities.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMainFacilities.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMainFacilities.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMainFacilities.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMainFacilities.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMainFacilities.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMainFacilities.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMainFacilities.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMainFacilities.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMainFacilities.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMainFacilities.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMainFacilities.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMainFacilities.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMainFacilities.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMainFacilities._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainFacilities.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMainFacilities.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMainFacilities.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMainFacilities.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMainFacilities.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMainFacilities.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMainFacilities.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMainFacilities.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMainFacilities.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMainFacilities.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMainFacilities.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMainFacilities.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMainFacilities.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMainFacilities.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMainFacilities.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMainFacilities.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMainFacilities.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMainFacilities.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainFacilities.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMainFacilities.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMainFacilities.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMainFacilities.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMainFacilities.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMainFacilities.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

//********************************************* { Main } **************************************************************

function TMainFacilities.GetPresentdate :TDateTime;
begin
 with MainFDataModule.OPViewWares do
  result :=CallDateFunction('GetPresentDate',[]);
end;

procedure TMainFacilities.delete_MainGroup(GroupID :longint);
begin
 with MainFDataModule,OPViewWares do
  CallProcedure('delete_MainGroup',[GroupID]);
end;

procedure TMainFacilities.StopCalculate(ObjectID :longint);
begin
 with MainFDataModule.OPViewWares do
  CallProcedure('StopCalculate',[ObjectID]);
end;

procedure TMainFacilities.MouseWheelHandler(var Message: TMessage);
begin
 inherited;
 if WaresViewer.Focused then
  begin
   WaresViewer.SelectedRows.Clear;
   with TCMMouseWheel(Message), WaresViewer.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
  end;
end;


procedure TMainFacilities.SumGroupDetails(GroupsID :integer;var FirstPrice, BalancePrice ,AllAmort ,Remainder :Real);
begin
 with MainFDataModule.OPViewWares do
   begin
    CallProcedure('SumGroupDetails',[GroupsID, FirstPrice, BalancePrice ,AllAmort ,Remainder]);
    FirstPrice :=GetParameter(1);
    BalancePrice :=GetParameter(2);
    AllAmort :=GetParameter(3);
    Remainder :=GetParameter(4);
   end;
end;

procedure TMainFacilities.SumGroupDetailsForTax(GroupsID :integer; var FirstPrice, BalancePrice ,AllTaxAmort ,TaxAmort :real);
begin
with MainFDataModule.OPViewWares do
   begin
    CallProcedure('SumGroupDetailsForTax',[GroupsID, FirstPrice, BalancePrice ,AllTaxAmort ,TaxAmort]);
    FirstPrice :=GetParameter(1);
    BalancePrice :=GetParameter(2);
    AllTaxAmort :=GetParameter(3);
    TaxAmort :=GetParameter(4);
   end;
end;

procedure TMainFacilities.SumModernedWares(GroupsID :integer; var ModernSumma :real);
begin
  with MainFDataModule.OPViewWares do
   begin
    CallProcedure('SumModernedWares',[GroupsID,ModernSumma]);
    ModernSumma :=GetParameter(1);
   end;
end;

procedure TMainFacilities.SumRepairedWares(GroupsID :integer; var RepairSumma :real);
begin
with MainFDataModule.OPViewWares do
   begin
    CallProcedure('SumRepairedWares',[GroupsID,RepairSumma]);
    RepairSumma :=GetParameter(1);
   end;
end;

procedure TMainFacilities.ActiveFormCreate(Sender: TObject);
begin
 MainFacilities :=Self;
 MainFDataModule :=TMainFDataModule.Create(self);

 RptInventarCard :=TRptInventarCard.Create(Self);
 RptDepartments :=TRptDepartments.Create(Self);
 FrmAddWares :=TFrmAddWares.Create(self);
 FrmAddGroups :=TFrmAddGroups.Create(self);
 FrmDelWares :=TFrmDelWares.Create(self);
 FrmQuery :=TFrmQuery.Create(self); //Close day

 MainFDataModule.ViewGroup.Open;
 MainFDataModule.ViewWares.Open;
 MainFDataModule.ODSSumModWares.Open;
 MainFDataModule.ODSSumRepair.Open;
 MainFDataModule.ODSSumWares.Open;
 //MainFDataModule.M1.Open;
 //MainFDataModule.R1.Open;
 MainFDataModule.ODSTakeDepartmentID.Open;
 MainFDataModule.ODSTakeGroupID.Open;
 MainFDataModule.ODSMODERN.Open;
 MainFDataModule.ODSREPAIR.Open;
 MainFDataModule.ODSWClose.Open;

  With MainFDataModule.ODSDepartments do
   begin
    Open;
    First;
    While not EOF do
     begin
      FrmAddWares.CBDepartments.Items.Add(FieldByName('Department').AsString);
      Next;
     end;
   end;
  ObjectKind :=okGroups;
end;

procedure TMainFacilities.ActiveFormDestroy(Sender: TObject);
begin
  MainFacilities.Free;
end;

procedure TMainFacilities.ToolButton7Click(Sender: TObject);
begin
 try
  FrmTransactions :=TFrmTransactions.Create(self);
  FrmTransactions.ShowModal;
 finally
  FrmTransactions.Free;
 end;
end;

procedure TMainFacilities.GroupsViewerEnter(Sender: TObject);
begin
 ObjectKind :=okGroups;
end;

procedure TMainFacilities.WaresViewerEnter(Sender: TObject);
begin
 ObjectKind :=okWares;
end;

procedure TMainFacilities.GroupsViewerDblClick(Sender: TObject);
begin
 OpeartionMode := omEdit;
 FrmAddGroups.ShowModal;
end;

procedure TMainFacilities.WaresViewerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 with WaresViewer do
 begin
  if MainFDataModule.ViewWares.RecordCount >0 then
   begin
    IF (DataCol=2) then
     case MainFDataModule.ViewWares.FieldByName('Close_format').AsInteger of
       csNewWares : ImageState.Draw(Canvas,Rect.left+2,Rect.top,csNewWares,true);
       csOldWares : ImageState.Draw(Canvas,Rect.left+2,Rect.top,csOldWares,true);
       csDisableCalculate : ImageState.Draw(Canvas,Rect.left+2,Rect.top,csDisableCalculate,true);
     end
    ELSE
     DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
 end;
end;

procedure TMainFacilities.WaresViewerTitleClick(Column: TColumn);
var
   TitleName :string;
begin
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crHourGlass;
  TitleName :=Column.FieldName;
  try
   with MainFDataModule.ViewWares do
    begin
     SetVariable('Title',TitleName);
     Refresh;
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TMainFacilities.ToolButton16Click(Sender: TObject);
begin
 try
//  with TFrmTaxPercents.Create(self) do
 //  ShowModal;
  FrmTaxPercents :=TFrmTaxPercents.Create(self);
  FrmTaxPercents.ShowModal;
 finally
  FrmTaxPercents.Release;
 end;
end;

procedure TMainFacilities.WaresViewerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key =VK_F8) then
 if MessageDlg('Do you want delete this thing?',mtConfirmation,mbYesNoCancel,0)=mrYes then
  with MainFDataModule, OPViewWares, ViewWares do
   begin
    CallProcedure('delete_wares',[ViewWares.FieldByName('ID').AsInteger]);
    Refresh;
   end;
end;

procedure TMainFacilities.ActionInventarCardExecute(Sender: TObject);
var
   IDs : WideString;
   RCount, i: integer;
   SavePlace :Pointer;
begin
if (WaresViewer.DataSource.DataSet.IsEmpty) then Exit;
 IDs :='';
 with MainFDataModule, WaresViewer, DataSource.DataSet  do
  begin
   SavePlace :=ViewWares.GetBookMark;
   try
    ODSMODERN.Close;
    ODSMODERN.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
    ODSMODERN.Open;
    ODSREPAIR.Close;
    ODSREPAIR.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
    ODSREPAIR.Open;

    RCount :=SelectedRows.Count - 1;
    if RCount <=0 then
     IDs :=' (ID='+FieldByName('ID').AsString+')'
    else
    for i :=0 to  RCount do
    begin
      GotoBookmark(Pointer(SelectedRows.Items[i]));
      if  IDs = '' then
       IDs :=' (ID='+FieldByName('ID').AsString+')'
      else
       IDs :=IDs+' OR (ID='+FieldByName('ID').AsString+')';
    end;

    Filter:=IDs;
    Filtered:=True;
    RPTInventarCard.Preview;
   finally
    Filtered:=False;
    SelectedRows.Clear;
    GotoBookmark(SavePlace);
    FreeBookmark(SavePlace);
   end;
  end;
end;

procedure TMainFacilities.ActionTrafficExecute(Sender: TObject);
begin
 if (MainFDataModule.ViewWares.IsEmpty) then Exit;
 QRTraffics :=TQRTraffics.Create(self);
  with QRTraffics, TOracleDataSet(DataSet) do
   try
    Close;
    SetVariable('WaresID',MainFDataModule.ViewWares.FieldByName('ID').AsInteger);
    Open;
    Preview;
   finally
    QRTraffics.Free;
    Close;
   end;
end;

procedure TMainFacilities.ActionUpdateExecute(Sender: TObject);
begin
 OpeartionMode :=omEdit;
 if ObjectKind =okGroups then FrmAddGroups.ShowModal;
 if not(MainFDataModule.ViewWares.IsEmpty) and (ObjectKind =okWares) then
  begin
   FrmAddWares.TitlePanel.Caption:='ясас в€саитл€рин редакт€ олунмасы';
   FrmAddWares.ShowModal;
  end;
end;

procedure TMainFacilities.ActionPrintExecute(Sender: TObject);
begin
 try
  FrmPrint :=TFrmPrint.Create(self);
  FrmPrint.ShowModal;
 finally
  FrmPrint.Free;
 end;
end;

procedure TMainFacilities.ActionTakeOffExecute(Sender: TObject);
begin
 if not(MainFDataModule.ViewWares.IsEmpty) then
  FrmDelWares.ShowModal;
end;

procedure TMainFacilities.EFirst_PriceChange(Sender: TObject);
//var
  //FName :string;
begin
//  FName :=copy((Sender as TEdit).Name,2,Length((Sender as TEdit).Name));
 // Wares.DataSource.DataSet.Locate(FName,(Sender as TEdit).Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TMainFacilities.EFirst_PriceExit(Sender: TObject);
begin
  with Sender as TEdit do
    Text := '';
end;

procedure TMainFacilities.ActionSearchExecute(Sender: TObject);
begin
 PanelSearch.Visible :=not PanelSearch.Visible;
end;

procedure TMainFacilities.ToolButton25Click(Sender: TObject);
begin
 try
  FrmSetCloseYear :=TFrmSetCloseYear.Create(self);
  FrmSetCloseYear.ShowModal;
 finally
  FrmSetCloseYear.Free;
 end;
end;

procedure TMainFacilities.Traffic1DrawItem(Sender: TObject;
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

procedure TMainFacilities.ActionSpeedSeacrhExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];
  
  with Sender as TEdit  do
  begin
    SearchField := copy(Name,2,length(Name));

    with  TOracleDataSet(WaresViewer.DataSource.DataSet) do
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
    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Record Not Found!',mtInformation,[mbOK],0);
 end;
end;

procedure TMainFacilities.EFirst_PriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13  then
   ActionSpeedSeacrhExecute(Sender);
end;

procedure TMainFacilities.ActionCalculatePercentsExecute(Sender: TObject);
begin
 FrmQuery.ShowModal;
end;

procedure TMainFacilities.ActionZoomExecute(Sender: TObject);
begin
 case ObjectKind of
  okWares:
    begin
     PanelGoups.Visible :=not PanelGoups.Visible;
     Splitter.Enabled :=not Splitter.Enabled;
     (Sender as TAction).ImageIndex :=ZoomIndex + Word(not PanelGoups.Visible);
    end;
  okGroups:
    begin
     PanelWares.Visible :=not PanelWares.Visible;
     Splitter.Enabled :=not Splitter.Enabled;
    end;
 end;
end;

procedure TMainFacilities.ActionAddExecute(Sender: TObject);
begin
 OpeartionMode :=omAdd;
  case ObjectKind of
   okGroups : FrmAddGroups.ShowModal;
   okWares  : FrmAddWares.ShowModal;
  end;
  FrmAddWares.TitlePanel.Caption:='ясас в€саитл€рин €лав€ олунмасы';
end;

procedure TMainFacilities.ActDeleteExecute(Sender: TObject);
var
  GroupID :longint;
begin
 with GroupsViewer.DataSource.DataSet do
  begin
   GroupID :=FieldByName('ID').AsInteger;
   try
    delete_MainGroup(GroupID);
    DisableControls;
    Refresh;
   finally
    EnableControls;
   end;
  end;
end;

procedure TMainFacilities.NFirstClick(Sender: TObject);
begin
 if TMenuItem(Sender).Tag =1 then
  WaresViewer.DataSource.DataSet.First
 else
  WaresViewer.DataSource.DataSet.Last;
end;

procedure TMainFacilities.ActionSelectAllExecute(Sender: TObject);
begin
 with WaresViewer, SelectedRows, DataSource.DataSet do
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

procedure TMainFacilities.WaresViewerExit(Sender: TObject);
begin
 TDBGrid(Sender).SelectedRows.Clear;
end;

procedure TMainFacilities.Yekun1Click(Sender: TObject);
begin
 TotalResultPanel.Visible :=not TotalResultPanel.Visible;
 TMenuItem(Sender).Checked :=TotalResultPanel.Visible;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMainFacilities,
    Class_MainFacilities,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

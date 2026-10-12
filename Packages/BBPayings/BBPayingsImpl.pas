unit BBPayingsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, BBPayings_TLB, StdVcl, ComCtrls, ToolWin, ImgList,
  Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, ExcelExporter, CMExcelExport;

type
  TBBPayingsForm = class(TActiveForm, IBBPayingsForm)
    ToolBar1: TToolBar;
    ImageList: TImageList;
    BtnEdit: TToolButton;
    BtnDel: TToolButton;
    BtnConfirm: TToolButton;
    BtnRefresh: TToolButton;
    BtnAdd: TToolButton;
    DBGridContracts: TDBGrid;
    PanelSettings: TPanel;
    BtnFilterPanel: TToolButton;
    GBoxDate: TGroupBox;
    DTPickBegin: TDateTimePicker;
    DTPickend: TDateTimePicker;
    GBoxSrvType: TGroupBox;
    ChBoxSrvType: TCheckBox;
    CBoxSrvType: TDBLookupComboBox;
    BtnExcel: TToolButton;
    ExcelExport: TCMExcelExport;
    GBoxConfirmed: TGroupBox;
    ChBoxConfirmed: TCheckBox;
    ChBoxNotConfirmed: TCheckBox;
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGridContractsTitleClick(Column: TColumn);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure DBGridContractsDblClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnConfirmClick(Sender: TObject);
    procedure DBGridContractsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnFilterPanelClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IBBPayingsFormEvents;
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
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, UnitDataModBBPayings, UnitBBPayingAdd, SBCore;

{$R *.DFM}

{ TBBPayingsForm }

procedure TBBPayingsForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_BBPayingsFormPage); }
end;

procedure TBBPayingsForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IBBPayingsFormEvents;
end;

procedure TBBPayingsForm.Initialize;
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

function TBBPayingsForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TBBPayingsForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TBBPayingsForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TBBPayingsForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TBBPayingsForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TBBPayingsForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TBBPayingsForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TBBPayingsForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TBBPayingsForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TBBPayingsForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TBBPayingsForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TBBPayingsForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TBBPayingsForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TBBPayingsForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TBBPayingsForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TBBPayingsForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TBBPayingsForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TBBPayingsForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TBBPayingsForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBBPayingsForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TBBPayingsForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TBBPayingsForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TBBPayingsForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TBBPayingsForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TBBPayingsForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TBBPayingsForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TBBPayingsForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TBBPayingsForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TBBPayingsForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TBBPayingsForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TBBPayingsForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TBBPayingsForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TBBPayingsForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TBBPayingsForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TBBPayingsForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TBBPayingsForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TBBPayingsForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBBPayingsForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TBBPayingsForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TBBPayingsForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TBBPayingsForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TBBPayingsForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TBBPayingsForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TBBPayingsForm.ActiveFormCreate(Sender: TObject);
var
  StDate, EndDate :TdateTime;
begin
  DataModBBPayings := TDataModBBPayings.Create(Self);
  DTPickBegin.Date := DataModBBPayings.OrPack_SBOP.CallDateFunction('get_date',[]);
  DTPickEnd.Date := DataModBBPayings.OrPack_SBOP.CallDateFunction('get_date',[]);
  StDate :=DTPickBegin.DateTime;
  EndDate :=DTPickEnd.DateTime;
  with DataModBBPayings do begin
   ODS_ABNServices.SetVariable('StDate',StDate);
   ODS_ABNServices.SetVariable('EndDate',EndDate);
   ODS_ABNServices.Open;
   ODS_Contracts.Open;
   ODS_Services.Open;
  end; {with DataModBBPayings}
end;

procedure TBBPayingsForm.DBGridContractsTitleClick(Column: TColumn);
var
  SQLLine: word;
begin
  SQLLine :=20;
  SQLLine :=DataModBBPayings.ODS_ABNServices.SQL.Add(' order by '+Column.FieldName);
  DataModBBPayings.ODS_ABNServices.Refresh;
  DataModBBPayings.ODS_ABNServices.SQL[SQLLine] :=EmptyStr;
end;

procedure TBBPayingsForm.BtnRefreshClick(Sender: TObject);
var
  StDate, EndDate :TdateTime;
  s :string;
begin
  StDate :=DTPickBegin.DateTime;
  EndDate :=DTPickEnd.DateTime;
  with DataModBBPayings.ODS_ABNServices do begin
   SetVariable('StDate',StDate);
   SetVariable('EndDate',EndDate);
   s :='1=1';
   if ChBoxSrvType.Checked then s :=s+' and (srv_id='+string(CBoxSrvType.KeyValue)+')';
   if ((ChBoxConfirmed.Checked=true) and (ChBoxNotConfirmed.Checked=false)) then s :=s+' and (status=1)';
   if ((ChBoxConfirmed.Checked=false) and (ChBoxNotConfirmed.Checked=true)) then s :=s+' and (status=0)';
   Filter :=s;
   Filtered :=true;
   Close;
   Open;
  end; {with DataModBBPayings.ODS_ABNServices}
end;

procedure TBBPayingsForm.BtnAddClick(Sender: TObject);
var
  r :integer;
  p_DT :TDateTime;
begin
  if not Assigned(FormBBPayingAdd) then FormBBPayingAdd :=TFormBBPayingAdd.Create(Self);
  with FormBBPayingAdd do begin
   DTPicker.Date :=sb_GetSystemDate;
   DBEditAbonentName.Text :='';
   CBoxContractNum.KeyValue :=0;
   CBoxServiceType.KeyValue :=0;
   CBoxMethod.ItemIndex :=0;
   EditAmount.Text :='';
   p_DT :=trunc(DTPicker.DateTime);

   if (FormBBPayingAdd.ShowModal =1) then
    r := DataModBBPayings.OrPack_CableManager.CallIntegerFunction('AbnServAdd',
     [CBoxContractNum.KeyValue, //p_contract_id
      null, //p_reg_time
      CBoxServiceType.KeyValue, //p_srv_id
      EditAmount.Text, //p_amount
      0, //p_curr_code
      0, //p_status
      p_DT, //p_done_time
      CBoxMethod.ItemIndex //p_paymethod
      ]);
    DataModBBPayings.ODS_ABNServices.Refresh;
  end; {with FormBBPayingAdd}
end;

procedure TBBPayingsForm.BtnEditClick(Sender: TObject);
var
  p_DT :TDateTime;
begin
  if not Assigned(FormBBPayingAdd) then FormBBPayingAdd :=TFormBBPayingAdd.Create(Self);
  with FormBBPayingAdd, DataModBBPayings.ODS_ABNServices do begin
   DTPicker.Date :=FieldByName('Done_Time').AsVariant;
   DBEditAbonentName.Text :=FieldByName('ABN_Name').AsString;
   CBoxContractNum.KeyValue :=FieldByName('Contract_ID').AsVariant;
   CBoxServiceType.KeyValue :=FieldByName('Srv_ID').AsVariant;
   CBoxMethod.ItemIndex :=FieldByName('PayMethod').AsInteger;
   EditAmount.Text :=FieldByName('Amount').AsString;
   p_DT :=trunc(DTPicker.DateTime);

   if (FormBBPayingAdd.ShowModal =1) then
    DataModBBPayings.OrPack_CableManager.CallProcedure('AbnServUpd',
     [FieldByName('ID').AsVariant, //p_id
      CBoxContractNum.KeyValue, //p_contract_id
      null, //p_reg_time
      CBoxServiceType.KeyValue, //p_srv_id
      EditAmount.Text, //p_amount
      0, //p_curr_code
      0, //p_status
      p_DT, //p_done_time
      CBoxMethod.ItemIndex //p_paymethod
      ]);
    DataModBBPayings.ODS_ABNServices.Refresh;
  end; {with FormBBPayingAdd}
end;

procedure TBBPayingsForm.DBGridContractsDblClick(Sender: TObject);
begin
  BtnEdit.Click;
end;

procedure TBBPayingsForm.BtnDelClick(Sender: TObject);
var
  MsgId :integer;
begin
  MsgId :=MessageDlg('Ямялиййат эцнцн сянядляриндян силинсинми?',mtWarning, [mbYes, mbNo, mbCancel], 0);
  if MsgId =idYes then
   DataModBBPayings.OrPack_CableManager.CallProcedure('AbnServDel',
    [DataModBBPayings.ODS_ABNServices.FieldByName('ID').AsVariant,
     1]);
  if MsgId =idNo then
   DataModBBPayings.OrPack_CableManager.CallProcedure('AbnServDel',
    [DataModBBPayings.ODS_ABNServices.FieldByName('ID').AsVariant,
     0]);
  DataModBBPayings.ODS_ABNServices.Refresh;
end;

procedure TBBPayingsForm.BtnConfirmClick(Sender: TObject);
var
  SelRow :integer;
begin
  if (MessageDlg('Ямялиййат тясдиглянсинми?',mtWarning, [mbYes, mbNo], 0) =idYes) then
   for SelRow :=0 to DBGridContracts.SelectedRows.Count-1 do begin
    DataModBBPayings.ODS_ABNServices.GotoBookmark(pointer(DBGridContracts.SelectedRows.items[selrow]));
   if DataModBBPayings.ODS_ABNServices.FieldByName('STATUS').AsInteger<>0 then continue
    else
     with DataModBBPayings do begin
      OrPack_CableManager.CallProcedure('AbnServCommit',
       [ODS_ABNServices.FieldByName('ID').AsVariant
       ]);
    end;
   DataModBBPayings.ODS_ABNServices.Refresh;
  end;
end;

procedure TBBPayingsForm.DBGridContractsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;
begin
  ImageIndex := -1;
  with Sender as TDBGrid do begin
   if DataSource.DataSet.RecordCount <> 0 then begin
    case DataSource.DataSet.FieldByName('Status').AsInteger of
     0: ImageIndex :=3;
     1: ImageIndex :=6;
    end; {case}
    if (DataCol =1) and (ImageIndex <>-1) then ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
     else DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end; {if DataSource.DataSet.RecordCount <> 0}
  end; {with Sender as TDBGrid}
end;

procedure TBBPayingsForm.BtnFilterPanelClick(Sender: TObject);
begin
  PanelSettings.Visible :=not PanelSettings.Visible;
end;

procedure TBBPayingsForm.BtnExcelClick(Sender: TObject);
begin
  with ExcelExport do begin
   if not Connected then Connect;
    ExportDataset(DataModBBPayings.ODS_ABNServices,'Services',true);
    Disconnect;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TBBPayingsForm,
    Class_BBPayingsForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

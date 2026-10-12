unit Swift_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Swift_Clearing_TLB, StdVcl, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, ComCtrls, ToolWin, ImgList, Db, OracleData, Menus,
  Mask, DBCtrls, FileCtrl, ActnList;

type
  TSwift_Form = class(TActiveForm, ISwift_Form)
    ImageList: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BrowseGrid: TDBGrid;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    ToolButton3: TToolButton;
    AcceptButton: TToolButton;
    ToolButton21: TToolButton;
    ToolButton18: TToolButton;
    ToolButton8: TToolButton;
    ToolButton6: TToolButton;
    Panel3: TPanel;
    GridMT102: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel5: TPanel;
    TabSheet2: TTabSheet;
    ControlBar2: TControlBar;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    MessAcceptButton: TToolButton;
    ToolButton10: TToolButton;
    ToolButton5: TToolButton;
    ToolButton11: TToolButton;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit9: TDBEdit;
    Panel7: TPanel;
    ControlBar3: TControlBar;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton14: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    Panel6: TPanel;
    RichEdit1: TRichEdit;
    Grid_in: TDBGrid;
    Panel_info: TPanel;
    Info_ListBox: TListBox;
    FileList_IN: TFileListBox;
    InfoPopup: TPopupMenu;
    Clear1: TMenuItem;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    DBEdit12: TDBEdit;
    Panel16: TPanel;
    Panel18: TPanel;
    Panel11: TPanel;
    DBEdit11: TDBEdit;
    Panel17: TPanel;
    DBEdit15: TDBEdit;
    Panel20: TPanel;
    DBEdit16: TDBEdit;
    Panel19: TPanel;
    DBEdit17: TDBEdit;
    Panel21: TPanel;
    DBEdit18: TDBEdit;
    Panel13: TPanel;
    DBEdit13: TDBEdit;
    Panel15: TPanel;
    DBEdit14: TDBEdit;
    Panel14: TPanel;
    DBEdit10: TDBEdit;
    Popup_SingleConcert: TPopupMenu;
    Convert1: TMenuItem;
    MainAction: TActionList;
    Delete_mess_in: TAction;
    Delete_mt102: TAction;
    delete_mess_out: TAction;
    ToolButton20: TToolButton;
    Panel22: TPanel;
    StDate: TDateTimePicker;
    EndDate: TDateTimePicker;
    Panel23: TPanel;
    StDate_in: TDateTimePicker;
    EndDate_in: TDateTimePicker;
    Gridin_SelAll: TAction;
    DBEdit19: TDBEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    function OnlyNumber(key :Char): CHAR;
    procedure PageControl1Change(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure BrowseGridDblClick(Sender: TObject);
    procedure GridMT102DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RefreshDATA;
    procedure Refresh_mess_in;
    procedure MessAcceptButtonClick(Sender: TObject);
    procedure AcceptButtonClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure showdetals;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    function LoadToRich(FileName : String): string;
    procedure ConvertToBase(Rich : TRichEdit;ref : string);
    procedure RefreshWithPos;
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Grid_inDblClick(Sender: TObject);
    procedure Popup_SingleConcertPopup(Sender: TObject);
    procedure Convert1Click(Sender: TObject);
    procedure Grid_inKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Delete_mess_inExecute(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure Delete_mt102Execute(Sender: TObject);
    procedure delete_mess_outExecute(Sender: TObject);
    procedure RefreshMessinWithPos;
    procedure ToolButton9Click(Sender: TObject);
    procedure GridMT102KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BrowseGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure selectdate;
    procedure Gridin_SelAllExecute(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    private
    { Private declarations }
    FEvents: ISwift_FormEvents;
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
    procedure Set_Visible(Value: WordBool); safecall;  function ISwift_Form.Get_Color = ISwift_Form_Get_Color;
    function ISwift_Form.Get_Font = ISwift_Form_Get_Font;
    procedure ISwift_Form._Set_Font = ISwift_Form__Set_Font;
    procedure ISwift_Form.Set_Color = ISwift_Form_Set_Color;
    procedure ISwift_Form.Set_Font = ISwift_Form_Set_Font;
    function ISwift_Form_Get_Color: OLE_COLOR; safecall;
    function ISwift_Form_Get_Font: IFontDisp; safecall;
    procedure ISwift_Form__Set_Font(const Value : IfontDisp); safecall;
    procedure ISwift_Form_Set_Color(Value :OLE_COLOR); safecall;
    procedure ISwift_Form_Set_Font(var Value : IFontDisp); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

var
   Swift_Form : TSwift_Form;
   new_id : integer;
   mess_edit,after_add: boolean;
   trans_date : TDateTime;
implementation

uses ComObj, ComServ, sboapiDataModuleImpl, SelDialog,
  Transaction_Unit, Payment_Det, TransTypeUnit, Data_Unit, Properties_Unit,
  PrepareFile_Unit, FileSend_Unit, ReceiveMessDetals_Unit;
{$R *.DFM}

{ TSwift_Form }

procedure TSwift_Form.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Swift_FormPage); }
end;

procedure TSwift_Form.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISwift_FormEvents;
end;

procedure TSwift_Form.Initialize;
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

function TSwift_Form.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSwift_Form.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSwift_Form.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSwift_Form.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSwift_Form.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSwift_Form.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSwift_Form.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSwift_Form.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSwift_Form.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSwift_Form.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSwift_Form.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSwift_Form.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSwift_Form.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSwift_Form.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSwift_Form.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSwift_Form.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSwift_Form.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSwift_Form.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSwift_Form._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSwift_Form.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSwift_Form.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSwift_Form.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSwift_Form.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSwift_Form.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSwift_Form.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSwift_Form.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSwift_Form.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSwift_Form.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSwift_Form.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSwift_Form.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSwift_Form.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSwift_Form.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSwift_Form.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSwift_Form.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSwift_Form.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSwift_Form.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSwift_Form.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSwift_Form.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSwift_Form.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSwift_Form.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSwift_Form.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSwift_Form.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSwift_Form.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TSwift_Form.ActiveFormCreate(Sender: TObject);
begin
    Swift_Form := Self;
    DataMod:=TDatamod.Create(Self);
    SelDirFrm:=TSelDirFrm.Create(Self);
    TransForm:=TTransForm.Create(Self);
    PaymentDetalsForm:=TPaymentDetalsForm.Create(Self);
    TransCodeForm:=TTransCodeForm.Create(Self);
    PropertiesForm:=TPropertiesForm.Create(Self);
    PrepareFile_Form:=TPrepareFile_Form.Create(Self);
    SendFileForm:=TSendFileForm.Create(Self);
    RecMessDet_form:=TRecMessDet_form.Create(Self);
    {}
    {DATE GENARATE}
    StDate.date:=DataMod.GetSysDate.CallDateFunction('get_date',[]);
    EndDate.date:=DataMod.GetSysDate.CallDateFunction('get_date',[]);
    selectdate;
//    DataMod.Hox102_out.close;
//    DataMod.Hox102_out.SQL.Clear;
//    DataMod.Hox102_out.SQL.Add('select h.*,a.acc_no,a.name,v.val_name from hox102_out h,account a,avalute v where h.acc_id = a.id and v.valute=h.val_acc and(transdate>=:BeginDate and transdate<=:EndDate)order by  h.id,h.status desc');
    DataMod.Hox102_out.open;
    DataMod.HoxMessages_out.open;
    PageControl1.ActivePageIndex:=0;
    PageControl1.Pages[0].Highlighted:=true;
end;

function TSwift_Form.ISwift_Form_Get_Color: OLE_COLOR;
begin

end;

function TSwift_Form.ISwift_Form_Get_Font: IfontDisp;
begin

end;

procedure TSwift_Form.ISwift_Form__Set_Font(const Value :IFontDisp);
begin

end;

procedure TSwift_Form.ISwift_Form_Set_Color(Value :OLE_COLOR);
begin

end;

procedure TSwift_Form.ISwift_Form_Set_Font(var Value :IfontDisp);
begin

end;
{******************************************************************************}
{                SELF PROCEDURE AND FUNCTION                                   }
{******************************************************************************}
{VIEW in COMBO}
procedure AddtoCOMBO(ComBo: TComboBox;ListB: TListBox;DatSet : TOracleDataSet;SQLstring,field_ListBox,field_Combo: String);
begin
    DatSet.Close;
    DatSet.SQL.Clear;
    DatSet.SQL.Add(SQLstring);
    DatSet.Open;
    DatSet.First;
    ListB.Clear;
    Combo.Clear;
    while not DatSet.Eof do
    begin
        ListB.Items.Add(DatSet.fieldbyname(field_ListBox).AsString);
        Combo.Items.Add(DatSet.fieldbyname(field_Combo).AsString);
    DatSet.Next;
    end;
end;
function TSwift_Form.OnlyNumber(key : char) :CHAR;
begin
   if not (key in ['0'..'9',#8]) then key:=#0; Result:=key;
end;
procedure createTransCodeTree;
    var
    TR,TRC :TTreeNode ;
begin
    {VIEW trans type code}
    DataMod.DataSet_View.close;
    DataMod.DataSet_View.SQL.Clear;
    DataMod.DataSet_View.SQL.Add('Select * from hoxtranstype_code');
    DataMod.DataSet_View.Open;
    TransCodeForm.TreeView1.Items.Clear;
    while not DataMod.DataSet_View.Eof do
    begin
        TR:=TransCodeForm.TreeView1.Items.Add(TransCodeForm.TreeView1.Items.GetFirstNode,DataMod.DataSet_View.fieldbyname('NAME').AsString) ;
        TRC:=TransCodeForm.TreeView1.Items.AddChild(TR,DataMod.DataSet_View.fieldbyname('CODE').AsString);
        TR.ImageIndex:=0;
        TR.SelectedIndex:=1;
        TRC.ImageIndex:=2;
        TRC.SelectedIndex:=2;
    DataMod.DataSet_View.Next;
    end;
end;
procedure preparetrans(bnfcount: integer);
begin
    {OPEN DATA}
    if DataMod.HoxSw_Proper.Active = false then DataMod.HoxSw_Proper.Open;
    if DataMod.Account_data.Active = false then DataMod.Account_data.Open;
    {VARS}
    PaymentDetalsForm.bnf_count:=bnfcount;
    {SELF BANK INFO}
    DataMod.BankInfo.Close;
    DataMod.BankInfo.SQL.Clear;
    DataMod.BankInfo.SQL.Add('Select * from BankInfo');
    DataMod.BankInfo.Open;
    {VIEW IN COMBO BANK name}
     AddtoCOMBO(PaymentDetalsForm.Combo_BankName,PaymentDetalsForm.Bank_ID,DataMod.BankM,'Select * from BankM','ID','NAME');
    {VIEW IN COMBO VALUTE}
     AddtoCOMBO(PaymentDetalsForm.Combo_Valute,PaymentDetalsForm.Valute_ID,DataMod.AValute,'Select * from Avalute','VALUTE','VALU_NAME');
    {VIEW IN COMBO VALUTE in Main}
     AddtoCOMBO(TransForm.Combo_Valute,TransForm.Valute_ID,DataMod.AValute,'Select * from Avalute','VALUTE','VALU_NAME');
    {VIEW in EDIT}
    TransForm.Edit_Sender.Text:=DataMod.BankInfo.fieldbyname('SWIFT').AsString+'AXXX';
    TransForm.Edit_BIK.Text:=DataMod.BankInfo.fieldbyname('SWIFT').AsString;
    TransForm.Edit_BankCode.Text:=DataMod.BankInfo.fieldbyname('KOD_B').AsString;
    TransForm.Edit_account.Text:=DataMod.BankInfo.fieldbyname('KRNO').AsString;
    TransForm.Edit_voen.Text:=DataMod.BankInfo.fieldbyname('INN').AsString;
    TransForm.Edit_account_sub.Text:=DataMod.HoxSw_Proper.fieldbyname('HoxAccount').AsString;
    TransForm.Combo_Valute.ItemIndex:=0;
    TransForm.ComboBox_CD.ItemIndex:=0;
    {Clear edit's}
    TransForm.AccSearch.Clear;
    TransForm.Edit_clientName.Clear;
    TransForm.Edit_client_code.clear;
    TransForm.Edit_Amount.text:='0';
    TransForm.Edit_BNF.Text:='/BNF/0';
    TransForm.Combo_date.Date:=Date;
    TransForm.DBEdit_Voen.Clear;
    TransForm.Edit_Referens.clear;


//    TransForm.AccSearch.Text:=datamod.Account_data.fieldbyname('acc_no').AsString;

end;
procedure TSwift_FORM.RefreshDATA;
   var firstpos: pointer;
begin
   {}
//   if DataMod.Hox102_out.RecordCount = 0 then exit;
   selectdate;
//   firstpos:=DataMod.Hox102_out.GetBookmark;
   DataMod.Hox102_out.Refresh;
//   DataMod.Hox102_out.GotoBookmark(firstpos);
   {}
//   firstpos:=DataMod.HoxMessages_out.GetBookmark;
   DataMod.HoxMessages_out.Refresh;
//   DataMod.HoxMessages_out.GotoBookmark(firstpos);
   GridMT102.SelectedRows.Clear;
   BrowseGrid.SelectedRows.Clear;
end;
procedure TSwift_FORM.Refresh_mess_in;
   var firstpos: pointer;
      Dtst,dtEnd:TDateTime;
begin
   {}
   datamod.HoxMessages_IN_view.Close;
   Dtst:=trunc(Stdate_in.DateTime);
   dtEnd:=trunc(EndDate_in.DateTime);
   datamod.HoxMessages_IN_view.SetVariable('BeginDate',Dtst);
   datamod.HoxMessages_IN_view.SetVariable('EndDate',dtEnd);
   DataMod.HoxMessages_IN_view.open;
end;
procedure TSwift_FORM.RefreshMessinWithPos;
   var firstpos: pointer;
      Dtst,dtEnd:TDateTime;
begin
   {}
   firstpos:=DataMod.HoxMessages_IN_view.GetBookmark;
   DataMod.HoxMessages_IN_view.Refresh;
   DataMod.HoxMessages_IN_view.GotoBookmark(firstpos);
   Grid_in.SelectedRows.Clear;
end;
procedure TSwift_Form.showdetals;
begin
    createTransCodeTree;
    {OPEN DATA}
    if DataMod.HoxSw_Proper.Active = false then DataMod.HoxSw_Proper.Open;
    if DataMod.Account_data.Active = false then DataMod.Account_data.Open;
    {VIEW IN COMBO BANK name}
     AddtoCOMBO(PaymentDetalsForm.Combo_BankName,PaymentDetalsForm.Bank_ID,DataMod.BankM,'Select * from BankM','ID','NAME');
    {VIEW IN COMBO VALUTE}
     AddtoCOMBO(PaymentDetalsForm.Combo_Valute,PaymentDetalsForm.Valute_ID,DataMod.AValute,'Select * from Avalute','VALUTE','VAL_NAME');

    new_id:=DataMod.Hox102_out.fieldbyname('id').AsInteger;
    {}
    with PaymentDetalsForm do
         begin
             {SHOW BANK INFO}
             if DataMod.BankInfo.Active = false then DataMod.BankInfo.Open;
             
             Edit_BankName_Self.Text:=DataMod.BankInfo.fieldbyname('BANK').AsString;
             Edit_BIK_Self.Text:=DataMod.BankInfo.fieldbyname('SWIFT').AsString;
             Edit_BankCode_Self.Text:=DataMod.BankInfo.fieldbyname('KOD_B').AsString;
             Edit_account_Self.Text:=DataMod.BankInfo.fieldbyname('KRNO').AsString;
             Edit_Voen_Self.Text:=DataMod.BankInfo.fieldbyname('INN').AsString;
             Combo_Valute.ItemIndex:=PaymentDetalsForm.Combo_Valute.Items.IndexOf('AZM');
             Edit_account_sub_Self.Text:=Edit_account_sub.text;
             {VALUTE AND RECEIVE BANK}
             Combo_BankName.ItemIndex:=Bank_ID.Items.IndexOf(DataMod.HoxMessages_out.fieldbyname('rec_bank_id').AsString);
             Combo_Valute.ItemIndex:=Valute_ID.Items.IndexOf(DataMod.HoxMessages_out.fieldbyname('val_cod').AsString);
{}           if DataMod.BankM.Active = false then DataMod.BankM.Open;
             Edit_BankCode.Text:=DataMod.BankM.fieldbyname('BankCode').AsString;
             Edit_account.Text:=DataMod.BankM.fieldbyname('KRNO').AsString;
             Edit_Voen.Text:=DataMod.BankM.fieldbyname('INN').AsString;
             Edit_Bik.Text:=DataMod.BankM.fieldbyname('SWIFT').AsString;
             Edit_Account_Sub.Text:=DataMod.HoxMessages_out.fieldbyname('REC_BANK_SUB_ACC').AsString;
             Edit_account_sub_Self.Text:=DataMod.HoxSw_Proper.fieldbyname('HoxAccount').AsString;
             Edit_Referens.Text:=DataMod.HoxMessages_out.fieldbyname('MESS_REFERENCE').AsString;
             Edit_Amount.Text:=DataMod.HoxMessages_out.fieldbyname('amount').AsString;
             Edit_TransCode.Text:=DataMod.HoxMessages_out.fieldbyname('TRANS_COD').AsString;
             Edit_Client_acc_no.Text:=DataMod.HoxMessages_out.fieldbyname('CLIENT_ACC_NO').AsString;
             Edit_Client_Name.Text:=DataMod.HoxMessages_out.fieldbyname('CLIENT_NAME').AsString;
             Edit_Client_Code.Text:=DataMod.HoxMessages_out.fieldbyname('CLIENT_Code').AsString;
             Edit_Client_Voen.Text:=DataMod.HoxMessages_out.fieldbyname('CLIENT_INN').AsString;
             Edit_tey1.Text:=copy(DataMod.HoxMessages_out.fieldbyname('REMIT_INF').AsString,0,35);
             Edit_tey2.Text:=copy(DataMod.HoxMessages_out.fieldbyname('REMIT_INF').AsString,35,35);
             Edit_tey3.Text:=copy(DataMod.HoxMessages_out.fieldbyname('REMIT_INF').AsString,70,35);
             Edit_tey4.Text:=copy(DataMod.HoxMessages_out.fieldbyname('REMIT_INF').AsString,105,35);
             Edit_inf1.Text:=copy(DataMod.HoxMessages_out.fieldbyname('ADD_INF').AsString,0,35);
             Edit_inf2.Text:=copy(DataMod.HoxMessages_out.fieldbyname('ADD_INF').AsString,35,35);
             Edit_inf3.Text:=copy(DataMod.HoxMessages_out.fieldbyname('ADD_INF').AsString,70,35);
         end;
    mess_edit:=true;
    {BUTTONS}
    PaymentDetalsForm.Button4.Visible:=false;
    PaymentDetalsForm.Button1.Enabled:=True;
    PaymentDetalsForm.Button2.Enabled:=False;
    PaymentDetalsForm.Button1.Caption:='…аддаша йаз';
end;
{LOAD TO RICH}
function TSwift_Form.LoadToRich(FileName : String):string;
   var stpos,endpos: integer;
   ref : string;
begin
   RichEdit1.Clear;
   RichEdit1.Lines.LoadFromFile(FileName);
   stpos:=RichEdit1.FindText('<msg_user_reference>',0,RichEdit1.GetTextLen,[stMatchCase]);
   endpos:=RichEdit1.FindText('</msg_user_reference>',0,RichEdit1.GetTextLen,[stMatchCase]);
   RichEdit1.SelStart:=stpos+length('<msg_user_reference>');
   RichEdit1.SelLength:=abs(endpos-stpos)-length('<msg_user_reference>');
   ref:=RichEdit1.SelText;
   DataMod.ForCHECK.Close;
   DataMod.ForCHECK.sql.Clear;
   DataMod.ForCHECK.SQL.Add('Select reference from hoxmessage_in where reference='''+ref+'''');
   DataMod.ForCHECK.Open;
   if DataMod.ForCHECK.RecordCount > 0 then begin RichEdit1.Clear;Result:='0'; end else Result:=ref;
end;
{CONVERT TO BASE}
procedure TSwift_Form.ConvertToBase(Rich : TRichEdit;ref :string);
   var i , startPos,EndPos, FnStartPos, FnEndPos,
           TempPos,TempLine,LenPos, LineIndex, TempVar : integer;
           sub50K,name50K,inn50K,Code50K,BnkRek50K : string;
       Fn77B: boolean;
       StMessage,Fn50K : String;
function FindMyText(Tx:string;posStart,posEnd : integer) :integer;
   var  temp : integer;
   begin
   Temp:=Rich.FindText(Tx,posStart+1,posEnd+1,[stMatchCase]);
   Rich.SelStart:=Temp;
   Rich.SelLength:=length(tx);
   Result:=temp;
   end;
function FindLines(Tx:string;posStart,posEnd : integer) :integer;
   var  temp : integer;
   begin
   Temp:=Rich.FindText(Tx,posStart+1,posEnd+1,[stMatchCase]);
   if temp >-1 then
   begin
   Rich.SelStart:=Temp;
   Rich.SelLength:=length(tx);
   Result:=Rich.CaretPos.y
   end
   else
   Result:=-1;
   end;
begin
   if Rich.GetTextLen = 0 then exit;
   startPos:=0;
   EndPos:=0;
   Fn77B:=false;
   FnStartPos:=FindMyText(':21:',startPos,Rich.GetTextLen);
   LineIndex:=Rich.CaretPos.y;
   FnEndPos:=FindMyText(':26T:',startPos,Rich.GetTextLen);
   TempPos:=FindMyText(':77B:',startPos,Rich.GetTextLen);
   if (TempPos >-1)and(TempPos=FnEndPos+10) then begin FnEndPos:=TempPos;Fn77B:=true; end;
   while  FnStartPos >-1 do
   begin
       DataMod.HoxMessages_IN.Insert;
       {READ FROM BODY}
        DataMod.HoxMessages_IN.FieldByName('trans_date').AsDateTime:=DataMod.GetSysDate.CallDateFunction('Get_date',[]);
        DataMod.HoxMessages_IN.FieldByName('reference').AsString:=ref;
        {32B}
        TempLine:=   FindLines(':32B:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],6,3));
        DataMod.ForAll.Close;
        DataMod.ForAll.SQL.Clear;
        DataMod.ForAll.SQL.Add('Select valute from avalute where val_name='''+StMessage+'''');
        DataMod.ForAll.Open;
        DataMod.HoxMessages_IN.FieldByName('val_cod').AsInteger:=DataMod.ForAll.fieldbyname('valute').AsInteger;
        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));
        DataMod.HoxMessages_IN.FieldByName('amount').AsFloat:=strtofloat(stmessage);
        {50K}
        TempLine:=   FindLines(':50K:',FnStartPos,FnEndPos);
        TempVar:=abs(FindLines(':52A:',FnStartPos,FnEndPos)-TempLine);
        if (tempvar<=5) then
        begin
        StMessage:=trim(copy(Rich.Lines[TempLine],7,Length(Rich.Lines[TempLine])-6));
        sub50K:=StMessage;
        DataMod.HoxMessages_IN.FieldByName('sen_acc').AsString:=StMessage;
        {}
        StMessage:=trim(Rich.Lines[TempLine+1]);
        name50K:=StMessage;
        DataMod.HoxMessages_IN.FieldByName('sen_name').AsString:=StMessage;
        {}
        StMessage:=trim(Rich.Lines[TempLine+2]);
        Code50K:=StMessage;
        {}
        StMessage:=trim(Rich.Lines[TempLine+3]);
        inn50K:=StMessage;
        DataMod.HoxMessages_IN.FieldByName('sen_inn').AsInteger:=strtoint(StMessage);
        {}
        StMessage:=copy(trim(Rich.Lines[TempLine+4]),0,pos('/',trim(Rich.Lines[TempLine+4]))-1);
        BnkRek50K:=StMessage;
//        ShowMessage(StMessage) ;

        DataMod.ForAll.Close;
        DataMod.ForAll.SQL.Clear;
        DataMod.ForAll.SQL.Add('Select id from bankm where bankcode='''+StMessage+'''');
        DataMod.ForAll.Open;
        DataMod.HoxMessages_IN.FieldByName('sen_bank_id').AsInteger:=DataMod.ForAll.fieldbyname('id').AsInteger;
//        ShowMessage('Senber bank rek '+BnkRek50K);
        end else
        begin
        DataMod.HoxMessages_IN.FieldByName('sen_acc').AsString:=sub50K;
        {}
        DataMod.HoxMessages_IN.FieldByName('sen_name').AsString:=name50K;
        {}
        DataMod.HoxMessages_IN.FieldByName('sen_inn').AsInteger:=strtoint(inn50K);
        {}
        DataMod.ForAll.Close;
        DataMod.ForAll.SQL.Clear;
        DataMod.ForAll.SQL.Add('Select id from bankm where bankcode='''+BnkRek50K+'''');
        DataMod.ForAll.Open;
        DataMod.HoxMessages_IN.FieldByName('sen_bank_id').AsInteger:=DataMod.ForAll.fieldbyname('id').AsInteger;
//        ShowMessage('1 50K Sub shot '+sub50K);
        end;

        {52A}
        TempLine:=   FindLines(':52A:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));
        DataMod.HoxMessages_IN.FieldByName('sen_bank_subacc').AsFloat:=StrToFloat(StMessage);
        {}
        StMessage:=Rich.Lines[TempLine+1];
        {57A}
        TempLine:=   FindLines(':57A:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));
        DataMod.HoxMessages_IN.FieldByName('rec_bank_subacc').AsFloat:=strtoFloat(StMessage);
        {}
        StMessage:=trim(Rich.Lines[TempLine+1]);
        DataMod.HoxMessages_IN.FieldByName('rec_bank_bik').AsString:=StMessage;
        {59}
        TempLine:=   FindLines(':59:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],6,Length(Rich.Lines[TempLine])-5));
        DataMod.HoxMessages_IN.FieldByName('rec_client_acc').AsString:=StMessage;

        DataMod.ForAll.Close;
        DataMod.ForAll.SQL.Clear;
        DataMod.ForAll.SQL.Add('Select id from account where acc_no='''+StMessage+'''');
        DataMod.ForAll.Open;
        if DataMod.ForAll.RecordCount >0 then
        DataMod.HoxMessages_IN.FieldByName('rec_client_acc_id').AsInteger:=DataMod.ForAll.fieldbyname('id').AsInteger;
        {}
        StMessage:=trim(Rich.Lines[TempLine+1]);
        DataMod.HoxMessages_IN.FieldByName('rec_client_name').AsString:=StMessage;
        {}
        StMessage:=trim(Rich.Lines[TempLine+2]);
        {}
        StMessage:=trim(Rich.Lines[TempLine+3]);
        DataMod.HoxMessages_IN.FieldByName('rec_client_inn').AsInteger:=strtoint(StMessage);
        {}
        StMessage:=Rich.Lines[TempLine+4];
        {70}
        startPos:=FindMyText(':70:',FnStartPos,Rich.GetTextLen);
        EndPos:=FindMyText(':26T:',FnStartPos,FnEndPos);
        Rich.SelStart:=startPos+4;
        Rich.SelLength:=EndPos-startPos-4;
        StMessage:=trim(Rich.SelText);
        StMessage:=StringReplace(StMessage,chr(10),' ',[rfReplaceAll]);
        StMessage:=StringReplace(StMessage,'  ',' ',[rfReplaceAll]);
        DataMod.HoxMessages_IN.FieldByName('remit_inf').AsString:=StMessage;
        {26T}
        TempLine:=   FindLines(':26T:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],6,3));
        DataMod.HoxMessages_IN.FieldByName('typecode').AsInteger:=strtoint(StMessage);
        {77B}
        if Fn77B then
        begin
            startPos:=FindMyText(':77B:',FnStartPos,Rich.GetTextLen);
            EndPos:=FindMyText(':21:',FnStartPos,FnEndPos);
            Rich.SelStart:=startPos+5;
            Rich.SelLength:=EndPos-startPos-5;
            StMessage:=trim(Rich.SelText);
            StMessage:=StringReplace(StMessage,chr(10),' ',[rfReplaceAll]);
            StMessage:=StringReplace(StMessage,'  ',' ',[rfReplaceAll]);
            DataMod.HoxMessages_IN.FieldByName('add_inf').AsString:=StMessage;
        end;
   {FIND NEW MESSAGE BLOCK}
   FnStartPos:=FindMyText(':21:',FnEndPos,Rich.GetTextLen);
   LineIndex:=Rich.CaretPos.y;
   FnEndPos:=FindMyText(':26T:',FnEndPos,Rich.GetTextLen);
   TempPos:=FindMyText(':77B:',FnEndPos,Rich.GetTextLen);
   if (TempPos >-1)and(TempPos=FnEndPos+10) then begin {ShowMessage('77B');} FnEndPos:=TempPos;Fn77B:=true; end else Fn77B:=false;

   DataMod.HoxMessages_IN.Post;
   end;
   Rich.Clear;
end;
procedure TSwift_Form.selectdate;
var
  Dtst,dtEnd:TDateTime;
begin
  Dtst:=trunc(StDate.DateTime);
  dtEnd:=trunc(EndDate.DateTime);
  datamod.Hox102_out.SetVariable('BeginDate',Dtst);
  datamod.Hox102_out.SetVariable('EndDate',dtEnd);
end;
procedure TSwift_Form.RefreshWithPos;
   var firstpos: pointer;
begin
   {}
   firstpos:=DataMod.Hox102_out.GetBookmark;
   DataMod.Hox102_out.Refresh;
   DataMod.Hox102_out.GotoBookmark(firstpos);
   {}
   firstpos:=DataMod.HoxMessages_out.GetBookmark;
   DataMod.HoxMessages_out.Refresh;
   DataMod.HoxMessages_out.GotoBookmark(firstpos);
   GridMT102.SelectedRows.Clear;
   BrowseGrid.SelectedRows.Clear;
end;

{******************************************************************************}
{                                                                              }
{******************************************************************************}

procedure TSwift_Form.ToolButton1Click(Sender: TObject);
begin
      preparetrans(0);
      createTransCodeTree;
      after_add:=false;
      mess_edit:=false;
     {INSERT TO HOX102}
      new_id := DataMod.INS.Callintegerfunction('Inst_HOX102_OUT',['CREDIT',
                                                  0,
                                                  TransForm.edit_clientname.text,
                                                  TransForm.edit_client_code.text,
                                                  TransForm.edit_referens.text,
                                                  strtofloat(TransForm.edit_amount.text),
                                                  strtofloat(TransForm.valute_id.items[TransForm.combo_valute.itemindex]),
                                                  date]);
      transForm.ShowModal;
end;

procedure TSwift_Form.PageControl1Change(Sender: TObject);
begin
     PageControl1.Pages[0].Highlighted:=PageControl1.ActivePageIndex = 0;
     PageControl1.Pages[1].Highlighted:=PageControl1.ActivePageIndex = 1;
     if PageControl1.ActivePageIndex=1 then
     begin
        StDate_in.Date:=date;
        EndDate_in.date:=date;
        DataMod.ForAll.Close;
        DataMod.ForAll.SQL.Clear;
        DataMod.ForAll.SQL.Add('Select hox_in_dir from hoxsw_proper');
        DataMod.ForAll.Open;
        FileList_IN.Directory:=DataMod.ForAll.fieldbyname('hox_in_dir').AsString+'\';
        FileList_IN.Update;
        StDate_in.Date:=DataMod.GetSysDate.CallDateFunction('GET_DATE',[]);
        ENDDate_in.Date:=DataMod.GetSysDate.CallDateFunction('GET_DATE',[]);
        Refresh_mess_in;
     end;
end;

procedure TSwift_Form.ToolButton3Click(Sender: TObject);
begin
    RefreshDATA;
end;

procedure TSwift_Form.ToolButton2Click(Sender: TObject);
begin
     if DataMod.Hox102_out.RecordCount = 0 then exit;
     preparetrans(1);
     createTransCodeTree;
     new_id:=DataMod.Hox102_out.fieldbyname('id').AsInteger;
     after_add:=true;
    {VIEW IN EDIT}
    if DataMod.BankInfo.Active = false then DataMod.BankInfo.Open;
    PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.BankInfo.fieldbyname('BANK').AsString;
    PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.BankInfo.fieldbyname('SWIFT').AsString;
    PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.BankInfo.fieldbyname('KOD_B').AsString;
    PaymentDetalsForm.Edit_account_Self.Text:=DataMod.BankInfo.fieldbyname('KRNO').AsString;
    PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.BankInfo.fieldbyname('INN').AsString;
    PaymentDetalsForm.Combo_Valute.ItemIndex:=PaymentDetalsForm.Combo_Valute.Items.IndexOf('AZM');
    PaymentDetalsForm.Edit_account_sub_Self.Text:=TransForm.Edit_account_sub.text;
    {Cler edit's}

    PaymentDetalsForm.Combo_BankName.ItemIndex:=-1;
    PaymentDetalsForm.Edit_BIK.Clear;
    PaymentDetalsForm.Edit_BankCode.clear;
    PaymentDetalsForm.Edit_Referens.Clear;
    PaymentDetalsForm.Edit_account.Clear;
    PaymentDetalsForm.Edit_Voen.Clear;
    PaymentDetalsForm.Edit_Amount.Clear;
    PaymentDetalsForm.Edit_TransCode.Clear;
    PaymentDetalsForm.Edit_Client_Name.Clear;
    PaymentDetalsForm.Edit_Client_Code.clear;
    PaymentDetalsForm.Edit_Client_acc_no.Clear;
    PaymentDetalsForm.Edit_Client_Voen.Clear;
    PaymentDetalsForm.Edit_inf1.Clear;
    PaymentDetalsForm.Edit_inf2.Clear;
    PaymentDetalsForm.Edit_inf3.Clear;
    PaymentDetalsForm.Edit_tey1.Clear;
    PaymentDetalsForm.Edit_tey2.Clear;
    PaymentDetalsForm.Edit_tey3.Clear;

//    PaymentDetalsForm.Button1.Caption:='…аддаша йаз';
    PaymentDetalsForm.Combo_Valute.ItemIndex:=0;
    PaymentDetalsForm.ShowModal;
end;

procedure TSwift_Form.BrowseGridDblClick(Sender: TObject);
begin
    if (sender as Tdbgrid).DataSource.DataSet.RecordCount = 0 then exit;
    showdetals;
    PaymentDetalsForm.ShowModal;
end;

procedure TSwift_Form.GridMT102DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;
begin
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('Status').AsInteger of
      0:
        ImageIndex := 3;
      1:
        ImageIndex := 10;
      2:
        ImageIndex := 4;
      3:
        ImageIndex := 5;
      else
//      if DataSource.DataSet.State <> dsInsert then
//        raise EDataCorrupted.CreateFmt('Unknown state in transactions dataset: %d, ID=%d', [DataSource.DataSet.FieldByName('Status').AsInteger, DataSource.DataSet.FieldByName('ID').AsInteger])
//      else
//        ImageIndex := -1;
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TSwift_Form.MessAcceptButtonClick(Sender: TObject);
   var i : integer;
begin
   if (DataMod.HoxMessages_out.RecordCount = 0)or
   (DataMod.HoxMessages_out.fieldbyname('status').AsInteger<>0)or
   (DataMod.Hox102_out.fieldbyname('status').AsInteger=2)
   then exit;
   for i:=0 to BrowseGrid.SelectedRows.Count-1 do
   begin
      BrowseGrid.DataSource.DataSet.GotoBookmark(pointer(BrowseGrid.SelectedRows.items[i]));
      DataMod.Ins.callprocedure('UPD_MESS_ICON',[DataMod.HoxMessages_out.fieldbyname('ID').ASinteger,1]);
   end;
   Swift_Form.RefreshWithPos ;
end;

procedure TSwift_Form.AcceptButtonClick(Sender: TObject);
begin
   if (DataMod.Hox102_out.RecordCount = 0)or
      (DataMod.HoxMessages_out.RecordCount = 0)or
      (DataMod.Hox102_out.fieldbyname('status').AsInteger<>0)and
      (DataMod.Hox102_out.fieldbyname('status').AsInteger<>3)
       then exit;
   if DataMod.Ins.callintegerfunction('UPD_HOX102_ICON',[DataMod.Hox102_out.fieldbyname('ID').ASinteger,1])=1 then
   begin
     DataMod.Ins.callprocedure('ParentAndChildTrans',[DataMod.Hox102_out.fieldbyname('ID').ASinteger]);
     Swift_Form.RefreshDATA;
   end else    MessageDlg('Batch-da olan butun mesalar testiq olunmalidir', mtError,[mbOk], 0);

end;

procedure TSwift_Form.ToolButton10Click(Sender: TObject);
begin
   if (DataMod.HoxMessages_out.RecordCount = 0)or
   (DataMod.HoxMessages_out.fieldbyname('status').AsInteger=1)or
   (DataMod.Hoxmessages_out.fieldbyname('status').AsInteger=2)or
   (DataMod.Hox102_out.fieldbyname('status').AsInteger=2)
   then exit;
   DataMod.Ins.callprocedure('UPD_MESS_ICON',[DataMod.HoxMessages_out.fieldbyname('ID').ASinteger,2]);
   Swift_Form.RefreshDATA;
end;

procedure TSwift_Form.ToolButton21Click(Sender: TObject);
begin
   if (DataMod.HoxMessages_out.RecordCount = 0)or
   (DataMod.Hox102_out.fieldbyname('status').AsInteger=1)or
   (DataMod.Hox102_out.fieldbyname('status').AsInteger=2)
   then exit;
   DataMod.Ins.callintegerfunction('UPD_HOX102_ICON',[DataMod.Hox102_out.fieldbyname('ID').ASinteger,2]);
   Swift_Form.RefreshDATA;
end;

procedure TSwift_Form.ToolButton4Click(Sender: TObject);
begin
   delete_mess_out.Execute;
end;

procedure TSwift_Form.ToolButton8Click(Sender: TObject);
begin
    {VIEW IN COMBO VALUTE}
     AddtoCOMBO(PropertiesForm.Combo_Valute,PropertiesForm.Valute_ID,DataMod.AValute,'Select * from Avalute','VALUTE','VALU_NAME');
     PropertiesForm.Combo_valute.ItemIndex:=0;
     if DataMod.TransTypeCode.Active = false then DataMod.TransTypeCode.Open;
     if DataMod.Account_data.Active =false then DataMod.Account_data.Open;
     if PropertiesForm.Commision.Active = false then PropertiesForm.Commision.Open;
     PropertiesForm.ForAll.Close;
     PropertiesForm.ForAll.SQL.Clear;
     PropertiesForm.ForAll.SQL.Add('Select * from hoxsw_proper');
     PropertiesForm.ForAll.Open;
     
     PropertiesForm.Edit_swift.Text:=PropertiesForm.forall.fieldbyname('swiftaccount').asstring;
     PropertiesForm.Edit_hox.Text:=PropertiesForm.forall.fieldbyname('hoxaccount').asstring;
     PropertiesForm.Edit_limit.Text:=PropertiesForm.forall.fieldbyname('hoxamount_limit').asstring;
     PropertiesForm.Edit_IN_Dir.Text:=PropertiesForm.forall.fieldbyname('hox_in_dir').asstring;
     PropertiesForm.Edit_out_dir.Text:=PropertiesForm.forall.fieldbyname('hox_out_dir').asstring;
     PropertiesForm.Edit_swIN.Text:=PropertiesForm.forall.fieldbyname('sw_in_dir').asstring;
     PropertiesForm.Edit_swOUT.Text:=PropertiesForm.forall.fieldbyname('sw_out_dir').asstring;
     PropertiesForm.Commision.Locate('id',PropertiesForm.forall.fieldbyname('transtypeid').AsInteger,[]);
     PropertiesForm.ShowModal;
end;

procedure TSwift_Form.ToolButton11Click(Sender: TObject);
   var i: integer;
   stdate,enddate: TDateTime;
begin
   If DataMod.Hox102_out.RecordCount = 0 then exit;
   if DataMod.BankInfo.Active = false then DataMod.BankInfo.Open; 
   PrepareFile_Form.Edit_sender.Text:=DataMod.BankInfo.FieldByName('SWIFT').AsString+'AXXX';
   PrepareFile_Form.Edit_reference.Clear;
   PrepareFile_Form.Edit_count.Text:='0';
   PrepareFile_Form.CurrencyEdit1.Text:='0';
   {SET DATE FOR DATA}
   StDate:=trunc(Swift_Form.StDate.DateTime);
   EndDate:=trunc(Swift_Form.EndDate.DateTime);
   PrepareFile_Form.NoSend.SetVariable('BeginDate',StDate);
   PrepareFile_Form.NoSend.SetVariable('EndDate',EndDate);
   PrepareFile_Form.ToSend.SetVariable('BeginDate',StDate);
   PrepareFile_Form.ToSend.SetVariable('EndDate',EndDate);
   if PrepareFile_Form.NoSend.Active = false then PrepareFile_Form.NoSend.Open else PrepareFile_Form.NoSend.Refresh;
   if PrepareFile_Form.ToSend.Active = false then PrepareFile_Form.ToSend.Open else PrepareFile_Form.ToSend.Refresh;
   PrepareFile_Form.ShowModal;
end;

procedure TSwift_Form.ToolButton5Click(Sender: TObject);
begin
   SendFileForm.DateTimePicker1.Date:=date;
   SendFileForm.DateTimePicker2.Date:=date;
   SendFileForm.RefDate;
//   if SendFileForm.Mt150.Active = false then SendFileForm.Mt150.Open;
//   SendFileForm.Mt150.Refresh;
   SendFileForm.ShowModal;
end;

procedure TSwift_Form.ToolButton12Click(Sender: TObject);
     var i : integer;
     ref : string;
begin
     Info_ListBox.Clear;
     for i:=0 to FileList_IN.Items.Count - 1 do
     begin
         ref:=LoadToRich(FileList_IN.Items[i]);
         if ref<>'0' then
         begin
         DataMod.HoxMessages_IN.Open;
         ConvertToBase(RichEdit1,ref );
         end
         else
         begin
         Panel_info.Show;
         Info_ListBox.Items.Add('ERROR:  <'+FileList_IN.Items[i]+'>   јртыг конверт олунуб !');
         end;
     end;
   DataMod.HoxMessages_IN_view.Refresh;
   Grid_in.SelectedRows.Clear;
end;

procedure TSwift_Form.ToolButton15Click(Sender: TObject);
begin
   FileList_IN.Update;
   Refresh_mess_in;
end;

procedure TSwift_Form.Clear1Click(Sender: TObject);
begin
   Info_ListBox.Items.Clear;
   Panel_info.Hide;
end;

procedure TSwift_Form.Grid_inDblClick(Sender: TObject);
begin
   if Grid_in.DataSource.DataSet.RecordCount = 0 then exit;
   if DataMod.Account_data.Active = false then DataMod.Account_data.Open; 
   RecMessDet_form.showmodal;
end;

procedure TSwift_Form.Popup_SingleConcertPopup(Sender: TObject);
begin
    if ((Popup_SingleConcert.PopupComponent as TFileListBox).Items.Count = 0)or((Popup_SingleConcert.PopupComponent as TFileListBox).ItemIndex =-1) then
        Popup_SingleConcert.Items[0].Enabled:=False else
        Popup_SingleConcert.Items[0].Enabled:=True;
end;

procedure TSwift_Form.Convert1Click(Sender: TObject);
    var ref :string;
begin
    Info_ListBox.Clear;
    ref:=LoadToRich(FileList_IN.Items[FileList_IN.itemindex]);
    if ref<>'0' then
       begin
         DataMod.HoxMessages_IN.Open;
         ConvertToBase(RichEdit1,ref );
       end
    else
       begin
         Panel_info.Show;
         Info_ListBox.Items.Add('ERROR:  <'+FileList_IN.Items[FileList_IN.itemindex]+'>   јртыг конверт олунуб !');
       end;
   DataMod.HoxMessages_IN_view.Refresh;
   Grid_in.SelectedRows.Clear;
end;

procedure TSwift_Form.Grid_inKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = Vk_delete then Delete_mess_in.Execute;
end;

procedure TSwift_Form.Delete_mess_inExecute(Sender: TObject);
   var i,j : integer;
begin
   Grid_in.SetFocus;
   for i:=0 to Grid_in.SelectedRows.Count-1 do
   begin
      Grid_in.DataSource.DataSet.GotoBookmark(pointer(Grid_in.SelectedRows.items[i]));
      case MessageDlg('Emeliyyat #'+DataMod.HoxMessages_IN_view.fieldbyname('id').AsString+' silinsizmi ?', mtConfirmation,[mbyes,mbno,mbcancel,mball], 0) of
           mryes :begin
                    DataMod.DEL.CallProcedure('DEL_MESS_IN',[Grid_in.DataSource.DataSet.fieldbyname('ID').asinteger]);
                    Grid_in.DataSource.DataSet.Refresh;
                    Grid_in.SelectedRows.Clear;
                  end;
           mrno  : exit;
           mrcancel : Break;
           mrall : begin
                   case MessageDlg(inttostr(Grid_in.SelectedRows.Count)+' sayda emeliyat silinsinmi ?', mtConfirmation,[mbyes,mbno], 0) of
                   mryes: begin
                             for j:=0 to Grid_in.SelectedRows.Count-1 do
                             begin
                                Grid_in.DataSource.DataSet.GotoBookmark(pointer(Grid_in.SelectedRows.items[j]));
                                DataMod.DEL.CallProcedure('DEL_MESS_IN',[Grid_in.DataSource.DataSet.fieldbyname('ID').asinteger]);
                             end;
                          Grid_in.DataSource.DataSet.Refresh;
                          Grid_in.SelectedRows.Clear;
                          break;
                          end;
                   mrno : exit;
                   end;
                   end;
      end;
   end;
end;

procedure TSwift_Form.ToolButton14Click(Sender: TObject);
begin
  Delete_mess_in.Execute;
end;

procedure TSwift_Form.Delete_mt102Execute(Sender: TObject);
   var i,j : integer;
begin
   GridMT102.SetFocus;
   for i:=0 to GridMT102.SelectedRows.Count-1 do
   begin
      GridMT102.DataSource.DataSet.GotoBookmark(pointer(GridMT102.SelectedRows.items[i]));
      case MessageDlg('Emeliyyat grupu #'+DataMod.Hox102_out.fieldbyname('id').AsString+' silinsinmi ?', mtConfirmation,[mbyes,mbno,mbcancel,mball], 0) of
           mryes :begin
                  DataMod.DEL.CallProcedure('DEL_MT102_OUT',[GridMT102.DataSource.DataSet.fieldbyname('ID').asinteger]);
                  RefreshDATA;
//                  DataMod.Hox102_out.Refresh;
//                  DataMod.HoxMessages_out.Refresh;
                  end;
           mrno  : exit;
           mrcancel : Break;
           mrall : begin
                   case MessageDlg(inttostr(GridMT102.SelectedRows.Count)+' sayda emeliyyat silinsinmi ?', mtConfirmation,[mbyes,mbno], 0) of
                   mryes: begin
                             for j:=0 to GridMT102.SelectedRows.Count-1 do
                             begin
                                GridMT102.DataSource.DataSet.GotoBookmark(pointer(GridMT102.SelectedRows.items[j]));
                                DataMod.DEL.CallProcedure('DEL_MT102_OUT',[GridMT102.DataSource.DataSet.fieldbyname('ID').asinteger]);
                             end;
                          RefreshDATA;
//                          DataMod.Hox102_out.Refresh;
//                          DataMod.HoxMessages_out.Refresh;
                          break;
                          end;
                   mrno : exit;
                   end;
                   end;
      end;
   end;

end;

procedure TSwift_Form.delete_mess_outExecute(Sender: TObject);
   var i,j : integer;
begin
   BrowseGrid.SetFocus;
   for i:=0 to BrowseGrid.SelectedRows.Count-1 do
   begin
      BrowseGrid.DataSource.DataSet.GotoBookmark(pointer(BrowseGrid.SelectedRows.items[i]));
      case MessageDlg('Emeliyyat #'+DataMod.HoxMessages_out.fieldbyname('id').AsString+' silinsizmi ?', mtConfirmation,[mbyes,mbno,mbcancel,mball], 0) of
           mryes :begin
                  DataMod.DEL.CallProcedure('DEL_MESS_OUT',[BrowseGrid.DataSource.DataSet.fieldbyname('ID').asinteger]);
                  DataMod.INS.Callprocedure('UPD_HOX102_AMOUNT',[DataMod.Hox102_out.fieldbyname('ID').asinteger]);
                  Swift_Form.RefreshDATA;
                  end;
           mrno  : exit;
           mrcancel : Break;
           mrall : begin
                   case MessageDlg(inttostr(BrowseGrid.SelectedRows.Count)+' sayda emeliyat silinsinmi ?', mtConfirmation,[mbyes,mbno], 0) of
                   mryes: begin
                             for j:=0 to BrowseGrid.SelectedRows.Count-1 do
                             begin
                                BrowseGrid.DataSource.DataSet.GotoBookmark(pointer(BrowseGrid.SelectedRows.items[j]));
                                DataMod.DEL.CallProcedure('DEL_MESS_OUT',[BrowseGrid.DataSource.DataSet.fieldbyname('ID').asinteger]);

                             end;
                          DataMod.INS.Callprocedure('UPD_HOX102_AMOUNT',[DataMod.Hox102_out.fieldbyname('ID').asinteger]);
                          Swift_Form.RefreshDATA;
                          break;
                          end;
                   mrno : exit;
                   end;
                   end;
      end;
   end;
end;

procedure TSwift_Form.ToolButton9Click(Sender: TObject);
begin
  Delete_mt102.Execute;
end;

procedure TSwift_Form.GridMT102KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=vk_delete then Delete_mt102.Execute;
end;

procedure TSwift_Form.BrowseGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=vk_delete then delete_mess_out.Execute;
end;

procedure TSwift_Form.Gridin_SelAllExecute(Sender: TObject);
begin
  with Grid_in, SelectedRows, DataSource.DataSet do
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

procedure TSwift_Form.ToolButton16Click(Sender: TObject);
   var i : integer;
begin
     for i:=0 to Grid_in.SelectedRows.Count-1 do
     begin
     if DataMod.HoxMessages_IN_view.FieldByName('status').AsInteger = 1 then Continue;
     Grid_in.DataSource.DataSet.GotoBookmark(pointer(Grid_in.SelectedRows.items[i]));
       DataMod.Ins.callprocedure('ParentAndChildTransForIN',[DataMod.HoxMessages_IN_view.fieldbyname('ID').ASinteger]);
     end;
     FileList_IN.Update;
     RefreshMessinWithPos;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSwift_Form,
    Class_Swift_Form,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

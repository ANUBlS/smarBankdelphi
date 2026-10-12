unit BlankMainImpl;
           //refresh
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,shellapi,
  ActiveX, AxCtrls, BlankMainProj_TLB, StdVcl, ExtCtrls, XFSCtrls, StdCtrls,
  DBCtrls, DBGridEhGrouping, GridsEh, DBGridEh, DB, OracleData,variants, Grids,
  XDBGrids, ComCtrls, ToolWin, ImgList, ActnList, Oracle, PlgModalContainer,
  CMExcelExport, Menus, DBGrids;

type
TGuidError = Exception;
  TBlankMain = class(TActiveForm, IBlankMain)

    XFPanel1: TXFPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ImageList: TImageList;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    pmcCallActiveX: TPlgModalContainer;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    XFPanel4: TXFPanel;
    XDBGrid1: TXDBGrid;
    XFPanel3: TXFPanel;
    EditS_NOVU: TEdit;
    EditPOLIS: TEdit;
    EditCUSTNAME: TEdit;
    EditAGENT: TEdit;
    EditAMMOUNT: TEdit;
    Memo1: TMemo;
    EditINSSUMM: TEdit;
    EditTARIFF: TEdit;
    EditFRANSHIZ: TEdit;
    ExcelExport: TCMExcelExport;
    ImageList2: TImageList;
    Emeliyyat: TPopupMenu;
    dmplan1: TMenuItem;
    N8: TMenuItem;
    dmlr1: TMenuItem;
    N7: TMenuItem;
    Zrrlr1: TMenuItem;
    N9: TMenuItem;
    Xitam1: TMenuItem;
    ffgd1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Gndlikzrrlr1: TMenuItem;
    N3: TMenuItem;
    krarsigortannpremiyabarderosunundnmsi1: TMenuItem;
    N4: TMenuItem;
    krarsiortayazrrbarderosunundnmsi1: TMenuItem;
    N5: TMenuItem;
    krarsiortayaxitambarderosunundnmsi1: TMenuItem;
    N6: TMenuItem;
    krarsiortannsubroqasiyabarderosunundnmsi1: TMenuItem;
    EditVALYUTA: TEdit;
    N10: TMenuItem;
    Yenilm1: TMenuItem;
    N11: TMenuItem;
    Kmk1: TMenuItem;
    N12: TMenuItem;
    esdiq1: TMenuItem;
    EditNAME1: TEdit;
    N13: TMenuItem;
    Onlineodeme1: TMenuItem;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    XFGroupBox1: TXFGroupBox;
    RGContract: TXFRadioGroup;
    XFGroupBox2: TXFGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    XFCheckBox1: TXFCheckBox;
    XFGroupBox11: TXFGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    XFCheckBox9: TXFCheckBox;
    XFGroupBox3: TXFGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    XFCheckBox2: TXFCheckBox;
    XFGroupBox8: TXFGroupBox;
    DBLookupComboBox5: TDBLookupComboBox;
    XFCheckBox8: TXFCheckBox;
    XFPanel2: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFButton1: TXFButton;
    XFGroupBox5: TXFGroupBox;
    ComboBox1: TComboBox;
    XFCheckBox4: TXFCheckBox;
    XFGroupBox10: TXFGroupBox;
    ComboBox2: TComboBox;
    XFCheckBox5: TXFCheckBox;
    XFCheckBox7: TXFCheckBox;
    XFRadioGroup2: TXFRadioGroup;
    Faydagötürən: TXFGroupBox;
    XFCheckBox10: TXFCheckBox;
    XFRadioButton2: TXFRadioButton;
    XFRadioButton1: TXFRadioButton;
    XFCheckBox11: TXFCheckBox;
    XFButton2: TXFButton;
    XFGroupBox4: TXFGroupBox;
    XFRadioGroup1: TXFRadioGroup;
    XFCheckBox6: TXFCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    XFCheckBox3: TXFCheckBox;
    Memo2: TMemo;
    N14: TMenuItem;
    Dogumgnexcel1: TMenuItem;
    N15: TMenuItem;
    Bildiris1: TMenuItem;
    BildirisHuquqi1: TMenuItem;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure RGContractClick(Sender: TObject);
    procedure XFCheckBox8Click(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure XFCheckBox1Click(Sender: TObject);
    procedure XFCheckBox9Click(Sender: TObject);
    procedure XFCheckBox2Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFCheckBox3Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure EditS_NOVUExit(Sender: TObject);
    procedure EditS_NOVUKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton13Click(Sender: TObject);
    procedure XDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TXColumn; State: TGridDrawState);
    procedure XitamBarderosu1Click(Sender: TObject);
    procedure dmplan1Click(Sender: TObject);
    procedure dmlr1Click(Sender: TObject);
    procedure Zrrlr1Click(Sender: TObject);
    procedure Xitam1Click(Sender: TObject);
    procedure ffgd1Click(Sender: TObject);
    procedure Gndlikzrrlr1Click(Sender: TObject);
    procedure krarsigortannpremiyabarderosunundnmsi1Click(Sender: TObject);
    procedure krarsiortayazrrbarderosunundnmsi1Click(Sender: TObject);
    procedure krarsiortayaxitambarderosunundnmsi1Click(Sender: TObject);
    procedure krarsiortannsubroqasiyabarderosunundnmsi1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Yenilm1Click(Sender: TObject);
    procedure XDBGrid1CellClick(Column: TXColumn);
    procedure XDBGrid1TitleClick(Column: TXColumn);
    procedure XDBGrid1ColumnScroll(Sender: TObject; LeftIndex: Integer);
    procedure XDBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Kmk1Click(Sender: TObject);
    procedure esdiq1Click(Sender: TObject);
    procedure EditCUSTNAMEKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure Onlineodeme1Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure XFCheckBox11Click(Sender: TObject);
    procedure XFCheckBox7Click(Sender: TObject);
    procedure Bonushesabat1Click(Sender: TObject);
    procedure Dogumgnexcel1Click(Sender: TObject);
    procedure Bildiris1Click(Sender: TObject);
    procedure BildirisHuquqi1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IBlankMainEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure CallChangeForm(Params : TStringList);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionSpeedSearchExecute(Sender: TObject);
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

    procedure RefreshContractRec;
    var
        CID,filterstatus:integer;
        FilterStr1,grup1,grup2,grup3:string;
  end;

implementation

uses ComObj, ComServ,sboapiDataModuleimpl,SBTranslateProc,
  FrmFilterBlankMainImpl, BlankDMImpl,CommanParametrs, Unit3, Birthexcel;

{$R *.DFM}

{ TBlankMain }

procedure TBlankMain.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_BlankMainPage); }
end;

procedure TBlankMain.EditCUSTNAMEKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13  then
  begin
      //New Addition
      EditNAME1.Text := EditCUSTNAME.Text;
      {  Replace I, i, İ, i  }
      with EditNAME1 do
      begin
          Text := StringReplace(Text, 'i', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'İ', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'ı', '`', [rfReplaceAll]);
      end;

       //ActionSpeedSearchExecute(Sender);
       ActionSpeedSearchExecute(EditNAME1);
  end;
end;

procedure TBlankMain.EditS_NOVUExit(Sender: TObject);
begin
  TEdit(Sender).Text :=EmptyStr;
end;

procedure TBlankMain.EditS_NOVUKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13  then
  begin
   ActionSpeedSearchExecute(Sender);
  end;



 { if Key = #13 then
  begin
      //New Addition
      EditNAME1.Text := EditCUST_NAME.Text;

      with EditNAME1 do
      begin
          Text := StringReplace(Text, 'i', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, 'I', '`', [rfReplaceAll]);
          Text := StringReplace(Text, '?', '`', [rfReplaceAll]);
      end;

       ActionSpeedSearchExecute(EditNAME1);
  end;   }
end;
procedure TBlankMain.esdiq1Click(Sender: TObject);
begin
//BlankDM.DSFullContarct.FieldByName('').AsString;
{
BlankDM.DSContract.Close;
BlankDM.DSContract.SetVariable('pid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
BlankDM.DSContract.open;
BlankDM.DSContract.Refresh;
BlankDM.DSContract.edit;

BlankDM.DSContract.FieldByName('state').AsInteger:=6;
BlankDM.DSContract.Post;
}                                       //changed in august 19 2019 S.M
end;

procedure TBlankMain.ActionSpeedSearchExecute(
  Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));


    with  TOracleDataSet(XDBGrid1.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlansın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmayıb!',mtInformation,[mbOK],0);
 end;
end;



procedure TBlankMain.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IBlankMainEvents;
end;

procedure TBlankMain.ffgd1Click(Sender: TObject);
var
a:string;
begin
if XDBGrid1.DataSource.DataSet.recordcount=0 then
 begin
 Showmessage('Diqqət! Cədvəldə məlumat yoxdur.');
   exit;
 end;
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEBARDERO_TERMINATE']);
 end;
    BlankDM.DSReins.close;
    BlankDM.DSReins.SetVariable('pcid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
    BlankDM.DSReins.Open;

   if BlankDM.DSReins.FieldByName('say').AsInteger=0 then
    begin
       showmessage('Diqqət! Yalnız təkrarsığortaya göndərilmiş müqavilə üçün Xitam barderosu yığmaq olar!');
       exit;
    end;

       if XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger<>8 then
    begin
       showmessage('Diqqət! Yalnız xitam statusunda olan müqavilə üçün Xitam barderosu yığmaq olar!');
       exit;
    end;
//commandepid:=XDBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
//a:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsString;
Bordero_type:='xitam';
//showmessage(a);
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
 loadPlugin('reinsurance.bpl','terminate');
end;

procedure TBlankMain.Initialize;
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

function TBlankMain.Get_Active: WordBool;
begin
  Result := Active;
end;

function TBlankMain.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TBlankMain.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TBlankMain.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TBlankMain.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TBlankMain.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TBlankMain.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TBlankMain.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TBlankMain.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TBlankMain.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TBlankMain.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TBlankMain.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TBlankMain.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TBlankMain.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TBlankMain.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TBlankMain.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TBlankMain.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TBlankMain.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TBlankMain.Gndlikzrrlr1Click(Sender: TObject);
begin
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['DAILY_LOSSES']);
 end;

 {
with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['LOSSCONTRACT_KASKO']);
 end; }
     {with InsMKDataMod do
     begin
          ODSClaims.SetVariable('id',cid);

          ODSClaimSal.SetVariable('eid',cid);
     end;
     frmClaims:=TfrmClaims.Create(self);
     frmClaims.ShowModal; }
     loadPlugin('loss.bpl','AllLost');


end;

procedure TBlankMain._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBlankMain.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TBlankMain.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TBlankMain.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TBlankMain.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TBlankMain.DBLookupComboBox5Click(Sender: TObject);
begin

// ActionFilterExecute(Sender);
end;

procedure TBlankMain.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TBlankMain.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TBlankMain.dmlr1Click(Sender: TObject);
begin
if XDBGrid1.DataSource.DataSet.recordcount=0 then
 begin
 Showmessage('Diqqət! Cədvəldə məlumat yoxdur.');
   exit;
 end;
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEPAYMENT']);
 end;

contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
 contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('InsPayment.bpl','');
end;

procedure TBlankMain.dmplan1Click(Sender: TObject);
begin

with BlankDM,sb_aca do begin
CallProcedure('checkadvancedobjectaccess',['ENTER_PEYMENT_PLAN1']);
end;

if XDBGrid1.DataSource.DataSet.recordcount=0 then
 begin
 Showmessage('Diqqət! Cədvəldə məlumat yoxdur.');
   exit;
 end;
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
//ShowMessage(IntToStr(contactid));
loadPlugin('InsPaymentPlan.bpl','');
end;

procedure TBlankMain.Dogumgnexcel1Click(Sender: TObject);
begin


BlankDM.dsbirth.SQL.Text:=BlankDM.DSFullContarct.SQL.Text;
 BlankDM.dsbirth.Open;
 Memo1.Text:= BlankDM.dsbirth.SQL.Text;

 with TForm5.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;

end;

procedure TBlankMain.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TBlankMain.Kmk1Click(Sender: TObject);
begin
//ShellExecuteA(CommonApplication.Handle, 'open', 'Ins_chm.chm', nil, nil, SW_SHOWNORMAL);

//ShellExecuteA(CommonApplication1.Handle, 'create', 'CreditsMgr.chm', nil, nil, SW_SHOWNORMAL);
ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'Ins_chm.chm'), nil, nil, SW_SHOW);
end;

procedure TBlankMain.krarsigortannpremiyabarderosunundnmsi1Click(
  Sender: TObject);
begin
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEALLBARDERO_PREMIYA']);
 end;
 Bordero_type:='S_haqqi';
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('Reinsurance.bpl','operation');

end;

procedure TBlankMain.krarsiortannsubroqasiyabarderosunundnmsi1Click(
  Sender: TObject);
begin
{with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEALLBARDERO_TERMINATE']);
 end; }
Bordero_type:='sub';
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('Reinsurance.bpl','operation');

end;

procedure TBlankMain.krarsiortayaxitambarderosunundnmsi1Click(Sender: TObject);
begin
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEALLBARDERO_TERMINATE']);
 end;
Bordero_type:='xitam';
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('Reinsurance.bpl','operation');
end;

procedure TBlankMain.krarsiortayazrrbarderosunundnmsi1Click(Sender: TObject);
begin
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEALLBARDERO_LOSS']);
 end;
 Bordero_type:='Zerer';
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('Reinsurance.bpl','operation');

end;

procedure TBlankMain.Onlineodeme1Click(Sender: TObject);
  var
 trid, parentid, selectrow, i: integer;

    begin

    with XDBGrid1, DataSource.DataSet do
  begin
    selectrow := SelectedRows.Count;

    for i := 0 to selectrow - 1 do
      begin
      GotoBookmark(Pointer(SelectedRows[I]));
              //ShowMessage(BlankDM.DSFullContarct.FieldByName('ammount').AsString);
 with BlankDM do
  begin
    if  OPCOMMON.CallBooleanFunction('addpaymentReal',[BlankDM.DSFullContarct.FieldByName('idc').AsInteger,
                                                       BlankDM.DSFullContarct.FieldByName('ammount').AsFLOAT,
                                                       1,
                                                       null,
                                                       null,
                                                       55989,
                                                       null] )=true then


end;
end;
ShowMessage('Müqavilələr ödəndi');
end;
end;

procedure TBlankMain.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TBlankMain.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TBlankMain.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TBlankMain.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TBlankMain.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TBlankMain.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TBlankMain.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TBlankMain.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TBlankMain.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TBlankMain.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TBlankMain.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBlankMain.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TBlankMain.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TBlankMain.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TBlankMain.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TBlankMain.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TBlankMain.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TBlankMain.ToolButton11Click(Sender: TObject);
begin
 with TFrmFilterBlankMain.Create(Self) do
  try
    FrmFilterBlankMain.ShowModal;
  finally
    Free;
  end;
end;

procedure TBlankMain.ToolButton13Click(Sender: TObject);
begin

  {
   if (BlankDM.Ds_user.FieldByName('user').AsString='SEDR') or
    (BlankDM.Ds_user.FieldByName('user').AsString='SATISH_MUD') then
   begin
   XDBGrid1.DataSource.DataSet.FieldByName('mobilephone').Visible:=true;
   end;
              }



//ShowMessage(XDBGrid1.DataSource.DataSet.FieldByName('user').AsString);


if (XDBGrid1.DataSource.DataSet.FieldByName('user').AsString='SEDR') or
(XDBGrid1.DataSource.DataSet.FieldByName('user').AsString='SATISH_MUD')or
 (XDBGrid1.DataSource.DataSet.FieldByName('user').AsString='SMART') then
begin
  XDBGrid1.DataSource.DataSet.FieldByName('mobilephone').Visible:=true;
  XDBGrid1.DataSource.DataSet.FieldByName('USER_ADI').Visible:=true;
   XDBGrid1.DataSource.DataSet.FieldByName('adress').Visible:=true;
end;

 with ExcelExport do
   begin
      Connect;
      ExportDataset(XDBGrid1.DataSource.DataSet,'Bütün sığortalar.',True,false);
      Disconnect;
   end;

end;

procedure TBlankMain.ToolButton15Click(Sender: TObject);
var
  Params : TStringList;
  a:integer;
  p_obeykt_type,p_obeykt_name:string;
begin
moduletype:='m';
opetion:='See';

//showmessage('Salam1');

ins_cutsid:=XDBGrid1.DataSource.DataSet.FieldByName('kli_id').AsInteger;
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
p_contractstate:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
  with BlankDM do
 begin
     DSins_insur.Close;
     DSins_insur.SetVariable('p_id',XDBGrid1.DataSource.DataSet.FieldByName('TYPE_ID').AsInteger);
     DSins_insur.Open;

     p_obeykt_type:= DSins_insur.FieldByName('obeykt_type').AsString;
     p_obeykt_name:= DSins_insur.FieldByName('changeguid').AsString;

 end;

           if p_obeykt_type='ocx' then
     begin

      pmcCallActiveX.p_id:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
      //showmessage(inttostr(pmcCallActiveX.p_id));
 Params := TStringList.Create;
  with BlankDM.ODSContracts,BlankDM.OPCOMMON, Params do

  try
            a:=BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['Mod']:= 'Edit';
    Values['СID']:= FloatToStr(XDBGrid1.DataSource.DataSet.FieldByName('idc').asFloat);
    Values['bid']:= BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['KLI_ID']:= FloatToStr(XDBGrid1.DataSource.DataSet.FieldByName('KLI_ID').asFloat);
    BlankDM.OPCOMMON.CallProcedure('p_ins_cid',[FieldByName('ID').asFloat,a,FloatToStr(FieldByName('KLI_ID').asFloat),'Edit']);
    CallChangeForm(Params);

  finally
    Params.Free;
  end;
end;
  if p_obeykt_type='bpl'  then
  begin
  //commoncid:=InsCustomersForm.DBGridContracts.DataSource.DataSet.FieldByName('id').AsInteger;
  // showmessage(inttostr(commoncid));
  //p_obeykt_name:=''''+fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString+'''';
  //p_obeykt_name:=fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString;
    loadPlugin1(p_obeykt_name,'');

  end;



end;

procedure TBlankMain.ToolButton1Click(Sender: TObject);
var
Params : TStringList;
  a:integer;
  p_obeykt_type,p_obeykt_name:string;
begin


if XDBGrid1.DataSource.DataSet.RecordCount=0 then
begin
  showmessage('Heç bir müqavilə seçilməyib!');
  exit;
end;
 BlankDM.DSContract.Close;
 BlankDM.DSContract.SetVariable('pid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
 BlankDM.DSContract.Open;

opetion:='upd';


ins_cutsid:=XDBGrid1.DataSource.DataSet.FieldByName('KLI_ID').AsInteger;
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
  //showmessage(floattostr(XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger));
  //showmessage(floattostr(contactid));
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
p_contractstate:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;

// showmessage('Salam2');

 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['EDITINSCONTRACTS']);
 end;


 if (XDBGrid1.DataSource.DataSet.RecordCount<>0) and (XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger=7) then
 begin

   with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['REFUSALINS_EDİTCONTRACTS']);
 end;

  if MessageDlg('Seçilmiş siğorta müqaviləsi redaktə statusuna keçəcək əminsinizmi?',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
 begin
  with BlankDM, OPCOMMON do
  if OPCOMMON.CallIntegerFunction('editcontract', [XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger])=1 then begin
    MessageDlg('Müqavilə redaktə statusuna keçdi.', mtInformation, [mbok], 0);
    BlankDM.DSFullContarct.Refresh;
  end;
 end;

 end;

  with BlankDM do
 begin
     DSins_insur.Close;
     DSins_insur.SetVariable('p_id',XDBGrid1.DataSource.DataSet.FieldByName('TYPE_ID').AsInteger);
     DSins_insur.Open;

     p_obeykt_type:= DSins_insur.FieldByName('obeykt_type').AsString;
     p_obeykt_name:= DSins_insur.FieldByName('changeguid').AsWideString;

 end;

           if p_obeykt_type='ocx' then
     begin

      pmcCallActiveX.p_id:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
      //showmessage(inttostr(pmcCallActiveX.p_id));
 Params := TStringList.Create;
  with BlankDM.DSContract,BlankDM.OPCOMMON, Params do

  try
            a:=BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['Mod']:= 'Edit';
    Values['СID']:= FloatToStr(FieldByName('ID').asFloat);
    Values['bid']:= BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['KLI_ID']:= FloatToStr(FieldByName('KLI_ID').asFloat);
    BlankDM.OPCOMMON.CallProcedure('p_ins_cid',[FieldByName('ID').asFloat,a,FloatToStr(FieldByName('KLI_ID').asFloat),'Edit']);
    CallChangeForm(Params);

  finally
    Params.Free;
  end;
end;
  if p_obeykt_type='bpl'  then
  begin
  //commoncid:=InsCustomersForm.DBGridContracts.DataSource.DataSet.FieldByName('id').AsInteger;
  // showmessage(inttostr(commoncid));
  //p_obeykt_name:=''''+fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString+'''';
  //p_obeykt_name:=fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString;
    loadPlugin(p_obeykt_name,'');

  end;




end;

procedure TBlankMain.ToolButton3Click(Sender: TObject);
(*var
  Params : TStringList;
  a:integer;
  p_obeykt_type,p_obeykt_name:string;   *)
  var
  funcname : String;
   trid, parentid, selectrow, i,a,c_acc: integer;
begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['COMMITINSCONTRACTS']);
 end;

 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
    contactid:=XDBGrid1.DataSource.DataSet.FieldByName('IDC').asInteger ;
 with BlankDM do
 begin
   DSPaymentSettingInfo.Close;
   DSPaymentSettingInfo.SetVariable('pcid',contactid);
   DSPaymentSettingInfo.Open;

   if DSPaymentSettingInfo.FieldByName('say').AsInteger=0 then
   begin
     showmessage('Diqqət! Bu müqavilənin Ödəmə planı haqqındakı məlumatları yığılmayıb!');
     exit;
   end;


   DSPaymentsetting.Close;
   DSPaymentsetting.SetVariable('pcid',contactid);
   DSPaymentsetting.Open;

   DSPaymentInfo.Close;
   DSPaymentInfo.SetVariable('pcid',contactid);
   DSPaymentInfo.Open;

    if DSPaymentsetting.FieldByName('payment_type').AsInteger=2 then
    begin
   if DSPaymentInfo.FieldByName('say').AsInteger=0 then
   begin
     showmessage('Diqqət! Bu müqavilənin Ödəmə planı hissələrlə ödəniş olduğundan ödəmə planı yığılmalıdır!');
     exit;
   end;
   end;

 end;
 if (XDBGrid1.DataSource.DataSet.FieldByName('type_id').asInteger=2)   then
 begin
  BlankDM.DSMedEmploes.Close;
  BlankDM.DSMedEmploes.SetVariable('pcid',contactid);
  BlankDM.DSMedEmploes.Open;
 if (BlankDM.DSMedEmploes.RecordCount=0) then
 begin
   showmessage('Diqqət! Bu tibbi sığorta müqaviləsi üçün Sığortalanacaq işçilərin siyahısı yığılmayıb!');
   exit;
 end;
 end;

   BlankDM.DScontractcommit.Close;
   BlankDM.DScontractcommit.SetVariable('pid',contactid);
   BlankDM.DScontractcommit.Open;

 if BlankDM.DScontractcommit.FieldByName('valute_id').AsInteger<>0 then
   begin

   BlankDM.DSOperkurs.close;
   BlankDM.DSOperkurs.SetVariable('pval_kod',BlankDM.DScontractcommit.FieldByName('valute_id').AsInteger);
   BlankDM.DSOperkurs.SetVariable('pdat',BlankDM.DScontractcommit.FieldByName('ins_date').AsDateTime);
   BlankDM.DSOperkurs.Open;
           if BlankDM.DSOperkurs.FieldByName('say').AsInteger=0 then
           begin

       showmessage('Diqqət !Sistemdə bu müqavilənin  muqavilə tarixinə və valyutasına uyğun kurs movcudd deyil.');
       exit;
           end;
   end;


       with XDBGrid1, DataSource.DataSet do
  begin
    selectrow := SelectedRows.Count;

    for i := 0 to selectrow - 1 do
      begin
      GotoBookmark(Pointer(SelectedRows[I]));

            with BlankDM, OPCOMMON do
   begin
   a:=CallIntegerFunction('get_acc_balanc_hesab',[21]);
    if a=0 then
     begin
       showmessage('Diqqət ! Bu müqavilə tipində avtomatik hesabların açılası üçün balans hesabları sazlanmayıb!.');
       exit;
     end;
   end;

           //ShowMessage(IntToStr(BlankDM.DSFullContarct.FieldByName('idc').AsInteger));

               with BlankDM, OPCOMMON do
   begin
     c_acc:=CallIntegerFunction('get_acc_id',[BlankDM.DSFullContarct.FieldByName('idc').AsInteger]);
        // ShowMessage(IntToStr(c_acc));
     if c_acc=0 then
       begin
    CallProcedure('account_open',[BlankDM.DSFullContarct.FieldByName('idc').AsInteger,BlankDM.DSFullContarct.FieldByName('filial').AsInteger]);
       end;
       end;
    if BlankDM.OPCOMMON.CallIntegerFunction('commitcontract', [BlankDM.DSFullContarct.FieldByName('idc').AsInteger])=1 then
     begin
    BlankDM.DSFullContarct.Refresh;
    ToolButton3.Enabled:=false;
  end;
   //MessageDlg(IntToStr(SelectedRows.Count) +'Təsdiq olundu.', mtInformation, [mbok], 0);
  end;
      MessageDlg(IntToStr(SelectedRows.Count) + '   Müqavilə təsdiq olundu.', mtInformation, [mbok], 0);
  end;

(*if XDBGrid1.DataSource.DataSet.RecordCount=0 then
begin
  showmessage('Heç bir müqavilə seçilməyib!');
  exit;
end;
 BlankDM.DSContract.Close;
 BlankDM.DSContract.SetVariable('pid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
 BlankDM.DSContract.Open;

opetion:='upd';


ins_cutsid:=XDBGrid1.DataSource.DataSet.FieldByName('KLI_ID').AsInteger;
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
  //showmessage(floattostr(XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger));
  //showmessage(floattostr(contactid));
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
p_contractstate:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;

// showmessage('Salam2');

 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['EDITINSCONTRACTS']);
 end;


 if (XDBGrid1.DataSource.DataSet.RecordCount<>0) and (XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger=7) then
 begin

   with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['REFUSALINS_EDİTCONTRACTS']);
 end;

  if MessageDlg('Seçilmiş siğorta müqaviləsi redaktə statusuna keçəcək əminsinizmi?',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
 begin
  with BlankDM, OPCOMMON do
  if OPCOMMON.CallIntegerFunction('editcontract', [XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger])=1 then begin
    MessageDlg('Müqavilə redaktə statusuna keçdi.', mtInformation, [mbok], 0);
    BlankDM.DSFullContarct.RefreshRecord;
  end;
 end;

 end;

  with BlankDM do
 begin
     DSins_insur.Close;
     DSins_insur.SetVariable('p_id',XDBGrid1.DataSource.DataSet.FieldByName('TYPE_ID').AsInteger);
     DSins_insur.Open;

     p_obeykt_type:= DSins_insur.FieldByName('obeykt_type').AsString;
     p_obeykt_name:= DSins_insur.FieldByName('changeguid').AsString;

 end;

           if p_obeykt_type='ocx' then
     begin

      pmcCallActiveX.p_id:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
      //showmessage(inttostr(pmcCallActiveX.p_id));
 Params := TStringList.Create;
  with BlankDM.DSContract,BlankDM.OPCOMMON, Params do

  try
            a:=BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['Mod']:= 'Edit';
    Values['СID']:= FloatToStr(FieldByName('ID').asFloat);
    Values['bid']:= BlankDM.OPCOMMON.CallIntegerFunction('get_blank_id',[FieldByName('ID').asFloat]);
    Values['KLI_ID']:= FloatToStr(FieldByName('KLI_ID').asFloat);
    BlankDM.OPCOMMON.CallProcedure('p_ins_cid',[FieldByName('ID').asFloat,a,FloatToStr(FieldByName('KLI_ID').asFloat),'Edit']);
    CallChangeForm(Params);

  finally
    Params.Free;
  end;
end;
  if p_obeykt_type='bpl'  then
  begin
  //commoncid:=InsCustomersForm.DBGridContracts.DataSource.DataSet.FieldByName('id').AsInteger;
  // showmessage(inttostr(commoncid));
  //p_obeykt_name:=''''+fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString+'''';
  //p_obeykt_name:=fmNewInsurance.DBGrid1.DataSource.DataSet.FieldByName('changeguid').AsString;
    loadPlugin(p_obeykt_name,'');

  end;

     *)
end;

procedure TBlankMain.ActiveFormCreate(Sender: TObject);
begin

filterstatus:=0;
XFCheckBox7.Checked:=false;

BlankDM:=TBlankDM.Create(Self);
FilterStr1:=BlankDM.DSFullContarct.SQL.Text;
Memo2.Text:=' GROUP BY ic.id,ic.rowid,ic.commit_date,ii.name,ic.bnf_type,av.val_name,ic.policy_num,ic.close_prefix,ics.surname,ics.name,ics.fathername,cust.name,cust.id,ia.name,ia.surname,ia.fathername,ic.tariff,ic.filial,ic.franshiz,ins_date,ic.begin_date,'
+ 'ic.end_date,ic.state,ic.type_id,ii.mainformguid,ii.changeguid,ic.loanacc_id,ic.curracc_id,ic.agent_id,ic.kli_id,ii.suggestionguid,ii.policyguid,ii.mainformname,im.id,im.INSUREDMARK,im.INSUREDMODEL,im.INSUREDSTATENUM,im.INSUREDCOLOR,im.INSUREDOUTPUTYEAR,'
+ 'im.INSUREDENGINENUM,im.UNDERFRAMENUM,ics.mobilephone,em.locationobj,'
+'im.INSUREDBANNUM,im.color_id,im.model_id,im.marka_id,ic.inssumm,ict.stage_tesdiq_dat,ictd.terminted_amount,cust.cust_type,ic.userinsert,ics.dateofbirth,em.cost,mk.drivecost,ic.insured,ics.address';
//grup1:='GROUP BY ic.id,ic.rowid,ic.commit_date,ii.name,ic.bnf_type,av.val_name,ic.policy_num,ic.close_prefix,ics.surname,ics.name,ics.fathername,cust.name,cust.id,ia.name,ia.surname,ia.fathername,ic.tariff,ic.filial,ic.franshiz,ins_date,ic.begin_date,ic.end_date,';
//grup2:='ic.state,ic.type_id,ii.mainformguid,ii.changeguid,ic.loanacc_id,ic.curracc_id,ic.agent_id,ic.kli_id,ii.suggestionguid,ii.policyguid,ii.mainformname,im.id,im.INSUREDMARK,im.INSUREDMODEL,im.INSUREDSTATENUM,im.INSUREDCOLOR,im.INSUREDOUTPUTYEAR,';
//grup3:='im.INSUREDENGINENUM,im.UNDERFRAMENUM,ics.mobilephone,im.INSUREDBANNUM,im.color_id,im.model_id,im.marka_id,ic.inssumm,ict.stage_tesdiq_dat,ictd.terminted_amount,cust.cust_type,ic.userinsert';
RGContract.ItemIndex:=0;
 XFRadioGroup1.ItemIndex:=0;
 XFRadioGroup2.ItemIndex:=0;
 XFRadioButton1.Checked:=true;
 DateTimePicker1.DateTime:=BlankDM.DSSysdat.FieldByName('tek_dat').AsDateTime;
 DateTimePicker2.DateTime:=BlankDM.DSSysdat.FieldByName('tek_dat').AsDateTime;
    Xcommangrid:=XDBGrid1;
 FrmFilterBlankMain:=TFrmFilterBlankMain.Create(Self);
  commandataset:=BlankDM.DSFullContarct;

end;

procedure TBlankMain.Bildiris1Click(Sender: TObject);
var
   WordApp:OleVariant;
   wrdDataDoc,wrdApp,wrdSelection : Variant;
   i,n:integer;
   FileName,str:String;
begin


           FileName:=ExtractFilePath(Application.ExeName)+ '\bildiris.docx';
           wrdApp := CreateOleObject('Word.Application');
           wrdApp.Visible := True;
           wrdDataDoc := wrdApp.Documents.Open(FileName);
           wrdSelection:=wrdApp.Selection;

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'policy_num');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
          // wrdSelection.Font.Color := clRed;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('polis').AsString);

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'begin_date');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
          // wrdSelection.Font.Color := clRed;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('begin_date').AsString);



           wrdSelection.GoTo(-1,unAssigned,unAssigned,'CUSTNAME');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=11;
           wrdSelection.Font.Bold := True;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('CUSTNAME').AsString);

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'adress');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=11;
           wrdSelection.Font.Bold := True;
           //wrdSelection.WordWrap:=true;
           str:=XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString;
           if Length(str)>25 then
               str:=copy(XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString,0,25)+ #13#10+copy(XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString,25,250);


           wrdSelection.TypeText(str);

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'CUSTNAME2');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('CUSTNAME2').AsString);







end;

procedure TBlankMain.BildirisHuquqi1Click(Sender: TObject);
var
   WordApp:OleVariant;
   wrdDataDoc,wrdApp,wrdSelection : Variant;
   i,n:integer;
   FileName,str:String;
begin


           FileName:=ExtractFilePath(Application.ExeName)+ '\bildirishuq.docx';
           wrdApp := CreateOleObject('Word.Application');
           wrdApp.Visible := True;
           wrdDataDoc := wrdApp.Documents.Open(FileName);
           wrdSelection:=wrdApp.Selection;

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'policy_num');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
          // wrdSelection.Font.Color := clRed;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('polis').AsString);

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'begin_date');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
          // wrdSelection.Font.Color := clRed;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('begin_date').AsString);



           wrdSelection.GoTo(-1,unAssigned,unAssigned,'CUSTNAME');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=11;
           wrdSelection.Font.Bold := True;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('CUSTNAME').AsString);

           wrdSelection.GoTo(-1,unAssigned,unAssigned,'adress');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=11;
           wrdSelection.Font.Bold := True;
           //wrdSelection.WordWrap:=true;
           str:=XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString;
           if Length(str)>25 then
               str:=copy(XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString,0,25)+ #13#10+copy(XDBGrid1.DataSource.DataSet.FieldByName('adress').AsString,25,250);


           wrdSelection.TypeText(str);

         {  wrdSelection.GoTo(-1,unAssigned,unAssigned,'CUSTNAME2');
           wrdSelection.Font.Name := 'Times New Roman';
           wrdSelection.Font.Size :=14;
           wrdSelection.Font.Bold := True;
           wrdSelection.TypeText(XDBGrid1.DataSource.DataSet.FieldByName('CUSTNAME2').AsString);    }






end;

procedure TBlankMain.Bonushesabat1Click(Sender: TObject);
begin
   TForm3.Create(self);
 Form3.ShowModal;
end;

procedure TBlankMain.Button1Click(Sender: TObject);
begin
RGContract.ItemIndex:=-1;
end;

procedure TBlankMain.CallChangeForm(Params : TStringList);
var
  CallerGuid : TGUID;
begin
 with BlankMain do
 begin
   // ShowMessage(BlankDM.DSFullContarct.FieldByName('CHANGEGUID').AsString);
  if BlankDM.DSFullContarct.FieldByName('CHANGEGUID').AsString = '' then
  raise   TGuidError.Create('Guid is empty w');
  CallerGuid := StringToGuid(BlankDM.DSFullContarct.FieldByName('CHANGEGUID').AsString);
//  fmContainer := TfmContainer.Create(Self);

//  fmContainer.OpenObj(CallerGuid, Params);
  if pmcCallActiveX.ShowModal(CallerGuid, Params) = mrOk then
//  if fmContainer.ShowModal = mrOk then
      RefreshContractRec();
 end;
end;
procedure TBlankMain.RefreshContractRec;
begin
  with BlankDM.DSFullContarct do
     Refresh;
end;

procedure TBlankMain.RGContractClick(Sender: TObject);
begin
 ActionFilterExecute(Sender);
end;

procedure TBlankMain.ActionFilterExecute(Sender: TObject);

   function  CheckFiltered(IsChecked: Boolean; const FilterStr: String; Args: array of const): String;
   begin
    Result :='';
    if  IsChecked  then
     Result :=Format(FilterStr, Args);
     //showmessage('Result= '+Result)  ;
   end;

const
   BooleanPrefix = ' AND ';
   StatusFilter = '(ic.close_prefix=%d)';
   nametype= '(ic.type_id=%d)';
   nameFilter = '(ic.KLI_ID=%d)';
   custFilter = '(cust.id=%d)';
   AGENT_IDFilter = '(ic.AGENT_ID=%d)';
   marka_IDFilter='(im.MARKA_ID=%d)';
   Avtotype_IDFilter='(im.INSUREDTYPE=%d)';
   FransizaFilter = '(ic.franshiz=%d)';
   begindateFilter = ' ic.begin_date ';
   enddateFilter = ' ic.end_date ';
   insdatafilter='ic.ins_date'  ;
   bankenarfilter = '(ic.bnf_type=%d)';
var
   Status:    String;
   p_name:    String;
   p_CUST_ID:  String;
   p_AGENT_ID:  String;
   p_marka:    String;
   p_Avtotype:   String;
   p_fransiza:   String;
   p_type:     String;
   p_ins_date  :String;
   p_begin_date:   String;
   p_end_date:   String;
   p_terminate_date:   String;
   pstate:integer;
   p_Reins:string;
   bankenar: String;

   FilterStr: String;
begin
 FilterStr :='';
  // showmessage(StatusFilter);
 Status :=CheckFiltered(
               RGContract.ItemIndex <> -1
             ,StatusFilter
             ,[RGContract.ItemIndex]
              );

             {  bankenar :=CheckFiltered(
               XFRadioGroup2.ItemIndex <> -1
             ,bankenarfilter
             ,[XFRadioGroup2.ItemIndex]
              );         }

 p_type :=CheckFiltered(
              XFCheckBox8.Checked//DBLookupBranch.KeyValue <> -1
             ,nametype
             ,[DBLookupComboBox5.ListSource.DataSet.FieldByName('id').asinteger]
              );
 p_name :=CheckFiltered(
              XFCheckBox1.Checked//DBLookupBranch.KeyValue <> -1
             ,nameFilter
             ,[DBLookupComboBox1.ListSource.DataSet.FieldByName('id').asinteger]
              );
 p_cust_id :=CheckFiltered(
              XFCheckBox9.Checked  //DBLookupOperator.KeyValue <> -1
             ,custFilter
             ,[DBLookupComboBox6.ListSource.DataSet.FieldByName('ID').AsInteger]
              );

 p_AGENT_ID:=CheckFiltered(
              XFCheckBox2.Checked//DBLookupCurrency.KeyValue <> -1
             ,AGENT_IDFilter
             ,[DBLookupComboBox2.ListSource.DataSet.FieldByName('id').AsInteger]
              );

                   if XFCheckBox5.Checked=true then
    begin
    if ComboBox2.ItemIndex=0 then

      p_Reins:=' ic.id in  (select cid from ins_reinsurance)'
      else
      //p_Reins:=' ic.id not in  (select cid from ins_reinsurance)';
      p_Reins:=' ic.id in  ((select id from ins_contracts minus select id from ins_contracts where id in  (select cid from ins_reinsurance)))';
      end
      else
      begin

      p_Reins:='';
      end;


 if Status='' then
 FilterStr:='ic.close_prefix in(0,1)'
 else
 FilterStr :=Status;

 { if Status='' then
   FilterStr:='status is not null'
 else
    FilterStr :=Status;    }



   if XFRadioButton1.Checked then
   bankenar:='bnf_type=1'
   else
   bankenar:='bnf_type in(2,3,4,5,6,7,8,9,10,11,12,13,14,15,21,22,41,42,43,44,45,46,47,48)';


    if XFCheckBox10.Checked then
    if FilterStr='' then
    FilterStr:=bankenar
    else
     FilterStr :=FilterStr + BooleanPrefix + bankenar;


  if  XFCheckBox8.Checked //Branch <> ''
  then
  if  FilterStr=''  then
    FilterStr :=p_type //and 'ic.type_id=5 '   ic.AGENT_ID=1
  else
    FilterStr :=FilterStr + BooleanPrefix + p_type;

  if  XFCheckBox1.Checked //Branch <> ''
  then
  if  FilterStr=''  then
    FilterStr :=p_name
  else
    FilterStr :=FilterStr + BooleanPrefix + p_name;

    if  XFCheckBox9.Checked //Operator <> ''
  then
  if  FilterStr=''  then
    FilterStr :=p_cust_id
  else
    FilterStr :=FilterStr + BooleanPrefix + p_cust_id;

 if  XFCheckBox2.Checked //Currency <> ''
  then
  if  FilterStr=''  then
    FilterStr :=p_AGENT_ID
  else
    FilterStr :=FilterStr + BooleanPrefix + p_AGENT_ID;


      if  XFCheckBox5.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_Reins
  else
    FilterStr :=FilterStr + BooleanPrefix + p_Reins;


  if XFCheckBox3.Checked then
  begin
      if XFRadioGroup1.ItemIndex=3 then
      begin
        p_begin_date:=begindateFilter+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';

    if  FilterStr=''  then
    FilterStr :=BooleanPrefix+p_begin_date
  else
    FilterStr :=FilterStr + BooleanPrefix + p_begin_date;
    //showmessage(FilterStr);
      end;

      if XFRadioGroup1.ItemIndex=1 then
      begin
       p_end_date:=enddateFilter+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';
       //showmessage(p_end_date);
  if  FilterStr=''  then
    FilterStr :=p_end_date
  else
    FilterStr :=FilterStr + BooleanPrefix + p_end_date;
      end;

       if XFRadioGroup1.ItemIndex=2 then
      begin
       p_terminate_date:='  ic.id in (select cid from ins_contract_terminated where stage_tesdiq_dat'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+''''+')';
       //showmessage(p_end_date);
  if  FilterStr=''  then
    FilterStr :=p_terminate_date
  else
    FilterStr :=FilterStr + BooleanPrefix + p_terminate_date;
      end;

       if XFRadioGroup1.ItemIndex=0 then
      begin
       p_ins_date:=insdatafilter+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';
       //showmessage(p_end_date);
  if  FilterStr=''  then
    FilterStr :=p_ins_date
  else
    FilterStr :=FilterStr + BooleanPrefix + p_ins_date;
      end;



  end;
            if XFCheckBox4.Checked=true then
    begin

    case ComboBox1.ItemIndex of
   0:pstate:=6;
   1:pstate:=0;
   2:pstate:=7;
   3:pstate:=8;
     end;




       if  FilterStr=''  then
       begin

    FilterStr :=' and ic.state='+inttostr(pstate);
    end
  else
    FilterStr :=FilterStr + ' and ic.state='+inttostr(pstate);
      end;

      //Memo2.Text:=FilterStr;


  //BlankDM.DSFullContarct.sql[3]:=' where '+ FilterStr;
  BlankDM.DSFullContarct.sql.Text:=FilterStr1+BooleanPrefix+FilterStr+Memo2.Text;

       if XFCheckBox7.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
         // BlankDM.DSFullContarct.sql[21]:='';
       end;
       if XFCheckBox8.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
                end;
      {  if XFCheckBox1.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
       end;                      }
        if XFCheckBox9.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
       end;
        if XFCheckBox2.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
       end;
        if XFCheckBox3.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
       end;
        if XFCheckBox4.Checked=true then
       begin
        BlankDM.DSFullContarct.sql[19]:='';
       end;
        if XFCheckBox5.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='';
       end;

      if XFCheckBox11.Checked=true then
       begin
          BlankDM.DSFullContarct.sql[19]:='and ic.state=6 and ic.end_date>=sbop.get_date';
         // BlankDM.DSFullContarct.sql[21]:='';
       end;


  //memo1.Text:=FilterStr1+BooleanPrefix+ FilterStr;
    memo1.Text:=BlankDM.DSFullContarct.sql.Text;

 // BlankDM.DSFullContarct.sql[20]:=Stringreplace(BlankDM.DSFullContarct.sql[20],'status','DECODE (ic.close_prefix, 0, 1, 2)', [rfReplaceAll, rfIgnoreCase]);

  BlankDM.DSFullContarct.close;
  BlankDM.DSFullContarct.Open;

end;

procedure TBlankMain.ToolButton5Click(Sender: TObject);
begin
(*BlankDM.DSFullContarct.Close;
BlankDM.DSFullContarct.Open;*)

  if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
  if BlankDM.DSFullContarct.FieldByName('state').AsInteger<>6 then
  begin
  showmessage('Diqqət! Yalniz Təsdiq olunmuş muqavilə inkar statusuna keçrilə bilər!');
  exit;
   end;

     if BlankDM.DSFullContarct.FieldByName('commit_date').AsDateTime<>BlankDM.DSSysdat.FieldByName('tek_dat').AsDateTime then
  begin
  showmessage('Diqqət! System tarixindən fərqli tarixdə təsdiq olunmuş müqaviləni "İnkar" etmək olmaz!');
  exit;
   end;




 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['REFUSALINSCONTRACTS']);
 end;


       BlankDM.DSpaymentcommit.Close;
       BlankDM.DSpaymentcommit.SetVariable('pcid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
       BlankDM.DSpaymentcommit.open;

       if BlankDM.DSpaymentcommit.FieldByName('say').AsInteger<>0 then
       begin

with BlankDM,sb_aca do
begin
  CallProcedure('checkadvancedobjectaccess',['REFUS_COMMIT_CONTRACTS']);
end;
        end;


  with BlankDM, OPCOMMON do
  if OPCOMMON.CallIntegerFunction('cancelcontract', [DSFullContarct.fieldbyname('IDC').asInteger])=1 then begin
    MessageDlg('Əməliyyatlar pozuldu', mtInformation, [mbok], 0);
    DSFullContarct.Refresh;
  end;



end;

procedure TBlankMain.ToolButton7Click(Sender: TObject);
begin


 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['CLOSEINSCONTRACTS']);
 end;

  if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;

 {ShowMessage(FloatToStr(InsDataMod.ODSContractsID.Value));
 ShowMessage(FloatToStr(InsDataMod.ODSContractsType_Id.value));  }
 if MessageDlg('Seçilmiş siğorta ləğv olunacaq!',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
try
   with BlankDM,OPCOMMON,ODSContracts do
   begin
   //showmessage(inttostr(ODSContracts.FieldByName('ID').AsInteger));
   //showmessage(inttostr(ODSContracts.FieldByName('TYPE_ID').AsInteger));

        if BlankDM.OPCOMMON.callbooleanfunction('del_ins',[DSFullContarctIDC.Value,DSFullContarctTYPE_ID.value]) then

        DSFullContarct.Refresh;

   end;
except
    on E:EOracleError do
    case E.ErrorCode of
       20002: if MessageDlg('Seçilmiş müqaviləyə uyğun hesablar ləğv olunacaq!',mtConfirmation,mbYesNoCancel, 0) = mrYes then
                       begin
                    BlankDM.ODSAccount.close;
                    BlankDM.ODSAccount.SetVariable('ownid',XDBGrid1.DataSource.DataSet.FieldByName('IDC').AsInteger);
                    BlankDM.ODSAccount.Open;


                 BlankDM.OPCOMMON.CallProcedure('close_acc', [BlankDM.ODSAccountID.value]);
                       end;
       20001: ShowMessage('Aslı hesablarda qalıq sıfırdan fərqlidir!');
                    end;




 end;

end;

procedure TBlankMain.ToolButton9Click(Sender: TObject);
begin
 XFGroupBox1.Visible :=not XFGroupBox1.Visible;



end;

procedure TBlankMain.XDBGrid1CellClick(Column: TXColumn);
  var
  a:real;
begin
  contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('CLOSE_PREFIX').AsInteger;

       with BlankDM.ODSContracts do
 begin
   BlankDM.DSPaymentSettingInfo.Close;
   BlankDM.DSPaymentSettingInfo.SetVariable('pcid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
   BlankDM.DSPaymentSettingInfo.Open;

   a:=XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger;
//showmessage(floattostr(a));


   //ToolButton3.Enabled :=(FieldByName('state').asInteger in [0, 2, 4]);
             if a=0 then
              ToolButton3.Enabled:=true
              else
              ToolButton3.Enabled:=false;


      if (BlankDM.DSPaymentSettingInfo.FieldByName('say').AsInteger in [0]) then
      begin
      //showmessage('Salam1');
      ToolButton3.Enabled:=false;
      end;
      //InsCustomersForm.aEditIns.Enabled := (FieldByName('state').asInteger in [0, 2, 4,7]);

 end;


end;

procedure TBlankMain.XDBGrid1ColumnScroll(Sender: TObject; LeftIndex: Integer);
begin
  with Sender as TXDBGrid do
  begin
       if DataSource.DataSet.FieldByName('state').AsInteger=0 then
     begin
       ToolButton3.Enabled:=true;
     end;
  end ;

end;

procedure TBlankMain.XDBGrid1DrawColumnCell(Sender: TObject;
 const Rect: TRect;DataCol: Integer; Column: TXColumn;
 State: TGridDrawState);

var
  ImageIndex: Integer;
begin
  with Sender as TXDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      ImageIndex := DataSource.DataSet.FieldByName('state').AsInteger ;
      if (DataCol = 1) and (ImageIndex <> -1) then begin

        Canvas.brush.Style := bsSolid;
        Canvas.FillRect(Rect);

        if DataSource.DataSet.FieldByName('C_FULL_CLAIM').AsInteger>0  then

        ImageList2.Draw(Canvas, Rect.Left, Rect.Top,10, True)
        else
             ImageList2.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True);

        end

      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;


  end;


end;

procedure TBlankMain.XDBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  a:real;
begin
     with BlankDM.ODSContracts do
 begin
   BlankDM.DSPaymentSettingInfo.Close;
   BlankDM.DSPaymentSettingInfo.SetVariable('pcid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
   BlankDM.DSPaymentSettingInfo.Open;

   a:=XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger;
//showmessage(floattostr(a));


   //ToolButton3.Enabled :=(FieldByName('state').asInteger in [0, 2, 4]);
             if a=0 then
              ToolButton3.Enabled:=true
              else
              ToolButton3.Enabled:=false;


      if (BlankDM.DSPaymentSettingInfo.FieldByName('say').AsInteger in [0]) then
      begin
      //showmessage('Salam1');
      ToolButton3.Enabled:=false;
      end;
      //InsCustomersForm.aEditIns.Enabled := (FieldByName('state').asInteger in [0, 2, 4,7]);

 end;
end;

procedure TBlankMain.XDBGrid1TitleClick(Column: TXColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 if (BlankDM.DSFullContarct.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with BlankDM, DSFullContarct do
  try
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;

end;

procedure TBlankMain.XFButton1Click(Sender: TObject);
begin
ActionFilterExecute(Sender);
end;

procedure TBlankMain.XFButton2Click(Sender: TObject);
begin
RGContract.ItemIndex:=-1;
end;

procedure TBlankMain.XFCheckBox11Click(Sender: TObject);
begin
XFCheckBox7.Checked:=false;
end;

procedure TBlankMain.XFCheckBox1Click(Sender: TObject);
begin
   if XFCheckBox1.Checked=True then
DBLookupComboBox1.Enabled:=True
else
 DBLookupComboBox1.Enabled:=False;
  // ActionFilterExecute(Sender);
end;

procedure TBlankMain.XFCheckBox2Click(Sender: TObject);
begin
   if XFCheckBox2.Checked=True then
DBLookupComboBox2.Enabled:=True
else
 DBLookupComboBox2.Enabled:=False;
   //ActionFilterExecute(Sender);
end;

procedure TBlankMain.XFCheckBox3Click(Sender: TObject);
begin
   {if XFCheckBox3.Checked=True then
XFGroupBox4.Enabled:=True
else
 XFGroupBox4.Enabled:=False;  }
end;

procedure TBlankMain.XFCheckBox7Click(Sender: TObject);
begin
XFCheckBox11.Checked:=false;
end;

procedure TBlankMain.XFCheckBox8Click(Sender: TObject);
begin
   if XFCheckBox8.Checked=True then
DBLookupComboBox5.Enabled:=True
else
 DBLookupComboBox5.Enabled:=False;
   //ActionFilterExecute(Sender);
end;

procedure TBlankMain.XFCheckBox9Click(Sender: TObject);
begin
   if XFCheckBox9.Checked=True then
DBLookupComboBox6.Enabled:=True
else
 DBLookupComboBox6.Enabled:=False;
   //ActionFilterExecute(Sender);
end;

procedure TBlankMain.Xitam1Click(Sender: TObject);
begin
if XDBGrid1.DataSource.DataSet.recordcount=0 then
 begin
 Showmessage('Diqqət! Cədvəldə məlumat yoxdur.');
   exit;
 end;
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['TERMINATEDINS_CONTRACT']);
 end;
 if XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger<>8  then
 begin
 if XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger<>6  then
 begin
 Showmessage('Diqqət!Yalnız Təsdiq statusunda olan muqaviləyə xitam vermək olar.');
   exit;
 end;
 end;

contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
 loadPlugin('InsContracterminated.bpl','');

end;

procedure TBlankMain.XitamBarderosu1Click(Sender: TObject);
var
a:string;
begin
with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEEBARDERO_TERMINATE']);
 end;
    BlankDM.DSReins.close;
    BlankDM.DSReins.SetVariable('pcid',XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger);
    BlankDM.DSReins.Open;

   if BlankDM.DSReins.FieldByName('say').AsInteger=0 then
    begin
       showmessage('Diqqət! Yalnız təkrarsığortaya göndərilmiş müqavilə üçün Xitam barderosu yığmaq olar!');
       exit;
    end;

       if XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger<>8 then
    begin
       showmessage('Diqqət! Yalnız xitam statusunda olan müqavilə üçün Xitam barderosu yığmaq olar!');
       exit;
    end;
//commandepid:=XDBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
//a:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsString;
Bordero_type:='xitam';
//showmessage(a);
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
 loadPlugin('reinsurance.bpl','terminate');

end;

procedure TBlankMain.Yenilm1Click(Sender: TObject);
begin
      BlankDM.DSFullContarct.close;
      BlankDM.DSFullContarct.open;
end;

procedure TBlankMain.Zrrlr1Click(Sender: TObject);
begin
if XDBGrid1.DataSource.DataSet.recordcount=0 then
 begin
 Showmessage('Diqqət! Cədvəldə məlumat yoxdur.');
   exit;
 end;
 if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=4 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSKASKO']);
 end;
 end;

 if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=1 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSFQ']);
 end;
 end;

 if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=13 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSMES']);
 end;
 end;

  if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=8 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSYUK']);
 end;
  end;

  if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=3 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSEMLAK']);
 end;
 end;

 if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=21 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSSEYAHET']);
 end;
 end;

 if XDBGrid1.DataSource.DataSet.FieldByName('type_id').AsInteger=2 then
 begin
 with BlankDM,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SEELOSSTIBB']);
 end;
 end;
 commoncid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
contactid:=XDBGrid1.DataSource.DataSet.FieldByName('idc').AsInteger;
  contractstatus:=XDBGrid1.DataSource.DataSet.FieldByName('STATE').AsInteger;
     loadPlugin('loss.bpl','');
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TBlankMain,
    Class_BlankMain,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

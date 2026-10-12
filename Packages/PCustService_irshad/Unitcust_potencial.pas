unit Unitcust_potencial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, ComCtrls, StdCtrls, DBCtrls, Mask, DBCtrlsEh,
  Grids, XDBGrids, DB, OracleData, ImgList;

type
  TForm_custPotencial = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    XFPanel1: TXFPanel;
    XFPanel3: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    XFLabel5: TXFLabel;
    XFLabel6: TXFLabel;
    XFLabel7: TXFLabel;
    XFLabel8: TXFLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Datetime: TDBDateTimeEditEh;
    Label1: TLabel;
    EditPhoneMob: TMaskEdit;
    EditPhoneCity: TEdit;
    DBLookupCo_departamnet: TDBLookupComboBox;
    DBLookupComStatus: TDBLookupComboBox;
    XFPanel4: TXFPanel;
    XDBGrid1: TXDBGrid;
    memo: TMemo;
    XFButton1: TXFButton;
    ODs_main: TOracleDataSet;
    dsrc_Main: TDataSource;
    XFLabel9: TXFLabel;
    DBLookupComUser: TDBLookupComboBox;
    Ods_departament: TOracleDataSet;
    Ods_call: TOracleDataSet;
    Ods_user: TOracleDataSet;
    dsrc_departament: TDataSource;
    dsrc_call: TDataSource;
    dsrc_user: TDataSource;
    ODs_mainID: TFloatField;
    ODs_mainNAME: TWideStringField;
    ODs_mainADDRESS: TWideStringField;
    ODs_mainPHONE_M: TWideStringField;
    ODs_mainPHONE_H: TWideStringField;
    ODs_mainCALLE_USER: TWideStringField;
    ODs_mainCALL_RESULT: TWideStringField;
    ODs_mainCALL_STATUS: TWideStringField;
    ODs_mainDEPARTMENT: TWideStringField;
    ODs_mainCALL_DATE: TDateTimeField;
    ODs_mainCALLEUSER: TWideStringField;
    ODs_mainCALLSTATUS: TFloatField;
    ODs_mainDEPARTMENT_: TFloatField;
    XFButton2: TXFButton;
    XFButton3: TXFButton;
    XFButton4: TXFButton;
    ImageList1: TImageList;
    CBSearch: TComboBox;
    EditSearch: TEdit;
    XFPanel5: TXFPanel;
    XFLabel10: TXFLabel;
    XFLabel11: TXFLabel;
    XFLabel12: TXFLabel;
    XFLabel13: TXFLabel;
    XFLabel14: TXFLabel;
    XFLabel15: TXFLabel;
    XFLabel16: TXFLabel;
    XFLabel17: TXFLabel;
    Label2: TLabel;
    XFLabel18: TXFLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    MaskEdit1: TMaskEdit;
    Edit5: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Memo1: TMemo;
    DBLookupComboBox3: TDBLookupComboBox;
    XFPanel6: TXFPanel;
    XFButton5: TXFButton;
    XFButton6: TXFButton;
    XFButton7: TXFButton;
    XFButton8: TXFButton;
    conboSearch: TComboBox;
    EdiSearch: TEdit;
    XFPanel2: TXFPanel;
    XDBGrid2: TXDBGrid;
    Ods_meeting: TOracleDataSet;
    dsrc_meeting: TDataSource;
    Ods_meetingID: TFloatField;
    Ods_meetingNAME: TWideStringField;
    Ods_meetingADDRESS: TWideStringField;
    Ods_meetingPHONE_M: TWideStringField;
    Ods_meetingPHONE_H: TWideStringField;
    Ods_meetingMEETING_USER: TWideStringField;
    Ods_meetingMEETINGUSER: TWideStringField;
    Ods_meetingMEETING_RESULT: TWideStringField;
    Ods_meetingAGREEMENT_CASE: TWideStringField;
    Ods_meetingMEETING_STSTUS: TWideStringField;
    Ods_meetingMEETINGSTSTUS: TFloatField;
    Ods_meetingDEPARTMENT: TWideStringField;
    Ods_meetingDEPARTMENT_: TFloatField;
    Ods_meetingMEETING_DATE: TDateTimeField;
    procedure XFButton1Click(Sender: TObject);
    procedure EditPhoneMobChange(Sender: TObject);
    procedure XDBGrid1CellDblClick(Column: TXColumn);
    procedure Custclear(Sender: TObject) ;
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton4Click(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XDBGrid1TotalClick(Column: TXColumn; Index: Integer);
    procedure XFButton5Click(Sender: TObject);
    procedure XFButton8Click(Sender: TObject);
    procedure XFButton7Click(Sender: TObject);
    procedure EdiSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_custPotencial: TForm_custPotencial;

implementation

uses UnitDataModPCustService,sboapiDataModuleImpl;

{$R *.dfm}


 procedure TForm_custPotencial.Custclear(Sender: TObject) ;
begin
 edit1.Clear;
 edit2.Clear;
 EditPhoneCity.Clear;
 EditPhoneMob.Clear;
 memo.Clear;
 Datetime.Clear;
 DBLookupComStatus.KeyValue:=-1;
 DBLookupComUser.KeyValue:=-1;
 DBLookupCo_departamnet.KeyValue:=-1;
end;

procedure TForm_custPotencial.EdiSearchChange(Sender: TObject);
begin
 if Length(EdiSearch.Text)<>0 then
  begin
  Ods_meeting.Close;
  case CBSearch.ItemIndex of
  0:Ods_meeting.SQL[10]:='and ID like '''+EdiSearch.Text+'%''';
  1:Ods_meeting.SQL[10]:='and upper(name) like upper(''%'+EdiSearch.Text+'%'')';
  2:Ods_meeting.SQL[10]:='and upper(meeting_user) like upper(''%'+EdiSearch.Text+'%'')';
  3:Ods_meeting.SQL[10]:='and upper(meeting_STATUS) like upper(''%'+EdiSearch.Text+'%'')';
  4:Ods_meeting.SQL[10]:='and upper(DEPARTMENT) like upper(''%'+EdiSearch.Text+'%'')';
   end;
  //SHOWMESSAGE(ods_main.Fields[CBSearch.ItemIndex].FieldName+'---'+EditSearch.Text);
  Ods_meeting.Open;
  end
  else
  begin
  Ods_meeting.Close;
  Ods_meeting.SQL[10]:='';
  Ods_meeting.Open;
  end;
end;

procedure TForm_custPotencial.EditPhoneMobChange(Sender: TObject);
begin
TMaskEdit(Sender).Modified := False;
end;

procedure TForm_custPotencial.EditSearchChange(Sender: TObject);
begin
 if Length(EditSearch.Text)<>0 then
  begin
  ods_main.Close;
  case CBSearch.ItemIndex of
  0:ods_main.SQL[10]:='and ID like '''+EditSearch.Text+'%''';
  1:ods_main.SQL[10]:='and upper(name) like upper(''%'+EditSearch.Text+'%'')';
  2:ods_main.SQL[10]:='and upper(calle_user) like upper(''%'+EditSearch.Text+'%'')';
  3:ods_main.SQL[10]:='and upper(CALL_STATUS) like upper(''%'+EditSearch.Text+'%'')';
  4:ods_main.SQL[10]:='and upper(DEPARTMENT) like upper(''%'+EditSearch.Text+'%'')';
   end;
  //SHOWMESSAGE(ods_main.Fields[CBSearch.ItemIndex].FieldName+'---'+EditSearch.Text);
  ods_main.Open;
  end
  else
  begin
  ods_main.Close;
  ods_main.SQL[10]:='';
  ods_main.Open;
  end;
end;

procedure TForm_custPotencial.FormShow(Sender: TObject);
 var i :integer;
begin
  CBSearch.Clear;
//for i := 0 to XDBGrid1.Columns.Count-1 do
CBSearch.Items.Add(XDBGrid1.Columns[0].Title.Caption);
CBSearch.Items.Add(XDBGrid1.Columns[1].Title.Caption);
CBSearch.Items.Add(XDBGrid1.Columns[6].Title.Caption);
CBSearch.Items.Add(XDBGrid1.Columns[8].Title.Caption);
CBSearch.Items.Add(XDBGrid1.Columns[9].Title.Caption);

 CBSearch.ItemIndex:=0;

conboSearch.Items.Add(XDBGrid1.Columns[0].Title.Caption);
conboSearch.Items.Add(XDBGrid1.Columns[1].Title.Caption);
conboSearch.Items.Add(XDBGrid1.Columns[6].Title.Caption);
conboSearch.Items.Add(XDBGrid1.Columns[8].Title.Caption);
conboSearch.Items.Add(XDBGrid1.Columns[9].Title.Caption);

 conboSearch.ItemIndex:=0;
end;

procedure TForm_custPotencial.XDBGrid1CellDblClick(Column: TXColumn);
begin
 edit1.Text:=ODs_mainNAME.AsString;
 edit2.Text:=ODs_mainADDRESS.AsString;
 EditPhoneCity.Text:=ODs_mainPHONE_H.AsString;
 EditPhoneMob.Text:=ODs_mainPHONE_M.Asstring;
 memo.Text:=ODs_mainCALL_RESULT.AsString;
 if VarIsNull(ODs_mainCALL_DATE.AsVariant) then
  begin
 Datetime.text:=''
  end
  else
 Datetime.Value:=ODs_mainCALL_DATE.AsVariant;

 if not ODs_mainCALLSTATUS.IsNull then
 begin
 DBLookupComStatus.KeyValue:=ODs_mainCALLSTATUS.AsString;
 end
 else
 DBLookupComStatus.KeyValue:=-1;
if not ODs_mainDEPARTMENT_.IsNull then
 begin
 DBLookupCo_departamnet.KeyValue:=ODs_mainDEPARTMENT_.AsString;
 end
 else
  DBLookupCo_departamnet.KeyValue:=-1;
  if not  ODs_mainCALLEUSER.IsNull then
  begin
 DBLookupComUser.KeyValue:=ODs_mainCALLEUSER.AsString;
  end
  else
  DBLookupComUser.KeyValue:=-1;

end;

procedure TForm_custPotencial.XDBGrid1TotalClick(Column: TXColumn;
  Index: Integer);
  var
TitleName:string;
begin
if Column.Field.Calculated then Exit;
 TitleName :=Column.FieldName;
 with ods_main do
 begin
  Screen.Cursor :=crSQLWait;
  SetVariable('Title',TitleName);
  Refresh;
  Screen.Cursor :=crDefault;
 end;
{
 with ods_main do
  begin
    SetVariable('Title', Column.FieldName);
    Refresh;
  end;  }
end;

procedure TForm_custPotencial.XFButton1Click(Sender: TObject);
 var
        c_name,c_address,c_calle,c_call_result, c_phone_m,c_phone_h:string;
        c_call_status,c_department:integer;
        c_call_date :Variant;
        c_id:integer;

begin
 if edit1.Text='' then
 begin
 showmessage('  Müştərinin adı sahəsini daxil eidn !');
 exit;
 end;
if edit2.Text='' then
 begin
 showmessage('  Ünvanı sahəsini daxil eidn !');
 exit;
 end;
  if Datetime.Value=null then
 begin
 showmessage('  Tarix sahəsini daxil eidn !');
 exit;
 end;

 if DBLookupComUser.Text='' then
 begin
 showmessage('  Zəng edeən şəxs sahəsini daxil eidn !');
 exit;
 end;
  if DBLookupCo_departamnet.Text='' then
 begin
 showmessage('  Şöbə sahəsini daxil eidn !');
 exit;
 end;
 if DBLookupComStatus.Text='' then
 begin
 showmessage('  Status sahəsini daxil eidn !');
 exit;
 end;

      c_name:=edit1.Text;
      c_address:=edit2.Text;
      c_phone_h:=EditPhoneCity.Text;
      c_phone_m:=EditPhoneMob.Text;
      c_call_result:=memo.Text;
      c_call_date:=Datetime.Value;
      c_call_status:=DBLookupComStatus.KeyValue;
      c_department:=DBLookupCo_departamnet.KeyValue;
      c_calle:=DBLookupComUser.KeyValue;

      if MessageDlg('  Yeni  Müştərini  yaddaşa yazmaq istəyirsinizmi   ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then
  begin
 DataModPCustService.PG_PCustService.CallProcedure('add_cust_potencial_calle',
      [ c_id,
        c_name,
        c_address,
        c_phone_m,
        c_phone_h,
        c_calle,
        c_call_result,
        c_call_status,
        c_department,
        c_call_date
        ]);
   c_id:= DataModPCustService.PG_PCustService.GetParameter(0);
     Custclear(Sender);
    with ods_main do
 begin
  //c_id :=FieldByName('ID').AsInteger;
  CloseAll;
  Open;
   Locate('ID', c_id, []);
 end;

   end;
end;

procedure TForm_custPotencial.XFButton2Click(Sender: TObject);
 var
        c_name,c_address,c_calle,c_call_result, c_phone_m,c_phone_h:string;
        c_id,c_call_status,c_department:integer;
        c_call_date :Variant;
     AccountID:LongInt;

begin
 if edit1.Text='' then
 begin
 showmessage('  Müştərinin adı sahəsini daxil eidn !');
 exit;
 end;
if edit2.Text='' then
 begin
 showmessage('  Ünvanı sahəsini daxil eidn !');
 exit;
 end;
  if Datetime.Value=null then
 begin
 showmessage('  Tarix sahəsini daxil eidn !');
 exit;
 end;

 if DBLookupComUser.Text='' then
 begin
 showmessage('  Zəng edeən şəxs sahəsini daxil eidn !');
 exit;
 end;
  if DBLookupCo_departamnet.Text='' then
 begin
 showmessage('  Şöbə sahəsini daxil eidn !');
 exit;
 end;
 if DBLookupComStatus.Text='' then
 begin
 showmessage('  Status sahəsini daxil eidn !');
 exit;
 end;
      c_id:=ODs_mainid.AsInteger;
      c_name:=edit1.Text;
      c_address:=edit2.Text;
      c_phone_h:=EditPhoneCity.Text;
      c_phone_m:=EditPhoneMob.Text;
      c_call_result:=memo.Text;
      c_call_date:=Datetime.Value;
      c_call_status:=DBLookupComStatus.KeyValue;
      c_department:=DBLookupCo_departamnet.KeyValue;
      c_calle:=DBLookupComUser.KeyValue;


  if MessageDlg('  Dəyşikliki  Yadda  saxlanılsınmı ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then
   begin
 DataModPCustService.PG_PCustService.CallProcedure('edit_cust_potencial_calle',
      [ c_id,
        c_name,
        c_address,
        c_phone_m,
        c_phone_h,
        c_calle,
        c_call_result,
        c_call_status,
        c_department,
        c_call_date
        ]);
  // ODs_main.Refresh;
   Custclear(Sender);
    with ods_main do
 begin
  AccountID :=FieldByName('ID').AsInteger;
  CloseAll;
  Open;
  Locate('ID', AccountID, []);
 end;
   end;
end;



procedure TForm_custPotencial.XFButton3Click(Sender: TObject);
  var
  c_id :integer;
begin
c_id:=XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;

 if MessageDlg('   Müştəri  silinəcək əminsinizmi  ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then
DataModPCustService.PG_PCustService.CallProcedure('delete_cust_potencial_calle',
      [ c_id]);
      ODs_main.Refresh;
end;

procedure TForm_custPotencial.XFButton4Click(Sender: TObject);
begin
Form_custPotencial.Close;
end;

procedure TForm_custPotencial.XFButton5Click(Sender: TObject);
var
        c_name,c_address,c_calle,c_call_result, c_phone_m,c_phone_h:string;
        c_call_status,c_department:integer;
        c_call_date :Variant;
        c_id:integer;

begin
 if edit3.Text='' then
 begin
 showmessage('  Müştərinin adı sahəsini daxil eidn !');
 exit;
 end;
if edit4.Text='' then
 begin
 showmessage('  Ünvanı sahəsini daxil eidn !');
 exit;
 end;
  if DBDateTimeEditEh1.Value=null then
 begin
 showmessage('  Tarix sahəsini daxil eidn !');
 exit;
 end;

 if DBLookupComboBox3.Text='' then
 begin
 showmessage('  Müştəri olma sahəsini daxil eidn !');
 exit;
 end;
  if DBLookupComboBox1.Text='' then
 begin
 showmessage('  Şöbə sahəsini daxil eidn !');
 exit;
 end;
 if DBLookupComboBox2.Text='' then
 begin
 showmessage('  Status sahəsini daxil eidn !');
 exit;
 end;

      c_name:=edit3.Text;
      c_address:=edit4.Text;
      c_phone_h:=edit5.Text;
      c_phone_m:=MaskEdit1.Text;
      c_call_result:=memo1.Text;
      c_call_date:=DBDateTimeEditEh1.Value;
      c_call_status:=DBLookupComboBox2.KeyValue;
      c_department:=DBLookupComboBox1.KeyValue;
      c_calle:=DBLookupComboBox3.KeyValue;

 if MessageDlg('  Yeni  Müştərini  yaddaşa yazmaq istəyirsinizmi   ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then
  begin
 DataModPCustService.PG_PCustService.CallProcedure('add_cust_potencial_meeting',
      [ c_id,
        c_name,
        c_address,
        c_phone_m,
        c_phone_h,
        c_calle,
        c_call_result,
        c_call_status,
        c_department,
        c_call_date
        ]);
   c_id:= DataModPCustService.PG_PCustService.GetParameter(0);
     Custclear(Sender);
    with Ods_meeting do
 begin
  CloseAll;
  Open;
   Locate('ID', c_id, []);
 end;

   end;

end;

procedure TForm_custPotencial.XFButton7Click(Sender: TObject);
 var
  c_id :integer;
begin
c_id:=XDBGrid2.DataSource.DataSet.FieldByName('id').AsInteger;

 if MessageDlg('   Müştəri  silinəcək əminsinizmi  ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then
DataModPCustService.PG_PCustService.CallProcedure('delete_cust_potencial_meeting',
      [ c_id]);
      Ods_meeting.Refresh;

end;

procedure TForm_custPotencial.XFButton8Click(Sender: TObject);
begin
Form_custPotencial.Close;
end;

end.

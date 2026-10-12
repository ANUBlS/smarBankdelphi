unit UntCapital;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, DBCtrls, Grids, DBGrids, Tabs, Db,
  OracleData, Mask, SearchEdit, SearchCombo, DBViewComboBox,
  CMHintDBLookupComboBox, CurrencyEdit, Oracle;

type
  TfrmCapital = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cb_Main: TComboBox;
    pc_Main: TPageControl;
    tbs_firstkapital: TTabSheet;
    tbs_seckapital: TTabSheet;
    tbs_risk: TTabSheet;
    tbs_capital: TTabSheet;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ed_bal: TEdit;
    Label1: TLabel;
    ts_optype: TTabSet;
    dbg_balacc: TDBGrid;
    Capital: TDataSource;
    ds_capital: TOracleDataSet;
    ds_capitalID: TFloatField;
    ds_capitalTYPE: TWideStringField;
    ds_capitalBAL: TFloatField;
    ds_capitalACC: TFloatField;
    ds_capitalACC_NO: TWideStringField;
    ds_capitalSUM: TFloatField;
    ds_capitalPERCENT: TFloatField;
    ds_capitalFORMULA: TWideStringField;
    ds_capitalOP_TYPE: TIntegerField;
    ds_account: TOracleDataSet;
    Account: TDataSource;
    se_ACC_NO: TSearchEdit;
    ds_accountID: TFloatField;
    ds_accountKLI_ID: TFloatField;
    ds_accountOP_ID: TFloatField;
    ds_accountACC_NO: TWideStringField;
    ds_accountVAL_ACC: TIntegerField;
    ds_accountNAME: TWideStringField;
    ds_accountOPEN_DAT: TDateTimeField;
    ds_accountCLOSE_DAT: TDateTimeField;
    ds_accountBAL_CN1: TFloatField;
    ds_accountBAL_CN2: TFloatField;
    ds_accountBAL_CN3: TFloatField;
    ds_accountBAL_CN4: TFloatField;
    ds_accountFILIAL: TIntegerField;
    dbw_acc_no: TDBViewComboBox;
    Label2: TLabel;
    PK_CAPITAL: TOraclePackage;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn3: TBitBtn;
    m_firstcap: TMemo;
    m_seccap: TMemo;
    m_actcap: TMemo;
    m_cap: TMemo;
    dp_capdate: TDateTimePicker;
    GroupBox5: TGroupBox;
    Shape1: TShape;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ed_balsecond: TEdit;
    se_acc_nosecond: TSearchEdit;
    DBViewComboBox2: TDBViewComboBox;
    Panel3: TPanel;
    ts_active: TTabSet;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ed_percent: TEdit;
    DBViewComboBox1: TDBViewComboBox;
    se_acc_noActive: TSearchEdit;
    ed_balActive: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    SpeedButton2: TSpeedButton;
    ed_outpercent: TEdit;
    dbv_outacc: TDBViewComboBox;
    se_outacc: TSearchEdit;
    ed_outbal: TEdit;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel1: TPanel;
    ts_risk: TTabSet;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    ts_riskout: TTabSet;
    DBGrid3: TDBGrid;
    ds_account_out: TOracleDataSet;
    account_out: TDataSource;
    ds_account_outID: TFloatField;
    ds_account_outKLI_ID: TFloatField;
    ds_account_outOP_ID: TFloatField;
    ds_account_outACC_NO: TWideStringField;
    ds_account_outVAL_ACC: TIntegerField;
    ds_account_outNAME: TWideStringField;
    ds_account_outOPEN_DAT: TDateTimeField;
    ds_account_outCLOSE_DAT: TDateTimeField;
    ds_account_outBAL_CN1: TFloatField;
    ds_account_outBAL_CN2: TFloatField;
    ds_account_outBAL_CN3: TFloatField;
    ds_account_outBAL_CN4: TFloatField;
    ds_capitalBAL_TYPE: TIntegerField;
    ds_capital_out: TOracleDataSet;
    capital_out: TDataSource;
    ds_capital_outID: TFloatField;
    ds_capital_outTYPE: TWideStringField;
    ds_capital_outBAL: TFloatField;
    ds_capital_outACC: TFloatField;
    ds_capital_outACC_NO: TWideStringField;
    ds_capital_outSUM: TFloatField;
    ds_capital_outPERCENT: TFloatField;
    ds_capital_outFORMULA: TWideStringField;
    ds_capital_outOP_TYPE: TIntegerField;
    ds_capital_outBAL_TYPE: TIntegerField;
    tbs_adieht: TTabSheet;
    GroupBox9: TGroupBox;
    ED_baleh: TEdit;
    DBViewComboBox3: TDBViewComboBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBGrid4: TDBGrid;
    ts_adi: TTabSet;
    ds_AdiEhtiyyat: TOracleDataSet;
    AdiEhtiyyat: TDataSource;
    Label16: TLabel;
    m_adieh: TMemo;
    tbs_capeh: TTabSheet;
    PageControl2: TPageControl;
    GroupBox10: TGroupBox;
    DBGrid5: TDBGrid;
    ed_capeh: TEdit;
    DBViewComboBox4: TDBViewComboBox;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Label17: TLabel;
    ts_capeh: TTabSet;
    Label18: TLabel;
    m_capeh: TMemo;
    Label19: TLabel;
    m_capumh: TMemo;
    Label20: TLabel;
    tbs_qiymetal: TTabSheet;
    GroupBox11: TGroupBox;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Panel5: TPanel;
    DBGrid6: TDBGrid;
    Ametal: TEdit;
    DBViewComboBox5: TDBViewComboBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Label22: TLabel;
    PMetal: TEdit;
    DBViewComboBox6: TDBViewComboBox;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Label23: TLabel;
    Panel7: TPanel;
    DBGrid7: TDBGrid;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    OracleDataSet3: TOracleDataSet;
    Label21: TLabel;
    Label24: TLabel;
    m_activm: TMemo;
    m_passivm: TMemo;
    OracleDataSet4: TOracleDataSet;
    OracleDataSet4ID: TFloatField;
    OracleDataSet4TYPE: TWideStringField;
    OracleDataSet4BAL: TFloatField;
    OracleDataSet4ACC: TFloatField;
    OracleDataSet4SUM: TFloatField;
    OracleDataSet4PERCENT: TFloatField;
    OracleDataSet4FORMULA: TWideStringField;
    OracleDataSet4OP_TYPE: TIntegerField;
    OracleDataSet4BAL_TYPE: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cb_MainChange(Sender: TObject);
    procedure ts_optypeChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure dbw_acc_noChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure se_ACC_NOEnter(Sender: TObject);
    procedure ed_balEnter(Sender: TObject);
    procedure se_ACC_NOChange(Sender: TObject);
    procedure ed_balKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbg_balaccTitleClick(Column: TColumn);
    procedure dbg_balaccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure tbs_firstkapitalShow(Sender: TObject);
    procedure ts_riskChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure ed_balActiveEnter(Sender: TObject);
    procedure se_acc_noActiveEnter(Sender: TObject);
    procedure DBViewComboBox1Change(Sender: TObject);
    procedure ed_balsecondEnter(Sender: TObject);
    procedure se_acc_nosecondEnter(Sender: TObject);
    procedure se_acc_nosecondChange(Sender: TObject);
    procedure DBViewComboBox2Change(Sender: TObject);
    procedure tbs_seckapitalShow(Sender: TObject);
    procedure ts_activeChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure tbs_capitalShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ed_outbalEnter(Sender: TObject);
    procedure ed_outbalKeyPress(Sender: TObject; var Key: Char);
    procedure se_outaccChange(Sender: TObject);
    procedure se_outaccEnter(Sender: TObject);
    procedure dbv_outaccChange(Sender: TObject);
    procedure ts_riskoutChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbs_riskShow(Sender: TObject);
    procedure ED_balehEnter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure ts_adiChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure DBViewComboBox3Change(Sender: TObject);
    procedure tbs_adiehtShow(Sender: TObject);
    procedure ed_capehEnter(Sender: TObject);
    procedure ed_capehKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBViewComboBox4Change(Sender: TObject);
    procedure ts_capehChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure tbs_capehShow(Sender: TObject);
    procedure dp_capdateChange(Sender: TObject);
    procedure AmetalEnter(Sender: TObject);
    procedure AmetalKeyPress(Sender: TObject; var Key: Char);
    procedure DBViewComboBox5Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBViewComboBox6Change(Sender: TObject);
    procedure PMetalKeyPress(Sender: TObject; var Key: Char);
    procedure PMetalEnter(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
 private
   procedure Setfilter(FType: string;FOPType: integer);
   procedure SetOUTfilter(FType: string;FOPType: integer);
    { Private declarations }
  public
   procedure Delete_capital;
   procedure Delete_capital_out;
   procedure Insert_FIRST_capital;
   procedure Insert_SECOND_capital;
   procedure Insert_Risk_capital;
   procedure Insert_Risk_capital_OUT;
   procedure Delete_capital_proc(cap_id: integer);
   procedure Insert_capital_proc(cap_type: string;cap_bal: integer;cap_acc: integer;cap_sum: integer;cap_percent: integer;cap_formula: string;cap_optype: integer;cap_baltype: integer = 0);
   procedure ReOrder_Capital(v_field : string);
   procedure Insert_ADIEHT_capital;
   procedure Insert_CAPEH_capital;
   procedure Insert_Ametal;
   procedure Insert_Pmetal;
  end;

var
  frmCapital: TfrmCapital;
           a:string[10];
implementation

uses  sboapiDataModuleImpl, CurrencyPositionImpl, UntCPReport,SBTranslateProc;

{$R *.DFM}

procedure TfrmCapital.Setfilter(FType: string;FOPType: integer);
begin
 ds_capital.Filter:='(BAL_TYPE=1) and (TYPE='''+FTYPE+''')'+' and (OP_TYPE='+IntToSTR(FOPType)+')';
end;

procedure TfrmCapital.SetOUTfilter(FType: string;FOPType: integer);
begin
 ds_capital_out.Filter:='(BAL_TYPE=2) and (TYPE='''+FTYPE+''')'+' and (OP_TYPE='+IntToSTR(FOPType)+')';
end;


procedure TfrmCapital.FormCreate(Sender: TObject);
begin
 cb_Main.ItemIndex:=0;
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmCapital.cb_MainChange(Sender: TObject);
begin
 pc_Main.ActivePageIndex:=(Sender as TComboBox).ItemIndex;
 dp_capdate.Date:=FrmCurrencyPosition.sb_GetBankDate;
  if pc_Main.ActivePageIndex=4 then
 begin
   ds_AdiEhtiyyat.Close;
   ds_AdiEhtiyyat.SQL.Clear;
   ds_AdiEhtiyyat.SQL.Add('select * from  Bal_SPR1 where (Bal_CN like ''%91'') and (length(Bal_CN)=4) order by Bal_CN ');
   ds_AdiEhtiyyat.Open;
 end;
 if pc_Main.ActivePageIndex=5 then
 begin
   ds_AdiEhtiyyat.Close;
   ds_AdiEhtiyyat.SQL.Clear;
   ds_AdiEhtiyyat.SQL.Add('select * from BAL_SPR1 order by bal_CN ');
   ds_AdiEhtiyyat.Open;
 end;
 if pc_Main.ActivePageIndex=6 then
 begin
   OracleDataSet1.Close;
   OracleDataSet1.SQL.Clear;
   OracleDataSet1.SQL.Add('select * from BAL_SPR1 order by bal_CN ');
   OracleDataSet1.Open;
 end;
end;
procedure TfrmCapital.ts_optypeChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 Setfilter('I',NewTab+1);
end;

procedure TfrmCapital.dbw_acc_noChange(Sender: TObject);
begin
 if se_ACC_NO.Text<>(Sender as TDBViewComboBox).Text then
   se_ACC_NO.Text:= (Sender as TDBViewComboBox).Text;
end;

procedure TfrmCapital.FormShow(Sender: TObject);
begin
with ds_capital do
 if not(Active) then
  begin
   Open;
   dp_capdate.DateTime:=PK_CAPITAL.CallDateFunction('GetDate',[]);
  end;

if not(ds_account.Active) then
 ds_account.Open;
end;

procedure TfrmCapital.se_ACC_NOEnter(Sender: TObject);
begin
ed_bal.Clear;
end;

procedure TfrmCapital.ed_balEnter(Sender: TObject);
begin
se_acc_no.Clear;
end;

procedure TfrmCapital.se_ACC_NOChange(Sender: TObject);
begin
 ed_balActive.Clear;
end;

procedure TfrmCapital.ed_balKeyPress(Sender: TObject; var Key: Char);
begin
if not(Ord(Key)=8) then
 if ((Length((Sender as TEdit).Text)>4) and ((Sender as TEdit).SelLength=0)) or (not(key in ['0'..'9']) ) then
  key:=#0;
end;

procedure TfrmCapital.Delete_capital_proc(cap_id: integer);
begin
 PK_CAPITAL.CallProcedure('cap_delete',[cap_id]);
 ds_capital.Refresh;
 OracleDataSet2.Refresh;
 OracleDataSet3.Refresh;
end;

procedure TfrmCapital.Insert_capital_proc(cap_type: string;cap_bal: integer;cap_acc: integer;cap_sum: integer;cap_percent: integer;cap_formula: string;cap_optype: integer;cap_baltype: integer = 0);
begin
if cap_baltype=0 then
 PK_CAPITAL.CallProcedure('cap_insert',[cap_type,cap_bal,cap_acc,cap_sum,cap_percent,cap_formula,cap_optype])
else PK_CAPITAL.CallProcedure('cap_insert',[cap_type,cap_bal,cap_acc,cap_sum,cap_percent,cap_formula,cap_optype,cap_baltype]);

 ds_capital.Refresh;
 OracleDataSet2.Refresh;
 OracleDataSet3.Refresh;
end;

procedure TfrmCapital.Delete_capital;
begin
with ds_capital,ds_capitalID do
 if Active and  (AsInteger>0) then
   Delete_capital_proc(AsInteger);
end;

procedure TfrmCapital.Delete_capital_out;
begin
with ds_capital_out,ds_capital_outID do
 if Active and  (AsInteger>0) then
    begin
     PK_CAPITAL.CallProcedure('cap_delete',[AsInteger]);
     ds_capital_out.Refresh;
    end;
end;

procedure TfrmCapital.Insert_FIRST_capital;
var
 TmpAcc,TmpBal: Integer;
begin
TmpBal:=StrToIntDef(ed_bal.Text,0);
if se_ACC_NO.Text<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;
if ds_capital.Active  then
 with ts_optype do
  if TabIndex=0 then
    Insert_capital_proc('I',TmpBal,TmpAcc,0,0,'',1)
  else
   Insert_capital_proc('I',TmpBal,TmpAcc,0,0,'',2);
end;

procedure TfrmCapital.Insert_SECOND_capital;
var
 TmpAcc,TmpBal: Integer;
begin
TmpBal:=StrToIntDef(ed_balsecond.Text,0);
if se_ACC_NOsecond.Text<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;
if ds_capital.Active  then
 with ts_active do
  if TabIndex=0 then
    Insert_capital_proc('II',TmpBal,TmpAcc,0,0,'',1)
  else
   Insert_capital_proc('II',TmpBal,TmpAcc,0,0,'',2);
end;

procedure TfrmCapital.Insert_Risk_capital;
var
 TmpAcc,TmpBal,TmpPercent: Integer;
begin
TmpBal:=StrToIntDef(ed_balActive.Text,0);
if se_acc_noActive.Text<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;

if ed_percent.Text=EmptyStr then
  TmpPercent:=0
 else
  TmpPercent:= StrtoInt(ed_percent.Text);

if ds_capital.Active  then
 with ts_risk do
  if TabIndex=0 then
    Insert_capital_proc('A',TmpBal,TmpAcc,0,TmpPercent,'',1)
  else
   Insert_capital_proc('A',TmpBal,TmpAcc,0,TmpPercent,'',2);
end;

procedure TfrmCapital.Insert_Risk_capital_OUT;
var
 TmpAcc,TmpBal,TmpPercent: Integer;
begin
TmpBal:=StrToIntDef(ed_outbal.Text,0);
if se_outacc.Text<>EmptyStr then
 TmpAcc:=ds_account_outId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;

if ed_outpercent.Text=EmptyStr then
  TmpPercent:=0
 else
  TmpPercent:= StrtoInt(ed_outpercent.Text);

if ds_capital_out.Active  then
 with ts_riskout do
  if TabIndex=0 then
    Insert_capital_proc('A',TmpBal,TmpAcc,0,TmpPercent,'',1,2)
  else
   Insert_capital_proc('A',TmpBal,TmpAcc,0,TmpPercent,'',2,2);

 ds_capital_out.Refresh;
end;

procedure TfrmCapital.BitBtn2Click(Sender: TObject);
begin
 Delete_capital;
end;

procedure TfrmCapital.BitBtn1Click(Sender: TObject);
begin
 Insert_FIRST_capital;
end;

procedure TfrmCapital.dbg_balaccTitleClick(Column: TColumn);
begin
  ReOrder_Capital(Column.FieldName);
end;

procedure TfrmCapital.ReOrder_Capital(v_field : string);
begin
 Screen.Cursor :=crHourGlass;
 with ds_capital do
  try
   SQL[SQL.Count-1]:='ORDER BY '+ v_field;
   Refresh;
  finally
   Screen.Cursor :=crDefault;
  end;
end;


procedure TfrmCapital.dbg_balaccKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_DELETE then BitBtn2Click(self);
end;

procedure TfrmCapital.BitBtn3Click(Sender: TObject);
var
 Temp : TdateTime;
 Ametal,Pmetal:real;
begin
 Screen.cursor:=crSQLWait;
 try
 Temp:=trunc(dp_capdate.DateTime);
 m_firstcap.Lines[0]:='0';
 m_seccap.Lines[0]:='0';
 m_actcap.Lines[0]:='0';
 m_cap.Lines[0]:='0';
 m_adieh.Lines[0]:='0';
 m_capeh.Lines[0]:='0';
 m_capumh.Lines[0]:='0';
 m_activm.Lines[0]:='0';
 m_passivm.Lines[0]:='0';

 m_firstcap.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_First_capital',[Temp]));
 m_seccap.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_second_capital',[Temp]));
 m_actcap.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_risks',[Temp]));
 m_adieh.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_reserv',[Temp]));
 m_cap.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_capital',[Temp]));
 m_capeh.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_capeht',[Temp]));
 m_capumh.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_capumhes',[Temp]));
 m_activm.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_AQiymetal',[Temp]));
 m_passivm.Lines[0]:=FloatToStr(PK_CAPITAL.CallFloatFunction('calculate_PQiymetal',[Temp]));
 Ametal:=StrToFloat( m_activm.Lines[0]);
 Pmetal:=StrToFloat( m_passivm.Lines[0]);
     if (Ametal-Pmetal)>0 then CPReport.QRLabel36.Caption:=FloatToStr(Ametal-Pmetal);
     if (Ametal-Pmetal)<0 then CPReport.QRLabel37.Caption:=FloatToStr(Ametal-Pmetal);
     if (Ametal-Pmetal)=0 then  begin
                               CPReport.QRLabel36.Caption:='0';
                               CPReport.QRLabel37.Caption:='0';
                                 end;
 finally
  Screen.cursor:=crArrow;
 end;
end;

procedure TfrmCapital.tbs_firstkapitalShow(Sender: TObject);
begin
 Setfilter('I',ts_optype.TabIndex+1);
end;

procedure TfrmCapital.ts_riskChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 Setfilter('A',NewTab+1);
end;

procedure TfrmCapital.BitBtn4Click(Sender: TObject);
begin
 Insert_Risk_capital;
end;

procedure TfrmCapital.ed_balActiveEnter(Sender: TObject);
begin
 se_acc_noActive.Clear;
end;

procedure TfrmCapital.se_acc_noActiveEnter(Sender: TObject);
begin
ed_balActive.Clear;
end;

procedure TfrmCapital.DBViewComboBox1Change(Sender: TObject);
begin
  if se_acc_noActive.Text<>(Sender as TDBViewComboBox).Text then
   se_acc_noActive.Text:= (Sender as TDBViewComboBox).Text;
end;

procedure TfrmCapital.ed_balsecondEnter(Sender: TObject);
begin
se_acc_nosecond.Clear;
end;

procedure TfrmCapital.se_acc_nosecondEnter(Sender: TObject);
begin
ed_balsecond.Clear;
end;

procedure TfrmCapital.se_acc_nosecondChange(Sender: TObject);
begin
 ed_balsecond.Clear;
end;

procedure TfrmCapital.DBViewComboBox2Change(Sender: TObject);
begin
 if se_acc_nosecond.Text<>(Sender as TDBViewComboBox).Text then
   se_acc_nosecond.Text:= (Sender as TDBViewComboBox).Text;
end;

procedure TfrmCapital.tbs_seckapitalShow(Sender: TObject);
begin
  Setfilter('II',ts_active.TabIndex+1);
end;

procedure TfrmCapital.ts_activeChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 Setfilter('II',NewTab+1);
end;

procedure TfrmCapital.BitBtn6Click(Sender: TObject);
begin
 Insert_SECOND_capital;
end;

procedure TfrmCapital.tbs_capitalShow(Sender: TObject);
begin
  Setfilter('F',0);
end;

procedure TfrmCapital.SpeedButton1Click(Sender: TObject);
begin
with ds_capital do
  if State=dsEdit then
    Post;
end;

procedure TfrmCapital.SpeedButton2Click(Sender: TObject);
begin
if not(ds_capital_out.Active) then
 try
  ds_account_out.Open;
  ds_capital_out.Open;

  SetOutfilter('A',1);
  ed_outbal.Color:=clWindow;
  ed_outbal.Enabled:=True;
  se_outacc.Color:=clWindow;
  se_outacc.Enabled:=True;
  dbv_outacc.Color:=clWindow;
  dbv_outacc.Enabled:=True;
  ed_outpercent.Color:=clWindow;
  ed_outpercent.Enabled:=True;
  DBGrid3.Enabled:=true;
  DBGrid3.Color:=clWindow;
 except
  ShowMessage('Ѕалансдан к€нар гошулмыйыб');
 end;
end;

procedure TfrmCapital.ed_outbalEnter(Sender: TObject);
begin
 se_outacc.Clear;
end;

procedure TfrmCapital.ed_outbalKeyPress(Sender: TObject; var Key: Char);
begin
if not(Ord(Key)=8) then
 if ((Length((Sender as TEdit).Text)>9) and ((Sender as TEdit).SelLength=0)) or (not(key in ['0'..'9']) ) then
  key:=#0;
end;

procedure TfrmCapital.se_outaccChange(Sender: TObject);
begin
 ed_outbal.Clear;
end;

procedure TfrmCapital.se_outaccEnter(Sender: TObject);
begin
ed_outbal.Clear;
end;

procedure TfrmCapital.dbv_outaccChange(Sender: TObject);
begin
  if se_outacc.Text<>(Sender as TDBViewComboBox).Text then
   se_outacc.Text:= (Sender as TDBViewComboBox).Text;
end;

procedure TfrmCapital.ts_riskoutChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 SetOutfilter('A',NewTab+1);
end;

procedure TfrmCapital.BitBtn8Click(Sender: TObject);
begin
   Insert_Risk_capital_OUT;
end;

procedure TfrmCapital.DBGrid3TitleClick(Column: TColumn);
begin
 Screen.Cursor :=crHourGlass;
 with ds_capital_out do
  try
   SQL[SQL.Count-1]:='ORDER BY '+ Column.FieldName;
   Refresh;
  finally
   Screen.Cursor :=crDefault;
  end;
end;

procedure TfrmCapital.BitBtn9Click(Sender: TObject);
begin
 Delete_capital_out;
end;

procedure TfrmCapital.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_DELETE then BitBtn9Click(self);
end;

procedure TfrmCapital.tbs_riskShow(Sender: TObject);
begin
   Setfilter('A',ts_risk.TabIndex+1);
end;

procedure TfrmCapital.ED_balehEnter(Sender: TObject);
begin
  ed_baleh.Clear;
end;
procedure TfrmCapital.Insert_ADIEHT_capital;
var
 TmpAcc,TmpBal: Integer;
begin
TmpBal:=StrToIntDef(a,0);
if a<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;
if ds_capital.Active  then
 with ts_adi do
  if TabIndex=0 then
    Insert_capital_proc('E',TmpBal,TmpAcc,0,0,'',1);
  (*else
   Insert_capital_proc('E',TmpBal,TmpAcc,0,0,'',2);*)
end;

procedure TfrmCapital.BitBtn10Click(Sender: TObject);
begin
  if ed_baleh.text<>'' then a:=ED_baleh.Text;
  Insert_ADIEHT_capital;
  ed_baleh.clear;
  DBViewComboBox3.Text:='';
end;

procedure TfrmCapital.BitBtn11Click(Sender: TObject);
begin
   Delete_capital;
end;

procedure TfrmCapital.ts_adiChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Setfilter('E',newTab+1);
end;

procedure TfrmCapital.DBViewComboBox3Change(Sender: TObject);
begin
  a:=DBViewComboBox3.text;
end;

procedure TfrmCapital.tbs_adiehtShow(Sender: TObject);
begin
  Setfilter('E',ts_adi.TabIndex+1);
end;


procedure TfrmCapital.ed_capehEnter(Sender: TObject);
begin
  ed_capeh.Clear;
end;

procedure TfrmCapital.ed_capehKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Ord(Key)=8) then
  if ((Length((Sender as TEdit).Text)>4) and ((Sender as TEdit).SelLength=0)) or (not(key in ['0'..'9']) ) then
  key:=#0;
end;

procedure TfrmCapital.BitBtn12Click(Sender: TObject);
begin
  if ed_capeh.text<>'' then a:=ED_capeh.Text;
  Insert_CAPEH_capital;
  ed_capeh.clear;
  DBViewComboBox4.Text:='';
end;
procedure TfrmCapital.Insert_CAPEH_capital;
var
 TmpAcc,TmpBal: Integer;
begin
TmpBal:=StrToIntDef(a,0);
if a<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;
if ds_capital.Active  then
 with ts_capeh do
  if TabIndex=0 then
    Insert_capital_proc('C',TmpBal,TmpAcc,0,0,'',1);
  (*else
   Insert_capital_proc('E',TmpBal,TmpAcc,0,0,'',2);*)
end;
procedure TfrmCapital.BitBtn13Click(Sender: TObject);
begin
  Delete_capital;
end;

procedure TfrmCapital.DBViewComboBox4Change(Sender: TObject);
begin
  a:=DBViewComboBox4.text;
end;

procedure TfrmCapital.ts_capehChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Setfilter('C',newTab+1);
end;

procedure TfrmCapital.tbs_capehShow(Sender: TObject);
begin
  Setfilter('C',ts_capeh.TabIndex+1);
end;
procedure TfrmCapital.dp_capdateChange(Sender: TObject);
begin
  dp_capdate.Date:=FrmCurrencyPosition.sb_GetBankDate;
end;

procedure TfrmCapital.AmetalEnter(Sender: TObject);
begin
  Ametal.Clear;
end;

procedure TfrmCapital.AmetalKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Ord(Key)=8) then
  if ((Length((Sender as TEdit).Text)>4) and ((Sender as TEdit).SelLength=0)) or (not(key in ['0'..'9']) ) then
  key:=#0;
end;

procedure TfrmCapital.DBViewComboBox5Change(Sender: TObject);
begin
  a:=DBViewComboBox5.text;
end;

procedure TfrmCapital.BitBtn14Click(Sender: TObject);
begin
  if Ametal.text<>'' then a:=Ametal.Text;
  Insert_Ametal;
  Ametal.clear;
  DBViewComboBox5.Text:='';
end;
procedure TfrmCapital.Insert_Ametal;
var  TmpAcc,TmpBal: Integer;
begin
TmpBal:=StrToIntDef(a,0);
if a<>EmptyStr then
 TmpAcc:=ds_accountId.AsInteger
else TmpAcc:=0;
 if (TmpBal=0) and (TmpAcc=0) then
   Exit;
if OracleDataSet2.Active  then Insert_capital_proc('AM',TmpBal,TmpAcc,0,0,'',3,1);
end;

procedure TfrmCapital.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_DELETE then BitBtn15Click(self);
end;

procedure TfrmCapital.BitBtn15Click(Sender: TObject);
var tipi:integer;
begin
  tipi:=OracleDataSet2.fieldbyname('id').asinteger;
  Delete_capital_proc(tipi);
  end;

procedure TfrmCapital.BitBtn16Click(Sender: TObject);
begin
  if Pmetal.text<>'' then a:=Pmetal.Text;
  Insert_Pmetal;
  Pmetal.clear;
  DBViewComboBox6.Text:='';
end;
procedure TfrmCapital.Insert_Pmetal;
var  TmpAcc,TmpBal: Integer;
begin
  TmpBal:=StrToIntDef(a,0);
  if a<>EmptyStr then
  TmpAcc:=ds_accountId.AsInteger
  else TmpAcc:=0;
  if (TmpBal=0) and (TmpAcc=0) then
   Exit;
  if OracleDataSet3.Active  then Insert_capital_proc('PM',TmpBal,TmpAcc,0,0,'',4,1);
end;

procedure TfrmCapital.DBViewComboBox6Change(Sender: TObject);
begin
  a:=DBViewComboBox6.text;
end;

procedure TfrmCapital.PMetalKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Ord(Key)=8) then
  if ((Length((Sender as TEdit).Text)>4) and ((Sender as TEdit).SelLength=0)) or (not(key in ['0'..'9']) ) then
  key:=#0;
end;

procedure TfrmCapital.PMetalEnter(Sender: TObject);
begin
  Pmetal.Clear;
end;

procedure TfrmCapital.BitBtn17Click(Sender: TObject);
var tipi:integer;
begin
 tipi:=OracleDataSet3.fieldbyname('id').asinteger;
  Delete_capital_proc(tipi);

end;

procedure TfrmCapital.Button1Click(Sender: TObject);
begin
  ds_capital.Refresh;
end;

end.

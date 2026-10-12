unit Data_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,sboapiDataModuleImpl,
  Db, OracleData, Oracle;

type
  TDataMod = class(TDataModule)
    DataAccount: TOracleDataSet;
    Account_Source: TDataSource;
    DataAccountView: TOracleDataSet;
    DS_View: TDataSource;
    DS_BankInfo: TDataSource;
    DataBankInfo: TOracleDataSet;
    DataBankM: TOracleDataSet;
    DS_BankM: TDataSource;
    DataValute: TOracleDataSet;
    XS_BATCHS: TOracleDataSet;
    DS_BATCHS: TDataSource;
    Ins: TOraclePackage;
    DataCheck: TOracleDataSet;
    XS_BENEFICIARY: TOracleDataSet;
    DS_BENEFICIARY: TDataSource;
    Del: TOraclePackage;
    GetReference: TOraclePackage;
    XS_CONFIG: TOracleDataSet;
    DSTransTypeCode: TDataSource;
    PackTemp: TOraclePackage;
    DataTemp: TOracleDataSet;
    XS_INCOMING: TOracleDataSet;
    XS_IncomingView: TOracleDataSet;
    DS_XS_IncomingView: TDataSource;
    GetSysDate: TOraclePackage;
    DataSetFilial: TOracleDataSet;
    DataSourceFilial: TDataSource;
    DataSetFilialID: TFloatField;
    DataSetFilialNAME: TStringField;
    DataBatchFilialView: TOracleDataSet;
    DS_FilialView: TDataSource;
    XS_BENEFICIARYID: TFloatField;
    XS_BENEFICIARYREC_BANK_ID: TFloatField;
    XS_BENEFICIARYREC_BANK_SUB_ACC: TFloatField;
    XS_BENEFICIARYCLIENT_ACC_NO: TStringField;
    XS_BENEFICIARYCLIENT_NAME: TStringField;
    XS_BENEFICIARYCLIENT_CODE: TStringField;
    XS_BENEFICIARYREMIT_INF: TStringField;
    XS_BENEFICIARYTRANS_COD: TIntegerField;
    XS_BENEFICIARYADD_INF: TStringField;
    XS_BENEFICIARYVAL_DATE: TDateTimeField;
    XS_BENEFICIARYVAL_COD: TIntegerField;
    XS_BENEFICIARYMESS_REFERENCE: TStringField;
    XS_BENEFICIARYAMOUNT: TFloatField;
    XS_BENEFICIARYBNFCOUNT: TIntegerField;
    XS_BENEFICIARYSTATUS: TIntegerField;
    XS_BENEFICIARYTRANSACTION_ID: TFloatField;
    XS_BENEFICIARYVAL_NAME: TStringField;
    XS_BENEFICIARYCLIENT_INN: TStringField;
    XS_BENEFICIARYBANKNAME: TStringField;
    TransTypeName: TOracleDataSet;
    DSTransTypeName: TDataSource;
    TransTypeCode: TOracleDataSet;
    TransTypeCodeCODE: TIntegerField;
    TransTypeCodeNAME: TStringField;
    TransTypeCodeNAMEID: TFloatField;
    TransTypeCodeID: TFloatField;
    XS_BENEFICIARYBATCHID: TFloatField;
    XS_BATCHSID: TFloatField;
    XS_BATCHSF_ID: TFloatField;
    XS_BATCHSOPERCODE: TStringField;
    XS_BATCHSACC_ID: TFloatField;
    XS_BATCHSCLIENT_NAME: TStringField;
    XS_BATCHSCLIENT_CODE: TStringField;
    XS_BATCHSTRANS_REF: TStringField;
    XS_BATCHSAMOUNT: TFloatField;
    XS_BATCHSVAL_ACC: TIntegerField;
    XS_BATCHSTRANSDATE: TDateTimeField;
    XS_BATCHSSEND: TIntegerField;
    XS_BATCHSSTATUS: TIntegerField;
    XS_BATCHSFILIAL: TFloatField;
    XS_BATCHSTRANSACTION_ID: TFloatField;
    XS_BATCHSCLIENT_INN: TStringField;
    XS_BATCHSUSERID: TFloatField;
    XS_BATCHSACC_NO: TStringField;
    XS_BATCHSNAME: TStringField;
    XS_BATCHSVAL_NAME: TStringField;
    SB_ACA: TOraclePackage;
    XS_BatchsArchive: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField5: TStringField;
    FloatField7: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    DS_BatchsArchive: TDataSource;
    DS_BeneficiaryArchive: TDataSource;
    XS_BeneficiaryArchive: TOracleDataSet;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    IntegerField4: TIntegerField;
    StringField13: TStringField;
    DateTimeField2: TDateTimeField;
    IntegerField5: TIntegerField;
    StringField14: TStringField;
    FloatField12: TFloatField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    FloatField13: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    ODS_shablon: TOracleDataSet;
    DS_shablon: TDataSource;
    ODS_XS_Filter: TOracleDataSet;
    DS_XS_Filter: TDataSource;
    ODS_Institution: TOracleDataSet;
    ODS_BudgetLevel: TOracleDataSet;
    ODS_Destination: TOracleDataSet;
    DS_Institution: TDataSource;
    DS_BudgetLevel: TDataSource;
    DS_Destination: TDataSource;
    ODS_Report: TOracleDataSet;
    DS_Report: TDataSource;
    ODS_Report_Temp: TOracleDataSet;
    ODS_Admin_Setting: TOracleDataSet;
    DS_Admin_Setting: TDataSource;
    ODS_Ad_Sett_Fili: TOracleDataSet;
    DS_Ad_Sett_Fili: TDataSource;
    ODS_Admin_in: TOracleDataSet;
    DS_Admin_in: TDataSource;
    XS_CONFIGID: TFloatField;
    XS_CONFIGIN_DIR: TStringField;
    XS_CONFIGOUT_DIR: TStringField;
    XS_CONFIGAMOUNT_LIMIT: TFloatField;
    XS_CONFIGACCOUNT: TStringField;
    XS_CONFIGARCHIVE_DIR: TStringField;
    XS_CONFIGUSEBANKDATE: TFloatField;
    XS_CONFIGCOMMISIONID: TFloatField;
    XS_CONFIGNB_SWIFT: TStringField;
    XS_CONFIGCORACCOUNT: TStringField;
    XS_CONFIGNEW_DATE: TDateTimeField;
    XS_CONFIGVER_DIR: TStringField;
    XS_BATCHSFUSERID: TStringField;
    XS_BATCHSVUSERID: TStringField;
    XS_BATCHSAUSERID: TStringField;
    XS_BATCHSUSERNAME: TStringField;
    XS_BatchsArchiveFUSERID: TStringField;
    XS_BatchsArchiveVUSERID: TStringField;
    XS_BatchsArchiveAUSERID: TStringField;
    XS_BatchsArchiveSDATE: TDateTimeField;
    XS_BatchsArchiveUSERNAME: TStringField;
    procedure XS_BATCHSAfterScroll(DataSet: TDataSet);
    procedure XS_BENEFICIARYAfterScroll(DataSet: TDataSet);
    procedure XS_IncomingViewAfterScroll(DataSet: TDataSet);
    procedure XS_BatchsArchiveAfterScroll(DataSet: TDataSet);
    procedure ODS_BudgetLevelAfterScroll(DataSet: TDataSet);
    procedure ODS_DestinationAfterScroll(DataSet: TDataSet);
    procedure ODS_InstitutionAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
   {Lvpcss Batchs Message Status}
   msDefault = 0;
   msCommit = 1;
   msReject = 2;
   msFileCreated=3;
   msFilial = 0;
   MsHeadOffice =0;
   msSwiftIN = 1;
   msVerifikator=4;
   msFVerifikator=5;
   msAvtorizator=6;
   msReturnBack=7;
var
  DataMod: TDataMod;

implementation

uses LVPCSSImpl, Payment_Det;



{$R *.DFM}

procedure TDataMod.XS_BATCHSAfterScroll(DataSet: TDataSet);
  var Filial_id: Integer;
begin
  LVPCSSForm.GridBeneficiary.SelectedRows.Clear;
  LVPCSSForm.AcceptButton.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.AcceptButton.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.ToolButton9.Enabled:= not DataSet.IsEmpty;
  LVPCSSForm.ToolButton9.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.N19.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.N19.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.N2.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.N2.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.N4.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.N4.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];



    {FIND FILIAL NAME}
  Filial_Id:=DataMod.XS_BATCHS.FieldByName('Filial').AsInteger;
  DataMod.DataSetFilial.SetVariable('FilialID',Filial_Id);
  DataMod.DataSetFilial.Refresh;

end;
procedure TDataMod.XS_BENEFICIARYAfterScroll(DataSet: TDataSet);
begin
  LVPCSSForm.ToolButton4.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.ToolButton4.Enabled:=DataMod.XS_BENEFICIARY.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.MenuItem1.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.MenuItem1.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.MenuItem2.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.MenuItem2.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.MenuItem4.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.MenuItem4.Enabled:=DataMod.XS_BATCHS.FieldByName('status').AsInteger in [msdefault];

  LVPCSSForm.ToolButton2.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.ToolButton2.Enabled:=DataMod.XS_BENEFICIARY.FieldByName('status').AsInteger in [msdefault];
  LVPCSSForm.MessAcceptButton.Enabled:=not DataSet.IsEmpty;
  LVPCSSForm.MessAcceptButton.Enabled:=DataMod.XS_BENEFICIARY.FieldByName('status').AsInteger=0;
end;

procedure TDataMod.XS_IncomingViewAfterScroll(DataSet: TDataSet);
begin
  LVPCSSForm.ButtonMessInAccept.Enabled:=
                             XS_IncomingView.FieldByName('status').AsInteger in [msdefault];
end;

procedure TDataMod.XS_BatchsArchiveAfterScroll(DataSet: TDataSet);
var Filial_ID :integer;
begin
  LVPCSSForm.DBGridOUTArchBeneficiary.SelectedRows.Clear;
    {FIND FILIAL NAME}
  Filial_Id:=DataMod.XS_BatchsArchive.FieldByName('Filial').AsInteger;
  DataMod.DataSetFilial.SetVariable('FilialID',Filial_Id);
  DataMod.DataSetFilial.Refresh;
end;

procedure TDataMod.ODS_BudgetLevelAfterScroll(DataSet: TDataSet);
begin
   try
      with PaymentDetalsForm,ODS_BudgetLevel do
      begin
         Edit_tey1.Text:=IntToStr(fieldbyname('ID').AsInteger);
      end;
   except
      //---
   end;
end;

procedure TDataMod.ODS_DestinationAfterScroll(DataSet: TDataSet);
begin
   try
      with PaymentDetalsForm,ODS_Destination do
      begin
         Edit_tey2.Text:=IntToStr(fieldbyname('ID').AsInteger);
      end;
   except
      //--
   end;
end;

procedure TDataMod.ODS_InstitutionAfterScroll(DataSet: TDataSet);
begin
   try
      with PaymentDetalsForm,ODS_Institution do
      begin
         Edit_Client_acc_no.Text:=IntToStr(fieldbyname('ID').AsInteger);
         Edit_Client_Name.Text:=fieldbyname('NAME').AsString;
         Edit_Client_Code.Text:='/'+fieldbyname('BOSH').AsString;
         Edit_Client_Voen.Text:=fieldbyname('TEK').AsString;
      end;
   except
      //--
   end;
end;

end.

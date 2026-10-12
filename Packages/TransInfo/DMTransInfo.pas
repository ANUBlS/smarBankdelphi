unit DMTransInfo;

interface

uses
  SysUtils, Classes, DB, OracleData, sboapiDataModuleImpl, Oracle;

type
  TDM = class(TDataModule)
    ODS_mmx_account_status: TOracleDataSet;
    ODS_mmx_account_type: TOracleDataSet;
    ODS_mmx_communication_type: TOracleDataSet;
    ODS_mmx_account_statusID: TFloatField;
    ODS_mmx_account_statusSYMBOL: TWideStringField;
    ODS_mmx_account_statusDESCRIPTION: TWideStringField;
    ODS_mmx_contact_type: TOracleDataSet;
    ODS_mmx_fromfunds: TOracleDataSet;
    ODS_mmx_reportcode: TOracleDataSet;
    ODS_mmx_transaction_item_type: TOracleDataSet;
    ODS_mmx_transmode: TOracleDataSet;
    ODS_mmx_account_typeID: TFloatField;
    ODS_mmx_account_typeSYMBOL: TWideStringField;
    ODS_mmx_account_typeDESCRIPTION: TWideStringField;
    ODS_mmx_communication_typeID: TIntegerField;
    ODS_mmx_communication_typeSYMBOL: TWideStringField;
    ODS_mmx_communication_typeDESCRIPTION: TWideStringField;
    ODS_mmx_contact_typeID: TIntegerField;
    ODS_mmx_contact_typeSYMBOL: TWideStringField;
    ODS_mmx_contact_typeDESCRIPTION: TWideStringField;
    ODS_mmx_fromfundsID: TIntegerField;
    ODS_mmx_fromfundsSYMBOL: TWideStringField;
    ODS_mmx_fromfundsDESCRIPTION: TWideStringField;
    ODS_mmx_reportcodeID: TIntegerField;
    ODS_mmx_reportcodeNAME: TWideStringField;
    ODS_mmx_reportcodeDESCRIPTION: TWideStringField;
    ODS_mmx_transaction_item_typeID: TFloatField;
    ODS_mmx_transaction_item_typeSYMBOL: TWideStringField;
    ODS_mmx_transaction_item_typeDESCRIPTION: TWideStringField;
    ODS_mmx_transmodeID: TIntegerField;
    ODS_mmx_transmodeNAME: TIntegerField;
    ODS_mmx_transmodeDESCRIPTION: TWideStringField;
    DS_mmx_account_status: TDataSource;
    DS_mmx_account_type: TDataSource;
    DS_mmx_communication_type: TDataSource;
    DS_mmx_transaction_item_type: TDataSource;
    DS_mmx_reportcode: TDataSource;
    DS_mmx_transmode: TDataSource;
    DS_mmx_contact_type: TDataSource;
    DS_mmx_fromfunds: TDataSource;
    ODS_MMX_TRANS_ITEM_STATUS: TOracleDataSet;
    DS_MMX_TRANS_ITEM_STATUS: TDataSource;
    ODS_MMX_TRANS_ITEM_STATUSID: TFloatField;
    ODS_MMX_TRANS_ITEM_STATUSSYMBOL: TWideStringField;
    ODS_MMX_TRANS_ITEM_STATUSDESCRIPTION: TWideStringField;
    ODS_Countries: TOracleDataSet;
    ODS_Cityes: TOracleDataSet;
    DS_Countries: TDataSource;
    DS_Cityes: TDataSource;
    ODS_CityesID: TFloatField;
    ODS_CityesCOUNTRY_ID: TFloatField;
    ODS_CityesCITY_NAME: TWideStringField;
    ODS_CountriesID: TFloatField;
    ODS_CountriesCNTR_NAME: TWideStringField;
    ODS_CountriesSYMB: TWideStringField;
    MMX: TOraclePackage;
    ODS_mmx_tofunds: TOracleDataSet;
    DS_mmx_tofunds: TDataSource;
    ODS_mmx_tofundsID: TIntegerField;
    ODS_mmx_tofundsSYMBOL: TWideStringField;
    ODS_mmx_tofundsDESCRIPTION: TWideStringField;
    ODS_TransInfo: TOracleDataSet;
    ODS_TransInfoID: TFloatField;
    ODS_TransInfoREPORT_CODE: TWideStringField;
    ODS_TransInfoREASON: TWideStringField;
    ODS_TransInfoTRANSMODE_CODE: TIntegerField;
    ODS_TransInfoTRANSMODE_COMMENT: TWideStringField;
    ODS_TransInfoFROM_FUNDS_CODE: TWideStringField;
    ODS_TransInfoFROM_FUNDS_COMMENT: TWideStringField;
    ODS_TransInfoTRANSID: TFloatField;
    ODS_TransInfoITEM_TYPE: TWideStringField;
    ODS_TransInfoITEM_MAKE: TWideStringField;
    ODS_TransInfoDESCRIPTION: TWideStringField;
    ODS_TransInfoPREVIOUSLY_REGISTERED_TO: TWideStringField;
    ODS_TransInfoPRESENTLY_REGISTERED_TO: TWideStringField;
    ODS_TransInfoESTIMATED_VALUE: TFloatField;
    ODS_TransInfoSTATUS_CODE: TWideStringField;
    ODS_TransInfoSTATUS_COMMENTS: TWideStringField;
    ODS_TransInfoDISPOSED_VALUE: TFloatField;
    ODS_TransInfoITEM_SIZE: TFloatField;
    ODS_TransInfoITEM_SIZE_UOM: TWideStringField;
    ODS_TransInfoITEM_REGISTRATION_DATE: TDateTimeField;
    ODS_TransInfoITEM_REGISTRATION_NUMBER: TWideStringField;
    ODS_TransInfoITEM_IDENTIFICATION_NUMBER: TWideStringField;
    ODS_TransInfoITEM_COMMENTS: TWideStringField;
    ODS_TransInfoCONTACT_TYPE: TWideStringField;
    ODS_TransInfoITEMCOUNTRY: TWideStringField;
    ODS_TransInfoITEMCITY: TWideStringField;
    ODS_TransInfoITEMSTATE: TWideStringField;
    ODS_TransInfoITEMADRESS: TWideStringField;
    ODS_TransInfoITEMZIP: TWideStringField;
    ODS_TransInfoSUBMISSION_CODE: TWideStringField;
    ODS_TransInfoENTITY_REFERENCE: TWideStringField;
    ODS_TransInfoFIU_REF_NUMBER: TWideStringField;
    ODS_TransInfoTO_FUNDS_CODE: TWideStringField;
    ODS_TransInfoTO_FUNDS_COMMENT: TWideStringField;
    procedure ODS_CountriesAfterScroll(DataSet: TDataSet);
    procedure ODS_mmx_transmodeAfterScroll(DataSet: TDataSet);
    procedure ODS_mmx_tofundsAfterScroll(DataSet: TDataSet);
    procedure ODS_mmx_fromfundsAfterScroll(DataSet: TDataSet);
    procedure ODS_mmx_reportcodeAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses TransInfoImpl;

{$R *.dfm}

procedure TDM.ODS_CountriesAfterScroll(DataSet: TDataSet);
begin
  ODS_Cityes.Close;
  ODS_Cityes.SetVariable('COUNTRY_ID', ODS_CountriesID.AsInteger);
  ODS_Cityes.Open;
end;

procedure TDM.ODS_mmx_fromfundsAfterScroll(DataSet: TDataSet);
begin
if ODS_mmx_fromfunds.Fieldbyname('SYMBOL').AsString='O' then
begin
  TransInfo.Memo_fromfundsComment.Enabled:=True;
  TransInfo.Label41.Visible:=True;
end
else
  begin
    TransInfo.Memo_fromfundsComment.Enabled:=False;
    TransInfo.Label41.Visible:=False;
  end;

end;

procedure TDM.ODS_mmx_reportcodeAfterScroll(DataSet: TDataSet);
begin
TransInfo.Label39.Visible:=(ODS_mmx_reportcodeNAME.Text='STR');
end;

procedure TDM.ODS_mmx_tofundsAfterScroll(DataSet: TDataSet);
begin
if ODS_mmx_tofunds.Fieldbyname('SYMBOL').AsString='O' then
begin
  TransInfo.Memo_tofundsComment.Enabled:=True;
  TransInfo.Label42.Visible:=True;
end
else
  begin
    TransInfo.Memo_tofundsComment.Enabled:=False;
    TransInfo.Label42.Visible:=False;
  end;

end;

procedure TDM.ODS_mmx_transmodeAfterScroll(DataSet: TDataSet);
begin
if ODS_mmx_transmode.Fieldbyname('name').AsInteger=9999 then
begin
  TransInfo.Memo_transmode_comment.Enabled:=True;
  TransInfo.Label40.Visible:=True;
end
  else
  begin
  TransInfo.Memo_transmode_comment.Enabled:=False;
  TransInfo.Label40.Visible:=False;
  end;

end;

end.

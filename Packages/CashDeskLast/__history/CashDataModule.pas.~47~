unit CashDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TCashDataMod = class(TDataModule)
    ODSCurrency: TOracleDataSet;
    DataSrcCashReort: TDataSource;
    OPCash: TOraclePackage;
    ODSCashReport: TOracleDataSet;
    ODSCashReportMEDIOCRITY: TFloatField;
    ODSCashReportLAMMOUNTS: TFloatField;
    ODSIOCome: TOracleDataSet;
    ODSIOComeLAMMOUNT: TFloatField;
    ODSIOComeAMMOUNT: TFloatField;
    DataSrcViewer: TDataSource;
    ODSTransactionsViewer: TOracleDataSet;
    ODSLogo: TOracleDataSet;
    ODSLogoLOGO: TBlobField;
    ODSCashInfo: TOracleDataSet;
    DSCashInfo: TDataSource;
    ODSCashB: TOracleDataSet;
    ODSTransactionsViewerDAT: TDateTimeField;
    ODSTransactionsViewerID: TFloatField;
    ODSTransactionsViewerDEBTID: TFloatField;
    ODSTransactionsViewerKREDITID: TFloatField;
    ODSTransactionsViewerDCURRENCY: TFloatField;
    ODSTransactionsViewerKLI_ID: TFloatField;
    ODSTransactionsViewerDEBTCOME: TFloatField;
    ODSTransactionsViewerCREDITCOME: TFloatField;
    ODSTransactionsViewerKCURRENCY: TIntegerField;
    ODSTransactionsViewerDAMMOUNT: TFloatField;
    ODSTransactionsViewerKAMMOUNT: TFloatField;
    ODSTransactionsViewerLAMMOUNT: TFloatField;
    ODSCashInfoID: TFloatField;
    ODSRates: TOracleDataSet;
    ODSRatesRATE: TFloatField;
    ODSRatesPRESENTDATE: TDateTimeField;
    ODSValute: TOracleDataSet;
    ODSValuteVALUTE: TIntegerField;
    ODSTransactionsViewerval_name: TWideStringField;
    ODSValuteName: TOracleDataSet;
    ODSValuteNameVALUTE: TIntegerField;
    ODSTransactionsViewerDEBETFILIAL: TIntegerField;
    ODSTransactionsViewerCREDITFILIAL: TIntegerField;
    Filials: TOracleDataSet;
    ODSTransactionsViewerRecordNo: TIntegerField;
    CashSymbols: TOracleDataSet;
    TotalResult: TOracleDataSet;
    TotalResultDLAMMOUNT: TFloatField;
    TotalResultDAMMOUNT: TFloatField;
    TotalResultDCOUNT: TFloatField;
    TotalResultCLAMMOUNT: TFloatField;
    TotalResultCAMMOUNT: TFloatField;
    TotalResultCCOUNT: TFloatField;
    TotalResultOperationDate: TDateField;
    Settings: TOracleDataSet;
    SettingsData: TDataSource;
    BrowseCashInfo: TOracleDataSet;
    DataBrowseCashInfo: TDataSource;
    TotalResultCASHREMAINDER: TFloatField;
    ODSTransactionsViewerOPERATORID: TFloatField;
    ODSOperator: TOracleDataSet;
    DataOperator: TDataSource;
    ODSOperatorID: TFloatField;
    OrDS_CashBook: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TWideStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    SettingsCASHBALANCENATIONAL: TFloatField;
    SettingsCASHBALANCEENGLISH: TFloatField;
    ODS_L_CHIN: TOracleDataSet;
    ODS_L_CHINsayi: TIntegerField;
    ODS_L_CHINROWNUM: TFloatField;
    ODS_L_CHINID: TFloatField;
    ODS_L_CHINDEBTID: TFloatField;
    ODS_L_CHINDEBETFILIAL: TIntegerField;
    ODS_L_CHINKREDITID: TFloatField;
    ODS_L_CHINDCURRENCY: TFloatField;
    ODS_L_CHINKLI_ID: TFloatField;
    ODS_L_CHINCREDITFILIAL: TIntegerField;
    ODS_L_CHINDEBTCOME: TFloatField;
    ODS_L_CHINCREDITCOME: TFloatField;
    ODS_L_CHINMEDAXIL: TFloatField;
    ODS_L_CHINMEXARIC: TFloatField;
    ODS_L_CHINKCURRENCY: TIntegerField;
    ODS_L_CHINDAMMOUNT: TFloatField;
    ODS_L_CHINKAMMOUNT: TFloatField;
    ODS_L_CHINLAMMOUNT: TFloatField;
    ODS_L_CHINOPERATORID: TFloatField;
    ODS_EVV_SON_QALIQ: TOracleDataSet;
    SettingsPHOTO: TBlobField;
    ODSTransactionsViewerCommitterID: TFloatField;
    ODS_L_CHINCOMMITTERID: TFloatField;
    OrDS_Comitters: TOracleDataSet;
    FloatField4: TFloatField;
    DS_Committers: TDataSource;
    ODSBank: TOracleDataSet;
    ODSBankKOD_B: TFloatField;
    ODSBankBANK: TWideStringField;
    ODSBankINN: TWideStringField;
    SettingsDESCRIPTION_AZ: TWideStringField;
    SettingsDESCRIPTION_ENG: TWideStringField;
    SettingsSIGNATYRE: TWideStringField;
    SettingsRESPONSIBLE_PERSON: TWideStringField;
    SettingsHANDOVER: TWideStringField;
    SettingsCHIEF: TWideStringField;
    SettingsOPERATOR: TWideStringField;
    SettingsCASHIER: TWideStringField;
    SettingsAMOUNT: TWideStringField;
    SettingsCHIEF_OUT: TWideStringField;
    SettingsOPERATOR_OUT: TWideStringField;
    SettingsCASHIER_OUT: TWideStringField;
    SettingsACCOUNTANT: TWideStringField;
    SettingsCONTROLLER: TWideStringField;
    SettingsCONTROLLER_OUT: TWideStringField;
    ODSOperatorNAME: TWideStringField;
    OrDS_ComittersNAME: TWideStringField;
    ODSIOComeBSYMBOL: TWideStringField;
    ODSIOComeACCOUNTNUMBER: TWideStringField;
    ODSIOComeNO_PROV: TWideStringField;
    ODSCashInfoPERSON_DOC: TWideStringField;
    ODSCashInfoISSUEDBY: TWideStringField;
    ODSCashInfoSERIA: TWideStringField;
    ODSCashInfoDOCNUMBER: TWideStringField;
    ODSCashInfoFROMWHEN: TWideStringField;
    ODSValuteNameVALU_NAME: TWideStringField;
    ODSValuteNameVALU_BALA: TWideStringField;
    ODSValuteVAL_NAME: TWideStringField;
    ODSTransactionsViewerDEBIT: TWideStringField;
    ODSTransactionsViewerDNAME: TWideStringField;
    ODSTransactionsViewerKREDIT: TWideStringField;
    ODSTransactionsViewerKNAME: TWideStringField;
    ODSTransactionsViewerBSYMBOL: TWideStringField;
    ODSTransactionsViewerASSIGNMENT: TWideStringField;
    ODSTransactionsViewerDEBTCURNAME: TWideStringField;
    ODSTransactionsViewerCREDITCURNAME: TWideStringField;
    ODSTransactionsViewerNO_PROV: TWideStringField;
    ODSRatesCURRENCY: TWideStringField;
    ODS_L_CHINHESAB: TWideStringField;
    ODS_L_CHINDEBIT: TWideStringField;
    ODS_L_CHINDNAME: TWideStringField;
    ODS_L_CHINHESAB_ADI: TWideStringField;
    ODS_L_CHINDEBTCURNAME: TWideStringField;
    ODS_L_CHINKREDIT: TWideStringField;
    ODS_L_CHINKNAME: TWideStringField;
    ODS_L_CHINCREDITCURNAME: TWideStringField;
    ODS_L_CHINBSYMBOL: TWideStringField;
    ODS_L_CHINNO_PROV: TWideStringField;
    ODS_L_CHINASSIGNMENT: TWideStringField;
    ODSCashReportBSYMBOL: TWideStringField;
    ODSCashReportNAME: TWideStringField;
    ForFizFsVoen: TOracleDataSet;
    OrPackTransaction: TOraclePackage;
    newods_lchin: TOracleDataSet;
    ODSTransactionsViewer2: TOracleDataSet;
    DataSrcViewer2: TDataSource;
    ODSTransactionsViewer2DAT: TDateTimeField;
    ODSTransactionsViewer2ID: TFloatField;
    ODSTransactionsViewer2DEBITACC: TWideStringField;
    ODSTransactionsViewer2DEBITCUS: TFloatField;
    ODSTransactionsViewer2DEBITBRANCH: TIntegerField;
    ODSTransactionsViewer2DEBITNAME: TWideStringField;
    ODSTransactionsViewer2DCURRENCY: TFloatField;
    ODSTransactionsViewer2DEBITCURNAME: TWideStringField;
    ODSTransactionsViewer2DEBITBALANCE: TFloatField;
    ODSTransactionsViewer2CREDITACC: TWideStringField;
    ODSTransactionsViewer2CREDITCUS: TFloatField;
    ODSTransactionsViewer2CREDITBRANCH: TIntegerField;
    ODSTransactionsViewer2CREDITNAME: TWideStringField;
    ODSTransactionsViewer2CCURRENCY: TIntegerField;
    ODSTransactionsViewer2CREDITCURNAME: TWideStringField;
    ODSTransactionsViewer2CREDITBALANCE: TFloatField;
    ODSTransactionsViewer2AMMOUNT: TFloatField;
    ODSTransactionsViewer2AMMOUNT_C: TFloatField;
    ODSTransactionsViewer2LAMMOUNT: TFloatField;
    ODSTransactionsViewer2KASSA_B: TWideStringField;
    ODSTransactionsViewer2NO_PROV: TWideStringField;
    ODSTransactionsViewer2OP_ID: TFloatField;
    ODSTransactionsViewer2COMMIT_OPID: TFloatField;
    ODSTransactionsViewer2USERINSERT: TWideStringField;
    ODSTransactionsViewer2USERCOMMIT: TWideStringField;
    ODSTransactionsViewer2NAME: TWideStringField;
    ODSTransactionsViewerISSUEDBY: TWideStringField;
    ODSTransactionsViewerSERIA: TWideStringField;
    ODSTransactionsViewerDOCNUMBER: TWideStringField;
    ODSTransactionsViewerPERSON_DOC: TWideStringField;
    ODSTransactionsViewerFROMWHEN: TWideStringField;
    ODSTransactionsViewer2rown: TFloatField;
    ODSTransactionsViewer2SERIA: TStringField;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet3USERNAME: TWideStringField;
    ODSTransactionsViewer2debtostat: TFloatField;
    ODSTransactionsViewer2kredostat: TFloatField;
    ODSTransactionsViewer2d1: TWideStringField;
    SettingsOPERATORTITLE: TWideStringField;
    SettingsACCOUNTANTTITLE: TWideStringField;
    procedure ODSTransactionsViewerRecordNoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure TotalResultCalcFields(DataSet: TDataSet);
    procedure ODSTransactionsViewerAfterScroll(DataSet: TDataSet);
    procedure ODS_L_CHINsayiGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashDataMod: TCashDataMod;
   ii,dd   : cardinal;
implementation

uses sboapiDataModuleImpl, CashDeskImpl,UntCashBook;

{$R *.DFM}
procedure TCashDataMod.ODSTransactionsViewerRecordNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text :=IntToStr(ODSTransactionsViewer.RecNo);
end;

procedure TCashDataMod.TotalResultCalcFields(DataSet: TDataSet);
begin
 with DataSet do
  FieldByName('OperationDate').AsDateTime :=FrmCashDesk.DTPEnd.DateTime;
end;

procedure TCashDataMod.ODSTransactionsViewerAfterScroll(DataSet: TDataSet);
begin
 with FrmCashDesk, DataSet do
  EPackNo.Text :=FieldByName('NO_PROV').AsString;
end;

procedure TCashDataMod.ODS_L_CHINsayiGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);

begin
   if CashDataMod.ODS_L_CHINMEDAXIL.AsFloat<>0 then
   begin
      Text :=IntToStr(ODS_L_CHIN.RecNo);
      ii:=ODS_L_CHIN.RecNo;
   end else
   begin
      Text :=IntToStr(ODS_L_CHIN.RecNo-ii);
      dd:=ODS_L_CHIN.RecNo-ii;
   end;
   QRp_CashBook.QRLabel14.Caption:= IntToStr(ii);
   QRp_CashBook.QRLabel15.Caption:= IntToStr(dd);
end;

end.

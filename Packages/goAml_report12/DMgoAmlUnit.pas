unit DMgoAmlUnit;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle;

type
  TDMgoAml = class(TDataModule)
    DS_Main: TDataSource;
    ODS_Main: TOracleDataSet;
    ODS_MainID: TFloatField;
    ODS_MainREPORT_CODE: TWideStringField;
    ODS_MainDEBITID: TFloatField;
    ODS_MainDEBITACCNO: TWideStringField;
    ODS_MainDEBITCURRENCYSNAME: TWideStringField;
    ODS_MainCREDITID: TFloatField;
    ODS_MainCREDITACCNO: TWideStringField;
    ODS_MainCREDITCURRENCYSNAME: TWideStringField;
    ODS_MainD_FOREIGN_AMOUNT: TFloatField;
    ODS_MainC_FOREIGN_AMOUNT: TFloatField;
    ODS_MainAMOUNT_LOCAL: TFloatField;
    ODS_MainD_FOREIGN_EXCHANGE_RATE: TFloatField;
    ODS_MainDEBITBALANCE: TFloatField;
    ODS_MainC_FOREIGN_EXCHANGE_RATE: TFloatField;
    ODS_MainCREDITBALANCE: TFloatField;
    ODS_MainTRANSACTION_DESCRIPTION: TWideStringField;
    ODS_MainACTION: TWideStringField;
    ODS_MainDATE_TRANSACTION: TWideStringField;
    ODS_MainTRANSMODE_CODE: TIntegerField;
    ODS_MainDEBTCUSTNAME: TWideStringField;
    ODS_MainCREDCUSTNAME: TWideStringField;
    ODS_MainDCUSTID: TFloatField;
    ODS_MainKCUSTID: TFloatField;
    ODS_FilesPath: TOracleDataSet;
    ODS_FilesPathDESCRIPTION: TWideStringField;
    ODS_MainKASSANOVU: TWideStringField;
    ODS_MainTRANSACTIONDATE: TDateTimeField;
    ODS_MainTRANSACTIONNUMBER: TFloatField;
    ods_jeson_credit: TOracleDataSet;
    ods_jeson_creditJSON_REPORT: TWideStringField;
    ODS_Maindebt: TOracleDataSet;
    ODS_MaindebtID: TFloatField;
    ODS_MaindebtREPORT_CODE: TWideStringField;
    ODS_MaindebtDEBITID: TFloatField;
    ODS_MaindebtDEBITACCNO: TWideStringField;
    ODS_MaindebtDEBITCURRENCYSNAME: TWideStringField;
    ODS_MaindebtCREDITID: TFloatField;
    ODS_MaindebtCREDITACCNO: TWideStringField;
    ODS_MaindebtCREDITCURRENCYSNAME: TWideStringField;
    ODS_MaindebtD_FOREIGN_AMOUNT: TFloatField;
    ODS_MaindebtC_FOREIGN_AMOUNT: TFloatField;
    ODS_MaindebtAMOUNT_LOCAL: TFloatField;
    ODS_MaindebtD_FOREIGN_EXCHANGE_RATE: TFloatField;
    ODS_MaindebtDEBITBALANCE: TFloatField;
    ODS_MaindebtC_FOREIGN_EXCHANGE_RATE: TFloatField;
    ODS_MaindebtCREDITBALANCE: TFloatField;
    ODS_MaindebtTRANSACTION_DESCRIPTION: TWideStringField;
    ODS_MaindebtACTION: TWideStringField;
    ODS_MaindebtDATE_TRANSACTION: TWideStringField;
    ODS_MaindebtTRANSMODE_CODE: TIntegerField;
    ODS_MaindebtDEBTCUSTNAME: TWideStringField;
    ODS_MaindebtCREDCUSTNAME: TWideStringField;
    ODS_MaindebtDCUSTID: TFloatField;
    ODS_MaindebtKCUSTID: TFloatField;
    ODS_MaindebtTRANSACTIONDATE: TDateTimeField;
    ODS_MaindebtTRANSACTIONNUMBER: TFloatField;
    DS_Maindbt: TDataSource;
    ODS_Rep: TOracleDataSet;
    DS_Rep: TDataSource;
    odsa_grid: TOracleDataSet;
    dsrc_grid: TDataSource;
    ODS_RepTRANSMODE_CODE: TIntegerField;
    ODS_RepREPORT_CODE: TWideStringField;
    ODS_RepCUSTID: TFloatField;
    ODS_RepNAME: TWideStringField;
    ODS_RepLAMMOUNT: TFloatField;
    ODS_RepDK: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMgoAml: TDMgoAml;

implementation

uses sboapiDataModuleImpl, goAml_TLB, goAmlImpl;
{$R *.dfm}

end.

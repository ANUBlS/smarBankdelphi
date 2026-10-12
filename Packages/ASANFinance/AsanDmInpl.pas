unit AsanDmInpl;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle;

type
  TAsanDm = class(TDataModule)
    BankInfo: TOracleDataSet;
    BankInfoLOGO: TBlobField;
    BankInfoBANK: TWideStringField;
    BankInfoAZ_NAME: TWideStringField;
    PrPackage: TOraclePackage;
    OracleQuery1: TOracleQuery;
    LogDSest: TOracleDataSet;
    InsAsanLog: TOracleDataSet;
    InsAsanLogID: TFloatField;
    InsAsanLogDAT: TDateTimeField;
    InsAsanLogPIN: TWideStringField;
    InsAsanLogUSR: TWideStringField;
    InsAsanLogSERVICE: TWideStringField;
    InsAsanLogINFO: TWideMemoField;
    InsAsanLogSTATUS: TWideStringField;
    BankInfoFOND_REG_NO: TWideStringField;
    IdDSet: TOracleDataSet;
    IdDSetID: TFloatField;
    EmployerDataSet: TOracleDataSet;
    EmployerDataSrc: TDataSource;
    EmployerDataSetID: TFloatField;
    EmployerDataSetROW_NUMBER: TFloatField;
    EmployerDataSetVOEN: TWideStringField;
    EmployerDataSetNAME: TWideStringField;
    EmployerDataSetWORKERCOUNT: TWideStringField;
    EmployerDataSetLEGALADDRESS: TWideStringField;
    EmployerDataSetEMLAKNOVU: TWideStringField;
    Status: TOracleDataSet;
    StatusID: TFloatField;
    StatusCODE: TWideStringField;
    StatusMESSAGE: TWideStringField;
    EmployerDataSetISHCIADI: TWideStringField;
    EmployerDataSetSURNAME: TWideStringField;
    EmployerDataSetPATRONYMIC: TWideStringField;
    EmployerDataSetISHYERINOVU: TWideStringField;
    EmployerDataSetWORKPLACE: TWideStringField;
    EmployerDataSetPOSITION: TWideStringField;
    EmployerDataSetPOSITIONLABOURCONTRACT: TWideStringField;
    EmployerDataSetSALARY: TWideStringField;
    EmployerDataSetWORKCASUALTYPE: TWideStringField;
    EmployerDataSetSSN: TWideStringField;
    EmployerDataSetBEGINDATE: TWideStringField;
    EmployerDataSetENDDATE: TWideStringField;
    EmployerDataSetPERIODTYPE: TWideStringField;
    EmployerDataSetNOMRE: TWideStringField;
    EmployerDataSetPHONE: TWideStringField;
    DeActiveEmpDSet: TOracleDataSet;
    DeActiveEmpDSrc: TDataSource;
    DeActiveEmpDSetID: TFloatField;
    DeActiveEmpDSetROW_NUMBER: TFloatField;
    DeActiveEmpDSetVOEN: TWideStringField;
    DeActiveEmpDSetNAME: TWideStringField;
    DeActiveEmpDSetPOSITION: TWideStringField;
    DeActiveEmpDSetSALARY: TWideStringField;
    DeActiveEmpDSetBEGINDATE: TWideStringField;
    DeActiveEmpDSetENDDATE: TWideStringField;
    EmployerDataSetMQAVILE_BITME: TWideStringField;
    EmployerDataSetFIRM_PHONE: TWideStringField;
    EmployerDataSetNEXTENDDATE: TWideStringField;
    PensionDSet: TOracleDataSet;
    PensionDSrc: TDataSource;
    PensionDSetID: TFloatField;
    PensionDSetNAME: TWideStringField;
    PensionDSetSURNAME: TWideStringField;
    PensionDSetPATRONYMIC: TWideStringField;
    PensionDSetBIRTHDATE: TWideStringField;
    PensionDSetALLBEGINDATE: TWideStringField;
    PensionDSetALLENDDATE: TWideStringField;
    PensionDSetALLTYPE: TWideStringField;
    PensionDSetALLGROUP: TWideStringField;
    PensionDSetALLAMOUNT: TWideStringField;
    PensionDSetPENLABEL: TWideStringField;
    PensionDSetPENDESCRIPTION: TWideStringField;
    PensionDSetPENSTARTDATE: TWideStringField;
    PensionDSetPENENDDATE: TWideStringField;
    PensionDSetPENAMOUNT: TWideStringField;
    FarmPersonDsrc: TDataSource;
    FarmPersonDset: TOracleDataSet;
    FarmPersonDsetID: TFloatField;
    FarmPersonDsetPIN: TWideStringField;
    FarmPersonDsetFIRSTNAME: TWideStringField;
    FarmPersonDsetLASTNAME: TWideStringField;
    FarmPersonDsetFATHERNAME: TWideStringField;
    FarmPersonDsetBIRTHDATE: TWideStringField;
    FarmsSrc: TDataSource;
    FarmSet: TOracleDataSet;
    XercDsrc: TDataSource;
    XercSet: TOracleDataSet;
    XercSetID: TFloatField;
    XercSetPIN: TWideStringField;
    XercSetDAT: TWideStringField;
    XercSetSERVICE: TWideStringField;
    XercSetAMOUNT: TFloatField;
    XercSetIPADDRESS: TWideStringField;
    XercSetROW_NUMBER: TFloatField;
    FarmSetID: TFloatField;
    FarmSetFID: TWideStringField;
    FarmSetNAME: TWideStringField;
    FarmSetFIELDS: TFloatField;
    FarmSetVILLAGENAME: TWideStringField;
    FarmSetDOCTYPE: TWideStringField;
    FarmSetFIELDAMOUNT: TWideStringField;
    FarmSetUNIT: TWideStringField;
    FarmSetPLANTS: TFloatField;
    FarmSetPLNAME: TWideStringField;
    FarmSetPLFIELDAMOUNT: TWideStringField;
    FarmSetPLUNIT: TWideStringField;
    InsAsanLogDOCNUMBER: TWideStringField;
    InsAsanLogURL: TWideStringField;
    VoenSrc: TDataSource;
    VoenSet: TOracleDataSet;
    VoenSetID: TFloatField;
    VoenSetPAYER_TYPE: TWideStringField;
    VoenSetPAYER_DESCRIPTION: TWideStringField;
    VoenSetLEGAL_ADDRESS: TWideStringField;
    VoenSetVOEN: TWideStringField;
    VoenSetVOEN_CREATE_DATE: TWideStringField;
    VoenSetCHIEF_NAME: TWideStringField;
    VoenSetCHIEF_SURNAME: TWideStringField;
    VoenSetCHIEF_PATRONYMIC: TWideStringField;
    ods_link: TOracleDataSet;
    ods_linkID: TFloatField;
    ods_linkPERSONALINFO: TWideStringField;
    ods_linkEMPLOYEEINFO: TWideStringField;
    ods_linkPENSIONINFO: TWideStringField;
    ods_linkFARMINFO: TWideStringField;
    ods_linkVOENINFO: TWideStringField;
    VoenSetFULL_NAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AsanDm: TAsanDm;

implementation
  uses
  sboapiDataModuleImpl;
{$R *.dfm}

procedure TAsanDm.DataModuleCreate(Sender: TObject);
begin
BankInfo.Open;
ods_link.Open;

end;

procedure TAsanDm.DataModuleDestroy(Sender: TObject);
begin
BankInfo.close;
ods_link.Close;
end;

end.

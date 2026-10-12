unit UMFDataMod;
             //OPCOMMON
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PlgModalContainer, Db, Oracle, OracleData,sboapiDataModuleImpl;

type
  TDModule = class(TDataModule)
    Ins_MotorFullData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
    Ins_MotorFullID: TFloatField;
    Ins_MotorFullKLI_ID: TFloatField;
    Ins_MotorFullBANKING_DETAILS: TWideStringField;
    Ins_MotorFullINSUREDMODEL: TWideStringField;
    Ins_MotorFullINSUREDSTATENUM: TWideStringField;
    Ins_MotorFullINSUREDCOLOR: TWideStringField;
    Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField;
    Ins_MotorFullINSUREDNUMSEATS: TIntegerField;
    Ins_MotorFullINSUREDENGINENUM: TWideStringField;
    Ins_MotorFullINSUREDCHASSISNUM: TWideStringField;
    Ins_MotorFullINSUREDACTUALVALUE: TFloatField;
    Ins_MotorFullTRANSMISSION_TYPE: TWideStringField;
    Ins_MotorFullPRESENCE_ALARM: TWideStringField;
    Ins_MotorFullMOTOR_USAGE: TWideStringField;
    Ins_MotorFullMOTORSTORAGEPLACE: TWideStringField;
    Ins_MotorFullEXISTINGDAMAGE: TWideStringField;
    Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TWideStringField;
    Ins_MotorFullBROKER: TFloatField;
    Ins_MotorFullINSUREDBODY: TWideStringField;
    Ins_MotorFullTYPEID: TIntegerField;
    Ins_MotorFullPROFITID: TFloatField;
    MoreReportData: TDataSource;
    More_Report: TOracleDataSet;
    More_ReportID: TFloatField;
    More_ReportFULL_ID: TFloatField;
    More_ReportNAME: TWideStringField;
    More_ReportEXPERIENCE: TWideStringField;
    More_ReportHISTORY: TWideStringField;
    More_ReportAGE: TIntegerField;
    Accesories: TOracleDataSet;
    AccesoriesID: TFloatField;
    AccesoriesTYPE: TWideStringField;
    AccesoriesMAKE: TWideStringField;
    AccesoriesVALUE: TFloatField;
    AccesoriesHOWCREATED: TWideStringField;
    AccesoriesFULL_ID: TFloatField;
    AccesoriesData: TDataSource;
    CustomersData: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TWideStringField;
    CustomersADDRESS: TWideStringField;
    CustomersMOBILEPHONE: TWideStringField;
    CustomersFAX: TWideStringField;
    CustomersCONTACTPERSON: TWideStringField;
    PINS_FULLMOTOR: TOraclePackage;
    SuggestionData: TDataSource;
    Suggestion: TOracleDataSet;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TWideStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TWideStringField;
    ODSBeneficiaryADDRESS: TWideStringField;
    ODSBeneficiaryPHONE: TWideStringField;
    ODSBeneficiaryBANKING_DETAILS: TWideStringField;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSContractsVALUTE_ID: TFloatField;
    ODSContractsAMMOUNT: TFloatField;
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSContractsPOLICY_NUM: TWideStringField;
    DSContracts: TDataSource;
    AgentsSource: TDataSource;
    ODSAgents: TOracleDataSet;
    ODSAgentsID: TFloatField;
    ODSAgentsNAME: TWideStringField;
    OPCOMMON: TOraclePackage;
    MoreThanOne: TOracleDataSet;
    MoreThanOneID: TFloatField;
    MoreThanOneNAME: TWideStringField;
    MoreThanOneSURNAME: TWideStringField;
    MoreThanOneFATHERNAME: TWideStringField;
    MoreThanOneAGE: TIntegerField;
    MoreThanOneEXPERIENCE: TWideStringField;
    MoreThanOneFULL_ID: TFloatField;
    MoreThanOneHISTORY: TWideStringField;
    MoreThanOneData: TDataSource;
    Ins_MotorFullINSUREDTYPE: TFloatField;
    DSAutoTypes: TDataSource;
    ODSAutoTypes: TOracleDataSet;
    ODSAutoTypesID: TFloatField;
    ODSAutoTypesNAME: TWideStringField;
    ODSMarks: TOracleDataSet;
    ODSMarksID: TFloatField;
    ODSMarksNAME: TWideStringField;
    ODSMarksSTATE_ID: TFloatField;
    ODSMarksCALCOPTIONS: TIntegerField;
    DSMarks: TDataSource;
    DSModels: TDataSource;
    ODSModels: TOracleDataSet;
    ODSModelsID: TFloatField;
    ODSModelsNAME: TWideStringField;
    ODSModelsMARK_ID: TFloatField;
    ODSModelsCALCOPTIONS: TIntegerField;
    Ins_MotorFullINSUREDMARK: TWideStringField;
    ODSFranshiz: TOracleDataSet;
    ODSFranshizFRANSHIZ: TFloatField;
    ODSFranshizTARIFF: TFloatField;
    ODSMonths: TOracleDataSet;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    DSFranshiz: TDataSource;
    DSMonths: TDataSource;
    ODSReliaseDates: TOracleDataSet;
    ODSReliaseDatesID: TFloatField;
    ODSReliaseDatesBEGINDATE: TDateTimeField;
    ODSReliaseDatesENDDATE: TDateTimeField;
    ODSReliaseDatesSTATE_ID: TFloatField;
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TWideStringField;
    ODSAvaluteVALU_NAME: TWideStringField;
    ODSAvaluteVALU_SHORT: TWideStringField;
    DSAvalute: TDataSource;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsAGENT_ID: TFloatField;
    Ins_MotorFullCONTACT_PERSON: TWideStringField;
    Ins_MotorFullCLOSE_PREFIX: TIntegerField;
    Ins_MotorFullMONTH_ID: TFloatField;
    Ins_MotorFullCID: TFloatField;
    ODSContractsBLANK_ID: TFloatField;
    Ins_MotorFullREQ_KASKO_INS_SECUR_AMOUNT: TFloatField;
    Ins_MotorFullREQ_KASKO_INS_SECUR_FR: TFloatField;
    Ins_MotorFullREQ_ADDITI_INS_SECURITY_AMOUNT: TFloatField;
    Ins_MotorFullREQ_ADDITI_INS_SECURITY_FR: TFloatField;
    Ins_MotorFullREQ_RESP_INS_SECURIT_AMOUT: TFloatField;
    Ins_MotorFullREQ_RESP_INS_SECURIT_FR: TFloatField;
    Ins_MotorFullREQ_PER_ACCIDENT_INS_AMOUNT: TFloatField;
    Ins_MotorFullREQ_PER_ACCIDENT_INS_FR: TFloatField;
    Ins_MotorFullREQ_KASKO_INS_SECUR: TWideStringField;
    Ins_MotorFullREQ_ADDITIONAL_INS_SECURITY: TWideStringField;
    Ins_MotorFullREQ_RESPONSIBILITY_INS_SECURIT: TWideStringField;
    Ins_MotorFullREQ_PER_ACCIDENT_INS: TWideStringField;
    DsSysdat: TOracleDataSet;
    DsSysdatTEK_DAT: TDateTimeField;
    DsSysdatPRED_DAT: TDateTimeField;
    DsSysdatARC_DAY: TDateTimeField;
    DsSysdatCLOSE: TIntegerField;
    Ins_MotorFullMARKA_ID: TFloatField;
    Ins_MotorFullMODEL_ID: TFloatField;
    Ins_MotorFullCOLOR_ID: TFloatField;
    SB_aca: TOraclePackage;
    procedure ODSContractsAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule: TDModule;



implementation

{$R *.DFM}

procedure TDModule.ODSContractsAfterInsert(DataSet: TDataSet);
begin
     DataSet.FieldByName('TYPE_ID').asInteger := 4;
end;

end.

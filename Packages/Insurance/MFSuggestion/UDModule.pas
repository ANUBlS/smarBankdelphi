unit UDModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDModule1 = class(TDataModule)
    ODSFranshiz: TOracleDataSet;
    ODSFranshizFRANSHIZ: TFloatField;
    ODSFranshizTARIFF: TFloatField;
    DSFranshiz: TDataSource;
    AValuteData: TDataSource;
    AValute: TOracleDataSet;
    AValuteVALU_NAME: TStringField;
    AValuteVALUTE: TIntegerField;
    AValuteVAL_NAME: TStringField;
    AValuteVALU_SHORT: TStringField;
    PolicyData: TDataSource;
    Policy: TOracleDataSet;
    PolicyID: TFloatField;
    PolicyMS_ID: TFloatField;
    PolicyPOLICYNUM: TStringField;
    PolicySUBJECTVALUE: TFloatField;
    Suggest_Rep: TOracleDataSet;
    Suggest_RepID: TFloatField;
    Suggest_RepMK_ID: TFloatField;
    Suggest_RepRISKADDRESS: TStringField;
    Suggest_RepINSURANCEAMMOUNT: TFloatField;
    Suggest_RepENDDATE: TDateTimeField;
    Suggest_RepINSURANCESUM: TFloatField;
    Suggest_RepData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
    Ins_MotorFullID: TFloatField;
    Ins_MotorFullKLI_ID: TFloatField;
    Ins_MotorFullBANKING_DETAILS: TStringField;
    Ins_MotorFullINSUREDMODEL: TStringField;
    Ins_MotorFullINSUREDSTATENUM: TStringField;
    Ins_MotorFullINSUREDCOLOR: TStringField;
    Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField;
    Ins_MotorFullINSUREDNUMSEATS: TIntegerField;
    Ins_MotorFullINSUREDENGINENUM: TStringField;
    Ins_MotorFullINSUREDCHASSISNUM: TStringField;
    Ins_MotorFullINSUREDACTUALVALUE: TFloatField;
    Ins_MotorFullTRANSMISSION_TYPE: TStringField;
    Ins_MotorFullPRESENCE_ALARM: TStringField;
    Ins_MotorFullMOTOR_USAGE: TStringField;
    Ins_MotorFullMOTORSTORAGEPLACE: TStringField;
    Ins_MotorFullEXISTINGDAMAGE: TStringField;
    Ins_MotorFullBROKER: TFloatField;
    Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField;
    Ins_MotorFullINSUREDBODY: TStringField;
    Ins_MotorFullINSUREDTYPE: TFloatField;
    Ins_MotorFullData: TDataSource;
    SuggestionData: TDataSource;
    Suggestion: TOracleDataSet;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    BankInfoData: TDataSource;
    BankInfo: TOracleDataSet;
    RisksData: TDataSource;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    CustomersData: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersADDRESS: TStringField;
    CustomersMOBILEPHONE: TStringField;
    CustomersFAX: TStringField;
    PINS_FULLMOTOR: TOraclePackage;
    Conditions: TOracleDataSet;
    ConditionsID: TFloatField;
    ConditionsNAME: TStringField;
    Risktypes: TOracleDataSet;
    RisktypesID: TFloatField;
    RisktypesNAME: TStringField;
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
    ODSContractsPOLICY_NUM: TStringField;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsAGENT_ID: TFloatField;
    DSContracts: TDataSource;
    ConditionsData: TDataSource;
    RisktypesData: TDataSource;
    DSMonths: TDataSource;
    ODSMonths: TOracleDataSet;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    ODSReliaseDates: TOracleDataSet;
    ODSReliaseDatesID: TFloatField;
    ODSReliaseDatesBEGINDATE: TDateTimeField;
    ODSReliaseDatesENDDATE: TDateTimeField;
    ODSReliaseDatesSTATE_ID: TFloatField;
    Ins_MotorFullCID: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule1: TDModule1;

implementation

uses UMFSuggestion;

{$R *.DFM}

end.

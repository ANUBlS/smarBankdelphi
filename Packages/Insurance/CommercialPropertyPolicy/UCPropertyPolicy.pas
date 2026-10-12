unit UCPropertyPolicy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TPolicyDataModule = class(TDataModule)
    OPCOMMON: TOraclePackage;
    ODSCustomers: TOracleDataSet;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSCustomersADDRESS: TStringField;
    ODSCustomersMOBILEPHONE: TStringField;
    ODSCustomersFAX: TStringField;
    ODSCustomersSource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    BeneficiarySource: TDataSource;
    ODSCondition: TOracleDataSet;
    ODSConditionID: TFloatField;
    ODSConditionNAME: TStringField;
    ConditionSource: TDataSource;
    DSContracts: TDataSource;
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
    ODSAgent: TOracleDataSet;
    ODSAgentID: TFloatField;
    ODSAgentNAME: TStringField;
    AgentSource: TDataSource;
    ODSCPropertySuggest: TOracleDataSet;
    ODSCPropertySuggestID: TFloatField;
    ODSCPropertySuggestBID: TFloatField;
    ODSCPropertySuggestRISKADDRESS: TStringField;
    ODSCPropertySuggestINSURANCEAMMOUNT: TFloatField;
    ODSCPropertySuggestENDDATE: TDateTimeField;
    ODSCPropertySuggestRISK_ID: TFloatField;
    ODSCPropertySuggestFRZ_ID: TFloatField;
    ODSCPropertySuggestCNDT_ID: TFloatField;
    ODSCPropertySuggestVAL_ID: TFloatField;
    ODSCPropertySuggestINSURANCESUM: TFloatField;
    CPSuggestSource: TDataSource;
    ODSCProperty: TOracleDataSet;
    ODSCPropertyID: TFloatField;
    ODSCPropertyFULLDESCRIPTION: TStringField;
    ODSCPropertyLOCATIONOBJ: TStringField;
    ODSCPropertyYEARSINBUSINESS: TStringField;
    ODSCPropertyBUILDINGUSAGE: TStringField;
    ODSCPropertyCONSTYEAR: TDateTimeField;
    ODSCPropertyFLOORSNUM: TIntegerField;
    ODSCPropertyWALLSM: TStringField;
    ODSCPropertyCEILINGSM: TStringField;
    ODSCPropertyROOFM: TStringField;
    ODSCPropertyAREA: TFloatField;
    ODSCPropertyAPPLICANTSPACE: TFloatField;
    ODSCPropertyEARTHQUAKEDETAILS: TStringField;
    ODSCPropertyFLAMABLE: TStringField;
    ODSCPropertySURROINDINGDETAILS: TStringField;
    ODSCPropertySITUETED: TStringField;
    ODSCPropertyGUARD: TStringField;
    ODSCPropertyALARM: TStringField;
    ODSCPropertyLOCKS: TStringField;
    ODSCPropertySECURITYLOCKS: TStringField;
    ODSCPropertyBARS: TStringField;
    ODSCPropertyOTHER: TStringField;
    ODSCPropertySETTINGS: TStringField;
    ODSCPropertyREPAIR: TStringField;
    ODSCPropertyHEATED: TStringField;
    ODSCPropertyRISKID: TFloatField;
    ODSCPropertyANNUAL: TFloatField;
    ODSCPropertyWAGES: TFloatField;
    ODSCPropertyRENT: TFloatField;
    ODSCPropertyEMPLOYES: TFloatField;
    ODSCPropertyEXPIRITY: TDateTimeField;
    ODSCPropertyLOSSHISTORY: TStringField;
    ODSCPropertyRENEWAL: TStringField;
    ODSCPropertyTHIRDPARTY: TStringField;
    ODSCPropertyOTHERINF: TStringField;
    ODSCPropertyINDEMINITY: TStringField;
    ODSCPropertyVALUETYPE: TStringField;
    ODSCPropertyBUILDINGS: TFloatField;
    ODSCPropertyCONTENT: TFloatField;
    ODSCPropertyEQUIPMENT: TFloatField;
    ODSCPropertyGLASS: TFloatField;
    ODSCPropertyCASH: TFloatField;
    ODSCPropertyWAREHOUSE: TFloatField;
    ODSCPropertySTOCK: TFloatField;
    ODSCPropertyPRODUCTS: TFloatField;
    ODSCPropertyWORKINPROGRESS: TFloatField;
    ODSCPropertyRAWMATERIALS: TFloatField;
    ODSCPropertyCLOSE_PREFIX: TIntegerField;
    ODSCPropertyTYPEID: TIntegerField;
    ODSCPropertyPROFITID: TFloatField;
    CPropertySource: TDataSource;
    ODSRisks: TOracleDataSet;
    RiskSource: TDataSource;
    ODSRisksID: TFloatField;
    ODSRisksNAME: TStringField;
    ODSCPropertyAGENTID: TFloatField;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsAGENT_ID: TFloatField;
    ODSContractsPNUM: TFloatField;
    ODSContractsBEN_ID: TFloatField;
    ODSContractsBENEFICIARY: TStringField;
    ODSReport: TOracleDataSet;
    ODSReportNAME: TStringField;
    ODSReportNAME2: TStringField;
    ODSReportADDRESS: TStringField;
    ODSReportINSSUMM: TFloatField;
    ODSReportBEGINDATE: TStringField;
    ODSReportBEGINDATE2: TStringField;
    ODSReportINSDATE: TStringField;
    ODSReportENDDATE: TStringField;
    ODSReportPOLICYNUM: TStringField;
    ODSReportBENEFICIARY: TStringField;
    ODSReportAMMOUNT: TFloatField;
    ODSReportVALUTE: TStringField;
    ODSReportAGENT: TStringField;
    ODSReportLOANACC_ID: TFloatField;
    ODSReportCURRACC_ID: TFloatField;
    ODSReportFRANSHIZ: TFloatField;
    ODSReportPHONE: TStringField;
    ODSReportLOCATIONOBJ: TStringField;
    ODSReportINSURED_OBJ: TStringField;
    ODSReportCOST: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PolicyDataModule: TPolicyDataModule;

implementation

uses UCPPolicyDataModule,sboapidatamoduleimpl;

{$R *.DFM}

end.

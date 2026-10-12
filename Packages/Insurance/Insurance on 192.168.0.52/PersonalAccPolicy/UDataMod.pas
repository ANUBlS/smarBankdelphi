unit UDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TPolicyDModule = class(TDataModule)
    OPCOMMON: TOraclePackage;
    ODSPAccident: TOracleDataSet;
    ODSPAccidentID: TFloatField;
    ODSPAccidentKLI_ID: TFloatField;
    ODSPAccidentCONTACT_PERSON: TStringField;
    ODSPAccidentBANKING_DETAILS: TStringField;
    ODSPAccidentTOTALEMP_NUMBER: TFloatField;
    ODSPAccidentAOG: TFloatField;
    ODSPAccidentAOP: TFloatField;
    ODSPAccidentSMG: TFloatField;
    ODSPAccidentSMP: TFloatField;
    ODSPAccidentBCG: TFloatField;
    ODSPAccidentBCP: TFloatField;
    ODSPAccidentDECIRED_AMOUNT: TFloatField;
    ODSPAccidentAD: TFloatField;
    ODSPAccidentPD: TFloatField;
    ODSPAccidentPLU: TFloatField;
    ODSPAccidentEME: TFloatField;
    ODSPAccidentHC: TFloatField;
    ODSPAccidentHS: TFloatField;
    ODSPAccidentBRB: TFloatField;
    ODSPAccidentBURN: TFloatField;
    ODSPAccidentTTD: TFloatField;
    ODSPAccidentNOT_COVEREDPERIOD: TStringField;
    ODSPAccidentNOT_COVEREPERIOD1: TStringField;
    ODSPAccidentOUTSIDEOFAZE: TStringField;
    ODSPAccidentRENEWAL: TStringField;
    ODSPAccidentTRAVELS: TStringField;
    ODSPAccidentTYPEID: TIntegerField;
    ODSPAccidentRISKID: TFloatField;
    ODSPAccidentMAXWEEKS: TIntegerField;
    ODSPAccidentPROFITID: TFloatField;
    ODSPAccidentAGENTID: TFloatField;
    ODSPAccidentSource: TDataSource;
    ODSCustomers: TOracleDataSet;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSCustomersADDRESS: TStringField;
    ODSCustomersMOBILEPHONE: TStringField;
    ODSCustomersFAX: TStringField;
    ODSCustomersSource: TDataSource;
    ODSPAccSuggest: TOracleDataSet;
    ODSPAccSuggestID: TFloatField;
    ODSPAccSuggestPAID: TFloatField;
    ODSPAccSuggestCNDT_ID: TFloatField;
    ODSPAccSuggestINSURANCESUM: TFloatField;
    ODSPAccSuggestINSURANCETIME: TDateTimeField;
    ODSPAccSuggestMEDICALCOST: TFloatField;
    ODSPAccSuggestALL_INSAMMOUNT: TFloatField;
    ODSPAccSuggestGEO: TStringField;
    PAccSugestSource: TDataSource;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
    ODSContractsBLANK_ID: TFloatField;
    ODSContractsSUGG_ID: TFloatField;
    ODSContractsPOLICY_ID: TFloatField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSContractsVALUTE_ID: TFloatField;
    ODSContractsAMMOUNT: TFloatField;
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSAgent: TOracleDataSet;
    ODSAgentID: TFloatField;
    ODSAgentNAME: TStringField;
    AgentSource: TDataSource;
    DSContracts: TDataSource;
    ODSContractsPOLICY_NUM: TStringField;
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
    ODSPAccSuggestFRZ_ID: TFloatField;
    Franshiz: TOracleDataSet;
    FranshizID: TFloatField;
    FranshizNAME: TStringField;
    FranshizData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PolicyDModule: TPolicyDModule;

implementation

   uses  sboapiDataModuleImpl;

{$R *.DFM}

end.

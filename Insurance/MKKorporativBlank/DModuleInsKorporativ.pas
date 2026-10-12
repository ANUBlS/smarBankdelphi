unit DModuleInsKorporativ;
              //ODSContracts
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

type
  TDModuleKorporativ = class(TDataModule)
    DSMarks: TDataSource;
    ODSMarks: TOracleDataSet;
    ODSMarksID: TFloatField;
    ODSMarksNAME: TWideStringField;
    ODSMarksSTATE_ID: TFloatField;
    ODSMarksCALCOPTIONS: TIntegerField;
    ODSAutoColors: TOracleDataSet;
    ODSBanks: TOracleDataSet;
    ODSBanksID: TFloatField;
    ODSBanksNAME: TWideStringField;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TWideStringField;
    ODSCustsADDRESS: TWideStringField;
    pkgMotorKasco: TOraclePackage;
    OPCOMMON: TOraclePackage;
    DSCusts: TDataSource;
    DSBanks: TDataSource;
    DSAutoColors: TDataSource;
    ODSModels: TOracleDataSet;
    ODSModelsID: TFloatField;
    ODSModelsNAME: TWideStringField;
    ODSModelsMARK_ID: TFloatField;
    ODSModelsCALCOPTIONS: TIntegerField;
    DSModels: TDataSource;
    ODSdrAccessPeople: TOracleDataSet;
    ODSdrAccessPeopleCID: TFloatField;
    ODSdrAccessPeopleNAME: TWideStringField;
    ODSdrAccessPeopleSURNAME: TWideStringField;
    ODSdrAccessPeopleFATHERNAME: TWideStringField;
    ODSdrAccessPeopleBIRTHDAY: TDateTimeField;
    ODSdrAccessPeopleDREXPERIENCE: TDateTimeField;
    ODSdrAccessPeopleSexList: TWideStringField;
    ODSFranshiz: TOracleDataSet;
    ODSFranshizFRANSHIZ: TFloatField;
    ODSFranshizTARIFF: TFloatField;
    DSFranshiz: TDataSource;
    ODSReliaseDates: TOracleDataSet;
    ODSReliaseDatesID: TFloatField;
    ODSReliaseDatesBEGINDATE: TDateTimeField;
    ODSReliaseDatesENDDATE: TDateTimeField;
    ODSReliaseDatesSTATE_ID: TFloatField;
    DSMonths: TDataSource;
    ODSMonths: TOracleDataSet;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    DSDrAccessPeople: TDataSource;
    DSAutoTypes: TDataSource;
    ODSAutoTypes: TOracleDataSet;
    ODSAutoTypesID: TFloatField;
    ODSAutoTypesNAME: TWideStringField;
    ODSSex: TOracleDataSet;
    ODSSexID: TFloatField;
    ODSSexNAME: TWideStringField;
    DSSex: TDataSource;
    DSClaims: TDataSource;
    DSClaimSal: TDataSource;
    ODSClaimSal: TOracleDataSet;
    ODSClaimSalID: TFloatField;
    ODSClaimSalEID: TFloatField;
    ODSClaimSalNAME: TWideStringField;
    ODSClaimSalCOST: TFloatField;
    ODSClaims: TOracleDataSet;
    ODSClaimsID: TFloatField;
    ODSClaimsMK_ID: TFloatField;
    ODSClaimsENAME: TWideStringField;
    ODSClaimsCOUNT: TFloatField;
    ODSClaimsCOST: TFloatField;
    ODSClaimsSTATE: TWideStringField;
    ODSClaimReport: TOracleDataSet;
    ODSClaimReportID: TFloatField;
    ODSClaimReportMK_ID: TFloatField;
    ODSClaimReportENAME: TWideStringField;
    ODSClaimReportCOUNT: TFloatField;
    ODSClaimReportCOST: TFloatField;
    ODSClaimReportSTATE: TWideStringField;
    DSAgent: TDataSource;
    ODSAgent: TOracleDataSet;
    ODSAgentSURNAME: TWideStringField;
    ODSAgentFNAME: TWideStringField;
    ODSAgentFATHERNAME: TWideStringField;
    ODSAgentName: TWideStringField;
    ODSAgentID: TFloatField;
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TWideStringField;
    ODSAvaluteVALU_NAME: TWideStringField;
    ODSAvaluteVALU_SHORT: TWideStringField;
    DSAvalute: TDataSource;
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
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsAGENT_ID: TFloatField;
    DSContracts: TDataSource;
    DSAccessories: TDataSource;
    ODSAccessories: TOracleDataSet;
    ODSAccessoriesID: TFloatField;
    ODSAccessoriesNAME: TWideStringField;
    ODSAccessoriesAMMOUNT: TFloatField;
    ODSAccessoriesCID: TFloatField;
    DSMotorkasco: TDataSource;
    ODSMotorkasko: TOracleDataSet;
    ODSMotorkaskoID: TFloatField;
    ODSMotorkaskoCID: TFloatField;
    ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField;
    ODSMotorkaskoINSUREDSTATENUM: TWideStringField;
    ODSMotorkaskoUNDERFRAMENUM: TWideStringField;
    ODSMotorkaskoINSUREDBANNUM: TWideStringField;
    ODSMotorkaskoINSUREDENGINENUM: TWideStringField;
    ODSMotorkaskoDRIVECOST: TFloatField;
    ODSMotorkaskoBEGINDATE: TDateTimeField;
    ODSMotorkaskoENDDATE: TDateTimeField;
    ODSMotorkaskoTYPEID: TIntegerField;
    ODSMotorkaskoCLOSE_PREFIX: TIntegerField;
    ODSMotorkaskoBANK_ID: TFloatField;
    ODSMotorkaskoMONTH_ID: TFloatField;
    ODSMotorkaskoINSUREDMARK: TWideStringField;
    ODSMotorkaskoCLAIM_DATE: TDateTimeField;
    ODSMotorkaskoCLAIM_NUM: TWideStringField;
    ODSMotorkaskoINSUREDTYPE: TWideStringField;
    ODSMotorkaskoavtotype: TWideStringField;
    ODSMotorkaskoAvtoMarks: TWideStringField;
    ODSMotorkaskoAvtoModels: TWideStringField;
    ODSMotorkaskoINSUREDMODEL: TWideStringField;
    ODSMotorkaskoAvtoColors: TWideStringField;
    ODSMotorkaskoINSUREDCOLOR: TWideStringField;
    ODSdrAccessPeopleSEX: TWideStringField;
    ODSMotorkaskoAREA: TWideStringField;
    ODSMotorkaskoACT_NUM: TWideStringField;
    ODSMotorkaskoFRANSHIZ: TFloatField;
    ODSMotorkaskoTARIFF: TFloatField;
    ODSMotorkaskoINSSUMM: TFloatField;
    ODSMotorkaskoAMMOUNT: TFloatField;
    ODSMotorkaskoNUMSEATS: TWideStringField;
    ODSMotorkaskoNOTES: TWideStringField;
    ODSMotorkaskoEXTRAFRANSHIZ: TWideStringField;
    DsSysdat: TOracleDataSet;
    DsSysdatTEK_DAT: TDateTimeField;
    DsSysdatPRED_DAT: TDateTimeField;
    DsSysdatARC_DAY: TDateTimeField;
    DsSysdatCLOSE: TIntegerField;
    procedure ODSContractsAfterInsert(DataSet: TDataSet);
    procedure ODSAccessoriesAfterPost(DataSet: TDataSet);
    procedure ODSMotorkaskoAfterPost(DataSet: TDataSet);
    procedure ODSMotorkaskoAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModuleKorporativ: TDModuleKorporativ;

implementation

  uses  sboapiDataModuleImpl, UInsKorporativKasco;

{$R *.DFM}

procedure TDModuleKorporativ.ODSContractsAfterInsert(DataSet: TDataSet);
begin
       DataSet.FieldByName('TYPE_ID').asInteger := 25;
end;

procedure TDModuleKorporativ.DataModuleCreate(Sender: TObject);
begin
ODSAgent.Open;
end;

procedure TDModuleKorporativ.ODSAccessoriesAfterPost(DataSet: TDataSet);
begin
      (DataSet as TOracleDataSet).RefreshRecord;
end;

procedure TDModuleKorporativ.ODSMotorkaskoAfterPost(DataSet: TDataSet);
begin
     (DataSet as TOracleDataSet).RefreshRecord;
end;

procedure TDModuleKorporativ.ODSMotorkaskoAfterInsert(DataSet: TDataSet);
begin
     DataSet.FieldByName('TYPEID').asInteger := 25;
     DataSet.FieldByName('CID').asInteger := frmInsKorporativKasco.CID;
end;

end.

unit UMKDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

type
  TInsMKDataMod = class(TDataModule)
    DSMarks: TDataSource;
    ODSMarks: TOracleDataSet;
    ODSMarksID: TFloatField;
    ODSMarksNAME: TStringField;
    ODSMarksSTATE_ID: TFloatField;
    ODSMarksCALCOPTIONS: TIntegerField;
    ODSModels: TOracleDataSet;
    ODSModelsID: TFloatField;
    ODSModelsNAME: TStringField;
    ODSModelsMARK_ID: TFloatField;
    ODSModelsCALCOPTIONS: TIntegerField;
    DSModels: TDataSource;
    ODSBanks: TOracleDataSet;
    ODSBanksID: TFloatField;
    ODSBanksNAME: TStringField;
    DSBanks: TDataSource;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TStringField;
    ODSCustsADDRESS: TStringField;
    DSCusts: TDataSource;
    pkgMotorKasco: TOraclePackage;
    OPCOMMON: TOraclePackage;
    ODSMotorkasko: TOracleDataSet;
    DSMotorkasco: TDataSource;
    DSContracts: TDataSource;
    ODSContracts: TOracleDataSet;
    DSSex: TDataSource;
    DSDrAccessPeople: TDataSource;
    ODSdrAccessPeople: TOracleDataSet;
    ODSdrAccessPeopleCID: TFloatField;
    ODSdrAccessPeopleNAME: TStringField;
    ODSdrAccessPeopleSURNAME: TStringField;
    ODSdrAccessPeopleFATHERNAME: TStringField;
    ODSdrAccessPeopleBIRTHDAY: TDateTimeField;
    ODSdrAccessPeopleDREXPERIENCE: TDateTimeField;
    ODSSex: TOracleDataSet;
    ODSSexID: TFloatField;
    ODSSexNAME: TStringField;
    ODSMonths: TOracleDataSet;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    DSMonths: TDataSource;
    ODSReliaseDates: TOracleDataSet;
    ODSReliaseDatesID: TFloatField;
    ODSReliaseDatesBEGINDATE: TDateTimeField;
    ODSReliaseDatesENDDATE: TDateTimeField;
    ODSReliaseDatesSTATE_ID: TFloatField;
    DSFranshiz: TDataSource;
    ODSFranshiz: TOracleDataSet;
    ODSFranshizFRANSHIZ: TFloatField;
    ODSFranshizTARIFF: TFloatField;
    ODSMotorkaskoID: TFloatField;
    ODSMotorkaskoINSUREDTYPE: TStringField;
    ODSMotorkaskoINSUREDCOLOR: TStringField;
    ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField;
    ODSMotorkaskoINSUREDSTATENUM: TStringField;
    ODSMotorkaskoUNDERFRAMENUM: TStringField;
    ODSMotorkaskoINSUREDBANNUM: TStringField;
    ODSMotorkaskoINSUREDENGINENUM: TStringField;
    ODSMotorkaskoDRIVEINTENDED: TStringField;
    ODSMotorkaskoDRIVECOST: TFloatField;
    ODSMotorkaskoBEGINDATE: TDateTimeField;
    ODSMotorkaskoENDDATE: TDateTimeField;
    ODSMotorkaskoTYPEID: TIntegerField;
    ODSMotorkaskoCLOSE_PREFIX: TIntegerField;
    ODSMotorkaskoBANK_ID: TFloatField;
    ODSMotorkaskoMONTH_ID: TFloatField;
    ODSMotorkaskoINSUREDMARK: TStringField;
    ODSMotorkaskoINSUREDMODEL: TStringField;
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
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TStringField;
    ODSAvaluteVALU_NAME: TStringField;
    ODSAvaluteVALU_SHORT: TStringField;
    DSAvalute: TDataSource;
    ODSAgent: TOracleDataSet;
    DSAgent: TDataSource;
    ODSContractsAGENT_ID: TFloatField;
    DSAccessories: TDataSource;
    ODSAccessories: TOracleDataSet;
    ODSAccessoriesID: TFloatField;
    ODSAccessoriesNAME: TStringField;
    ODSAccessoriesAMMOUNT: TFloatField;
    ODSAccessoriesCID: TFloatField;
    ODSAutoTypes: TOracleDataSet;
    DSAutoTypes: TDataSource;
    ODSAutoTypesID: TFloatField;
    ODSAutoTypesNAME: TStringField;
    ODSAgentSURNAME: TStringField;
    ODSAgentFNAME: TStringField;
    ODSAgentFATHERNAME: TStringField;
    ODSAgentName: TStringField;
    ODSAgentID: TFloatField;
    ODSMotorkaskoCID: TFloatField;
    ODSAutoColors: TOracleDataSet;
    DSAutoColors: TDataSource;
    DSClaimSal: TDataSource;
    ODSClaimSal: TOracleDataSet;
    ODSClaimSalID: TFloatField;
    ODSClaimSalEID: TFloatField;
    ODSClaimSalNAME: TStringField;
    ODSClaimSalCOST: TFloatField;
    DSClaims: TDataSource;
    ODSClaims: TOracleDataSet;
    ODSClaimsID: TFloatField;
    ODSClaimsMK_ID: TFloatField;
    ODSClaimsENAME: TStringField;
    ODSClaimsCOUNT: TFloatField;
    ODSClaimsCOST: TFloatField;
    ODSClaimsSTATE: TStringField;
    ODSMotorkaskoCLAIM_DATE: TDateTimeField;
    ODSMotorkaskoCLAIM_NUM: TStringField;
    ODSClaimReport: TOracleDataSet;
    ODSClaimReportID: TFloatField;
    ODSClaimReportMK_ID: TFloatField;
    ODSClaimReportENAME: TStringField;
    ODSClaimReportCOUNT: TFloatField;
    ODSClaimReportCOST: TFloatField;
    ODSClaimReportSTATE: TStringField;
    ODSMotorkaskoavtotypes: TStringField;
    ODSMotorkaskoavtomarks: TStringField;
    ODSMotorkaskoavtomodels: TStringField;
    ODSMotorkaskoavtocolor: TStringField;
    ODSContractsBEN_ID: TFloatField;
    ODSContractsBENEFICIARY: TStringField;
    DSClaimDescription: TDataSource;
    ODSClaimDescription: TOracleDataSet;
    ODSClaimDescriptionID: TFloatField;
    ODSClaimDescriptionREGION: TStringField;
    ODSClaimDescriptionSTREET: TStringField;
    ODSClaimDescriptionDETAIL: TStringField;
    ODSClaimDescriptionPERSON: TStringField;
    ODSClaimDescriptionMARK: TStringField;
    ODSClaimDescriptionSTATENUM: TStringField;
    ODSClaimDescriptionAVTOSERVIS: TStringField;
    ODSdrAccessPeopleID: TFloatField;
    ODSMotorkaskoAREA: TStringField;
    ODSMotorkaskoACT_NUM: TStringField;
    ODSCustsINSURED_TYPEID: TIntegerField;
    ODSMotorkaskoFRANSHIZ: TFloatField;
    ODSMotorkaskoTARIFF: TFloatField;
    ODSMotorkaskoINSSUMM: TFloatField;
    ODSMotorkaskoAMMOUNT: TFloatField;
    ODSClaimDescriptionMODEL: TStringField;
    ODSMotorkaskoNUMSEATS: TFloatField;
    ODSClaimDescriptionAPPDATE: TDateTimeField;
    ODSClaimDescriptionLETTERDATE: TDateTimeField;
    ODSClaimDescriptionLETTERNUM: TStringField;
    ODSClaimDescriptionSPRNUM: TStringField;
    ODSClaimDescriptionPRTNUM: TStringField;
    ODSdrAccessPeopleSEX: TStringField;
    ODSClaimDescriptionACTDATE: TDateTimeField;
    ODSReport: TOracleDataSet;
    ODSReportNAME: TStringField;
    ODSReportNAME2: TStringField;
    ODSReportADDRESS: TStringField;
    ODSReportINSUREDTYPE: TStringField;
    ODSReportINSUREDCOLOR: TStringField;
    ODSReportINSUREDOUTPUTYEAR: TIntegerField;
    ODSReportINSUREDMODEL: TStringField;
    ODSReportINSUREDSTATENUM: TStringField;
    ODSReportUNDERFRAMENUM: TStringField;
    ODSReportINSUREDBANNUM: TStringField;
    ODSReportINSUREDENGINENUM: TStringField;
    ODSReportDRIVEACCESSPIOPLE: TStringField;
    ODSReportACCESSORIESNAME: TStringField;
    ODSReportDRIVECOST: TFloatField;
    ODSReportINSURANCESUM: TFloatField;
    ODSReportBEGINDATE: TStringField;
    ODSReportINSDATE: TStringField;
    ODSReportENDDATE: TStringField;
    ODSReportPOLICYNUM: TStringField;
    ODSReportAGENT: TStringField;
    ODSReportVALUTE: TStringField;
    ODSReportLOANACC_ID: TFloatField;
    ODSReportCURRACC_ID: TFloatField;
    ODSReportBENEFICIARY: TStringField;
    ODSReportTHEFT: TFloatField;
    ODSReportFIRE: TFloatField;
    ODSReportEXPLOSION: TFloatField;
    ODSReportTRAFFICACCIDENT: TFloatField;
    ODSReportIMPACTANYOBJECT: TFloatField;
    ODSReportINSURANCEAMMOUNT: TFloatField;
    ODSReportHOMEPHONE: TStringField;
    ODSReportMOBILEPHONE: TStringField;
    ODSReportDRIVEINTENDED: TStringField;
    ODSReportFRANSHIZ: TFloatField;
    procedure ODSdrAccessPeopleAfterInsert(DataSet: TDataSet);
    procedure ODSContractsAfterInsert(DataSet: TDataSet);
    procedure ODSAccessoriesAfterInsert(DataSet: TDataSet);
    procedure ODSdrAccessPeopleAfterPost(DataSet: TDataSet);
    procedure ODSAgentCalcFields(DataSet: TDataSet);
    procedure ODSAgentAfterScroll(DataSet: TDataSet);
    procedure ODSClaimsAfterInsert(DataSet: TDataSet);
    procedure ODSClaimSalAfterInsert(DataSet: TDataSet);
    procedure ODSMotorkaskoAfterInsert(DataSet: TDataSet);
    procedure ODSMotorkaskoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsMKDataMod: TInsMKDataMod;

implementation

uses  sboapiDataModuleImpl, UMKBlank;

{$R *.DFM}

procedure TInsMKDataMod.ODSdrAccessPeopleAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CID').asInteger := fmMKBlank.CID;
 // DataSet.FieldByName('ID').asInteger := ODSMotorKaskoId.AsInteger;
end;

procedure TInsMKDataMod.ODSContractsAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('TYPE_ID').asInteger := 1;
end;

procedure TInsMKDataMod.ODSAccessoriesAfterInsert(DataSet: TDataSet);
begin
//  DataSet.FieldByName('CID').AsInteger:=fmMKBlank.CID;
end;

procedure TInsMKDataMod.ODSdrAccessPeopleAfterPost(DataSet: TDataSet);
begin
  (DataSet as TOracleDataSet).RefreshRecord;
end;

procedure TInsMKDataMod.ODSAgentCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('name').asString := FieldByName('Surname').asString + ' '+
                                    FieldByName('FName').asString + ' '+
                                    FieldByName('Fathername').asString;
end;

procedure TInsMKDataMod.ODSAgentAfterScroll(DataSet: TDataSet);
begin
  with fmMKBlank,  DataSet do
   edAgents.Text := FieldByName('name').asString;

end;

procedure TInsMKDataMod.ODSClaimsAfterInsert(DataSet: TDataSet);
begin
      ODSClaimsMk_ID.Value:=ODSMotorkaskoId.Value;
end;

procedure TInsMKDataMod.ODSClaimSalAfterInsert(DataSet: TDataSet);
begin
ODSClaimSalEID.Value:=ODSMotorkaskoId.Value;
end;

procedure TInsMKDataMod.ODSMotorkaskoAfterInsert(DataSet: TDataSet);
begin
      DataSet.FieldByName('CID').asInteger := fmMKBlank.CID;
end;

procedure TInsMKDataMod.ODSMotorkaskoAfterPost(DataSet: TDataSet);
begin
     //(DataSet as TOracleDataSet).RefreshRecord;
end;

end.

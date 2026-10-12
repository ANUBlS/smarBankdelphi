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
    ODSdrAccessPeopleSEX: TIntegerField;
    ODSdrAccessPeopleSexList: TStringField;
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
    ODSMotorkaskoBEN_ID: TFloatField;
    ODSMotorkaskoCLOSE_PREFIX: TIntegerField;
    ODSMotorkaskoBANK_ID: TFloatField;
    ODSMotorkaskoMONTH_ID: TFloatField;
    ODSMotorkaskoINSUREDMARK: TStringField;
    ODSMotorkaskoINSUREDMODEL: TStringField;
    ODSMotorkaskoBENEFICIARY: TStringField;
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
    ODSContractsPOLICY_NUM: TStringField;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSBenType: TOracleDataSet;
    DSBenType: TDataSource;
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TStringField;
    ODSAvaluteVALU_NAME: TStringField;
    ODSAvaluteVALU_SHORT: TStringField;
    DSAvalute: TDataSource;
    ODSAgent: TOracleDataSet;
    DSAgent: TDataSource;
    ODSAgentID: TFloatField;
    ODSAgentNAME: TStringField;
    ODSContractsAGENT_ID: TFloatField;
    procedure ODSdrAccessPeopleAfterInsert(DataSet: TDataSet);
    procedure ODSContractsAfterInsert(DataSet: TDataSet);
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
end;

procedure TInsMKDataMod.ODSContractsAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('TYPE_ID').asInteger := 1;
end;

end.

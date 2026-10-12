unit DMPaymentLossImpl;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle;

type
  TDMPaymentLoss = class(TDataModule)
    DSRPaymentLoss: TDataSource;
    DSPaymentLoss: TOracleDataSet;
    DSPaymentLossReal: TOracleDataSet;
    DSSysdat: TOracleDataSet;
    DSRPaymentLossReal: TDataSource;
    DSRSysdat: TDataSource;
    DSSysdatTEK_DAT: TDateTimeField;
    DSSysdatPRED_DAT: TDateTimeField;
    DSSysdatARC_DAY: TDateTimeField;
    DSSysdatCLOSE: TIntegerField;
    DSPaymentLossID: TFloatField;
    DSPaymentLossCID: TFloatField;
    DSPaymentLossTRID: TFloatField;
    DSPaymentLossSTAGE_TESDIQ_DAT: TDateTimeField;
    DSPaymentLossNAME: TWideStringField;
    DSPaymentLossMEBLEG: TFloatField;
    DSpaymentAcc: TOracleDataSet;
    DSpaymentAccID: TFloatField;
    DSpaymentAccACC_NO: TWideStringField;
    DSRpaymentAcc: TDataSource;
    Pins_common: TOraclePackage;
    DSPaymentLossRealID: TFloatField;
    DSPaymentLossRealCID: TFloatField;
    DSPaymentLossRealTRAID: TFloatField;
    DSPaymentLossRealPAYDATE: TDateTimeField;
    DSPaymentLossRealMEBLEG: TFloatField;
    DSPaymentLossRealNAME: TWideStringField;
    sb_aca: TOraclePackage;
    DSLossBarderoSay: TOracleDataSet;
    DSLossBarderoSaySAY: TFloatField;
    DSPaymentLossRealPID: TFloatField;
    ODSClaimDescription: TOracleDataSet;
    ODSClaimDescriptionID: TFloatField;
    ODSClaimDescriptionREGION: TWideStringField;
    ODSClaimDescriptionSTREET: TWideStringField;
    ODSClaimDescriptionDETAIL: TWideStringField;
    ODSClaimDescriptionPERSON: TWideStringField;
    ODSClaimDescriptionSTATENUM: TWideStringField;
    ODSClaimDescriptionAVTOSERVIS: TWideStringField;
    ODSClaimDescriptionAPPDATE: TDateTimeField;
    ODSClaimDescriptionLETTERDATE: TDateTimeField;
    ODSClaimDescriptionLETTERNUM: TWideStringField;
    ODSClaimDescriptionSPRNUM: TWideStringField;
    ODSClaimDescriptionPRTNUM: TWideStringField;
    ODSClaimDescriptionACTDATE: TDateTimeField;
    ODSClaimDescriptionMK_ID: TFloatField;
    ODSClaimDescriptionCID: TFloatField;
    ODSClaimDescriptionMARK: TWideStringField;
    ODSClaimDescriptionMODEL: TWideStringField;
    ODSClaimDescriptionMODELID: TFloatField;
    ODSClaimDescriptionMARKAID: TFloatField;
    ODSClaimDescriptionCLAIM_NUM: TWideStringField;
    ODSClaimDescriptionCLAIM_DATE: TDateTimeField;
    ODSClaimDescriptionSUBRAQASIYA: TFloatField;
    ODSClaimDescriptionEMPL_ACC: TFloatField;
    ODSClaimDescriptionPROBEG: TFloatField;
    ODSClaimDescriptionUTO_TRANSPORTATION_COSTS: TFloatField;
    ODSClaimDescriptionFINAL_AMOUNT_LOSS: TFloatField;
    ODSClaimDescriptionAUTO_ASSESS_COSTS: TFloatField;
    ODSClaimDescriptionVALUE_NEW_SPARE_PARTS: TFloatField;
    ODSClaimDescriptionOTHER_COSTS: TFloatField;
    ODSClaimDescriptionMANAGEMENT_RIGHTS: TWideStringField;
    ODSClaimDescriptionINS_AGAINST_ORGANIZATION: TFloatField;
    ODSClaimDescriptionINS_AGAINST_POLISN_DAT: TWideStringField;
    ODSClaimDescriptionEVENT_PUB_AUTHORITY_REG: TWideStringField;
    ODSClaimDescriptionAUTO_REAL_MARKET_VALUE: TFloatField;
    ODSClaimDescriptionREMAINS_VALUE: TFloatField;
    ODSClaimDescriptionBANK_ACCNO: TWideStringField;
    ODSClaimDescriptionTYPE: TFloatField;
    ODSClaimDescriptionC_TYPE: TFloatField;
    ODSClaimDescriptionCLAIM_STATUS: TFloatField;
    ODSClaimDescriptionDRIVER: TWideStringField;
    ODSClaimDescriptionFINAL_PAYMENT_AMOUNT_LOSS: TFloatField;
    ODSClaimDescriptionAMORTIZASIYA_AMMOUNT: TFloatField;
    ODSClaimDescriptionEKSPERTIZA_AMOUNT: TFloatField;
    ODSClaimDescriptionAPPROXIMATE_AMMOUNT: TFloatField;
    ODSClaimDescriptionOTHER_DRIVER: TFloatField;
    ODSClaimDescriptionREFUSAL_AMMOUNT: TFloatField;
    ODSClaimDescriptionREFUSAL_DATE: TDateTimeField;
    ODSClaimDescriptionREFUSAL_DESCRIPTION: TWideStringField;
    ODSClaimDescriptionINS_AGAINST_OWNER: TWideStringField;
    DSClaimDescription: TDataSource;
    dsqaliq: TOracleDataSet;
    dsqaliqQALIQ: TFloatField;
    Ds_contracts: TOracleDataSet;
    Ds_contractsID: TFloatField;
    Ds_contractsTYPE_ID: TFloatField;
    Ds_contractsINS_DATE: TDateTimeField;
    Ds_contractsBEGIN_DATE: TDateTimeField;
    Ds_contractsEND_DATE: TDateTimeField;
    Ds_contractsVALUTE_ID: TFloatField;
    Ds_contractsAMMOUNT: TFloatField;
    Ds_contractsCLOSE_PREFIX: TIntegerField;
    Ds_contractsKLI_ID: TFloatField;
    Ds_contractsLOANACC_ID: TFloatField;
    Ds_contractsCURRACC_ID: TFloatField;
    Ds_contractsPOLICY_NUM: TWideStringField;
    Ds_contractsINSSUMM: TFloatField;
    Ds_contractsFRANSHIZ: TFloatField;
    Ds_contractsTARIFF: TFloatField;
    Ds_contractsSTATE: TIntegerField;
    Ds_contractsAGENT_ID: TFloatField;
    Ds_contractsPNUM: TFloatField;
    Ds_contractsBEN_ID: TFloatField;
    Ds_contractsBENEFICIARY: TWideStringField;
    Ds_contractsCONDITIONS: TWideStringField;
    Ds_contractsSUGNUM: TWideStringField;
    Ds_contractsBLANK_ID: TFloatField;
    Ds_contractsOP_ID: TFloatField;
    Ds_contractsREINS: TFloatField;
    Ds_contractsCHKASKO: TFloatField;
    Ds_contractsCHM: TFloatField;
    Ds_contractsCHFQ: TFloatField;
    Ds_contractsCOMMITOP_ID: TFloatField;
    Ds_contractsCOMMIT_DATE: TDateTimeField;
    Ds_contractsCANCELOPID: TFloatField;
    Ds_contractsCANCELDATE: TDateTimeField;
    Ds_contractsFILIAL: TFloatField;
    Ds_contractsBNF_TYPE: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPaymentLoss: TDMPaymentLoss;

implementation

{$R *.dfm}
 uses sboapiDataModuleimpl,SBTranslateProc,CommanParametrs;
procedure TDMPaymentLoss.DataModuleCreate(Sender: TObject);
begin
DSSysdat.Open;
end;

procedure TDMPaymentLoss.DataModuleDestroy(Sender: TObject);
begin
DSSysdat.Close;
end;

end.

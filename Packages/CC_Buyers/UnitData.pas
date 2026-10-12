unit UnitData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataMod_Buyers = class(TDataModule)
    DSBuyers: TDataSource;
    ODSBuyers: TOracleDataSet;
    CC_GENERAL: TOraclePackage;
    BalAcc: TOracleDataSet;
    BalAccBAL_CN: TStringField;
    BalAccData: TDataSource;
    Currency: TOracleDataSet;
    CurrencyVALUTE: TFloatField;
    CurrencyData: TDataSource;
    Account: TOracleDataSet;
    AccountData: TDataSource;
    Avalute: TOracleDataSet;
    Avalutedata: TDataSource;
    Customers: TOracleDataSet;
    CustomersData: TDataSource;
    Bal_Spr1: TOracleDataSet;
    Bal_Spr1Data: TDataSource;
    Cust: TOracleDataSet;
    Custdata: TDataSource;
    Branches: TOracleDataSet;
    BranchesID: TFloatField;
    BranchesData: TDataSource;
    Branch: TOracleDataSet;
    Branchdata: TDataSource;
    CC_Settingsdata: TDataSource;
    AccNO: TOracleDataSet;
    Accnodata: TDataSource;
    Sysdat: TOracleDataSet;
    Archost: TOracleDataSet;
    Trdestination: TOracleDataSet;
    Trdestinationdata: TDataSource;
    Country: TOracleDataSet;
    OPackage: TOraclePackage;
    OSCT: TOraclePackage;
    countrydata: TDataSource;
    CC_Flat: TOracleDataSet;
    CC_Flatdata: TDataSource;
    CC_Buyer_Flat: TOracleDataSet;
    CC_Buyer_FlatData: TDataSource;
    cities: TOracleDataSet;
    ctiesdata: TDataSource;
    ad_country: TOracleDataSet;
    ad_countrydata: TDataSource;
    ad_cities: TOracleDataSet;
    ad_citites: TDataSource;
    countries: TOracleDataSet;
    countriesdata: TDataSource;
    cc_countries: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    paspdept: TOracleDataSet;
    PaspdeptData: TDataSource;
    SBOP: TOraclePackage;
    OracleDataSet2: TOracleDataSet;
    cc_settings: TOracleDataSet;
    AccountID: TFloatField;
    AccountKLI_ID: TFloatField;
    AccountOP_ID: TFloatField;
    AccountACC_NO: TWideStringField;
    AccountVAL_ACC: TIntegerField;
    AccountNAME: TWideStringField;
    AccountOPEN_DAT: TDateTimeField;
    AccountCLOSE_DAT: TDateTimeField;
    AccountSTATUS: TFloatField;
    AccountBAL_CN1: TFloatField;
    AccountBAL_CN2: TFloatField;
    AccountBAL_CN3: TFloatField;
    AccountBAL_CN4: TFloatField;
    AccountFILIAL: TIntegerField;
    AccountSIM_OTCET: TFloatField;
    AccountTIPACC: TWideStringField;
    AccountLIMIT: TFloatField;
    AccountOLD_ACC_NO: TWideStringField;
    AccountPAIR_ACC: TFloatField;
    AccountINSIDER: TWideStringField;
    ODSBuyersID: TFloatField;
    ODSBuyersFIRSTNAME: TWideStringField;
    ODSBuyersLASTNAME: TWideStringField;
    ODSBuyersMIDDLENAME: TWideStringField;
    ODSBuyersPASSPSER: TWideStringField;
    ODSBuyersPASSPNUM: TWideStringField;
    ODSBuyersPASSPPIN: TWideStringField;
    ODSBuyersPASSPDATE: TDateTimeField;
    ODSBuyersPASSPDEPT: TWideStringField;
    ODSBuyersGENDER: TIntegerField;
    ODSBuyersBIRTHDATE: TDateTimeField;
    ODSBuyersBIRTHSTATE: TIntegerField;
    ODSBuyersBIRTHCITY: TIntegerField;
    ODSBuyersFAMSTATUS: TIntegerField;
    ODSBuyersSTATE: TIntegerField;
    ODSBuyersCITY: TIntegerField;
    ODSBuyersADDRESS: TWideStringField;
    ODSBuyersWORKPLACE: TWideStringField;
    ODSBuyersWAGE: TFloatField;
    ODSBuyersPHONE: TWideStringField;
    ODSBuyersPHONEMOB: TWideStringField;
    ODSBuyersEMAIL: TWideStringField;
    ODSBuyersREGDATE: TDateTimeField;
    ODSBuyersUSERID: TFloatField;
    ODSBuyersADD_INFO: TWideStringField;
    ODSBuyersCINSI: TWideStringField;
    ODSBuyersCNTR_NAME: TWideStringField;
    ODSBuyersCITY_NAME: TWideStringField;
    CurrencyVALU_NAME: TWideStringField;
    BranchesNAME: TWideStringField;
    AvaluteVALUTE: TIntegerField;
    AvaluteVAL_NAME: TWideStringField;
    AvaluteVALU_NAME: TWideStringField;
    AvaluteVALU_SHORT: TWideStringField;
    AvaluteUSTORG: TFloatField;
    AvaluteUSTPOK: TFloatField;
    AvaluteVALU_GEN: TWideStringField;
    AvaluteVALU_AZ: TWideStringField;
    AvaluteUSING: TIntegerField;
    AvaluteVALU_OTHER: TWideStringField;
    AvaluteVALU_INTER: TWideStringField;
    AvaluteVALU_BALA: TWideStringField;
    AvalutePRISTAVKA: TFloatField;
    AvaluteCOUNTRY: TWideStringField;
    AvaluteUST_POK1: TFloatField;
    AvaluteOFFICAL: TWideStringField;
    AvaluteLIMIT: TFloatField;
    AvaluteDEBET: TFloatField;
    AvaluteKREDIT: TFloatField;
    AvaluteF5501P: TFloatField;
    AvaluteF5501V: TFloatField;
    AvaluteSDEBET: TFloatField;
    AvaluteSCREDIT: TFloatField;
    BalAccBALNAME: TWideStringField;
    ODSBuyersBYR_NAME: TWideStringField;
    maxid: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod_Buyers: TDataMod_Buyers;

implementation

uses sboapiDataModuleImpl, cc_BuyersImpl;
{$R *.DFM}



end.

unit UntConclusionDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModContract = class(TDataModule)
    DataSrcCurrency: TDataSource;
    CurrencyDataSet: TOracleDataSet;
    GrandAcc: TOracleDataSet;
    DataSrcGrant: TDataSource;
    DataSrcClientAcc: TDataSource;
    ClientAcc: TOracleDataSet;
    ReserveAcc: TOracleDataSet;
    DataSrcReserveAcc: TDataSource;
    DataSrcInterestAcc: TDataSource;
    InterestAcc: TOracleDataSet;
    OverdueAcc: TOracleDataSet;
    DataSrcOverdueAcc: TDataSource;
    DataSrcOverdueInterestAcc: TDataSource;
    OverdueInterestAcc: TOracleDataSet;
    GrandAccID: TFloatField;
    GrandAccACCNO: TStringField;
    GrandAccCLIENTNAME: TStringField;
    GrandAccVAL_ACC: TIntegerField;
    DataSrcReliability: TDataSource;
    ReliabilityDataSet: TOracleDataSet;
    ClientCategoriesDataSet: TOracleDataSet;
    DataSrcClientCategories: TDataSource;
    DataSrcPledgeTypes: TDataSource;
    PledgeTypesDataSet: TOracleDataSet;
    DataSrcCreditType: TDataSource;
    CreditTypeDataSet: TOracleDataSet;
    ContractPack: TOraclePackage;
    GrandAccCUSTID: TFloatField;
    ClientAccID: TFloatField;
    ClientAccCUSTID: TFloatField;
    ClientAccACCNO: TStringField;
    ClientAccCLIENTNAME: TStringField;
    ClientAccVAL_ACC: TIntegerField;
    ReserveAccID: TFloatField;
    ReserveAccCUSTID: TFloatField;
    ReserveAccACCNO: TStringField;
    ReserveAccCLIENTNAME: TStringField;
    ReserveAccVAL_ACC: TIntegerField;
    InterestAccID: TFloatField;
    InterestAccCUSTID: TFloatField;
    InterestAccACCNO: TStringField;
    InterestAccCLIENTNAME: TStringField;
    InterestAccVAL_ACC: TIntegerField;
    OverdueAccID: TFloatField;
    OverdueAccCUSTID: TFloatField;
    OverdueAccACCNO: TStringField;
    OverdueAccCLIENTNAME: TStringField;
    OverdueAccVAL_ACC: TIntegerField;
    OverdueInterestAccID: TFloatField;
    OverdueInterestAccCUSTID: TFloatField;
    OverdueInterestAccACCNO: TStringField;
    OverdueInterestAccCLIENTNAME: TStringField;
    OverdueInterestAccVAL_ACC: TIntegerField;
    OverdueReserveAcc: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    DataSrcOverdueReserve: TDataSource;
    DataSrcOverdueReliability: TDataSource;
    OverdueReliabilityData: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModContract: TDataModContract;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl,StoredProgramsUnit;

end.

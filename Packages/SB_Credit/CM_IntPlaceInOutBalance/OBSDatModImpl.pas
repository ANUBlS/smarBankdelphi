unit OBSDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TOBSDatMod = class(TDataModule)
    OutInterestsAccounts: TOracleDataSet;
    OutIntIncomeAccounts: TOracleDataSet;
    OutInterestsDatSrc: TDataSource;
    OutIntIncomeDatSrc: TDataSource;
    Customers: TOracleDataSet;
    Interestrests: TOracleDataSet;
    CustomersDatSrc: TDataSource;
    InterestrestsDatSrc: TDataSource;
    CreditInfo: TOracleDataSet;
    InterestInfo: TOracleDataSet;
    InterestsAccounts: TOracleDataSet;
    IntAccDatSrc: TDataSource;
    CustIntAccounts: TOracleDataSet;
    CustIntAccDatSrc: TDataSource;
    Avalute: TOracleDataSet;
    CM_INT_PLACEOUTBALANCE: TOraclePackage;
    OutInterestsAccountsID: TFloatField;
    OutInterestsAccountsACC_NO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OBSDatMod: TOBSDatMod;

implementation

{$R *.DFM}

Uses sboapiDataModuleImpl;

end.

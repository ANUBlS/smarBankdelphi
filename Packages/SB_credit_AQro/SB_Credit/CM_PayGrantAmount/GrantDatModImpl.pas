unit GrantDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TGrantDataMod = class(TDataModule)
    CustAccounts: TOracleDataSet;
    BankAccounts: TOracleDataSet;
    CustAccountsDatSrc: TDataSource;
    BankAccountsDatSrc: TDataSource;
    CustInfo: TOracleDataSet;
    CustInfoDatSrc: TDataSource;
    Avalute: TOracleDataSet;
    CM_PAYMENTGRANT: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GrantDataMod: TGrantDataMod;

implementation

{$R *.DFM}
uses CMOracleAPIDatamoduleImpl;

end.

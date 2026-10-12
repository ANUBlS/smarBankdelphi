unit cc_DataMod_CashOper;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData;

type
  TDataMod_CCCashOper = class(TDataModule)
    cc_contracts: TOracleDataSet;
    CC_contractsSrc: TDataSource;
    sboapi: TOracleLogon;
    main: TOracleDataSet;
    mainID: TFloatField;
    mainMONTHPAY: TFloatField;
    mainSUMINTEREST: TFloatField;
    mainGECMEB: TFloatField;
    mainGUN: TFloatField;
    MainSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod_CCCashOper: TDataMod_CCCashOper;

implementation

{$R *.dfm}

end.

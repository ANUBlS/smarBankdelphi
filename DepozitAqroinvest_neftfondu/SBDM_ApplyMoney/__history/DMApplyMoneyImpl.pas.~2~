unit DMApplyMoneyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMApplyMoney = class(TDataModule)
    Tranches: TOracleDataSet;
    TranchesDatSrc: TDataSource;
    TranchesID: TFloatField;
    TranchesHDATE: TDateTimeField;
    TranchesTOTAL: TFloatField;
    TranchesTRID: TFloatField;
    DebitAccs: TOracleDataSet;
    DebitAccsID: TFloatField;
    DebitAccsDatSrc: TDataSource;
    sbcm_tranches: TOraclePackage;
    DepositInfo: TOracleDataSet;
    DepositInfoDatSrc: TDataSource;
    DepositInfoINTEREST: TFloatField;
    DepositInfoAMOUNT: TFloatField;
    DepositInfoCURRENCY: TFloatField;
    CustAccDatSrc: TDataSource;
    CustAcc: TOracleDataSet;
    CustAccCLIENTACCID: TFloatField;
    DepositInfoCUSTOMERID: TFloatField;
    DebitAccsACC_NO: TWideStringField;
    DebitAccsNAME: TWideStringField;
    DepositInfoNAME: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMApplyMoney: TDMApplyMoney;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

end.

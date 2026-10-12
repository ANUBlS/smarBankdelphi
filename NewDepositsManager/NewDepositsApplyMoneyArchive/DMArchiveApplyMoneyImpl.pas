unit DMArchiveApplyMoneyImpl;
               //fkCalculated
interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMArchiveApplyMoney = class(TDataModule)
    Tranches: TOracleDataSet;
    TranchesID: TFloatField;
    TranchesTOTAL: TFloatField;
    TranchesHDATE: TDateTimeField;
    TranchesTRID: TFloatField;
    TranchesDatSrc: TDataSource;
    DebitAccs: TOracleDataSet;
    DebitAccsID: TFloatField;
    DebitAccsACC_NO: TWideStringField;
    DebitAccsNAME: TWideStringField;
    DebitAccsDatSrc: TDataSource;
    dm_tranches: TOraclePackage;
    DepositInfo: TOracleDataSet;
    DepositInfoNAME: TWideStringField;
    DepositInfoINTEREST: TFloatField;
    DepositInfoAMOUNT: TFloatField;
    DepositInfoCURRENCY: TFloatField;
    DepositInfoCUSTOMERID: TFloatField;
    DepositInfoDatSrc: TDataSource;
    CustAccDatSrc: TDataSource;
    CustAcc: TOracleDataSet;
    CustAccCLIENTACCID: TFloatField;
    TranchesDESCRIPTION: TWideStringField;
    sb_aca: TOraclePackage;
    DepositInfoCONTRACTNO: TWideStringField;
    DepositInfoOPDATE: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMArchiveApplyMoney: TDMArchiveApplyMoney;

implementation

{$R *.dfm}
    uses sboapiDataModuleImpl;
end.

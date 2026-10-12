unit TB_DataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  Tout_balancedatamodule = class(TDataModule)
    BalanceData: TOracleDataSet;
    AccountData: TOracleDataSet;
    DataSrcBalanceData: TDataSource;
    DataSrcAccountData: TDataSource;
    SYSDAT: TOracleDataSet;
    BankInfo: TOracleDataSet;
    CurrencyInfo: TOracleDataSet;
    DataSrcCurrencyInfo: TDataSource;
    BranchesInfo: TOracleDataSet;
    DataSrcBranchesInfo: TDataSource;
    TransactionsData: TOracleDataSet;
    DataSrcTransactionsData: TDataSource;
    WorkDateData: TOracleDataSet;
    TransactionsDataID: TFloatField;
    TransactionsDataDEBITACCID: TFloatField;
    TransactionsDataCREDITACCID: TFloatField;
    TransactionsDataOPERATORID: TWideStringField;
    TransactionsDataTRANSACTIONDATE: TDateTimeField;
    TransactionsDataDEBITACCNO: TWideStringField;
    TransactionsDataDEBITCURRENCYSNAME: TWideStringField;
    TransactionsDataCREDITACCNO: TWideStringField;
    TransactionsDataCREDITCURRENCYSNAME: TWideStringField;
    TransactionsDataDEBITAMOUNT: TFloatField;
    TransactionsDataCREDITAMOUNT: TFloatField;
    TransactionsDataLAMOUNT: TFloatField;
    TransactionsDataTRDESCRIPTION: TWideStringField;
    SYSDATCURRENTDATE: TDateTimeField;
    BankInfoBANK: TWideStringField;
    BankInfoINN: TWideStringField;
    BankInfoSEDR: TWideStringField;
    BankInfoBUHALTR: TWideStringField;
    BankInfoMANAGERTITLE: TWideStringField;
    BankInfoACCOUNTANTTITLE: TWideStringField;
    BankInfoLOGO: TBlobField;
    CurrencyInfoCURRENCY: TIntegerField;
    CurrencyInfoCURRLNAME: TWideStringField;
    WorkDateDataWORKDATE: TDateTimeField;
    BranchesInfoBRANCHID: TFloatField;
    BranchesInfoBRANCHNAME: TWideStringField;
    procedure AccountDataAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  out_balancedatamodule: Tout_balancedatamodule;

implementation

{$R *.DFM}
uses  sboapidatamoduleimpl;
procedure Tout_balancedatamodule.AccountDataAfterScroll(DataSet: TDataSet);
var
  AccID : Integer;
begin
  with DataSet do
  if not FieldByName('AccID').IsNull then
    AccID := FieldByName('AccID').AsInteger else
    AccID := -1;
  TransactionsData.Filtered := False;
  TransactionsData.Filter := Format('(DebitAccID = %d) or (CreditAccID = %d)',[AccID ,AccID]);
  TransactionsData.Filtered := True;
end;


end.

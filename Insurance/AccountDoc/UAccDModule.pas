unit UAccDModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TAccountDModule = class(TDataModule)
    Account: TOracleDataSet;
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
    AccountData: TDataSource;
    CreditTransactions: TDataSource;
    CreditTransactionsData: TOracleDataSet;
    CreditTransactionsDataID: TFloatField;
    IntegerField1: TIntegerField;
    CreditTransactionsDataCREDITACCID: TFloatField;
    CreditTransactionsDataOPERATIONDATE: TDateTimeField;
    CreditTransactionsDataDEBITAMOUNT: TFloatField;
    CreditTransactionsDataCREDITAMOUNT: TFloatField;
    CreditTransactionsDataLAMOUNT: TFloatField;
    CreditTransactionsDataDEBITACCNO: TWideStringField;
    CreditTransactionsDataDESTINATION: TWideStringField;
    CreditTransactionsDataCreditAccNo: TWideStringField;
    DebetTransactionsData: TOracleDataSet;
    DebetTransactionsDataID: TFloatField;
    DebetTransactionsDataDEBITACCID: TFloatField;
    DebetTransactionsDataOPERATIONDATE: TDateTimeField;
    DebetTransactionsDataDEBITAMOUNT: TFloatField;
    DebetTransactionsDataCREDITAMOUNT: TFloatField;
    DebetTransactionsDataLAMOUNT: TFloatField;
    DebetTransactionsDataCREDITACCNO: TWideStringField;
    DebetTransactionsDataDESTINATION: TWideStringField;
    DebetTransactionsDataRowNumber: TIntegerField;
    DebetTransactionsDataDebitAccNo: TWideStringField;
    DebetTransactions: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountDModule: TAccountDModule;

implementation

uses UAccountDoc,sboapidatamoduleimpl;

{$R *.DFM}

procedure TAccountDModule.DataModuleCreate(Sender: TObject);
begin
Account.Open;

end;

procedure TAccountDModule.DataModuleDestroy(Sender: TObject);
begin
Account.Close;
end;

end.

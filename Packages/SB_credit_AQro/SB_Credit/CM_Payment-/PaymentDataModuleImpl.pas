unit PaymentDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, Oracle;

type
  TPaymentDataModule = class(TDataModule)
    PaymentInfo: TOracleDataSet;
    DataSrcPaymentInfo: TDataSource;
    CustAccount: TOracleDataSet;
    CustAccountBOOROWERACCID: TFloatField;
    PaymentAccounts: TOracleDataSet;
    DataSrcPaymentAccounts: TDataSource;
    PaymentInfoID: TFloatField;
    PaymentInfoCREDITID: TFloatField;
    PaymentInfoPAYDATE: TDateTimeField;
    PaymentInfoPAYEDAMT: TFloatField;
    PaymentInfoPAYEDINTAMT: TFloatField;
    PaymentInfoPAYEDDUEAMT: TFloatField;
    PaymentInfoPAYEDDUEINTAMT: TFloatField;
    PaymentAccountsACCID: TFloatField;
    PaymentAccountsKLI_ID: TFloatField;
    PaymentAccountsACCOUNTNUMBER: TStringField;
    PaymentAccountsREST: TFloatField;
    PaymentAccountsVAL_NAME: TStringField;
    LoanRest: TOracleDataSet;
    DueIntRest: TOracleDataSet;
    DueRest: TOracleDataSet;
    IntRest: TOracleDataSet;
    DSLoanRest: TDataSource;
    DSDueIntRest: TDataSource;
    DSDueRest: TDataSource;
    DSIntRest: TDataSource;
    PortfInfo: TOracleDataSet;
    DSPortfInfo: TDataSource;
    CM_PAYMENT: TOraclePackage;
    DueRestDUEREST: TFloatField;
    DueRestACC_NO: TStringField;
    IntRestINTERESTREST: TFloatField;
    IntRestACC_NO: TStringField;
    LoanRestREST: TFloatField;
    LoanRestACC_NO: TStringField;
    DueIntRestDUEINTERESTREST: TFloatField;
    DueIntRestACC_NO: TStringField;
    LoanRestPENALTYREST: TFloatField;
    PeniyaPayAccounts: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    DSrcPeniyaPayAccounts: TDataSource;
    cm_utils: TOraclePackage;
    LoanRestPENALTYACCNO: TStringField;
    PaymentInfoPAYEDPENALTYAMT2: TFloatField;
    expcrdcnt: TOracleDataSet;
    expcrdcntEXDATCOUNT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentDataModule: TPaymentDataModule;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl;

end.

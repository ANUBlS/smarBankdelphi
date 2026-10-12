unit DMExtractMoneyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMExtractMoney = class(TDataModule)
    Payments: TOracleDataSet;
    PaymentsDatSrc: TDataSource;
    CreditAccsDatSrc: TDataSource;
    CreditAccs: TOracleDataSet;
    CreditAccsID: TFloatField;
    sbcm_payment: TOraclePackage;
    DepositInfo: TOracleDataSet;
    DepositInfoAMOUNT: TFloatField;
    DepositInfoCURRENCY: TFloatField;
    DepositInfoCUSTOMERID: TFloatField;
    CustAcc: TOracleDataSet;
    CustAccCLIENTACCID: TFloatField;
    DepositInfoDatSrc: TDataSource;
    CustAccDatSrc: TDataSource;
    PaymentsID: TFloatField;
    PaymentsHDATE: TDateTimeField;
    PaymentsFACTICALDEBT: TFloatField;
    PaymentsINTERESTDEBT: TFloatField;
    PaymentsTRID: TFloatField;
    PaymentsINTTRID: TFloatField;
    DepositInfoFACTICALDEBT: TFloatField;
    DepositInfoFACTICALINTERESTDEBT: TFloatField;
    CreditAccsACC_NO: TWideStringField;
    CreditAccsNAME: TWideStringField;
    DepositInfoNAME: TWideStringField;
    CustAccCONTRACTACCNO: TWideStringField;
    CustAccINTERESTACCNO: TWideStringField;
    PaymentsBEFOINTTRID: TFloatField;
    PaymentsDESCRIPTION: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExtractMoney: TDMExtractMoney;

implementation

{$R *.DFM}
uses
   sboapiDataModuleImpl;

end.

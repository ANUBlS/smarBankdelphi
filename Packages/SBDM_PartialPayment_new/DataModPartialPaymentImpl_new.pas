unit DataModPartialPaymentImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData,Oracle;

type
  TDataModPartialPayment_new = class(TDataModule)
    Payments: TOracleDataSet;
    PaymentsID: TFloatField;
    PaymentsHDATE: TDateTimeField;
    PaymentsRESERVE: TFloatField;
    PaymentsTOTAL: TFloatField;
    PaymentsDESCRIPTION: TWideStringField;
    PaymentsDatSrc: TDataSource;
    DepositInfo: TOracleDataSet;
    DepositInfoNAME: TWideStringField;
    DepositInfoAMOUNT: TFloatField;
    DepositInfoCURRENCY: TFloatField;
    DepositInfoCUSTOMERID: TFloatField;
    DepositInfoSrc: TDataSource;
    Sysdat: TOracleDataSet;
    SysdatTEK_DAT: TDateTimeField;
    SysdatDatSrc: TDataSource;
    sbcm_payment: TOraclePackage;
    DebitAccs: TOracleDataSet;
    DebitAccsDatSrc: TDataSource;
    CreditAccs: TOracleDataSet;
    CreditAccsDatSrc: TDataSource;
    PercentAccs: TOracleDataSet;
    PercentAccsDatSrc: TDataSource;
    sb_aca: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModPartialPayment_new: TDataModPartialPayment_new;

implementation

{$R *.dfm}
   uses sboapiDataModuleImpl;
end.

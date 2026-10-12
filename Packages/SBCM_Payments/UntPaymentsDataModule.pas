unit UntPaymentsDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModPayments = class(TDataModule)
    PaymentsPackage: TOraclePackage;
    AccountRests: TOracleDataSet;
    DataSrcRests: TDataSource;
    AccountRestsOSTAT: TFloatField;
    AccountRestsPOK_OSTAT: TFloatField;
    ClentAccData: TOracleDataSet;
    ClentAccDataCLIENTACCNO: TStringField;
    ClentAccDataCLIENTACCNAME: TStringField;
    ClentAccDataCLIENTCURRENCY: TStringField;
    DataSrcClientAccData: TDataSource;
    OverdueAccData: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DataSrcOverdueAccData: TDataSource;
    OInterestAccData: TOracleDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DataSrcOInterestAccData: TDataSource;
    InterestAccData: TOracleDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DataSrcInterestAccData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModPayments: TDataModPayments;

implementation

uses  sboapiDatamoduleImpl;

{$R *.DFM}

end.

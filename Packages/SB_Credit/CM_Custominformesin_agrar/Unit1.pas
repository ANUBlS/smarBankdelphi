unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

type
  TDataModule1 = class(TDataModule)
    srcUsrGrp: TDataSource;
    UsrGrpDataSet: TOracleDataSet;
    PersonelTypeDataSet: TOracleDataSet;
    srcPersonelType: TDataSource;
    sysdat: TOracleDataSet;
    Main: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2BRANCHID: TFloatField;
    OracleDataSet2BRANCH: TStringField;
    OracleDataSet2DISTRICTID: TFloatField;
    OracleDataSet2DISTRICT: TStringField;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1CREDITID: TFloatField;
    OracleDataSet1CEM: TFloatField;
    OracleDataSet1SEX: TStringField;
    OracleDataSet1DATEOFCONCLUSION: TDateTimeField;
    OracleDataSet1KRXET: TFloatField;
    OracleDataSet1ADIYAT: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

end.

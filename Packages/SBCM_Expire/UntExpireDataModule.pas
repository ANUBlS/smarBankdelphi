unit UntExpireDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModExpire = class(TDataModule)
    ExpirePackage: TOraclePackage;
    ReliabilityPercentData: TOracleDataSet;
    DataSrcReliability: TDataSource;
    DataSrcMainReserve: TDataSource;
    MainReserve: TOracleDataSet;
    DataSrcExpiredReserve: TDataSource;
    ExpiredReserve: TOracleDataSet;
    OverdueReserveData: TOracleDataSet;
    DataSrcOverdueReserve: TDataSource;
    ReserveCont: TOraclePackage;
    OverdueAccData: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DataSrcOverdueAccData: TDataSource;
    ClientAccData: TOracleDataSet;
    ClientAccDataCLIENTACCNO: TStringField;
    ClientAccDataCLIENTACCNAME: TStringField;
    ClientAccDataCLIENTCURRENCY: TStringField;
    DataSrcClientAccData: TDataSource;
    SReserveData: TOracleDataSet;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DataSrcSReserveData: TDataSource;
    PReserveData: TOracleDataSet;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DataSrcPReserveData: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModExpire: TDataModExpire;

implementation

uses  sboapiDataModuleimpl;

{$R *.DFM}

procedure TDataModExpire.DataModuleDestroy(Sender: TObject);
begin
  ReliabilityPercentData.CloseAll;
  OverdueReserveData.CloseAll;
  MainReserve.CloseAll;
  ExpiredReserve.CloseAll;
end;

end.

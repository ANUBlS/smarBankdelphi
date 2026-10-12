unit  UnitDataModDailyOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDataModDailyOper = class(TDataModule)
    DS_CMACTIVE: TDataSource;
    ODS_CMACTIVE: TOracleDataSet;
    ODS_FILIAL: TOracleDataSet;
    DS_FILIAL: TDataSource;
    odstime: TOracleDataSet;
    ODS_Valuta: TOracleDataSet;
    DataSource1: TDataSource;
    ODS_CMACTIV_EHTIYAT: TOracleDataSet;
    DS_CMACTIV_EHTIYAT: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModDailyOper: TDataModDailyOper;
 
implementation

{$R *.DFM}

uses CMOracleApiDataModuleImpl;
procedure TDataModDailyOper.DataModuleCreate(Sender: TObject);
begin
ODS_Valuta.Open;
ODS_FILIAL.Open;

end;

end.

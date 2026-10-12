unit UntDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TContDataModule = class(TDataModule)
    Currencys: TOracleDataSet;
    DataSrcCurrencys: TDataSource;
    Categories: TOracleDataSet;
    DataSrcCategories: TDataSource;
    DataSrcTypes: TDataSource;
    CreditTypes: TOracleDataSet;
    CreditTypesID: TIntegerField;
    CreditTypesTYPE: TStringField;
    DataSrcCreditExporter: TDataSource;
    ReliabilityData: TOracleDataSet;
    ReserveData: TOracleDataSet;
    DataSrcReserve: TDataSource;
    ConvertingPackage: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContDataModule: TContDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;
procedure TContDataModule.DataModuleCreate(Sender: TObject);
begin
   Currencys.Open;
   Categories.Open;
   CreditTypes.Open;
end;

procedure TContDataModule.DataModuleDestroy(Sender: TObject);
begin
   Currencys.Close;
   Categories.Close;
   CreditTypes.Close;
end;

end.

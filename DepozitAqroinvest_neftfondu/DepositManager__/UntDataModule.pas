unit UntDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModDeposits = class(TDataModule)
    DepositsConvPackage: TOraclePackage;
    DataSrcCurrencys: TDataSource;
    CurrencysData: TOracleDataSet;
    DataSrcDepositTypes: TDataSource;
    DepositTypes: TOracleDataSet;
    DataSrcCategories: TDataSource;
    CategoriesData: TOracleDataSet;
    CurrencysDataCURRENCYID: TIntegerField;
    CurrencysDataCURRENCYLONGNAME: TStringField;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TStringField;
    CategoriesDataID: TFloatField;
    CategoriesDataCATEGORY: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModDeposits: TDataModDeposits;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;
   
procedure TDataModDeposits.DataModuleCreate(Sender: TObject);
begin
  CurrencysData.Open;
  CategoriesData.Open;
  DepositTypes.Open;
end;

procedure TDataModDeposits.DataModuleDestroy(Sender: TObject);
begin
  CurrencysData.CloseAll;
  CategoriesData.CloseAll;
  DepositTypes.CloseAll;
end;

end.

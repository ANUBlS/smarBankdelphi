unit DataModNewDepositUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModuleNewDeposit = class(TDataModule)
    DepositAccs: TOracleDataSet;
    DataSrcDepositAccs: TDataSource;
    ClientAccs: TOracleDataSet;
    DataSrcClientAccs: TDataSource;
    InterestAccs: TOracleDataSet;
    DataSrcInterestAccs: TDataSource;
    ClientCategoriesDataSet: TOracleDataSet;
    DataSrcClientCategories: TDataSource;
    DepositTypes: TOracleDataSet;
    DataSrcdepositTypes: TDataSource;
    Currencys: TOracleDataSet;
    DataSrcCurrencys: TDataSource;
    CurrencysVALUTE: TIntegerField;
    CurrencysVALU_NAME: TStringField;
    DepositAccsID: TFloatField;
    DepositAccsACCNO: TStringField;
    DepositAccsCLIENTNAME: TStringField;
    DepositAccsVAL_ACC: TIntegerField;
    ClientAccsID: TFloatField;
    ClientAccsACCNO: TStringField;
    ClientAccsCLIENTNAME: TStringField;
    ClientAccsVAL_ACC: TIntegerField;
    InterestAccsID: TFloatField;
    InterestAccsACCNO: TStringField;
    InterestAccsCLIENTNAME: TStringField;
    InterestAccsVAL_ACC: TIntegerField;
    DepositProperties: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleNewDeposit: TDataModuleNewDeposit;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;
   
procedure TDataModuleNewDeposit.DataModuleCreate(Sender: TObject);
begin
  Currencys.Open;
  DepositAccs.Open;
  ClientAccs.Open;
  InterestAccs.Open;
  ClientCategoriesDataSet.Open;
  DepositTypes.Open;
end;

procedure TDataModuleNewDeposit.DataModuleDestroy(Sender: TObject);
begin
   DepositAccs.Close;
   ClientAccs.Close;
   InterestAccs.Close;
   ClientCategoriesDataSet.Close;
   DepositTypes.Close;
   Currencys.Close;   
end;

end.

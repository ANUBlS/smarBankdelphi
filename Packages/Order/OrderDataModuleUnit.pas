unit OrderDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDataModOrder = class(TDataModule)
    SYSDAT: TOracleDataSet;
    CurrencyData: TOracleDataSet;
    DataSrcCurrency: TDataSource;
    SYSDATTEK_DAT: TDateTimeField;
    CurrencyDataVALUTE: TIntegerField;
    ContractAccs: TOracleDataSet;
    ClientAccs: TOracleDataSet;
    ReserveAccs: TOracleDataSet;
    DataSrcContractAccs: TDataSource;
    DataSrcClientAccs: TDataSource;
    DataSrcReserveAccs: TDataSource;
    BankInfoData: TOracleDataSet;
    ContractAccsVAL_ACC: TIntegerField;
    ContractAccsKLI_ID: TFloatField;
    ReserveAccsVAL_ACC: TIntegerField;
    ClientAccsVAL_ACC: TIntegerField;
    ClientAccsKLI_ID: TFloatField;
    ReserveAccsKLI_ID: TFloatField;
    CurrencyDataVAL_NAME: TWideStringField;
    CurrencyDataVALU_NAME: TWideStringField;
    CurrencyDataVALU_BALA: TWideStringField;
    ReserveAccsACC_NO: TWideStringField;
    ReserveAccsNAME: TWideStringField;
    ContractAccsACC_NO: TWideStringField;
    ContractAccsNAME: TWideStringField;
    ClientAccsACC_NO: TWideStringField;
    ClientAccsNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModOrder: TDataModOrder;

implementation

{$R *.DFM}
uses
   sboapiDataModuleImpl, OrderImpl;
procedure TDataModOrder.DataModuleCreate(Sender: TObject);
begin
  SYSDAT.Open;
  CurrencyData.Open;
  ContractAccs.Open;
  ClientAccs.Open;
  ReserveAccs.Open;
  BankInfoData.Open;
end;

procedure TDataModOrder.DataModuleDestroy(Sender: TObject);
begin
  SYSDAT.CloseAll;
  CurrencyData.CloseAll;
  ContractAccs.CloseAll;
  ClientAccs.CloseAll;
  ReserveAccs.CloseAll;
  BankInfoData.CloseAll;
end;

end.

unit DataModCurrPositin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCPDataMod = class(TDataModule)
    OPackage: TOraclePackage;
    ODSCurrPosition: TOracleDataSet;
    DataSrcCurrPosition: TDataSource;
    ODSCurrency: TOracleDataSet;
    DataSrcRate: TDataSource;
    ODSDate: TOracleDataSet;
    DataSrcDate: TDataSource;
    ODSSum: TOracleDataSet;
    DataSrcSum: TDataSource;
    BankInfo: TOracleDataSet;
    CapitalData: TOracleDataSet;
    CapitalDataACTIVE: TFloatField;
    CapitalDataPASSIVE: TFloatField;
    CapitalDataCAPITAL: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CPDataMod: TCPDataMod;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl;


procedure TCPDataMod.DataModuleCreate(Sender: TObject);
begin
  BankInfo.Open;
end;

procedure TCPDataMod.DataModuleDestroy(Sender: TObject);
begin
  BankInfo.CloseAll;
end;

end.

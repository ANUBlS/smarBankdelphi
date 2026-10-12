unit DataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TActvDataMod = class(TDataModule)
    CreditInfo: TOracleDataSet;
    DataSrcCreditInfo: TDataSource;
    ActivationPckg: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActvDataMod: TActvDataMod;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl;
  
end.

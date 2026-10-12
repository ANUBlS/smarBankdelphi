unit DataModuleUWUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TUWDataModule = class(TDataModule)
    ContractTypeData: TOracleDataSet;
    DataSrcContractType: TDataSource;
    ContractTypeDataTYPEDISCRIPTION: TStringField;
    ContractTypeDataTYPE: TStringField;
    ContractTypeDataDEPOSITKIND: TStringField;
    OtherDeposits: TOracleDataSet;
    DataSrcOtherDeposit: TDataSource;
    OtherDepositsTOTALDEPOSITS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UWDataModule: TUWDataModule;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;

end.

unit cr_CorrectorDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TCorrectorDataMod = class(TDataModule)
    CorrectData: TOracleDataSet;
    DSCorrectData: TDataSource;
    CorrectDataNUM: TWideStringField;
    CorrectDataNAME: TWideStringField;
    CorrectDataREST: TFloatField;
    CorrectDataINTERESTREST: TFloatField;
    CorrectDataDUEREST: TFloatField;
    CorrectDataDUEINTERESTREST: TFloatField;
    CorrectDataGIVENAMOUNT: TFloatField;
    CorrectDataOBLIGATION: TFloatField;
    CorrectDataPENALTYREST: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectorDataMod: TCorrectorDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;
  
end.

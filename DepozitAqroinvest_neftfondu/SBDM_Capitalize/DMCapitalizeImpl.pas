unit DMCapitalizeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDMCapitalize = class(TDataModule)
    DepositInfo: TOracleDataSet;
    DepositInfoDatSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCapitalize: TDMCapitalize;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

end.

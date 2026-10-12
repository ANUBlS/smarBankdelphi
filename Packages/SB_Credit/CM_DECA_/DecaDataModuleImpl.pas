unit DecaDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, DBTables;

type
  TDecaDataModule = class(TDataModule)
    DecaData: TOracleDataSet;
    DataSrcDecaData: TDataSource;
    DecaTable: TTable;
    SaveDlg: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecaDataModule: TDecaDataModule;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl;

end.

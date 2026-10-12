unit cuCommonDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TCUCommonDataModule = class(TDataModule)
    ReferencesData: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CUCommonDataModule: TCUCommonDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.

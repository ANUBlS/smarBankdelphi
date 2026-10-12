unit ArCommonDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TArCommonDataModule = class(TDataModule)
    ReferencesData: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArCommonDataModule: TArCommonDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.

unit CCDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCCDataMod = class(TDataModule)
    CR_CREDIT: TOraclePackage;
    Accounts: TOracleDataSet;
    AccountsDatSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CCDataMod: TCCDataMod;

implementation

{$R *.DFM}

uses
 sboapiDataModuleImpl;

end.

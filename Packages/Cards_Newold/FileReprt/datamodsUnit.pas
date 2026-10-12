unit datamodsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  Tfreportdatamod = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  freportdatamod: Tfreportdatamod;

implementation

uses Filereportform,SboapiDataModuleImpl;

{$R *.DFM}

end.

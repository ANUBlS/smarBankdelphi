unit dmControldpImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TdmControldp = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControldp: TdmControldp;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

end.

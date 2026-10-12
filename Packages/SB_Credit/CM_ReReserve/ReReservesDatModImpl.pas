unit ReReservesDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle;

type
  TReReservesDatMod = class(TDataModule)
    cm_reserve_contr: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReReservesDatMod: TReReservesDatMod;

implementation

{$R *.DFM}
uses CMOracleApiDataModuleImpl;

end.

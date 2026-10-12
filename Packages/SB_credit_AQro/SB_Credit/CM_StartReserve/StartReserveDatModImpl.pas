unit StartReserveDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TSRDatMod = class(TDataModule)
    CM_RESERVE_REFRESH: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SRDatMod: TSRDatMod;

implementation

{$R *.DFM}
uses CMOracleApiDataModuleImpl;

end.

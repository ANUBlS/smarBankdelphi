unit ReserveContDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TReserveContDataMod = class(TDataModule)
    CM_RESERVE_CONTR: TOraclePackage;
    CreditsInfo: TOracleDataSet;
    CreditsInfoID: TFloatField;
    CreditsInfoNUMBEROFCREDIT: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReserveContDataMod: TReserveContDataMod;

implementation

{$R *.DFM}
uses
  CMOracleAPIDataModuleImpl;
  
end.

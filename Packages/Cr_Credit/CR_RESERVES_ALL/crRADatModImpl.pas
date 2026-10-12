unit crRADatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TRAllDatMod = class(TDataModule)
    CR_RESERVE_COUNT_NEW: TOraclePackage;
    CreditsInfo: TOracleDataSet;
    CreditsInfoID: TFloatField;
    CreditsInfoNUMBEROFCREDIT: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAllDatMod: TRAllDatMod;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

end.

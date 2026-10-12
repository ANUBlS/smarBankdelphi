unit UntCorrectionDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TCorrectionDataMod = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectionDataMod: TCorrectionDataMod;

implementation

uses sboapiDataModuleImpl, UntContractCorrectionImpl;

{$R *.DFM}

end.

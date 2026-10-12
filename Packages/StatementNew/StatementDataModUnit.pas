unit StatementDataModUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModule1 = class(TDataModule)
    MakeTable_OP: TOraclePackage;
    OracleSession1: TOracleSession;
    OracleLogon1: TOracleLogon;
    P_Balance_OP: TOraclePackage;
    Extraction_ODSt: TOracleDataSet;
    ExtractionTrans_ODSt: TOracleDataSet;
    Bankm_ODSt: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

end.

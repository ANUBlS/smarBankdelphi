unit Correct_Tr_Py_Impl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TCorrect_Tr_Py_DatMod = class(TDataModule)
    TranchesDatSet: TOracleDataSet;
    PaymentsDatSet: TOracleDataSet;
    TranchesDatSrc: TDataSource;
    PaymentsDatSrc: TDataSource;
    CM_CORRECT_TRANCH_PAYM: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Correct_Tr_Py_DatMod: TCorrect_Tr_Py_DatMod;

implementation

{$R *.DFM}
uses CMOracleAPIDataModuleImpl;

end.

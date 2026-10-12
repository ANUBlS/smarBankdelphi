unit UnitDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs
  , Db, OracleData, Oracle;

type
  TDataMod = class(TDataModule)
    OrDSIncGen: TOracleDataSet;
    OrDSIncFilial: TOracleDataSet;
    DSIncExpenses: TDataSource;
    OrDSExpGen: TOracleDataSet;
    OrDSExpFilial: TOracleDataSet;
    OrDSSysDat: TOracleDataSet;
    OrDSSysDatTEK_DAT: TDateTimeField;
    OrDSFilial: TOracleDataSet;
    OrDSFilialID: TFloatField;
    OrDSFilialNAME: TStringField;
    OrDSFilialCode: TOracleDataSet;
    OrDSFilialCodeID: TFloatField;
    OrDSFilialCodeNAME: TStringField;
    OrDSBankInfo: TOracleDataSet;
    OrDSBankInfoBANK: TStringField;
    OS_IncExpenses: TOracleDataSet;
    OS_IncExpBranch: TOracleDataSet;
    OPack_SL: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation

uses IncExpDDImpl, SboapiDataModuleImpl;
{$R *.DFM}

end.

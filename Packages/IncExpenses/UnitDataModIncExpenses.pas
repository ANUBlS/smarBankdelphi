unit UnitDataModIncExpenses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;
type
  TDataModIncExpenses = class(TDataModule)
    OrDSSysDat: TOracleDataSet;
    OrDSSysDatTEK_DAT: TDateTimeField;
    OrDSFilial: TOracleDataSet;
    OrDSFilialID: TFloatField;
    OrDSFilialCode: TOracleDataSet;
    OrDSFilialCodeID: TFloatField;
    OrDSBankInfo: TOracleDataSet;
    OrDSIncomes: TOracleDataSet;
    OrDSIncomesBAL_CN1: TFloatField;
    OrDSIncomesREST: TFloatField;
    OrDSExpenses: TOracleDataSet;
    OrDSExpensesBAL_CN1: TFloatField;
    OrDSExpensesREST: TFloatField;
    OrDSIncomesGeneral: TOracleDataSet;
    OrDSIncomesGeneralBAL_CN1: TFloatField;
    OrDSIncomesGeneralREST: TFloatField;
    OrDSExpensesGeneral: TOracleDataSet;
    OrDSExpensesGeneralBAL_CN1: TFloatField;
    OrDSExpensesGeneralREST: TFloatField;
    OrDSIncomesBal: TOracleDataSet;
    OrDSIncomesBalBAL_CN1: TFloatField;
    OrDSIncomesBalREST: TFloatField;
    OrDSExpGenBal: TOracleDataSet;
    OrDSExpGenBalBAL_CN1: TFloatField;
    OrDSExpGenBalREST: TFloatField;
    DSIncomes: TDataSource;
    DSExpenses: TDataSource;
    OrDSExpensesBal: TOracleDataSet;
    OrDSExpensesBalBAL_CN1: TFloatField;
    OrDSExpensesBalREST: TFloatField;
    OrDSIncGenBal: TOracleDataSet;
    OrDSIncGenBalBAL_CN1: TFloatField;
    OrDSIncGenBalREST: TFloatField;
    OrDSBegOstatGen: TOracleDataSet;
    OrDSEndOstatGen: TOracleDataSet;
    OrDSBegOstat: TOracleDataSet;
    OrDSEndOstat: TOracleDataSet;
    OrDSBegOstatGenSUMER: TFloatField;
    OrDSEndOstatGenSUMER: TFloatField;
    OrDSBegOstatSUMER: TFloatField;
    OrDSEndOstatSUMER: TFloatField;
    OrDSExpOtherFilials: TOracleDataSet;
    OrDSIncOtherFilials: TOracleDataSet;
    OrDSExpOtherFilialsREST: TFloatField;
    OrDSExpOtherFilialsFILIALNO: TFloatField;
    OPack_SL: TOraclePackage;
    OrDSIncOtherFilialsFILIALNO: TFloatField;
    OrDSIncOtherFilialsREST: TFloatField;
    OrDSIncomesACC_NO: TStringField;
    OrDSIncomesNAME: TStringField;
    OrDSExpensesACC_NO: TStringField;
    OrDSExpensesNAME: TStringField;
    OrDSIncomesGeneralACC_NO: TStringField;
    OrDSIncomesGeneralNAME: TStringField;
    OrDSExpensesGeneralACC_NO: TStringField;
    OrDSExpensesGeneralNAME: TStringField;
    OrDSIncomesBalBALNAME: TStringField;
    OrDSExpensesBalBALNAME: TStringField;
    OrDSIncGenBalBALNAME: TStringField;
    OrDSExpGenBalBALNAME: TStringField;
    OrDSIncOtherFilialsFILIAL: TStringField;
    OrDSExpOtherFilialsFILIAL: TStringField;
    OrDSFilialNAME: TStringField;
    OrDSFilialCodeNAME: TStringField;
    OrDSBankInfoBANK: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModIncExpenses: TDataModIncExpenses;


implementation

uses ComObj, ComServ, SboapiDataModuleImpl, IncExpensesImpl;

{$R *.DFM}

end.

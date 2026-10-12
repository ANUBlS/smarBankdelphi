unit UnitData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle, ExcelExporter, CMExcelExport;

type
  TDataModWares = class(TDataModule)
    DSGroups: TDataSource;
    ODSGroups: TOracleDataSet;
    DSWares: TDataSource;
    ODSWares: TOracleDataSet;
    SB_MAIN_RESOURCE: TOraclePackage;
    ODSCalcWares: TOracleDataSet;
    DSCalcWares: TDataSource;
    ODSReport: TOracleDataSet;
    ODSTraffics: TOracleDataSet;
    ODSTrans: TOracleDataSet;
    DSTransOut: TDataSource;
    ODSViewGr1: TOracleDataSet;
    ODSSumWares: TOracleDataSet;
    DSSumWares: TDataSource;
    ODSGroupXLS: TOracleDataSet;
    ODSWaresXLS: TOracleDataSet;
    ODSViewWares: TOracleDataSet;
    DSViewWares: TDataSource;
    ODSViewGroups: TOracleDataSet;
    DSViewGroups: TDataSource;
    ODSSumViewWares: TOracleDataSet;
    DSSumViewWares: TDataSource;
    DSRepGroupAllNB: TDataSource;
    ODSRepGroupAllNB: TOracleDataSet;
    ODSWaresXLSALL: TOracleDataSet;
    ODSFilterGroup: TOracleDataSet;
    DSViewGr: TDataSource;
    ODSFilterWares: TOracleDataSet;
    ODSet_WExp: TOracleDataSet;
    DSource_WExp: TDataSource;
    ODSetArWares: TOracleDataSet;
    DSourArWares: TDataSource;
    DSGroupsAr: TDataSource;
    ODSGroupsAr: TOracleDataSet;
    ODSBankInfo: TOracleDataSet;
    ODSBankInfoFULLBANKNAME: Twidestringfield;
    DSSumWaresAr: TDataSource;
    ODSSumWaresAr: TOracleDataSet;
    ODSArWaresS: TOracleDataSet;
    DSArWaresS: TDataSource;
    ODSArWaresReport: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet2INVENTAR_DATE: TDateTimeField;
    OracleDataSet2FIRST_PRICE: TFloatField;
    OracleDataSet2REMAINDER: TFloatField;
    OracleDataSet2AMORT: TFloatField;
    OracleDataSet2ALL_AMORT: TFloatField;
    OracleDataSet2PERCENT: TFloatField;
    OracleDataSet2AMORT_DATE: TDateTimeField;
    OracleDataSet2FXM: TFloatField;
    OracleDataSet3INVENTAR_DATE: TDateTimeField;
    OracleDataSet3REMAINDER: TFloatField;
    OracleDataSet3TAX_FIRST_PRICE: TFloatField;
    OracleDataSet3TAX_AMORT: TFloatField;
    OracleDataSet3TAX_ALL_AMORT: TFloatField;
    OracleDataSet3TAX_PERCENT: TFloatField;
    OracleDataSet3AMORT_DATE: TDateTimeField;
    OracleDataSet3FXM: TFloatField;
    OracleDataSet2ACC_NO: Twidestringfield;
    OracleDataSet3ACC_NO: Twidestringfield;
    OracleDataSet2USER_NAME: Twidestringfield;
    OracleDataSet3USER_NAME: Twidestringfield;
    OracleDataSet2WARES_NAME: Twidestringfield;
    OracleDataSet3WARES_NAME: Twidestringfield;
    OraclePackage1: TOraclePackage;
    OracleDataSet2BAL_CN1: TFloatField;
    OracleDataSet3BAL_CN1: TFloatField;
    SysdatSet: TOracleDataSet;
    SysdatSrc: TDataSource;
    SysdatSetTEK_DAT: TDateTimeField;
    OracleDataSet5: TOracleDataSet;
    OracleDataSet5ID: TFloatField;
    OracleDataSet5NAME: Twidestringfield;
    OracleDataSet5AMORT: TFloatField;
    OracleDataSet5MAIN_ACCOUNT: TFloatField;
    OracleDataSet5EXP_ACCOUNT: TFloatField;
    OracleDataSet5AMORT_ACCOUNT: TFloatField;
    OracleDataSet5SALE_ACCOUNT: TFloatField;
    OracleDataSet5TAXAMORT: TFloatField;
    OracleDataSet5SID: TFloatField;
    OracleDataSet6: TOracleDataSet;
    OracleDataSet6WARES_NAME: Twidestringfield;
    OracleDataSet6WARES_ID: TFloatField;
    OracleDataSet6INVENTAR_DATE: TDateTimeField;
    OracleDataSet6GROUPS_ID: TFloatField;
    OracleDataSet6FIRST_PRICE: TFloatField;
    OracleDataSet6REMAINDER: TFloatField;
    OracleDataSet6AMORT: TFloatField;
    OracleDataSet6ALL_AMORT: TFloatField;
    OracleDataSet6PERCENT: TFloatField;
    OracleDataSet6TAX_FIRST_PRICE: TFloatField;
    OracleDataSet6TAX_REMAINDER: TFloatField;
    OracleDataSet6TAX_AMORT: TFloatField;
    OracleDataSet6TAX_ALL_AMORT: TFloatField;
    OracleDataSet6TAX_PERCENT: TFloatField;
    OracleDataSet6CLOSE_FORMAT: TFloatField;
    OracleDataSet6AMORT_DATE: TDateTimeField;
    OracleDataSet6TAX_CLOSE_FORMAT: TFloatField;
    OracleDataSet6INVENTAR_NO: Twidestringfield;
    OracleDataSet6USER_NAME: Twidestringfield;
    OracleDataSet6FXM: TFloatField;
    OracleDataSet6KEEPING_SEC: Twidestringfield;
    OracleDataSet6USER_ID: TFloatField;
    OracleDataSet6VISIBLE: TIntegerField;
    OracleDataSet6DEL_DATE: TDateTimeField;
    OracleDataSet7: TOracleDataSet;
    OracleDataSet7ID: TFloatField;
    OracleDataSet7NAME: Twidestringfield;
    OracleDataSet7AMORT: TFloatField;
    OracleDataSet7MAIN_ACCOUNT: TFloatField;
    OracleDataSet7EXP_ACCOUNT: TFloatField;
    OracleDataSet7AMORT_ACCOUNT: TFloatField;
    OracleDataSet7SALE_ACCOUNT: TFloatField;
    OracleDataSet7TAXAMORT: TFloatField;
    OracleDataSet8: TOracleDataSet;
    OracleDataSet8WARES_NAME: Twidestringfield;
    OracleDataSet8WARES_ID: TFloatField;
    OracleDataSet8INVENTAR_DATE: TDateTimeField;
    OracleDataSet8GROUPS_ID: TFloatField;
    OracleDataSet8FIRST_PRICE: TFloatField;
    OracleDataSet8REMAINDER: TFloatField;
    OracleDataSet8AMORT: TFloatField;
    OracleDataSet8ALL_AMORT: TFloatField;
    OracleDataSet8PERCENT: TFloatField;
    OracleDataSet8TAX_FIRST_PRICE: TFloatField;
    OracleDataSet8TAX_REMAINDER: TFloatField;
    OracleDataSet8TAX_AMORT: TFloatField;
    OracleDataSet8TAX_ALL_AMORT: TFloatField;
    OracleDataSet8TAX_PERCENT: TFloatField;
    OracleDataSet8CLOSE_FORMAT: TFloatField;
    OracleDataSet8AMORT_DATE: TDateTimeField;
    OracleDataSet8FXM: TFloatField;
    OracleDataSet8KEEPING_SEC: Twidestringfield;
    OracleDataSet8USER_ID: TFloatField;
    OracleDataSet8TAX_CLOSE_FORMAT: TFloatField;
    OracleDataSet8INVENTAR_NO: Twidestringfield;
    OracleDataSet8USER_NAME: Twidestringfield;
    OracleDataSet8VISIBLE: TIntegerField;
    OracleDataSet8DEL_DATE: TDateTimeField;
    OracleDataSet4: TOracleDataSet;
    OracleDataSet9: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OracleDataSet9ID: TFloatField;
    SalaryPackage: TOraclePackage;
    OracleDataSet10: TOracleDataSet;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    OracleDataSet9NAME: TWideStringField;
    ODSViewGr: TOracleDataSet;
    DSViewGr1: TDataSource;
    ODSViewGr2: TOracleDataSet;
    DSViewGr2: TDataSource;
    DSViewGr3: TDataSource;
    ODSViewGr3: TOracleDataSet;
    SB_ACA: TOraclePackage;
    ODSCalcWaresGROUP_NAME: TWideStringField;
    ODSCalcWaresGROUPS_ID: TFloatField;
    ODSCalcWaresDEBT_ACC: TFloatField;
    ODSCalcWaresCRED_ACC: TFloatField;
    ODSCalcWaresDEBT_AMOUNT: TFloatField;
    ODSCalcWaresTRANS_DATE: TDateTimeField;
    ODSCalcWaresID: TFloatField;
    ODSCalcWaresDEBTACCNO: TWideStringField;
    ODSCalcWaresCREDACCNO: TWideStringField;
    lazy: TOracleDataSet;
    lazydat: TDataSource;
    OracleDatabuy: TOracleDataSet;
    OracleDataSetsell: TOracleDataSet;
    DataSourcebuy: TDataSource;
    DataSourcesell: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModWares: TDataModWares;

implementation

{$R *.DFM}


uses  sboapiDataModuleImpl;

end.


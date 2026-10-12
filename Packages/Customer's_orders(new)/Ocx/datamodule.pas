unit datamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModCustOrders = class(TDataModule)
    serach_cust_: TDataSource;
    search_acc_: TDataSource;
    arest_acc: TOracleDataSet;
    arest_accID: TFloatField;
    arest_accKLI_ID: TFloatField;
    arest_accOP_ID: TFloatField;
    arest_accACC_NO: TStringField;
    arest_accVAL_ACC: TIntegerField;
    arest_accNAME: TStringField;
    arest_accOPEN_DAT: TDateTimeField;
    arest_accCLOSE_DAT: TDateTimeField;
    arest_accBAL_CN1: TFloatField;
    arest_accBAL_CN2: TFloatField;
    arest_accBAL_CN3: TFloatField;
    arest_accBAL_CN4: TFloatField;
    arest_accFILIAL: TIntegerField;
    arest_accSIM_OTCET: TFloatField;
    arest_accTIPACC: TStringField;
    arest_accLIMIT: TFloatField;
    arest_accOLD_ACC_NO: TStringField;
    arest_accPAIR_ACC: TFloatField;
    arest_accINSIDER: TStringField;
    arest_accSID: TFloatField;
    arest_acc_: TDataSource;
    Bankm_: TDataSource;
    Bankm: TOracleDataSet;
    bank_info_: TDataSource;
    bank_info: TOracleDataSet;
    customer_orders: TOraclePackage;
    arxiv_order_: TDataSource;
    customers: TOracleDataSet;
    customers_: TDataSource;
    cust_orders_: TDataSource;
    cust_: TDataSource;
    serach_cust: TOracleDataSet;
    acc_inn_: TDataSource;
    cust: TOracleDataSet;
    arxiv_order: TOracleDataSet;
    cust_orders: TOracleDataSet;
    cust_id: TOracleDataSet;
    search_acc: TOracleDataSet;
    valute: TOracleDataSet;
    valute_: TDataSource;
    account: TOracleDataSet;
    account_: TDataSource;
    cust_ordersPNUM: TFloatField;
    cust_ordersVAL: TStringField;
    cust_ordersN_MON: TStringField;
    cust_ordersDDATE: TDateTimeField;
    cust_ordersACC_INN: TStringField;
    cust_ordersC_NAME: TStringField;
    cust_ordersC_ACC: TStringField;
    cust_ordersM_ACC: TStringField;
    arxiv_orderPNUM: TFloatField;
    arxiv_orderVAL: TStringField;
    arxiv_orderACC_INN: TStringField;
    arxiv_orderC_NAME: TStringField;
    arxiv_orderC_ACC: TStringField;
    arxiv_orderM_ACC: TStringField;
    arxiv_orderN_MON: TStringField;
    arxiv_orderDDATE: TDateTimeField;
    arxiv_orderCLOSE_DATE: TDateTimeField;
    cust_ordersDBNAME: TStringField;
    cust_ordersDBCODE: TStringField;
    cust_ordersDBINN: TStringField;
    cust_ordersDBCORACC: TStringField;
    cust_ordersDBSWIFT: TStringField;
    cust_ordersB_NAME: TStringField;
    cust_ordersB_CODE: TStringField;
    cust_ordersB_INN: TStringField;
    cust_ordersB_SWIFT: TStringField;
    cust_ordersB_ACC: TStringField;
    cust_ordersC_INN: TStringField;
    cust_ordersM_NAME: TStringField;
    cust_ordersM_INN: TStringField;
    cust_ordersW_MON: TStringField;
    cust_ordersCONTENT: TStringField;
    cust_ordersEDV: TStringField;
    cust_ordersEDV_F: TStringField;
    cust_ordersEDV_C: TStringField;
    cust_ordersPRO: TStringField;
    cust_ordersPRO_F: TStringField;
    cust_ordersPRO_C: TStringField;
    cust_ordersHEAD: TStringField;
    cust_ordersCHIEF: TStringField;
    cust_ordersID: TFloatField;
    cust_ordersCLOSE_DATE: TDateTimeField;
    cust_ordersCUST_ID: TStringField;
    arxiv_orderDBNAME: TStringField;
    arxiv_orderDBCODE: TStringField;
    arxiv_orderDBINN: TStringField;
    arxiv_orderDBCORACC: TStringField;
    arxiv_orderDBSWIFT: TStringField;
    arxiv_orderB_NAME: TStringField;
    arxiv_orderB_CODE: TStringField;
    arxiv_orderB_INN: TStringField;
    arxiv_orderB_SWIFT: TStringField;
    arxiv_orderB_ACC: TStringField;
    arxiv_orderC_INN: TStringField;
    arxiv_orderM_NAME: TStringField;
    arxiv_orderM_INN: TStringField;
    arxiv_orderW_MON: TStringField;
    arxiv_orderCONTENT: TStringField;
    arxiv_orderEDV: TStringField;
    arxiv_orderEDV_F: TStringField;
    arxiv_orderEDV_C: TStringField;
    arxiv_orderPRO: TStringField;
    arxiv_orderPRO_F: TStringField;
    arxiv_orderPRO_C: TStringField;
    arxiv_orderHEAD: TStringField;
    arxiv_orderCHIEF: TStringField;
    arxiv_orderID: TFloatField;
    search_order: TOracleDataSet;
    search_order_: TDataSource;
    Acc: TOracleDataSet;
    Acc_: TDataSource;
    search_orderDBNAME: TStringField;
    search_orderDBCODE: TStringField;
    search_orderPNUM: TFloatField;
    search_orderDBINN: TStringField;
    search_orderDBCORACC: TStringField;
    search_orderDBSWIFT: TStringField;
    search_orderVAL: TStringField;
    search_orderB_NAME: TStringField;
    search_orderB_CODE: TStringField;
    search_orderB_INN: TStringField;
    search_orderB_SWIFT: TStringField;
    search_orderB_ACC: TStringField;
    search_orderC_NAME: TStringField;
    search_orderC_ACC: TStringField;
    search_orderC_INN: TStringField;
    search_orderM_NAME: TStringField;
    search_orderM_ACC: TStringField;
    search_orderM_INN: TStringField;
    search_orderN_MON: TStringField;
    search_orderW_MON: TStringField;
    search_orderCONTENT: TStringField;
    search_orderEDV: TStringField;
    search_orderEDV_F: TStringField;
    search_orderEDV_C: TStringField;
    search_orderPRO: TStringField;
    search_orderPRO_F: TStringField;
    search_orderPRO_C: TStringField;
    search_orderHEAD: TStringField;
    search_orderCHIEF: TStringField;
    search_orderDDATE: TDateTimeField;
    search_orderID: TFloatField;
    search_orderACC_INN: TStringField;
    search_orderCLOSE_DATE: TDateTimeField;
    search_orderCUST_ID: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModCustOrders: TDataModCustOrders;

implementation

{$R *.DFM}
uses
    sboapiDataModuleImpl;
end.

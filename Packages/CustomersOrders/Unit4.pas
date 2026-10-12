unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDm = class(TDataModule)
    cust_orders: TOracleDataSet;
    ds_cust_orders: TDataSource;
    arxiv_orders: TOracleDataSet;
    search_acc: TOracleDataSet;
    BankM: TOracleDataSet;
    cust_id: TOracleDataSet;
    search_order: TOracleDataSet;
    ds_arxiv_orders: TDataSource;
    search_acc_ds: TDataSource;
    ds_BankM: TDataSource;
    acc_inn_: TDataSource;
    ds_search_order: TDataSource;
    Custormers_ds: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersOPEN_DAT: TDateTimeField;
    CustomersINN: TStringField;
    search_accID: TFloatField;
    search_accKLI_ID: TFloatField;
    search_accOP_ID: TFloatField;
    search_accACC_NO: TStringField;
    search_accVAL_ACC: TIntegerField;
    search_accNAME: TStringField;
    search_accOPEN_DAT: TDateTimeField;
    search_accCLOSE_DAT: TDateTimeField;
    search_accBAL_CN1: TFloatField;
    search_accBAL_CN2: TFloatField;
    search_accBAL_CN3: TFloatField;
    search_accBAL_CN4: TFloatField;
    search_accFILIAL: TIntegerField;
    search_accSIM_OTCET: TFloatField;
    search_accTIPACC: TStringField;
    search_accLIMIT: TFloatField;
    search_accOLD_ACC_NO: TStringField;
    search_accPAIR_ACC: TFloatField;
    search_accINSIDER: TStringField;
    search_accSID: TFloatField;
    search_accTEMPID: TFloatField;
    search_accOWNID: TFloatField;
    search_accP_CUSTID: TFloatField;
    valute: TOracleDataSet;
    ds_valute: TDataSource;
    DataSource1: TDataSource;
    BankInfo: TOracleDataSet;
    custormers_orders: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

uses sboapiDataModuleImpl,CustomersordersImpl1, CustomersordersProj1_TLB, Unit3,
  Unit10, Unit11, Unit12, Unit5, Unit6, Unit7, Unit8, Unit9;

{$R *.DFM}

end.

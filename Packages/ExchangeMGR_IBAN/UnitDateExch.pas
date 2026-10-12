unit UnitDateExch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Oracle, OracleData,sboapiDataModuleImpl;

type
  TDataModExch = class(TDataModule)
    ODSExchOffice: TOracleDataSet;
    DSExchOffice: TDataSource;
    OPExchMgr: TOraclePackage;
    ODSExchAcc: TOracleDataSet;
    ODSExchAccID: TFloatField;
    ODSExchAccEX_ID: TFloatField;
    ODSExchAccPURCHASE_ACC_NO: TWideStringField;
    ODSExchAccSELLING_ACC_NO: TWideStringField;
    ODSExchAccPROFIT_ACC_NO: TWideStringField;
    ODSExchAccHARM_ACC_NO: TWideStringField;
    ODSExchAccVAL_NB_COURSE: TFloatField;
    ODSExchAccval_purchase_course: TFloatField;
    ODSExchAccVAL_SELLING_COURSE: TFloatField;
    ODSExchAccVAL_ID: TFloatField;
    ODSExchAccVAL_NAME: TWideStringField;
    ODSExchAccVAL_NAME1: TWideStringField;
    DSExchAcc: TDataSource;
    ODSExchRate: TOracleDataSet;
    ODSExchRateVAL_ID: TFloatField;
    ODSExchRateVAL_NAME: TWideStringField;
    ODSExchRateVAL_FULL_NAME: TWideStringField;
    ODSExchRateVAL_PURCHASE_COURSE: TFloatField;
    ODSExchRateVAL_SELLING_COURSE: TFloatField;
    ODSExchRateVAL_NB_COURSE: TFloatField;
    ODSExchRateEX_ID: TFloatField;
    ODSExchRateDAT: TDateTimeField;
    ODSExchRateUSR_ID: TFloatField;
    ODSExchRateFIRST_OSTAT: TFloatField;
    ODSExchRateCURRENT_OSTAT: TFloatField;
    ODSExchRatePURCHASE_TURN: TFloatField;
    ODSExchRateSELLING_TURN: TFloatField;
    ds: TDataSource;
    DSExchProvarch: TDataSource;
    DSAcc_main_debt: TDataSource;
    ODSAcc_main_debt: TOracleDataSet;
    ODSExchProvarch: TOracleDataSet;
    OPTrans: TOraclePackage;
    ODSReport: TOracleDataSet;
    TableAddFile: TTable;
    DSRateInsert: TDataSource;
    ODSRateInsert: TOracleDataSet;
    ODSRateInsertVAL_ID: TFloatField;
    ODSRateInsertVAL_NAME: TWideStringField;
    ODSRateInsertVAL_FULL_NAME: TWideStringField;
    ODSRateInsertVAL_PURCHASE_COURSE: TFloatField;
    ODSRateInsertVAL_SELLING_COURSE: TFloatField;
    ODSRateInsertVAL_NB_COURSE: TFloatField;
    ODSRateInsertEX_ID: TFloatField;
    ODSRateInsertDAT: TDateTimeField;
    ODSRateInsertUSR_ID: TFloatField;
    ODSRateInsertFIRST_OSTAT: TFloatField;
    ODSRateInsertCURRENT_OSTAT: TFloatField;
    ODSRateInsertPURCHASE_TURN: TFloatField;
    ODSRateInsertSELLING_TURN: TFloatField;
    ODSExchRateOther: TOracleDataSet;
    DSExchRateOther: TDataSource;
    ODSTraffics: TOracleDataSet;
    DSTraffics: TDataSource;
    DSAddFile: TDataSource;
    sb_transaction: TOraclePackage;
    ODSExchProvarchTrans: TOracleDataSet;
    DSExchProvarchTrans: TDataSource;
    ODSCust_Name: TOracleDataSet;
    ODSCust_LName: TOracleDataSet;
    ODSCust_Father: TOracleDataSet;
    ODSCust_Confirm: TOracleDataSet;
    ODSCust_Country: TOracleDataSet;
    ODSGiving_Member: TOracleDataSet;
    DSCust_LName: TDataSource;
    DSCust_Confirm: TDataSource;
    DSCust_Father: TDataSource;
    DSCust_Name: TDataSource;
    DSGiving_Member: TDataSource;
    DSCust_Country: TDataSource;
    OPAdmin: TOraclePackage;
    ODSUserList: TOracleDataSet;
    DSUserList: TDataSource;
    DSRateTurn: TDataSource;
    ODSRateTurn: TOracleDataSet;
    ODSAcc_main_cred: TOracleDataSet;
    DSAcc_main_cred: TDataSource;
    ODSAcc_child_debt: TOracleDataSet;
    DSAcc_child_debt: TDataSource;
    ODSAcc_child_cred: TOracleDataSet;
    DSAcc_child_cred: TDataSource;
    ODSSumTrans: TOracleDataSet;
    DSSumTrans: TDataSource;
    ODSUsers: TOracleDataSet;
    ODSUsersID: TFloatField;
    ODSUsersUSERNAME: TWideStringField;
    DSUsers: TDataSource;
    ODsAccount: TOracleDataSet;
    DSAccount: TDataSource;
    ODSExp_Provarch: TOracleDataSet;
    DSExp_Provarch: TDataSource;
    ODSExchOfficeID: TFloatField;
    ODSExchOfficeEX_NO: TFloatField;
    ODSExchOfficeEX_NAME: TWideStringField;
    ODSExchOfficeEX_ADDRESS: TWideStringField;
    ODSExchOfficeEX_WORKER_NAME: TWideStringField;
    ODSExchOfficeEX_CHECK_NO: TWideStringField;
    ODSExchOfficeUSR_ID: TFloatField;
    SBA_ACA: TOraclePackage;
    Kurs: TOracleDataSet;
    OperKURS: TDataSource;
    ODSFilial: TOracleDataSet;
    DS_Filial: TDataSource;
    ODSTrafficsDAT: TDateTimeField;
    ODSTrafficsDEBITAMOUNT: TFloatField;
    ODSTrafficsLAMOUNT: TFloatField;
    ODSTrafficsSTATUS_STR: TWideStringField;
    ODSTrafficsOPER_NAME: TWideStringField;
    ODSTrafficsOP_COURSE: TFloatField;
    ODSTrafficsFEE_AMOUNT: TFloatField;
    ODSTrafficsVAL_CHANGED_NAME: TWideStringField;
    ODSTrafficsVAL_NAME: TWideStringField;
    ODSRateTurnVAL_NAME: TWideStringField;
    ODSRateTurnVAL_PURCHASE_COURSE: TFloatField;
    ODSRateTurnVAL_SELLING_COURSE: TFloatField;
    ODSRateTurnVAL_NB_COURSE: TFloatField;
    ODSRateTurnDAT: TDateTimeField;
    DSExchRate: TDataSource;
    ODSDel_ExProvarch: TOracleDataSet;
    DS_DelExProvarch: TDataSource;
    procedure ODSExchProvarchAfterInsert(DataSet: TDataSet);
    procedure ODSExchProvarchBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModExch: TDataModExch;

implementation

//uses sboapiDataModuleImpl;

{$R *.DFM}

procedure TDataModExch.ODSExchProvarchAfterInsert(DataSet: TDataSet);
begin
   ODSSumTrans.Refresh;
end;

procedure TDataModExch.ODSExchProvarchBeforeInsert(DataSet: TDataSet);
begin
   ODSSumTrans.Refresh;
end;

end.

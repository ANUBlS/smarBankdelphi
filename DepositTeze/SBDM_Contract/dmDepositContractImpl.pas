unit dmDepositContractImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TdmDepositContract = class(TDataModule)
    ClientTypes: TOracleDataSet;
    ClientTypesDatSrc: TDataSource;
    Filals: TOracleDataSet;
    FilalsDatSrc: TDataSource;
    persons: TOracleDataSet;
    personsDatSrc: TDataSource;
    valutes: TOracleDataSet;
    valutesDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersDatSrc: TDataSource;
    DepositAccs: TOracleDataSet;
    DepositPorpsDatSrc: TDataSource;
    DepositPorps: TOracleDataSet;
    DepositAccsDatSrc: TDataSource;
    DepositTypes1: TOracleDataSet;
    DepositTypesDatSrc: TDataSource;
    FilalsID: TFloatField;
    FilalsNAME: Twidestringfield;
    DepositTypes1ID: TFloatField;
    DepositTypes1TYPE: Twidestringfield;
    ClientTypesID: TFloatField;
    ClientTypesCATEGORY: Twidestringfield;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: Twidestringfield;
    DepositAccsID: TFloatField;
    DepositAccsCUSTID: TFloatField;
    DepositAccsACCNO: Twidestringfield;
    DepositAccsCLIENTNAME: Twidestringfield;
    DepositAccsVAL_ACC: TIntegerField;
    ClientAccs: TOracleDataSet;
    ClientaccsDatSrc: TDataSource;
    InterestsAccs: TOracleDataSet;
    InterestsAccsDatSrc: TDataSource;
    ClientAccsID: TFloatField;
    ClientAccsCUSTID: TFloatField;
    ClientAccsACCNO: Twidestringfield;
    ClientAccsCLIENTNAME: Twidestringfield;
    ClientAccsVAL_ACC: TIntegerField;
    InterestsAccsID: TFloatField;
    InterestsAccsCUSTID: TFloatField;
    InterestsAccsACCNO: Twidestringfield;
    InterestsAccsCLIENTNAME: Twidestringfield;
    InterestsAccsVAL_ACC: TIntegerField;
    CreditAccs: TOracleDataSet;
    CreditAccsDatSrc: TDataSource;
    sbcm_contract: TOraclePackage;
    DepositPorpsPeriodContracts: TIntegerField;
    DepositPorpsOPENDATE: TDateTimeField;
    DepositPorpsCLOSEDATE: TDateTimeField;
    DepositPorpsAMOUNT: TFloatField;
    DepositPorpsCONTRACTNO: Twidestringfield;
    DepositPorpsCONTRACTTYPE: TIntegerField;
    DepositPorpsCLIENTTYPE: TFloatField;
    DepositPorpsBRANCHID: TFloatField;
    DepositPorpsCURRENCY: TFloatField;
    DepositPorpsPERSONALTYPE: TFloatField;
    DepositPorpsCUSTOMERID: TFloatField;
    DepositPorpsOVERDUEINTEREST: TFloatField;
    DepositPorpsDUEINTEREST: TFloatField;
    DepositPorpsCONTRACTACCID: TFloatField;
    DepositPorpsCLIENTACCID: TFloatField;
    DepositPorpsINTERESTACCID: TFloatField;
    CustomersID: TIntegerField;
    CustomersNAME: Twidestringfield;
    DepositPorpsFIRSTINTERESTPAYDAT: TDateTimeField;
    DepCapperiod: TOracleDataSet;
    DepPeriods: TOracleDataSet;
    DepPeriodsID: TFloatField;
    DepPeriodsPERIOD: TFloatField;
    DepPeriodsDESCRIPTION: Twidestringfield;
    DepPeriodsDEPID: TFloatField;
    DepPeriodsds: TDataSource;
    DepCapperiodds: TDataSource;
    DepCapperiodID: TFloatField;
    DepCapperiodPERIOD: TFloatField;
    DepCapperiodDESCRIPTION: Twidestringfield;
    DepCapperiodPERIODID: TFloatField;
    DepositPorpsCAPITALPERID: TFloatField;
    DepositPorpsPERIODID: TFloatField;
    BoorowerAccs: TOracleDataSet;
    BoorowerAccsID: TFloatField;
    BoorowerAccsCUSTID: TFloatField;
    BoorowerAccsACCNO: Twidestringfield;
    BoorowerAccsCLIENTNAME: Twidestringfield;
    BoorowerAccsVAL_ACC: TIntegerField;
    BoorowerAccsds: TDataSource;
    DepositPorpsBOOROWERACCID: TFloatField;
    DepositPorpsSID: TFloatField;
    usrs: TOracleDataSet;
    usrsID: TFloatField;
    usrsNAME: Twidestringfield;
    DepositPorpsUSERNAME: Twidestringfield;
    DepositPorpsAUTOPR: TFloatField;
    DepositPorpsINTEREST: Twidestringfield;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DepositPorpsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure DepositPorpsCalcFields(DataSet: TDataSet);
    procedure DepositPorpsCUSTOMERIDChange(Sender: TField);
  private
    { Private declarations }
  public
    procedure RefreshDataSets;
  end;

var
  dmDepositContract: TdmDepositContract;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,ContractCommonDecls,
      CommonDeclsImpl,frmDepositContractImpl;

procedure TdmDepositContract.RefreshDataSets;
begin
   valutes.Refresh;
   Filals.Refresh;
   DepositTypes1.Refresh;
   ClientTypes.Refresh;
   persons.Refresh;
   Customers.Refresh;
   DepositAccs.Refresh;
   ClientAccs.Refresh;
   InterestsAccs.Refresh;
end;

procedure TdmDepositContract.DataModuleCreate(Sender: TObject);
begin
   valutes.Open;
   Filals.Open;
   DepositTypes1.Open;
   ClientTypes.Open;
   persons.Open;
   Customers.Open;
   //ClientAccs.Open;
   //DepositAccs.Open;
   //ClientAccs.Open;
   //InterestsAccs.Open;
   //CreditAccs.Open;
end;

procedure TdmDepositContract.DataModuleDestroy(Sender: TObject);
begin
   valutes.CloseAll;
   Filals.CloseAll;
   DepositTypes1.CloseAll;
   ClientTypes.CloseAll;
   persons.CloseAll;
   Customers.CloseAll;
   ClientAccs.CloseAll;
   BoorowerAccs.CloseAll;
  // DepositAccs.CloseAll;
  // ClientAccs.CloseAll;
   //InterestsAccs.CloseAll;
  // CreditAccs.CloseAll;

end;

procedure TdmDepositContract.DepositPorpsApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
begin
   with SaveDeposit,sbcm_contract do
   begin
      case Action of
      'I': begin
            CallProcedure('NewDeposit',[
            'p_Type',TypeD
           ,'p_OpenDate',OpenDate
           ,'p_CloseDate' ,CloseDate
           ,'p_Amount',Amount
           ,'p_ContractNo',ContractNo
           ,'p_ContractType', ContractType
           ,'p_ClientType' ,ClientType
           ,'p_ContractAccID',ContractAccID
           ,'p_ClientAccID',ClientAccID
           ,'p_InterestAccID',InterestAccID
           ,'p_BoorowerAccID',BoorowerAccID
           ,'p_Percent',Interest
           ,'p_OverduePercent',overdueinterest
           ,'p_DuePercent',dueinterest
           ,'p_personaltype',personaltype
           ,'p_currency',currency
           ,'p_branchid',branchid
           ,'p_customerid',Customerid
           ,'p_stopCalcdate',FirstPayDateforInt
           ,'p_PeriodID',PeriodID
           ,'p_capitalperid',capitalperid
           ,'p_autopr',autopr
                                   ]);

        Applied := True;
        end;

      'U': begin
            CallProcedure('UpdateDeposit',[
            'p_ContractID',Get_SelectedContID
           ,'p_Type',TypeD
           ,'p_OpenDate',OpenDate
           ,'p_CloseDate' ,CloseDate
           ,'p_Amount',Amount
           ,'p_ContractNo',ContractNo
           ,'p_ContractType', ContractType
           ,'p_ClientType' ,ClientType
           ,'p_ContractAccID',ContractAccID
           ,'p_ClientAccID',ClientAccID
           ,'p_InterestAccID',InterestAccID
           ,'p_BoorowerAccID',BoorowerAccID
           ,'p_Percent',Interest
           ,'p_OverduePercent',overdueinterest
           ,'p_DuePercent',dueinterest
           ,'p_personaltype',personaltype
           ,'p_currency',currency
           ,'p_branchid',branchid
           ,'p_customerid',Customerid
           ,'p_stopCalcdate',FirstPayDateforInt
           ,'p_PeriodID',PeriodID
           ,'p_capitalperid',capitalperid
           ,'p_autopr',autopr
                          ]);

        Applied := True;

        end;

   end;
   end;

end;

procedure TdmDepositContract.DepositPorpsCalcFields(DataSet: TDataSet);
begin
   with DataSet do
        FieldByName('PeriodContracts').AsInteger
          := sbcm_contract.CallIntegerFunction('GetPeriod',
          ['bdat',FieldByname('opendate').AsDateTime,
           'edat',FieldByname('closedate').AsDateTime ]);

end;

procedure TdmDepositContract.DepositPorpsCUSTOMERIDChange(Sender: TField);
begin
   with frmDepositContract do
        ShowAccounts;
end;
end.

unit NewDepositsContractImpl;
       {ClientTypes}
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TNewDataModDepositsContract = class(TDataModule)
    ClientTypes: TOracleDataSet;
    ClientTypesID: TFloatField;
    ClientTypesCATEGORY: TWideStringField;
    ClientTypesDatSrc: TDataSource;
    Filals: TOracleDataSet;
    FilalsID: TFloatField;
    FilalsNAME: TWideStringField;
    FilalsDatSrc: TDataSource;
    persons: TOracleDataSet;
    personsDatSrc: TDataSource;
    valutes: TOracleDataSet;
    valutesVALUTE: TIntegerField;
    valutesVALU_NAME: TWideStringField;
    valutesDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TWideStringField;
    CustomersDatSrc: TDataSource;
    DepositAccs: TOracleDataSet;
    DepositAccsID: TFloatField;
    DepositAccsCUSTID: TFloatField;
    DepositAccsACCNO: TWideStringField;
    DepositAccsCLIENTNAME: TWideStringField;
    DepositAccsVAL_ACC: TIntegerField;
    DepositPorpsDatSrc: TDataSource;
    DepositPorps: TOracleDataSet;
    DepositPorpsBRANCHID: TFloatField;
    DepositPorpsCONTRACTNO: TWideStringField;
    DepositPorpsPeriodContracts: TIntegerField;
    DepositPorpsOPENDATE: TDateTimeField;
    DepositPorpsCLOSEDATE: TDateTimeField;
    DepositPorpsINTEREST: TWideStringField;
    DepositPorpsDUEINTEREST: TFloatField;
    DepositPorpsOVERDUEINTEREST: TFloatField;
    DepositPorpsCONTRACTTYPE: TIntegerField;
    DepositPorpsPERSONALTYPE: TFloatField;
    DepositPorpsCURRENCY: TFloatField;
    DepositPorpsAMOUNT: TFloatField;
    DepositPorpsCUSTOMERID: TFloatField;
    DepositPorpsCONTRACTACCID: TFloatField;
    DepositPorpsCLIENTACCID: TFloatField;
    DepositPorpsINTERESTACCID: TFloatField;
    DepositPorpsBOOROWERACCID: TFloatField;
    DepositPorpsFIRSTINTERESTPAYDAT: TDateTimeField;
    DepositPorpsPERIODID: TFloatField;
    DepositPorpsAUTOPR: TFloatField;
    DepositPorpsCAPITALPERID: TFloatField;
    DepositPorpsSID: TFloatField;
    DepositPorpsUSERNAME: TWideStringField;
    DepositAccsDatSrc: TDataSource;
    DepositTypes1: TOracleDataSet;
    DepositTypes1ID: TFloatField;
    DepositTypes1TYPE: TWideStringField;
    DepositTypesDatSrc: TDataSource;
    ClientAccs: TOracleDataSet;
    ClientAccsID: TFloatField;
    ClientAccsCUSTID: TFloatField;
    ClientAccsACCNO: TWideStringField;
    ClientAccsCLIENTNAME: TWideStringField;
    ClientAccsVAL_ACC: TIntegerField;
    ClientaccsDatSrc: TDataSource;
    InterestsAccs: TOracleDataSet;
    InterestsAccsID: TFloatField;
    InterestsAccsCUSTID: TFloatField;
    InterestsAccsACCNO: TWideStringField;
    InterestsAccsCLIENTNAME: TWideStringField;
    InterestsAccsVAL_ACC: TIntegerField;
    InterestsAccsDatSrc: TDataSource;
    CreditAccs: TOracleDataSet;
    CreditAccsDatSrc: TDataSource;
    sbcm_contract: TOraclePackage;
    DepCapperiod: TOracleDataSet;
    DepCapperiodID: TFloatField;
    DepCapperiodPERIOD: TFloatField;
    DepCapperiodDESCRIPTION: TWideStringField;
    DepCapperiodPERIODID: TFloatField;
    DepPeriods: TOracleDataSet;
    DepPeriodsID: TFloatField;
    DepPeriodsPERIOD: TFloatField;
    DepPeriodsDESCRIPTION: TWideStringField;
    DepPeriodsDEPID: TFloatField;
    DepPeriodsds: TDataSource;
    DepCapperiodds: TDataSource;
    BoorowerAccs: TOracleDataSet;
    BoorowerAccsID: TFloatField;
    BoorowerAccsCUSTID: TFloatField;
    BoorowerAccsACCNO: TWideStringField;
    BoorowerAccsCLIENTNAME: TWideStringField;
    BoorowerAccsVAL_ACC: TIntegerField;
    BoorowerAccsds: TDataSource;
    usrs: TOracleDataSet;
    usrsID: TFloatField;
    usrsNAME: TWideStringField;
    DSBEFO_INTERESTPEYTACC: TOracleDataSet;
    DSBEFO_INTERESTPEYTACCID: TFloatField;
    DSBEFO_INTERESTPEYTACCCUSTID: TFloatField;
    DSBEFO_INTERESTPEYTACCACCNO: TWideStringField;
    DSBEFO_INTERESTPEYTACCCLIENTNAME: TWideStringField;
    DSBEFO_INTERESTPEYTACCVAL_ACC: TIntegerField;
    DSRBEFO_INTERESTPEYTACC: TDataSource;
    DSsbcm_dep_t_Befoperc: TOracleDataSet;
    DSsbcm_dep_t_BefopercID: TFloatField;
    DSsbcm_dep_t_BefopercTYPE: TWideStringField;
    DSsbcm_dep_t_BefopercADDITIONALTYPE: TWideStringField;
    DSsbcm_dep_t_BefopercWITHDRAWTYPE: TWideStringField;
    DSsbcm_dep_t_BefopercDATEINTERVAL: TIntegerField;
    DSRsbcm_dep_t_Befoperc: TDataSource;
    DepositPorpsBEFO_INTERESTPEYTACCID: TFloatField;
    DepositTypes1WITHDRAWTYPE: TWideStringField;
    personsID: TFloatField;
    personsNAME: TWideStringField;
    DepositPorpsCLIENTTYPE: TFloatField;
    DepPeriodsPERIOD_TYPE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DepositPorpsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: string);
    procedure DepositPorpsCalcFields(DataSet: TDataSet);
    procedure DepositPorpsCUSTOMERIDChange(Sender: TField);
  private
    { Private declarations }
  public
  procedure RefreshDataSets;
  end;

var
  NewDataModDepositsContract: TNewDataModDepositsContract;

implementation

{$R *.dfm}
  uses sboapiDataModuleImpl,NewContractCommonDecls,
      NewCommonDeclsImpl,NewFormDepositContractImpl;

procedure TNewDataModDepositsContract.RefreshDataSets;
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
   DSBEFO_INTERESTPEYTACC.Refresh;
end;
procedure TNewDataModDepositsContract.DataModuleCreate(Sender: TObject);
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

procedure TNewDataModDepositsContract.DataModuleDestroy(Sender: TObject);
begin
   valutes.CloseAll;
   Filals.CloseAll;
   DepositTypes1.CloseAll;
   ClientTypes.CloseAll;
   persons.CloseAll;
   Customers.CloseAll;
   ClientAccs.CloseAll;
   BoorowerAccs.CloseAll;
   DSBEFO_INTERESTPEYTACC.CloseAll;
  // DepositAccs.CloseAll;
  // ClientAccs.CloseAll;
   //InterestsAccs.CloseAll;
  // CreditAccs.CloseAll;
end;

procedure TNewDataModDepositsContract.DepositPorpsApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: string);
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
           ,'p_BEFO_INTERESTPEYTACCID',BEFO_INTERESTPEYTACCID
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
           ,'p_BEFO_INTERESTPEYTACCID',BEFO_INTERESTPEYTACCID
                          ]);

        Applied := True;

        end;
      end;
   end;

end;

procedure TNewDataModDepositsContract.DepositPorpsCalcFields(DataSet: TDataSet);
begin
   with DataSet do
        FieldByName('PeriodContracts').AsInteger
          := sbcm_contract.CallIntegerFunction('GetPeriod',
          ['bdat',FieldByname('opendate').AsDateTime,
           'edat',FieldByname('closedate').AsDateTime ]);
end;

procedure TNewDataModDepositsContract.DepositPorpsCUSTOMERIDChange(Sender: TField);
begin
   with NewFormDepositContract do
        ShowAccounts;
end;

end.

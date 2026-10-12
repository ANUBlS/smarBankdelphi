unit UnitStateDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TTrafficDataModule = class(TDataModule)
    DataSrcTranches: TDataSource;
    TranchesData: TOracleDataSet;
    DataSrcProlongations: TDataSource;
    ProlongationsData: TOracleDataSet;
    DataSrcPayments: TDataSource;
    TranchesDataID: TFloatField;
    TranchesDataID2: TFloatField;
    TranchesDataHDATE: TDateTimeField;
    TranchesDataTOTAL: TFloatField;
    PaymentsDataID: TFloatField;
    PaymentsDataID2: TFloatField;
    PaymentsDataHDATE: TDateTimeField;
    PaymentsDataFACTICALDEBT: TFloatField;
    PaymentsDataINTERESTDEBT: TFloatField;
    PaymentsDataOVERDUEDEBT: TFloatField;
    PaymentsDataOVERDUEINTERESTDEBT: TFloatField;
    ProlongationsDataID: TFloatField;
    ProlongationsDataID2: TFloatField;
    ProlongationsDataHDATE: TDateTimeField;
    ProlongationsDataOLDDATE: TDateTimeField;
    ProlongationsDataNEWDATE: TDateTimeField;
    TranchesDataRESERVE: TFloatField;
    PaymentOrderData: TOracleDataSet;
    Rates: TOracleDataSet;
    PaymentsData: TOracleDataSet;
    AboutBank: TOracleDataSet;
    PaymentOrderDataCONTRACTID: TFloatField;
    PaymentOrderDataCONTRACTNO: TStringField;
    PaymentOrderDataOPENDATE: TDateTimeField;
    PaymentOrderDataCONTRACTACCNO: TStringField;
    PaymentOrderDataCLIENTACCNO: TStringField;
    PaymentOrderDataINTERESTACCNO: TStringField;
    PaymentOrderDataOVERDUEACCNO: TStringField;
    PaymentOrderDataOVERDUEINTERESTACCNO: TStringField;
    PaymentOrderDataCONTRACTACCNAME: TStringField;
    PaymentOrderDataCONTRACTCURRENCY: TStringField;
    PaymentOrderDataCLIENTCURRENCY: TStringField;
    PaymentOrderDataINTERESTCURRENCY: TStringField;
    PaymentOrderDataOVERDUECURRENCY: TStringField;
    PaymentOrderDataOVERDUEINTERESTCURRENCY: TStringField;
    PaymentOrderDataCUSTOMERCURRNCYID: TFloatField;
    PaymentOrderDataCONTRACTCURRENCYID: TFloatField;
    RatesRATE: TFloatField;
    PaymentOrderDataFacticalDebtInNational: TFloatField;
    PaymentOrderDataInterestDebtInNational: TFloatField;
    PaymentOrderDataOverdueDebtInNational: TFloatField;
    PaymentOrderDataOverdueInterestDebtInNational: TFloatField;
    CustomerData: TOracleDataSet;
    PaymentOrderDataCONTRACTACCID: TFloatField;
    CustomerDataNAME: TStringField;
    CustomerDataID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure PaymentOrderDataCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrafficDataModule: TTrafficDataModule;

implementation

{$R *.DFM}

uses
     sboapiDataModuleImpl,sbcmMainDataModule;

procedure TTrafficDataModule.DataModuleCreate(Sender: TObject);
begin
  AboutBank.Open;
end;

procedure TTrafficDataModule.DataModuleDestroy(Sender: TObject);
begin
  AboutBank.CloseAll;
end;

procedure TTrafficDataModule.PaymentOrderDataCalcFields(DataSet: TDataSet);

  function  RestInNational(HDate : TDateTime ;DebtCurrency ,CreditCurrency : Integer ;Rest : Real):Real;
  var
    CurrentRate : Real;
  begin
    Result := Rest;
    if  DebtCurrency <> CreditCurrency  then
    if  DebtCurrency <  CreditCurrency  then
    begin
      with  Rates  do
      begin
        SetVariable('Dat',HDate);
        SetVariable('CurrencyID',CreditCurrency);
        Open;
        CurrentRate := FieldByName('Rate').AsFloat;
        CloseAll;
      end;
      Result := Rest * CurrentRate;
    end; // Ya toropilsa!
  end;

var
  HDate : TDateTime;
  DebtCurrency , CreditCurrency : Integer;
begin
  with  DataSet  do
  begin
    HDate := Integer(Trunc(PaymentsData.FieldByName('HDate').AsDateTime));
    
    DebtCurrency   := FieldByName('CUSTOMERCURRNCYID').AsInteger;
    CreditCurrency := FieldByName('ContractCurrencyID').AsInteger;

    FieldByName('FacticalDebtInNational').AsFloat := RestInNational(
                                                         HDate
                                                        ,DebtCurrency
                                                        ,CreditCurrency
                                                        ,PaymentsData.FieldByName('FacticalDebt').AsFloat
                                                        );

    FieldByName('InterestDebtInNational').AsFloat := RestInNational(
                                                         HDate
                                                        ,DebtCurrency
                                                        ,CreditCurrency
                                                        ,PaymentsData.FieldByName('InterestDebt').AsFloat
                                                        );
    FieldByName('OverdueDebtInNational').AsFloat := RestInNational(
                                                         HDate
                                                        ,DebtCurrency
                                                        ,CreditCurrency
                                                        ,PaymentsData.FieldByName('OverdueDebt').AsFloat
                                                        );
    FieldByName('OverdueInterestDebtInNational').AsFloat := RestInNational(
                                                         HDate
                                                        ,DebtCurrency
                                                        ,CreditCurrency
                                                        ,PaymentsData.FieldByName('OverdueInterestDebt').AsFloat
                                                        );

  end;
end;

end.

unit DMPercentConveringImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMPercentConvering = class(TDataModule)
    CalcedDepositsDatSrc: TDataSource;
    CalcedDeposits: TOracleDataSet;
    CalcedDepositsCONTRACTNO: TStringField;
    CalcedDepositsCUSTNAME: TStringField;
    CalcedDepositsFACTICALDEBT: TFloatField;
    CalcedDepositsFACTICALINTERESTDEBT: TFloatField;
    CalcedDepositsINTEREST: TFloatField;
    CalcedDepositsCONTRACTACCNO: TStringField;
    CalcedDepositsID: TFloatField;
    CalcedDepositsSTATUS: TFloatField;
    CalcedDepositsVAL_NAME: TStringField;
    sbcm_percent_converting: TOraclePackage;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: TStringField;
    ValutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    FilialsID: TFloatField;
    FilialsNAME: TStringField;
    Categories: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: TStringField;
    DepositTypes: TOracleDataSet;
    DepositTypesDatSrc: TDataSource;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TStringField;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CalcedDepositsINTERESTACCNO: TStringField;
    PersonsDatSrc: TDataSource;
    Persons: TOracleDataSet;
    PersonsID: TFloatField;
    PersonsNAME: TStringField;
    CalcedDepositsCURRENCY: TFloatField;
    CalcedDepositsPERSONALTYPE: TFloatField;
    CalcedDepositsCLIENTTYPE: TFloatField;
    CalcedDepositsCUSTOMERID: TFloatField;
    CalcedDepositsBRANCHID: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPercentConvering: TDMPercentConvering;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TDMPercentConvering.DataModuleCreate(Sender: TObject);
begin
   with CalcedDeposits do
   begin
      SetVariable('OrderField','ID');
      Open;
   end;

   Valutes.Open;
   Filials.Open;
   Categories.Open;
   DepositTypes.Open;
   Customers.Open;
   Persons.Open;
end;

procedure TDMPercentConvering.DataModuleDestroy(Sender: TObject);
begin
   CalcedDeposits.CloseAll;
   Valutes.CloseAll;
   Filials.CloseAll;
   Categories.CloseAll;
   DepositTypes.CloseAll;
   Customers.CloseAll;
   Persons.CloseAll;
end;

end.

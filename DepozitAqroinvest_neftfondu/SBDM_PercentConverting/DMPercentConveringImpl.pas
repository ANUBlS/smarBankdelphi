unit DMPercentConveringImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMPercentConvering = class(TDataModule)
    CalcedDepositsDatSrc: TDataSource;
    CalcedDeposits: TOracleDataSet;
    sbcm_percent_converting: TOraclePackage;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    FilialsID: TFloatField;
    Categories: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    CategoriesID: TFloatField;
    DepositTypes: TOracleDataSet;
    DepositTypesDatSrc: TDataSource;
    DepositTypesID: TFloatField;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    PersonsDatSrc: TDataSource;
    Persons: TOracleDataSet;
    PersonsID: TFloatField;
    ValutesVALU_NAME: TWideStringField;
    FilialsNAME: TWideStringField;
    CategoriesCATEGORY: TWideStringField;
    DepositTypesTYPE: TWideStringField;
    CustomersNAME: TWideStringField;
    PersonsNAME: TWideStringField;
    CalcedDepositsID: TFloatField;
    CalcedDepositsCONTRACTNO: TWideStringField;
    CalcedDepositsCONTRACTACCNO: TWideStringField;
    CalcedDepositsINTERESTACCNO: TWideStringField;
    CalcedDepositsCUSTNAME: TWideStringField;
    CalcedDepositsFACTICALDEBT: TFloatField;
    CalcedDepositsFACTICALINTERESTDEBT: TFloatField;
    CalcedDepositsINTEREST: TFloatField;
    CalcedDepositsSTATUS: TFloatField;
    CalcedDepositsVAL_NAME: TWideStringField;
    CalcedDepositsCURRENCY: TFloatField;
    CalcedDepositsPERSONALTYPE: TFloatField;
    CalcedDepositsCLIENTTYPE: TFloatField;
    CalcedDepositsCUSTOMERID: TFloatField;
    CalcedDepositsBRANCHID: TFloatField;
    CalcedDepositsPERCENT: TFloatField;
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

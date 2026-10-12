unit DMPercentConveringImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMPercentConvering = class(TDataModule)
    CalcedDepositsDatSrc: TDataSource;
    CalcedDeposits: TOracleDataSet;
    CalcedDepositsCONTRACTNO: Twidestringfield;
    CalcedDepositsCUSTNAME: Twidestringfield;
    CalcedDepositsFACTICALDEBT: TFloatField;
    CalcedDepositsFACTICALINTERESTDEBT: TFloatField;
    CalcedDepositsINTEREST: TFloatField;
    CalcedDepositsCONTRACTACCNO: Twidestringfield;
    CalcedDepositsID: TFloatField;
    CalcedDepositsSTATUS: TFloatField;
    CalcedDepositsVAL_NAME: Twidestringfield;
    sbcm_percent_converting: TOraclePackage;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: Twidestringfield;
    ValutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    FilialsID: TFloatField;
    FilialsNAME: Twidestringfield;
    Categories: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: Twidestringfield;
    DepositTypes: TOracleDataSet;
    DepositTypesDatSrc: TDataSource;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: Twidestringfield;
    CustomersDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: Twidestringfield;
    CalcedDepositsINTERESTACCNO: Twidestringfield;
    PersonsDatSrc: TDataSource;
    Persons: TOracleDataSet;
    PersonsID: TFloatField;
    PersonsNAME: Twidestringfield;
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

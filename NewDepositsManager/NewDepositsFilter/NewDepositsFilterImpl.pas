unit NewDepositsFilterImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmFilter = class(TDataModule)
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    Categories: TOracleDataSet;
    CategoriesID: TFloatField;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesDatSrc: TDataSource;
    CategoriesDatSrc: TDataSource;
    FilialsDatSrc: TDataSource;
    ValutesDatSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    Persons: TOracleDataSet;
    PersonsID: TFloatField;
    PersonsDatSrc: TDataSource;
    CustomersDatSrc: TDataSource;
    users: TOracleDataSet;
    usersDatSrc: TDataSource;
    usersID: TFloatField;
    ValutesVALU_NAME: TWideStringField;
    CustomersNAME: TWideStringField;
    FilialsNAME: TWideStringField;
    PersonsNAME: TWideStringField;
    CategoriesCATEGORY: TWideStringField;
    usersNAME: TWideStringField;
    DepositTypesTYPE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFilter: TdmFilter;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TdmFilter.DataModuleCreate(Sender: TObject);
begin
   Valutes.Open;
   Filials.Open;
   Categories.Open;
   DepositTypes.Open;
   Customers.Open;
   Persons.Open;
   users.Open;
end;

procedure TdmFilter.DataModuleDestroy(Sender: TObject);
begin
   Valutes.CloseAll;
   Filials.CloseAll;
   Categories.CloseAll;
   DepositTypes.CloseAll;
   Customers.CloseAll;
   Persons.CloseAll;
   users.CloseAll;
end;

end.

unit crFilterDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TCrFilterDataModule = class(TDataModule)
    DSCurrencys: TDataSource;
    Currencys: TOracleDataSet;
    DSBranches: TDataSource;
    Branches: TOracleDataSet;
    DSPledges: TDataSource;
    Pledges: TOracleDataSet;
    DSUserGroups: TDataSource;
    UserGroups: TOracleDataSet;
    DSPReserves: TDataSource;
    PReserves: TOracleDataSet;
    DSSReserves: TDataSource;
    SReserves: TOracleDataSet;
    DSUsers: TDataSource;
    Users: TOracleDataSet;
    DSPersons: TDataSource;
    Persons: TOracleDataSet;
    DSCategories: TDataSource;
    Categories: TOracleDataSet;
    DSCreditTypes: TDataSource;
    CreditTypes: TOracleDataSet;
    DSCustomers: TDataSource;
    Customers: TOracleDataSet;
    PReservesID: TFloatField;
    PReservesPERCENT: TFloatField;
    PReservesDESCRIPTION: TWideStringField;
    PReservesFULLDESC: TWideStringField;
    SReservesID: TFloatField;
    SReservesPERCENT: TFloatField;
    SReservesDESCRIPTION: TWideStringField;
    SReservesFULLDESC: TWideStringField;
    procedure PReservesCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrFilterDataModule: TCrFilterDataModule;

implementation

{$R *.DFM}

uses
  SboapiDataModuleImpl;

procedure TCrFilterDataModule.PReservesCalcFields(DataSet: TDataSet);
begin
   with DataSet do
   FieldByName('FULLDESC').AsString :=
        FieldByName('PERCENT').AsString + '% - ' + FieldByName('DESCRIPTION').AsString;  
end;

procedure TCrFilterDataModule.DataModuleCreate(Sender: TObject);
begin
  SReserves.Open;
  PReserves.Open;
  Currencys.Open;
  Branches.Open;
  Pledges.Open;
  UserGroups.Open;
  Users.Open;
  Persons.Open;
  Categories.Open;
  CreditTypes.Open;
  Customers.Open;
end;

procedure TCrFilterDataModule.DataModuleDestroy(Sender: TObject);
begin
  SReserves.CloseAll;
  PReserves.CloseAll;
  Currencys.CloseAll;
  Branches.CloseAll;
  Pledges.CloseAll;
  UserGroups.CloseAll;
  Users.CloseAll;
  Persons.CloseAll;
  Categories.CloseAll;
  CreditTypes.CloseAll;
  Customers.CloseAll;
end;

end.

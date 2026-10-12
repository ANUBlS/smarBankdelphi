unit PortfelDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TPortfelDataModule = class(TDataModule)
    CurrencysDataSet: TOracleDataSet;
    CurrencysDataSource: TDataSource;
    PersonsDataSet: TOracleDataSet;
    PersonsDataSource: TDataSource;
    UsersDataSet: TOracleDataSet;
    UsersDataSource: TDataSource;
    FilialDataSet: TOracleDataSet;
    FilialDataSource: TDataSource;
    CategoriesDataSet: TOracleDataSet;
    CategoriesDataSource: TDataSource;
    CustomersDataSet: TOracleDataSet;
    CustomersDataSource: TDataSource;
    UserGroupsDataSet: TOracleDataSet;
    CreditTypeDataSet: TOracleDataSet;
    CreditTypeDataSource: TDataSource;
    UserGroupsDataSource: TDataSource;
    PledgesdataSource: TDataSource;
    PledgesdataSet: TOracleDataSet;
    DSPReservesDatasource: TDataSource;
    PReservesDatasetID: TFloatField;
    PReservesDatasetPERCENT: TFloatField;
    PReservesDatasetDESCRIPTION: TWideStringField;
    PReservesDatasetFULLDESC: TWideStringField;
    DSSReservesDataSource: TDataSource;
    SReservesDataSet: TOracleDataSet;
    SReservesDataSetID: TFloatField;
    SReservesDataSetPERCENT: TFloatField;
    SReservesDataSetFULLDESC: TWideStringField;
    PReservesDataset: TOracleDataSet;
    MainDataSet: TOracleDataSet;
    MainDataSource: TDataSource;
    DateDataSet: TOracleDataSet;
    DateDataSource: TDataSource;
    OperkursDataSet: TOracleDataSet;
    OperkursDataSource: TDataSource;
    MainDataSetCURRENCY: TFloatField;
    MainDataSetBOOROWERID: TFloatField;
    MainDataSetUSRGROUP: TFloatField;
    MainDataSetBRANCHID: TFloatField;
    MainDataSetUSID: TFloatField;
    MainDataSetCUSTOMERTYPE: TFloatField;
    MainDataSetCREDITTYPE: TFloatField;
    MainDataSetPERSONALTYPE: TFloatField;
    MainDataSetREST: TFloatField;
    MainDataSetINTERESTREST: TFloatField;
    MainDataSetDUEREST: TFloatField;
    MainDataSetDUEINTERESTREST: TFloatField;
    MainDataSetRESERVEID: TFloatField;
    MainDataSetDUERESERVEID: TFloatField;
    MainDataSetOBLIGATION: TFloatField;
    MainDataSetPLEDGEID: TFloatField;
    MainDataSetVAL_NAME: TWideStringField;
    MainDataSetNAME: TWideStringField;
    SReservesDataSetDESCRIPTION: TWideStringField;
  private
  public
  end;
var
  PortfelDataModule: TPortfelDataModule;

implementation
  Uses CMOracleAPIDataModuleImpl;
{$R *.DFM}


end.

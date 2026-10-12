unit DMDepositManagerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDMDepositsManager = class(TDataModule)
    DepositsData: TOracleDataSet;
    DepositsDataSrc: TDataSource;
    DepositsDataCONTRACTNO: TStringField;
    DepositsDataCONTRACTACCNO: TStringField;
    DepositsDataCUSTOMERNAME: TStringField;
    DepositsDataOPENDATE: TDateTimeField;
    DepositsDataCLOSEDATE: TDateTimeField;
    DepositsDataAMOUNT: TFloatField;
    DepositsDataINTEREST: TFloatField;
    DepositsDataFACTICALDEBT: TFloatField;
    DepositsDataFACTICALINTERESTDEBT: TFloatField;
    DepositsDataSTOPCALCULATIONDATE: TDateTimeField;
    DepositsDataVAL_NAME: TStringField;
    Valutes: TOracleDataSet;
    ValutesDatSrc: TDataSource;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: TStringField;
    Filials: TOracleDataSet;
    FilialsDatSrc: TDataSource;
    FilialsID: TFloatField;
    FilialsNAME: TStringField;
    DepositTypes: TOracleDataSet;
    DepositTypesDatSrc: TDataSource;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TStringField;
    Categories: TOracleDataSet;
    CategoriesDatSrc: TDataSource;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: TStringField;
    persons: TOracleDataSet;
    personsDatSrc: TDataSource;
    personsID: TFloatField;
    personsNAME: TStringField;
    DepositsDataINTERESTACCNO: TStringField;
    DepositsDataCURRENCY: TFloatField;
    DepositsDataPERSONALTYPE: TFloatField;
    DepositsDataCLIENTTYPE: TFloatField;
    DepositsDataBRANCHID: TFloatField;
    DepositsDataCONTRACTTYPE: TIntegerField;
    DepositsDataID: TFloatField;
    BankDate: TOracleDataSet;
    BankDateDatSrc: TDataSource;
    FilialID: TOracleDataSet;
    FilialIDDatSrc: TDataSource;
    FilialIDKOD_FIL: TIntegerField;
    BankDateTEK_DAT: TDateTimeField;
    Stored_Programs: TOraclePackage;
    DepositsDataSTATUS: TFloatField;
    DepositsDataCUSTOMERID: TFloatField;
    DepositsDataUSID: TFloatField;
    users: TOracleDataSet;
    usersDatSrc: TDataSource;
    usersID: TFloatField;
    usersNAME: TStringField;
    DepositsDataEKAMOUNT: TFloatField;
    DepositsDataEKFACTICALDEBT: TFloatField;
    DepositsDataEKFACTICALINTERESTDEBT: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDepositsManager: TDMDepositsManager;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TDMDepositsManager.DataModuleCreate(Sender: TObject);
begin

  with  DepositsData do
  begin
    SetVariable('OrderField','cont.id');
    Open;
  end;

  BankDate.Open;
  FilialID.Open;
   Valutes.Open;
   Filials.Open;
   DepositTypes.Open;
   Categories.Open;
   persons.Open;
   users.Open;
end;

procedure TDMDepositsManager.DataModuleDestroy(Sender: TObject);
begin
   DepositsData.CloseAll;
   BankDate.Open;
   FilialID.Open;
   Valutes.CloseAll;
   Filials.CloseAll;
   DepositTypes.CloseAll;
   Categories.CloseAll;
   persons.CloseAll;
   users.CloseAll;
end;

end.

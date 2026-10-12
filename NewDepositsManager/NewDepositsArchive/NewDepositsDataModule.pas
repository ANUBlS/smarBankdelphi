unit NewDepositsDataModule;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TNewDepositDataModule = class(TDataModule)
    DmDataSetArchive: TOracleDataSet;
    DmDataSetArchiveID: TFloatField;
    DmDataSetArchiveCONTRACTNO: TWideStringField;
    DmDataSetArchiveVAL_NAME: TWideStringField;
    DmDataSetArchiveCUSTOMERNAME: TWideStringField;
    DmDataSetArchiveOPENDATE: TDateTimeField;
    DmDataSetArchiveCLOSEDATE: TDateTimeField;
    DmDataSetArchiveAMOUNT: TFloatField;
    DmDataSetArchiveINTEREST: TFloatField;
    DmDataSetArchiveFACTICALDEBT: TFloatField;
    DmDataSetArchiveFACTICALINTERESTDEBT: TFloatField;
    DmDataSetArchiveOSTAT: TFloatField;
    DmDataSetArchiveCURRENCY: TFloatField;
    DmDataSetArchivePERSONALTYPE: TFloatField;
    DmDataSetArchiveCLIENTTYPE: TFloatField;
    DmDataSetArchiveBRANCHID: TFloatField;
    DmDataSetArchiveCONTRACTTYPE: TIntegerField;
    DmDataSetArchiveCUSTOMERID: TFloatField;
    DmDataSetArchiveUSID: TFloatField;
    DmDataSetArchivePROLONGATIONDATE: TDateTimeField;
    DmDataSetArchiveSTOPCALCDATE: TDateTimeField;
    DmDataSetArchiveCONTRACTTYPENAME: TWideStringField;
    DmDataSetArchiveUSERNAME: TWideStringField;
    DmDataSetArchiveFILIAL: TWideStringField;
    DmDataSetArchiveAGENTID: TFloatField;
    DMArchiveDataSrc: TDataSource;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: TWideStringField;
    ValutesDatSrc: TDataSource;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TWideStringField;
    FilialsDatSrc: TDataSource;
    dm_types: TOracleDataSet;
    dm_typesID: TFloatField;
    dm_typesTYPE: TWideStringField;
    dm_typesDatSrc: TDataSource;
    dm_categories: TOracleDataSet;
    dm_categoriesID: TFloatField;
    dm_categoriesCATEGORY: TWideStringField;
    dm_categoriesDatSrc: TDataSource;
    dm_persons: TOracleDataSet;
    dm_personsID: TFloatField;
    dm_personsNAME: TWideStringField;
    dm_personsDatSrc: TDataSource;
    BankDate: TOracleDataSet;
    BankDateTEK_DAT: TDateTimeField;
    BankDateDatSrc: TDataSource;
    FilialID: TOracleDataSet;
    FilialIDKOD_FIL: TIntegerField;
    FilialIDDatSrc: TDataSource;
    usersDatSrc: TDataSource;
    users: TOracleDataSet;
    usersID: TFloatField;
    usersNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositDataModule: TNewDepositDataModule;

implementation

{$R *.dfm}

uses sboapiDataModuleImpl;

procedure TNewDepositDataModule.DataModuleCreate(Sender: TObject);
begin
   with  DmDataSetArchive do
  begin
    SetVariable('OrderField','cont.id');
    Open;
  end;

   BankDate.Open;
   FilialID.Open;
   Valutes.Open;
   Filials.Open;
   dm_types.Open;
   dm_categories.Open;
   dm_persons.Open;
   users.Open;
end;

procedure TNewDepositDataModule.DataModuleDestroy(Sender: TObject);
begin
  DmDataSetArchive.CloseAll;
  BankDate.Open;
  FilialID.Open;
  Valutes.CloseAll;
  Filials.CloseAll;
  dm_types.CloseAll;
  dm_categories.CloseAll;
  dm_persons.CloseAll;
  users.CloseAll;
end;

end.

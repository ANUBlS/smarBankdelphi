unit dmDepositsArchiveImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmDepositsArchive = class(TDataModule)
    DepositsData: TOracleDataSet;
    DepositsDataID: TFloatField;
    DepositsDataCONTRACTNO: TWideStringField;
    DepositsDataCONTRACTACCNO: TWideStringField;
    DepositsDataVAL_NAME: TWideStringField;
    DepositsDataCUSTOMERNAME: TWideStringField;
    DepositsDataINTERESTACCNO: TWideStringField;
    DepositsDataOPENDATE: TDateTimeField;
    DepositsDataCLOSEDATE: TDateTimeField;
    DepositsDataAMOUNT: TFloatField;
    DepositsDataEKAMOUNT: TFloatField;
    DepositsDataINTEREST: TFloatField;
    DepositsDataFACTICALDEBT: TFloatField;
    DepositsDataEKFACTICALDEBT: TFloatField;
    DepositsDataFACTICALINTERESTDEBT: TFloatField;
    DepositsDataEKFACTICALINTERESTDEBT: TFloatField;
    DepositsDataSTOPCALCULATIONDATE: TDateTimeField;
    DepositsDataCURRENCY: TFloatField;
    DepositsDataPERSONALTYPE: TFloatField;
    DepositsDataCLIENTTYPE: TFloatField;
    DepositsDataBRANCHID: TFloatField;
    DepositsDataCONTRACTTYPE: TIntegerField;
    DepositsDataSTATUS: TFloatField;
    DepositsDataCUSTOMERID: TFloatField;
    DepositsDataUSID: TFloatField;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: TWideStringField;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TWideStringField;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: TWideStringField;
    Categories: TOracleDataSet;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: TWideStringField;
    persons: TOracleDataSet;
    personsID: TFloatField;
    personsNAME: TWideStringField;
    DepositsDataSrc: TDataSource;
    ValutesDatSrc: TDataSource;
    FilialsDatSrc: TDataSource;
    DepositTypesDatSrc: TDataSource;
    CategoriesDatSrc: TDataSource;
    personsDatSrc: TDataSource;
    BankDate: TOracleDataSet;
    BankDateTEK_DAT: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDepositsArchive: TdmDepositsArchive;

implementation

{$R *.DFM}
uses sboapiDatamoduleImpl;

procedure TdmDepositsArchive.DataModuleCreate(Sender: TObject);
begin

  with  DepositsData do
  begin
    SetVariable('OrderField','cont.id');
    Open;
  end;
   Valutes.Open;
   Filials.Open;
   DepositTypes.Open;
   Categories.Open;
   persons.Open;
   BankDate.open;
end;

procedure TdmDepositsArchive.DataModuleDestroy(Sender: TObject);
begin
   DepositsData.CloseAll;
   Valutes.CloseAll;
   Filials.CloseAll;
   DepositTypes.CloseAll;
   Categories.CloseAll;
   persons.CloseAll;
   BankDate.CloseAll;

end;

end.

unit dmDepositsArchiveImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmDepositsArchive = class(TDataModule)
    DepositsData: TOracleDataSet;
    DepositsDataID: TFloatField;
    DepositsDataCONTRACTNO: Twidestringfield;
    DepositsDataCONTRACTACCNO: Twidestringfield;
    DepositsDataVAL_NAME: Twidestringfield;
    DepositsDataCUSTOMERNAME: Twidestringfield;
    DepositsDataINTERESTACCNO: Twidestringfield;
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
    ValutesVALU_NAME: Twidestringfield;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: Twidestringfield;
    DepositTypes: TOracleDataSet;
    DepositTypesID: TFloatField;
    DepositTypesTYPE: Twidestringfield;
    Categories: TOracleDataSet;
    CategoriesID: TFloatField;
    CategoriesCATEGORY: Twidestringfield;
    persons: TOracleDataSet;
    personsID: TFloatField;
    personsNAME: Twidestringfield;
    DepositsDataSrc: TDataSource;
    ValutesDatSrc: TDataSource;
    FilialsDatSrc: TDataSource;
    DepositTypesDatSrc: TDataSource;
    CategoriesDatSrc: TDataSource;
    personsDatSrc: TDataSource;
    BankDate: TOracleDataSet;
    BankDateTEK_DAT: TDateTimeField;
    Tranches: TOracleDataSet;
    TranchesID: TFloatField;
    TranchesTOTAL: TFloatField;
    TranchesHDATE: TDateTimeField;
    TranchesTRID: TFloatField;
    TranchesDatSrc: TDataSource;
    DepositInfoDatSrc: TDataSource;
    DepositInfo: TOracleDataSet;
    DepositInfoNAME: Twidestringfield;
    DepositInfoINTEREST: TFloatField;
    DepositInfoAMOUNT: TFloatField;
    DepositInfoCURRENCY: TFloatField;
    DepositInfoCUSTOMERID: TFloatField;
    Payments: TOracleDataSet;
    PaymentsID: TFloatField;
    PaymentsHDATE: TDateTimeField;
    PaymentsFACTICALDEBT: TFloatField;
    PaymentsINTERESTDEBT: TFloatField;
    PaymentsTRID: TFloatField;
    PaymentsINTTRID: TFloatField;
    PaymentsDatSrc: TDataSource;
    PaymentsBANKDEBT: TFloatField;
    PaymentsBANKINTERESTDEBT: TFloatField;
    PaymentsOVERDUEDEBT: TFloatField;
    PaymentsOVERDUEINTERESTDEBT: TFloatField;
    PaymentsBEFOINTTRID: TFloatField;
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

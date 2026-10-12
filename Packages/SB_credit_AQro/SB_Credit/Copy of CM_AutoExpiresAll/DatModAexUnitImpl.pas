unit DatModAexUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDatModAex = class(TDataModule)
    DatSetExpCredits: TOracleDataSet;
    DatSrcExpCredits: TDataSource;
    DatSetExpCreditsNUMBEROFCREDIT: TStringField;
    DatSetExpCreditsNAME: TStringField;
    DatSetExpCreditsCUSTACCREST: TFloatField;
    DatSetExpCreditsPRINCIPAL: TFloatField;
    DatSetExpCreditsINTEREST: TFloatField;
    DatSetExpCreditsPENALTYREST: TFloatField;
    DatSetPayments: TOracleDataSet;
    DatSetSchedule: TOracleDataSet;
    DatSrcPayments: TDataSource;
    DatSrcSchedule: TDataSource;
    DatSetPaymentsPAYDATE: TDateTimeField;
    DatSetPaymentsPAYEDAMT: TFloatField;
    DatSetPaymentsPAYEDINTAMT: TFloatField;
    DatSetPaymentsPAYEDPENALTYAMT: TFloatField;
    DatSetSchedulePAYMENTDATE: TDateTimeField;
    DatSetSchedulePRINCIPAL: TFloatField;
    DatSetScheduleINTEREST: TFloatField;
    DatSetTranches: TOracleDataSet;
    DatSrcTranches: TDataSource;
    DatSetTranchesTRANCHEDATE: TDateTimeField;
    DatSetTranchesTRANCHEAMOUNT: TFloatField;
    DatSetInterests: TOracleDataSet;
    DatSrcInterests: TDataSource;
    DatSetInterestsHDATE: TDateTimeField;
    DatSetInterestsINTEREST: TFloatField;
    DatSetInterestsDUEINTEREST: TFloatField;
    DatSetInterestsPENALTYINTEREST: TFloatField;
    DatSetPaymentsPAYEDDUEAMT: TFloatField;
    DatSetPaymentsPAYEDDUEINTAMT: TFloatField;
    DatSetExpCreditsID: TFloatField;
    DatSetExpCreditsEXPDATCOUNT: TFloatField;
    DatSetReserves: TOracleDataSet;
    DatSrcReserves: TDataSource;
    DatSetCategories: TOracleDataSet;
    DatSrcPersons: TDataSource;
    DatSetCreditTypes: TOracleDataSet;
    DatSrctCategories: TDataSource;
    DatSetValute: TOracleDataSet;
    DatSrcCreditTypes: TDataSource;
    DatSetFilials: TOracleDataSet;
    DatSrcFilials: TDataSource;
    DatSetPersons: TOracleDataSet;
    DatSrcValute: TDataSource;
    DatSetValuteVALUTE: TIntegerField;
    DatSetValuteVALU_NAME: TStringField;
    DatSetPersonsID: TFloatField;
    DatSetPersonsDESCRIPION: TStringField;
    DatSetCategoriesID: TFloatField;
    DatSetCategoriesDESCRIPTION: TStringField;
    DatSetCreditTypesID: TFloatField;
    DatSetCreditTypesDESCRIPTION: TStringField;
    DatSetReservesID: TFloatField;
    DatSetReservesDESCRIPTION: TStringField;
    DatSetExpCreditsVAL_NAME: TStringField;
    DatSetExpCreditsCONTRACTACCNO: TStringField;
    DatSetExpCreditsCURRENCY: TFloatField;
    DatSetExpCreditsPERSONALTYPE: TFloatField;
    DatSetExpCreditsCUSTOMERTYPE: TFloatField;
    DatSetExpCreditsBRANCHID: TFloatField;
    DatSetExpCreditsCREDITTYPE: TFloatField;
    DatSetExpCreditsRESERVEID: TFloatField;
    DatSetExpCreditsSUMAMT: TFloatField;
    DatSetExpCreditsPLR: TFloatField;
    DatSetExpCreditsOPENDATE: TDateTimeField;
    DatSetExpCreditsCLOSEDATE: TDateTimeField;
    DatSetExpCreditsANNUALYINTERESTRATE: TFloatField;
    DatSetExpCreditsBALACCNO: TFloatField;
    DatSetExpCreditsBOOROWERID: TFloatField;
    DatSetExpCreditsPHONENUMBER: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  DatModAex: TDatModAex;

implementation

{$R *.DFM}
uses CMOracleApiDataModuleImpl;



procedure TDatModAex.DataModuleCreate(Sender: TObject);
begin
   DatSetValute.Open;
   DatSetFilials.open;
   DatSetPersons.open;
   DatSetCategories.open;
   DatSetCreditTypes.open;
   DatSetReserves.open;
end;

procedure TDatModAex.DataModuleDestroy(Sender: TObject);
begin
   DatSetValute.CloseAll;
   DatSetFilials.CloseAll;
   DatSetPersons.CloseAll;
   DatSetCategories.CloseAll;
   DatSetCreditTypes.CloseAll;
   DatSetReserves.CloseAll;

end;

end.

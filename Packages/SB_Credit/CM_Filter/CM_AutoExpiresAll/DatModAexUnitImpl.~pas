unit DatModAexUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDatModAex = class(TDataModule)
    DatSetExpCredits_: TOracleDataSet;
    DatSrcExpCredits: TDataSource;
    DatSetExpCredits_NUMBEROFCREDIT: TStringField;
    DatSetExpCredits_NAME: TStringField;
    DatSetExpCredits_CUSTACCREST: TFloatField;
    DatSetExpCredits_PRINCIPAL: TFloatField;
    DatSetExpCredits_INTEREST: TFloatField;
    DatSetExpCredits_PENALTYREST: TFloatField;
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
    DatSetExpCredits_ID: TFloatField;
    DatSetExpCredits_EXPDATCOUNT: TFloatField;
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
    DatSetExpCredits_VAL_NAME: TStringField;
    DatSetExpCredits_CONTRACTACCNO: TStringField;
    DatSetExpCredits_CURRENCY: TFloatField;
    DatSetExpCredits_PERSONALTYPE: TFloatField;
    DatSetExpCredits_CUSTOMERTYPE: TFloatField;
    DatSetExpCredits_BRANCHID: TFloatField;
    DatSetExpCredits_CREDITTYPE: TFloatField;
    DatSetExpCredits_RESERVEID: TFloatField;
    DatSetExpCredits_SUMAMT: TFloatField;
    DatSetExpCredits_PLR: TFloatField;
    DatSetExpCredits_OPENDATE: TDateTimeField;
    DatSetExpCredits_CLOSEDATE: TDateTimeField;
    DatSetExpCredits_ANNUALYINTERESTRATE: TFloatField;
    DatSetExpCredits_BALACCNO: TFloatField;
    DatSetExpCredits_BOOROWERID: TFloatField;
    DatSetExpCredits_PHONENUMBER: TStringField;
    DatSetExpCredits: TOracleDataSet;
    DatSetExpCreditsID: TFloatField;
    DatSetExpCreditsNUMBEROFCREDIT: TStringField;
    DatSetExpCreditsOPENDATE: TDateTimeField;
    DatSetExpCreditsCLOSEDATE: TDateTimeField;
    DatSetExpCreditsANNUALYINTERESTRATE: TFloatField;
    DatSetExpCreditsBOOROWERID: TFloatField;
    DatSetExpCreditsCONTRACTACCNO: TStringField;
    DatSetExpCreditsVAL_NAME: TStringField;
    DatSetExpCreditsCUSTACCREST: TFloatField;
    DatSetExpCreditsPRINCIPAL: TFloatField;
    DatSetExpCreditsINTEREST: TFloatField;
    DatSetExpCreditsSUMAMT: TFloatField;
    DatSetExpCreditsPENALTYREST: TFloatField;
    DatSetExpCreditsRESERVEID: TFloatField;
    DatSetExpCreditsBALACCNO: TFloatField;
    DatSetExpCreditsNAME: TStringField;
    DatSetExpCreditsOUTDAT: TDateTimeField;
    DatSetExpCreditsPLANREST: TFloatField;
    DatSetExpCreditsCURRENCY: TFloatField;
    DatSetExpCreditsPERSONALTYPE: TFloatField;
    DatSetExpCreditsCUSTOMERTYPE: TFloatField;
    DatSetExpCreditsBRANCHID: TFloatField;
    DatSetExpCreditsCREDITTYPE: TFloatField;
    DatSetExpCreditsDATEOFCONCLUSION: TDateTimeField;
    DatSetExpCreditsDUEDATEFIRSTCONTRACT: TDateTimeField;
    DatSetExpCreditsDUEDATELASTCONTRACT: TDateTimeField;
    DatSetExpCreditsEXDATCOUNT: TFloatField;
    DatSetExpCreditsPHONENUMBER: TStringField;
    OracleDataSet1: TOracleDataSet;
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

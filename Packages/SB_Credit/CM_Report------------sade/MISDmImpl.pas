unit MISDmImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TMISDm = class(TDataModule)
    MISData: TOracleDataSet;
    MISDataID: TFloatField;
    MISDataNUMBEROFCREDIT: TStringField;
    MISDataCONTRACTACCNO: TStringField;
    MISDataINTERESTACCNO: TStringField;
    MISDataDUECONTRACTACCNO: TStringField;
    MISDataDUEINTERESTACCNO: TStringField;
    MISDataRESERVEACCNO: TStringField;
    MISDataDUERESERVEACCNO: TStringField;
    MISDataVAL_NAME: TStringField;
    MISDataNAME: TStringField;
    MISDataDATEOFCONCLUSION: TDateTimeField;
    MISDataDUEDATEFIRSTCONTRACT: TDateTimeField;
    MISDataDUEDATELASTCONTRACT: TDateTimeField;
    MISDataCREDITLINEAMOUNT: TFloatField;
    MISDataANNUALYINTERESTRATE: TFloatField;
    MISDataREST: TFloatField;
    MISDataEKREST: TFloatField;
    MISDataINTERESTREST: TFloatField;
    MISDataEKINT: TFloatField;
    MISDataDUEREST: TFloatField;
    MISDataEKDUEREST: TFloatField;
    MISDataDUEINTERESTREST: TFloatField;
    MISDataEKDUEINT: TFloatField;
    MISDataGIVENAMOUNT: TFloatField;
    MISDataEKGIVENAMOUNT: TFloatField;
    MISDataPERCENT: TFloatField;
    MISDataDUEPERCENT: TFloatField;
    MISDataDESCRIPTION: TStringField;
    MISDataPLEDGEPRICE: TFloatField;
    MISDataPURPOSEOFCREDIT: TStringField;
    MISDataPLEDGENAME: TStringField;
    MISDataHOLDERNAME: TStringField;
    MISDataREGISTRYNO: TStringField;
    MISDataBOOROWERID: TStringField;
    MISDataADDRESS: TStringField;
    MISDataANYINFOTODISTING: TStringField;
    MISDataREGISTRYAGENCY: TStringField;
    MISDataREGISTRYDATE: TDateTimeField;
    MISDataINSURANCEAMOUNT: TFloatField;
    MISDataINSURANCEDATE: TDateTimeField;
    MISDataPHONENUMBER: TStringField;
    MISDataANNUALYPENALTYRATE: TFloatField;
    MISDataPENALTYREST: TFloatField;
    MISDataEKPEN: TFloatField;
    MISDataSTOPCALCDATE: TDateTimeField;
    MISDataLASTINTPAYDATE: TDateTimeField;
    MISDataLASTMAINPAYDATE: TDateTimeField;
    MISDataPRINCIPAL: TFloatField;
    MISDataINTEREST: TFloatField;
    MISDataPSNAME: TStringField;
    MISDataINTCALCMETHOD: TFloatField;
    MISDataBALACCNO: TStringField;
    MISDataBOOROWERACCNO: TStringField;
    MISDataBOORREST: TFloatField;
    MISDataPAYMENTDATEOFREPORTDAT: TDateTimeField;
    DSSReserves: TDataSource;
    SReserves: TOracleDataSet;
    SReservesID: TFloatField;
    SReservesPERCENT: TFloatField;
    SReservesDESCRIPTION: TStringField;
    SReservesFULLDESC: TStringField;
    Pledges: TOracleDataSet;
    DSPledges: TDataSource;
    DSPReserves: TDataSource;
    PReserves: TOracleDataSet;
    PReservesID: TFloatField;
    PReservesPERCENT: TFloatField;
    PReservesDESCRIPTION: TStringField;
    PReservesFULLDESC: TStringField;
    DSCreditTypes: TDataSource;
    CreditTypes: TOracleDataSet;
    Persons: TOracleDataSet;
    DSPersons: TDataSource;
    UsrGrpDataSet: TOracleDataSet;
    srcUsrGrp: TDataSource;
    srcValute: TDataSource;
    ValuteDataSet: TOracleDataSet;
    srcPersonelType: TDataSource;
    PersonelTypeDataSet: TOracleDataSet;
    srcBranch: TDataSource;
    BranchDataSet: TOracleDataSet;
    MISDataCREDITTYPE: TStringField;
    MISDataEBOORREST: TFloatField;
    MISDataINSURANCEAGENCY: TStringField;
    MISDataMONTHPAY: TFloatField;
    MISDataMONTHLYPROFIT: TFloatField;
    MISDataFLINAME: TStringField;
    MISDataSALARY: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SReservesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declaratios }
  end;

var
  MISDm: TMISDm;

implementation

{$R *.DFM}
uses CMOracleAPIDataModuleImpl;

procedure TMISDm.DataModuleCreate(Sender: TObject);
begin
    SReserves.Open;
    Pledges.Open;
    PReserves.Open;
    CreditTypes.Open;
    Persons.Open;

end;

procedure TMISDm.DataModuleDestroy(Sender: TObject);
begin
    SReserves.CloseAll;
    Pledges.CloseAll;
    PReserves.CloseAll;
    CreditTypes.CloseAll;
    Persons.CloseAll;

end;

procedure TMISDm.SReservesCalcFields(DataSet: TDataSet);
begin
   with DataSet do
   FieldByName('FULLDESC').AsString :=
        FieldByName('PERCENT').AsString + '% - ' + FieldByName('DESCRIPTION').AsString;

end;

end.

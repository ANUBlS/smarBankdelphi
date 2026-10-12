unit COBDatModImpl;
                                                                  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

  type  ESearchError = class(Exception);
  type
  TCOBDatMod = class(TDataModule)
    INTCACHEDatSet: TOracleDataSet;
    OUTBDatSrc: TDataSource;
    INTCACHEDatSetID: TFloatField;
    INTCACHEDatSetCURRENCY: TFloatField;
    INTCACHEDatSetBOOROWERID: TFloatField;
    INTCACHEDatSetNUMBEROFCREDIT: TStringField;
    INTCACHEDatSetUSRGROUP: TFloatField;
    INTCACHEDatSetBRANCHID: TFloatField;
    INTCACHEDatSetUSID: TFloatField;
    INTCACHEDatSetCUSTOMERTYPE: TFloatField;
    INTCACHEDatSetPERSONALTYPE: TFloatField;
    INTCACHEDatSetCREDITTYPE: TFloatField;
    INTCACHEDatSetSTOPCALCDATE: TDateTimeField;
    INTCACHEDatSetREST: TFloatField;
    INTCACHEDatSetINTERESTREST: TFloatField;
    INTCACHEDatSetDUEREST: TFloatField;
    INTCACHEDatSetDUEINTERESTREST: TFloatField;
    INTCACHEDatSetCONTRACTACCNO: TStringField;
    INTCACHEDatSetVAL_NAME: TStringField;
    INTCACHEDatSetNAME: TStringField;
    INTCACHEDatSetINTEREST: TFloatField;
    INTCACHEDatSetDUEINTEREST: TFloatField;
    INTCACHEDatSetTRPROCESSED: TFloatField;
    CM_CALCINOUTBALANCE: TOraclePackage;
    DateInOut: TOracleDataSet;
    DateInOutTEK_DAT: TDateTimeField;
    DateInOutPRED_DAT: TDateTimeField;
    DateInOutARC_DAY: TDateTimeField;
    DateInOutCLOSE: TIntegerField;
    DateInOutDatSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COBDatMod: TCOBDatMod;

implementation

{$R *.DFM}

Uses CMOracleApiDataModuleImpl;

end.

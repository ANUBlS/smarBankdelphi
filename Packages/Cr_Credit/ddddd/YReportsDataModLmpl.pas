unit YReportsDataModLmpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TYReportsDataMod = class(TDataModule)
    Branches: TOracleDataSet;
    CurrencysSrc: TDataSource;
    BranchesSrc: TDataSource;
    Currencys: TOracleDataSet;
    CurrencysVALUTE: TIntegerField;
    CurrencysVALU_NAME: TWideStringField;
    sysdat: TOracleDataSet;
    sysdatTEK_DAT: TDateTimeField;
    sysdatPRED_DAT: TDateTimeField;
    sysdatARC_DAY: TDateTimeField;
    sysdatCLOSE: TIntegerField;
    sysdatSrc: TDataSource;
    Persons: TOracleDataSet;
    PersonsSrc: TDataSource;
    Types: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TWideStringField;
    TypesSrc: TDataSource;
    Categories: TOracleDataSet;
    CategoriesSrc: TDataSource;
    Periods: TOracleDataSet;
    PeriodsSrc: TDataSource;
    CustNames: TOracleDataSet;
    CustNamesSrc: TDataSource;
    Customers: TOracleDataSet;
    CustomersSrc: TDataSource;
    RepForms: TOracleDataSet;
    RepFormsSrc: TDataSource;
    CreditsDSSrc: TDataSource;
    CreditsDS: TOracleDataSet;
    ResultDS: TOracleDataSet;
    ResultDSODEME_EMSALI: TFloatField;
    ResultDSCREDITID: TFloatField;
    ResultDSBOOROWERID: TFloatField;
    ResultDSCRDNUM: TWideStringField;
    ResultDSBOOROWERNAME: TWideStringField;
    ResultDSBRANCHID: TFloatField;
    ResultDSBRANCH: TWideStringField;
    ResultDSDISTRICTID: TFloatField;
    ResultDSDISTRICT: TWideStringField;
    ResultDSVILLAGE: TWideStringField;
    ResultDSCREDPERIOD: TWideStringField;
    ResultDSDESCRIPION: TWideStringField;
    ResultDSSEX: TWideStringField;
    ResultDSPURPOSE: TWideStringField;
    ResultDSSFERADAY: TWideStringField;
    ResultDSPURPOSEOFCREDIT: TWideStringField;
    ResultDSPURPOSEID: TFloatField;
    ResultDSTYPEID: TFloatField;
    ResultDSTYPEDESC: TWideStringField;
    ResultDSCRDCOUNT: TFloatField;
    ResultDSPAYEDCRDCOUNT: TFloatField;
    ResultDSDATEOFCONCLUSION: TDateTimeField;
    ResultDSFIRSTTRCHDATE: TDateTimeField;
    ResultDSLASTPAYDATE: TDateTimeField;
    ResultDSPROLONGCNT: TFloatField;
    ResultDSPROLONGDATE: TDateTimeField;
    ResultDSCURRENCY: TWideStringField;
    ResultDSKURUS: TFloatField;
    ResultDSINTRATE: TFloatField;
    ResultDSODRATE: TFloatField;
    ResultDSKRXET: TFloatField;
    ResultDSGIVENAMOUNT: TFloatField;
    ResultDSDATEDEBTMAIN: TFloatField;
    ResultDSPAYEDMAIN: TFloatField;
    ResultDSPAYEDMONMAIN: TFloatField;
    ResultDSDEBTMAIN: TFloatField;
    ResultDSDEBTOVERMAIN: TFloatField;
    ResultDSLATEDAY: TFloatField;
    ResultDSCALCULATEDPERCENT: TFloatField;
    ResultDSDATEDEBTINT: TFloatField;
    ResultDSPAYEDINT: TFloatField;
    ResultDSPAYEDMONINT: TFloatField;
    ResultDSDEBTINT: TFloatField;
    ResultDSDEBTOVERINT: TFloatField;
    ResultDSGECGUNFAIZ: TFloatField;
    ResultDSLOANACCID: TWideStringField;
    ResultDSBOOROWERACCID: TWideStringField;
    ResultDSBOOROWERACCREST: TFloatField;
    ResultDSADDRESS: TWideStringField;
    ResultDSPHONENUMBER: TWideStringField;
    ResultDSSALARY: TWideStringField;
    ResultDSDESCRIPTION: TWideStringField;
    ResultDSGIROVREST: TFloatField;
    ResultDSDUEBYSCHEME: TFloatField;
    ResultDSCALCSTATUS: TWideStringField;
    ResultDSRESERVE: TWideStringField;
    ResultDSPRIMARYRESERVEAREST: TFloatField;
    ResultDSPRIMARYPURRESERVEAREST: TFloatField;
    ResultDSPRET: TFloatField;
    ResultDSIDD: TFloatField;
    ResultDSQATN: TFloatField;
    ResultDSICRA: TFloatField;
    ResultDSEXPERT__NAME: TWideStringField;
    ResultDSPAYMENTDATE: TDateTimeField;
    ResultDSPRINCIPAL: TFloatField;
    ResultDSINTEREST: TFloatField;
    ResultDSCEM: TFloatField;
    ResultDSADIYAT: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YReportsDataMod: TYReportsDataMod;

implementation
  uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TYReportsDataMod.DataModuleCreate(Sender: TObject);
begin
Currencys.open;
Branches.open;
sysdat.open;
Persons.open;
Types.open;
Categories.open;
Periods.open;
CustNames.open;
Customers.open;
RepForms.open;
CreditsDS.open;

end;

procedure TYReportsDataMod.DataModuleDestroy(Sender: TObject);
begin
Currencys.Close;
Branches.close;
sysdat.Close;
Persons.close;
Types.close;
Categories.close;
Periods.close;
CustNames.close;
Customers.close;
RepForms.Close;
CreditsDS.CloseAll;
ResultDS.close;
end;

end.

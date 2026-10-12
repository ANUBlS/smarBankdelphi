unit crReCalculationDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Oracle, Db, OracleData, Grids;

type
  TCrPRDataModule = class(TDataModule)
    CalculatorPackage: TOraclePackage;
    IntCache: TOracleDataSet;
    DataSrcIntCache: TDataSource;
    IntCacheID: TFloatField;
    IntCacheCURRENCY: TFloatField;
    IntCacheBOOROWERID: TFloatField;
    IntCacheNUMBEROFCREDIT: TWideStringField;
    IntCacheUSRGROUP: TFloatField;
    IntCacheBRANCHID: TFloatField;
    IntCacheUSID: TFloatField;
    IntCacheSTOPCALCDATE: TDateTimeField;
    IntCacheREST: TFloatField;
    IntCacheINTERESTREST: TFloatField;
    IntCacheDUEREST: TFloatField;
    IntCacheDUEINTERESTREST: TFloatField;
    IntCacheCONTRACTACCNO: TWideStringField;
    IntCacheVAL_NAME: TWideStringField;
    IntCacheNAME: TWideStringField;
    IntCacheINTEREST: TFloatField;
    IntCacheDUEINTEREST: TFloatField;
    IntCacheTRPROCESSED: TFloatField;
    IntCacheCUSTOMERTYPE: TFloatField;
    IntCachePERSONALTYPE: TFloatField;
    IntCacheCREDITTYPE: TFloatField;
    cr_autoexp: TOraclePackage;
    IntCachePENALTYINTEREST: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrPRDataModule: TCrPRDataModule;

implementation

{$R *.DFM}

uses SboapiDataModuleImpl;

procedure TCrPRDataModule.DataModuleCreate(Sender: TObject);
begin
  with IntCache do
  Open;
end;

end.

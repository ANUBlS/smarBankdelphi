unit ReCalculationDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Oracle, Db, OracleData, Grids;

type
  TPRDataModule = class(TDataModule)
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
    IntCacheINTEREST: TFloatField;
    IntCacheDUEINTEREST: TFloatField;
    IntCacheTRPROCESSED: TFloatField;
    IntCacheCUSTOMERTYPE: TFloatField;
    IntCachePERSONALTYPE: TFloatField;
    IntCacheCREDITTYPE: TFloatField;
    cm_autoexp: TOraclePackage;
    IntCachePENALTYINTEREST: TFloatField;
    IntCacheNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PRDataModule: TPRDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TPRDataModule.DataModuleCreate(Sender: TObject);
begin
  with IntCache do
  Open;
end;

end.

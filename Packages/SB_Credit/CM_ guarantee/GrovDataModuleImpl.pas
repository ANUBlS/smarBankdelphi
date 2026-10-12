unit GrovDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TGrovDataMod = class(TDataModule)
    GirovDataSrc: TDataSource;
    GirovDataSet: TOracleDataSet;
    PropDataSet: TOracleDataSet;
    PropSourc: TDataSource;
    SbGirovSet: TOracleDataSet;
    SbGirovSetID: TFloatField;
    SbGirovSetCREDITID: TFloatField;
    SbGirovSetNUMBEROFGUR: TStringField;
    SbGirovSetPLEDGEID: TFloatField;
    SbGirovSetPLEDGENAME: TStringField;
    SbGirovSetHOLDERNAME: TStringField;
    SbGirovSetHOLDERADDRESS: TStringField;
    SbGirovSetANYINFOTODISTING: TStringField;
    SbGirovSetREGISTRYNO: TStringField;
    SbGirovSetREGISTRYAGENCY: TStringField;
    SbGirovSetREGISTRYDATE: TDateTimeField;
    SbGirovSetPLEDGEINUSE: TFloatField;
    SbGirovSetPLEDGEINSURANT: TFloatField;
    SbGirovSetINSURANCEAGENCY: TFloatField;
    SbGirovSetINSURANCEAMOUNT: TFloatField;
    SbGirovSetINSURANCEDATE: TDateTimeField;
    SbGirovSetPLEDGEPRICETORPAQHA: TFloatField;
    SbGirovSetPLEDGEPRICEEVKV: TFloatField;
    SbGirovSetGQNAME: TStringField;
    SbGirovSetGQPASPNUM: TStringField;
    SbGirovSetGQPASPYER: TStringField;
    SbGirovSetGQPASPDATE: TDateTimeField;
    SbGirovSetGQCITY: TFloatField;
    SbGirovSetGQVILLAGE: TFloatField;
    SbGirovSetGQADRES: TStringField;
    SbGirovSetGQTELMOB: TStringField;
    SbGirovSetGQTELHOME: TStringField;
    SbGirovSetGQTELWORK: TStringField;
    SbGirovSetTESVIRI: TStringField;
    SbGirovSetREYSTER: TStringField;
    SbGirovSetSERYAMH: TStringField;
    SbGirovSetPLEDGEPRICE: TFloatField;
    SbGirovSetPLEDGSORTS: TFloatField;
    SbGirovSetCOMPANY: TFloatField;
    SbGirovSetCOMPANYDAT: TDateTimeField;
    SbGirovSetCOMPANYEXPERT: TStringField;
    SbGirovSetBRANCE: TFloatField;
    SbGirovSetDAT: TDateTimeField;
    SBGirovSrc: TDataSource;
    CRackage: TOraclePackage;
    TeminatDataSet: TOracleDataSet;
    TeminatSourc: TDataSource;
    GPledges: TOracleDataSet;
    DataSrcGPledges: TDataSource;
    SbGirovSetINSURANCERIGHT: TFloatField;
    proSorts: TOracleDataSet;
    proSortsID: TIntegerField;
    proSortsNAME: TStringField;
    ProSortsDatSrc: TDataSource;
    FilialSrc: TDataSource;
    FilialSet: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1NAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GrovDataMod: TGrovDataMod;

implementation
uses CMOracleAPIDataModuleImpl;
{$R *.DFM}

procedure TGrovDataMod.DataModuleCreate(Sender: TObject);
begin
GirovDataSet.open;
PropDataSet.open;
SbGirovSet.open;
//TeminatDataSet.open;
GPledges.Open;
proSorts.open  ;
FilialSet.open;
OracleDataSet1.open;
end;

procedure TGrovDataMod.DataModuleDestroy(Sender: TObject);
begin
GirovDataSet.closeall;
PropDataSet.closeall;
SbGirovSet.closeall;
//TeminatDataSet.closeall;
GPledges.closeall;
proSorts.closeall;
FilialSet.closeall;
OracleDataSet1.closeall;
end;

end.

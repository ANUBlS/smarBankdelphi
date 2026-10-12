unit DatModN2SdImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDatModN2Sd = class(TDataModule)
    ValDatSet: TOracleDataSet;
    RegDatSet: TOracleDataSet;
    BrDatSet: TOracleDataSet;
    ResultDatSet: TOracleDataSet;
    ValDatSrc: TDataSource;
    RegDatSrc: TDataSource;
    BrDatSrc: TDataSource;
    ResultDatSetREGION_NAME: TStringField;
    ResultDatSetSUMGENERALAMT: TFloatField;
    ResultDatSetSUMNATVALAMT: TFloatField;
    ResultDatSetSUMFREEVALAMT: TFloatField;
    ResultDatSetSUMEXPIRESAMT: TFloatField;
    CrdinfoDatSet: TOracleDataSet;
    CM_N3_SD: TOraclePackage;
    PeriodDatSet: TOracleDataSet;
    PeriodDatSrc: TDataSource;
    PeriodDatSetPERIOD: TFloatField;
    ResultDatSetAVGAMT: TFloatField;
    ResultDatSetAVGNATVALAMT: TFloatField;
    ResultDatSetAVGFREEVALAMT: TFloatField;
    ResultDatSetSUMUM_SDV_MV: TFloatField;
    ResultDatSetUM_SDV_ORTA: TFloatField;
    ResultDatSetSUMREST: TFloatField;
    ResultDatSetINTREST_ORTA: TFloatField;
    ResultDatSetSUMREST_MV: TFloatField;
    ResultDatSetINTREST_ORTA_MV: TFloatField;
    ResultDatSetSUMREST_SDV: TFloatField;
    ResultDatSetINT_SDV_ORTA: TFloatField;
    CrdinfoDatSetID: TFloatField;
    CrdinfoDatSetCURRENCY: TFloatField;
    CrdinfoDatSetCUSTOMERTYPE: TFloatField;
    CrdinfoDatSetBRANCHID: TFloatField;
    CrdinfoDatSetPERIOD: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatModN2Sd: TDatModN2Sd;

implementation

{$R *.DFM}
uses CMOracleAPIDataModuleImpl;

procedure TDatModN2Sd.DataModuleCreate(Sender: TObject);
begin
   ValDatSet.Open;
   RegDatSet.Open;
   BrDatSet.Open;
   CrdinfoDatSet.Open;
   PeriodDatSet.Open;
end;

procedure TDatModN2Sd.DataModuleDestroy(Sender: TObject);
begin
   ValDatSet.CloseAll;
   RegDatSet.CloseAll;
   BrDatSet.CloseAll;
   PeriodDatSet.CloseAll;
   CrdinfoDatSet.CloseAll;
end;

end.

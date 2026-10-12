unit IntCalcDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, DB, OracleData;

type
  TDefineCalcDatMod = class(TDataModule)
    CM_CREDITS: TOraclePackage;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2CREDITID: TFloatField;
    OracleDataSet2HDATE: TDateTimeField;
    OracleDataSet2ENDDAT: TDateTimeField;
    OracleDataSet2INTEREST: TFloatField;
    OracleDataSet2DUEINTEREST: TFloatField;
    OracleDataSet2STATUS: TFloatField;
    OracleDataSet2STARTDAT: TDateTimeField;
    OracleDataSet2faiz: TWideStringField;
    OracleDataSet2duefaiz: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure OracleDataSet2CalcFields(DataSet: TDataSet);
    procedure OracleDataSet3CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DefineCalcDatMod: TDefineCalcDatMod;

implementation

{$R *.DFM}
uses
  sboapiDataModuleImpl;

procedure TDefineCalcDatMod.DataModuleCreate(Sender: TObject);
begin
OracleDataSet2.Open;
end;

procedure TDefineCalcDatMod.DataModuleDestroy(Sender: TObject);
begin
OracleDataSet2.Close;
end;

procedure TDefineCalcDatMod.OracleDataSet2CalcFields(DataSet: TDataSet);
begin
{if OracleDataSet2INTEREST.IsNull then
if OracleDataSet2INTEREST.AsInteger=1 then
 OracleDataSet2faiz.AsString:='Faiz dayanıb'  ;

 if not OracleDataSet2DUEINTEREST.IsNull then
 if OracleDataSet2DUEINTEREST.AsInteger=1 then
  OracleDataSet2duefaiz.AsString:='Gec faiz dayanıb'   ;

  if not OracleDataSet2STATUS.IsNull then
  if OracleDataSet2STATUS.AsInteger=1 then
  begin
   OracleDataSet2duefaiz.AsString:='Tam dayanıb'   ;
   OracleDataSet2faiz.AsString:='Tam dayanıb'  ;
  end;   }
end;

procedure TDefineCalcDatMod.OracleDataSet3CalcFields(DataSet: TDataSet);
begin
if OracleDataSet2INTEREST.IsNull then
if OracleDataSet2INTEREST.AsInteger=1 then
 OracleDataSet2faiz.AsString:='Faiz dayanıb'  ;

 if not OracleDataSet2DUEINTEREST.IsNull then
 if OracleDataSet2DUEINTEREST.AsInteger=1 then
  OracleDataSet2duefaiz.AsString:='Gec faiz dayanıb'   ;

  if not OracleDataSet2STATUS.IsNull then
  if OracleDataSet2STATUS.AsInteger=1 then
  begin
   OracleDataSet2duefaiz.AsString:='Tam dayanıb'   ;
   OracleDataSet2faiz.AsString:='Tam dayanıb'  ;
  end;
end;

end.

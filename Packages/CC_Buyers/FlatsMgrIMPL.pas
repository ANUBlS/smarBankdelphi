unit FlatsMgrIMPL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, ImgList, OracleData, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TFlatsMgrForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    companie: TOracleDataSet;
    companieCOMP_NAME: TWideStringField;
    companieID: TIntegerField;
    building: TOracleDataSet;
    buildingID: TFloatField;
    buildingCOMP_ID: TFloatField;
    buildingBLD_NAME: TWideStringField;
    buildingENTRANCES: TFloatField;
    buildingADDRESS: TWideStringField;
    buildingFLATS: TFloatField;
    flat: TOracleDataSet;
    flatID: TFloatField;
    flatBLD_ID: TFloatField;
    flatFLATNUMBER: TWideStringField;
    flatENTRANCE: TWideStringField;
    flatFFLOOR: TWideStringField;
    flatROOMS: TFloatField;
    flatAREA: TFloatField;
    flatPRICE1: TFloatField;
    flatPRICEGEN: TFloatField;
    flatBUYER: TFloatField;
    flatUSERID: TFloatField;
    flatBUYER_STATUS: TWideStringField;
    flatCODE: TWideStringField;
    StatusImages: TImageList;
    flatsDatSrc: TDataSource;
    buildingsDatSrc: TDataSource;
    companiesDatSrc: TDataSource;
    EditFlatCode: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid3: TDBGrid;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure companieAfterScroll(DataSet: TDataSet);
    procedure buildingAfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure flatCalcFields(DataSet: TDataSet);
    procedure flatAfterPost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlatsMgrForm: TFlatsMgrForm;

implementation
uses sboapiDataModuleImpl,Contractimpl, DatModConstimpl;
{$R *.DFM}

procedure TFlatsMgrForm.BitBtn2Click(Sender: TObject);
begin
flat.Close;
building.Close;
companie.Close;
end;

procedure TFlatsMgrForm.BitBtn3Click(Sender: TObject);
begin
with flat do
begin
  edit;
  FieldByName('pricegen').AsFloat:=FieldByName('area').AsFloat*FieldByName('price1').AsFloat;
  post;
end;
end;

procedure TFlatsMgrForm.buildingAfterScroll(DataSet: TDataSet);
begin
with flat do
begin
  Filter:='BLD_ID='+building.FieldByName('ID').AsString;
  Filtered:=False;
  Filtered:=True;
end;
end;

procedure TFlatsMgrForm.companieAfterScroll(DataSet: TDataSet);
begin
  with building do
  begin
  Filter:='comp_id='+companie.FieldByName('ID').AsString;
  Filtered:=False;
  Filtered:=True;
  end;
end;

procedure TFlatsMgrForm.flatAfterPost(DataSet: TDataSet);
begin
with DataSet do
begin
  FieldByName('pricegen').AsFloat:=FieldByName('area').AsFloat*FieldByName('price1').AsFloat;
end;
end;

procedure TFlatsMgrForm.flatCalcFields(DataSet: TDataSet);
begin
{with DataSet do
begin
  FieldByName('pricegen').AsFloat:=FieldByName('area').AsFloat*FieldByName('price1').AsFloat;
end;}
end;

procedure TFlatsMgrForm.FormCreate(Sender: TObject);
begin
companie.open;
building.open;
flat.open
end;

procedure TFlatsMgrForm.SpeedButton1Click(Sender: TObject);
begin
if EditFlatCode.Text='' then
exit;
with flat do
begin
  Filter:='CODE='+EditFlatCode.Text;
  Filtered:=False;
  Filtered:=True;
end;
with building do
begin
  Filter:='ID='+flat.FieldByName('BLD_ID').AsString;
  Filtered:=False;
  Filtered:=True;
end;
  companie.Locate('ID', building.FieldByName('COMP_ID').AsString, []);
  flat.Locate('Code', EditFlatCode.Text,[]);
end;

procedure TFlatsMgrForm.BitBtn1Click(Sender: TObject);
begin
with  FrmContract do begin
    Edit6.text := floattostr(FlatsMgrForm.flat.FieldByName('PRICEGEN').AsFloat);
    Edit1.text := FlatsMgrForm.building.FieldByName('BLD_NAME').AsString;
    Edit2.text := FlatsMgrForm.flat.FieldByName('ENTRANCE').AsString ;
    Edit3.text := FlatsMgrForm.flat.FieldByName('FLATNUMBER').AsString ;
    Edit4.text := floattostr(FlatsMgrForm.flat.FieldByName('AREA').AsFloat) ;
    Edit5.text := inttostr(FlatsMgrForm.flat.FieldByName('ROOMS').AsInteger) ;
    EditPrice1.Text := FloatToStr(FlatsMgrForm.flat.FieldByName('PRICE1').AsFloat);
    EditFlatCode.Text := FlatsMgrForm.flat.FieldByName('CODE').AsString ;
    DBNumberEditEh7.Text:=FloatToStr(FlatsMgrForm.flat.FieldByName('PRICE1').AsFloat);
  end;

    DatModConstr.CreditPurpose.FieldByName('area').asfloat:=FlatsMgrForm.flat.FieldByName('area').AsFloat;
    DatModConstr.CreditPurpose.FieldByName('FLATID').AsInteger:= FlatsMgrForm.flat.FieldByName('id').AsInteger ;
    DatModConstr.CreditPurpose.FieldByName('price1').asfloat:=FlatsMgrForm.flat.FieldByName('price1').AsFloat;
   close;
end;

end.

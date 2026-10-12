unit actImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, OracleData, StdCtrls, Grids, DBGrids;

type
  TActFrom = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet3: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBNavigator1: TDBNavigator;
    DBNavigator3: TDBNavigator;
    GroupBox2: TGroupBox;
    DBNavigator2: TDBNavigator;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1NAME: TStringField;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2DESCRIPTION: TStringField;
    OracleDataSet2ACT_ID: TFloatField;
    OracleDataSet2NEWID: TFloatField;
    OracleDataSet3ACT_ID: TFloatField;
    OracleDataSet3NAME: TStringField;
    OracleDataSet3ACT_TYPE_ID: TFloatField;
    OracleDataSet4: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DataSource4: TDataSource;
    OracleDataSet5: TOracleDataSet;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    DataSource5: TDataSource;
    OracleDataSet1KOD: TStringField;
    OracleDataSet2BANK_KOD: TStringField;
    OracleDataSet3KOD: TStringField;
    GroupBox4: TGroupBox;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    GroupBox5: TGroupBox;
    DBNavigator5: TDBNavigator;
    DBGrid5: TDBGrid;
    OracleDataSet6: TOracleDataSet;
    DataSource6: TDataSource;
    OracleDataSet7: TOracleDataSet;
    DataSource7: TDataSource;
    OracleDataSet6ID: TFloatField;
    OracleDataSet6NAME: TStringField;
    OracleDataSet6KOD: TStringField;
    OracleDataSet6ACT_Q_ID: TFloatField;
    OracleDataSet7ID: TFloatField;
    OracleDataSet7NAME: TStringField;
    OracleDataSet7KOD: TStringField;
    OracleDataSet7ACT_AR_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActFrom: TActFrom;
  procedure InitPlugin(s:string);export;

implementation
uses CommonDecls,systemstate,CMOracleApiDataModuleImpl;
{$R *.DFM}

procedure InitPlugin(s:string);export;
begin
   ActFrom.ShowModal;
end;
exports
     InitPlugin;
procedure TActFrom.FormCreate(Sender: TObject);
begin
OracleDataSet1.open;
OracleDataSet2.open;
OracleDataSet3.open;
OracleDataSet6.open;
OracleDataSet7.open;
end;

procedure TActFrom.FormDestroy(Sender: TObject);
begin
OracleDataSet1.close;
OracleDataSet2.close;
OracleDataSet3.close;
OracleDataSet6.close;
OracleDataSet7.close;
end;

procedure TActFrom.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TActFrom.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(key) = VK_ESCAPE then close
end;

initialization
 ActFrom := TActFrom.Create(CommonApplication);
 end.

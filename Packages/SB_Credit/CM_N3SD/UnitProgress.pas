unit UnitProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, OracleData, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons;

type
  TFormProgress = class(TForm)
    DataSource3: TDataSource;
    OracleDataSet3: TOracleDataSet;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1CATID: TFloatField;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DBNavigator1: TDBNavigator;
    OracleDataSet1NAME: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgress: TFormProgress;

implementation
uses SboAPIDataModuleImpl,CtagoriesImpl,SBTranslateProc;
{$R *.DFM}

procedure TFormProgress.FormCreate(Sender: TObject);
begin
OracleDataSet1.open;
OracleDataSet3.open;
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormProgress.FormDestroy(Sender: TObject);
begin
OracleDataSet1.close  ;
OracleDataSet3.close;
end;

procedure TFormProgress.SpeedButton1Click(Sender: TObject);
begin
FrmCatagories := TFrmCatagories.Create(self);
//OracleDataSet1.Insert;
 FrmCatagories.ShowModal;

end;

procedure TFormProgress.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    close;
end;

procedure TFormProgress.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.

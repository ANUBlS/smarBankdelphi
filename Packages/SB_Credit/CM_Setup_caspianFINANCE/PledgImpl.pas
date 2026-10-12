unit PledgImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBCtrls, Db, OracleData, ExtCtrls, Grids, DBGridEh, DBGrids, StdCtrls,
  DBGridEhGrouping, GridsEh;

type
  TPledgForm = class(TForm)
    Panel1: TPanel;
    DataSourcePlegds: TDataSource;
    Plegds: TOracleDataSet;
    DBNavigator1: TDBNavigator;
    PlegdsTYPECODE: TWideStringField;
    PlegdsDESCRIPTION: TWideStringField;
    PlegdsNEEDPLACEOUT: TFloatField;
    PlegdsTEMID: TFloatField;
    PlegdsID: TFloatField;
    PlegdsPURCODE: TWideStringField;
    PlegdsOUTBAL_CIN: TWideStringField;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1NAME: TWideStringField;
    OracleDataSet1PLDID: TFloatField;
    OracleDataSet1HESABKOD: TWideStringField;
    OracleDataSet1OUTBAL_CIN: TWideStringField;
    PlegdsPECENT: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PledgForm: TPledgForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TPledgForm.FormShow(Sender: TObject);
begin

  Plegds.open;
  OracleDataSet1.Open;
end;

procedure TPledgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Plegds.CloseAll;
  OracleDataSet1.CloseAll;
end;

procedure TPledgForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TPledgForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close
end;

end.

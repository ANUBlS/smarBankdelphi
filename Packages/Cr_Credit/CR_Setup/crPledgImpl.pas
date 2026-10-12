unit crPledgImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBCtrls, Db, OracleData, ExtCtrls, Grids, DBGridEh;

type
  TPledgForm = class(TForm)
    Panel1: TPanel;
    DataSourcePlegds: TDataSource;
    Plegds: TOracleDataSet;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    DBGridEh2: TDBGridEh;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1TYPECODE: TWideStringField;
    OracleDataSet1DESCRIPTION: TWideStringField;
    PlegdsTYPECODE: TWideStringField;
    PlegdsNEEDPLACEOUT: TFloatField;
    PlegdsTEMID: TFloatField;
    PlegdsDESCRIPTION: TWideStringField;
    DBGridEh1: TDBGridEh;
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
OracleDataSet1.open;
  Plegds.open;
end;

procedure TPledgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Plegds.CloseAll;
 OracleDataSet1.closeall;
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

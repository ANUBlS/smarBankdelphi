unit PledgImpl;

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
    DBGridEh1: TDBGridEh;
    PlegdsTYPECODE: TWideStringField;
    PlegdsDESCRIPTION: TWideStringField;
    PlegdsNEEDPLACEOUT: TFloatField;
    PlegdsTEMID: TFloatField;
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
end;

procedure TPledgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Plegds.CloseAll;

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

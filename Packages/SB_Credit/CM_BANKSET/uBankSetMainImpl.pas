unit uBankSetMainImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, OracleData;

type
  TfrmBankSet = class(TForm)
    BSettings: TOracleDataSet;
    bSet: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBankSet: TfrmBankSet;
           
procedure InitPlugin(S : String); export;

implementation

uses sboapiDataModuleImpl;

procedure InitPlugin(S : String); export;
begin

    frmBankSet.ShowModal;
end;

exports
  InitPlugin;

{$R *.DFM}
       
procedure TfrmBankSet.FormCreate(Sender: TObject);
begin
  BSettings.Open;
end;

initialization
  frmBankSet := TfrmBankSet.Create(Application);

end.

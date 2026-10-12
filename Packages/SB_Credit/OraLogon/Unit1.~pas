unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OraLogon, Grids, DBGrids, Db, OracleData, Oracle;

type
  TForm1 = class(TForm)
    OraLogon1: TOraLogon;
    OracleSession1: TOracleSession;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
   with OraLogon1,Session do
   begin
      Execute;
      if not Connected then
      Application.Terminate;
      OracleDataSet1.Open;
   end;
end;

end.

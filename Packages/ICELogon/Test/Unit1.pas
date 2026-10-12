unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Grids, DBGrids, Oracle, OracleData, ICECrypt, ICEOralogon;

type
  TForm1 = class(TForm)
    ICEOralogon1: TICEOralogon;
    ICECrypt1: TICECrypt;
    OracleDataSet1: TOracleDataSet;
    OracleSession1: TOracleSession;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  OracleDataSet1.open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ICEOralogon1.Execute<>1 then begin
      ShowMessage(ICEOralogon1.GetErrorStr);
      Application.Terminate;
  end;
end;

end.

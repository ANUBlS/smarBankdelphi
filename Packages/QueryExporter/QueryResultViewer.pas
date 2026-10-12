unit QueryResultViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, ExcelExporter, Db, OracleData;

type
  TResultForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ResultQuery: TOracleDataSet;
    DataSrcResult: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResultForm: TResultForm;

implementation

uses QueryExporterImpl;

{$R *.DFM}

procedure TResultForm.Button1Click(Sender: TObject);
begin
  ResultExporter.Report
end;

procedure TResultForm.Button2Click(Sender: TObject);
begin
  Close;
end;

end.

unit unitreferen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls;

type
  Tformreference = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formreference: Tformreference;

implementation

{$R *.DFM}

procedure Tformreference.FormShow(Sender: TObject);
begin
 DBGrid1.DataSource.DataSet.Open
end;

procedure Tformreference.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DBGrid1.DataSource.DataSet.Close;
end;

end.

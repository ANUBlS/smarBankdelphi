unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData;

type
  TForm7 = class(TForm)
    OracleDataSet1: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses sboapiDataModuleImpl,MainUnitImpl;
{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
OracleDataSet1.Open;
dd:=20;
end;

end.

unit UnitFormcust_other_change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, OracleData, GridsEh, DBGridEh;

type
  TFormcust_other_change = class(TForm)
    DBGridEh1: TDBGridEh;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1NAME: TWideStringField;
    DataSource1: TDataSource;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
  v_name:string;
    { Public declarations }
  end;

var
  Formcust_other_change: TFormcust_other_change;

implementation

{$R *.dfm}

procedure TFormcust_other_change.DBGridEh1DblClick(Sender: TObject);
begin
 v_name:=OracleDataSet1NAME.AsString;
     Formcust_other_change.Close;
     OracleDataSet1.Refresh;
end;

end.

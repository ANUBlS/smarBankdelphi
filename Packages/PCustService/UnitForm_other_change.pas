unit UnitForm_other_change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, OracleData, GridsEh, DBGridEh;

type
  TForm_other_change = class(TForm)
    DBGridEh1: TDBGridEh;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet1NAME: TWideStringField;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    v_name :string;
    { Public declarations }
  end;


var
  Form_other_change: TForm_other_change;


implementation
   uses sboapiDataModuleImpl;
{$R *.dfm}

procedure TForm_other_change.DBGridEh1DblClick(Sender: TObject);

begin
     v_name:=OracleDataSet1NAME.AsString;
     Form_other_change.Close;
     OracleDataSet1.Refresh;
end;

end.

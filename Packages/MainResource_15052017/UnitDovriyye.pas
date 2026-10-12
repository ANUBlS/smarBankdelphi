unit UnitDovriyye;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids, Db, OracleData, Oracle, StdCtrls, ComCtrls;

type
  TTurnoverForm = class(TForm)
    GroupBox1: TGroupBox;
    TimePicer_b: TDateTimePicker;
    TimePicker_s: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Edit_min: TEdit;
    Edit_max: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    OracleSession1: TOracleSession;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TurnoverForm: TTurnoverForm;

implementation

{$R *.DFM}

procedure TTurnoverForm.SpeedButton1Click(Sender: TObject);
 var
    min, max, s_min_d, s_max_d, s_min_k, s_max_k, s_date_bas, s_date_son, s :string;
begin
   min:=Edit_min.Text;
   max:=Edit_max.Text;

 if min='' then
  begin
    s_min_d:='';
    s_min_k:='' ;
  end
 else
  begin
    s_min_d:=' ar.obr_d > ' + min;
    s_min_k:=' ar.obr_k > ' + min;
  end;
 if max='' then
  begin
    s_max_d:='';
    s_max_k:='';
  end
 else
  begin
    s_max_d:=' ar.obr_d < ' + max;
    s_min_k:=' ar.obr_k < ' + max;
  end;
s:='SELECT c.id, c.name,ac.acc_no, ac.name, ar.pok_obr_d, ar.pok_obr_k';
 s:=s+' FROM customers c, ACCOUNT ac, archost ar  WHERE c.ID = ac.kli_id';
   s:=s+' AND ac.ID = ar.acc_id and '+ s_min_d+' and '+s_max_d;
     s:=s+' and '+s_min_k+' and '+s_max_k;
       s:=s+ ' AND ar.datdate > ''16-jun-2006''  AND ar.datdate < ''20-jun-2006''';

  OracleDataSet1.SQL.Clear;
   OracleDataSet1.SQL.Add(  s );
end;

end.

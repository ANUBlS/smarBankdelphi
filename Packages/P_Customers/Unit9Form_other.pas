unit Unit9Form_other;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, StdCtrls, XFSCtrls, Grids, XDBGrids, ExtCtrls;

type
  TFormcust_other = class(TForm)
    XFPanel3: TXFPanel;
    XDBGrid1: TXDBGrid;
    DataSource2: TDataSource;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2CUSTID: TFloatField;
    OracleDataSet2NAME: TWideStringField;
    OracleDataSet2DESCRIPTION: TWideStringField;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    procedure FormShow(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XDBGrid1CellClick(Column: TXColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formcust_other: TFormcust_other;

implementation

uses P_Datamod_Unit, UnitFormcust_other_change, phy_cust_Unit;

{$R *.dfm}

procedure TFormcust_other.FormCreate(Sender: TObject);
begin
Formcust_other_change:=TFormcust_other_change.Create(self);
end;

procedure TFormcust_other.FormShow(Sender: TObject);

var
c_custid :integer;
begin

   c_custid:=P_Customers_Form.DBGridCustomers.DataSource.DataSet.FieldByName('id').AsInteger;
//c_custid:=phy_cust_Unit.p_custid;//P_Customers_Form.DBGridCustomers.dat;

P_DataModule.PG_PCustService.CallProcedure
                                                ('cust_other_info_add',
                                                 [c_custid]);
                                                 OracleDataSet2.Close;
                                                 OracleDataSet2.SetVariable('v_id',c_custid);
                                                 OracleDataSet2.Open


end;



procedure TFormcust_other.XDBGrid1CellClick(Column: TXColumn);
begin
 with Formcust_other_change , OracleDataSet1 do
  begin
    close;
      SetVariable('v_id',XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger);
    open;


if RecordCount>0 then
 begin

     XDBGrid1.Columns[2].ReadOnly:=true;
     Formcust_other_change.ShowModal;

    OracleDataSet2.Edit ;
    if   Formcust_other_change.v_name<>''  then
     begin

    OracleDataSet2DESCRIPTION.asstring:=Formcust_other_change.v_name ;

     end;
     Formcust_other_change.v_name:='';
//    OracleDataSet2.Post;
//    OracleDataSet2.Refresh;

end
  else
   XDBGrid1.Columns[2].ReadOnly:=false;
  end;
end;

procedure TFormcust_other.XFButton1Click(Sender: TObject);
begin
OracleDataSet2.Post;
end;

end.

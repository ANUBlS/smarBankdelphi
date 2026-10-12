unit UnitFormMain_delivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, DB, OracleData;

type
  TFormMain_delivery = class(TForm)
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button1: TButton;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2RID: TFloatField;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2CREDITID: TFloatField;
    OracleDataSet2USNAME: TWideStringField;
    OracleDataSet2DAT: TDateTimeField;
    OracleDataSet2TEXT: TWideStringField;
    DataSource2: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain_delivery: TFormMain_delivery;
  creditid: integer;
implementation

uses Unit_delivery,CommonDecls;

{$R *.dfm}

procedure TFormMain_delivery.Button1Click(Sender: TObject);
begin
 if not Assigned(Form_delivery) then
   Form_delivery:=TForm_delivery.create(self);

   Form_delivery.ShowModal;
end;

procedure TFormMain_delivery.FormCreate(Sender: TObject);
begin
//if not Assigned(FormMain_delivery) then
 //  FormMain_delivery:=TFormMain_delivery(self);
end;

procedure TFormMain_delivery.FormShow(Sender: TObject);
begin
creditid:=CommonDBGrid.DataSource.DataSet.FieldByName(sID).AsInteger;

with OracleDataSet2 do
   begin
    close;
      SetVariable('v_crid',creditid);
    open;

   end;
end;

end.

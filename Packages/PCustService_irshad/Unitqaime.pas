unit Unitqaime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Grids, XDBGrids, ExtCtrls, StdCtrls, ComCtrls;

type
  TFormQaime = class(TForm)
    Panel1: TPanel;
    XDBGrid1: TXDBGrid;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet1BP_ID: TFloatField;
    OracleDataSet1INV_NUM: TWideStringField;
    OracleDataSet1INV_DATE: TDateTimeField;
    OracleDataSet1TRANS_ID: TFloatField;
    OracleDataSet1TRANS_DATE: TDateTimeField;
    OracleDataSet1PAR1: TWideStringField;
    OracleDataSet1PAR2: TWideStringField;
    OracleDataSet1PAR3: TWideStringField;
    OracleDataSet1PAR4: TWideStringField;
    OracleDataSet1PAR5: TWideStringField;
    OracleDataSet1PAR6: TWideStringField;
    OracleDataSet1PAR7: TWideStringField;
    OracleDataSet1PAR8: TWideStringField;
    OracleDataSet1TARIF: TWideStringField;
    OracleDataSet1PAR11: TFloatField;
    OracleDataSet1PAR12: TFloatField;
    OracleDataSet1PAR13: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQaime: TFormQaime;

implementation

uses UnitDataModPCustService, UnitInvoceRep,sboapiDataModuleImpl;

{$R *.dfm}

procedure TFormQaime.Button1Click(Sender: TObject);
begin
with QRptInvoceRep do
begin
    with ods_cap do
    begin
      close;
       SetVariable('v_trid',OracleDataSet1TRANS_ID.AsInteger);
      open;
    end;
  Preview;
end;
end;

procedure TFormQaime.Button2Click(Sender: TObject);
 var
 begin_dat,end_dat:variant;


begin
//  begin_dat:=DateTimePicker1.DateTime;
// end_dat:=DateTimePicker2.DateTime;

with OracleDataSet1 do
begin
   close;
   sql[8]:='';
   sql[8]:=sql[8] + ' and   trunc(trans_date)  between '+ '''' + FormatDatetime('dd-mmm-yyyy',
      DateTimePicker1.DateTime) +'''' + ' and '+ '''' + FormatDatetime('dd-mmm-yyyy',
      DateTimePicker2.DateTime) +'''' ;
   open;
end;
end;

procedure TFormQaime.Button3Click(Sender: TObject);
begin
with OracleDataSet1 do
begin
close;
SQL[8]:='';
open;
end;
end;

procedure TFormQaime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
OracleDataSet1.SQL[8]:='';
end;

procedure TFormQaime.FormCreate(Sender: TObject);
begin
DateTimePicker1.DateTime:=Date;
DateTimePicker2.DateTime:=Date;
QRptInvoceRep:=TQRptInvoceRep.Create(self);
end;

procedure TFormQaime.FormShow(Sender: TObject);
begin

 oracledataset1.Close;
 oracledataset1.SetVariable(':kliid', DataModPCustService.ODS_CUSTOMERS_PHYS_FS.FieldByName('id').AsInteger);
 oracledataset1.Open;

end;

end.

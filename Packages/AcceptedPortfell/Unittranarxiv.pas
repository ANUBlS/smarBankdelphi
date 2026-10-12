unit Unittranarxiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, ComCtrls;

type
  TArxivTran = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Main: TEdit;
    Perc: TEdit;
    service: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Description: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArxivTran: TArxivTran;

implementation

uses Datamodunit;

{$R *.dfm}

procedure TArxivTran.Button1Click(Sender: TObject);
begin
if Description.Text='' then
begin
   ShowMessage('Emeliyat Novu secilmelidir!!!!');
   exit;
end;

//try

begin
DataMod.OraclePackage1.CallProcedure('add_transaction_arch',[DataMod.maincrprt.FieldByName('prtid').AsVariant,
main.Text,perc.Text,service.Text,DateTimePicker1.Datetime,DBLookupComboBox1.KeyValue]);

ShowMessage('Ödəniş uğurla yaradıldı...');
datamod.maincrprt.refresh;
 close;
end;


 { except
   ShowMessage('Ödəniş keçmədi!!');
  end; }


end;

procedure TArxivTran.DBLookupComboBox1CloseUp(Sender: TObject);
begin
Description.Text:=DBLookupComboBox1.Text ;
Description.Enabled:=true;
end;

procedure TArxivTran.FormShow(Sender: TObject);
begin
DataMod.dt_pay_settings_desc.DataSet.Close;
DataMod.dt_pay_settings_desc.DataSet.Open;
end;

end.

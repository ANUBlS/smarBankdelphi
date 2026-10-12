unit yoxp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls;

type
  TForm12 = class(TForm)
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit19, Unit2, SWIFT_MAINImpl1;

{$R *.DFM}

procedure TForm12.Button2Click(Sender: TObject);
begin
//exit;
close;
edit2.Text:='0';

end;

procedure TForm12.Button1Click(Sender: TObject);
begin
if (edit1.Text=DBEdit1.text) and (DBEdit2.Text=DBLookupComboBox1.Text) then
begin
//ShowMessage('duzdur');
close;
Edit2.Text:='1';
end else
begin
//ShowMessage('sehvdi');
SWDataModule.sw_out_2.Edit;
DBEdit3.Text:='7';
SWDataModule.sw_out_2.FieldByName('INFO').asstring:='Mebleq ve ya Valyuta duzgun yazilmayib!' ;
SWDataModule.sw_out_2.Post;
SWDataModule.sw_out_2.Session.Commit;
//SWDataModule.sw_in_insert.CallProcedure('sw_out_commit',[TransactionID])
close;
Edit2.Text:='0';


//swift_main.gridout2.datasource.dataset.fieldbyname('status').asstring=7;
end;

end;

procedure TForm12.FormActivate(Sender: TObject);
begin
Edit2.Text:='';
Edit1.Text:='';
if not SWDataModule.ValuteForCommit.Active then
SWDataModule.ValuteForCommit.Open;
//DBLookupComboBox1.KeyField:='';
DBLookupComboBox1.KeyValue:=0;
DBLookupComboBox1.KeyValue := DBLookupComboBox1.ListSource.DataSet.FieldByName(DBLookupComboBox1.KeyField).Value;
end;

procedure TForm12.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,'.']) then
    key :=#0;
end;

end.

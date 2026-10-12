unit prognose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, CMExcelExport;

type
  TForm4 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    ExcelExport: TCMExcelExport;
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Enter(Sender: TObject);
    procedure DateTimePicker2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses InsDataModule;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
InsDataMod.ins_prognose.close;
InsDataMod.ins_prognose.SetVariable('dat1',Trunc(DateTimePicker1.DateTime));
InsDataMod.ins_prognose.SetVariable('dat2',Trunc(DateTimePicker2.DateTime));
InsDataMod.ins_prognose.open;
    with ExcelExport do
   begin
      Connect;
      ExportDataset(InsDataMod.ins_prognose,'Prognose',True,false);
      Disconnect;
   end;
InsDataMod.ins_prognose.close;
end;

procedure TForm4.DateTimePicker1Change(Sender: TObject);
begin

if DateTimePicker1.DateTime<InsDataMod.Sysdat.FieldByName('tek_dat').AsDateTime then
begin
ShowMessage('Arxa tarixə proqnoz secmək olmaz !!!');
DateTimePicker1.DateTime:=InsDataMod.Sysdat.FieldByName('tek_dat').AsDateTime;
end;

end;

procedure TForm4.DateTimePicker1Enter(Sender: TObject);
begin
{DateTimePicker1.MaxDate:=DateTimePicker2.DateTime;
DateTimePicker2.MinDate:=DateTimePicker1.DateTime; }
end;

procedure TForm4.DateTimePicker2Enter(Sender: TObject);
begin
{DateTimePicker1.MaxDate:=DateTimePicker2.DateTime;
DateTimePicker2.MinDate:=DateTimePicker1.DateTime; }
end;

procedure TForm4.FormShow(Sender: TObject);
begin

DateTimePicker1.DateTime:=InsDataMod.Sysdat.FieldByName('tek_dat').AsDateTime;
DateTimePicker2.DateTime:=InsDataMod.Sysdat.FieldByName('tek_dat').AsDateTime;
end;

end.

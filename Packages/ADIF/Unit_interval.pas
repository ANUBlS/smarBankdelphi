unit Unit_interval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, ComCtrls, ExtCtrls;

type
  TForm_Interval = class(TForm)
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    DateTim_begin: TDateTimePicker;
    DateTim_end: TDateTimePicker;
    XFBitBtn1: TXFBitBtn;
    procedure XFBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Interval: TForm_Interval;

implementation

uses UnitAdifData;

{$R *.dfm}

procedure TForm_Interval.FormShow(Sender: TObject);
begin
DateTim_begin.DateTime:=Adif_Data.Sysdat.FieldByName('tek_dat').AsDateTime;
DateTim_end.DateTime:=Adif_Data.Sysdat.FieldByName('tek_dat').AsDateTime;
end;

procedure TForm_Interval.XFBitBtn1Click(Sender: TObject);
 var
 dat_begin,dat_end:TDateTime;
begin
 dat_begin := DateTim_begin.DateTime  ;
 dat_end :=   DateTim_end.DateTime ;
with Adif_Data ,ods_account do
begin
 close;
  SetVariable('d1',dat_begin);
  SetVariable('d2',dat_end);
  open;
end;
Form_Interval.Close;
end;

end.

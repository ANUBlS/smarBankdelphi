unit Checkacc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TCheckinacc = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Checkinacc: TCheckinacc;

implementation

{$R *.dfm}

procedure TCheckinacc.Button1Click(Sender: TObject);
begin
SWDataModule.acc_check.Close;
SWDataModule.acc_check.SetVariable('acc',edit1.Text);
SWDataModule.acc_check.open;
edit2.Text:= SWDataModule.acc_check.FieldByName('name').AsString;
//edit3.Text:= SWDataModule.acc_check.FieldByName('name').AsString;
   if edit2.Text='' then   begin
    SWDataModule.sw_in_insert.CallProcedure('upd_none',[edit3.Text]);
    close;
   end else begin
     SWDataModule.sw_in_insert.CallProcedure('upd_none',[edit3.Text]);
   end;
SWDataModule.sw_in.Refresh;

SWDataModule.sw_in2.Refresh;;

end;

end.

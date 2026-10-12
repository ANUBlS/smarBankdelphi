unit Checkin_acc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Data_Unit;

type
  TCheckinacc = class(TForm)
    Button1: TButton;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
DataMod.acc_check.Close;
DataMod.acc_check.SetVariable('acc',edit1.Text);
DataMod.acc_check.open;
edit2.Text:= DataMod.acc_check.FieldByName('name').AsString;
end;

end.

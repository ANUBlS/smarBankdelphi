unit datnamount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data_Unit, StdCtrls, ComCtrls;

type
  Tmnt = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    btnsave: TButton;
    Edit2: TEdit;
    procedure btnsaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mnt: Tmnt;

implementation

{$R *.dfm}

procedure Tmnt.btnsaveClick(Sender: TObject);
begin
DataMod.INS.CallProcedure('xs_MT996',[edit2.Text,DateTimePicker1.DateTime,edit1.Text]);
ShowMessage('Mandatin maksimum mələgi və son tarix qeyd edildi.' );
close;

end;

end.

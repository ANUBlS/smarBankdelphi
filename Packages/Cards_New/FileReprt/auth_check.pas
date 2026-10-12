unit auth_check;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TAuth_check_frm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    GridBeneficiary: TDBGrid;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Auth_check_frm: TAuth_check_frm;

implementation

uses  Data_Unit, datnamount;

{$R *.dfm}

procedure TAuth_check_frm.Button1Click(Sender: TObject);
begin
DataMod.Ins.CallProcedure('xs_Batchs_VerifStatus2',[edit1.Text]);
DataMod.Ins.CallProcedure('xs_beneficiary_VerifStatus2',[edit1.Text]);
close;
end;

end.

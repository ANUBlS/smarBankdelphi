unit FrmAddBuugcetimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, ExtCtrls, Mask, DBCtrlsEh;

type
  TBudgetAddFr = class(TForm)
    GroupBox1: TGroupBox;
    FitableHmCb: TComboBox;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    AddName: TDBEditEh;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BudgetAddFr: TBudgetAddFr;

implementation

{$R *.DFM}

procedure TBudgetAddFr.FormCreate(Sender: TObject);
begin
ComboBox1.ItemIndex:=0;
end;

end.

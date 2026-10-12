unit unitfilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tfilter = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditBalList: TEdit;
    CBDebt: TCheckBox;
    CBKred: TCheckBox;
    CheckBoxBalance: TCheckBox;
    ComboBoxPlan: TComboBox;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    procedure CheckBoxBalanceClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  filter: Tfilter;

implementation

{$R *.DFM}

procedure Tfilter.CheckBoxBalanceClick(Sender: TObject);
begin
 ComboBoxPlan.Enabled :=CheckBoxBalance.Checked;
   if    ComboBoxPlan.Enabled  then
     ComboBoxPlan.ItemIndex :=0;
end;

procedure Tfilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
if  Key=#27  then
    Close;
end;

end.

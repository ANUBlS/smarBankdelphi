unit UnFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormFilter = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditBalList: TEdit;
    CBDebt: TCheckBox;
    CBKred: TCheckBox;
    CheckBoxBalance: TCheckBox;
    ComboBoxPlan: TComboBox;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxBalanceClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFilter: TFormFilter;

implementation
uses sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TFormFilter.FormCreate(Sender: TObject);
begin
   FormFilter :=Self;
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormFilter.CheckBoxBalanceClick(Sender: TObject);
begin
   ComboBoxPlan.Enabled :=CheckBoxBalance.Checked;
   if    ComboBoxPlan.Enabled  then
     ComboBoxPlan.ItemIndex :=0;
end;

procedure TFormFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if  Key=#27  then
    Close
end;

end.

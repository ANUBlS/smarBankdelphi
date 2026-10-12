unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrlsEh, DBLookupEh, NLSLocalizer;

type
  TPortMainForm = class(TForm)
    Panel1: TPanel;
    NLSLocalizer1: TNLSLocalizer;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBLookupComboboxValute: TDBLookupComboboxEh;
    DBLookupComboboxEhFilial: TDBLookupComboboxEh;
    DBLookupComboboxEhUserGroup: TDBLookupComboboxEh;
    DBLookupComboboxEhCreditType: TDBLookupComboboxEh;
    DBLookupComboboxEhPersons: TDBLookupComboboxEh;
    DBLookupComboboxEhCategories: TDBLookupComboboxEh;
    CheckboxValute: TCheckBox;
    CheckboxFilial: TCheckBox;
    CheckboxUserGroup: TCheckBox;
    CheckboxCreditType: TCheckBox;
    CheckboxPersons: TCheckBox;
    CheckBoxCategorires: TCheckBox;
    GroupBox7: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function  FilterString:string;
  public
    { Public declarations }
  end;

var
  PortMainForm: TPortMainForm;
  procedure InitPlugin(s:string);export;

implementation

{$R *.DFM}
 uses PortDatModImpl,CommonDecls;

 procedure InitPlugin(s:string);export;
 begin
   PortMainForm.ShowModal;
 end;

function TPortMainForm.FilterString:String;

procedure F_LCOMB(var cd :string;Const cs :string; Checked :Boolean; Comb :TDBLookupComboboxEh);
var Kv :string;
begin
  if Checked then
  begin
     Kv := String(Comb.KeyValue);
     if cd = '' then
     cd := '('+cs+'='+Kv+')' else
     cd := cd+'And'+'('+cs+'='+Kv+')'
  end
end;

begin
  Result := '';
   F_LCOMB(Result,'currency',CheckboxValute.Checked,DBLookupComboboxValute);
   F_LCOMB(Result,'PERSONALTYPE',CheckboxPersons.Checked,DBLookupComboboxEhPersons);
   F_LCOMB(Result,'Branchid',CheckboxFilial.Checked,DBLookupComboboxEhFilial);
   F_LCOMB(Result,'CUSTOMERTYPE',CheckBoxCategorires.Checked,DBLookupComboboxEhCategories);
   F_LCOMB(Result,'USRGROUP',CheckboxUserGroup.Checked,DBLookupComboboxEhUserGroup);
   F_LCOMB(Result,'CREDITTYPE',CheckboxCreditType.Checked,DBLookupComboboxEhCreditType);

end;

procedure TPortMainForm.FormCreate(Sender: TObject);
begin
  PortDatMod := TPortDatMod.Create(Self);
end;

procedure TPortMainForm.FormDestroy(Sender: TObject);
begin
  PortDatMod.Free; 
end;

initialization
  PortMainForm :=TPortMainForm.Create(CommonApplication);

end.

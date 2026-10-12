unit frmRepPlan_RestImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, NLSLocalizer, Buttons,
  ComCtrls, CMExcelExport;

type
  TfrmRepPlan_Rest = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    GroupBox2: TGroupBox;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    CheckBox3: TCheckBox;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    CheckBox2: TCheckBox;
    Panel5: TPanel;
    GroupBox7: TGroupBox;
    CheckBox7: TCheckBox;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    GroupBox8: TGroupBox;
    CheckBox9: TCheckBox;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    GroupBox9: TGroupBox;
    CheckBox8: TCheckBox;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    CheckBox4: TCheckBox;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    CheckBox6: TCheckBox;
    GroupBox6: TGroupBox;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    CheckBox5: TCheckBox;
    NLSLocalizer1: TNLSLocalizer;
    BitBtn1: TBitBtn;
    DTPRest: TDateTimePicker;
    ExcelExp: TCMExcelExport;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function BuildFilterString:String;
  end;

var
  frmRepPlan_Rest: TfrmRepPlan_Rest;

procedure InitPlugin(S : String); export;
implementation

{$R *.DFM}
uses
  CommonDecls,dmRepPlan_RestImpl,systemstate;



procedure InitPlugin(S : String); export;
begin
   frmRepPlan_Rest.ShowModal;
end;
exports
   InitPlugin;

function TfrmRepPlan_Rest.BuildFilterString:String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;   
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + 'and ' + Temp;
    end;
    
  end;
begin
  ConcatFilter(Result,'p.CURRENCY',CheckBox1.Checked,DBLookupComboboxEh1.KeyValue);
  ConcatFilter(Result,'p.BRANCHID',CheckBox2.Checked,DBLookupComboboxEh2.KeyValue);
  ConcatFilter(Result,'p.USRGROUP',CheckBox3.Checked,DBLookupComboboxEh3.KeyValue);
  ConcatFilter(Result,'h.RESERVEID',CheckBox4.Checked,DBLookupComboboxEh4.KeyValue);
  ConcatFilter(Result,'h.DUERESERVEID',CheckBox5.Checked,DBLookupComboboxEh5.KeyValue);
  ConcatFilter(Result,'p.USID',CheckBox6.Checked,DBLookupComboboxEh6.KeyValue);
  ConcatFilter(Result,'p.PERSONALTYPE',CheckBox7.Checked,DBLookupComboboxEh7.KeyValue);
  ConcatFilter(Result,'p.CUSTOMERTYPE',CheckBox8.Checked,DBLookupComboboxEh8.KeyValue);
  ConcatFilter(Result,'p.CREDITTYPE',CheckBox9.Checked,DBLookupComboboxEh9.KeyValue);
end;


procedure TfrmRepPlan_Rest.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false;
end;

procedure TfrmRepPlan_Rest.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;

procedure TfrmRepPlan_Rest.FormCreate(Sender: TObject);
begin
   dmRepPlan_Rest := TdmRepPlan_Rest.create(self); 
   DTPRest.DateTime := Get_CurrentDate;
end;

procedure TfrmRepPlan_Rest.FormDestroy(Sender: TObject);
begin
   dmRepPlan_Rest.free
end;

procedure TfrmRepPlan_Rest.BitBtn1Click(Sender: TObject);
var repdat :TDateTime;
begin
   repdat := integer(trunc(DTPRest.DateTime));
   with dmRepPlan_Rest,R do
   begin
      if Active then Close;
      SetVariable('dat',repdat);
      if BuildFilterString <> '' then
         sql[17] := ' and  '+BuildFilterString;
      open;

   end;

   with ExcelExp do begin
        Connect;
        ExportDataset(dmRepPlan_Rest.R,'IP',true);
        Disconnect;
   end;
   
end;

initialization
   frmRepPlan_Rest := TfrmRepPlan_Rest.create(CommonApplication);

end.

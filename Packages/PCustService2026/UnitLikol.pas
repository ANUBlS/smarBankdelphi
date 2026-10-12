unit UnitLikol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CurrencyEdit, ComCtrls, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, DB, OracleData;

type
  TFormLikol = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel6: TPanel;
    DateTimePicker1: TDateTimePicker;
    Panel8: TPanel;
    Panel3: TPanel;
    Edit2: TEdit;
    Panel4: TPanel;
    Edit3: TEdit;
    Panel5: TPanel;
    Edit4: TEdit;
    Panel12: TPanel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    Panel16: TPanel;
    EditAmount: TCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Edit1: TEdit;
    Button3: TButton;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1KLI_ID: TFloatField;
    OracleDataSet1ACC_NO: TWideStringField;
    OracleDataSet1ACCNO: TWideStringField;
    OracleDataSet2: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    WideStringField1: TWideStringField;
    DataSource2: TDataSource;
    Panel9: TPanel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CurrencyEdit1Click(Sender: TObject);
    procedure CurrencyEdit2Click(Sender: TObject);
    procedure CurrencyEdit1Change(Sender: TObject);
    procedure CurrencyEdit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure DBLookupComboboxEh1CloseUp(Sender: TObject; Accept: Boolean);
    procedure CurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure CurrencyEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh2CloseUp(Sender: TObject; Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLikol: TFormLikol;
  v_accid:integer;
  v_accno:string;
  v_accid1:integer;
  v_accno1:string;
implementation

uses sboapiDataModuleImpl,UnitDataModPCustService;

{$R *.dfm}

procedure TFormLikol.Button1Click(Sender: TObject);
begin
FormLikol.Close;
end;

procedure TFormLikol.Button2Click(Sender: TObject);
var
kart_num:string;
begin
if edit1.Text=''  then
begin
  showmessage(' Debit hesab seçilməyib   !');
  exit
end;
if edit7.Text=''  then
begin
  showmessage(' Kredit hesab seçilməyib   !');
  exit
end;
if EditAmount.Value>0 then
begin

      DataModPCustService.OPG_BusProc.CallProcedure('insert_invoices_fuel',
                                                           [
                                                            v_accid,
                                                            v_accid1,
                                                            EditAmount.Value,
                                                            DateTimePicker1.DateTime,
                                                            v_accno1,
                                                            edit2.Text,
                                                            edit3.Text,
                                                            edit4.Text,
                                                            CurrencyEdit2.Value

                                                           ]);


                                                            edit2.Clear;
                                                            edit3.Clear;
                                                            edit4.Clear;
                                                            CurrencyEdit1.Clear;
                                                            CurrencyEdit2.Clear;
                                                            EditAmount.clear;


end;
end;

procedure TFormLikol.Button3Click(Sender: TObject);
begin

  edit1.text:='';
  edit7.Text:='';

end;

procedure TFormLikol.CurrencyEdit1Change(Sender: TObject);
begin
if  CurrencyEdit2.Value>0 then
  begin
EditAmount.Value:=CurrencyEdit1.Value* CurrencyEdit2.Value;

  end
end;

procedure TFormLikol.CurrencyEdit1Click(Sender: TObject);
begin
CurrencyEdit1.Text:='';
end;

procedure TFormLikol.CurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if (not (Key in ['0'..'9',#13,#46,Chr(8)])) then Key:=#0;
if key=#13 then
CurrencyEdit2.SetFocus;
end;

procedure TFormLikol.CurrencyEdit2Change(Sender: TObject);
begin
if  CurrencyEdit1.Value>0 then
  begin
EditAmount.Value:=CurrencyEdit1.Value* CurrencyEdit2.Value;

  end
end;

procedure TFormLikol.CurrencyEdit2Click(Sender: TObject);
begin
CurrencyEdit2.Text:='';
end;

procedure TFormLikol.CurrencyEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if (not (Key in ['0'..'9',#13,#46,Chr(8)])) then Key:=#0;
if key=#13 then
Button2.SetFocus;
end;

procedure TFormLikol.DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
edit1.SetFocus;
end;

procedure TFormLikol.DBLookupComboboxEh1CloseUp(Sender: TObject;
  Accept: Boolean);
begin
with oracledataset1 do
begin
v_accid:=FieldByName('id').AsInteger;
v_accno:=FieldByName('acc_no').AsString;
edit1.text:=FieldByName('accno').AsString;
end;
end;

procedure TFormLikol.DBLookupComboboxEh2CloseUp(Sender: TObject;
  Accept: Boolean);
begin
with oracledataset2 do
begin
v_accid1:=FieldByName('id').AsInteger;
v_accno1:=FieldByName('acc_no').AsString;
edit7.text:=FieldByName('acc_no').AsString;
end;
end;

procedure TFormLikol.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
edit2.SetFocus;
end;

procedure TFormLikol.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
edit3.SetFocus;
end;

procedure TFormLikol.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
edit4.SetFocus;
end;

procedure TFormLikol.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
CurrencyEdit1.SetFocus;
end;

procedure TFormLikol.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if (not (Key in ['0'..'9',#13,#46,Chr(8)])) then Key:=#0;
end;

procedure TFormLikol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edit1.Clear;
 edit2.Clear;
 edit3.Clear;
 edit4.Clear;
 edit7.Clear;
 CurrencyEdit1.Clear;
 CurrencyEdit2.Clear;
 EditAmount.clear;
/// DBLookupComboboxEh1.Enabled:=true;
 //DBLookupComboboxEh2.Enabled:=true;
end;

procedure TFormLikol.FormShow(Sender: TObject);
begin
Edit2.SetFocus;

DateTimePicker1.DateTime:=Date;
if DataModPCustService.Ods_closAccount.FieldByName('bal_cn1').AsString='531' then
   begin
v_accid:=DataModPCustService.Ods_closAccount.FieldByName('id').AsInteger;
v_accno:=DataModPCustService.Ods_closAccount.FieldByName('acc_no').AsString;
edit1.text:=DataModPCustService.Ods_closAccount.FieldByName('accno').AsString;
   end;

 if DataModPCustService.Ods_closAccount.FieldByName('bal_cn1').AsString='721' then
   begin
v_accid1:=DataModPCustService.Ods_closAccount.FieldByName('id').AsInteger;
v_accno1:=DataModPCustService.Ods_closAccount.FieldByName('acc_no').AsString;
edit7.text:=DataModPCustService.Ods_closAccount.FieldByName('acc_no').AsString;
   end;
 with OracleDataSet1 do
begin
        close;
    SetVariable('v_kliid',DataModPCustService.Ods_closAccount.FieldByName('kli_id').AsInteger);
        open;

end;
with OracleDataSet2 do
begin
        close;
    //SetVariable('v_kliid',DataModPCustService.Ods_closAccount.FieldByName('kli_id').AsInteger);
        open;

end;
end;

end.

unit Payment_Det;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, DBCtrls, CurrencyEdit;

type
  TPaymentDetalsForm = class(TForm)
    AccountGB: TGroupBox;
    Panel1: TPanel;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    P13: TPanel;
    Edit_Referens: TEdit;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    P18: TPanel;
    Edit_Client_Name: TEdit;
    P19: TPanel;
    Edit_Client_Code: TEdit;
    P17: TPanel;
    P20: TPanel;
    Edit_Client_Voen: TEdit;
    P14: TPanel;
    Combo_Valute: TComboBox;
    P16: TPanel;
    Edit_TransCode: TEdit;
    Button4: TButton;
    GroupBox2: TGroupBox;
    P7: TPanel;
    P12: TPanel;
    Edit_Bik: TEdit;
    P11: TPanel;
    Combo_BankName: TComboBox;
    Edit_Account_Sub: TEdit;
    P8: TPanel;
    Edit_BankCode: TEdit;
    P9: TPanel;
    Edit_account: TEdit;
    P10: TPanel;
    Edit_Voen: TEdit;
    GroupBox4: TGroupBox;
    P2: TPanel;
    Edit_BankCode_Self: TEdit;
    P3: TPanel;
    Edit_account_Self: TEdit;
    P4: TPanel;
    Edit_Voen_Self: TEdit;
    P5: TPanel;
    Edit_account_sub_Self: TEdit;
    P6: TPanel;
    Edit_BIK_Self: TEdit;
    P1: TPanel;
    Edit_BankName_Self: TEdit;
    Edit_Client_acc_no: TEdit;
    GroupBox5: TGroupBox;
    P15: TPanel;
    Edit_Amount1: TEdit;
    SpeedButton1: TSpeedButton;
    Edit_tey1: TEdit;
    Edit_tey2: TEdit;
    Edit_tey3: TEdit;
    Edit_tey4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Valute_ID: TListBox;
    Bank_ID: TListBox;
    GroupBox6: TGroupBox;
    Edit_inf1: TEdit;
    Edit_inf2: TEdit;
    Edit_inf3: TEdit;
    Button3: TButton;
    SpeedButton2: TSpeedButton;
    Edit_amount: TCurrencyEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Combo_BankNameChange(Sender: TObject);
    procedure Edit_Client_VoenKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_account_sub_SelfKeyPress(Sender: TObject;
      var Key: Char);
    procedure Edit_Amount1KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Edit_tey1Change(Sender: TObject);
    procedure Edit_tey2Change(Sender: TObject);
    procedure Edit_tey3Change(Sender: TObject);
    procedure Edit_inf1Change(Sender: TObject);
    procedure Edit_inf2Change(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit_BankName_SelfChange(Sender: TObject);
  private
    { Private declarations }
  public
     bnf_count : integer;
    { Public declarations }
  end;

var
  PaymentDetalsForm: TPaymentDetalsForm;

implementation
uses swift_unit, TransTypeUnit, Data_Unit, Transaction_Unit,sboapiDataModuleImpl;
{$R *.DFM}
{MY PROC and FUNC}
{CHECK EDITS}
function checkfield: Boolean;
begin
    
    if (Trim(PaymentDetalsForm.Edit_Referens.Text) = '')or
       (Trim(PaymentDetalsForm.Edit_Amount.Text)='')or
       (Trim(PaymentDetalsForm.Edit_TransCode.Text)='')or
       (PaymentDetalsForm.Combo_BankName.ItemIndex=-1)or
       (Trim(PaymentDetalsForm.Edit_BankCode.Text)='')or
       (Trim(PaymentDetalsForm.Edit_account.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Voen.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Account_Sub.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Bik.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Client_acc_no.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Client_Name.Text)='')or
       (Trim(PaymentDetalsForm.Edit_Client_Voen.Text)='')or
       (Trim(PaymentDetalsForm.Edit_tey1.Text)='') then begin Result :=  false;ShowMessage('Melumat Tam deyil !');end else Result:=true;
end;

procedure TPaymentDetalsForm.SpeedButton1Click(Sender: TObject);
   var i: integer;
begin
    TransCodeForm.typecode:=0;
    TransCodeForm.typetext:='';
    for i:=0 to TransCodeForm.TreeView1.Items.Count-1 do TransCodeForm.TreeView1.Items[i].Expanded:=false;;
    TransCodeForm.ShowModal;
end;

procedure TPaymentDetalsForm.Button1Click(Sender: TObject);
begin
    IF mess_edit then
    begin
    if (checkfield = false)or(DataMod.HoxMessages_out.fieldbyname('status').AsInteger=2) then exit;
    DataMod.INS.Callprocedure('UPD_MESS_OUT',[    DataMod.HoxMessages_out.fieldbyname('ID').ASINteger,
                                                  strtofloat(Bank_ID.Items[Combo_BankName.itemindex]),
                                                  strtofloat(Edit_Account_Sub.text),
                                                  Edit_Client_acc_no.text,
                                                  edit_client_name.text,
                                                  edit_client_code.text,
                                                  strtofloat(Edit_Client_Voen.text),
                                                  trim(edit_tey1.text)+trim(edit_tey2.text)+trim(edit_tey3.text)+trim(edit_tey4.text),
                                                  strtofloat(Edit_TransCode.text),
                                                  trim(edit_inf1.text)+trim(edit_inf2.text)+trim(edit_inf3.text),
                                                  DataMod.GetSysDate.CallDateFunction('get_date',[]),
                                                  strtofloat(valute_id.items[combo_valute.itemindex]),
                                                  edit_referens.text,
                                                  Edit_Amount.value,
                                                  bnf_count]);
   sboapiDataModule.SBSession.Commit;
   DataMod.INS.Callprocedure('UPD_HOX102_AMOUNT',[DataMod.Hox102_out.fieldbyname('ID').asinteger]);
   DataMod.Ins.callprocedure('UPD_MESS_ICON',[DataMod.HoxMessages_out.fieldbyname('ID').ASinteger,0]);
   DataMod.Ins.callintegerfunction('UPD_HOX102_ICON',[DataMod.Hox102_out.fieldbyname('ID').ASinteger,0]);
   Swift_Form.RefreshWithPos;
   end;
   close;
end;

procedure TPaymentDetalsForm.Button2Click(Sender: TObject);
begin
    IF mess_edit then
    begin
    Swift_Form.showdetals;
    end else close;
end;

procedure TPaymentDetalsForm.Combo_BankNameChange(Sender: TObject);
begin
      Datamod.BankM.Locate('ID',Bank_ID.Items[Combo_BankName.ItemIndex],[]);
      Edit_BankCode.Text:=DataMod.BankM.fieldbyname('BankCode').AsString;
      Edit_account.Text:=DataMod.BankM.fieldbyname('KRNO').AsString;
      Edit_Voen.Text:=DataMod.BankM.fieldbyname('INN').AsString;
      Edit_Bik.Text:=DataMod.BankM.fieldbyname('SWIFT').AsString;
      if mess_edit then Button2.Enabled:=true;
end;

procedure TPaymentDetalsForm.Edit_Client_VoenKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := Swift_Form.OnlyNumber(KEY);
end;

procedure TPaymentDetalsForm.Edit_account_sub_SelfKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := Swift_Form.OnlyNumber(KEY);
end;

procedure TPaymentDetalsForm.Edit_Amount1KeyPress(Sender: TObject;
  var Key: Char);
begin
    key := Swift_Form.OnlyNumber(KEY);
end;

procedure TPaymentDetalsForm.Button4Click(Sender: TObject);
begin
    if checkfield = false then exit;
    bnf_count:=bnf_count+1;
    DataMod.INS.Callprocedure('Inst_HOXMESS_OUT',[new_id,
                                                  strtofloat(Bank_ID.Items[Combo_BankName.itemindex]),
                                                  strtofloat(Edit_Account_Sub.text),
                                                  Edit_Client_acc_no.text,
                                                  edit_client_name.text,
                                                  edit_client_code.text,
                                                  strtofloat(Edit_Client_Voen.text),
                                                  trim(edit_tey1.text)+trim(edit_tey2.text)+trim(edit_tey3.text)+trim(edit_tey4.text),
                                                  strtofloat(Edit_TransCode.text),
                                                  trim(edit_inf1.text)+trim(edit_inf2.text)+trim(edit_inf3.text),
                                                  DataMod.GetSysDate.CallDateFunction('get_date',[]),
                                                  strtofloat(valute_id.items[combo_valute.itemindex]),
                                                  edit_referens.text,
                                                  Edit_Amount.value,
                                                  bnf_count]);
    if after_add then
    begin
      sboapiDataModule.SBSession.Commit;
      DataMod.INS.Callprocedure('UPD_HOX102_AMOUNT',[DataMod.Hox102_out.fieldbyname('ID').asinteger]);
      DataMod.Ins.callintegerfunction('UPD_HOX102_ICON',[DataMod.Hox102_out.fieldbyname('ID').ASinteger,0]);
      Swift_Form.RefreshWithPos;
    end else
    begin
      TransForm.Edit_BNF.Text:='\BNF\'+inttostr(PaymentDetalsForm.bnf_count);
      TransForm.Edit_Amount.text:=floattostr(TransForm.Edit_Amount.value+edit_Amount.value);
    end;
    {CLEAR EDIT}
    Combo_BankName.ItemIndex:=-1;
    Edit_BIK.Clear;
    Edit_BankCode.clear;
    Edit_account.Clear;
    Edit_account_sub.Clear;
    Edit_Voen.Clear;
    Edit_Amount.Clear;
    Edit_TransCode.Clear;
    {NEW REF NUMBER for messages}
    if Edit_Referens.Text='' then
    PaymentDetalsForm.Edit_Referens.Text:='MBA'+inttostr(DataMod.INS.Callintegerfunction('new_mess_reference',[]));
    Edit_Client_Name.Clear;
    Edit_Client_Code.clear;
    Edit_Client_acc_no.Clear;
    Edit_Client_Voen.Clear;
    Edit_Referens.Clear;
    Edit_inf1.Clear;
    Edit_inf2.Clear;
    Edit_inf3.Clear;
    Edit_tey1.Clear;
    Edit_tey2.Clear;
    Edit_tey3.Clear;
    Edit_tey4.Clear;
    TransForm.Button1.Enabled:=true;
    PaymentDetalsForm.Button1.Enabled:=true ;
    DataMod.HoxMessages_out.Last;
//ShowMessage('added');

end;

procedure TPaymentDetalsForm.Edit_tey1Change(Sender: TObject);
begin
    if PaymentDetalsForm.Visible then
    if Length((sender as Tedit).Text)=35 then Edit_tey2.SetFocus;
end;

procedure TPaymentDetalsForm.Edit_tey2Change(Sender: TObject);
begin
    if PaymentDetalsForm.Visible then
    if Length((sender as Tedit).Text)=35 then Edit_tey3.SetFocus;
end;

procedure TPaymentDetalsForm.Edit_tey3Change(Sender: TObject);
begin
    if PaymentDetalsForm.Visible then
    if Length((sender as Tedit).Text)=35 then Edit_tey4.SetFocus;
end;

procedure TPaymentDetalsForm.Edit_inf1Change(Sender: TObject);
begin
    if PaymentDetalsForm.Visible then
    if Length((sender as Tedit).Text)=35 then Edit_inf2.SetFocus;
end;

procedure TPaymentDetalsForm.Edit_inf2Change(Sender: TObject);
begin
    if PaymentDetalsForm.Visible then
    if Length((sender as Tedit).Text)=35 then Edit_inf3.SetFocus;
end;

procedure TPaymentDetalsForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = Vk_escape then close;
end;

procedure TPaymentDetalsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   after_add:=false;
   mess_edit:=false;
   Button4.Visible:=true;
   Button1.Caption:='Сон';
end;

procedure TPaymentDetalsForm.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TPaymentDetalsForm.SpeedButton2Click(Sender: TObject);
begin
    {NEW REF NUMBER for messages}
    PaymentDetalsForm.Edit_Referens.Text:='MBA'+inttostr(DataMod.INS.Callintegerfunction('new_mess_reference',[]));
end;

procedure TPaymentDetalsForm.Edit_BankName_SelfChange(Sender: TObject);
begin
  if mess_edit then Button2.Enabled:=true;
end;
end.

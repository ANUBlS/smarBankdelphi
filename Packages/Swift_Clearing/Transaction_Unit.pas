unit Transaction_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, HintBox, ComCtrls, CurrencyEdit, DBViewComboBox,
  Mask, DBCtrls, ExtCtrls, SearchEdit, Buttons;

type
  TTransForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    AccountGB: TGroupBox;
    Button_add: TButton;
    Panel1: TPanel;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    P1: TPanel;
    Edit_Sender: TEdit;
    P2: TPanel;
    Edit_Referens: TEdit;
    P3: TPanel;
    Edit8: TEdit;
    P4: TPanel;
    Edit_BankCode: TEdit;
    P7: TPanel;
    Edit_account_sub: TEdit;
    P5: TPanel;
    Edit_Account: TEdit;
    P8: TPanel;
    Edit_Bik: TEdit;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    P16: TPanel;
    Edit_Amount1: TEdit;
    P15: TPanel;
    Combo_valute: TComboBox;
    P14: TPanel;
    Combo_date: TDateTimePicker;
    GroupBox1: TGroupBox;
    P11: TPanel;
    Edit_clientName: TEdit;
    P12: TPanel;
    P10: TPanel;
    P13: TPanel;
    Edit_Client_code: TEdit;
    P6: TPanel;
    Edit_voen: TEdit;
    Panel20: TPanel;
    Edit_BNF: TEdit;
    AccSearch: TSearchEdit;
    Valute_ID: TListBox;
    DBEdit_Voen: TDBEdit;
    Edit_acc_id: TDBEdit;
    SpeedButton1: TSpeedButton;
    P_view: TPanel;
    Label2: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    P9: TPanel;
    ComboBox_CD: TComboBox;
    Panel2: TPanel;
    DBText1: TDBText;
    Panel4: TPanel;
    Edit_amount: TCurrencyEdit;
    DBEdit_ostat: TDBEdit;
    DBEdit_pokostat: TDBEdit;
    Panel5: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button3Click(Sender: TObject);
    procedure Button_addClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit_VoenKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_account_subKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AccSearchChange(Sender: TObject);
    procedure P_viewEnter(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

uses Payment_Det,data_unit, Swift_Unit,sboapiDataModuleImpl;

{$R *.DFM}
{CHECK EDITS}
function checkfield(all : Boolean): Boolean;
begin
       DataMod.ForCHECK.Close;
       DataMod.ForCHECK.SQL.Clear;
       DataMod.ForCHECK.SQL.Add('Select * from account where acc_no = '''+TransForm.AccSearch.Text+'''');
       DataMod.ForCHECK.Open;
    if (Trim(TransForm.AccSearch.Text) = '')    or
       (Length(TransForm.AccSearch.Text)<16)    or
       (TransForm.DBEdit_Voen.Text='')          or
//       (Trim(TransForm.Edit_Referens.Text)='')  or
       (TransForm.AccSearch.Color=clred)        or
       (Trim(TransForm.Edit_clientName.Text)='')or
       (DataMod.ForCHECK.RecordCount = 0)       then begin Result :=  false;ShowMessage('Melumat Tam deyil !');end else Result:=true;
       if all then
       if (TransForm.Edit_Amount.Text='0')      then
       begin
       Result :=  false;
       ShowMessage('Melumat Tam deyil !');
       end;

end;


procedure TTransForm.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TTransForm.Button_addClick(Sender: TObject);
begin
    if  checkfield(false)=false then exit;
    {VIEW IN EDIT}
    if Valute_ID.Items[Combo_valute.ItemIndex] <> DataMod.Account_data.FieldByName('val_acc').AsString then
    begin
      ShowMessage('Bu hesab secilmish valutaya uygun deyil !');
      exit;
    end;
    PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.BankInfo.fieldbyname('BANK').AsString;
    PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.BankInfo.fieldbyname('SWIFT').AsString;
    PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.BankInfo.fieldbyname('KOD_B').AsString;
    PaymentDetalsForm.Edit_account_Self.Text:=DataMod.BankInfo.fieldbyname('KRNO').AsString;
    PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.BankInfo.fieldbyname('INN').AsString;
    PaymentDetalsForm.Combo_Valute.ItemIndex:=Combo_valute.ItemIndex;
    PaymentDetalsForm.Edit_account_sub_Self.Text:=Edit_account_sub.text;
    {Cler edit's}
    PaymentDetalsForm.Combo_BankName.ItemIndex:=-1;
    PaymentDetalsForm.Edit_BIK.Clear;
    PaymentDetalsForm.Edit_BankCode.clear;
    PaymentDetalsForm.Edit_Referens.Clear;
    PaymentDetalsForm.Edit_account.Clear;
    PaymentDetalsForm.Edit_Voen.Clear;
    PaymentDetalsForm.Edit_Amount.Clear;
    PaymentDetalsForm.Edit_TransCode.Clear;
    PaymentDetalsForm.Edit_Client_Name.Clear;
    PaymentDetalsForm.Edit_Client_Code.clear;
    PaymentDetalsForm.Edit_Client_acc_no.Clear;
    PaymentDetalsForm.Edit_Client_Voen.Clear;
    PaymentDetalsForm.Edit_inf1.Clear;
    PaymentDetalsForm.Edit_inf2.Clear;
    PaymentDetalsForm.Edit_inf3.Clear;
    PaymentDetalsForm.Edit_tey1.Clear;
    PaymentDetalsForm.Edit_tey2.Clear;
    PaymentDetalsForm.Edit_tey3.Clear;
    PaymentDetalsForm.Edit_tey4.Clear;
    {NEW REF NUMBER for messages}
//    PaymentDetalsForm.Edit_Referens.Text:='MBA'+inttostr(DataMod.INS.Callintegerfunction('new_mess_reference',[]));
    {BUTTONS}
    PaymentDetalsForm.Button1.Enabled:=false;
    PaymentDetalsForm.Button2.Enabled:=false; 
    PaymentDetalsForm.ShowModal;
end;

procedure TTransForm.Button2Click(Sender: TObject);
begin
   sboapiDataModule.SBSession.Rollback;
   close;
end;

procedure TTransForm.DBEdit_VoenKeyPress(Sender: TObject; var Key: Char);
begin
    key := Swift_Form.OnlyNumber(KEY);
end;

procedure TTransForm.Edit_account_subKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := Swift_Form.OnlyNumber(KEY);
end;

procedure TTransForm.Button1Click(Sender: TObject);
begin
    if (checkfield(true) = false)or(Trim(TransForm.Edit_Referens.Text)='') then exit;
    {UPDATE to change}
    trans_date:=trunc(Combo_date.DateTime);
    if Edit_BNF.Text <> '/BNF/0' then
    DataMod.INS.CallProcedure('UPD_HOX102_OUT',[  new_id,
                                                  'CREDIT',
                                                  strtoint(Edit_acc_id.text),
                                                  edit_clientname.text,
                                                  edit_client_code.text,
                                                  edit_referens.text,
                                                  strtofloat(edit_amount.text),
                                                  strtofloat(valute_id.items[combo_valute.itemindex]),
                                                  DataMod.GetSysDate.CallDateFunction('get_date',[])]);
   sboapiDataModule.SBSession.Commit;
   Swift_Form.RefreshDATA;
   close;
end;

procedure TTransForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = Vk_escape then close;
end;

procedure TTransForm.SpeedButton1Click(Sender: TObject);
begin
    {NEW REF NUMBER}
    //ShowMessage(DataMod.Reference.CallStringfunction('new_refenrece',[strtoint(valute_id.items[combo_valute.itemindex]),formatdatetime('yymmdd',date)]));
    if trim(Edit_Referens.text)='' then
    Edit_Referens.text := DataMod.Reference.CallStringfunction('new_refenrece',[strtoint(valute_id.items[combo_valute.itemindex]),formatdatetime('yymmdd',date)]);
end;

procedure TTransForm.AccSearchChange(Sender: TObject);
begin
   if (accSearch.Text ='')or(AccSearch.Color=clRed) then
   begin
   DBEdit_Voen.Clear;
   DBEdit_ostat.Clear;
   DBEdit_pokostat.Clear;
   end;
end;

procedure TTransForm.P_viewEnter(Sender: TObject);
begin
   GroupBox2.SetFocus;
end;

end.

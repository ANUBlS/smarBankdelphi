unit Transaction_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, HintBox, ComCtrls, CurrencyEdit, DBViewComboBox,
  Mask, DBCtrls, ExtCtrls, SearchEdit, Buttons, CMDBSearchEdit,Variants;

type
  TTransForm = class(TForm)
    ButtonPost: TButton;
    Button2: TButton;
    AccountGB: TGroupBox;
    Button_add: TButton;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    P1: TPanel;
    Edit_Sender: TEdit;
    P2: TPanel;
    SpeedButton1: TSpeedButton;
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
    P6: TPanel;
    Edit_voen: TEdit;
    P9: TPanel;
    ComboBox_CD: TComboBox;
    Panel5: TPanel;
    LabelFilialName: TLabel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    P16: TPanel;
    Edit_Amount1: TEdit;
    Edit_amount: TCurrencyEdit;
    P15: TPanel;
    Combo_valute: TComboBox;
    Valute_ID: TListBox;
    P14: TPanel;
    Combo_date: TDateTimePicker;
    GroupBox1: TGroupBox;
    P11: TPanel;
    Edit_clientName: TEdit;
    P12: TPanel;
    Edit_Client_code: TEdit;
    P10: TPanel;
    P13: TPanel;
    Edit_Client_voen: TEdit;
    P_view: TPanel;
    Label2: TLabel;
    DBText4: TDBText;
    Label3: TLabel;
    DBEdit_ostat: TDBEdit;
    DBEdit_pokostat: TDBEdit;
    Panel2: TPanel;
    DBText1: TDBText;
    Panel4: TPanel;
    Panel20: TPanel;
    Edit_BNF: TEdit;
    AccSearch: TSearchEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button_addClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit_VoenKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_account_subKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPostClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AccSearch_Change(Sender: TObject);
    procedure P_viewEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_clientNameKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_ReferensChange(Sender: TObject);
    procedure AccSearchChange(Sender: TObject);
    procedure AccSearchKeyPress(Sender: TObject; var Key: Char);
    procedure AccSearchEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

uses Payment_Det, sboapiDataModuleImpl, Data_Unit, LVPCSSImpl, SBTranslateProc;

{$R *.DFM}
{CHECK EDITS}
function CheckField(all : Boolean): Boolean;
begin
       DataMod.DataCheck.Close;
       DataMod.DataCheck.SQL.Clear;
       DataMod.DataCheck.SQL.Add('Select * from account where acc_no = '''+TransForm.AccSearch.Text+'''');
       DataMod.DataCheck.Open;
    if (Trim(TransForm.AccSearch.Text) = '')    or
       //(Length(TransForm.AccSearch.Text)<16)    or
       (TransForm.Edit_Client_voen.Text='')     or
       (TransForm.AccSearch.Color=clred)        or
       (Trim(TransForm.Edit_clientName.Text)='')or
       (DataMod.DataCheck.RecordCount = 0)       then begin Result :=  false;MessageDlg('Melumat Tam deyil !',mtWarning,[mbok],0);end else Result:=true;
       if all then
       if (TransForm.Edit_Amount.Text='0')      then
       begin
       Result :=  false;
       MessageDlg('Melumat Tam deyil !',mtWarning,[mbok],0);
       end;

end;
{Check Account . If is filial then find Filial ID}
function FindFilialID : Integer;
   var Filial_ID: Integer;
begin
 with TransForm do 
     if DataMod.DataAccount.FieldByName('Filial').AsInteger > 0 then
    begin
       Filial_Id:=DataMod.DataAccount.FieldByName('Filial').AsInteger;
       DataMod.DataSetFilial.SetVariable('FilialID',Filial_Id);
       DataMod.DataSetFilial.Refresh;
       LabelFilialName.Caption:='‘»À»¿À - '+DataMod.DataSetFilial.fieldbyname('Name').AsString;
       Result:=DataMod.DataSetFilial.fieldbyname('id').AsInteger;
    end
      else
      begin
         LabelFilialName.Caption:='"Ãﬂ– ﬂ«» Œ‘»—"';
         Result:=0;
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
    if Valute_ID.Items[Combo_valute.ItemIndex] <> DataMod.DataAccount.FieldByName('val_acc').AsString then
    begin
      MessageDlg('Bu hesab secilmish valutaya uygun deyil !',mtWarning,[mbok],0);
      exit;
    end;
    with PaymentDetalsForm do
    begin
      If RB_102T.Checked then
      begin
        RB_102T.Checked:=false;
        RB_102.Checked:=true;
      end;  
      Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('BANK').AsString;
      Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
      Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
      Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
      Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
      Combo_Valute.ItemIndex:=TransForm.Combo_valute.ItemIndex;
      Edit_account_sub_Self.Text:=TransForm.Edit_account_sub.text;
      {Cler edit's}
      Combo_BankName.ItemIndex:=-1;
      Edit_BIK.Clear;
      Edit_BankCode.clear;
      Edit_Referens.Clear;
      Edit_account.Clear;
      Edit_Account_Sub.Clear;
      Edit_Voen.Clear;
      Edit_Amount.Clear;
      Edit_TransCode.Clear;
      Edit_Client_Name.Clear;
      Edit_Client_Code.Text:='/';
      Edit_Client_acc_no.Clear;
      Edit_Client_Voen.Clear;
      Edit_inf1.Clear;
      Edit_inf2.Clear;
      Edit_inf3.Clear;
      Edit_tey1.Clear;
      Edit_tey2.Clear;
      Edit_tey3.Clear;
      Edit_tey4.Clear;
      SearchBankM.Clear;
    end;
    {BUTTONS}
    {PaymentDetalsForm.ButtonFinish.Enabled:=True;
    PaymentDetalsForm.Button2.Enabled:=false;
    PaymentDetalsForm.ShowModal;}
    with PaymentDetalsForm do
    begin
                 ButtonFinish.Enabled:=True;
                 Button2.Enabled:=false;
                 Button4.Enabled:=true;
                 SpeedButton2.Enabled:=true;
                 Combo_BankName.Enabled:=true;
                 Button5.Enabled:=true;
                 SearchBankM.Enabled:=true;
                 Edit_Client_acc_no.Enabled:=true;
                 Edit_Client_Name.Enabled:=true;
                 Edit_Client_Code.Enabled:=true;
                 Edit_Client_Voen.Enabled:=true;
                 Edit_tey1.Enabled:=true;
                 Edit_tey2.Enabled:=true;
                 Edit_tey3.Enabled:=true;
                 Edit_tey4.Enabled:=true;
                 Edit_inf1.Enabled:=true;
                 Edit_inf2.Enabled:=true;
                 Edit_inf3.Enabled:=true;
                 GroupBox7.Enabled:=true;
                 Edit_Amount.Enabled:=true;
                 SpeedButton1.Enabled:=true;
                 ShowModal;
  end;
end;

procedure TTransForm.Button2Click(Sender: TObject);
begin
   sboapiDataModule.SBSession.Rollback;
   close;
end;

procedure TTransForm.DBEdit_VoenKeyPress(Sender: TObject; var Key: Char);
begin
    key := LVPCSSForm.OnlyNumber(KEY);
end;

procedure TTransForm.Edit_account_subKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := LVPCSSForm.OnlyNumber(KEY);
end;

procedure TTransForm.ButtonPostClick(Sender: TObject);
    var ISfilial: integer;
        TransDate : TDate;
        Format:string;
begin
    if (checkfield(true) = false)or(Trim(TransForm.Edit_Referens.Text)='') then
    begin
      MessageDlg('ÃˇÎÛÏ‡Ú “‡Ï ‰ÂÈËÎ',mtWarning,[mbok],0);
      exit
    end;
    if Valute_ID.Items[Combo_valute.ItemIndex] <>
        DataMod.DataAccount.FieldByName('val_acc').AsString then
    begin
      MessageDlg('Bu hesab secilmish valutaya uygun deyil !',mtWarning,[mbok],0);
      exit;
    end;
    {UPDATE to change}
    trans_date:=trunc(Combo_date.DateTime);
    if Edit_BNF.Text <> '/BNF/0' then
    begin
        if Batchs_Edit then
        begin
           if (edit_referens.text = DataMod.XS_BATCHS.fieldbyname('trans_ref').AsString)and
              (DataMod.XS_BATCHS.fieldbyname('Status').AsInteger<>0)
           then
             begin
                MessageDlg('√ÂÈ‰ËÈÈ‡Ú π-ÒË ‰ÂÈ˚¯ËÎÏˇÎË‰Ë!',mtWarning,[mbok],0); exit;
             end;
           new_id:=DataMod.XS_BATCHS.fieldbyname('id').AsInteger;
        end;

        ISfilial:=FindFilialID;
        TransDate := Trunc(GetUseDate);

        if PaymentDetalsForm.RB_102.Checked  then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clblack;
          Format:='MT102';
        end;

        if PaymentDetalsForm.RB_102T.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT102T';
        end;

        DataMod.INS.CallProcedure('xs_Batchs_update',[  new_id,
                                                      'CREDIT',
                                                      DataMod.DataAccount.fieldbyname('id').asinteger,//strtoint(Edit_acc_id.text),
                                                      edit_clientname.text,
                                                      edit_client_code.text,
                                                      edit_referens.text,
                                                      edit_amount.value,
                                                      strtofloat(valute_id.items[combo_valute.itemindex]),
                                                      iSfilial,
                                                      Edit_client_voen.text,
                                                      Format]);
       sboapiDataModule.SBSession.Commit;
       if Batchs_Edit then
       begin
            DataMod.Ins.CallIntegerFunction('xs_Batchs_ChangeStatus',[DataMod.XS_BATCHS.fieldbyname('ID').ASinteger,0]);
            DataMod.XS_BATCHS.RefreshRecord; 
       end
       else LVPCSSForm.RefreshDataBatchs;
   end;
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
    Edit_Referens.text := DataMod.GetReference.
                          CallStringfunction('GetNewBatchRefrence',[strtoint(valute_id.items[combo_valute.itemindex])]);
end;

procedure TTransForm.AccSearch_Change(Sender: TObject);
begin
//''
end;

procedure TTransForm.P_viewEnter(Sender: TObject);
begin
   GroupBox2.SetFocus;
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   sboapiDataModule.SBSession.Rollback;
end;

procedure TTransForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TTransForm.Edit_clientNameKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((not (key in ['0'..'9','a'..'z','A'..'Z','/','-',':','(',')','.',',','''','+','{','}',' ',#8]))
       or(TEdit(Sender).Text = '/'))
       and(key <> #8)
   then
   Begin
     key:=#0;
   end;
end;

procedure TTransForm.Edit_ReferensChange(Sender: TObject);
begin
    if Batchs_Edit then ButtonPost.Enabled:=true;
end;



procedure TTransForm.AccSearchChange(Sender: TObject);
begin
   if (AccSearch.Color <>clred) and(AccSearch.Text<>'') then
   begin

   if DataMod.DataAccount.fieldbyname('INN').AsVariant<>Null then

         Edit_Client_voen.Text:=DataMod.DataAccount.fieldbyname('INN').AsString
      else
         Edit_Client_voen.Text:='/';

     if  FindFilialID >0 then
         LVPCSSForm.ViewBankInfo(true, FindFilialID)
     else
         LVPCSSForm.ViewBankInfo(false,0)

    end
    else begin
           Edit_Client_voen.Clear;
           DBEdit_ostat.Clear;
           DBEdit_pokostat.Clear;
         end;
    if Batchs_Edit then ButtonPost.Enabled:=true;
end;


procedure TTransForm.AccSearchKeyPress(Sender: TObject; var Key: Char);
begin
   if (not (key in ['0'..'9','a'..'z','A'..'Z','-',':','(',')','.',',','''','+','{','}',' ',#8]))
   then
   Begin
     key:=#0;
   end;
end;

procedure TTransForm.AccSearchEnter(Sender: TObject);
begin
   if DataMod.DataAccount.fieldbyname('INN').AsVariant<>Null then

         Edit_Client_voen.Text:=DataMod.DataAccount.fieldbyname('INN').AsString 
      else
         Edit_Client_voen.Text:='/';
end;

end.

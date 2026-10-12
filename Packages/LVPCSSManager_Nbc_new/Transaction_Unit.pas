unit Transaction_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, HintBox, ComCtrls, CurrencyEdit, DBViewComboBox,
  Mask, DBCtrls, ExtCtrls, SearchEdit, Buttons,Variants, CMDBSearchEdit,
  datnamount;

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
    Panel20: TPanel;
    AccSearch1: TSearchEdit;
    Edit_BNF: TEdit;
    Label1: TLabel;
    P20: TPanel;
    Editid: TEdit;
    AccSearch: TDBLookupComboBox;
    GroupBox7: TGroupBox;
    RB_102T: TRadioButton;
    RB_102: TRadioButton;
    Rb205: TRadioButton;
    Rb104: TRadioButton;
    MT996: TRadioButton;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel2: TPanel;
    Panel4: TPanel;
    ComboBox1: TComboBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    RB_104M: TRadioButton;
    rb995: TRadioButton;
    Edit_ref: TEdit;
    Rb992: TRadioButton;
    rb996: TRadioButton;
    ComboBox2: TComboBox;
    RadioButton3: TRadioButton;
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
    procedure AccSearch1Change(Sender: TObject);
    procedure AccSearch1KeyPress(Sender: TObject; var Key: Char);
    procedure AccSearchEnter(Sender: TObject);
    procedure EditidKeyPress(Sender: TObject; var Key: Char);
    procedure AccSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RB_102Click(Sender: TObject);
    procedure RB_102TClick(Sender: TObject);
    procedure Rb104Click(Sender: TObject);
    procedure MT996Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RB_104MClick(Sender: TObject);
    procedure Rb992Click(Sender: TObject);
    procedure rb996Click(Sender: TObject);
    procedure rb995Click(Sender: TObject);
    procedure btn_cr_flClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransForm: TTransForm;


implementation

uses Payment_Det, sboapiDataModuleImpl, Data_Unit, LVPCSSImpl;

var  newins :string;
{$R *.DFM}
{CHECK EDITS}
function CheckField(all : Boolean): Boolean;

var acc : String;

begin
acc:= Trim(TransForm.AccSearch.Text);
       DataMod.DataCheck.Close;
       DataMod.DataCheck.SQL.Clear;
       DataMod.DataCheck.SQL.Add('Select * from xs_account where acc_no = '''+stringreplace(TransForm.AccSearch.text,' ','',[rfReplaceAll, rfIgnoreCase])+'''');
       //DataMod.DataCheck.SQL.Add('Select * from account where acc_no = '''+acc+'''');

       DataMod.DataCheck.Open;
//showmessage(       DataMod.DataCheck.SQL.Text);
    if (Trim(TransForm.AccSearch.Text) = '')    or
       //(Length(TransForm.AccSearch.Text)<16)    or
       (TransForm.Edit_Client_voen.Text='')     or
       (TransForm.AccSearch.Color=clred)        or
       (Trim(TransForm.Edit_clientName.Text)='')or
       (DataMod.DataCheck.RecordCount = 0)       then

       begin
        //showmessage(inttostr(DataMod.DataCheck.RecordCount ));
        Result :=  false;
         if       (PaymentDetalsForm.rb995.Checked= false)  then begin
            if  (PaymentDetalsForm.rb992.Checked=true)   then
             //aaaa

        else
        MessageDlg('Məlumat Tam deyil !!',mtWarning,[mbok],0);
        end;

       end else Result:=true;


       if all then
       if (TransForm.Edit_Amount.Text='0')      then
       begin
       Result :=  false;
       if       (PaymentDetalsForm.rb995.Checked= false)  then  begin
       if  (PaymentDetalsForm.rb992.Checked=true)  then
             //aaaa

        else
       MessageDlg('Məlumat Tam deyil!',mtWarning,[mbok],0);
       end;
       end;

end;
{Check Account . If is filial then find Filial ID}
function FindFilialID : Integer;
   var Filial_ID: Integer;
begin
 with TransForm do 
     if DataMod.DataAccountIban.FieldByName('Filial').AsInteger > 0 then
    begin
       Filial_Id:=DataMod.DataAccountIban.FieldByName('Filial').AsInteger;
       DataMod.DataSetFilial.SetVariable('FilialID',Filial_Id);
       DataMod.DataSetFilial.Refresh;
       LabelFilialName.Caption:='Filial - '+DataMod.DataSetFilial.fieldbyname('Name').AsString;
       Result:=DataMod.DataSetFilial.fieldbyname('id').AsInteger;
    end
      else
      begin
         LabelFilialName.Caption:='"MƏRKƏZİ OFİS"';
         Result:=0;
      end;
end;


procedure TTransForm.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TTransForm.Button_addClick(Sender: TObject);
begin

                   { Datamod.DataBankM.Close;
                if  not rb_102T.Checked then begin
                   DataMod.DataBankM.Filtered:=false;
                end;
                  Datamod.DataBankM.open; }

      if rb995.Checked then
      begin

    if RadioButton1.Checked
   then
    begin

       edit8.Text:='PASS';
      PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString+'AXXX';
       PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
       PaymentDetalsForm.Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
       PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
       PaymentDetalsForm.Edit_account_sub_Self.Text:=DataMod.XS_CONFIG.fieldbyname('Account').AsString;
       PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
       PaymentDetalsForm.Edit_amount.Text:='0';

       PaymentDetalsForm.Edit1.clear;
       PaymentDetalsForm.Edit1.text:='0';
         PaymentDetalsForm.rb995Click(
         PaymentDetalsForm.rb995);
PaymentDetalsForm.rb995.Checked:=true;
PaymentDetalsForm.edit6.Text:='';


PaymentDetalsForm.ShowModal;
    end;

    if RadioButton2.Checked
   then
    begin

           edit8.Text:='MESS';
             PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString+'AXXX';
       PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
       PaymentDetalsForm.Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
       PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
       PaymentDetalsForm.Edit_account_sub_Self.Text:=DataMod.XS_CONFIG.fieldbyname('Account').AsString;
       PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
       PaymentDetalsForm.Edit_amount.Text:='0';

       PaymentDetalsForm.Edit1.clear;
       PaymentDetalsForm.Edit1.text:='0';




PaymentDetalsForm.rb995.Checked:=true;
 PaymentDetalsForm.rb995Click( PaymentDetalsForm.rb995);
PaymentDetalsForm.edit6.Text:='';

PaymentDetalsForm.ShowModal;


    end;
      end;


      if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;
if radiobutton3.Checked then
rb205.Checked:=true;


if rb205.Checked then
   begin
ButtonPost.Enabled:=False;
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;


groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;


panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
edit3.text:='0';
edit2.text:='0';


RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;


combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

     PaymentDetalsForm.MT205.Checked:=true;

       PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString+'AXXX';
       PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
       PaymentDetalsForm.Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
       PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
       PaymentDetalsForm.Edit_account_sub_Self.Text:=DataMod.XS_CONFIG.fieldbyname('Account').AsString;
       PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
       PaymentDetalsForm.Edit_amount.Text:='0';

       PaymentDetalsForm.Edit1.clear;
       PaymentDetalsForm.Edit1.text:='0';

       PaymentDetalsForm.edit6.Text:='';
        PaymentDetalsForm.MT205Click(PaymentDetalsForm.MT205);
       PaymentDetalsForm.ShowModal;

       end else
       begin

     if  checkfield(false)=false then exit;
    {VIEW IN EDIT}
    if Valute_ID.Items[Combo_valute.ItemIndex] <> DataMod.DataAccountIban.FieldByName('val_acc').AsString then
    begin
    if rb995.Checked=false then
      begin
      MessageDlg('Bu hesab seçilmiş valyutaya uygun deyil !',mtWarning,[mbok],0);
      end;
      exit;
    end;
    with PaymentDetalsForm do
    begin
      //IF MT then IF RB_102T.Checked THEN RB_102.Checked:=true;

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
      Edit_TransCode.Text:='900';
      SearchBankM.Clear;
      edit_Client_acc_no.ReadOnly:=False;
                 Edit_Client_Name.ReadOnly  :=False;
                 Edit_Client_Code.ReadOnly  :=False;
                 Edit_Client_Voen.ReadOnly  :=False;
                 Edit_tey1.ReadOnly:=False;
                 Edit_tey2.ReadOnly:=False;
                 Edit_tey3.ReadOnly:=False;
                 Edit_tey4.ReadOnly:=False;
                 Edit_inf1.ReadOnly:=False;
                 Edit_inf2.ReadOnly:=False;
                 Edit_inf3.ReadOnly:=False;

                 DBComboBox_Institution.ReadOnly:=False;
                 DBComboBox_BudgetLevel.ReadOnly:=False;
                 DBComboBox_Destination.ReadOnly:=False;
                 DBComboBox_Institution.Enabled:=true;
                 DBComboBox_BudgetLevel.Enabled:=true;
                 DBComboBox_Destination.Enabled:=true;
                 DBComboBox_Destination.Enabled:=true;
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

                  DBComboBox_Institution.ReadOnly:=False;
                 DBComboBox_BudgetLevel.ReadOnly:=False;
                 DBComboBox_Destination.ReadOnly:=False;
                 DBComboBox_Institution.Enabled:=true;
                 DBComboBox_BudgetLevel.Enabled:=true;
                 DBComboBox_Destination.Enabled:=true;
                 DBComboBox_Destination.Enabled:=true;
              if RB_102T.Checked then   PaymentDetalsForm.RB_102TClick(PaymentDetalsForm.RB_102T);
                 ShowModal;
  end;
end;

end;
procedure TTransForm.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=true then
DateTimePicker1.Enabled:=false
else
DateTimePicker1.Enabled:=true;

end;

procedure TTransForm.btn_cr_flClick(Sender: TObject);
begin
DataMod.Ins.CallProcedure('xs_Batchs_VerifStatus2',[DataMod.XS_BATCHS.fieldbyname('ID').AsInteger]);
DataMod.Ins.CallProcedure('xs_beneficiary_VerifStatus2',[DataMod.XS_BATCHS.fieldbyname('ID').AsInteger]);
close;
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

procedure TTransForm.EditidKeyPress(Sender: TObject; var Key: Char);
begin
  IF not (key in ['0'..'9',#8,#13]) THEN key:=#0;
  IF  Key=#13 THEN BEGIN
  SpeedButton1.Enabled:=true;
                    DataMod.DataAccountIban.Close;
                  //  DataMod.DataAccountIban.SQL[11]:='AND (a.kli_id=:custid)';
                    DataMod.DataAccountIban.SetVariable('custid',StrToInt(Editid.Text));
                    DataMod.DataAccountIban.Open;
                    IF DataMod.DataAccountIban.RecordCount=0 THEN  BEGIN
                                                                 ShowMessage('Müştəri tapılmadı');
                                                                 Edit_clientName.Clear;
                                                                // Edit_Client_code.Clear;
                                                                 Edit_Client_voen.Clear;
                                                                 Exit;
                                                               END;
                   Edit_clientName.Clear;
                   //Edit_Client_code.Clear;
                   Edit_Client_voen.Clear;

                   END

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
        id        : integer;
        tip :integer;
begin


if (PaymentDetalsForm.MT205.Checked=false) then    begin





    {if rb995.Checked then
    begin
    LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT995';
      DataMod.INS.CallProcedure('xs_995add',[         new_id,
                                                      edit_ref.Text,
                                                      edit_referens.text,
                                                      edit8.text,
                                                      iSfilial,
                                                      Format]);
    end else begin
    }

    if (checkfield(true) = false)or(Trim(TransForm.Edit_Referens.Text)='') then
    begin
     if       (PaymentDetalsForm.rb995.Checked= false)then
      begin
      if  (PaymentDetalsForm.rb992.Checked=true)   then
             //aaaa

        else
        MessageDlg('Məlumat Tam deyil',mtWarning,[mbok],0);
        exit
      end;
    end;
   DataMod.DataBankM.Filtered:=false;
   DataMod.DataBankM.Refresh;

   // end;
end;

    if Valute_ID.Items[Combo_valute.ItemIndex] <>
        DataMod.DataAccountIban.FieldByName('val_acc').AsString then
    begin
    if rb995.Checked=false then
      begin
      MessageDlg('Bu hesab seçilmiş valyutaya uygun deyil !',mtWarning,[mbok],0);
      end;
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
                MessageDlg('Qeydiyyat №-si dəyişilməlidir!',mtWarning,[mbok],0); exit;
             end;
           new_id:=DataMod.XS_BATCHS.fieldbyname('id').AsInteger;
        end;
            datamod.Userfil.Close;
            datamod.Userfil.Open;
        ISfilial:=datamod.UserfilFILIALID.AsInteger;
        TransDate := Trunc(GetUseDate);

        if RB_102.Checked  then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clblack;
          Format:='MT102';
        end;

        if RB_102T.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT102T';
        end;
        if PaymentDetalsForm.mt205.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT205';
        end;




        if Rb104.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT104';
        end;


        if Rb_104m.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT104M';
        end;


         if rb995.Checked then
        begin
        showmessage('dd');
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT995';
        end;


        if mt996.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT998';
        end;

         if rb996.Checked then
        begin
          LVPCSSForm.GridBatchs.Columns[13].Font.Color:=clred;
          Format:='MT996';
        end;
          //showmessage('dds');
           if (Rb104.Checked) or (RB_104m.Checked) or (mt996.Checked) or (rb996.Checked) then begin


        DataMod.INS.CallProcedure('xs_Batchs_update',[  new_id,
                                                      edit8.Text,
                                                      DataMod.DataAccountIban.fieldbyname('id').asinteger,//strtoint(Edit_acc_id.text),
                                                      edit_clientname.text,
                                                      edit_client_code.text,
                                                      edit_referens.text,
                                                      edit_amount.value,
                                                      strtofloat(valute_id.items[combo_valute.itemindex]),
                                                      iSfilial,
                                                      Edit_client_voen.text,
                                                      Format,
                                                      trans_date]);

           if RB_104m.Checked then
                  DataMod.INS.CallProcedure('xs_996upd',[  new_id ,edit_ref.Text,'' ]);


                       if rb996.Checked then
                  DataMod.INS.CallProcedure('xs_996upd',[  new_id ,edit_ref.Text,combobox2.Text ]);

        if RadioButton1.Checked then
        tip:=1
        else
        tip:=0;

        if CheckBox1.Checked=false then   begin

    DataMod.INS.CallProcedure('xs_MT996',[  new_id
                                            ,DateTimePicker1.DateTime
                                            ,Edit_amount.Text
                                            ,edit3.Text
                                            ,ComboBox1.Text
                                            ,tip
                                            ,edit2.Text
                                            ]);



        end else begin
            DataMod.INS.CallProcedure('xs_MT996',[  new_id
                                            ,''
                                            ,Edit_amount.Text
                                            ,edit3.Text
                                            ,ComboBox1.Text
                                            ,tip
                                            ,edit2.Text
                                            ]);

        end;

                                                      {if  mt996.Checked=true  then
                                                        begin
                                                        mnt:= Tmnt.Create(Self);
                                                        mnt.Edit2.Text:=inttostr(new_id) ;
                                                        mnt.ShowModal;

                                                        end;        }


       sboapiDataModule.SBSession.Commit;
           end else begin
                DataMod.INS.CallProcedure('xs_Batchs_update',[  new_id,
                                                      edit8.Text,
                                                      DataMod.DataAccountIban.fieldbyname('id').asinteger,//strtoint(Edit_acc_id.text),
                                                      edit_clientname.text,
                                                      edit_client_code.text,
                                                      edit_referens.text,
                                                      edit_amount.value,
                                                      strtofloat(valute_id.items[combo_valute.itemindex]),
                                                      iSfilial,
                                                      Edit_client_voen.text,
                                                      Format,
                                                      trans_date]);


       sboapiDataModule.SBSession.Commit;
           end;
       if Batchs_Edit then
       begin
            DataMod.Ins.CallIntegerFunction('xs_Batchs_ChangeStatus',[DataMod.XS_BATCHS.fieldbyname('ID').ASinteger,0]);
            DataMod.XS_BATCHS.RefreshRecord;
            DataMod.XS_BatchsSum.Refresh;
       end
       else LVPCSSForm.RefreshDataBatchs;
   end;
       close;
   id:=DataMod.XS_BATCHS.fieldbyname('id').asinteger;
   DataMod.XS_BATCHS.Locate('ID',ID,[]);
end;

procedure TTransForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = Vk_escape then close;
end;

procedure TTransForm.MT996Click(Sender: TObject);
begin
if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;

ButtonPost.Enabled:=False;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;


panel1.Enabled:=true;
panel2.Enabled:=true;
panel7.Enabled:=true;
panel4.Enabled:=true;
panel8.Enabled:=true;
RadioButton1.Enabled:=true;
RadioButton2.Enabled:=true;
combobox1.Enabled:=true;
DateTimePicker1.Enabled:=true;
edit3.Enabled:=true;
edit2.Enabled:=true;

p16.Caption:='Ümumi məbləğ limiti' ;



combobox1.color:=clWhite;
DateTimePicker1.color:=clWhite;
edit3.color:=clWhite;
edit2.color:=clWhite;


edit8.Text:='NAUT';
PaymentDetalsForm.edit6.Text:='';
PaymentDetalsForm.MT996.Checked:=true;


end;

procedure TTransForm.RadioButton1Click(Sender: TObject);
var
keys :char;
begin
{edit2.Enabled:=false;
edit2.color:=clSilver;
edit2.Text:='1';
panel8.Enabled:=False;

edit3.Enabled:=False;
edit3.color:=clSilver;   }
  

end;

procedure TTransForm.RadioButton2Click(Sender: TObject);
var
keys :char;
begin
keys:=#13;
{edit2.Enabled:=true;
edit2.color:=clWhite;

panel8.Enabled:=True;

edit3.Enabled:=True;
edit3.color:=clWhite;
         }
       


end;

procedure TTransForm.rb995Click(Sender: TObject);
begin
             //ButtonPost.Enabled:=true;


    RadioButton1.Enabled:=true;
RadioButton2.Enabled:=true;
panel1.Enabled:=true;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
p9.Enabled:=false;




edit3.text:='0';
edit2.text:='0';
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;



combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;


combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;




if rb995.Checked then
begin
  edit_ref.Color:=clwhite;
  edit_ref.Enabled:=true;
end;

   groupbox3.Enabled:=True;
editid.Color:=clsilver;
AccSearch.Color:=clsilver;
Edit_clientName.Color:=clsilver;
Edit_Client_code.Color:=clsilver;
Edit_Client_voen.Color:=clsilver;

//PaymentDetalsForm.MT205.Checked:=true;

       PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString+'AXXX';
       PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
       PaymentDetalsForm.Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
       PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
       PaymentDetalsForm.Edit_account_sub_Self.Text:=DataMod.XS_CONFIG.fieldbyname('Account').AsString;
       PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
       PaymentDetalsForm.Edit_amount.Text:='0';

       PaymentDetalsForm.Edit1.clear;
       PaymentDetalsForm.Edit1.text:='0';

PaymentDetalsForm.rb995.Checked:=true;
PaymentDetalsForm.edit6.Text:='';
end;

procedure TTransForm.rb996Click(Sender: TObject);
begin
if rb996.Checked =true then
begin
  edit_ref.Color:=clwhite;
  edit_ref.Enabled:=true;
  edit_ref.Text:='';
end;
ComboBox2.Enabled:=true;
combobox2.Color:=clwhite ;

if rb995.Checked then
begin
  edit_ref.Color:=clwhite;
  edit_ref.Enabled:=true;
end;

ButtonPost.Enabled:=False;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;


panel1.Enabled:=true;
panel2.Enabled:=true;
panel7.Enabled:=true;
panel4.Enabled:=true;
panel8.Enabled:=true;
RadioButton1.Enabled:=true;
RadioButton2.Enabled:=true;
combobox1.Enabled:=true;
DateTimePicker1.Enabled:=true;
edit3.Enabled:=true;
edit2.Enabled:=true;

p16.Caption:='Ümumi məbləğ limiti' ;



combobox1.color:=clWhite;
DateTimePicker1.color:=clWhite;
edit3.color:=clWhite;
edit2.color:=clWhite;


edit8.Text:='NAUT';
PaymentDetalsForm.edit6.Text:='';
PaymentDetalsForm.rb996.Checked:=true;



end;

procedure TTransForm.RB_104MClick(Sender: TObject);
begin
if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;
ButtonPost.Enabled:=False;
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;


panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;

edit3.text:='0';
edit2.text:='0';

RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;

combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

edit8.Text:='AUTH';
PaymentDetalsForm.RB_104M.Checked:=true;
PaymentDetalsForm.edit6.Text:='';

end;

procedure TTransForm.Rb104Click(Sender: TObject);
begin
if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;
ButtonPost.Enabled:=False;
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;


panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;

edit3.text:='0';
edit2.text:='0';

RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;

combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

edit8.Text:='NAUT';
PaymentDetalsForm.edit6.Text:='';
PaymentDetalsForm.RB_104.Checked:=true;


end;

procedure TTransForm.Rb992Click(Sender: TObject);
begin
//ButtonPost.Enabled:=true;


panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
edit3.text:='0';
edit2.text:='0';
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;


RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;


combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;


edit8.Text:='AUTH';

if rb995.Checked then
begin
  edit_ref.Color:=clwhite;
  edit_ref.Enabled:=true;
end;

groupbox1.Enabled:=false;
editid.Color:=clsilver;
AccSearch.Color:=clsilver;
Edit_clientName.Color:=clsilver;
Edit_Client_code.Color:=clsilver;
Edit_Client_voen.Color:=clsilver;

PaymentDetalsForm.MT205.Checked:=true;

       PaymentDetalsForm.Edit_BankName_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString+'AXXX';
       PaymentDetalsForm.Edit_BankCode_Self.Text:=DataMod.DataBankInfo.fieldbyname('KOD_B').AsString;
       PaymentDetalsForm.Edit_account_Self.Text:=DataMod.DataBankInfo.fieldbyname('KRNO').AsString;
       PaymentDetalsForm.Edit_Voen_Self.Text:=DataMod.DataBankInfo.fieldbyname('INN').AsString;
       PaymentDetalsForm.Edit_account_sub_Self.Text:=DataMod.XS_CONFIG.fieldbyname('Account').AsString;
       PaymentDetalsForm.Edit_BIK_Self.Text:=DataMod.DataBankInfo.fieldbyname('SWIFT').AsString;
       PaymentDetalsForm.Edit_amount.Text:='0';

       PaymentDetalsForm.Edit1.clear;
       PaymentDetalsForm.Edit1.text:='0';

PaymentDetalsForm.rb992.Checked:=true;
PaymentDetalsForm.ShowModal;
PaymentDetalsForm.edit6.Text:='';




end;

procedure TTransForm.RB_102Click(Sender: TObject);
begin

ButtonPost.Enabled:=False;
panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;
edit3.text:='0';
edit2.text:='0';
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;

p16.Caption:=' Ümumi Məbləğ:' ;

combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

edit8.Text:='CREDIT';
if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;

PaymentDetalsForm.RB_102.Checked:=true;
PaymentDetalsForm.RB_102Click(PaymentDetalsForm.RB_102);
PaymentDetalsForm.edit6.Text:='';

   DataMod.DataBankM.CloseAll;
 DataMod.DataBankM.Filtered:=false;
 DataMod.DataBankM.Filter:='';

         DataMod.DataBankM.open;

end;

procedure TTransForm.RB_102TClick(Sender: TObject);
begin
ButtonPost.Enabled:=False;
panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
ComboBox2.Enabled:=False;
combobox2.Color:=clSilver;

RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

p16.Caption:=' Ümumi Məbləğ:' ;

combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

edit3.text:='0';
edit2.text:='0';

edit8.Text:='TREZ';
if rb995.Checked =false then
begin
  edit_ref.Color:=clsilver;
  edit_ref.Enabled:=false;
  edit_ref.Text:='';
end;

groupbox1.Enabled:=True;
editid.Color:=Clwhite;
AccSearch.Color:=Clwhite;
Edit_clientName.Color:=Clwhite;
Edit_Client_code.Color:=Clwhite;
Edit_Client_voen.Color:=Clwhite;

  PaymentDetalsForm.Edit6.Text:='MT102T';
PaymentDetalsForm.RB_102T.Checked:=true;
PaymentDetalsForm.RB_102TClick(PaymentDetalsForm.RB_102T);
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

procedure TTransForm.FormActivate(Sender: TObject);
begin
SpeedButton1.Click;
panel1.Enabled:=False;
panel2.Enabled:=False;
panel7.Enabled:=False;
panel4.Enabled:=False;
panel8.Enabled:=False;
RadioButton1.Enabled:=False;
RadioButton2.Enabled:=False;
combobox1.Enabled:=False;
DateTimePicker1.Enabled:=False;
edit3.Enabled:=False;
edit2.Enabled:=False;

combobox1.color:=clSilver;
DateTimePicker1.color:=clSilver;
edit3.color:=clSilver;
edit2.color:=clSilver;

edit3.text:='0';
edit2.text:='0';

p16.Caption:=' Ümumi Məbləğ:' ;


//RB_102.OnClick(rb_102);


      if PaymentDetalsForm.Showing then
                  PaymentDetalsForm.Close;

end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   sboapiDataModule.SBSession.Rollback;
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
if PaymentDetalsForm.MT205.Checked then  ButtonPost.Enabled:=true else

    if Batchs_Edit then ButtonPost.Enabled:=true;
end;



procedure TTransForm.AccSearch1Change(Sender: TObject);
begin
   if (AccSearch.Color <>clred) and(AccSearch.Text<>'') then
   begin
     Edit_clientName.Text :=DataMod.DataAccount.fieldbyname('NAME').AsString;
   if DataMod.DataAccount.fieldbyname('INN').AsVariant<>Null then
      begin
        Edit_Client_voen.Text:=DataMod.DataAccount.fieldbyname('INN').AsString;
      end

      else
         Edit_Client_voen.Text:='/';

     if  FindFilialID >0 then
         LVPCSSForm.ViewBankInfo(true, FindFilialID)
     else
         LVPCSSForm.ViewBankInfo(false,0)

    end
    else begin
           Edit_clientName.Clear;
           Edit_Client_voen.Clear;
         end;

         //-------------
    if Batchs_Edit then ButtonPost.Enabled:=true;
end;


procedure TTransForm.AccSearch1KeyPress(Sender: TObject; var Key: Char);
begin
  (* if (not (key in ['0'..'9','a'..'z','A'..'Z','-',':','(',')','.',',','''','+','{','}',' ',#8]))
   then
   Begin
     key:=#0;
   end;             *)
end;

procedure TTransForm.AccSearchClick(Sender: TObject);
begin
  //AccSearch.KeyValue:=trim(AccSearch.KeyValue);
  //AccSearch.text:=stringreplace(AccSearch.text,' ','',[rfReplaceAll, rfIgnoreCase]);
  //ShowMessage(stringreplace(AccSearch.text,' ','',[rfReplaceAll, rfIgnoreCase]));
  Edit_clientName.Text :=DataMod.DataAccountIban.fieldbyname('NAME').AsString;
  if DataMod.DataAccountIban.fieldbyname('INN').AsVariant<>Null then
  begin
    Edit_Client_voen.Text:=DataMod.DataAccountIban.fieldbyname('INN').AsString+'/';
    end
  else
    Edit_Client_voen.Text:='/'+DataMod.DataAccountIban.fieldbyname('passpin').AsString;

     if  FindFilialID >0 then
         LVPCSSForm.ViewBankInfo(true, FindFilialID)
     else
         LVPCSSForm.ViewBankInfo(false,0);

    if Batchs_Edit then ButtonPost.Enabled:=true;

end;

procedure TTransForm.AccSearchEnter(Sender: TObject);
begin
   if DataMod.DataAccountIban.fieldbyname('INN').AsVariant<>Null then
        begin

         Edit_Client_voen.Text:=DataMod.DataAccountIban.fieldbyname('INN').AsString;
        end
      else
         Edit_Client_voen.Text:='/';
end;


end.



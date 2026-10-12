unit CC_ACCInUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls, Db, OracleData;

type
  TFormAccIn = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    d_ostat: TLabel;
    d_pok_ostat: TLabel;
    Panel4: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    DebtAccSearchEdit: TSearchEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    acc_id: TEdit;
    Panel6: TPanel;
    editvalute: TComboBox;
    val_code: TEdit;
    editrate: TEdit;
    valname: TEdit;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    c_ostat: TLabel;
    c_pok_ostat: TLabel;
    Panel9: TPanel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Panel10: TPanel;
    CreditAccSearchEdit: TSearchEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    acc_id_: TEdit;
    Panel11: TPanel;
    editrate_: TEdit;
    editvalute_: TComboBox;
    cur_val_code: TEdit;
    valname_: TEdit;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    Panel12: TPanel;
    creditvalue: TCurrencyEdit;
    Panel13: TPanel;
    ekv: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    SearchEdit2: TSearchEdit;
    DBEdit7: TDBEdit;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    SearchEdit3: TSearchEdit;
    DBEdit8: TDBEdit;
    Panel16: TPanel;
    DBLookupComboBox5: TDBLookupComboBox;
    SearchEdit1: TSearchEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TransDate: TDateTimePicker;
    DBEditOperationNo: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    SearchEdit4: TSearchEdit;
    DBEdit9: TDBEdit;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    debtvalue: TCurrencyEdit;
    commission_id: TEdit;
    commission_trans_data: TDataSource;
    commission_trans_km: TOracleDataSet;
    EditTransName: TEdit;
    procedure acc_idChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure val_codeChange(Sender: TObject);
    procedure acc_id_Change(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure DBLookupComboBox5CloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAccIn: TFormAccIn;

implementation

uses UnitData, CC_AccOutForm_Unit,sboapiDataModuleImpl, cc_BuyersImpl;

{$R *.DFM}

procedure TFormAccIn.acc_idChange(Sender: TObject);
begin
with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   DebtAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit1.text :=DebtAccSearchEdit.Text;
end;
 with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   val_code.Text :=FieldByName('val_acc').AsString;
    end;

with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   dbedit2.Text :=FieldByName('name').AsString;  
    end;  
      end;


procedure TFormAccIn.DebtAccSearchEditChange(Sender: TObject);
begin

 {d_ostat.visible :=true;
 d_pok_ostat.visible :=true;
Dbedit1.text :=DebtAccSearchEdit.Text;
//---------------------- KNN------------------------------------------------------------
with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
  //-----------------KNN-------------------------------------------------------------------
   with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;
 }
end;

procedure TFormAccIn.val_codeChange(Sender: TObject);
begin
with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+val_code.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
    with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
    end;
            with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   valname.Text :=FieldByName('val_name').AsString;
  end;
         end;
//-----------------------------------------------------------


procedure TFormAccIn.acc_id_Change(Sender: TObject);
begin
with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id_.Text+'''';
   Open;
   CreditAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit5.text :=DebtAccSearchEdit.Text;
end;
with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id_.Text+'''';
   Open;
   cur_val_code.Text :=FieldByName('val_acc').AsString;
    end;

with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id_.Text+'''';
   Open;
   dbedit3.Text :=FieldByName('name').AsString;
    end;

end;

procedure TFormAccIn.cur_val_codeChange(Sender: TObject);
begin
with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+cur_val_code.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;
    end;
    with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   editvalute_.Text :=FieldByName('valu_name').AsString;
    end;
        with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   valname_.Text :=FieldByName('val_name').AsString;
    end;


end;

procedure TFormAccIn.debtvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));

end;

procedure TFormAccIn.creditvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));

end;

procedure TFormAccIn.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TFormAccIn.ButtonCancelClick(Sender: TObject);
begin
debtvalue.value :=0.00;
creditvalue.value :=0.00;
ekv.value :=0.00;
EditTransName.text :='';
dbedit7.text :='';
dbedit8.text :='';
SearchEdit3.text :='';
SearchEdit2.text :='';
SearchEdit1.text :='';

end;

procedure TFormAccIn.ButtonApplyClick(Sender: TObject);
var
p_DebitID   :integer;
p_CreditID  :integer;
p_Amount    :real;
p_TransName : string;
 begin
p_DebitID:=strtoint(acc_id.text);
p_CreditID:=strtoint(acc_id_.text);
p_Amount:=DebtValue.Value;
p_TransName:=EditTransName.Text;

 with DataMod_Buyers do begin
                        CC_GENERAL.CallProcedure('set_Transaction',[p_DebitID,
                                                                    p_CreditID,
                                                                    p_Amount,
                                                                    p_TransName]);
                        end;
                        
Close;
//DataMod_Buyers.ODSBuyers.Refresh;
DataMod_Buyers.Accno.Refresh;

 {if (debtvalue.value>0) and (creditvalue.value>0) and (ekv.value>0)
then begin
DataMod_Buyers.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id.text),
                                         Strtoint(acc_id_.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         datetostr(transdate.datetime)

                                       ]);
                                      commission_trans_km.refresh; end;
if (debtvalue.value>0) and (creditvalue.value>0) and (ekv.value>0)
then begin
DataMod_Buyers.OPackage.CallProcedure('ins_transaction',[
                                         acc_id.text,
                                         acc_id_.text,
                                         debtvalue.text,
                                         creditvalue.text,
                                         dbedit6.text,
                                         ekv.text,
                                         editrate.text,
                                         editrate_.text
                                       ]);
DataMod_Buyers.OPackage.Callprocedure('transaction_mn',[]);
DataMod_Buyers.OSCT.CallProcedure('settransactions',[
                                         commission_trans_km.fieldbyname('id').asinteger,
                                         commission_trans_km.fieldbyname('debt').asinteger,
                                         commission_trans_km.fieldbyname('credit').asinteger,
                                         commission_trans_km.fieldbyname('c_value').asinteger,
                                         commission_trans_km.fieldbyname('d_value').asinteger,
                                         commission_trans_km.fieldbyname('ddate').asdatetime

                                       ]);

close;
close;} 
{if (debtvalue.value=0) and (creditvalue.value=0) and (ekv.value=0)
 then
 showmessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');}

end;

procedure TFormAccIn.DBLookupComboBox5CloseUp(Sender: TObject);
begin
EditTransName.Text:=DBLookupComboBox5.keyvalue;
end;

procedure TFormAccIn.FormShow(Sender: TObject);
begin
  // DBLookupComboBox5.DataSource.:=CC_AccInForm.CC_InForm.fieldbyname('NAME').asstring;
 //  ShowMessage('debit___'+CC_AccInForm.CC_InForm.fieldbyname('debt').asstring) ;
if CC_AccInForm.CC_InForm.fieldbyname('debt').asinteger>0 then
   begin
  DataMod_Buyers.Sysdat.Open;
  acc_id.text := CC_AccInForm.CC_InForm.fieldbyname('debt').asstring;
  acc_id_.text :=DataMod_Buyers.Accno.fieldbyname('id').asstring;
  commission_id.text :=CC_AccInForm.CC_InForm.fieldbyname('id').asstring;
  TransDate.date :=DataMod_Buyers.Sysdat.Fieldbyname('tek_dat').asdatetime;
  EditTransName.text := CC_AccInForm.CC_InForm.fieldbyname('Name').asstring;
   end
   else
  // ShowMessage('credit____'+CC_AccInForm.CC_InForm.fieldbyname('credit').asstring) ;
if CC_AccInForm.CC_InForm.fieldbyname('credit').asinteger>0 then
   begin
  DataMod_Buyers.Sysdat.Open;
  acc_id.text :=DataMod_Buyers.Accno.fieldbyname('id').asstring;
  acc_id_.text :=CC_AccInForm.CC_InForm.fieldbyname('credit').asstring;
  commission_id.text :=CC_AccInForm.CC_InForm.fieldbyname('id').asstring;
  TransDate.date :=DataMod_Buyers.Sysdat.Fieldbyname('tek_dat').asdatetime;
  EditTransName.text := CC_AccInForm.CC_InForm.fieldbyname('Name').asstring;
   end;

  debtvalue.SetFocus;   
{if  CC_AccInForm.CC_InForm.fieldbyname('debt').asinteger=0 then
 ShowMessage('debt=0--- medaxil olmaz');
if  CC_AccInForm.CC_InForm.fieldbyname('credit').asinteger=0 then
 ShowMessage('credit=0--- mexaric olmaz');}
end;

end.

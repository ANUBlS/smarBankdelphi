unit CC_AccTransaction_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls, Db, OracleData;

type
  TFormAccOut = class(TForm)
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
    DBEdit6: TDBEdit;
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
    commission_trans_km: TOracleDataSet;
    commission_trans_data: TDataSource;
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure val_codeChange(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure acc_id_Change(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addvalute;
  end;

var
  FormAccOut: TFormAccOut;

implementation

uses UnitData, CC_AccInForm_Unit, CC_AccOutForm_Unit;

{$R *.DFM}

procedure TFormAccOut.DebtAccSearchEditChange(Sender: TObject);
begin
begin
 d_ostat.visible :=true;
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
   end;
procedure TFormAccOut.addvalute;
var
xxx: integer;
begin
with DataMod_Buyers.avalute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select valu_name from avalute');
                   Open;
                 end;
           editvalute.Clear;
                          for xxx:=1 to  DataMod_Buyers.avalute.RecordCount do begin
                              with editvalute do
                                  begin
                                       Items.Add(DataMod_Buyers.avalute.FieldByName('valu_name').AsString);

                                  end; {with}
                              DataMod_Buyers.avalute.Next;
                       end; {for}

    end;



procedure TFormAccOut.FormActivate(Sender: TObject);
begin
DataMod_Buyers.Accno.Open;
DataMod_Buyers.Sysdat.Open;
acc_id.text :=DataMod_Buyers.Accno.fieldbyname('id').asstring;
acc_id_.text :=CC_AccOutForm.CC_OutForm.fieldbyname('credit').asstring;
commission_id.text :=CC_AccOutForm.CC_OutForm.fieldbyname('id').asstring;
TransDate.date :=DataMod_Buyers.Sysdat.Fieldbyname('tek_dat').asdatetime;




end;

procedure TFormAccOut.acc_idChange(Sender: TObject);
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

procedure TFormAccOut.val_codeChange(Sender: TObject);
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

//-----------------------------------------------------------



with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '''+CreditAccSearchEdit.text+''' ';
   Open;
   cur_val_code.Text :=FieldByName('val_acc').AsString;
    end;

with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= 1001001 ';
   Open;
   dbedit3.Text :=FieldByName('name').AsString;
    end;


    end;



procedure TFormAccOut.debtvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));

end;

procedure TFormAccOut.creditvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));

end;

procedure TFormAccOut.SearchEdit1Change(Sender: TObject);
begin
Datamod_Buyers.Trdestination.fieldbyname('id').asinteger:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asinteger;

end;

procedure TFormAccOut.CreditAccSearchEditChange(Sender: TObject);
begin
with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='select * from accno where accno='+''''+CreditAccSearchEdit.Text+''' ' ;
   Open;
   cur_val_code.text :=fieldbyname('accvalcode').asstring;
  end;

with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
  //-----------------KNN-------------------------------------------------------------------
   with DataMod_Buyers.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;


procedure TFormAccOut.acc_id_Change(Sender: TObject);
begin
with DataMod_Buyers.Archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id_.Text+'''';
   Open;
   CreditAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit5.text :=CreditAccSearchEdit.Text;
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



procedure TFormAccOut.cur_val_codeChange(Sender: TObject);
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

//-----------------------------------------------------------
  end;


procedure TFormAccOut.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TFormAccOut.ButtonCancelClick(Sender: TObject);
begin
debtvalue.value :=0.00;
creditvalue.value :=0.00;
ekv.value :=0.00;
dbedit7.text :='';
dbedit8.text :='';
dbedit6.text :='';
SearchEdit2.text :='';
SearchEdit3.text :='';
SearchEdit1.text :='';

end;

procedure TFormAccOut.ButtonApplyClick(Sender: TObject);
begin
if (debtvalue.value>0) and (creditvalue.value>0) and (ekv.value>0)
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
close; end;
if (debtvalue.value=0) and (creditvalue.value=0) and (ekv.value=0)
 then
 showmessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');
end;



end.

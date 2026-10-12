unit P_Inform_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls;

type
  TP_Inform = class(TForm)
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
    Panel13: TPanel;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    SearchEdit2: TSearchEdit;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    SearchEdit3: TSearchEdit;
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
    commission_id: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    debtvalue: TEdit;
    creditvalue: TEdit;
    ekv: TEdit;
    Panel18: TPanel;
    ReportIDDBEdit: TEdit;
    ReportIDLookUp: TDBLookupComboBox;
    Panel19: TPanel;
    CountrIDDBEdit: TEdit;
    CountrIDLookUp: TDBLookupComboBox;
    procedure val_codeChange(Sender: TObject);
    procedure editvaluteChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);
    procedure ReportIDDBEditChange(Sender: TObject);
    procedure CountrIDDBEditChange(Sender: TObject);
    procedure ReportIDLookUpCloseUp(Sender: TObject);
    procedure CountrIDLookUpCloseUp(Sender: TObject);
    procedure CashSymbolLookUpCloseUp(Sender: TObject);
    procedure ConvertationSymbolLookUpCloseUp(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
    procedure SearchEdit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addvalute;
    procedure addvalute_;
  end;

var
  P_Inform: TP_Inform;

implementation

uses P_Datamod_Unit;

{$R *.DFM}

procedure TP_Inform.val_codeChange(Sender: TObject);
begin
with P_DataModuleFS.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+val_code.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
    with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
    end;
        with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   valname.Text :=FieldByName('val_name').AsString;
    end;


end;

procedure TP_Inform.editvaluteChange(Sender: TObject);
begin

    with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute.Text+'''';
   Open;
   val_code.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TP_Inform.DebtAccSearchEditChange(Sender: TObject);
begin
//P_DataModuleFS.acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
 d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

//---------------------- KNN------------------------------------------------------------
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
  //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_Inform.acc_idChange(Sender: TObject);
begin
with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   DebtAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit1.text :=DebtAccSearchEdit.Text;
end;
with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   val_code.Text :=FieldByName('val_acc').AsString;
    end;

with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   dbedit2.Text :=FieldByName('name').AsString;
    end;


end;

procedure TP_Inform.DBEdit1Change(Sender: TObject);
begin
//DebtAccSearchEdit.text :=DBLookupComboBox1.text;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
end;

procedure TP_Inform.DBLookupComboBox1Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TP_Inform.addvalute;
var
xxx: integer;
begin
with P_DataModuleFS.avalute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select valu_name from avalute');
                   Open;
                 end;
           editvalute.Clear;
                          for xxx:=1 to  P_DataModuleFS.avalute.RecordCount do begin
                              with editvalute do
                                  begin
                                       Items.Add(P_DataModuleFS.avalute.FieldByName('valu_name').AsString);

                                  end; {with}
                              P_DataModuleFS.avalute.Next;
                       end; {for}

    end;


    procedure TP_Inform.addvalute_;
var
xxx: integer;
begin
with P_DataModuleFS.avalute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select valu_name from avalute');
                   Open;
                 end;
           editvalute_.Clear;
                          for xxx:=1 to  P_DataModuleFS.avalute.RecordCount do begin
                              with editvalute_ do
                                  begin
                                       Items.Add(P_DataModuleFS.avalute.FieldByName('valu_name').AsString);
                                 
                                  end; {with}
                              P_DataModuleFS.avalute.Next;
                       end; {for}

    end;


procedure TP_Inform.DBLookupComboBox2Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
   end;


procedure TP_Inform.cur_val_codeChange(Sender: TObject);
begin
with P_DataModuleFS.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+cur_val_code.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;

end;
with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   editvalute_.Text :=FieldByName('valu_name').AsString;

    end;
    with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   valname_.Text :=FieldByName('val_name').AsString;

    end;

end;

procedure TP_Inform.editvalute_Change(Sender: TObject);
begin

    with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute_.Text+'''';
   Open;
   cur_val_code.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TP_Inform.CreditAccSearchEditChange(Sender: TObject);
begin
//P_DataModuleFS.acc_.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_Inform.DBLookupComboBox4Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_Inform.DBLookupComboBox3Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_Inform.debtvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.enabled :=true;   end;

if (debtvalue.Text<>'') and (debtvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));
end;
end;

procedure TP_Inform.creditvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.enabled :=true;   end;

if (creditvalue.Text<>'') and (creditvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));
 end;
end;

procedure TP_Inform.SearchEdit1Change(Sender: TObject);
begin
P_DataModuleFS.Trdestination.fieldbyname('id').asinteger:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asinteger;

end;

procedure TP_Inform.FormCreate(Sender: TObject);
begin
addvalute;
addvalute_;
end;

procedure TP_Inform.FormActivate(Sender: TObject);
begin
P_DataModuleFS.Sysdat.Open;
P_DataModuleFS.ACC.open;
P_DataModuleFS.ACC_.open;
P_DataModuleFS.Account.open;
P_DataModuleFS.CashSymbols.Open;
P_DataModuleFS.commission_trans_km.Open;
 DebtAccSearchEdit.text :='';
Dbedit1.text :='';
Dbedit2.text :='';
 CreditAccSearchEdit.text :='';
Dbedit5.text :='';
Dbedit3.text :='';
dbedit4.text :='';
dbedit9.text :='';   
ReportIDDBEdit.Text := '0';
CountrIDDBEdit.Text := '0';
TransDate.date :=P_DataModuleFS.Sysdat.Fieldbyname('tek_dat').asdatetime;
DebtAccSearchEdit.text :=P_DataModuleFS.CO_In.fieldbyname('debitaccount').asstring;
CreditAccSearchEdit.text :=P_DataModuleFS.Account.fieldbyname('accno').asstring;
 dbedit5.text :=DebtAccSearchEdit.text;
dbedit3.text :=P_DataModuleFS.Account.fieldbyname('accname').asstring;
cur_val_code.text :=P_DataModuleFS.Account.fieldbyname('accvalcode').asstring;
acc_id_.text :=P_DataModuleFS.Account.fieldbyname('id').asstring;
commission_id.text :=P_DataModuleFS.CO_In.fieldbyname('id').asstring;

acc_id.text :=P_DataModuleFS.CO_In.fieldbyname('debt').asstring;
dbedit6.text :=P_DataModuleFS.CO_In.fieldbyname('assignment').asstring;
dbedit5.text :=CreditAccSearchEdit.text;
//dbedit3.text :=CO_DataMod.CO_In.fieldbyname('debt_name').asstring;
//cur_val_code.text :=CO_DataMod.CO_In.fieldbyname('debt_val_acc').asstring;


end;

procedure TP_Inform.ButtonApplyClick(Sender: TObject);
var
DDate:TdateTime;
begin
DDate :=Trunc(TransDate.date);
if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
then begin
P_DataModuleFS.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id.text),
                                         Strtoint(acc_id_.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         DDate

                                       ]);
                                       P_DataModuleFS.commission_trans_km.refresh; end;
if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
then begin
P_DataModuleFS.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id.text),
                                         strtoint(acc_id_.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         dbedit6.text,
                                         ekv.Text,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text),
                                         ReportIDLookUp.KeyValue,
                                         CountrIDLookUp.KeyValue
                                       ]);
P_DataModuleFS.OPackage.Callprocedure('transaction_mn',[]);
P_DataModuleFS.OSCT.CallProcedure('settransactions',[
                                         P_DataModuleFS.commission_trans_km.fieldbyname('id').asinteger,
                                         P_DataModuleFS.commission_trans_km.fieldbyname('debt').asinteger,
                                         P_DataModuleFS.commission_trans_km.fieldbyname('credit').asinteger,
                                         P_DataModuleFS.commission_trans_km.fieldbyname('c_value').asinteger,
                                         P_DataModuleFS.commission_trans_km.fieldbyname('d_value').asinteger,
                                         P_DataModuleFS.commission_trans_km.fieldbyname('ddate').asdatetime

                                       ]);    close;
P_DataModuleFS.Transactions.close;
P_DataModuleFS.Transactions.open;

 end;
if (debtvalue.text='0') and (creditvalue.text='0') and (ekv.text='0')
 then
 showmessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');
end;



procedure TP_Inform.ButtonCancelClick(Sender: TObject);
begin
debtvalue.Text :='';
creditvalue.Text :='';
ekv.text :='';
//dbedit6.text :='';
SearchEdit3.text :='';
SearchEdit2.text :='';
SearchEdit1.text :='';

end;

procedure TP_Inform.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TP_Inform.debtvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_Inform.creditvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_Inform.ReportIDDBEditChange(Sender: TObject);
begin
  ReportIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TP_Inform.CountrIDDBEditChange(Sender: TObject);
begin
  CountrIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TP_Inform.ReportIDLookUpCloseUp(Sender: TObject);
begin
  ReportIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TP_Inform.CountrIDLookUpCloseUp(Sender: TObject);
begin
  CountrIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;
        
procedure TP_Inform.ConvertationSymbolLookUpCloseUp(Sender: TObject);
begin      try
  SearchEdit2.Text := (Sender as TDBLookupComboBox).keyvalue;  except end;
end;

procedure TP_Inform.CashSymbolLookUpCloseUp(Sender: TObject);
begin     try
  SearchEdit3.Text := (Sender as TDBLookupComboBox).keyvalue;
  except end;
end;

procedure TP_Inform.SearchEdit3Change(Sender: TObject);
begin
  CashSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

procedure TP_Inform.SearchEdit2Change(Sender: TObject);
begin
  ConvertationSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text
 

end;


end.

unit P_OutForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls, Db, OracleData;

type
  TP_OutForm = class(TForm)
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
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DebtAccSearchEdit: TSearchEdit;
    acc_id_: TEdit;
    Panel6: TPanel;
    valcode: TEdit;
    editvalute: TComboBox;
    editrate: TEdit;
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
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    CreditAccSearchEdit: TSearchEdit;
    acc_id: TEdit;
    Panel11: TPanel;
    valcode_: TEdit;
    editvalute_: TComboBox;
    editrate_: TEdit;
    Edit1: TEdit;
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
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit9: TDBEdit;
    SearchEdit4: TSearchEdit;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    commission_id: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    debtvalue: TEdit;
    creditvalue: TEdit;
    ekv: TEdit;
    Panel19: TPanel;
    CountrIDDBEdit: TEdit;
    CountrIDLookUp: TDBLookupComboBox;
    Panel18: TPanel;
    ReportIDDBEdit: TEdit;
    ReportIDLookUp: TDBLookupComboBox;
    DebitAccData: TOracleDataSet;
    DebitAccs: TDataSource;
    CreditAccs: TDataSource;
    CreditAccData: TOracleDataSet;
    procedure valcodeChange(Sender: TObject);
    procedure editvaluteChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure valcode_Change(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);
    procedure ekvKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure ReportIDLookUpCloseUp(Sender: TObject);
    procedure CountrIDLookUpCloseUp(Sender: TObject);
    procedure ReportIDDBEditChange(Sender: TObject);
    procedure CountrIDDBEditChange(Sender: TObject);
    procedure CashSymbolLookUpCloseUp(Sender: TObject);
    procedure ConvertationSymbolLookUpCloseUp(Sender: TObject);
    procedure SearchEdit3Change(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure addvalute;
  end;

var
  P_OutForm: TP_OutForm;

implementation

uses P_Datamod_Unit;

{$R *.DFM}

procedure TP_OutForm.valcodeChange(Sender: TObject);
begin
with P_DataModuleFS.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
//--------------------KNN-------------------------------------------------15.08.2006
   with P_DataModuleFS.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+valcode.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
end;
end;

procedure TP_OutForm.editvaluteChange(Sender: TObject);
begin
with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute.Text+'''';
   Open;
   valcode.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TP_OutForm.DebtAccSearchEditChange(Sender: TObject);
begin
//P_DataModuleFS.acc_.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
d_ostat.visible :=true;
d_pok_ostat.visible :=true;

with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_OutForm.DBLookupComboBox2Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;

with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_OutForm.DBLookupComboBox1Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------TKenan
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_OutForm.valcode_Change(Sender: TObject);
begin
with P_DataModuleFS.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode_.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;
    end;
      //--------------------KNN-------------------------------------------------TKenan
         with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+valcode_.Text+'''';
   Open;
   editvalute_.Text :=FieldByName('valu_name').AsString;
    end;

end;

procedure TP_OutForm.editvalute_Change(Sender: TObject);
begin

    with P_DataModuleFS.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute_.Text+'''';
   Open;
   valcode_.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TP_OutForm.CreditAccSearchEditChange(Sender: TObject);
begin
//P_DataModuleFS.acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_OutForm.acc_idChange(Sender: TObject);
begin
with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   creditAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit5.text :=CreditAccSearchEdit.Text;
end;
with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   valcode_.Text :=FieldByName('val_acc').AsString;
    end;

with P_DataModuleFS.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   dbedit3.Text :=FieldByName('name').AsString;
    end;



end;

procedure TP_OutForm.debtvalueChange(Sender: TObject);
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

procedure TP_OutForm.creditvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.enabled :=true;   end;

if (creditvalue.Text<>'') and (creditvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));
end; end;

procedure TP_OutForm.FormActivate(Sender: TObject);
begin
TransDate.date :=P_DataModuleFS.Sysdat.Fieldbyname('tek_dat').asdatetime;
DebtAccSearchEdit.text :=P_DataModuleFS.Account.fieldbyname('accno').asstring;
CreditAccSearchEdit.text :=P_DataModuleFS.CO_Out.fieldbyname('creditaccount').asstring;
dbedit2.text :=DebtAccSearchEdit.text;
dbedit1.text :=P_DataModuleFS.Account.fieldbyname('accname').asstring;
valcode.text :=P_DataModuleFS.Account.fieldbyname('accvalcode').asstring;
acc_id.text :=P_DataModuleFS.CO_Out.fieldbyname('credit').asstring;
acc_id_.text :=P_DataModuleFS.Account.fieldbyname('id').asstring;
dbedit6.text :=P_DataModuleFS.CO_Out.fieldbyname('assignment').asstring;
commission_id.text :=P_DataModuleFS.CO_Out.fieldbyname('id').asstring;
P_DataModuleFS.commission_trans_km.Open;
dbedit9.text :=''; 
ReportIDDBEdit.Text := '0';
CountrIDDBEdit.Text := '0';


end;

procedure TP_OutForm.addvalute;
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

procedure TP_OutForm.FormCreate(Sender: TObject);
begin
addvalute;

end;

procedure TP_OutForm.ButtonApplyClick(Sender: TObject);
var
DDate:TdateTime;
begin
DDate :=Trunc(TransDate.date);
if (debtvalue.text<>'') and (creditvalue.text<>'') and (ekv.text<>'')
then begin
P_DataModuleFS.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id_.text),
                                         Strtoint(acc_id.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         DDate

                                       ]);
                                       P_DataModuleFS.commission_trans_km.refresh; end;

if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
then begin
P_DataModuleFS.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id_.text),
                                         strtoint(acc_id.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         dbedit6.text,
                                         ekv.Text,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text) ,
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

                                       ]);   


Close;
P_DataModuleFS.Transactions.close;
P_DataModuleFS.Transactions.open;end;
if (debtvalue.Text='0') and (creditvalue.Text='0') and (ekv.Text='0')
 then
 showmessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');

end;




procedure TP_OutForm.ButtonCancelClick(Sender: TObject);
begin
debtvalue.Text :='';
creditvalue.Text :='';
ekv.Text :='';
//dbedit6.text :='';
SearchEdit2.text :='';
SearchEdit3.text :='';
SearchEdit1.text :='';

end;

procedure TP_OutForm.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TP_OutForm.debtvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_OutForm.creditvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_OutForm.ekvKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TP_OutForm.DBLookupComboBox4Click(Sender: TObject);
begin
CreditAccSearchEdit.text :=Dbedit5.text;

with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TP_OutForm.DBLookupComboBox3Click(Sender: TObject);
begin
CreditAccSearchEdit.text :=Dbedit5.text;
with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------TKenan
   with P_DataModuleFS.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from fsaccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TP_OutForm.ReportIDDBEditChange(Sender: TObject);
begin
  ReportIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TP_OutForm.CountrIDDBEditChange(Sender: TObject);
begin
  CountrIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TP_OutForm.ReportIDLookUpCloseUp(Sender: TObject);
begin
  ReportIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TP_OutForm.CountrIDLookUpCloseUp(Sender: TObject);
begin
  CountrIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TP_OutForm.ConvertationSymbolLookUpCloseUp(Sender: TObject);
begin          try
  SearchEdit2.Text := (Sender as TDBLookupComboBox).keyvalue;  
  except end;
end;

procedure TP_OutForm.CashSymbolLookUpCloseUp(Sender: TObject);
begin           try
  SearchEdit3.Text := (Sender as TDBLookupComboBox).keyvalue; 
  except end;
end;

procedure TP_OutForm.SearchEdit3Change(Sender: TObject);
begin                   
  CashSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

procedure TP_OutForm.SearchEdit2Change(Sender: TObject);
begin  
  ConvertationSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;
end.

unit CO_Transact_Unitp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, NLSLocalizer, StdCtrls, ComCtrls, SearchEdit, Mask,
  DBCtrls, ExtCtrls;

type
  TCO_Transactions = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    d_pok_ostat: TLabel;
    d_ostat: TLabel;
    Panel4: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    DebtAccSearchEdit: TSearchEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    editrate: TDBEdit;
    val_code: TEdit;
    acc_id: TDBEdit;
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
    Panel11: TPanel;
    cur_val_code: TEdit;
    editrate_: TDBEdit;
    editvalute_: TDBLookupComboBox;
    acc_id_: TDBEdit;
    editvalute: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    debtvalue: TEdit;
    Panel12: TPanel;
    creditvalue: TEdit;
    Panel13: TPanel;
    ekv: TEdit;
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
    Trdest: TEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    TransDate: TDateTimePicker;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    NLSLocalizer1: TNLSLocalizer;
    DebitCurrencyData: TOracleDataSet;
    DebitCurrencyDataID: TIntegerField;
    DebitCurrencyDataSNAME: TStringField;
    DebitCurrencyDataNAME: TStringField;
    DebitCurrencyDataRATE: TFloatField;
    DebitCurrency: TDataSource;
    DebitAccData: TOracleDataSet;
    DebitAccs: TDataSource;
    CreditCurrencyData: TOracleDataSet;
    CreditCurrencyDataID: TIntegerField;
    CreditCurrencyDataSNAME: TStringField;
    CreditCurrencyDataNAME: TStringField;
    CreditCurrencyDataRATE: TFloatField;
    CreditCurrency: TDataSource;
    CreditAccData: TOracleDataSet;
    CreditAccs: TDataSource;
    dbedit6: TEdit;
    procedure val_codeChange(Sender: TObject);
    procedure val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure editvaluteClick(Sender: TObject);
    procedure editvaluteCloseUp(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DebtAccSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure cur_val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure editvalute_Click(Sender: TObject);
    procedure editvalute_CloseUp(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure CreditAccSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueChange(Sender: TObject);
    procedure TrdestChange(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TrdestKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_Transactions: TCO_Transactions;

implementation

uses CO_datamod_impl;

{$R *.DFM}

procedure TCO_Transactions.val_codeChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then
   Editvalute.KeyValue := StrToInt((Sender as TEdit).Text)
   else Editvalute.KeyValue := null;
   EditvaluteCloseUp(Sender);

end;

procedure TCO_Transactions.val_codeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
DebtAccSearchEdit.SetFocus;

end;

procedure TCO_Transactions.editvaluteClick(Sender: TObject);
begin
  val_code.Text := IntToStr(editvalute.ListSource.DataSet.FieldByName('id').AsInTeger);

end;

procedure TCO_Transactions.editvaluteCloseUp(Sender: TObject);
begin
with DebtAccSearchEdit, CO_Datamod do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+DebitCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;

end;
with CO_Datamod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+val_code.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
end;

end;

procedure TCO_Transactions.DebtAccSearchEditChange(Sender: TObject);
begin


 d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

//---------------------- KNN------------------------------------------------------------
with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
  //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
 

end;

procedure TCO_Transactions.DebtAccSearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
cur_val_code.setfocus;

end;

procedure TCO_Transactions.DBLookupComboBox1Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TCO_Transactions.DBLookupComboBox2Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;
with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TCO_Transactions.cur_val_codeChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then
   editvalute_.KeyValue := StrToInt((Sender as TEdit).Text)
   else editvalute_.KeyValue := null;
   editvalute_CloseUp(Sender);

end;

procedure TCO_Transactions.cur_val_codeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
CreditAccSearchEdit.Setfocus;

end;

procedure TCO_Transactions.editvalute_Click(Sender: TObject);
begin
  cur_val_code.Text := IntToStr(editvalute_.ListSource.DataSet.FieldByName('id').AsInTeger);

end;

procedure TCO_Transactions.editvalute_CloseUp(Sender: TObject);
begin
begin
 with CreditAccSearchEdit, CO_Datamod do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+CreditCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;
 end;

end;

end;

procedure TCO_Transactions.CreditAccSearchEditChange(Sender: TObject);
begin
 c_ostat.visible :=true;
 c_pok_ostat.visible :=true;


with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TCO_Transactions.CreditAccSearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
debtvalue.setfocus;

end;

procedure TCO_Transactions.DBLookupComboBox4Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TCO_Transactions.DBLookupComboBox3Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_Datamod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TCO_Transactions.debtvalueChange(Sender: TObject);
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

procedure TCO_Transactions.debtvalueKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
Trdest.Setfocus;

end;

procedure TCO_Transactions.creditvalueChange(Sender: TObject);
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

procedure TCO_Transactions.TrdestChange(Sender: TObject);
begin
   if  (Sender as TEdit).Text <>''  then
   DBLookupComboBox5.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupComboBox5.KeyValue := null;
  dbedit6.text :=DBLookupComboBox5.text;

end;

procedure TCO_Transactions.DBLookupComboBox5Click(Sender: TObject);
begin
  Trdest.Text := IntToStr(DBLookupComboBox5.ListSource.DataSet.FieldByName('id').AsInTeger);
 dbedit6.text :=DBLookupComboBox5.text;
end;

procedure TCO_Transactions.ButtonApplyClick(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')
then begin
CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id.text),
                                         strtoint(acc_id_.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         dbedit6.text,
                                         ekv.Text,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text)
                                       ]);
CO_DataMod.OPackage.Callprocedure('transaction_mn',[]);

DebtAccSearchEdit.text :='';
CreditAccSearchEdit.text :='';
dbedit1.text :='';
dbedit2.text :='';
dbedit3.text :='';
dbedit5.text :='';
debtvalue.Text :='';
creditvalue.text :='';
ekv.text :='';
trdest.text :='';
val_code.Setfocus;  end
else
ShowMessage('ћ€бл€ьи дахил един!');
end;

procedure TCO_Transactions.ButtonCancelClick(Sender: TObject);
begin
debtvalue.text :='';
creditvalue.text :='';
ekv.Text :='';

end;

procedure TCO_Transactions.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TCO_Transactions.FormCreate(Sender: TObject);
begin

  if not DebitAccData.Active then DebitAccData.Open;
 if not CreditAccData.Active then CreditAccData.Open;
end;

procedure TCO_Transactions.FormActivate(Sender: TObject);
begin
CO_DataMod.Sysdat.Open;
TransDate.Date :=CO_DataMod.Sysdat.fieldbyname('tek_dat').asdatetime;
 val_code.text :='0';
 cur_val_code.text :='0';
 DebtAccSearchEdit.text :='';
Dbedit1.text :='';
Dbedit2.text :='';
 CreditAccSearchEdit.text :='';
Dbedit5.text :='';
Dbedit3.text :='';
dbedit7.text :='';
dbedit8.text :='';
end;

procedure TCO_Transactions.TrdestKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
ButtonApply.SetFocus;
end;

end.

unit CO_TransactionPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ActnList, ComCtrls, StdCtrls, CurrencyEdit, Mask, DBCtrls, SearchEdit,
  ExtCtrls, NLSLocalizer, Db, OracleData, Variants;
     
type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);
type
  TCO_Transaction = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    d_pok_ostat: TLabel;
    Panel4: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    DebtAccSearchEdit: TSearchEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
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
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    debtvalue: TCurrencyEdit;
    Panel12: TPanel;
    creditvalue: TCurrencyEdit;
    Panel13: TPanel;
    ekv: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    SearchEdit2: TSearchEdit;
    cashpanel: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    SearchEdit3: TSearchEdit;
    Panel16: TPanel;
    DBLookupComboBox5: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    TransDate: TDateTimePicker;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    NLSLocalizer1: TNLSLocalizer;
    Trdest: TEdit;
    acc_id: TDBEdit;
    acc_id_: TDBEdit;
    DebitCurrencyData: TOracleDataSet;
    DebitCurrencyDataID: TIntegerField;
    DebitCurrencyDataSNAME: TStringField;
    DebitCurrencyDataNAME: TStringField;
    DebitCurrencyDataRATE: TFloatField;
    DebitCurrency: TDataSource;
    DebitAccData: TOracleDataSet;
    DebitAccs: TDataSource;
    editvalute: TDBLookupComboBox;
    editrate: TDBEdit;
    val_code: TEdit;
    editrate_: TDBEdit;
    CreditCurrencyData: TOracleDataSet;
    CreditCurrencyDataID: TIntegerField;
    CreditCurrencyDataSNAME: TStringField;
    CreditCurrencyDataNAME: TStringField;
    CreditCurrencyDataRATE: TFloatField;
    CreditCurrency: TDataSource;
    editvalute_: TDBLookupComboBox;
    CreditAccData: TOracleDataSet;
    CreditAccs: TDataSource;
    d_ostat: TLabel;
    DBEdit6: TEdit;
    Panel18: TPanel;
    ReportIDDBEdit: TEdit;
    ReportIDLookUp: TDBLookupComboBox;
    Panel19: TPanel;
    CountrIDDBEdit: TEdit;
    CountrIDLookUp: TDBLookupComboBox;
    CreditAccDataID: TFloatField;
    CreditAccDataACC_NO: TStringField;
    CreditAccDataVAL_ACC: TIntegerField;
    CreditAccDataNAME: TStringField;
    CreditAccDataISCACHEACCOUNT: TFloatField;
    DebitAccDataID: TFloatField;
    DebitAccDataACC_NO: TStringField;
    DebitAccDataVAL_ACC: TIntegerField;
    DebitAccDataNAME: TStringField;
    DebitAccDataISCACHEACCOUNT: TFloatField;
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure TrdestChange(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure DebtAccSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure cur_val_codeKeyPress(Sender: TObject; var Key: Char);
    procedure CreditAccSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure TrdestKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonApplyKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure editvaluteCloseUp(Sender: TObject);
    procedure editrateChange(Sender: TObject);
    procedure val_codeChange(Sender: TObject);
    procedure editvaluteClick(Sender: TObject);
    procedure editvalute_Click(Sender: TObject);
    procedure DBLookupComboBox7Click(Sender: TObject);
    procedure editvalute_CloseUp(Sender: TObject);
    procedure ReportIDDBEditChange(Sender: TObject);
    procedure CountrIDDBEditChange(Sender: TObject);
    procedure ReportIDLookUpCloseUp(Sender: TObject);
    procedure CountrIDLookUpCloseUp(Sender: TObject);
    procedure ConvertationSymbolLookUpCloseUp(Sender: TObject);
    procedure CashSymbolLookUpCloseUp(Sender: TObject);
    procedure SearchEdit3Change(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
  Modifed: boolean;
    { Public declarations }
//    procedure addvalute;
  //  procedure addvalute_;
  TransactionSide: TTransactionSide;
    procedure SetCurrencyFilter(AccountDataSet, CurrencyDataSet: TDataSet);    
    procedure SetAmmounts(TransactionSide: TTransactionSide); 
    function RoundNew(X: Double; Precision: Integer ): Double;

  end;

var
  CO_Transaction: TCO_Transaction;

implementation

uses co_datamod_impl,sboapiDataModuleImpl;

{$R *.DFM}



procedure TCO_Transaction.DebtAccSearchEditChange(Sender: TObject);
begin


 d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
       
  cashpanel.Enabled := DebitAccDataISCACHEACCOUNT.AsInteger=1;
end;

procedure TCO_Transaction.DBEdit1Change(Sender: TObject);
begin

{//DebtAccSearchEdit.text :=DBLookupComboBox1.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
 }
end;

procedure TCO_Transaction.DBLookupComboBox1Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TCO_Transaction.DBLookupComboBox2Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TCO_Transaction.FormActivate(Sender: TObject);
begin
//DebtAcc.Open;
CO_DataMod.Sysdat.Open;

 DebtAccSearchEdit.text :='';
Dbedit1.text :='';
Dbedit2.text :='';
 CreditAccSearchEdit.text :='';
Dbedit5.text :='';
Dbedit3.text :='';


TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
val_code.text :='0';
cur_val_code.text :='0';
ReportIDDBEdit.Text := '0';
CountrIDDBEdit.Text := '0';


end;

procedure TCO_Transaction.FormCreate(Sender: TObject);
begin

  if not DebitAccData.Active then DebitAccData.Open;
 if not CreditAccData.Active then CreditAccData.Open;
           editvalute.KeyValue := 0;//DebitAccData.Fields[0].AsVariant;
 end;




procedure TCO_Transaction.cur_val_codeChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then
   editvalute_.KeyValue := StrToInt((Sender as TEdit).Text)
   else editvalute_.KeyValue := null;
   editvalute_CloseUp(Sender);
  dbedit3.text :='';
dbedit5.text :='';
end;

procedure TCO_Transaction.editvalute_Change(Sender: TObject);
begin

    with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute_.Text+'''';
   Open;
   cur_val_code.Text :=FieldByName('valute').AsString;
     end;


end;

procedure TCO_Transaction.CreditAccSearchEditChange(Sender: TObject);
begin
 c_ostat.visible :=true;
 c_pok_ostat.visible :=true;


with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

  cashpanel.Enabled := CreditAccDataISCACHEACCOUNT.AsInteger=1;

end;

procedure TCO_Transaction.DBLookupComboBox4Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TCO_Transaction.DBLookupComboBox3Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from FSACCS where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;
             
procedure CutEditText(Sender: TObject);//Eldarix
var
 X, Sel: Integer;
begin
with TCurrencyEdit(Sender) do
 begin
 if DecimalSeparator=ThousandSeparator then Exit;
  if Pos(DecimalSeparator,Text) = 0 then Exit;
  Sel :=SelStart;
  X :=Length(Text)-Pos(DecimalSeparator,Text)-CurrencyDecimals;
  if (X>0) then
   begin
    Text:=Copy(Text, 0, (Length(Text)-X));
    SelStart :=Sel;
   end;
 end;
end;

function TCO_Transaction.RoundNew(X: Double; Precision: Integer ): Double;
var
  ScaledFractPart, Temp : Double;
begin
  ScaledFractPart := Frac(X)*Precision;
  Temp := Frac(ScaledFractPart);
  ScaledFractPart := Int(ScaledFractPart);
  //if Temp >= 0.5 then ScaledFractPart := ScaledFractPart + 1; ***Closed by Hesen R.***
  //if Temp <= -0.5 then ScaledFractPart := ScaledFractPart - 1; ***Closed by Hesen R.***
  if Round(Temp*100) >= 50 then ScaledFractPart := ScaledFractPart + 1; //***Written by Hesen R.***
  if Round(Temp*100) <= -50 then ScaledFractPart := ScaledFractPart - 1; //***Written by Hesen R.***
  RoundNew := Int(X) + ScaledFractPart/Precision;
end;

procedure TCO_Transaction.SetAmmounts(TransactionSide: TTransactionSide);
var
   DebetRate, CreditRate, DebitAmmount,CreditAmmount,LAmmount: Currency;
begin

  DebetRate :=DebitCurrencyData.FieldByName('Rate').AsCurrency;
  CreditRate :=CreditCurrencyData.FieldByName('Rate').AsCurrency;

 case TransactionSide of
  tsDebet:
         begin
          LAmmount:=RoundNew(debtvalue.Value * DebetRate, 10000);
          CreditAmmount:=RoundNew(LAmmount / CreditRate, 10000);
          ekv.Value :=RoundNew(LAmmount, 100);
          creditvalue.Value :=RoundNew(CreditAmmount , 100);

          //CurrencyEditLammount.Value :=RoundNew(CurrencyEditDebit.Value * DebetRate, 100);
          //CurrencyEditCredit.Value :=RoundNew(CurrencyEditLammount.Value / CreditRate, 100);
         end;
  tsCredit:
         begin
          LAmmount:= RoundNew(creditvalue.Value * CreditRate, 10000);
          DebitAmmount:=RoundNew(LAmmount / DebetRate, 10000);
          ekv.Value :=RoundNew(LAmmount, 100);
          debtvalue.Value :=RoundNew(DebitAmmount, 100);

         // CurrencyEditLammount.Value :=RoundNew(CurrencyEditCredit.Value * CreditRate, 100);
         // CurrencyEditDebit.Value :=RoundNew(CurrencyEditLammount.Value / DebetRate, 100);
         end;
  tsUnknown:
        begin
         with Self do
         begin
          if DebitCurrencyData.FieldByName('ID').AsInteger = 0 then
           debtvalue.Value :=ekv.Value;
          if CreditCurrencyData.FieldByName('ID').AsInteger = 0 then
           creditvalue.Value :=ekv.Value;
         end;
        end;
 end;
end;

procedure TCO_Transaction.debtvalueChange(Sender: TObject);
begin
{if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonCancel.enabled :=true;   end;

if (debtvalue.Text<>'') and (debtvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));
end;}
 CutEditText(Sender);
ButtonApply.enabled :=true;
 if TCurrencyEdit(Sender).Text =EmptyStr then TCurrencyEdit(Sender).Value :=0;
 case TCurrencyEdit(Sender).Tag of
  1: TransactionSide :=tsDebet;
  2: TransactionSide :=tsCredit;
  3: TransactionSide :=tsUnknown;
 end;
  SetAmmounts(TransactionSide);
  Modifed :=True;

end;

procedure TCO_Transaction.creditvalueChange(Sender: TObject);
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

procedure TCO_Transaction.TrdestChange(Sender: TObject);
begin
   if  (Sender as TEdit).Text <>''  then
   DBLookupComboBox5.KeyValue := StrToInt((Sender as TEdit).Text)
   else DBLookupComboBox5.KeyValue := null;
  dbedit6.text :=DBLookupComboBox5.text;

end;

procedure TCO_Transaction.DBLookupComboBox5Click(Sender: TObject);
begin
  Trdest.Text := IntToStr(DBLookupComboBox5.ListSource.DataSet.FieldByName('id').AsInTeger);
dbedit6.text :=DBLookupComboBox5.text;

end;

procedure TCO_Transaction.val_codeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
DebtAccSearchEdit.SetFocus;
end;

procedure TCO_Transaction.DebtAccSearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
cur_val_code.setfocus;


end;

procedure TCO_Transaction.cur_val_codeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
CreditAccSearchEdit.Setfocus;
  end;




procedure TCO_Transaction.CreditAccSearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
debtvalue.setfocus;



end;

procedure TCO_Transaction.debtvalueKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
Trdest.Setfocus;

end;

procedure TCO_Transaction.TrdestKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
ButtonApply.SetFocus;

end;

procedure TCO_Transaction.ButtonApplyKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
  end;


end;

procedure TCO_Transaction.ButtonApplyClick(Sender: TObject);
begin

if (debtvalue.Text<>'')
and (debtvalue.Text<>'0')
and (creditvalue.Text<>'')
and (creditvalue.Text<>'0')
and (ekv.Text<>'')
and (ekv.Text<>'0')
then begin
CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id.text),
                                         strtoint(acc_id_.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         dbedit6.text,
                                         ekv.Value,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text),
                                         ReportIDLookUp.KeyValue,
                                         CountrIDLookUp.KeyValue,
                                         CashSymbolLookUp.KeyValue,
                                         ConvertationSymbolLookUp.KeyValue
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
val_code.Setfocus;   end
else begin
Showmessage('ћ€бл€ьи дахил един!');

end;
      end;
procedure TCO_Transaction.ButtonCloseClick(Sender: TObject);
begin
Close;
end;

procedure TCO_Transaction.ButtonCancelClick(Sender: TObject);
begin
debtvalue.text :='';
creditvalue.text :='';
ekv.Text :='';

end;
procedure TCO_Transaction.SetCurrencyFilter(AccountDataSet, CurrencyDataSet: TDataSet);
var
   AccountID: integer;
begin
 AccountID :=AccountDataSet.FieldByName('ID').AsInteger;
 AccountDataSet.Filtered :=False;
 AccountDataSet.Filter :='val_acc='+CurrencyDataSet.FieldByName('ID').AsString;
 AccountDataSet.Filtered :=True;
 AccountDataSet.Locate('ID',AccountID,[]);
end;

procedure TCO_Transaction.editvaluteCloseUp(Sender: TObject);
begin
with DebtAccSearchEdit, CO_DataMod do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+DebitCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;

end;
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+val_code.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
end;

end;

procedure TCO_Transaction.editrateChange(Sender: TObject);
begin
 //Modifed :=True;

end;

procedure TCO_Transaction.val_codeChange(Sender: TObject);
begin
  if  (Sender as TEdit).Text <>''  then
   Editvalute.KeyValue := StrToInt((Sender as TEdit).Text)
   else Editvalute.KeyValue := null;
   EditvaluteCloseUp(Sender);
   dbedit1.text :='';
dbedit2.text :='';
 
end;

procedure TCO_Transaction.editvaluteClick(Sender: TObject);
begin
  val_code.Text := IntToStr(editvalute.ListSource.DataSet.FieldByName('id').AsInTeger);

end;

procedure TCO_Transaction.editvalute_Click(Sender: TObject);
begin
  cur_val_code.Text := IntToStr(editvalute.ListSource.DataSet.FieldByName('id').AsInTeger);

end;

procedure TCO_Transaction.DBLookupComboBox7Click(Sender: TObject);
begin
  cur_val_code.Text := IntToStr(editvalute_.ListSource.DataSet.FieldByName('id').AsInTeger);

end;

procedure TCO_Transaction.editvalute_CloseUp(Sender: TObject);
begin
begin
 with CreditAccSearchEdit, CO_DataMod do
 begin
  DataSource.DataSet.Filtered :=False;
  DataSource.DataSet.Filter :='val_acc= '+CreditCurrencyData.FieldByName('ID').AsString;
  DataSource.DataSet.Filtered :=True;
  Text :='';//DataSource.DataSet.FieldByName('acc_no').AsString;
 end;
      
end;
    end;
procedure TCO_Transaction.ReportIDDBEditChange(Sender: TObject);
begin
  ReportIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TCO_Transaction.CountrIDDBEditChange(Sender: TObject);
begin
  CountrIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TCO_Transaction.ReportIDLookUpCloseUp(Sender: TObject);
begin
  ReportIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TCO_Transaction.CountrIDLookUpCloseUp(Sender: TObject);
begin
  CountrIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TCO_Transaction.ConvertationSymbolLookUpCloseUp(Sender: TObject);
begin
  try
  SearchEdit2.Text := (Sender as TDBLookupComboBox).keyvalue;   
  except end;
end;

procedure TCO_Transaction.CashSymbolLookUpCloseUp(Sender: TObject);
begin
  try
  SearchEdit3.Text := (Sender as TDBLookupComboBox).keyvalue;
  except end;
end;

procedure TCO_Transaction.SearchEdit3Change(Sender: TObject);
begin                   
  CashSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

procedure TCO_Transaction.SearchEdit2Change(Sender: TObject);
begin  
  ConvertationSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

end.

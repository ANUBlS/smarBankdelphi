unit InFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls, Db, OracleData;
        
type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);

type
  TInForm = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    D_Ostat: TLabel;
    D_Pok_Ostat: TLabel;
    Panel4: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    DebtAccSearchEdit: TSearchEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Acc_ID: TEdit;
    Panel6: TPanel;
    EditValute: TComboBox;
    val_code: TEdit;
    editrate: TEdit;
    valname: TEdit;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    C_Ostat: TLabel;
    C_Pok_Ostat: TLabel;
    Panel9: TPanel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Panel10: TPanel;
    CreditAccSearchEdit: TSearchEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    Acc_ID_: TEdit;
    Panel11: TPanel;
    editrate_: TEdit;
    EditValute_: TComboBox;
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
    DebtValue: TCurrencyEdit;
    CreditValue: TCurrencyEdit;
    Ekv: TCurrencyEdit;
    Panel18: TPanel;
    ReportIDDBEdit: TEdit;
    ReportIDLookUp: TDBLookupComboBox;
    Panel19: TPanel;
    CountrIDDBEdit: TEdit;
    CountrIDLookUp: TDBLookupComboBox;
    Button1: TButton;
    DebitAccData: TOracleDataSet;
    CreditAccData: TOracleDataSet;
    CreditAccs: TDataSource;
    DebitAccs: TDataSource;
    DebitAccDataID: TFloatField;
    DebitAccDataACC_NO: TStringField;
    DebitAccDataVAL_ACC: TIntegerField;
    DebitAccDataNAME: TStringField;
    DebitAccDataISCACHEACCOUNT: TFloatField;
    CreditAccDataID: TFloatField;
    CreditAccDataACC_NO: TStringField;
    CreditAccDataVAL_ACC: TIntegerField;
    CreditAccDataNAME: TStringField;
    CreditAccDataISCACHEACCOUNT: TFloatField;
    DebitCurrencyData: TOracleDataSet;
    DebitCurrencyDataID: TIntegerField;
    DebitCurrencyDataSNAME: TStringField;
    DebitCurrencyDataNAME: TStringField;
    DebitCurrencyDataRATE: TFloatField;
    CreditCurrencyData: TOracleDataSet;
    CreditCurrencyDataID: TIntegerField;
    CreditCurrencyDataSNAME: TStringField;
    CreditCurrencyDataNAME: TStringField;
    CreditCurrencyDataRATE: TFloatField;
    CreditCurrency: TDataSource;
    DebitCurrency: TDataSource;
    NLSLocalizer1: TNLSLocalizer;
    procedure val_codeChange(Sender: TObject);
    procedure EditValuteChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure Acc_IDChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure EditValute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DebtValueChange(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure DebtValueKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);
    procedure ReportIDDBEditChange(Sender: TObject);
    procedure CountrIDDBEditChange(Sender: TObject);
    procedure ReportIDLookUpCloseUp(Sender: TObject);
    procedure CountrIDLookUpCloseUp(Sender: TObject);
    procedure CashSymbolLookUpCloseUp(Sender: TObject);
    procedure ConvertationSymbolLookUpCloseUp(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
    procedure SearchEdit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SearchEdit3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }  
    procedure SetAmmounts(TransactionSide: TTransactionSide);  
    function RoundNew(X: Double; Precision: Integer ): Double;
    procedure AddValute;
    procedure SetCashSymbol;
  end;

var
  InForm: TInForm;
  TransactionSide: TTransactionSide;
implementation

uses co_datamod_impl;

{$R *.DFM}

procedure TInForm.SetCashSymbol;
begin
 with CO_DataMod, CashSymbolLookUp do
 begin
  DebitAccData.locate('acc_no', DebtAccSearchEdit.text,[]);
  CreditAccData.locate('acc_no', CreditAccSearchEdit.text,[]);
  if (DebitAccData.FieldByName('IsCacheAccount').AsInteger = 1) and (DebitAccData.FieldByName('val_acc').AsInteger = 0) then
   ListSource.DataSet.Filter :='Mediocrity = 0'
  else
  if (CreditAccData.FieldByName('IsCacheAccount').AsInteger = 1) and (CreditAccData.FieldByName('val_acc').AsInteger = 0) then
   ListSource.DataSet.Filter :='Mediocrity = 1'
  else
   ListSource.DataSet.Filter :='Mediocrity = -1';
  ListSource.DataSet.Filtered :=False;
  ListSource.DataSet.Filtered :=True;
 end;
end;

function TInForm.RoundNew(X: Double; Precision: Integer ): Double;
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

procedure TInForm.SetAmmounts(TransactionSide: TTransactionSide);
var
   DebetRate, CreditRate:real; DebitAmmount,CreditAmmount,LAmmount: Currency;
begin
  DebetRate :=strtofloat(editrate.text);
  CreditRate :=strtofloat(editrate_.text);

 case TransactionSide of
  tsDebet:
         begin
          LAmmount:=RoundNew(debtvalue.Value * DebetRate, 1000000);
          if DebitCurrencyData.FieldByName('ID').AsInteger =
             CreditCurrencyData.FieldByName('ID').AsInteger {H.R. 24.09.2010}
           then CreditAmmount := DebtValue.Value
           else CreditAmmount:=RoundNew(LAmmount / CreditRate, 1000000);
          //CreditAmmount:=RoundNew(LAmmount / CreditRate, 1000000);
          ekv.Value :=RoundNew(LAmmount, 100);
          creditvalue.Value :=RoundNew(CreditAmmount , 100);

          //CurrencyEditLammount.Value :=RoundNew(CurrencyEditDebit.Value * DebetRate, 100);
          //CurrencyEditCredit.Value :=RoundNew(CurrencyEditLammount.Value / CreditRate, 100);
         end;
  tsCredit:
         begin
          LAmmount:= RoundNew(creditvalue.Value * CreditRate, 1000000);
          if DebitCurrencyData.FieldByName('ID').AsInteger =
             CreditCurrencyData.FieldByName('ID').AsInteger {H.R. 24.09.2010}
           then DebitAmmount := CreditValue.Value
           else DebitAmmount:=RoundNew(LAmmount / DebetRate, 1000000);
          //DebitAmmount:=RoundNew(LAmmount / DebetRate, 1000000);
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

procedure TInForm.val_codeChange(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+val_code.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
    with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
    end;
        with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+val_code.Text+'''';
   Open;
   valname.Text :=FieldByName('val_name').AsString;
    end;
  DebitCurrencyData.Locate('ID', val_code.Text, []);
end;

procedure TInForm.EditValuteChange(Sender: TObject);
begin

    with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute.Text+'''';
   Open;
   val_code.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TInForm.DebtAccSearchEditChange(Sender: TObject);
begin
  d_ostat.visible :=true;
  d_pok_ostat.visible :=true;
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID.Text;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.Acc_IDChange(Sender: TObject);
begin
with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   DebtAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit1.text :=DebtAccSearchEdit.Text;
end;
with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   val_code.Text :=FieldByName('val_acc').AsString;
    end;

with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   dbedit2.Text :=FieldByName('name').AsString;
    end;


end;

procedure TInForm.DBEdit1Change(Sender: TObject);
begin
//DebtAccSearchEdit.text :=DBLookupComboBox1.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
    SQL.Text :='Select * from tenostat where acc_id='+Acc_ID.Text;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
   D_Pok_Ostat.Caption :=FieldByName('Pok_Ostat').AsString;
  end;
end;

procedure TInForm.DBLookupComboBox1Click(Sender: TObject);
begin
  DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
  d_pok_ostat.visible :=true;
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID.Text;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.addvalute;
var
  xxx: integer;
begin
  with CO_DataMod.avalute do begin
   Close;
   SQL.Clear;
   SQL.Add('select valu_name from avalute');
   Open;
  end;
  editvalute.Clear;
  editvalute_.Clear;
  for xxx:=1 to CO_DataMod.avalute.RecordCount do begin
   EditValute.Items.Add(CO_DataMod.avalute.FieldByName('valu_name').AsString);
   EditValute_.Items.Add(CO_DataMod.avalute.FieldByName('valu_name').AsString);
   CO_DataMod.avalute.Next;
  end; {for}
end;

procedure TInForm.DBLookupComboBox2Click(Sender: TObject);
begin
  DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
  d_pok_ostat.visible :=true;
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID.Text;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;


procedure TInForm.cur_val_codeChange(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+cur_val_code.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;

end;
with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   editvalute_.Text :=FieldByName('valu_name').AsString;

    end;
    with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+cur_val_code.Text+'''';
   Open;
   valname_.Text :=FieldByName('val_name').AsString;

    end;
    CreditCurrencyData.Locate('ID', cur_val_code.Text, []);

end;

procedure TInForm.EditValute_Change(Sender: TObject);
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

procedure TInForm.CreditAccSearchEditChange(Sender: TObject);
begin
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID_.Text;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.DBLookupComboBox4Click(Sender: TObject);
begin
  CreditAccSearchEdit.text :=Dbedit5.text;
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID_.Text;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.DBLookupComboBox3Click(Sender: TObject);
begin
  CreditAccSearchEdit.text :=Dbedit5.text;
  with CO_DataMod.archost do begin
   Close;
   SQL.Clear;
   //SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   SQL.Text :='Select * from tenostat where acc_id='+Acc_ID_.Text;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure CutEditText(Sender: TObject);
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

procedure TInForm.DebtValueChange(Sender: TObject);
begin
{if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.enabled :=true;   end;

if (debtvalue.Text<>'') and (debtvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));}
 CutEditText(Sender);
 if TCurrencyEdit(Sender).Text =EmptyStr then TCurrencyEdit(Sender).Value :=0;
 case TCurrencyEdit(Sender).Tag of
  1: TransactionSide :=tsDebet;
  2: TransactionSide :=tsCredit;
  3: TransactionSide :=tsUnknown;
 end;
  SetAmmounts(TransactionSide);

end;

procedure TInForm.SearchEdit1Change(Sender: TObject);
begin
CO_DataMod.Trdestination.fieldbyname('id').asinteger:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asinteger;

end;

procedure TInForm.FormCreate(Sender: TObject);
begin
  AddValute;
end;

procedure TInForm.FormActivate(Sender: TObject);
begin
  with CO_DataMod do begin
   if not Sysdat.Active then CO_DataMod.Sysdat.Open;
   if not ACC.Active then ACC.open;
   if not ACC_.Active then ACC_.open;
   if not Account.Active then Account.open;
   if not CashSymbols.Active then CashSymbols.Open;
   if not commission_trans_km.Active then commission_trans_km.Open;
   if not CO_In.Active then CO_In.Open;
  end;
  if not DebitAccData.Active then DebitAccData.Open;
  Acc_ID.Text :=CO_DataMod.CO_In.FieldByName('debt').AsString;
  Acc_ID_.Text :=CO_DataMod.Account.FieldByName('ID').AsString;

  DebtAccSearchEdit.Text :=CO_DataMod.CO_In.FieldByName('debitaccount').AsString;
  dbedit4.text :='';
  dbedit9.text :='';
  ReportIDDBEdit.Text := '0';
  CountrIDDBEdit.Text := '0';
  TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
  CreditAccSearchEdit.text :=CO_DataMod.Account.fieldbyname('accno').asstring;
  dbedit3.text :=CO_DataMod.Account.fieldbyname('accname').asstring;
  cur_val_code.text :=CO_DataMod.Account.fieldbyname('accvalcode').asstring;
  commission_id.text :=CO_DataMod.CO_In.fieldbyname('id').asstring;
  dbedit6.text :=CO_DataMod.CO_In.fieldbyname('assignment').asstring;
  dbedit5.text :=CreditAccSearchEdit.text;
  //dbedit3.text :=CO_DataMod.CO_In.fieldbyname('debt_name').asstring;
  //cur_val_code.text :=CO_DataMod.CO_In.fieldbyname('debt_val_acc').asstring;
end;

procedure TInForm.ButtonApplyClick(Sender: TObject);
var
  DDate :TdateTime;
  TransID :integer;
begin
  DDate :=Trunc(TransDate.date);
  if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
  then begin
   CO_DataMod.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id.text),
                                         Strtoint(acc_id_.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         DDate
                                         ]);
   CO_DataMod.commission_trans_km.refresh;
  end;
  if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
   then begin
    CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id.text),
                                         strtoint(acc_id_.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         dbedit6.text,
                                         ekv.value,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text),
                                         ReportIDLookUp.KeyValue,
                                         CountrIDLookUp.KeyValue,
                                         CashSymbolLookUp.KeyValue,
                                         ConvertationSymbolLookUp.KeyValue
                                         ]);
  TransID := CO_DataMod.OPackage.CallIntegerFunction('transaction_mn',[]);
  CO_DataMod.OSCT.CallProcedure('SetTransactions',[
                                         CO_DataMod.commission_trans_km.fieldbyname('id').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('debt').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('credit').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('c_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('d_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('ddate').asdatetime,
                                         TransID
                                       ]);
  Close;
  CO_DataMod.Transactions.close;
  CO_DataMod.Transactions.open;
  end;
  if (debtvalue.text='0') and (creditvalue.text='0') and (ekv.text='0')
   then
    ShowMessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');
end;

procedure TInForm.ButtonCancelClick(Sender: TObject);
begin
debtvalue.Text :='';
creditvalue.Text :='';
ekv.text :='';
//dbedit6.text :='';
SearchEdit3.text :='';
SearchEdit2.text :='';
SearchEdit1.text :='';

end;

procedure TInForm.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TInForm.DebtValueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TInForm.creditvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TInForm.ReportIDDBEditChange(Sender: TObject);
begin
  ReportIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TInForm.CountrIDDBEditChange(Sender: TObject);
begin
  CountrIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TInForm.ReportIDLookUpCloseUp(Sender: TObject);
begin
  ReportIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TInForm.CountrIDLookUpCloseUp(Sender: TObject);
begin
  CountrIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;
        
procedure TInForm.ConvertationSymbolLookUpCloseUp(Sender: TObject);
begin      try
  SearchEdit2.Text := (Sender as TDBLookupComboBox).keyvalue;  except end;
end;

procedure TInForm.CashSymbolLookUpCloseUp(Sender: TObject);
begin     try
  SearchEdit3.Text := (Sender as TDBLookupComboBox).keyvalue;
  except end;
end;

procedure TInForm.SearchEdit3Change(Sender: TObject);
begin
  CashSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

procedure TInForm.SearchEdit2Change(Sender: TObject);
begin
  ConvertationSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text
 

end;


procedure TInForm.Button1Click(Sender: TObject);
begin
  with CO_DataMod do begin
    Cntries.refresh;
    ReportDesc.refresh;
    ConvertationSymbols.refresh;
    CashSymbols.refresh;
    Trdestination.refresh;
  end;
end;

procedure TInForm.SearchEdit3Enter(Sender: TObject);
begin
  SetCashSymbol;
end;

end.

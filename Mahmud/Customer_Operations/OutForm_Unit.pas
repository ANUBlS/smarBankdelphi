unit OutForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ComCtrls, CurrencyEdit, SearchEdit, Mask,
  DBCtrls, ExtCtrls, Db, OracleData;
       
type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);

type
  TOutForm = class(TForm)
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
    ValCode: TEdit;
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
    ValCode_: TEdit;
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
    DebtValue: TCurrencyEdit;
    CreditValue: TCurrencyEdit;
    Ekv: TCurrencyEdit;
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
    Button1: TButton;
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
    procedure ValCodeChange(Sender: TObject);
    procedure editvaluteChange(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure ValCode_Change(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure DebtValueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure DebtValueKeyPress(Sender: TObject; var Key: Char);
    procedure CreditValueKeyPress(Sender: TObject; var Key: Char);
    procedure EkvKeyPress(Sender: TObject; var Key: Char);
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
    procedure Button1Click(Sender: TObject);
    procedure SearchEdit3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }   
    procedure SetAmmounts(TransactionSide: TTransactionSide);
    function RoundNew(X: Double; Precision: Integer ): Double;
    procedure addvalute;
    procedure SetCashSymbol;
  end;


var
  OutForm: TOutForm;
  TransactionSide: TTransactionSide;
implementation

uses CO_datamod_impl;

{$R *.DFM}
                                    
procedure TOutForm.SetCashSymbol;
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

function TOutForm.RoundNew(X: Double; Precision: Integer ): Double;
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

procedure TOutForm.SetAmmounts(TransactionSide: TTransactionSide);
var
   DebetRate, CreditRate:real; DebitAmmount,CreditAmmount,LAmmount: Currency;
begin
  DebetRate :=strtofloat(editrate.text);
  CreditRate :=strtofloat(editrate_.text);

 case TransactionSide of
  tsDebet:
         begin
          LAmmount:=RoundNew(debtvalue.Value * DebetRate, 1000000);
          if ValCode.Text =
             ValCode_.Text {H.R. 24.09.2010}
           then CreditAmmount := DebtValue.Value
           else CreditAmmount:=RoundNew(LAmmount / CreditRate, 1000000);
          //CreditAmmount:=RoundNew(LAmmount / CreditRate, 1000000);
          Ekv.Value :=RoundNew(LAmmount, 100);
          creditvalue.Value :=RoundNew(CreditAmmount , 100);

          //CurrencyEditLammount.Value :=RoundNew(CurrencyEditDebit.Value * DebetRate, 100);
          //CurrencyEditCredit.Value :=RoundNew(CurrencyEditLammount.Value / CreditRate, 100);
         end;
  tsCredit:
         begin
          LAmmount:= RoundNew(creditvalue.Value * CreditRate, 1000000);
          if ValCode.Text =
             ValCode_.Text {H.R. 24.09.2010}
           then DebitAmmount := CreditValue.Value
           else DebitAmmount:=RoundNew(LAmmount / DebetRate, 1000000);
          //DebitAmmount:=RoundNew(LAmmount / DebetRate, 1000000);
          Ekv.Value :=RoundNew(LAmmount, 100);
          debtvalue.Value :=RoundNew(DebitAmmount, 100);

         // CurrencyEditLammount.Value :=RoundNew(CurrencyEditCredit.Value * CreditRate, 100);
         // CurrencyEditDebit.Value :=RoundNew(CurrencyEditLammount.Value / DebetRate, 100);
         end;
  tsUnknown:
        begin
         with Self do
         begin
          if valcode.text = '0' then
           debtvalue.Value :=ekv.Value;
          if valcode_.text = '0' then
           creditvalue.Value :=ekv.Value;
         end;
        end;
 end;
end;

procedure TOutForm.ValCodeChange(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
//---------------------------------------------------------------------15.08.2006
   with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+valcode.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
end;
end;

procedure TOutForm.editvaluteChange(Sender: TObject);
begin
with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute.Text+'''';
   Open;
   valcode.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TOutForm.DebtAccSearchEditChange(Sender: TObject);
begin
//CO_DataMod.acc_.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
d_ostat.visible :=true;
d_pok_ostat.visible :=true;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TOutForm.DBLookupComboBox2Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TOutForm.DBLookupComboBox1Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TOutForm.ValCode_Change(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode_.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;
    end;
      //---------------------------------------------------------------------
         with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute_t c where valute= '+''''+valcode_.Text+'''';
   Open;
   editvalute_.Text :=FieldByName('valu_name').AsString;
    end;

end;

procedure TOutForm.editvalute_Change(Sender: TObject);
begin

    with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valu_name= '+''''+editvalute_.Text+'''';
   Open;
   valcode_.Text :=FieldByName('valute').AsString;
     end;

end;

procedure TOutForm.CreditAccSearchEditChange(Sender: TObject);
begin
//CO_DataMod.acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TOutForm.acc_idChange(Sender: TObject);
begin
with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   creditAccSearchEdit.Text :=FieldByName('acc_no').AsString;
   dbedit5.text :=CreditAccSearchEdit.Text;
end;
with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   valcode_.Text :=FieldByName('val_acc').AsString;
    end;

with CO_DataMod.ACC do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from account c where id= '+''''+acc_id.Text+'''';
   Open;
   dbedit3.Text :=FieldByName('name').AsString;
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

procedure TOutForm.DebtValueChange(Sender: TObject);
begin
 CutEditText(Sender);
 if TCurrencyEdit(Sender).Text =EmptyStr then TCurrencyEdit(Sender).Value :=0;
 case TCurrencyEdit(Sender).Tag of
  1: TransactionSide :=tsDebet;
  2: TransactionSide :=tsCredit;
  3: TransactionSide :=tsUnknown;
 end;
  SetAmmounts(TransactionSide);

end;

procedure TOutForm.creditvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.enabled :=true;   end;

if (creditvalue.Text<>'') and (creditvalue.Text<>'0') then begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));
end; end;

procedure TOutForm.FormActivate(Sender: TObject);
begin
TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
DebtAccSearchEdit.text :=CO_DataMod.Account.fieldbyname('accno').asstring;
CreditAccSearchEdit.text :=CO_DataMod.CO_Out.fieldbyname('creditaccount').asstring;
dbedit2.text :=DebtAccSearchEdit.text;
dbedit1.text :=CO_DataMod.Account.fieldbyname('accname').asstring;
valcode.text :=CO_DataMod.Account.fieldbyname('accvalcode').asstring;
acc_id.text :=CO_DataMod.CO_Out.fieldbyname('credit').asstring;
acc_id_.text :=CO_DataMod.Account.fieldbyname('id').asstring;
dbedit6.text :=CO_DataMod.CO_Out.fieldbyname('assignment').asstring;
commission_id.text :=CO_DataMod.CO_Out.fieldbyname('id').asstring;
CO_DataMod.commission_trans_km.Open;
dbedit9.text :=''; 
ReportIDDBEdit.Text := '0';
CountrIDDBEdit.Text := '0';


end;

procedure TOutForm.addvalute;
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
                          for xxx:=1 to  CO_DataMod.avalute.RecordCount do begin
                              with editvalute do
                                  begin
                                       Items.Add(CO_DataMod.avalute.FieldByName('valu_name').AsString);

                                  end; {with}
                              CO_DataMod.avalute.Next;
                       end; {for}

    end;

procedure TOutForm.FormCreate(Sender: TObject);
begin
addvalute;

end;

procedure TOutForm.ButtonApplyClick(Sender: TObject);
var
  DDate :TdateTime;
  TransID :integer;
begin
  DDate :=Trunc(TransDate.date);
  if (debtvalue.text<>'') and (creditvalue.text<>'') and (ekv.text<>'')
   then begin
    CO_DataMod.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id_.text),
                                         Strtoint(acc_id.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         DDate
                                          ]);
                                        CO_DataMod.commission_trans_km.refresh;
   end;

  if (debtvalue.Text<>'') and (creditvalue.Text<>'') and (ekv.Text<>'')
   then begin
    CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         strtoint(acc_id_.text),
                                         strtoint(acc_id.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         dbedit6.text,
                                         ekv.value,
                                         strtofloat(editrate.text),
                                         strtofloat(editrate_.text) ,
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
  if (debtvalue.Text='0') and (creditvalue.Text='0') and (ekv.Text='0')
   then
    showmessage('Дахил етдийиниз мябляь сыфырдан бюйцк олмалыдыр!');
end;




procedure TOutForm.ButtonCancelClick(Sender: TObject);
begin
debtvalue.Text :='';
creditvalue.Text :='';
ekv.Text :='';
//dbedit6.text :='';
SearchEdit2.text :='';
SearchEdit3.text :='';
SearchEdit1.text :='';

end;

procedure TOutForm.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TOutForm.DebtValueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TOutForm.CreditValueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TOutForm.EkvKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TOutForm.DBLookupComboBox4Click(Sender: TObject);
begin
CreditAccSearchEdit.text :=Dbedit5.text;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;


end;

procedure TOutForm.DBLookupComboBox3Click(Sender: TObject);
begin
CreditAccSearchEdit.text :=Dbedit5.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from juraccs where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;

end;

procedure TOutForm.ReportIDDBEditChange(Sender: TObject);
begin
  ReportIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TOutForm.CountrIDDBEditChange(Sender: TObject);
begin
  CountrIDLookUp.KeyValue := (Sender as TEdit).Text
end;

procedure TOutForm.ReportIDLookUpCloseUp(Sender: TObject);
begin
  ReportIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TOutForm.CountrIDLookUpCloseUp(Sender: TObject);
begin
  CountrIDDBEdit.Text := (Sender as TDBLookupComboBox).keyvalue;
end;

procedure TOutForm.ConvertationSymbolLookUpCloseUp(Sender: TObject);
begin          try
  SearchEdit2.Text := (Sender as TDBLookupComboBox).keyvalue;  
  except end;
end;

procedure TOutForm.CashSymbolLookUpCloseUp(Sender: TObject);
begin           try
  SearchEdit3.Text := (Sender as TDBLookupComboBox).keyvalue; 
  except end;
end;

procedure TOutForm.SearchEdit3Change(Sender: TObject);
begin                   
  CashSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;

procedure TOutForm.SearchEdit2Change(Sender: TObject);
begin  
  ConvertationSymbolLookUp.KeyValue := (Sender as TSearchEdit).Text

end;
procedure TOutForm.Button1Click(Sender: TObject);
begin
  with CO_DataMod do begin
    Cntries.refresh;
    ReportDesc.refresh;
    ConvertationSymbols.refresh;
    CashSymbols.refresh;
    Trdestination.refresh;
  end;
end;

procedure TOutForm.SearchEdit3Enter(Sender: TObject);
begin
SetCashSymbol;
end;

end.

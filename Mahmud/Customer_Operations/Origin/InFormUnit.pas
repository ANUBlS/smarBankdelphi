unit InFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, ActnList, ComCtrls, DBCtrls, CurrencyEdit, Mask, ExtCtrls,
  SearchEdit, NLSLocalizer;


type
  TInForm = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel1: TPanel;
    PanelDebit: TPanel;
    PanelDebitRest: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    DebtAccSearchEdit: TSearchEdit;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    Panel16: TPanel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TransDate: TDateTimePicker;
    DBEditOperationNo: TDBEdit;
    DBEdit4: TDBEdit;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    d_ostat: TLabel;
    Panel3: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    d_pok_ostat: TLabel;
    editvalute: TComboBox;
    val_code: TEdit;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    c_ostat: TLabel;
    c_pok_ostat: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    editrate_: TEdit;
    CreditAccSearchEdit: TSearchEdit;
    editvalute_: TComboBox;
    cur_val_code: TEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    DBEdit7: TDBEdit;
    SearchEdit3: TSearchEdit;
    DBEdit8: TDBEdit;
    editrate: TEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    acc_id: TEdit;
    acc_id_: TEdit;
    valname: TEdit;
    valname_: TEdit;
    commission_id: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    SearchEdit4: TSearchEdit;
    DBEdit9: TDBEdit;
    debtvalue: TEdit;
    creditvalue: TEdit;
    Edit1: TEdit;
    ekv: TEdit;
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
      procedure addvalute;
      procedure addvalute_;
   procedure FormCreate(Sender: TObject);
    procedure editvaluteChange(Sender: TObject);
    procedure val_codeChange(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure cur_val_codeChange(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
    procedure SearchEdit3Change(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure SearchEdit4Change(Sender: TObject);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonApplyKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);
//    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  InForm: TInForm;

implementation
    Uses CO_datamod_impl, CO_In_Unit;
{$R *.DFM}

procedure TInForm.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TInForm.WMNCPaint(var message: TWMNCPaint);
const Capt = 'ям€лиййат';
var dc : hDc;
begin
inherited;
Caption:='';
dc := GetWindowDC(Handle);
        SetBkMode(dc,Transparent);
        SetTextColor(dc,clWhite);
        SelectObject(dc, Font.Handle);
        TextOut(dc, 23,6,Capt,Length(Capt));
end;

procedure TInForm.DebtAccSearchEditChange(Sender: TObject);
begin
//CO_Datamod.acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
 d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

//---------------------- KNN------------------------------------------------------------
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
  //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;




















procedure TInForm.FormActivate(Sender: TObject);
begin
CO_DataMod.Sysdat.Open;
CO_DataMod.ACC.open;
CO_DataMod.ACC_.open;
CO_DataMod.Account.open;
CO_DataMod.CashSymbols.Open;
CO_DataMod.commission_trans_km.Open;
 DebtAccSearchEdit.text :='';
Dbedit1.text :='';
Dbedit2.text :='';
 CreditAccSearchEdit.text :='';
Dbedit5.text :='';
Dbedit3.text :='';
dbedit7.text :='';
dbedit8.text :='';
dbedit4.text :='';
dbedit9.text :='';
TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
CreditAccSearchEdit.text :=CO_DataMod.Account.fieldbyname('accno').asstring;
dbedit5.text :=CreditAccSearchEdit.text;
dbedit3.text :=CO_DataMod.Account.fieldbyname('accname').asstring;
cur_val_code.text :=CO_DataMod.Account.fieldbyname('accvalcode').asstring;
acc_id_.text :=CO_DataMod.Account.fieldbyname('id').asstring;
commission_id.text :=CO_DataMod.CO_In.fieldbyname('id').asstring;

acc_id.text :=CO_DataMod.CO_In.fieldbyname('Debt').asstring;
dbedit6.text :=CO_DataMod.CO_In.fieldbyname('assignment').asstring;
dbedit5.text :=CreditAccSearchEdit.text;
//dbedit3.text :=CO_DataMod.CO_In.fieldbyname('debt_name').asstring;
//cur_val_code.text :=CO_DataMod.CO_In.fieldbyname('debt_val_acc').asstring;

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
                          for xxx:=1 to  CO_DataMod.avalute.RecordCount do begin
                              with editvalute do
                                  begin
                                       Items.Add(CO_DataMod.avalute.FieldByName('valu_name').AsString);

                                  end; {with}
                              CO_DataMod.avalute.Next;
                       end; {for}

    end;


    procedure TInForm.addvalute_;
var
xxx: integer;
begin
with CO_DataMod.avalute do begin
 Close;
                     SQL.Clear;
                     SQL.Add('select valu_name from avalute');
                   Open;
                 end;
           editvalute_.Clear;
                          for xxx:=1 to  CO_DataMod.avalute.RecordCount do begin
                              with editvalute_ do
                                  begin
                                       Items.Add(CO_DataMod.avalute.FieldByName('valu_name').AsString);
                                 
                                  end; {with}
                              CO_DataMod.avalute.Next;
                       end; {for}

    end;


procedure TInForm.DBLookupComboBox1Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;

with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.DBEdit1Change(Sender: TObject);
begin
//DebtAccSearchEdit.text :=DBLookupComboBox1.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
end;
procedure TInForm.DBLookupComboBox2Click(Sender: TObject);
begin
 DebtAccSearchEdit.text :=Dbedit1.text;
  d_ostat.visible :=true;
 d_pok_ostat.visible :=true;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
   end;
procedure TInForm.FormCreate(Sender: TObject);
begin
TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;

addvalute;
addvalute_;

end;

procedure TInForm.editvaluteChange(Sender: TObject);
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

    end;

procedure TInForm.CreditAccSearchEditChange(Sender: TObject);
begin
//CO_Datamod.acc_.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.editvalute_Change(Sender: TObject);
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
    end;
procedure TInForm.DBLookupComboBox4Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;



procedure TInForm.DBLookupComboBox3Click(Sender: TObject);
begin
 CreditAccSearchEdit.text :=Dbedit5.text;
 with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
   //-----------------KNN-------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+creditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TInForm.SearchEdit1Change(Sender: TObject);
begin
CO_Datamod.Trdestination.fieldbyname('id').asinteger:=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asinteger;

end;

procedure TInForm.debtvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.Enabled :=true;  end;

if (debtvalue.text <>'') and (debtvalue.text <>'0') then  begin
 Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));
 end;
end;

procedure TInForm.creditvalueChange(Sender: TObject);
begin
if (debtvalue.Text<>'') and (debtvalue.Text<>'0') and (creditvalue.Text<>'')and (creditvalue.Text<>'0')   and (ekv.Text<>'') and (ekv.Text<>'0')

then begin
ButtonApply.enabled :=true;
ButtonCancel.Enabled :=true;  end;

if (creditvalue.text <>'') and (creditvalue.text <>'0') then  begin
 Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));
end;
end;

procedure TInForm.SearchEdit2Change(Sender: TObject);
begin
CO_Datamod.ConvertationSymbols.fieldbyname('id').asstring :=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;

procedure TInForm.SearchEdit3Change(Sender: TObject);
begin
CO_Datamod.CashSymbols.fieldbyname('symbol').asstring :=TSearchEdit(Sender).datasource.dataset.fieldbyname('symbol').asstring;

end;

procedure TInForm.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TInForm.acc_idChange(Sender: TObject);
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
procedure TInForm.ButtonApplyClick(Sender: TObject);
var
DDate:TdateTime;
begin
DDate :=Trunc(TransDate.date);
if (debtvalue.Text<>'') and (debtvalue.Text<>'0' ) and (creditvalue.Text<>'') and (creditvalue.Text<>'0') and (ekv.Text<>'') and (ekv.Text<>'0')  then begin

CO_DataMod.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id.text),
                                         Strtoint(acc_id_.text),
                                         debtvalue.Text,
                                         creditvalue.Text,
                                         DDate

                                       ]);
                                       CO_DataMod.commission_trans_km.refresh; end;
if (debtvalue.Text<>'') and (debtvalue.Text<>'0' ) and (creditvalue.Text<>'') and (creditvalue.Text<>'0') and (ekv.Text<>'') and (ekv.Text<>'0')
then begin
CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         Strtoint(acc_id.text),
                                         Strtoint(acc_id_.text),
                                         debtvalue.text,
                                         creditvalue.Text,
                                         dbedit6.text,
                                         ekv.Text,
                                         Strtofloat(editrate.text),
                                         Strtofloat(editrate_.text)
                                       ]);
CO_DataMod.OPackage.Callprocedure('transaction_mn',[]);
CO_DataMod.OSCT.CallProcedure('settransactions',[
                                         CO_DataMod.commission_trans_km.fieldbyname('id').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('debt').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('credit').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('c_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('d_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('ddate').asdatetime

                                       ]);    close;
CO_DataMod.Transactions.close;
CO_DataMod.Transactions.open;

CO_In_Form.close; end;
if (debtvalue.Text='0') and (creditvalue.Text='0') and (ekv.Text='0')
 then
 showmessage('ƒахил етдийиниз м€бл€ь сыфырдан бюйцк олмалыдыр!');
end;

procedure TInForm.ButtonCancelClick(Sender: TObject);
begin
debtvalue.Text :='';
creditvalue.Text :='';
ekv.Text :='';
//dbedit6.text :='';
dbedit7.text :='';
dbedit8.text :='';
SearchEdit3.text :='';
SearchEdit2.text :='';
SearchEdit1.text :='';
end;

procedure TInForm.SearchEdit4Change(Sender: TObject);
begin
CO_Datamod.OperationTypes.fieldbyname('id').asstring :=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;




procedure TInForm.debtvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure TInForm.ButtonApplyKeyPress(Sender: TObject; var Key: Char);
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

procedure TInForm.creditvalueKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

end.



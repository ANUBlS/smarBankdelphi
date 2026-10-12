unit OutForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,NLSDialogs,
  StdCtrls, ActnList, ComCtrls, CurrencyEdit, SearchEdit, Mask, DBCtrls,
  ExtCtrls, NLSLocalizer;

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
    Panel5: TPanel;
    Panel6: TPanel;
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
    debtvalue: TCurrencyEdit;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    valcode: TEdit;
    editvalute: TComboBox;
    editrate: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DebtAccSearchEdit: TSearchEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    valcode_: TEdit;
    editvalute_: TComboBox;
    editrate_: TEdit;
    CreditAccSearchEdit: TSearchEdit;
    Edit1: TEdit;
    acc_id: TEdit;
    acc_id_: TEdit;
    commission_id: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit9: TDBEdit;
    SearchEdit4: TSearchEdit;
    procedure FormActivate(Sender: TObject);
    procedure valcodeChange(Sender: TObject);
    procedure editvaluteChange(Sender: TObject);
    procedure addvalute;
    procedure FormCreate(Sender: TObject);
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure valcode_Change(Sender: TObject);
    procedure editvalute_Change(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);
    procedure acc_idChange(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure SearchEdit4Change(Sender: TObject);
    procedure debtvalueKeyPress(Sender: TObject; var Key: Char);
    procedure creditvalueKeyPress(Sender: TObject; var Key: Char);
    procedure ekvKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OutForm: TOutForm;

implementation

uses CO_datamod_impl, CO_Out_Unit;

{$R *.DFM}
  
procedure TOutForm.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TOutForm.WMNCPaint(var message: TWMNCPaint);
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

procedure TOutForm.FormActivate(Sender: TObject);
begin
TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
DebtAccSearchEdit.text :=CO_DataMod.Account.fieldbyname('accno').asstring;
dbedit2.text :=DebtAccSearchEdit.text;
dbedit1.text :=CO_DataMod.Account.fieldbyname('accname').asstring;
valcode.text :=CO_DataMod.Account.fieldbyname('accvalcode').asstring;
acc_id.text :=CO_DataMod.CO_Out.fieldbyname('credit').asstring;
acc_id_.text :=CO_DataMod.Account.fieldbyname('id').asstring;
dbedit6.text :=CO_DataMod.CO_Out.fieldbyname('commisionassignment').asstring;
commission_id.text :=CO_DataMod.CO_Out.fieldbyname('id').asstring;
CO_DataMod.commission_trans_km.Open;
dbedit7.text :='';
dbedit8.text :='';
dbedit9.text :='';
end;

procedure TOutForm.valcodeChange(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode.Text+'''';
   Open;
   editrate.Text :=FieldByName('ostat').AsString;
    end;
//--------------------KNN-------------------------------------------------15.08.2006
   with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+valcode.Text+'''';
   Open;
   editvalute.Text :=FieldByName('valu_name').AsString;
end;        end;

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

procedure TOutForm.DebtAccSearchEditChange(Sender: TObject);
begin
CO_Datamod.acc_.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
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

procedure TOutForm.DBLookupComboBox2Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;

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

procedure TOutForm.DBLookupComboBox1Click(Sender: TObject);
begin
DebtAccSearchEdit.text :=Dbedit2.text;
with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;

 //-----------------KNN-------------------------------------------------------------------TKenan
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
end;

procedure TOutForm.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TOutForm.valcode_Change(Sender: TObject);
begin
with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+valcode_.Text+'''';
   Open;
   editrate_.Text :=FieldByName('ostat').AsString;
    end;
      //--------------------KNN-------------------------------------------------TKenan
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
CO_Datamod.acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
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

procedure TOutForm.debtvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(editrate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate_.text));

end;

procedure TOutForm.creditvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(editrate_.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(editrate.text));

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


procedure TOutForm.ButtonApplyClick(Sender: TObject);
var
DDate:TdateTime;
begin
DDate :=Trunc(TransDate.date);
if (debtvalue.value>0) and (creditvalue.value>0) and (ekv.value>0)
then begin
CO_DataMod.OPackage.CallProcedure('ins_commission_trans_km',[
                                         Strtoint(commission_id.text),
                                         Strtoint(acc_id_.text),
                                         Strtoint(acc_id.text),
                                         debtvalue.value,
                                         creditvalue.value,
                                         DDate

                                       ]);
                                       CO_DataMod.commission_trans_km.refresh; end;
if (debtvalue.value>0) and (creditvalue.value>0) and (ekv.value>0)
then begin
CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         acc_id_.text,
                                         acc_id.text,
                                         debtvalue.text,
                                         creditvalue.text,
                                         dbedit6.text,
                                         ekv.text,
                                         editrate.text,
                                         editrate_.text
                                       ]);
CO_DataMod.OPackage.Callprocedure('transaction_mn',[]);
{CO_DataMod.OSCT.CallProcedure('settransactions',[
                                         CO_DataMod.commission_trans_km.fieldbyname('id').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('debt').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('credit').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('c_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('d_value').asinteger,
                                         CO_DataMod.commission_trans_km.fieldbyname('ddate').asdatetime

                                       ]);   }

Close;
CO_DataMod.Transactions.close;
CO_DataMod.Transactions.open;end;
if (debtvalue.value=0) and (creditvalue.value=0) and (ekv.value=0)
 then
 showmessage('ƒахил етдийиниз м€бл€ь сыфырдан бюйцк олмалыдыр!');

end;

procedure TOutForm.ButtonCancelClick(Sender: TObject);
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

procedure TOutForm.SearchEdit4Change(Sender: TObject);
begin
CO_Datamod.OperationTypes.fieldbyname('id').asstring :=TSearchEdit(Sender).datasource.dataset.fieldbyname('id').asstring;

end;

procedure TOutForm.debtvalueKeyPress(Sender: TObject; var Key: Char);
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

procedure TOutForm.creditvalueKeyPress(Sender: TObject; var Key: Char);
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

procedure TOutForm.ekvKeyPress(Sender: TObject; var Key: Char);
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

end.

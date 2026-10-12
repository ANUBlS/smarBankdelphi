unit CO_TransactionPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CurrencyEdit, ComCtrls, Mask, DBCtrls, SearchEdit, ExtCtrls,
  ActnList;
 type
  TTransactionSide = (tsDebet, tsCredit, tsUnknown);
type
  TCO_Transaction = class(TForm)
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    Panel2: TPanel;
    PanelCredit: TPanel;
    PanelCreditRest: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    c_ostat: TLabel;
    c_pok_ostat: TLabel;
    Panel8: TPanel;
    Creditname: TEdit;
    Panel9: TPanel;
    acc: TEdit;
    CreditAccSearchEdit: TEdit;
    c_id: TDBEdit;
    Panel10: TPanel;
    val_name: TEdit;
    rate: TEdit;
    CreditCurrencyID: TEdit;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    d_ostat: TLabel;
    d_pok_ostat: TLabel;
    Panel6: TPanel;
    d_name: TEdit;
    Panel7: TPanel;
    d_acc: TEdit;
    DebtAccSearchEdit: TEdit;
    d_id: TDBEdit;
    Panel11: TPanel;
    D_val_name: TEdit;
    d_rate: TEdit;
    DebtCurrencyID: TEdit;
    GroupBox2: TGroupBox;
    Panel12: TPanel;
    creditvalue: TCurrencyEdit;
    Panel13: TPanel;
    ekv: TCurrencyEdit;
    Panel3: TPanel;
    debtvalue: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Panel14: TPanel;
    ConvertationSymbolIDBEdit: TDBEdit;
    ConvertationSymbolLookUp: TDBLookupComboBox;
    Panel15: TPanel;
    CashSymbolLookUp: TDBLookupComboBox;
    CashSymbolDBEdit: TDBEdit;
    Panel16: TPanel;
    TrDestNoEdit: TEdit;
    assignment: TEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TransDate: TDateTimePicker;
    OperationTypeLookUp: TDBLookupComboBox;
    DBEditOperationNo: TDBEdit;
    DBEdit4: TDBEdit;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionCancel: TAction;
    ActionExit: TAction;
    ActionList2: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Panel17: TPanel;
    ButtonApply: TButton;
    ButtonClose: TButton;
    procedure FormActivate(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure DebtAccSearchEditChange(Sender: TObject);
    procedure CreditAccSearchEditChange(Sender: TObject);
    procedure debtvalueChange(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure creditvalueChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_Transaction: TCO_Transaction;

implementation

uses CO_datamod_impl, co_commission_unit;

{$R *.DFM}

procedure TCO_Transaction.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCO_Transaction.WMNCPaint(var message: TWMNCPaint);
const Capt = 'ям€лиййатлар';
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
procedure TCO_Transaction.FormActivate(Sender: TObject);
begin

CO_DataMod.Commission.open;
CO_DataMod.Account.open;
   CO_Transaction.DebtAccSearchEdit.Text :=CO_Commission.acc_no.text;
    CO_Transaction.d_name.Text :=CO_Commission.acc_name.text;
     CO_Transaction.DebtCurrencyID.Text :=CO_Commission.val_acc.text;
      TransDate.date :=CO_DataMod.Sysdat.Fieldbyname('tek_dat').asdatetime;
        with CO_Datamod do begin
         CO_Transaction.CreditAccSearchEdit.Text :=Commission.FieldByName('CreditAccount').AsString;
          CO_Transaction.assignment.Text :=Commission.FieldByName('commisionassignment').AsString;
         CO_Transaction.val_name.Text :=Commission.FieldByName('CreditValuteName').AsString;
        CO_Transaction.CreditCurrencyID.Text :=Commission.FieldByName('CreditCurrencyID').AsString;
       CO_Transaction.Creditname.Text :=Commission.FieldByName('creditname').AsString;
      CO_Transaction.assignment.Text :=Commission.FieldByName('commisionassignment').AsString;
//-----------------------------------KNN-------------------------------------------------------
      with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+CreditCurrencyID.Text+'''';
   Open;
   rate.Text :=FieldByName('ostat').AsString;  end;

//------------------------------------------------------------------------------------------------
  with CO_DataMod.temprate do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from temprate c where val_kod= '+''''+DebtCurrencyID.Text+'''';
   Open;
    d_rate.Text :=FieldByName('ostat').asstring;   end;
//------------------------------------------------------------------------------------------------
 with CO_DataMod.avalute do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select c.rowid ,c.* from avalute c where valute= '+''''+DebtCurrencyID.Text+'''';
   Open;
   D_val_name.Text :=FieldByName('valu_name').AsString;end;
//------------------------------------------------------------------------------------------------
    with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_ostat.caption :=fieldbyname('ostat').asstring;
  end;
//------------------------------------------------------------------------------------------------
    with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+DebtAccSearchEdit.Text+''')' ;
   Open;
   d_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
  end;
//------------------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_ostat.caption :=fieldbyname('ostat').asstring;
  end;
//------------------------------------------------------------------------------------------------
   with CO_DataMod.archost do
  begin
   Close;
    SQL.Clear;
    SQL.Text :='Select * from tenostat where acc_id in (select id from accno where accno='+''''+CreditAccSearchEdit.Text+''')' ;
   Open;
   c_pok_ostat.caption :=fieldbyname('pok_ostat').asstring;
     end;
      end;
       end;

procedure TCO_Transaction.ButtonCloseClick(Sender: TObject);
begin
Close;
end;

procedure TCO_Transaction.DebtAccSearchEditChange(Sender: TObject);
begin
d_acc.text :=DebtAccSearchEdit.text
end;

procedure TCO_Transaction.CreditAccSearchEditChange(Sender: TObject);
begin
acc.text :=CreditAccSearchEdit.text;
end;

procedure TCO_Transaction.debtvalueChange(Sender: TObject);

begin

Ekv.text := FormatFloat('#.##',Strtofloat(debtvalue.text)*Strtofloat(d_rate.text));
creditvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(rate.text));

 end;

procedure TCO_Transaction.ButtonApplyClick(Sender: TObject);
begin
CO_DataMod.OPackage.CallProcedure('ins_transaction',[
                                         d_id.text,
                                         c_id.text,
                                         debtvalue.text,
                                         creditvalue.text,
                                         assignment.text,
                                         ekv.text,
                                         rate.text,
                                         d_rate.text
                                       ]);
CO_DataMod.OPackage.Callprocedure('transaction_mn',[]);
close;
end;

procedure TCO_Transaction.creditvalueChange(Sender: TObject);
begin
Ekv.text := FormatFloat('#.##',Strtofloat(creditvalue.text)*Strtofloat(rate.text));
Debtvalue.text :=FormatFloat('#.##',Strtofloat(ekv.text)/Strtofloat(d_rate.text));

end;

end.

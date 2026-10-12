unit transaction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, SearchEdit;

type
  TEmeliyyat = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    SpeedButton1: TSpeedButton;
    total: TEdit;
    GroupBox6: TGroupBox;
    proper_edit: TEdit;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button1: TButton;
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchEdit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cleaning;
  end;

var
  Emeliyyat: TEmeliyyat;

implementation

uses datamodule, customers_orders_arest__;

{$R *.DFM}

procedure TEmeliyyat.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TEmeliyyat.WMNCPaint(var message: TWMNCPaint);
const Capt = 'ßìÿëèééàò';
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

procedure TEmeliyyat.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{DataModCustOrders.acc_no.setvariable('acc',strtoint(edit4.text));
DataModCustOrders.acc_no.open;
DataModCustOrders.acc_no.refresh;}

end;

procedure TEmeliyyat.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{DataModCustOrders.act_no.setvariable('acc',strtoint(edit5.text));
DataModCustOrders.act_no.open;
DataModCustOrders.act_no.refresh;    }

end;

procedure TEmeliyyat.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{DataModCustOrders.acc_no.setvariable('acc',edit4.text);
DataModCustOrders.acc_no.open;
DataModCustOrders.acc_no.refresh;  }


end;

procedure TEmeliyyat.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{DataModCustOrders.act_no.setvariable('acc',edit5.text);
DataModCustOrders.act_no.open;
DataModCustOrders.act_no.refresh; }

end;

procedure TEmeliyyat.cleaning;

var
  CompCount: word;
begin
 for CompCount :=0 to ComponentCount-1 do
  if(Components[CompCount] is TEdit) then
     (Components[CompCount] as TEdit).Text :=''
  else
   if(Components[CompCount] is TComboBox) then
      (Components[CompCount] as TComboBox).Text :=''


end;

procedure TEmeliyyat.SpeedButton1Click(Sender: TObject);
begin

{DataModCustOrders.customer_orders.callprocedure('create_account',[edit4.text]);
{if MessageDlg('Bu emeliyyat yerine yetirilsin?',mtConfirmation,mbYesNoCancel,0)=mrYes then }
DataModCustOrders.customer_orders.callprocedure('ORDER_TRANS_',[total.text,{dbedit1.text,}dbedit2.text,proper_edit.text]);
DataModCustOrders.customer_orders.callprocedure('C_TRANS',[]);
Emeliyyat.close;


                                            customers_orders_arest.comboname.text:='';
                                             customers_orders_arest.editcode.text :='';
                                             customers_orders_arest.editvoin.text :='';
                                             customers_orders_arest.editacc.text :='';
                                             customers_orders_arest.editswift.text :='';
                                             customers_orders_arest.editc_name.text :='';
                                             customers_orders_arest.editc_acc.text :='';
                                             customers_orders_arest.editc_voin.text :='';
                                             customers_orders_arest.editm_name.text :='';
                                             customers_orders_arest.editm_acc.text :='';
                                             customers_orders_arest.editm_voin.text :='';
                                             customers_orders_arest.editn_mon.text :='';
                                             customers_orders_arest.editw_mon.text:='';
                                             customers_orders_arest.editcon.text :='';
                                             customers_orders_arest.editedv.text :='';
                                             customers_orders_arest.editedv_f.text :='';
                                             customers_orders_arest.editedv_t.text :='';
                                             customers_orders_arest.editpro.text :='';
                                             customers_orders_arest.editpro_p.text :='';
                                             customers_orders_arest.editpro_t.text :='';
                                             customers_orders_arest.editchief.text :='';
                                             customers_orders_arest.edithead.Text :='';
                                             customers_orders_arest.editnumber.text :='';
                                             customers_orders_arest.editval.text :='';
end;

procedure TEmeliyyat.FormActivate(Sender: TObject);
begin
emeliyyat.proper_edit.text :=customers_orders_arest.Editcon.text;
emeliyyat.total.text :=customers_orders_arest.editn_mon.text;

end;

procedure TEmeliyyat.SearchEdit1Change(Sender: TObject);
begin
DataModCustOrders.account.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;
end;

procedure TEmeliyyat.FormCreate(Sender: TObject);
begin
DataModCustOrders.Account.open;
DataModCustOrders.Acc.open;

end;

procedure TEmeliyyat.SearchEdit2Change(Sender: TObject);
begin
DataModCustOrders.Acc.fieldbyname('acc_no').asstring:=TSearchEdit(Sender).datasource.dataset.fieldbyname('acc_no').asstring;

end;

procedure TEmeliyyat.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

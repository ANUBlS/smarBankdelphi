unit arest_check;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  Tcheck_arest = class(TForm)
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    CLBAccFlags: TCheckListBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  check_arest: Tcheck_arest;
  was_d,was_c:boolean;
implementation

uses datamodule, transaction, customers_orders_arest__;

{$R *.DFM}


procedure Tcheck_arest.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tcheck_arest.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Щесаба арест';
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

procedure Tcheck_arest.Button1Click(Sender: TObject);
var
vnum :string;
begin

if   not((checkbox1.checked) or (checkbox2.checked))
then
  begin
    messagedlg('Arest tipi secin!',mterror,[mbok],0);
    exit;
  end;


vnum :=DataModCustOrders.search_acc.fieldbyname('acc_no').asstring;

if   not (checkbox1.checked) and  (was_d) then
          DataModCustOrders.customer_orders.CallProcedure('delete_d',[vnum])

 else if  (checkbox1.checked) and not (was_d) then
DataModCustOrders.customer_orders.CallProcedure('arest_d',[vnum]) ;


if   not (checkbox2.checked) and  (was_c) then
          DataModCustOrders.customer_orders.CallProcedure('delete_c',[vnum])

 else if  (checkbox2.checked) and not (was_c) then
DataModCustOrders.customer_orders.CallProcedure('arest_c',[vnum]) ;

DataModCustOrders.search_acc.Refresh;




close;

end;


procedure Tcheck_arest.Button2Click(Sender: TObject);
var
ref: longint;
vnum :string;
begin
vnum :=DataModCustOrders.search_acc.fieldbyname('acc_no').asstring;
DataModCustOrders.customer_orders.CallProcedure('arest_clear',[vnum]);
{DataModCustOrders.search_acc.next;  }
{DataModCustOrders.search_acc.refresh; }
with DataModCustOrders.search_acc do
begin
ref :=fieldbyname('id').asinteger;
closeall;
open;
locate('id',ref,[]);

end;
     end;


procedure Tcheck_arest.FormShow(Sender: TObject);
   var
  i:byte;
  simvol:string;
begin
     was_c:=false;
     was_d:=false;
    for   i:=1 to length(DataModCustOrders.search_acc.FieldByName('tipacc').asstring) do
 begin
   simvol:=copy(DataModCustOrders.search_acc.FieldByName('tipacc').asstring,i,1);
   if simvol='D' then  begin  check_arest.CheckBox1.Checked:=true; was_d:=true; end;
   if simvol='C' then  begin  check_arest.CheckBox2.Checked:=true; was_c:=true; end;
 end;

{
 was_d:=false; was_c:=false;

   if (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='D')
   or (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='O,D')
 then
   begin
    check_arest.CheckBox1.Checked:=true;
    was_d:=true;
    end;
  if (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='C')
  or (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='O,C')
 then
   begin
  check_arest.CheckBox2.Checked:=true;
  was_c:=true;
    end;

  if (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='D,C')
  or (DataModCustOrders.search_acc.FieldByName('tipacc').asstring='O,D,C')

 then  begin
  check_arest.CheckBox1.Checked:=true;
  check_arest.CheckBox2.Checked:=true;
  was_d:=true;
  was_c:=true;
 end;
     }



end;

end.

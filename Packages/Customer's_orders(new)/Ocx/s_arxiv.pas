unit s_arxiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  Tsend_arxiv = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    closedate: TDateTimePicker;
    GroupBox3: TGroupBox;
    Button1: TButton;
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  send_arxiv: Tsend_arxiv;

implementation

uses datamodule;

{$R *.DFM}

procedure Tsend_arxiv.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tsend_arxiv.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Архивя эюндярмя';
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


procedure Tsend_arxiv.Button1Click(Sender: TObject);
var
    v_pnum: String;
    v_id: integer;
    v_close_date  :TDateTime;
   begin
   v_close_date  :=Trunc(closedate.DateTime);
  v_id :=DataModCustOrders.cust_id.FieldByName('id').asinteger;
  v_pnum :=DataModCustOrders.cust_id.FieldByName('PNUM').AsString;
  with DataModCustOrders.arxiv_order,DataModCustOrders.customer_orders do
  begin

        CallProcedure('trans_arxiv',[v_id,v_close_date]);

 with DataModCustOrders.cust_id,DataModCustOrders.customer_orders do
  begin

        CallProcedure('delete_order',[v_id]); refresh; send_arxiv.close; end; end;end;




procedure Tsend_arxiv.FormActivate(Sender: TObject);
begin
closedate.datetime :=DataModCustOrders.customer_orders.CallDateFunction('CurrentDate',[]);
end;
end.

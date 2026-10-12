unit all_orders__;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons,NLSLocalizer,NLSDialogs;

type
  Tall_orders = class(TForm)
    DBGrid1: TDBGrid;
    searchGroupBox: TGroupBox;
    noEdit: TEdit;
    innEdit: TEdit;
    nameEdit: TEdit;
    ddateEdit: TEdit;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    NLSLocalizer1: TNLSLocalizer;
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure noEditChange(Sender: TObject);
    procedure innEditChange(Sender: TObject);
    procedure nameEditChange(Sender: TObject);
    procedure ddateEditChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure noEditExit(Sender: TObject);
    procedure innEditExit(Sender: TObject);
    procedure nameEditExit(Sender: TObject);
    procedure ddateEditExit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  all_orders: Tall_orders;

implementation

uses ComObj, ActiveX,datamodule,   edit_cust_order__, customers_orders_arest__;

{$R *.DFM}

procedure Tall_orders.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure Tall_orders.WMNCPaint(var message: TWMNCPaint);
const Capt = '—€р€нжамлар';
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
procedure Tall_orders.noEditChange(Sender: TObject);
begin
 if noedit.Text<>'' then
 DataModCustOrders.cust_orders.Locate
  ('pnum',noedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tall_orders.innEditChange(Sender: TObject);
begin

 if innedit.Text<>'' then
 DataModCustOrders.cust_orders.Locate
  ('acc_inn',innedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tall_orders.nameEditChange(Sender: TObject);
begin
 if nameedit.Text<>'' then
 DataModCustOrders.cust_orders.Locate
  ('c_name',nameedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tall_orders.ddateEditChange(Sender: TObject);
begin
  
   if ddateEdit.Text<>'' then
     DataModCustOrders.cust_orders.Locate
      ('ddate',ddateEdit.Text,[]);
        DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

              end;

procedure Tall_orders.Button3Click(Sender: TObject);
begin
if searchgroupbox.Visible=false then
searchgroupbox.Visible :=true else
searchgroupbox.Visible :=false;
end;



procedure Tall_orders.noEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tall_orders.innEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tall_orders.nameEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tall_orders.ddateEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tall_orders.DBGrid1TitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with DataModCustOrders.arxiv_order do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;

end;

procedure Tall_orders.Button2Click(Sender: TObject);
var
    v_pnum: String;
begin
 v_pnum :=DataModCustOrders.cust_orders.FieldByName('PNUM').AsString;
 if MessageDlg(Format('є%s с€р€нжам силинсин?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.cust_orders,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_s',[v_pnum]);
   Refresh; end;
     end;


procedure Tall_orders.SpeedButton1Click(Sender: TObject);
begin
      edit_cust_order :=Tedit_cust_order.Create(self);

    with DataModCustOrders.cust_orders,edit_cust_order do
   begin
    if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else
     editc_acc.text :=FieldByName('c_acc').AsString;
    Editc_name.text :=FieldByName('c_name').AsString;
    Editc_voin.text :=FieldByName('c_inn').AsString;
    editname.text :=FieldByName('b_name').AsString;
    editcode.text :=FieldByName('b_code').AsString;
    Editvoin.text :=FieldByName('b_inn').AsString;
    EditAcc.text :=FieldByName('b_acc').AsString;
    EditSwift.text :=FieldByName('b_swift').AsString;
    Editm_name.text :=FieldByName('m_name').AsString;
    Editm_acc.text :=FieldByName('m_acc').AsString;
    Editm_voin.text :=FieldByName('m_inn').AsString;
    Editn_mon.text :=FieldByName('n_mon').AsString;
    Editw_mon.text :=FieldByName('w_mon').AsString;
    Editcon.Text :=FieldByName('content').AsString;
    Editedv.text :=FieldByName('edv').AsString;
    Editedv_f.text :=FieldByName('edv_f').AsString;
    editedv_t.text :=FieldByName('edv_c').AsString;
    editpro.text :=FieldByName('pro').AsString;
    editpro_p.text :=FieldByName('pro_f').AsString;
    editpro_t.text :=FieldByName('pro_c').AsString;
    editnumber.text :=FieldByName('pnum').AsString;
    editval.text :=FieldByName('val').AsString;
    editdate.DateTime :=FieldByName('ddate').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;
    edit1.text :=fieldbyname('acc_inn').asstring;
    edit_cust_order.edit1.enabled :=false;
    edit_cust_order.edit1.color :=clmenu;
    edit_cust_order.Showmodal;

end;

end;

procedure Tall_orders.SpeedButton2Click(Sender: TObject);
var
    v_pnum: String;
    v_id: integer;
begin
with DataModCustOrders.cust_orders do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin
 v_id :=DataModCustOrders.cust_orders.FieldByName('id').asinteger;
 v_pnum :=DataModCustOrders.cust_orders.FieldByName('PNUM').AsString;
 if MessageDlg(Format('є%s с€р€нжам силинсин?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.cust_orders,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_order',[v_id]);
   Refresh; end;
     end;
          end;

procedure Tall_orders.SpeedButton3Click(Sender: TObject);

 begin
 with DataModCustOrders.cust_orders do
  if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else begin

 if searchgroupbox.Visible=false then
searchgroupbox.Visible :=true else
searchgroupbox.Visible :=false;

 end;
                  end;
procedure Tall_orders.FormActivate(Sender: TObject);
begin
  DataModCustOrders.arxiv_order.open;
 DataModCustOrders.cust_orders.open;
   DataModCustOrders.cust_orders.refresh;
end;

procedure Tall_orders.DBGrid1DblClick(Sender: TObject);
begin
 edit_cust_order :=Tedit_cust_order.Create(self);

    with DataModCustOrders.cust_orders,edit_cust_order do
   begin
    if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
  else
     editc_acc.text :=FieldByName('c_acc').AsString;
    Editc_name.text :=FieldByName('c_name').AsString;
    Editc_voin.text :=FieldByName('c_inn').AsString;
    editname.text :=FieldByName('b_name').AsString;
    editcode.text :=FieldByName('b_code').AsString;
    Editvoin.text :=FieldByName('b_inn').AsString;
    EditAcc.text :=FieldByName('b_acc').AsString;
    EditSwift.text :=FieldByName('b_swift').AsString;
    Editm_name.text :=FieldByName('m_name').AsString;
    Editm_acc.text :=FieldByName('m_acc').AsString;
    Editm_voin.text :=FieldByName('m_inn').AsString;
    Editn_mon.text :=FieldByName('n_mon').AsString;
    Editw_mon.text :=FieldByName('w_mon').AsString;
    Editcon.Text :=FieldByName('content').AsString;
    Editedv.text :=FieldByName('edv').AsString;
    Editedv_f.text :=FieldByName('edv_f').AsString;
    editedv_t.text :=FieldByName('edv_c').AsString;
    editpro.text :=FieldByName('pro').AsString;
    editpro_p.text :=FieldByName('pro_f').AsString;
    editpro_t.text :=FieldByName('pro_c').AsString;
    editnumber.text :=FieldByName('pnum').AsString;
    editval.text :=FieldByName('val').AsString;
    editdate.DateTime :=FieldByName('ddate').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;
    edit1.text :=fieldbyname('acc_inn').asstring;
    edit_cust_order.edit1.enabled :=false;
    edit_cust_order.edit1.color :=clmenu;

  edit_cust_order.Showmodal;

       end;
end;

procedure Tall_orders.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_delete then  SpeedButton2Click(self);
if key=vk_ESCAPE then
close;

end;

procedure Tall_orders.SpeedButton5Click(Sender: TObject);
begin
close;
end;

procedure Tall_orders.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_ESCAPE then
close;
end;

end.

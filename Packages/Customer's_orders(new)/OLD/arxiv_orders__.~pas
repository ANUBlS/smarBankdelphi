unit arxiv_orders__;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons;

type
  Tarxiv_orders = class(TForm)
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    searchGroupBox: TGroupBox;
    noEdit: TEdit;
    innEdit: TEdit;
    nameEdit: TEdit;
    ddateEdit: TEdit;
    cdate: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure noEditChange(Sender: TObject);
    procedure innEditChange(Sender: TObject);
    procedure nameEditChange(Sender: TObject);
    procedure ddateEditChange(Sender: TObject);
    procedure cdateChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure noEditExit(Sender: TObject);
    procedure innEditExit(Sender: TObject);
    procedure nameEditExit(Sender: TObject);
    procedure ddateEditExit(Sender: TObject);
    procedure cdateExit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  arxiv_orders: Tarxiv_orders;

implementation

uses ComObj, ActiveX,datamodule, edit_arxiv_cust_order__;

{$R *.DFM}

procedure Tarxiv_orders.noEditChange(Sender: TObject);
begin
if noedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('pnum',noedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tarxiv_orders.innEditChange(Sender: TObject);
begin
if innedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('acc_inn',innedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tarxiv_orders.nameEditChange(Sender: TObject);
begin
if nameedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('c_name',nameedit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tarxiv_orders.ddateEditChange(Sender: TObject);
begin
{if ddateedit.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('ddate',ddateEdit.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
     }
end;

procedure Tarxiv_orders.cdateChange(Sender: TObject);
begin
{if cdate.Text<>'' then
 datamodule1.arxiv_order.Locate
  ('close_date',cdate.Text,[]);
       DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
   }
end;

procedure Tarxiv_orders.Button3Click(Sender: TObject);
begin
if searchgroupbox.Visible=false then
searchgroupbox.Visible :=true else
searchgroupbox.Visible :=false;

end;

procedure Tarxiv_orders.Button2Click(Sender: TObject);
var
    v_pnum: String;
begin
 v_pnum :=datamodule1.arxiv_order.FieldByName('PNUM').AsString;
 if MessageDlg(Format('¹%s serencam silinsin?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 datamodule1.customer_orders.CallProcedure('delete_s1',[v_pnum]);
 datamodule1.arxiv_order.refresh; end;





procedure Tarxiv_orders.noEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tarxiv_orders.innEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';end;

procedure Tarxiv_orders.nameEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tarxiv_orders.ddateEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tarxiv_orders.cdateExit(Sender: TObject);
begin
(Sender as tedit).text :='';
end;

procedure Tarxiv_orders.DBGrid1TitleClick(Column: TColumn);
var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with datamodule1.arxiv_order do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;

end;


procedure Tarxiv_orders.DBGrid2TitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with datamodule1.arxiv_order do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;

end;


procedure Tarxiv_orders.SpeedButton1Click(Sender: TObject);
 begin
 edit_arxiv_cust_order :=Tedit_arxiv_cust_order.Create(self);

    with datamodule1.arxiv_order,edit_arxiv_cust_order do
   begin
    if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else
   with datamodule1.arxiv_order,edit_arxiv_cust_order do
   begin
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
    closedate.DateTime :=FieldByName('close_date').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;
    edit1.text :=fieldbyname('acc_inn').asstring;
          edit_arxiv_cust_order.Showmodal;

end;


  end;end;


procedure Tarxiv_orders.SpeedButton2Click(Sender: TObject);
var
    v_pnum: String;
begin
 v_pnum :=datamodule1.arxiv_order.FieldByName('PNUM').AsString;
 if MessageDlg(Format('¹%s serencam silinsin?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 datamodule1.customer_orders.CallProcedure('delete_s1',[v_pnum]);
 datamodule1.arxiv_order.refresh; end;



procedure Tarxiv_orders.SpeedButton3Click(Sender: TObject);
begin
with datamodule1.arxiv_order do
  if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else begin

if searchgroupbox.Visible=false then
searchgroupbox.Visible :=true else
searchgroupbox.Visible :=false;

end;   end;

procedure Tarxiv_orders.SpeedButton4Click(Sender: TObject);
var
  V: Variant;
  Setirler,
       Sutunlar :integer;
begin
with datamodule1.arxiv_order do
  if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else begin

Datamodule1.ex_arxiv_order.refresh;
  Datamodule1.ex_arxiv_order.open;
 V:=CreateOleObject('Excel.Application');
  V.Visible:=true;
  V.WorkBooks.Add;
  V.Workbooks[1].Worksheets[1].Name := 'Arxiv serencamlar';
 For Sutunlar:=0 to Datamodule1.ex_arxiv_order.FieldCount-1 do begin
 V.Cells[1,Sutunlar+1].Value:=Datamodule1.ex_arxiv_order.Fields[Sutunlar].DisplayLabel;
 V.Cells[1,Sutunlar+1].Font.Name:='Azl Sans Serif';
 V.Cells[1,Sutunlar+1].Font.Color:=clBlue;
 V.Cells[1,Sutunlar+1].Font.Bold :=true;
                end;
For Setirler:=1 to Datamodule1.ex_arxiv_order.RecordCount do begin
 For Sutunlar:=0 to Datamodule1.ex_arxiv_order.FieldCount-1 do begin
  V.Cells[Setirler+1,Sutunlar+1].Value:=Datamodule1.ex_arxiv_order.Fields[Sutunlar].Text;
      end;
  Datamodule1.ex_arxiv_order.Next;
 end;{for}


end;     end;

procedure Tarxiv_orders.FormActivate(Sender: TObject);
begin
 Datamodule1.ex_arxiv_order.open;
  Datamodule1.ex_arxiv_order.refresh;
end;

procedure Tarxiv_orders.DBGrid1DblClick(Sender: TObject);
begin
edit_arxiv_cust_order :=Tedit_arxiv_cust_order.Create(self);

    with datamodule1.arxiv_order,edit_arxiv_cust_order do
   begin
    if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else
   with datamodule1.arxiv_order,edit_arxiv_cust_order do
   begin
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
    closedate.DateTime :=FieldByName('close_date').AsDateTime;
    editchief.text :=FieldByName('chief').AsString;
    edithead.Text :=FieldByName('head').AsString;
    edit1.text :=fieldbyname('acc_inn').asstring;
     edit_arxiv_cust_order.Showmodal;


end;  END;
           end;
procedure Tarxiv_orders.SpeedButton5Click(Sender: TObject);

var
    v_pnum: String;
    v_id: integer;
begin
with datamodule1.arxiv_order do
  if IsEmpty then
    begin
     ShowMessage('Hec bir serencam qeyd olunmayib!');
     Exit;
    end
  else begin
 v_id :=datamodule1.arxiv_order.FieldByName('id').asinteger;
 v_pnum :=datamodule1.arxiv_order.FieldByName('PNUM').AsString;
 if MessageDlg(Format('¹%s serencam silinsin?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with datamodule1.arxiv_order,datamodule1.customer_orders do
  begin
     CallProcedure('DELETE_CUST_ORDER_ARXIV',[v_id]);
   Refresh; end;
     end;


end;
procedure Tarxiv_orders.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_delete then  SpeedButton5Click(self);
end;

end.

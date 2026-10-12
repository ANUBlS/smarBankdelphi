unit CustomersordersImpl1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, CustomersordersProj1_TLB, StdVcl, Grids, DBGrids,
  StdCtrls, Buttons, ImgList, NLSLocalizer, Menus;

type
  TCustomersorders = class(TActiveForm, ICustomersorders)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    noEdit: TEdit;
    nameEdit: TEdit;
    open_datEdit: TEdit;
    innEdit: TEdit;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    NLSLocalizer1: TNLSLocalizer;
    ImageList1: TImageList;
    customers: TPopupMenu;
    orders: TPopupMenu;
    elaveetmek1: TMenuItem;
    yenilemek1: TMenuItem;
    redakteetmek1: TMenuItem;
    legvetmek1: TMenuItem;
    cap1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure noEditExit(Sender: TObject);
    procedure noEditKeyPress(Sender: TObject; var Key: Char);
    procedure noEditChange(Sender: TObject);
    procedure nameEditChange(Sender: TObject);
    procedure open_datEditChange(Sender: TObject);
    procedure innEditChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
    FEvents: ICustomersordersEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, Unit3, Unit4, Unit5, Unit6, Unit8, Unit9, Unit10,
  Unit11, Unit12, Unit7;

{$R *.DFM}

{ TCustomersorders }

procedure TCustomersorders.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CustomersordersPage); }
end;

procedure TCustomersorders.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICustomersordersEvents;
end;

procedure TCustomersorders.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TCustomersorders.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCustomersorders.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCustomersorders.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCustomersorders.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCustomersorders.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCustomersorders.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCustomersorders.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCustomersorders.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCustomersorders.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCustomersorders.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCustomersorders.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCustomersorders.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCustomersorders.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCustomersorders.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCustomersorders.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCustomersorders.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCustomersorders.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCustomersorders.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCustomersorders._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCustomersorders.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCustomersorders.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCustomersorders.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCustomersorders.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCustomersorders.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCustomersorders.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCustomersorders.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCustomersorders.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCustomersorders.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCustomersorders.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCustomersorders.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCustomersorders.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCustomersorders.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCustomersorders.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCustomersorders.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCustomersorders.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCustomersorders.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCustomersorders.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCustomersorders.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCustomersorders.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCustomersorders.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCustomersorders.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCustomersorders.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCustomersorders.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TCustomersorders.SpeedButton1Click(Sender: TObject);
begin

  try
      all_orders:=Tall_orders.Create(self);
      {   with dm.cust_orders do
         if Active =false then Open else Refresh; }
      all_orders.Showmodal;
         finally
         all_orders.Release;
  end;

end;

procedure TCustomersorders.SpeedButton3Click(Sender: TObject);
begin
  try
    arxiv_orders:=tarxiv_orders.create(self);
   {  with datamodule1.arxiv_order do
      if Active =false then Open else Refresh;   }
        arxiv_orders.ShowModal;
           finally
     arxiv_orders.Release;

   end;



end;

procedure TCustomersorders.SpeedButton2Click(Sender: TObject);
begin

 dm.search_acc.SetVariable('acc',dm.Customers.Fields.Fields[0].AsInteger);
 dm.search_acc.refresh;

 {dm.cust_id.setvariable('id',customers_orders_arest.dbedit1.text);
 if dm.cust_id.Active=false then  dm.cust_id.open;
  dm.cust_id.refresh; }
  try
    Customers_orders_arest:=tCustomers_orders_arest.create(self);
     Customers_orders_arest.innEdit.Text:=dm.Customers.Fields.Fields[3].AsString;
     



      Customers_orders_arest.showmodal;
        DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
        finally
       Customers_orders_arest.release;
  end;




end;

procedure TCustomersorders.SpeedButton7Click(Sender: TObject);
begin
    try
    quickreport1:=tquickreport1.create(self);
    quickreport1.showmodal;
      finally
      quickreport1.release;
      end;
end;

procedure TCustomersorders.SpeedButton5Click(Sender: TObject);
begin
  m_edit_order:=tm_edit_order.create(self);
  m_edit_order.showmodal;
end;

procedure TCustomersorders.ActiveFormCreate(Sender: TObject);
begin
  dm:=tdm.Create(self);
  dm.Customers.Open;
  DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;

procedure TCustomersorders.noEditExit(Sender: TObject);
begin
  (Sender as tedit).text :=''; 
end;

procedure TCustomersorders.noEditKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9',#8]) then
    key :=#0;
end;

procedure TCustomersorders.noEditChange(Sender: TObject);
begin

  if noedit.Text<>'' then
   dm.customers.Locate
   ('id',noedit.Text,[]);
    DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];


end;

procedure TCustomersorders.nameEditChange(Sender: TObject);
begin
      if innedit.Text<>'' then
   dm.customers.Locate
   ('inn',innedit.Text,[]);
    DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;

procedure TCustomersorders.open_datEditChange(Sender: TObject);
begin
  
   if nameedit.Text<>'' then
   dm.customers.Locate
   ('name',nameedit.Text,[]);
    DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;

procedure TCustomersorders.innEditChange(Sender: TObject);
begin
if open_datedit.Text<>'' then
   dm.customers.Locate
   ('open_dat',open_datedit.Text,[]);
    DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
end;

procedure TCustomersorders.SpeedButton4Click(Sender: TObject);
var
Accountid : integer;
begin

   with Dm.customers do
 begin
  AccountID :=FieldByName('ID').AsInteger;
  CloseAll;
  Open;
  Locate('ID', AccountID, []);
 end;

end;

procedure TCustomersorders.DBGrid1TitleClick(Column: TColumn);
var
Titlename:string;
begin
  titlename:=column.FieldName;
  with dm.Customers do
  begin
  setvariable('title',titlename);
  refresh;
  end;
end;

procedure TCustomersorders.DBGrid1DblClick(Sender: TObject);
begin
     customers_orders_arest :=Tcustomers_orders_arest.create(self);
     with dm.Customers,customers_orders_arest do
       begin


         end;


        customers_orders_arest.showmodal;
end;

procedure TCustomersorders.DBGrid1CellClick(Column: TColumn);
begin
   with Dm.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+dm.customers.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;
           end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCustomersorders,
    Class_Customersorders,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

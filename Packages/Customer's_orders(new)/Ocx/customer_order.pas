unit customer_order;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, customer_order__TLB, StdVcl, Buttons, StdCtrls,OracleData,Db, Grids,
  DBGrids,NLSDialogs,NLSLocalizer,ComCtrls, Menus, ImgList, ExtCtrls;

type
  Tcustomers_orders = class(TActiveForm, IActiveFormX)
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox7: TGroupBox;
    noedit: TEdit;
    innEdit: TEdit;
    nameEdit: TEdit;
    open_datEdit: TEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    customers: TPopupMenu;
    ins: TMenuItem;
    refresh: TMenuItem;
    orders: TPopupMenu;
    edit: TMenuItem;
    Sil1: TMenuItem;
    Print: TMenuItem;
    SpeedButton4: TSpeedButton;
    NLSLocalizer1: TNLSLocalizer;
    ImageList: TImageList;
    Panel1: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BtnPrint: TSpeedButton;
    procedure noeditChange(Sender: TObject);
    procedure innEditChange(Sender: TObject);
    procedure nameEditChange(Sender: TObject);
    procedure open_datEditChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure innEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure innEditExit(Sender: TObject);
    procedure innEditKeyPress(Sender: TObject; var Key: Char);
    procedure noeditExit(Sender: TObject);
    procedure noeditKeyPress(Sender: TObject; var Key: Char);
    procedure nameEditExit(Sender: TObject);
    procedure open_datEditExit(Sender: TObject);
    procedure insClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure Sil1Click(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure refreshClick(Sender: TObject);
    procedure insDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure refreshDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure editDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure Sil1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure PrintDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
  private
    { Private declarations }
    FEvents: IActiveFormXEvents;
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

uses ComObj, ComServ,sboapiDataModuleImpl, datamodule, customers_orders_arest__, all_orders__,
  arxiv_orders__, m_edit_order___, q_report ;

{$R *.DFM}

{ TActiveFormX }

procedure Tcustomers_orders.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ActiveFormXPage); }
end;

procedure Tcustomers_orders.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveFormXEvents;
end;

procedure Tcustomers_orders.Initialize;
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

function Tcustomers_orders.Get_Active: WordBool;
begin
  Result := Active;
end;

function Tcustomers_orders.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function Tcustomers_orders.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function Tcustomers_orders.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function Tcustomers_orders.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function Tcustomers_orders.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function Tcustomers_orders.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function Tcustomers_orders.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function Tcustomers_orders.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function Tcustomers_orders.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function Tcustomers_orders.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function Tcustomers_orders.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function Tcustomers_orders.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function Tcustomers_orders.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function Tcustomers_orders.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function Tcustomers_orders.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function Tcustomers_orders.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function Tcustomers_orders.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure Tcustomers_orders._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tcustomers_orders.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure Tcustomers_orders.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure Tcustomers_orders.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure Tcustomers_orders.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure Tcustomers_orders.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure Tcustomers_orders.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure Tcustomers_orders.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure Tcustomers_orders.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure Tcustomers_orders.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure Tcustomers_orders.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure Tcustomers_orders.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure Tcustomers_orders.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure Tcustomers_orders.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure Tcustomers_orders.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure Tcustomers_orders.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure Tcustomers_orders.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure Tcustomers_orders.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure Tcustomers_orders.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure Tcustomers_orders.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure Tcustomers_orders.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure Tcustomers_orders.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure Tcustomers_orders.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure Tcustomers_orders.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure Tcustomers_orders.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure Tcustomers_orders.noeditChange(Sender: TObject);
begin
if noedit.Text<>'' then
   DataModCustOrders.cust.Locate
   ('id',noedit.Text,[loCaseInsensitive, loPartialKey]);
     DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
   with DataModCustOrders.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+DataModCustOrders.cust.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;
end;
       end;
procedure Tcustomers_orders.innEditChange(Sender: TObject);
begin
 if innedit.Text<>'' then
   DataModCustOrders.cust.Locate
   ('inn',innedit.Text,[loCaseInsensitive, loPartialKey]);
     DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

      with DataModCustOrders.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+DataModCustOrders.cust.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;

  {DataModCustOrders.cust_id.setvariable('id',DataModCustOrders.cust.fieldbyname('id').asstring);
     DataModCustOrders.cust_id.open;
    DataModCustOrders.cust_id.refresh;        }

end;                end;

procedure Tcustomers_orders.nameEditChange(Sender: TObject);
begin
  if nameedit.Text<>'' then
    DataModCustOrders.cust.Locate
     ('name',nameedit.Text,[loCaseInsensitive, loPartialKey]);
      DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];
    with DataModCustOrders.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+DataModCustOrders.cust.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;

end;     end;

procedure Tcustomers_orders.open_datEditChange(Sender: TObject);
begin
   if open_datedit.Text<>'' then
     DataModCustOrders.cust.Locate
      ('open_dat',open_datedit.Text,[loCaseInsensitive, loPartialKey]);
        DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

        with DataModCustOrders.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+DataModCustOrders.cust.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;

end;         end;

procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;

      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;  end;

procedure Tcustomers_orders.DBGrid1CellClick(Column: TColumn);
begin
 with DataModCustOrders.Search_order do begin
       Close;
        SQL.clear;
         SQL.add('select * from cust_order where cust_id='''+DataModCustOrders.cust.fieldbyname('id').asstring+''' ');
           Open;
           Refresh;
 {with DataModCustOrders.acc_inn do
begin
ref :=fieldbyname('id').asinteger;
closeall;
open;
locate('id',ref,[]);
        end; }
end;
       end;
procedure Tcustomers_orders.DBGrid1DblClick(Sender: TObject);
begin
     customers_orders_arest :=Tcustomers_orders_arest.create(self);
    with DataModCustOrders.cust,customers_orders_arest do begin
     dbedit1.text :=fieldbyname('id').asstring;
     edit1.text :=fieldbyname('inn').asstring;
       if customers_orders_arest.dbedit1.text <>'' then
    DataModCustOrders.serach_cust.setvariable('title',customers_orders_arest.dbedit1.text);
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;
 DataModCustOrders.cust_id.setvariable('id',customers_orders_arest.dbedit1.text);
DataModCustOrders.cust_id.open;
DataModCustOrders.cust_id.refresh;
DataModCustOrders.search_acc.setvariable('acc',DataModCustOrders.serach_cust.fieldbyname('id').asinteger);
  DataModCustOrders.search_acc.open;
   DataModCustOrders.search_acc.refresh;
    customers_orders_arest.edit1.enabled :=false;
     customers_orders_arest.dbedit1.enabled :=false;
      customers_orders_arest.dbedit2.enabled :=false;
       customers_orders_arest.dbedit3.enabled :=false;
          customers_orders_arest.dbedit4.enabled :=false;
          customers_orders_arest.dbedit1.color :=clmenu;
          customers_orders_arest.dbedit2.color :=clmenu;
          customers_orders_arest.dbedit3.color :=clmenu;
          customers_orders_arest.dbedit4.color :=clmenu;
    customers_orders_arest.edit1.color :=clmenu;

     customers_orders_arest.showmodal;
  end;


        end;


procedure Tcustomers_orders.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_insert then SpeedButton2Click(self);

end;

procedure Tcustomers_orders.DBGrid1TitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with DataModCustOrders.cust do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;  end;




procedure Tcustomers_orders.SpeedButton1Click(Sender: TObject);
begin
try
all_orders :=Tall_orders.Create(self);
with DataModCustOrders.cust_orders do
 if Active =false then Open else Refresh;
  all_orders.Showmodal;
  finally
  all_orders.Release;

end;end;


procedure Tcustomers_orders.SpeedButton2Click(Sender: TObject);
begin
     customers_orders_arest :=Tcustomers_orders_arest.create(self);
    with DataModCustOrders.cust,customers_orders_arest do begin
     dbedit1.text :=fieldbyname('id').asstring;
     edit1.text :=fieldbyname('inn').asstring;
       if customers_orders_arest.dbedit1.text <>'' then
    DataModCustOrders.serach_cust.setvariable('title',customers_orders_arest.dbedit1.text);
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;
 DataModCustOrders.cust_id.setvariable('id',customers_orders_arest.dbedit1.text);
DataModCustOrders.cust_id.open;
DataModCustOrders.cust_id.refresh;
DataModCustOrders.search_acc.setvariable('acc',DataModCustOrders.serach_cust.fieldbyname('id').asinteger);
  DataModCustOrders.search_acc.open;
   DataModCustOrders.search_acc.refresh;
    customers_orders_arest.edit1.enabled :=false;
     customers_orders_arest.dbedit1.enabled :=false;
      customers_orders_arest.dbedit2.enabled :=false;
       customers_orders_arest.dbedit3.enabled :=false;
          customers_orders_arest.dbedit4.enabled :=false;
          customers_orders_arest.dbedit1.color :=clmenu;
          customers_orders_arest.dbedit2.color :=clmenu;
          customers_orders_arest.dbedit3.color :=clmenu;
          customers_orders_arest.dbedit4.color :=clmenu;
    customers_orders_arest.edit1.color :=clmenu;

     customers_orders_arest.showmodal;




end;   end;


procedure Tcustomers_orders.SpeedButton3Click(Sender: TObject);
begin
try
  arxiv_orders :=Tarxiv_orders.Create(self);
  with DataModCustOrders.arxiv_order do
   if Active =false then Open else Refresh;
  arxiv_orders.Showmodal;
 finally
  arxiv_orders.Release;
end;

end;


procedure Tcustomers_orders.SpeedButton9Click(Sender: TObject);
begin
  {form1.isUpdate :=true;}

  m_edit_order :=Tm_edit_order.Create(self);
     with DataModCustOrders.search_order,m_edit_order do
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
    m_edit_order.edit1.Enabled :=false;
    m_edit_order.edit1.color :=clmenu;

  m_edit_order.Showmodal;

end;
      end;




procedure Tcustomers_orders.SpeedButton10Click(Sender: TObject);
var
    v_pnum: String;
    v_id:integer;
begin
 with DataModCustOrders.search_order do
   begin
    if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
    else
DataModCustOrders.search_order.active :=true;
 v_pnum :=DataModCustOrders.search_order.FieldByName('PNUM').AsString;
  v_id :=DataModCustOrders.search_order.FieldByName('id').asinteger;
 if MessageDlg(Format('є%s serencam silinsin?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.search_order,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_order',[v_id]);
   Refresh; end;DataModCustOrders.search_order.refresh;
     end;
              end;




procedure Tcustomers_orders.BtnPrintClick(Sender: TObject);
var
  p_ID :integer;
begin
  with DataModCustOrders.search_order do begin
   Open;
   if IsEmpty then begin
    ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
    Exit;
   end
   else p_ID := DataModCustOrders.search_order.FieldByName('ID').AsInteger;
  end;

  try
   with QRepCustOrders, DataModCustOrders.search_order do begin
    Filtered:=false;
    Filter:=' ID= '+IntToStr(p_ID);
    Filtered :=true;
    Preview;
   end;
  finally
   DataModCustOrders.search_order.Filtered :=false;
  end;
end;

procedure Tcustomers_orders.DBGrid2DblClick(Sender: TObject);
begin
  m_edit_order :=Tm_edit_order.Create(self);
     with DataModCustOrders.search_order,m_edit_order do
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
    m_edit_order.edit1.Enabled :=false;
    m_edit_order.edit1.color :=clmenu;
  m_edit_order.Showmodal;

end;

end;



procedure Tcustomers_orders.DBGrid2TitleClick(Column: TColumn);
var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with DataModCustOrders.search_order do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;
end;


procedure Tcustomers_orders.ActiveFormCreate(Sender: TObject);
begin
 DataModCustOrders :=tDataModCustOrders.create(self);
      DataModCustOrders.cust.open;
     
      DataModCustOrders.cust_orders.open;
      //DataModCustOrders.sear_inn.open;
      DataModCustOrders.cust_id.open;

                   QRepCustOrders :=tQRepCustOrders.Create(self);
      DBGrid1.Options:=[dgRowSelect,dgAlwaysShowEditor,dgTitles,dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect];

end;

procedure Tcustomers_orders.ActiveFormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_insert then  SpeedButton1Click(self);

end;

procedure Tcustomers_orders.innEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


if key=vk_insert then SpeedButton2Click(self);

end;

procedure Tcustomers_orders.innEditExit(Sender: TObject);
begin
(Sender as tedit).text :='';        end;

procedure Tcustomers_orders.innEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders.noeditExit(Sender: TObject);
begin
(Sender as tedit).text :=''; end;



procedure Tcustomers_orders.noeditKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then
    key :=#0;

end;

procedure Tcustomers_orders.nameEditExit(Sender: TObject);
begin
 (Sender as tedit).text :='';    end;



procedure Tcustomers_orders.open_datEditExit(Sender: TObject);
begin
(Sender as tedit).text :=''; end;



procedure Tcustomers_orders.insClick(Sender: TObject);
begin
     customers_orders_arest :=Tcustomers_orders_arest.create(self);
    with DataModCustOrders.cust,customers_orders_arest do begin
     dbedit1.text :=fieldbyname('id').asstring;
     edit1.text :=fieldbyname('inn').asstring;
       if customers_orders_arest.dbedit1.text <>'' then
    DataModCustOrders.serach_cust.setvariable('title',customers_orders_arest.dbedit1.text);
 DataModCustOrders.serach_cust.open;
 DataModCustOrders.serach_cust.refresh;
 DataModCustOrders.cust_id.setvariable('id',customers_orders_arest.dbedit1.text);
DataModCustOrders.cust_id.open;
DataModCustOrders.cust_id.refresh;
DataModCustOrders.search_acc.setvariable('acc',DataModCustOrders.serach_cust.fieldbyname('id').asinteger);
  DataModCustOrders.search_acc.open;
   DataModCustOrders.search_acc.refresh;
    customers_orders_arest.edit1.enabled :=false;
     customers_orders_arest.dbedit1.enabled :=false;
      customers_orders_arest.dbedit2.enabled :=false;
       customers_orders_arest.dbedit3.enabled :=false;
          customers_orders_arest.dbedit4.enabled :=false;
          customers_orders_arest.dbedit1.color :=clmenu;
          customers_orders_arest.dbedit2.color :=clmenu;
          customers_orders_arest.dbedit3.color :=clmenu;
          customers_orders_arest.dbedit4.color :=clmenu;
    customers_orders_arest.edit1.color :=clmenu;

     customers_orders_arest.showmodal;

end;
     end;

procedure Tcustomers_orders.editClick(Sender: TObject);
begin
  {form1.isUpdate :=true;}

  m_edit_order :=Tm_edit_order.Create(self);
     with DataModCustOrders.cust_id,m_edit_order do
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
    m_edit_order.edit1.Enabled :=false;
    m_edit_order.edit1.color :=clmenu;

  m_edit_order.Showmodal;

end;
      end;


procedure Tcustomers_orders.Sil1Click(Sender: TObject);
var
    v_pnum: String;
    v_id:integer;
begin
 with DataModCustOrders.cust_id do
   begin
    if IsEmpty then
    begin
     ShowMessage('ўеч бир с€р€нжам гейд олунмайыб!');
     Exit;
    end
    else
DataModCustOrders.cust_id.active :=true;
 v_pnum :=DataModCustOrders.cust_id.FieldByName('PNUM').AsString;
  v_id :=DataModCustOrders.cust_id.FieldByName('id').asinteger;
 if MessageDlg(Format('є%s с€р€нжам силинсин?',[v_pnum]),mtConfirmation,mbYesNoCancel,0)=mrYes then
 with DataModCustOrders.cust_id,DataModCustOrders.customer_orders do
  begin
     CallProcedure('delete_order',[v_id]);
   Refresh; end;DataModCustOrders.cust_id.refresh;
     end;
              end;


procedure Tcustomers_orders.PrintClick(Sender: TObject);
 var
    pnum :String;
      begin
   with DataModCustOrders.cust_id do
      begin
   if IsEmpty then
      begin
  ShowMessage('Hec bir serencam qeyd olunmayib!');
      Exit;
      end
      else
  pnum :=DataModCustOrders.cust_id.FieldByName('pnum').AsString;
   try
     with QRepCustOrders,DataModCustOrders.cust_id do
       begin
         Filter:=' pnum= '+pnum;
           Filtered :=true;
               Preview;
                end;
            finally
         DataModCustOrders.cust_id.Filtered :=false;
       end;
        end;
         end;


procedure Tcustomers_orders.SpeedButton4Click(Sender: TObject);
var
  AccountID: Longint;
begin
{-----------------------------------}
if DataModCustOrders.search_order.Active=false then
   DataModCustOrders.search_order.Open;
   {----------------------------------}
DataModCustOrders.search_order.refresh;
 with DataModCustOrders.cust do
 begin
  AccountID :=FieldByName('ID').AsInteger;
  CloseAll;
  Open;
  Locate('ID', AccountID, []);
 end;
end;


procedure Tcustomers_orders.refreshClick(Sender: TObject);
var
  AccountID: Longint;
begin
 with DataModCustOrders.cust do
 begin
  AccountID :=FieldByName('ID').AsInteger;
  CloseAll;
  Open;
  Locate('ID', AccountID, []);
 end;
end;
procedure Tcustomers_orders.insDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);
end;

procedure Tcustomers_orders.refreshDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders.editDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders.Sil1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

procedure Tcustomers_orders.PrintDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
MenuShrift(Sender, ACanvas, ARect, Selected);

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    Tcustomers_orders,
    Class_customers_orders,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

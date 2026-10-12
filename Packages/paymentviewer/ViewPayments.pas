unit ViewPayments;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PaymentViewing_TLB, StdVcl, ExtCtrls, Grids, DBGrids,
  StdCtrls, ImgList, DB, OracleData, ComCtrls, ADODB, XDBGrids;

type
  TPaymentViewer = class(TActiveForm, IPaymentViewer)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    ImageList1: TImageList;
    Payment_source: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Paymentdata: TOracleDataSet;
    ADODataSet1: TADODataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Button2: TButton;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    ImageList2: TImageList;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    ADODataSet2: TADODataSet;
    TabSheet2: TTabSheet;
    Button3: TButton;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    Button4: TButton;
    Panel3: TPanel;
    Button5: TButton;
    DateTimePicker7: TDateTimePicker;
    DateTimePicker8: TDateTimePicker;
    DateTimePicker9: TDateTimePicker;
    DateTimePicker10: TDateTimePicker;
    DBGrid3: TDBGrid;
    OracleDataSet1POLIS: TWideStringField;
    OracleDataSet1MEBLEG: TFloatField;
    OracleDataSet1MUSTERI: TWideStringField;
    OracleDataSet1ODENIS_TARIXI: TDateTimeField;
    OracleDataSet1SISTEM_TARIXI: TDateTimeField;
    OracleDataSet1FloatField0: TFloatField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
    FEvents: IPaymentViewerEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ,  Datamodules;

{$R *.DFM}

{ TPaymentViewer }

procedure TPaymentViewer.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_PaymentViewerPage); }
end;

procedure TPaymentViewer.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPaymentViewerEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TPaymentViewer.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TPaymentViewer.Get_Active: WordBool;
begin
  Result := Active;
end;

function TPaymentViewer.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TPaymentViewer.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TPaymentViewer.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TPaymentViewer.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TPaymentViewer.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TPaymentViewer.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TPaymentViewer.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TPaymentViewer.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TPaymentViewer.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TPaymentViewer.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TPaymentViewer.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TPaymentViewer.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TPaymentViewer.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TPaymentViewer.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TPaymentViewer.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TPaymentViewer.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TPaymentViewer.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TPaymentViewer.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TPaymentViewer.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TPaymentViewer.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TPaymentViewer.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TPaymentViewer.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TPaymentViewer.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TPaymentViewer.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TPaymentViewer.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TPaymentViewer.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TPaymentViewer.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TPaymentViewer.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TPaymentViewer.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TPaymentViewer.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TPaymentViewer.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TPaymentViewer._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPaymentViewer.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TPaymentViewer.ActiveFormCreate(Sender: TObject);
begin
datetimepicker1.datetime:=now;
datetimepicker2.datetime:=now;
end;

procedure TPaymentViewer.Button1Click(Sender: TObject);
begin
OracleDataSet1.Close;
OracleDataSet1.SetVariable('dat1' ,trunc(datetimepicker1.Datetime));
OracleDataSet1.SetVariable('dat2',trunc(datetimepicker2.datetime));
OracleDataSet1.Open;
end;

procedure TPaymentViewer.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPaymentViewer.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TPaymentViewer.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ImageIndex: Integer;

begin


//SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT_CREATEDVIEW']);
 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of
      3 :
        ImageIndex := 1;
     2:
      ImageIndex := 0;

      end;
       if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);

    end;
  end;


end;

procedure TPaymentViewer.DBGrid1TitleClick(Column: TColumn);
{$J+}
 const sort : boolean = true;
{$J-}
var
   TitleName :string;
   SortPosition: word;

begin
if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with paymentdata do
    begin


    if sort=true then
    begin
    close;
    sql[5]:='';
    sql[4]:='';
    sql[4]:='order by '+TitleName;
    sql[5]:=' DESC';
    sort:=false;
    end
    else
    begin
       close;
       sql[5]:='';
    sql[4]:='';
    sql[4]:='order by '+TitleName;
    sql[5]:=' ASC';
    sort:=True;
    end;
     //Refresh;
     open;
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;


procedure TPaymentViewer.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPaymentViewer.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TPaymentViewer.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TPaymentViewer.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TPaymentViewer.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TPaymentViewer.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TPaymentViewer.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TPaymentViewer.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TPaymentViewer.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TPaymentViewer.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TPaymentViewer.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TPaymentViewer.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TPaymentViewer.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TPaymentViewer.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TPaymentViewer.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TPaymentViewer.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TPaymentViewer.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TPaymentViewer.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TPaymentViewer.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPaymentViewer.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TPaymentViewer.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TPaymentViewer.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TPaymentViewer.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TPaymentViewer.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TPaymentViewer.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TPaymentViewer.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TPaymentViewer.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TPaymentViewer.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TPaymentViewer.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TPaymentViewer.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TPaymentViewer.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TPaymentViewer,
    Class_PaymentViewer,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

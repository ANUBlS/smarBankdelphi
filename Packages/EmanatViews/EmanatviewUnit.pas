unit EmanatviewUnit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Emanat_view_TLB, StdVcl, ExtCtrls, XFSCtrls, Grids,
  XDBGrids, ComCtrls, ImgList, StdCtrls, Buttons, ToolWin,Mask,
  db, DBCtrlsEh,Variants, CurrencyEdit;
    resourcestring
   cs_CommitInformation = 'Ümumi əməliyyatlar: %d'+#13+'Təsdiqlənmiş əməliyyatlar: %d'+#13+'Təsdiqlənməmiş əməliyyatlar: %d';

type
  TEmwanat_view = class(TActiveForm, IEmwanat_view)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    XFPanel2: TXFPanel;
    XDBGrid1: TXDBGrid;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ImageList: TImageList;
    XDBGrid2: TXDBGrid;
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    DateTi_samelydate: TDBDateTimeEditEh;
    XFRadioButton1: TXFRadioButton;
    XFRadioButton2: TXFRadioButton;
    XFRadioButton3: TXFRadioButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    XFLabel2: TXFLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure XFRadioButton1Click(Sender: TObject);
    procedure XFRadioButton2Click(Sender: TObject);
    procedure XFRadioButton3Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IEmwanat_viewEvents;
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
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
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
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
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

uses ComObj, ComServ,dataEmantUnit;



{$R *.DFM}

{ TEmwanat_view }

procedure TEmwanat_view.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_Emwanat_viewPage); }
end;

procedure TEmwanat_view.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IEmwanat_viewEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TEmwanat_view.Initialize;
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

function TEmwanat_view.Get_Active: WordBool;
begin
  Result := Active;
end;

function TEmwanat_view.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TEmwanat_view.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TEmwanat_view.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TEmwanat_view.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TEmwanat_view.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TEmwanat_view.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TEmwanat_view.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TEmwanat_view.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TEmwanat_view.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TEmwanat_view.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TEmwanat_view.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TEmwanat_view.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TEmwanat_view.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TEmwanat_view.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TEmwanat_view.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TEmwanat_view.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TEmwanat_view.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TEmwanat_view.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TEmwanat_view.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TEmwanat_view.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TEmwanat_view.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TEmwanat_view.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TEmwanat_view.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TEmwanat_view.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TEmwanat_view.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TEmwanat_view.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TEmwanat_view.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TEmwanat_view.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TEmwanat_view.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TEmwanat_view.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TEmwanat_view.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TEmwanat_view._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TEmwanat_view.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TEmwanat_view.ActiveFormCreate(Sender: TObject);
begin
DataEmanat:=TDataEmanat.Create(self);
DataEmanat.Ods_wspaymentemant.open;
XFRadioButton1.Checked:=true;
DateTi_samelydate.value:=DataEmanat.Ods_wssysdateSYSDATE.AsDateTime;
with DataEmanat,Ods_wspaymentemant do
begin
 SQL[3]:='';
 SQL[3]:=SQL[3]+'Where  trunc(respdatetime)=trunc(sysdate) ';
end;
end;

procedure TEmwanat_view.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TEmwanat_view.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TEmwanat_view.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TEmwanat_view.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TEmwanat_view.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TEmwanat_view.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TEmwanat_view.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TEmwanat_view.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TEmwanat_view.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TEmwanat_view.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TEmwanat_view.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TEmwanat_view.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TEmwanat_view.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TEmwanat_view.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TEmwanat_view.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TEmwanat_view.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TEmwanat_view.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TEmwanat_view.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TEmwanat_view.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TEmwanat_view.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TEmwanat_view.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TEmwanat_view.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TEmwanat_view.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TEmwanat_view.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TEmwanat_view.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TEmwanat_view.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TEmwanat_view.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TEmwanat_view.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TEmwanat_view.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TEmwanat_view.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TEmwanat_view.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TEmwanat_view.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TEmwanat_view.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TEmwanat_view.ToolButton1Click(Sender: TObject);
 var
        i:      integer;
        temid :LongInt;
        CommitedCount,ErrorCount: Word;
        LastErrorMessage: String ;
        id :integer;
   begin

 if XFRadioButton1.Checked then
begin
 with DataEmanat,Ods_wspaymentemant do
begin
  SQL[3]:='';
 end;
end;

 DataEmanat.Ods_wspaymentemant.Refresh;

 if  XFRadioButton2.Checked then
  begin
 DataEmanat.ods_sum.Refresh;
  end;
{ CommitedCount :=0;
 ErrorCount :=0;
    with DataEmanat, XDBGrid1, SelectedRows, DataSource.DataSet do
  if MessageDlg('Əməliyyatlar təsdiqlənsin?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
  begin
   DisableControls;
   try
    Application.ProcessMessages;
    if Count =0 then CurrentRowSelected :=True;
    for i :=0 to Count-1 do
    try
    GotoBookmark(TBookmark(Items[i]));
    id:= FieldByName('ID').AsInteger;
    if id>0 then
    begin
    temid := FieldByName('ID').AsInteger;
    DataEmanat.pg_wspayment.CallProcedure('tr_wspayment',[temid]);
   //////
   end;
      except
     on E: Exception do
      begin
       LastErrorMessage :=E.Message;
       Inc(ErrorCount);
       Continue;
     end;
      end;

    finally
    if ErrorCount > 0 then
     if ErrorCount = 1 then
      MessageDlg(LastErrorMessage, mtConfirmation, [mbOk], 0)
     else
      MessageDlg(Format(cs_CommitInformation, [CommitedCount + ErrorCount, CommitedCount, ErrorCount]), mtConfirmation, [mbOk], 0);

    EnableControls;

    DataEmanat.Ods_wspaymentemant.Refresh;
    end;
  end;
  XDBGrid1.DataSource.DataSet.Locate('ID',ID,[loCaseInsensitive,loPartialKey]);}
 end;


procedure TEmwanat_view.ToolButton2Click(Sender: TObject);
var
p_date:Variant;
begin
{if  DateTi_samelydate.value = null then
        begin
     showmessage('  tarixi daxil edin  !');
        Exit;
      end; }
 p_date:= DateTi_samelydate.Value;
   with DataEmanat,ods_arxipayment do
   begin
    close;
   SetVariable('v_dat',p_date);
    open;
   end;
end;

procedure TEmwanat_view.XFRadioButton1Click(Sender: TObject);
begin
XFLabel2.Visible:=true;
CurrencyEdit1.Visible:=true;
with DataEmanat,Ods_wspaymentemant do
begin
  SQL[3]:='';
 // SQL[3]:=SQL[3]+'Where  status=1 and trunc(respdatetime)=trunc(sysdate) ';
 end;
 with DataEmanat, ods_sum do
begin
close;
 SQL[3]:='';
 SQL[3]:=SQL[3]+'Where  status=1 and trunc(respdatetime) BETWEEN trunc(sysdate-2) and trunc(sysdate) ';
 open;
CurrencyEdit1.Value:=DataEmanat.Ods_sumAMOUNT.AsFloat;
end;
end;

procedure TEmwanat_view.XFRadioButton2Click(Sender: TObject);
begin
XFLabel2.Visible:=true;
CurrencyEdit1.Visible:=true;
with DataEmanat,Ods_wspaymentemant do
begin
 SQL[3]:='';
 SQL[3]:=SQL[3]+'Where  status=1 and trunc(respdatetime)=trunc(sysdate) ';
end;
with DataEmanat, ods_sum do
begin
close;
 SQL[3]:='';
 SQL[3]:=SQL[3]+'Where  status=1 and trunc(respdatetime)=trunc(sysdate) ';
 open;
CurrencyEdit1.Value:=DataEmanat.Ods_sumAMOUNT.AsFloat;
end;
end;

procedure TEmwanat_view.XFRadioButton3Click(Sender: TObject);
begin
XFLabel2.Visible:=false;
CurrencyEdit1.Visible:=false;
with DataEmanat,Ods_wspaymentemant do
begin
SQL[3]:='';
  SQL[3]:=SQL[3]+'Where  status=0 and trunc(respdatetime)=trunc(sysdate) ';
end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TEmwanat_view,
    Class_Emwanat_view,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

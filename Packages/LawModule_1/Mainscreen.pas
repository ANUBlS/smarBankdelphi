unit Mainscreen;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Lawmodule_TLB, StdVcl, ImgList, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, XFSCtrls, Buttons, Grids, DBGrids, DB, OracleData;

type
  TLawmodule = class(TActiveForm, ILawmodule)
    ImageList1: TImageList;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    XFPanel1: TXFPanel;
    refreshbtn: TXFBitBtn;
    XFBitBtn2: TXFBitBtn;
    XFBitBtn3: TXFBitBtn;
    XFBitBtn4: TXFBitBtn;
    DBGrid1: TDBGrid;
    MainSclst: TOracleDataSet;
    datsrc_mainlst: TDataSource;
    procedure ActiveFormActivate(Sender: TObject);
    procedure refreshbtnClick(Sender: TObject);
    procedure XFBitBtn2Click(Sender: TObject);
    procedure XFBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: ILawmoduleEvents;
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

uses ComObj, ComServ,SboapiDataModuleImpl,SBTranslateProc,  datamod, CourtUNIT,
  Unit5;

{$R *.DFM}

{ TLawmodule }

procedure TLawmodule.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_LawmodulePage); }
end;

procedure TLawmodule.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ILawmoduleEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TLawmodule.Initialize;
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

function TLawmodule.Get_Active: WordBool;
begin
  Result := Active;
end;

function TLawmodule.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TLawmodule.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TLawmodule.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TLawmodule.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TLawmodule.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TLawmodule.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TLawmodule.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TLawmodule.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TLawmodule.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TLawmodule.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TLawmodule.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TLawmodule.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TLawmodule.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TLawmodule.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TLawmodule.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TLawmodule.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TLawmodule.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TLawmodule.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TLawmodule.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TLawmodule.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TLawmodule.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TLawmodule.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TLawmodule.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TLawmodule.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TLawmodule.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TLawmodule.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TLawmodule.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TLawmodule.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TLawmodule.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TLawmodule.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TLawmodule.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TLawmodule._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TLawmodule.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TLawmodule.ActiveFormActivate(Sender: TObject);
begin
// SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);

end;

procedure TLawmodule.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TLawmodule.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TLawmodule.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TLawmodule.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TLawmodule.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TLawmodule.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TLawmodule.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TLawmodule.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TLawmodule.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TLawmodule.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TLawmodule.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TLawmodule.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TLawmodule.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TLawmodule.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TLawmodule.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TLawmodule.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TLawmodule.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TLawmodule.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TLawmodule.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TLawmodule.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TLawmodule.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TLawmodule.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TLawmodule.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TLawmodule.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TLawmodule.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TLawmodule.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TLawmodule.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TLawmodule.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TLawmodule.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TLawmodule.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TLawmodule.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TLawmodule.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TLawmodule.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TLawmodule.XFBitBtn2Click(Sender: TObject);
begin
 if not Assigned(CourtFrm) then
     CourtFrm:=TCourtFrm.Create(nil);
     CourtFrm.ShowModal;
end;

procedure TLawmodule.XFBitBtn3Click(Sender: TObject);

var     Sheet, Sheets  :Variant;
  ay,il,il_s,k,s,ss,st,sc,sd,sf,l,val :String;
                            V:Variant;
  OpenedXlsCnt,b, a,   i,j,w  :Integer;
 v_BDate    :TDateTime;
 v_EDate    :TDateTime;
 row:integer;

 esasborc,faizborc, cemiesas,cemifaiz:real;


begin
{DataMod.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['HUQUQEMLAK']);
 ExcelApplication1.Disconnect;
  V :=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  V.Workbooks.Open(ExtractFilePath(ExtractFilePath(ParamStr(0)))+ 'PortfelABB_Court.xlsx');
  try

  for OpenedXlsCnt :=1 to 100 do
   Sheet := V.Workbooks[OpenedXlsCnt].Worksheets['sheet1'];
   //Break;
  except


  end;

  sheets :=V.Sheets;

  a:=0;
   i:=0 ;
   if not datamod.Main_court.Active then
   begin
   datamod.Main_court.close;
   datamod.Main_court.open;
   end;

         datamod.Main_court.First;


    for a:=0 to datamod.Main_court.RecordCount-1 do
   begin
  // try
     esasborc:=0;
     faizborc:=0;
     cemiesas:=0;
     cemifaiz:=0;
     val:='AZN';
 //ShowMessage('nnnn');
    // Sheet.cells[7+i,6]:= datamod.maincrprt.fieldbyname('INNORPIN').AsString;
     Sheet.cells[7+i,1]:=datamod.Main_court.fieldbyname('rownum').AsString;
     Sheet.cells[7+i,2]:=datamod.Main_court.fieldbyname('rownum').AsString;
     Sheet.cells[7+i,3]:=datamod.Main_court.fieldbyname('prtid').AsString;
     Sheet.cells[7+i,4]:=datamod.Main_court.fieldbyname('INNORPIN').AsString;
     Sheet.cells[7+i,5]:=datamod.Main_court.fieldbyname('filname').AsString;
     Sheet.cells[7+i,6]:=datamod.Main_court.fieldbyname('borrower_name').AsString;
     Sheet.cells[7+i,7]:=datamod.Main_court.fieldbyname('akt1').AsString;
     Sheet.cells[7+i,8]:=datamod.Main_court.fieldbyname('akt1_date').AsVariant;
     Sheet.cells[7+i,9]:=datamod.Main_court.fieldbyname('akt2').AsString;
     Sheet.cells[7+i,10]:=datamod.Main_court.fieldbyname('akt2_date').AsVariant;
     Sheet.cells[7+i,23]:=datamod.Main_court.fieldbyname('COURT_AMMOUNT').AsString;
     Sheet.cells[7+i,24]:=datamod.Main_court.fieldbyname('COURT_STATUS').AsString;
     Sheet.cells[7+i,25]:=datamod.Main_court.fieldbyname('COURT_DATE_NUM').AsString;
     Sheet.cells[7+i,26]:=datamod.Main_court.fieldbyname('COURT_NAME').AsString;
     Sheet.cells[7+i,27]:=datamod.Main_court.fieldbyname('COURT_ACCEPTED_AMMOUNT').AsString;
     Sheet.cells[7+i,28]:=datamod.Main_court.fieldbyname('COURT_DESC').AsString;
     Sheet.cells[7+i,29]:=datamod.Main_court.fieldbyname('COURT_MANAGE').AsString;
     Sheet.cells[7+i,30]:=datamod.Main_court.fieldbyname('COURT_LASTSTAT').AsString;
     Sheet.cells[7+i,31]:=datamod.Main_court.fieldbyname('COURT_MEASURE').AsString;
     Sheet.cells[7+i,32]:=datamod.Main_court.fieldbyname('COURT_REPLACE').AsString;
     Sheet.cells[7+i,33]:=datamod.Main_court.fieldbyname('REPLACEMENT_COUNT').AsString;
     Sheet.cells[7+i,34]:=datamod.Main_court.fieldbyname('INVESTIGATION_ORG').AsString;
     Sheet.cells[7+i,35]:=datamod.Main_court.fieldbyname('INFOS').AsString;




     i:=i+1;
     datamod.Main_court.Next;
{   except
     ShowMessage('66666');
   end; }{
   end;

  ExcelApplication1.Visible[0] :=True;
  ExcelApplication1.Disconnect;   }
end;

procedure TLawmodule.refreshbtnClick(Sender: TObject);
begin
MainSclst.CloseAll;
MainSclst.Open;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TLawmodule,
    Class_Lawmodule,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit AutoDictImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, AutoDict_TLB, StdVcl, Db, OracleData, DBCtrls, Grids,
  DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons;

  
type
  TfmAutoDict = class(TActiveForm, IfmAutoDict)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    Panel2: TPanel;
    dbgMain: TDBGrid;
    Panel3: TPanel;
    dbgChilde: TDBGrid;
    DBNavigator2: TDBNavigator;
    DSMain: TDataSource;
    ODSMain: TOracleDataSet;
    ODSMainID: TFloatField;
    ODSMainNAME: TWideStringField;
    DSChilde: TDataSource;
    ODSChildeID: TFloatField;
    ODSChildeNAME: TWideStringField;
    ODSChildeMARK_ID: TFloatField;
    ODSChilde: TOracleDataSet;
    ODSStates: TOracleDataSet;
    DataSource1: TDataSource;
    ODSStatesID: TFloatField;
    ODSStatesNAME: TWideStringField;
    ODSMainSTATE_ID: TFloatField;
    ODSMainState: TWideStringField;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    ODSMainCALCOPTIONS: TIntegerField;
    ODSChildeCALCOPTIONS: TIntegerField;
    ODSCalcOptions: TOracleDataSet;
    ODSMainCalcOptList: TWideStringField;
    ODSChildeCalcOpt: TWideStringField;
    ODSCalcOptionsID: TFloatField;
    ODSCalcOptionsNAME: TWideStringField;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ODSMainAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IfmAutoDictEvents;
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
var
  fmAutoDict : TfmAutoDict;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl,SBTranslateProc;

{$R *.DFM}

{ TfmAutoDict }

procedure TfmAutoDict.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmAutoDictPage); }
end;

procedure TfmAutoDict.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmAutoDictEvents;
end;

procedure TfmAutoDict.Initialize;
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

function TfmAutoDict.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmAutoDict.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmAutoDict.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmAutoDict.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmAutoDict.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmAutoDict.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmAutoDict.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmAutoDict.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmAutoDict.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmAutoDict.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmAutoDict.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmAutoDict.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmAutoDict.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmAutoDict.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmAutoDict.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmAutoDict.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmAutoDict.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmAutoDict.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmAutoDict._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmAutoDict.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmAutoDict.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmAutoDict.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmAutoDict.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmAutoDict.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmAutoDict.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmAutoDict.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmAutoDict.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmAutoDict.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmAutoDict.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmAutoDict.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmAutoDict.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmAutoDict.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmAutoDict.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmAutoDict.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmAutoDict.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmAutoDict.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmAutoDict.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmAutoDict.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmAutoDict.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmAutoDict.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmAutoDict.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmAutoDict.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmAutoDict.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfmAutoDict.ActiveFormCreate(Sender: TObject);
begin

  fmAutoDict := Self;
SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
//showmessage('Salam');

end;

procedure TfmAutoDict.ODSMainAfterPost(DataSet: TDataSet);
begin
  (DataSet as TOracleDataSet).RefreshRecord;
end;

procedure TfmAutoDict.BitBtn1Click(Sender: TObject);
begin
  ODSMain.Refresh;
  ODSChilde.Refresh;
  ODSStates.Refresh;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmAutoDict,
    Class_fmAutoDict,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

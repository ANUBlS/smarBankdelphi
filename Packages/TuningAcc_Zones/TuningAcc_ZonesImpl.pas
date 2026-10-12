unit TuningAcc_ZonesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, TuningAcc_Zones_TLB, StdVcl, StdCtrls, Db, OracleData,
  Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TTuningAcc_ZonesForm = class(TActiveForm, ITuningAcc_ZonesForm)
    Account_Zones: TOracleDataSet;
    DataSrcAccount_Zones: TDataSource;
    Account_Zones_Info: TOracleDataSet;
    DataSrcAccount_Zones_Info: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Account_Zones_InfoZONEID: TFloatField;
    Account_Zones_InfoACCOUNTS: TFloatField;
    Account_ZonesID: TFloatField;
    Account_ZonesZONENAME: TStringField;
    Account_ZonesZONEDESCRIPTION: TStringField;
    Panel2: TPanel;
    Zones: TDBGrid;
    Panel3: TPanel;
    ZonesInfo: TDBGrid;
    DBNavigator1: TDBNavigator;
    Accounts: TOracleDataSet;
    procedure ActiveFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEvents: ITuningAcc_ZonesFormEvents;
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

uses ComObj, ComServ ,sboapiDataModuleImpl;

{$R *.DFM}

{ TTuningAcc_ZonesForm }

procedure TTuningAcc_ZonesForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TuningAcc_ZonesFormPage); }
end;

procedure TTuningAcc_ZonesForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITuningAcc_ZonesFormEvents;
end;

procedure TTuningAcc_ZonesForm.Initialize;
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

function TTuningAcc_ZonesForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TTuningAcc_ZonesForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TTuningAcc_ZonesForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TTuningAcc_ZonesForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTuningAcc_ZonesForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTuningAcc_ZonesForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TTuningAcc_ZonesForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTuningAcc_ZonesForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTuningAcc_ZonesForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTuningAcc_ZonesForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTuningAcc_ZonesForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TTuningAcc_ZonesForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTuningAcc_ZonesForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTuningAcc_ZonesForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTuningAcc_ZonesForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTuningAcc_ZonesForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTuningAcc_ZonesForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTuningAcc_ZonesForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTuningAcc_ZonesForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTuningAcc_ZonesForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTuningAcc_ZonesForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTuningAcc_ZonesForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTuningAcc_ZonesForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTuningAcc_ZonesForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTuningAcc_ZonesForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTuningAcc_ZonesForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTuningAcc_ZonesForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTuningAcc_ZonesForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTuningAcc_ZonesForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTuningAcc_ZonesForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTuningAcc_ZonesForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTuningAcc_ZonesForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TTuningAcc_ZonesForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTuningAcc_ZonesForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTuningAcc_ZonesForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTuningAcc_ZonesForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTuningAcc_ZonesForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTuningAcc_ZonesForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TTuningAcc_ZonesForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTuningAcc_ZonesForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTuningAcc_ZonesForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTuningAcc_ZonesForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTuningAcc_ZonesForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TTuningAcc_ZonesForm.ActiveFormCreate(Sender: TObject);
begin
  with Accounts do
  begin
    Open;
    First;
    while not EOF do
    with ZonesInfo.Columns[1].PickList do
    begin
      Add(FieldByName('BAL_CN').AsString);
      Next;
    end;
    CloseAll;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTuningAcc_ZonesForm,
    Class_TuningAcc_ZonesForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

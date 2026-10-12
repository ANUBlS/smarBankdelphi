unit AccBalanceCheckFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, AccBalanceCheck_TLB, StdVcl, Db, OracleData, Grids,
  DBGrids, ToolWin, ComCtrls, ExtCtrls, ActnList, ImgList, Menus, StdCtrls;

type
  TAccBalanceCheckForm = class(TActiveForm, IAccBalanceCheckForm)
    Accs: TOracleDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    CheckAccount: TAction;
    CheckAllAccounts: TAction;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    CheckAccount1: TMenuItem;
    CheckAllAccounts1: TMenuItem;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    AccountNoSearchEdit: TEdit;
    AccsID: TFloatField;
    AccsACCOUNTNO: TStringField;
    AccsACCNAME: TStringField;
    AccsAMOUNT: TFloatField;
    AccsLAMOUNT: TFloatField;
    AccsDEBITTURNOVER: TFloatField;
    AccsDEBITLTURNOVER: TFloatField;
    AccsCREDITTURNOVER: TFloatField;
    AccsCREDITLTURNOVER: TFloatField;
    AccsStatus: TStringField;
    CorrectAccBalance: TAction;
    CorrectAccBalance1: TMenuItem;
    ToolButton3: TToolButton;
    procedure CheckAccountExecute(Sender: TObject);
    procedure AccountNoSearchEditChange(Sender: TObject);
    procedure AccsCalcFields(DataSet: TDataSet);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure CorrectAccBalanceExecute(Sender: TObject);
    procedure CheckAllAccountsExecute(Sender: TObject);
  private
    { Private declarations }
    FEvents: IAccBalanceCheckFormEvents;
    FStatusList: TStringList;
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

uses ComObj, ComServ, sboapiDataModuleImpl, SBAccount;

{$R *.DFM}

{ TAccBalanceCheckForm }

procedure TAccBalanceCheckForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_AccBalanceCheckFormPage); }
end;

procedure TAccBalanceCheckForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAccBalanceCheckFormEvents;
end;

procedure TAccBalanceCheckForm.Initialize;
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

function TAccBalanceCheckForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TAccBalanceCheckForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TAccBalanceCheckForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TAccBalanceCheckForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TAccBalanceCheckForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TAccBalanceCheckForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TAccBalanceCheckForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TAccBalanceCheckForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TAccBalanceCheckForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TAccBalanceCheckForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TAccBalanceCheckForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TAccBalanceCheckForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TAccBalanceCheckForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TAccBalanceCheckForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TAccBalanceCheckForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TAccBalanceCheckForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TAccBalanceCheckForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TAccBalanceCheckForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TAccBalanceCheckForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccBalanceCheckForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TAccBalanceCheckForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TAccBalanceCheckForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TAccBalanceCheckForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TAccBalanceCheckForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TAccBalanceCheckForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TAccBalanceCheckForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TAccBalanceCheckForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TAccBalanceCheckForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TAccBalanceCheckForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TAccBalanceCheckForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TAccBalanceCheckForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TAccBalanceCheckForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TAccBalanceCheckForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TAccBalanceCheckForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TAccBalanceCheckForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TAccBalanceCheckForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TAccBalanceCheckForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccBalanceCheckForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TAccBalanceCheckForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TAccBalanceCheckForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TAccBalanceCheckForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TAccBalanceCheckForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TAccBalanceCheckForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TAccBalanceCheckForm.CheckAccountExecute(Sender: TObject);
var
  Errors: TErrorSet;
  Pos: TBookmark;
begin
  if Sb_CheckAccBalance(Accs.FieldByName('ID').AsInteger, Errors) then
    FStatusList.Values[Accs.FieldByName('ID').AsString] := 'Ok'
  else
    FStatusList.Values[Accs.FieldByName('ID').AsString] := 'Error';
  with Accs do
  begin
    DisableControls;
    try
      Pos := GetBookmark;
      Refresh;
      GotoBookmark(Pos);
    finally
      EnableControls;
    end;
  end;
end;

procedure TAccBalanceCheckForm.AccountNoSearchEditChange(Sender: TObject);
begin
  with Accs do
    if not Locate('AccountNo', (Sender as TEdit).Text, [loCaseInsensitive, loPartialKey]) then
      Beep;
end;

procedure TAccBalanceCheckForm.AccsCalcFields(DataSet: TDataSet);
begin
  if Assigned(FStatusList) then
    with Accs do
      FieldByname('Status').AsString := FStatusList.Values[FieldByName('ID').AsString];
end;

procedure TAccBalanceCheckForm.ActiveFormCreate(Sender: TObject);
begin
  FStatusList := TStringList.Create;
end;

procedure TAccBalanceCheckForm.ActiveFormDestroy(Sender: TObject);
begin
  FStatusList.Free;
end;

procedure TAccBalanceCheckForm.CorrectAccBalanceExecute(Sender: TObject);
begin
  Sb_CorrectAccBalance(Accs.FieldByName('ID').AsInteger);
  CheckAccount.Execute;
end;

procedure TAccBalanceCheckForm.CheckAllAccountsExecute(Sender: TObject);
begin
  with Accs do
  begin
    First;
    while not Eof do
    begin
      CheckAccount.Execute;  
      Next;
    end;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TAccBalanceCheckForm,
    Class_AccBalanceCheckForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

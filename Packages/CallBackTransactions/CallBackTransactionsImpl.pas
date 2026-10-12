unit CallBackTransactionsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, CallBackTransactions_TLB, StdVcl, ComCtrls, ExtCtrls,
  StdCtrls, CheckLst, Oracle, DBCtrls, Db, OracleData;

type
  TCallBackTransactionsForm = class(TActiveForm, ICallBackTransactionsForm)
    Panel1: TPanel;
    StatusBar: TStatusBar;
    OperationType: TOracleQuery;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    ButtonCommit: TButton;
    DBLookupDebetBranch: TDBLookupComboBox;
    DBLookupDebet: TDBLookupComboBox;
    DebetSide: TOracleDataSet;
    CreditSide: TOracleDataSet;
    DebetData: TDataSource;
    CreditData: TDataSource;
    DebetBranch: TOracleDataSet;
    CreditBranch: TOracleDataSet;
    DebetBranchData: TDataSource;
    CreditBranchData: TDataSource;
    GroupBox2: TGroupBox;
    DBLookupCreditBranch: TDBLookupComboBox;
    DBLookupCredit: TDBLookupComboBox;
    OPCallBack: TOraclePackage;
    Operations: TOracleDataSet;
    OperationsData: TDataSource;
    GroupBox3: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel6: TPanel;
    CheckListOperations: TCheckListBox;
    StaticText1: TStaticText;
    procedure OperationTypeThreadRecord(Sender: TOracleQuery);
    procedure ActiveFormCreate(Sender: TObject);
    procedure CheckListOperationsClickCheck(Sender: TObject);
    procedure ButtonCommitClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: ICallBackTransactionsFormEvents;
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
    procedure SetAddress;
    function GenerateOperationFilter: string;
    procedure Initialize; override;

  end;

var
   OperationIDs: TStringList;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl, SBStoredProc;

{$R *.DFM}

{ TCallBackTransactionsForm }

procedure TCallBackTransactionsForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CallBackTransactionsFormPage); }
end;

procedure TCallBackTransactionsForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICallBackTransactionsFormEvents;
end;

procedure TCallBackTransactionsForm.Initialize;
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

function TCallBackTransactionsForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCallBackTransactionsForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCallBackTransactionsForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCallBackTransactionsForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCallBackTransactionsForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCallBackTransactionsForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCallBackTransactionsForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCallBackTransactionsForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCallBackTransactionsForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCallBackTransactionsForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCallBackTransactionsForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCallBackTransactionsForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCallBackTransactionsForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCallBackTransactionsForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCallBackTransactionsForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCallBackTransactionsForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCallBackTransactionsForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCallBackTransactionsForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCallBackTransactionsForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCallBackTransactionsForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCallBackTransactionsForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCallBackTransactionsForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCallBackTransactionsForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCallBackTransactionsForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCallBackTransactionsForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCallBackTransactionsForm.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCallBackTransactionsForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCallBackTransactionsForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCallBackTransactionsForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCallBackTransactionsForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCallBackTransactionsForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCallBackTransactionsForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCallBackTransactionsForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCallBackTransactionsForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCallBackTransactionsForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCallBackTransactionsForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCallBackTransactionsForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCallBackTransactionsForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCallBackTransactionsForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCallBackTransactionsForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCallBackTransactionsForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCallBackTransactionsForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCallBackTransactionsForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


//-------------------------------------------------{- Main-}----------------------------------------------------


procedure TCallBackTransactionsForm.SetAddress;
begin
 if not(Assigned(OperationIDs)) then
  OperationIDs:=TStringList.Create
 else
  OperationIDs.Clear;

 CheckListOperations.Tag:=Integer(@OperationIDs);
 OperationType.Execute;
end;

function TCallBackTransactionsForm.GenerateOperationFilter: string;
var
   Condition: string;
   i, icount: integer;
begin
 Condition :='';
  with CheckListOperations do
  begin
   icount :=Items.Count;
   for i :=0 to icount -1 do
   begin
    if Checked[i] then
     if Condition = '' then
      Condition :=(TStringList(Pointer(Tag)^).Strings[i])
     else
      Condition :=Condition + ',' + (TStringList(Pointer(Tag)^).Strings[i]);
   end;
 end;
 Result :=Condition;
end;

procedure TCallBackTransactionsForm.OperationTypeThreadRecord(
  Sender: TOracleQuery);
begin
 with CheckListOperations, Items do
  begin
   Add(Sender.Field('name'));
   Checked[Count-1] :=True;
   TStringList(Pointer(Tag)^).Add(Sender.Field('ID'));
  end;
end;

procedure TCallBackTransactionsForm.ActiveFormCreate(Sender: TObject);
begin
 SetAddress;
 DebetBranch.Open;
 CreditBranch.Open;
 DebetSide.Open;
 CreditSide.Open;
 DBLookupDebetBranch.KeyValue :=0;
 DBLookupCreditBranch.KeyValue :=0;
end;

procedure TCallBackTransactionsForm.CheckListOperationsClickCheck(
  Sender: TObject);
begin
  ButtonCommit.Enabled :=WillEnabled(CheckListOperations)
                         and (TrimAll(DBLookupDebet.Text)<>'')
                         and (TrimAll(DBLookupCredit.Text)<>'');
end;

procedure TCallBackTransactionsForm.ButtonCommitClick(Sender: TObject);
begin
 Screen.Cursor :=crSQLWait;
 //ShowMessage(GenerateOperationFilter);
 try
  with OPCallBack do
   CallProcedure('SetTransactions', [DebetSide.FieldbyName('ID').AsInteger, CreditSide.FieldbyName('ID').AsInteger,
                                     GenerateOperationFilter, DebetBranch.FieldbyName('ID').AsInteger]);
 finally                                                                       
  Screen.Cursor :=crDefault;
 end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCallBackTransactionsForm,
    Class_CallBackTransactionsForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

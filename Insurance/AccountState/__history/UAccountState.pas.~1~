unit UAccountState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PAccountState_TLB, StdVcl,SBPlgAx50_TLB, Grids, DBGrids,
  ComCtrls, StdCtrls, Buttons, ExtCtrls,ExcelExporter;

const
     WM_ModalResult = WM_USER+139;

type
  TAccountState = class(TActiveForm, IAccountState,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    CloseButton: TButton;
    PageControl1: TPageControl;
    AccAmountSheet: TTabSheet;
    DBGridAccState: TDBGrid;
    AccTurnoverSheet: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    AccStateExporter: TExcelExporter;
    procedure ActiveFormCreate(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FOwnerHandle : Integer;

    FEvents: IAccountStateEvents;
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

     function  Get_Owner:Integer; safecall;
    procedure Set_Owner(val : Integer);  safecall;
    {IParamInput}
    function  Get_Params(const Name: WideString): OleVariant; safecall;
    procedure Set_Params(const Name: WideString; Value: OleVariant); safecall;
    property Params[const Name: WideString]: OleVariant read Get_Params write Set_Params;
    {IInstance}
    function InstanceInitialize: HResult; safecall;
    function IUIObject.Initialize = InstanceInitialize;
    function Cleanup: HResult; safecall;
    {IUIObject}
//    function  Get_Icon: OLE_HANDLE; safecall;
    function UIObjectActivate: HResult; safecall;
    function IUIObject.Activate = UIObjectActivate;
    function QueryDeactivate: HResult; safecall;
    function UIObjectDeactivate: HResult; safecall;
    function IUIObject.Deactivate = UIObjectDeactivate;
    function SaveState: HResult; safecall;
    function  Get_Height : Integer; safecall;
    function  Get_Width  : Integer; safecall;
  public
    { Public declarations }
    AccountNumber: String;
    PriorAccountID, AccountID: Longint;
    procedure Initialize; override;

  end;

var
     AccountState:TAccountState;

implementation

uses ComObj, ComServ, UAStateDModule,sboapiDataModuleImpl;

{$R *.DFM}

{ TAccountState }

procedure TAccountState.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_AccountStatePage); }
end;

procedure TAccountState.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAccountStateEvents;
end;

procedure TAccountState.Initialize;
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

function TAccountState.Get_Active: WordBool;
begin
  Result := Active;
end;

function TAccountState.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TAccountState.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TAccountState.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TAccountState.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TAccountState.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TAccountState.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TAccountState.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TAccountState.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TAccountState.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TAccountState.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TAccountState.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TAccountState.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TAccountState.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TAccountState.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TAccountState.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TAccountState.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TAccountState.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TAccountState._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountState.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TAccountState.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TAccountState.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TAccountState.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TAccountState.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TAccountState.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TAccountState.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TAccountState.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TAccountState.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TAccountState.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TAccountState.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TAccountState.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TAccountState.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TAccountState.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TAccountState.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TAccountState.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TAccountState.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TAccountState.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountState.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TAccountState.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TAccountState.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TAccountState.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TAccountState.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TAccountState.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TAccountState.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TAccountState.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TAccountState.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TAccountState.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TAccountState.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TAccountState.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TAccountState.UIObjectActivate: HResult;
const
     cs_message = 'Rest & TurnOvers for account "%s"';
begin
    PriorAccountID :=-1;

    {with AccountStateDModule.Account do
    begin
         AccountID :=FieldByName('ID').AsInteger;
         AccountNumber :=FieldByName('acc_no').AsString;
    end;   }
   AccountId:=StrToInt(Get_Params('id'));
   AccountNumber:=Get_Params('acc_no');
   AccountStateDModule.Account.Locate('id',AccountId,[]);   //??
   Caption :=Format(cs_message, [AccountNumber]);
   if AccountID <> PriorAccountID then
   with AccountStateDModule.AccStateData do
   begin
        CloseAll;
        SetVariable('AccID', AccountID);
        Open;
   end;
   PriorAccountID :=AccountID;
   Result := S_OK;
end;

function TAccountState.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TAccountState.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TAccountState.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TAccountState.Get_Height : Integer;
begin
  Result := Height;
end;

function  TAccountState.Get_Width  : Integer;
begin
  Result := Width;
end;


procedure TAccountState.ActiveFormCreate(Sender: TObject);
begin
      AccountState:=Self;
      FParams := TStringList.Create;
      AccountStateDModule:=TAccountStateDModule.Create(Self);
end;

procedure TAccountState.CloseButtonClick(Sender: TObject);
begin
      PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TAccountState.SpeedButton1Click(Sender: TObject);
begin
  with AccStateExporter do
    if ExportSource.DataSet.Active and(ExportSource.DataSet.RecordCount > 0) then
    begin     
       ExportSource.DataSet.Last;
       ExportSource.DataSet.First;
       Report;
    end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TAccountState,
    Class_AccountState,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

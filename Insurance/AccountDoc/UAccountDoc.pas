unit UAccountDoc;
           //CreditAmountEdit
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PAccountDoc_TLB, StdVcl, Grids, DBGrids, Mask, DBCtrls,
  StdCtrls, CurrencyEdit, ExtCtrls, ComCtrls, Buttons,SBPlgAx50_TLB,
  ExcelExporter, Db, OracleData;

const
     WM_ModalResult = WM_USER+139;

type
  TAccountDoc = class(TActiveForm, IAccountDoc,IUIObject,
             IParamInput)//,
             //ISBPlgAc50BufferForm)    tale
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    OkButton: TButton;
    PageControlTrans: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    DebitAmountEdit: TCurrencyEdit;
    DebitLAmountEdit: TCurrencyEdit;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    DebitTransactionsGrid: TDBGrid;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    CreditAmountEdit: TCurrencyEdit;
    CreditLAmountEdit: TCurrencyEdit;
    Panel4: TPanel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    AccTrExport: TExcelExporter;
    procedure ActiveFormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DebetTransactionsDataCalcFields(DataSet: TDataSet);
    procedure CreditTransactionsDataCalcFields(DataSet: TDataSet);
    procedure DebetTransactionsDataAfterOpen(DataSet: TDataSet);
    procedure CreditTransactionsDataAfterOpen(DataSet: TDataSet);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FOwnerHandle : Integer;

    FEvents: IAccountDocEvents;
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
    AccountId:longint;
    AccountNumber: String;
    procedure Initialize; override;
    procedure OpenDataControls(BeginDate, EndDate: TDateTime);
    procedure FillAmounts(DataSet: TDataSet; AmountField, LAmountField: TField;
          AmountEdit, LAmountEdit: TCurrencyEdit);

  end;

var
     AccountDoc:TAccountDoc;

implementation

uses ComObj, ComServ,SBTranslateProc,sboapiDataModuleimpl, UAccDModule;

{$R *.DFM}

{ TAccountDoc }

procedure TAccountDoc.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_AccountDocPage); }
end;

procedure TAccountDoc.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IAccountDocEvents;
end;

procedure TAccountDoc.Initialize;
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

function TAccountDoc.Get_Active: WordBool;
begin
  Result := Active;
end;

function TAccountDoc.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TAccountDoc.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TAccountDoc.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TAccountDoc.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TAccountDoc.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TAccountDoc.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TAccountDoc.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TAccountDoc.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TAccountDoc.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TAccountDoc.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TAccountDoc.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TAccountDoc.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TAccountDoc.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TAccountDoc.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TAccountDoc.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TAccountDoc.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TAccountDoc.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TAccountDoc._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountDoc.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TAccountDoc.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TAccountDoc.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TAccountDoc.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TAccountDoc.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TAccountDoc.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TAccountDoc.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TAccountDoc.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TAccountDoc.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TAccountDoc.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TAccountDoc.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TAccountDoc.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TAccountDoc.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TAccountDoc.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TAccountDoc.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TAccountDoc.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TAccountDoc.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TAccountDoc.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TAccountDoc.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TAccountDoc.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TAccountDoc.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TAccountDoc.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TAccountDoc.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TAccountDoc.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TAccountDoc.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TAccountDoc.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TAccountDoc.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TAccountDoc.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TAccountDoc.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TAccountDoc.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TAccountDoc.UIObjectActivate: HResult;
const
     cs_message = 'Transactions for account "%s"';
var
     AStartDate, AEndDate: TDateTime;
begin

    id:=StrToInt(Get_Params('id'));
    //showmessage(Get_Params('id'));
    AccountNumber:=Get_Params('acc_no');
    AStartDate:=StrToDate(Get_Params('AStartDate'));
    AEndDate:=StrToDate(Get_Params('AEndDate'));
     //showmessage(AccountNumber);
    AccountDoc.Caption :=Format(cs_message, [AccountNumber]);

    //AccountDModule.Account.Locate('id',id,[]);

    AccountDModule.Account.Close;
    AccountDModule.Account.SetVariable('pid',id);
    AccountDModule.Account.open;

   // Memo1.Text:= AccountDModule.Account.SQL.Text;
    OpenDataControls(AStartDate, AEndDate);
    {with AccountDModule,Account do
    AccountNumber :=FieldByName('acc_no').AsString;
    Caption :=Format(cs_message, [AccountNumber]); }
    Result := S_OK;
end;

function TAccountDoc.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TAccountDoc.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TAccountDoc.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TAccountDoc.Get_Height : Integer;
begin
  Result := Height;
end;

function  TAccountDoc.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TAccountDoc.ActiveFormCreate(Sender: TObject);
begin
     AccountDoc:=self;
     FParams := TStringList.Create;
     AccountDModule:=TAccountDModule.Create(Self);
     SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);

end;

procedure TAccountDoc.SpeedButton1Click(Sender: TObject);
begin
  with  AccTrExport do
  begin
   if PageControlTrans.ActivePageIndex = 0 then
     ExportSource := AccountDModule.DebetTransactions
   else
     ExportSource := AccountDModule.CreditTransactions;
   Report;
  end;
end;

procedure TAccountDoc.FillAmounts(DataSet: TDataSet; AmountField,
  LAmountField: TField; AmountEdit, LAmountEdit: TCurrencyEdit);
var
  Amount: Currency;
  LAmount: Currency;
begin
  Amount := 0.0;
  LAmount := 0.0;
  with DataSet do
  begin
    DisableControls;
    try
      while not Eof do
      begin
        Amount := Amount + AmountField.Value;
        LAmount := LAmount + LAmountField.Value;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  AmountEdit.Value := Amount;
  LAmountEdit.Value := LAmount;


end;

procedure TAccountDoc.OpenDataControls(BeginDate, EndDate: TDateTime);
 procedure Open_(DataSet: TOracleDataSet);
 begin
  with DataSet do
  begin
   CloseAll;
   SetVariable('AccountID', AccountID);
   SetVariable('StartDate', BeginDate);
   SetVariable('EndDate', EndDate);
   Open;
  end;
 end;

begin
 with AccountDModule.Account do
  AccountID :=FieldByName('ID').AsInteger;

  Open_(AccountDModule.DebetTransactionsData);
  Open_(AccountDModule.CreditTransactionsData);

end;

procedure TAccountDoc.DebetTransactionsDataCalcFields(DataSet: TDataSet);
begin
      with DataSet do
      FieldByName('DebitAccNo').AsString:=AccountDModule.Account.FieldByName('acc_no').AsString;
end;

procedure TAccountDoc.CreditTransactionsDataCalcFields(DataSet: TDataSet);
begin
     with DataSet do
     FieldByName('CreditAccNo').AsString :=AccountDModule.Account.FieldByName('acc_no').AsString;
end;

procedure TAccountDoc.DebetTransactionsDataAfterOpen(DataSet: TDataSet);
begin
       FillAmounts(
    DataSet,
    AccountDModule.DebetTransactionsDataDEBITAMOUNT,
    AccountDModule.DebetTransactionsDataLAMOUNT,
    DebitAmountEdit,
    DebitLAmountEdit);
end;

procedure TAccountDoc.CreditTransactionsDataAfterOpen(DataSet: TDataSet);
begin
       FillAmounts(
    DataSet,
    AccountDModule.CreditTransactionsDataCreditAMOUNT,
    AccountDModule.CreditTransactionsDataLAMOUNT,
    CreditAmountEdit,
    CreditLAmountEdit);
end;

procedure TAccountDoc.OkButtonClick(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TAccountDoc,
    Class_AccountDoc,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

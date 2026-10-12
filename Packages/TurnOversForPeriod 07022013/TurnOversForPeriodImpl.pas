unit TurnOversForPeriodImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, TurnOversForPeriod_TLB, StdVcl, ExtCtrls, StdCtrls,
  ComCtrls, SearchCombo, Buttons, Db, OracleData, ExcelExporter, ImgList ,SBPlgAx50_TLB,
  CMExcelExport;

type
  TTurnOvers_Form = class(TActiveForm, ITurnOvers_Form,IIconExporter)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DTPBeginDate: TDateTimePicker;
    DTPEndDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    CBCurrency: TSearchCombo;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    CBAccountType: TComboBox;
    GroupBox5: TGroupBox;
    AccountListEdit: TEdit;
    GroupBox6: TGroupBox;
    CBBranch: TSearchCombo;
    RGAmountType: TRadioGroup;
    GroupBox7: TGroupBox;
    CBWithAccNames: TCheckBox;
    Panel3: TPanel;
    RGReportType: TRadioGroup;
    SBExecute: TSpeedButton;
    LogMemo: TMemo;
    ImageList1: TImageList;
    TurnOversExporter: TCMExcelExport;
    AccountListEditSH: TEdit;
    Label3: TLabel;
    procedure ActiveFormCreate(Sender: TObject);
    procedure SBExecuteClick(Sender: TObject);
    procedure DTPBeginDateChange(Sender: TObject);
    procedure RGAmountTypeClick(Sender: TObject);
    procedure AccountListEditSHClick(Sender: TObject);
    procedure AccountListEditClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: ITurnOvers_FormEvents;
    FModified : Boolean;
    FBankDate : TDateTime;
    FTurnOversDataSQL : WideString;
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
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function  Get_Icon : OLE_HANDLE;safecall;
  public
    { Public declarations }
    property Modified : Boolean read FModified write FModified default False;
    property BankDate : TDateTime read FBankDate write FBankDate;
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ, FPTurnOversDataModImpl, FPTurnOversReportImpl,
  SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

{ TTurnOvers_Form }

procedure TTurnOvers_Form.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TurnOvers_FormPage); }
end;

procedure TTurnOvers_Form.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITurnOvers_FormEvents;
end;

procedure TTurnOvers_Form.Initialize;
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

function TTurnOvers_Form.Get_Active: WordBool;
begin
  Result := Active;
end;

function TTurnOvers_Form.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TTurnOvers_Form.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TTurnOvers_Form.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTurnOvers_Form.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTurnOvers_Form.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TTurnOvers_Form.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTurnOvers_Form.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTurnOvers_Form.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTurnOvers_Form.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTurnOvers_Form.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TTurnOvers_Form.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTurnOvers_Form.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTurnOvers_Form.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTurnOvers_Form.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTurnOvers_Form.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTurnOvers_Form.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTurnOvers_Form.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTurnOvers_Form._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTurnOvers_Form.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTurnOvers_Form.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTurnOvers_Form.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTurnOvers_Form.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTurnOvers_Form.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTurnOvers_Form.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTurnOvers_Form.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTurnOvers_Form.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTurnOvers_Form.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTurnOvers_Form.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTurnOvers_Form.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTurnOvers_Form.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTurnOvers_Form.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TTurnOvers_Form.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTurnOvers_Form.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTurnOvers_Form.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTurnOvers_Form.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTurnOvers_Form.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TTurnOvers_Form.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TTurnOvers_Form.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTurnOvers_Form.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTurnOvers_Form.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTurnOvers_Form.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTurnOvers_Form.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
function TTurnOvers_Form.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 0;
begin
  ImageList1.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;

procedure TTurnOvers_Form.ActiveFormCreate(Sender: TObject);
begin
  TurnOversDataMod := TTurnOversDataMod.Create(Self);
  TurnOversRpt := TTurnOversRpt.Create(Self);
  with TurnOversDataMod do
  begin
    BranchData.Open;
    CurrencyData.Open;
    SYSDAT.Open;
    BankInfo.Open;
    FTurnOversDataSQL := TurnOversData.SQL.CommaText;
    BankDate := SYSDAT.FieldByName('TEK_DAT').AsDateTime;
    DTPBeginDate.DateTime := BankDate;
    DTPEndDate.DateTime := BankDate;
  end;
  CBCurrency.ItemIndex := 0;
  CBAccountType.ItemIndex := 0;
  CBBranch.ItemIndex := 0;
  Modified := True;

  SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

procedure TTurnOvers_Form.SBExecuteClick(Sender: TObject);

  procedure BuildTurnOverQuery(BranchID ,CurrencyID ,AccPlane : Integer ;AmountType : Boolean;BalanceList : WideString;BalanceListSH:WideString);
  begin
    with TurnOversDataMod.TurnOversData do
    begin
      SQL.CommaText := FTurnOversDataSQL;

      SQL[52] := Format(SQL[52] ,[AccPlane]);
      SQL[55] := Format(SQL[55] ,[AccPlane]);
      SQL[94] := Format(SQL[94] ,[AccPlane]);
      SQL[97] := Format(SQL[97] ,[AccPlane]);
      SQL[114] := Format(SQL[114] ,[AccPlane]);
      SQL[117] := Format(SQL[117] ,[AccPlane]);

      if Trim(BalanceList) <> '' then
        SQL[124] := Format(SQL[124] ,[BalanceList]) else
        SQL[124] := '';

      if CurrencyID <> -1 then
        SQL[125] := Format(SQL[125] ,[CurrencyID]) else
        SQL[125] := '';

      if BranchID <> -1 then
        SQL[126] := Format(SQL[126] ,[BranchID]) else
        SQL[126] := '';

       if Trim(BalanceListSH) <> '' then
        SQL[127] := Format(SQL[127] ,[BalanceListSH]) else
        SQL[127] := '';
        
      LogMemo.Lines := SQL;
    end;
  end;

  function GetPeriodPrefix(ADate : TDateTime) : TDateTime;
  begin
    with TurnOversDataMod.PeriodPrefixData do
    begin
      if Active then CloseAll;
      SetVariable('ADate',ADate);
      Open;
      if FieldByName('PeriodPrefix').IsNull then
      Result := ADate else
      Result := FieldByName('PeriodPrefix').AsDateTime;
    end;

  end;

var
  CurrencyID : Integer;
  BranchID : Integer;
  AccPlane : Integer;
  AmountType : Boolean;
  BeginDate : TDateTime;
  EndDate : TDateTime;
  BeginPeriod : TDateTime;
  BalanceList : WideString;
 editSH, BalanceListSH:WideString;
begin
  with CBCurrency do
  if ItemIndex = 0 then
  CurrencyID := -1 else
  CurrencyID := DataSource.DataSet.FieldByName('CurrencyID').AsInteger;

  with CBBranch do
  if ItemIndex <= 0 then
  BranchID := -1 else
  BranchID := DataSource.DataSet.FieldByName('BranchID').AsInteger;

  with CBAccountType do
  AccPlane := ItemIndex + 1;

  AmountType := (CBCurrency.ItemIndex > 0)
                and (RGAmountType.ItemIndex = 0);
  //true means amount must in Foregn currency

  BalanceList := AccountListEdit.Text;
  editSH:=AccountListEditSH.Text;
  BalanceListSH:=''''+editSH+'%'+'''';
 // ShowMessage (BalanceListSH) sakartvelo ;

  BeginDate := Integer(Trunc(DTPBeginDate.DateTime));
  EndDate := Integer(Trunc(DTPEndDate.DateTime));
  BeginPeriod := GetPeriodPrefix(BeginDate);
  //if Modified then
  with TurnOversDataMod.TurnOversData do
  try
    Screen.Cursor := crSQLWait;
    BuildTurnOverQuery(BranchID,CurrencyID,AccPlane,AmountType,BalanceList,BalanceListSH);
    if Active then CloseAll;
   // SetVariable('SH',editSH);
    SetVariable('BeginPeriod',BeginPeriod);
    SetVariable('BeginDate',BeginDate);
    SetVariable('EndDate',EndDate);

    Open;
  finally
    Screen.Cursor := crDefault;
  end;

  if RGReportType.ItemIndex = 0 then
  with TurnOversRpt do
  begin
    {Ostat, Pok_Ostat}
     
    lblBranch.Caption := CBBranch.Text;
    lblCurrency.Caption := CBCurrency.Text;
    lblBeginDate.Caption := FormatDateTime('dd/mm/yyyy',DTPBeginDate.DateTime);
    lblEndDate.Caption := FormatDateTime('dd/mm/yyyy',DTPEndDate.DateTime);
    DataSet.Filter := '(LBeginActive <> 0) or (LEndActive <> 0) or (LDTurnOver <> 0) or (LCTurnOver <> 0) or (LBeginPassive <> 0) or (LEndPassive <> 0)';
    DataSet.Filtered := True;

    {Hesen R. 09.07.2007}
    if AmountType = false then begin
     QRDBText6.DataField := 'LBeginActive';
     QRDBText7.DataField := 'LBeginPassive';
     QRDBText8.DataField := 'LDTurnOver';
     QRDBText9.DataField := 'LCTurnOver';
     QRDBText10.DataField := 'LEndActive';
     QRDBText11.DataField := 'LEndPassive';
     QRExpr7.Expression := 'SUM(TurnOversData.LBEGINACTIVE)';
     QRExpr8.Expression := 'SUM(TurnOversData.LBEGINPASSIVE)';
     QRExpr9.Expression := 'SUM(TurnOversData.LDTURNOVER)';
     QRExpr10.Expression := 'SUM(TurnOversData.LCTURNOVER)';
     QRExpr11.Expression := 'SUM(TurnOversData.LENDACTIVE)';
     QRExpr12.Expression := 'SUM(TurnOversData.LENDPASSIVE)';
     QRExpr1.Expression := 'SUM(TurnOversData.LBEGINACTIVE)';
     QRExpr2.Expression := 'SUM(TurnOversData.LBEGINPASSIVE)';
     QRExpr3.Expression := 'SUM(TurnOversData.LDTURNOVER)';
     QRExpr4.Expression := 'SUM(TurnOversData.LCTURNOVER)';
     QRExpr5.Expression := 'SUM(TurnOversData.LENDACTIVE)';
     QRExpr6.Expression := 'SUM(TurnOversData.LENDPASSIVE)';
    end
    else begin
     QRDBText6.DataField := 'BeginActive';
     QRDBText7.DataField := 'BeginPassive';
     QRDBText8.DataField := 'DTurnOver';
     QRDBText9.DataField := 'CTurnOver';
     QRDBText10.DataField := 'EndActive';
     QRDBText11.DataField := 'EndPassive';
     QRExpr7.Expression := 'SUM(TurnOversData.BEGINACTIVE)';
     QRExpr8.Expression := 'SUM(TurnOversData.BEGINPASSIVE)';
     QRExpr9.Expression := 'SUM(TurnOversData.DTURNOVER)';
     QRExpr10.Expression := 'SUM(TurnOversData.CTURNOVER)';
     QRExpr11.Expression := 'SUM(TurnOversData.ENDACTIVE)';
     QRExpr12.Expression := 'SUM(TurnOversData.ENDPASSIVE)';
     QRExpr1.Expression := 'SUM(TurnOversData.BEGINACTIVE)';
     QRExpr2.Expression := 'SUM(TurnOversData.BEGINPASSIVE)';
     QRExpr3.Expression := 'SUM(TurnOversData.DTURNOVER)';
     QRExpr4.Expression := 'SUM(TurnOversData.CTURNOVER)';
     QRExpr5.Expression := 'SUM(TurnOversData.ENDACTIVE)';
     QRExpr6.Expression := 'SUM(TurnOversData.ENDPASSIVE)';
    end;
    {Hesen R.}

    Preview;
    DataSet.Filtered := False;
  end else
  begin
    TurnOversExporter.Connect;
    TurnOversExporter.ExportDataset(TurnOversDataMod.TurnOversData,'TurnOvers',True);
  end;

end;

procedure TTurnOvers_Form.DTPBeginDateChange(Sender: TObject);
begin
  Modified := True;
end;

procedure TTurnOvers_Form.RGAmountTypeClick(Sender: TObject);
begin
  Modified := True;
end;

procedure TTurnOvers_Form.AccountListEditSHClick(Sender: TObject);
begin
AccountListEdit.clear;
end;

procedure TTurnOvers_Form.AccountListEditClick(Sender: TObject);
begin
AccountListEditSH.clear;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTurnOvers_Form,
    Class_TurnOvers_Form,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

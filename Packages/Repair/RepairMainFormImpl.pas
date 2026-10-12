//unit sboapiDataModuleImpl;
unit RepairMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Repair_TLB, StdVcl, ExtCtrls, ComCtrls, StdCtrls,
  Grids, DBGrids, Db, OracleData, Mask, DBCtrls, Oracle, SearchCombo,SBPlgAx50_TLB,
  ImgList;

type
  TRepairMainForm = class(TActiveForm, IRepairMainForm, IIconExporter)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BegDate: TDateTimePicker;
    ButtonRefresh: TButton;
    Panel2: TPanel;
    FiltrPanel: TPanel;
    Splitter1: TSplitter;
    EndDate: TDateTimePicker;
    ButtonNew: TButton;
    LRate_D: TLabel;
    ButtonUpdate: TButton;
    ButtonDelete: TButton;
    LTrDate: TLabel;
    LRate_C: TLabel;
    LD_Currency: TLabel;
    LC_Currency: TLabel;
    LTrRate_D: TLabel;
    LTrRate_C: TLabel;
    PageControl1: TPageControl;
    Filial: TTabSheet;
    SortBy: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    fltFilial_D: TSearchCombo;
    fltFilial_C: TSearchCombo;
    Label3: TLabel;
    cbUser: TSearchCombo;
    Number: TRadioButton;
    DebitNumber: TRadioButton;
    CreditNumber: TRadioButton;
    DebitCurrency: TRadioButton;
    CreditCurrency: TRadioButton;
    DebitAmount: TRadioButton;
    CreditAmount: TRadioButton;
    LAmount: TRadioButton;
    Filtr: TTabSheet;
    ButtonFiltr: TButton;
    ImageList1: TImageList;
    DBEdit1: TDBEdit;
    NationalCurrency: TCheckBox;
    ForeignCurrency: TCheckBox;
    MultyCurrency: TCheckBox;
    RateDifference: TCheckBox;
    ProfitLoss: TCheckBox;
    Hox: TCheckBox;
    Swift: TCheckBox;
    ChProfit: TCheckBox;
    ChRate: TCheckBox;
    Salary: TCheckBox;
    AzCard: TCheckBox;
    Credit: TCheckBox;
    Depozit: TCheckBox;
    grbox: TGroupBox;
    cbFiltr: TComboBox;
    FixedAssets: TCheckBox;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonFiltrClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonNewClick(Sender: TObject);
    procedure ChRateClick(Sender: TObject);
    procedure ChProfitClick(Sender: TObject);
    procedure NationalCurrencyClick(Sender: TObject);
    procedure ForeignCurrencyClick(Sender: TObject);
    procedure MultyCurrencyClick(Sender: TObject);
    procedure RateDifferenceClick(Sender: TObject);
    procedure ProfitLossClick(Sender: TObject);
    procedure HoxClick(Sender: TObject);
    procedure SwiftClick(Sender: TObject);
    procedure SalaryClick(Sender: TObject);
    procedure AzCardClick(Sender: TObject);
    procedure CreditClick(Sender: TObject);
    procedure DepozitClick(Sender: TObject);
    procedure NumberClick(Sender: TObject);
    procedure cbFiltrChange(Sender: TObject);
  private
    { Private declarations }
    FEvents: IRepairMainFormEvents;
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
    function Get_Icon: OLE_HANDLE; safecall;
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
  procedure SetFilter;
  var
    RepairMainForm:TRepairMainForm;
    TrMode: Char;
implementation

uses ComObj, ComServ, repairdatamodule, sboapidatamoduleimpl,
  TransactionUnit, RepUpdateForm_unit;

{$R *.DFM}

{ TRepairMainForm }

procedure TRepairMainForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_RepairMainFormPage); }
end;

procedure TRepairMainForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IRepairMainFormEvents;
end;

procedure TRepairMainForm.Initialize;
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

function TRepairMainForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TRepairMainForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TRepairMainForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TRepairMainForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TRepairMainForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TRepairMainForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TRepairMainForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TRepairMainForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TRepairMainForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TRepairMainForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TRepairMainForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TRepairMainForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TRepairMainForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TRepairMainForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TRepairMainForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TRepairMainForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TRepairMainForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TRepairMainForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TRepairMainForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TRepairMainForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TRepairMainForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TRepairMainForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TRepairMainForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TRepairMainForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TRepairMainForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TRepairMainForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TRepairMainForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TRepairMainForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TRepairMainForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TRepairMainForm.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TRepairMainForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TRepairMainForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TRepairMainForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TRepairMainForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TRepairMainForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TRepairMainForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TRepairMainForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TRepairMainForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TRepairMainForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TRepairMainForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TRepairMainForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TRepairMainForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TRepairMainForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TRepairMainForm.ButtonRefreshClick(Sender: TObject);
var
Str1,Str2,Str3, StrOrder : String;
StrSQl,DBeg, DEnd: string;
//Rate_D, Rate_C: Real;
//c_CurrencyID, d_CurrencyID: integer;
//ArchiveDate: string;
begin
  DBeg:=FormatDateTime('d-mmmm-yy',BegDate.Date);
  DEnd:=FormatDateTime('d-mmmm-yy',EndDate.Date);
Str1:='select p.d$ D, p.c$ C, p.* from v_provarch1 p where ';
Str2:=' dat>='''+dBeg+'''';
Str3:=' and dat<='''+dEnd+'''';
StrOrder:=' order by dat,id' ;



StrSql:=Str1+str2+str3+StrOrder;
with dataMod do
begin
 Transactions.Close;
 Transactions.SQL.Clear;
 Transactions.SQL.Add(StrSql);
 Transactions.Active:= true;
end;
(*
ArchiveDate:=dBeg;
d_CurrencyID:=Transactions.FieldByName('d$').asinteger;
c_CurrencyID:=Transactions.FieldByName('c$').asinteger;


Rate_D:=   P_Repair.CallFloatFunction('GetRate', [
  'CurrencyID', d_CurrencyID,
  'ArchiveDate', ArchiveDate
]);
Rate_C:=   P_Repair.CallFloatFunction('GetRate', [
  'CurrencyID', c_CurrencyID,
  'ArchiveDate', ArchiveDate
]);

label1.Caption:=FloatToStr(Rate_D);
label2.Caption:=FloatToStr(Rate_C);
*)
end;


procedure TRepairMainForm.ActiveFormCreate(Sender: TObject);
begin
  RepairMainForm:=self;
  DataMod := TDataMod.Create(nil);
  frmTransaction := TfrmTransaction.Create(nil);
with datamod do
begin
 BegDate.DateTime:=BankDay.FieldByName('tek_dat').AsDateTime;
 EndDate.DateTime:=BankDay.FieldByName('tek_dat').AsDateTime;
end;
cbUser.ItemIndex:=0;
// label1.Caption:=Transactions.FieldByName('rate_d').asstring;
// label2.Caption:=Transactions.FieldByName('rate_c').asstring;
end;

procedure TRepairMainForm.ButtonUpdateClick(Sender: TObject);
begin
TrMode:='U';
with frmTransaction do
begin
 with datamod do
 begin
  TransactionDateEdit.DateTime:=Transactions.FieldByName('dat').asdatetime;

  DebitCurrencyIDEdit.Text:=Transactions.FieldByName('D$').asString;
  CreditCurrencyIDEdit.Text:=Transactions.FieldByName('C$').asString;
//showmessage(Transactions.FieldByName('D$').asString);
  DebitCurrencyCB.KeyValue:=Transactions.FieldByName('D$').asInteger;
  CreditCurrencyCB.KeyValue:=Transactions.FieldByName('C$').asInteger;

  DebitRateEdit.Text:=Transactions.FieldByName('Rate_D').asString;
  CreditRateEdit.Text:=Transactions.FieldByName('Rate_C').asString;

  DebitAccount.Locate('AccountNumber',Transactions.FieldByName('DebitNumber').asstring,[]);
  DebitAccNoCB.itemindex:=DebitAccount.RecNo-1;
  DebitAccNoCBChange(DebitAccNoCB);

  CreditAccount.Locate('accountNumber',Transactions.FieldByName('CreditNumber').asstring,[]);
  CreditAccNoCB.itemindex:=CreditAccount.RecNo-1;
  CreditAccNoCBChange(CreditAccNoCB);

  DebitAmountEdit.Text:=Transactions.FieldByName('Amount_d').AsString;
  CreditAmountEdit.Text:=Transactions.FieldByName('Amount_c').AsString;
  LAmountEdit.Text:=Transactions.FieldByName('LAmount').AsString;

  InBalanceCharEdit.Text:=Transactions.FieldByName('Kassa_B').AsString;
//InBalanceCharCB.KeyValue:=Transactions.FieldByName('Kassa_B').AsInteger;
  OutBalanceCharEdit.Text:=Transactions.FieldByName('Kassa_Z').AsString;
  OutBalanceCharCB.KeyValue:=Transactions.FieldByName('Kassa_Z').AsInteger;
  TrNameEdit.Text:=Transactions.FieldByName('Name').AsString;
end;
 Show;
end;
end;

procedure TRepairMainForm.ButtonFiltrClick(Sender: TObject);
begin
 FiltrPanel.Visible:= not FiltrPanel.Visible;
end;

procedure TRepairMainForm.ButtonDeleteClick(Sender: TObject);
var Result :integer;
begin
with datamod do
begin
//showmessage(Transactions.fieldbyname('id').asstring);
 Result:= p_correct.CallIntegerFunction('Main', [
  'Flag', 0,
  'CorMode', 0,
  'TransactionID'   , Transactions.fieldbyname('id').asstring
]);
end;
If Result=0 then ;
ButtonRefresh.Click;
end;

procedure TRepairMainForm.DBGrid1DblClick(Sender: TObject);
begin
 ButtonUpdate.Click;
end;

function TRepairMainForm.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 0;  // Position Ico in List ImageList1
begin
  ImageList1.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;


procedure TRepairMainForm.ButtonNewClick(Sender: TObject);
begin
TrMode:='N';
with frmTransaction do
 begin
 TransactionDateEdit.DateTime:=RepairMainForm.EndDate.Date;
  SetNull('N');
  show;
 end;
end;

procedure TRepairMainForm.ChRateClick(Sender: TObject);
begin
if ChRate.Checked=false then
 ChProfit.Enabled:=false
 else
 ChProfit.Enabled:=true
end;

procedure TRepairMainForm.ChProfitClick(Sender: TObject);
begin
if ChProfit.Checked=true then
 ChRate.Checked:=true
end;

procedure TRepairMainForm.NationalCurrencyClick(Sender: TObject);
begin
 SetFilter;
end;

procedure SetFilter;
var StrFilt, S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,s12: string;
begin
with RepairMainForm do
begin
 if NationalCurrency.Checked=true then S1:='1' else s1:='';
 if ForeignCurrency.Checked=true then S2:='1'  else s2:='';
 if MultyCurrency.Checked=true then S3:='(vid_op=0)' else s3:='';
 if RateDifference.Checked=true then S4:='(vid_op=1)' else s4:='';
 if ProfitLoss.Checked=true then S5:='(vid_op=2)' else s5:='';
 if Credit.Checked=true then S6:='1' else s6:='';
 if Depozit.Checked=true then S7:='1' else s7:='';
 if Hox.Checked=true then  S8:='1' else s8:='';
 if Swift.Checked=true then S9:='1' else s9:='';
 if Salary.Checked=true then S10:='1' else s10:='';
 if AzCard.Checked=true then S11:='1' else s11:='';
 if FixedAssets.Checked=true then S12:='1' else s12:='';
end;
 StrFilt:=S1+S2+S3+S4+S5+S6+S7+S8+S9+S10+S11+S12;
 DataMod.Transactions.Filtered:=true;
 DataMod.Transactions.Filter:=StrFilt;
 DataMod.Transactions.Filtered:=true;

end;


procedure TRepairMainForm.ForeignCurrencyClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.MultyCurrencyClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.RateDifferenceClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.ProfitLossClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.HoxClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.SwiftClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.SalaryClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.AzCardClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.CreditClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.DepozitClick(Sender: TObject);
begin
 SetFilter;
end;

procedure TRepairMainForm.NumberClick(Sender: TObject);
begin
 Setfilter;
end;


procedure TRepairMainForm.cbFiltrChange(Sender: TObject);
var strfiltr: string;
s:string;
begin
(*
1  NationalCurrency
2  ForeignCurrency
3  MultyCurrency
4  RateDifference
5  Profit&Loss
6  Credit
7  Depozit
8  HOX
9  SWIFT
10 Fixed Assets
11 Salary
12 AzCard
*)
//  and (C$=0)
s:=DataMod.Transactions.Fields.Fields[3].FieldName;
//showmessage(s);
Case RepairMainForm.cbFiltr.ItemIndex of
1 :StrFiltr:='(D=0) and (C=0)'     ;
2 :StrFiltr:='(D=C) and (D>0)'     ;
3 :StrFiltr:='(vid_op=0)'          ;
4 :StrFiltr:='(vid_op=1)'          ;
5 :StrFiltr:='(vid_op=2)'          ;
6 :StrFiltr:=''                    ;
7 :StrFiltr:=''                    ;
8 :StrFiltr:=''                    ;
9 :StrFiltr:=''                    ;
10:StrFiltr:=''                    ;
11:StrFiltr:='(vid_op=621)'        ;
12:StrFiltr:=''                    ;
else
  StrFiltr := '';
end;

 DataMod.Transactions.Filtered:=true;
 DataMod.Transactions.Filter:=StrFiltr;
 DataMod.Transactions.Filtered:=true;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TRepairMainForm,
    Class_RepairMainForm,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

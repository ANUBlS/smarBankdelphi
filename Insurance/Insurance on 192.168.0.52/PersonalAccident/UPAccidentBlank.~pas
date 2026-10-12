unit UPAccidentBlank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, PPAccidentBlank_TLB, StdVcl, StdCtrls, DBCtrls, Mask,
  ExtCtrls, ComCtrls, Buttons, Db, OracleData,SBPlgAx50_TLB, Oracle,
  INSWordExporter, PlgModalContainer;

const
     WM_ModalResult = WM_USER+139;
type
  TPAccidentBlank = class(TActiveForm, IPAccidentBlank,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    AccidentPageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    InsLookupComboBox: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    PLUEdit: TDBEdit;
    Label38: TLabel;
    EMEEdit: TDBEdit;
    Label41: TLabel;
    HCEdit: TDBEdit;
    Label43: TLabel;
    HSEdit: TDBEdit;
    Label45: TLabel;
    BrBEdit: TDBEdit;
    Label49: TLabel;
    BuEdit: TDBEdit;
    Label51: TLabel;
    TTDEdit: TDBEdit;
    Label52: TLabel;
    Label37: TLabel;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Label39: TLabel;
    Label46: TLabel;
    Label50: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DateTP1: TDateTimePicker;
    DateTP2: TDateTimePicker;
    Bevel1: TBevel;
    memRisk: TMemo;
    btRisksAdd: TBitBtn;
    cbRisks: TCheckBox;
    DBLookupComboBoxRisk: TDBLookupComboBox;
    ODSPAccidentSource: TDataSource;
    ODSCustomersSource: TDataSource;
    ODSPAccident: TOracleDataSet;
    ODSCustomers: TOracleDataSet;
    ODSPAccidentID: TFloatField;
    ODSPAccidentKLI_ID: TFloatField;
    ODSPAccidentCONTACT_PERSON: TStringField;
    ODSPAccidentBANKING_DETAILS: TStringField;
    ODSPAccidentTOTALEMP_NUMBER: TFloatField;
    ODSPAccidentAOG: TFloatField;
    ODSPAccidentAOP: TFloatField;
    ODSPAccidentSMG: TFloatField;
    ODSPAccidentSMP: TFloatField;
    ODSPAccidentBCG: TFloatField;
    ODSPAccidentBCP: TFloatField;
    ODSPAccidentDECIRED_AMOUNT: TFloatField;
    ODSPAccidentPD: TFloatField;
    ODSPAccidentPLU: TFloatField;
    ODSPAccidentEME: TFloatField;
    ODSPAccidentHC: TFloatField;
    ODSPAccidentHS: TFloatField;
    ODSPAccidentBRB: TFloatField;
    ODSPAccidentBURN: TFloatField;
    ODSPAccidentTTD: TFloatField;
    ODSPAccidentNOT_COVEREDPERIOD: TStringField;
    ODSPAccidentOUTSIDEOFAZE: TStringField;
    ODSPAccidentRENEWAL: TStringField;
    ODSPAccidentTRAVELS: TStringField;
    ODSPAccidentTYPEID: TIntegerField;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label55: TLabel;
    PDEdit: TDBEdit;
    Label56: TLabel;
    ODSPAccidentRISKID: TFloatField;
    Panel4: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit27: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Panel5: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    Report: TBitBtn;
    Suggest: TBitBtn;
    btApply: TBitBtn;
    PINS_PACCIDENT: TOraclePackage;
    ODSPAccidentNOT_COVEREPERIOD1: TStringField;
    ADEdit: TDBEdit;
    ODSPAccidentAD: TFloatField;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSCustomersADDRESS: TStringField;
    ODSCustomersMOBILEPHONE: TStringField;
    ODSCustomersFAX: TStringField;
    RisksData: TDataSource;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    ODSRiskType: TOracleDataSet;
    ODSRiskTypeID: TFloatField;
    ODSRiskTypeNAME: TStringField;
    RiskTypeData: TDataSource;
    AOGEdit: TDBEdit;
    AOPEdit: TDBEdit;
    SMGEdit: TDBEdit;
    BCGEdit: TDBEdit;
    SMPEdit: TDBEdit;
    DeciredEdit: TDBEdit;
    DBEdit1: TDBEdit;
    ODSPAccidentMAXWEEKS: TIntegerField;
    ODSPAccidentR: TOracleDataSet;
    ODSPAccidentRNAME: TStringField;
    ODSPAccidentRADDRESS: TStringField;
    ODSPAccidentRPHONE: TStringField;
    ODSPAccidentRFAX: TStringField;
    ODSPAccidentRCONTACT_PERSON: TStringField;
    ODSPAccidentRBANKING_DETAILS: TStringField;
    ODSPAccidentRTOTALEMP_NUMBER: TFloatField;
    ODSPAccidentRAOG: TFloatField;
    ODSPAccidentRAOP: TFloatField;
    ODSPAccidentRSMG: TFloatField;
    ODSPAccidentRSMP: TFloatField;
    ODSPAccidentRBCG: TFloatField;
    ODSPAccidentRBCP: TFloatField;
    ODSPAccidentRDECIRED_AMOUNT: TFloatField;
    ODSPAccidentRAD: TFloatField;
    ODSPAccidentRPD: TFloatField;
    ODSPAccidentRPLU: TFloatField;
    ODSPAccidentREME: TFloatField;
    ODSPAccidentRHC: TFloatField;
    ODSPAccidentRHS: TFloatField;
    ODSPAccidentRBRB: TFloatField;
    ODSPAccidentRBURN: TFloatField;
    ODSPAccidentRTTD: TFloatField;
    ODSPAccidentRNOT_COVEREDPERIOD: TStringField;
    ODSPAccidentROUTSIDEOFAZE: TStringField;
    ODSPAccidentRRENEWAL: TStringField;
    ODSPAccidentRTRAVELS: TStringField;
    ODSPAccidentRTYPEID: TIntegerField;
    ODSPAccidentRRISKID: TFloatField;
    ODSPAccidentRNOT_COVEREPERIOD1: TStringField;
    ODSPAccidentRMAXWEEKS: TIntegerField;
    AccidentReportSource: TDataSource;
    AccidentExporter: TINSWordExporter;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    BeneficiarySource: TDataSource;
    DBLookupComboBox5: TDBLookupComboBox;
    ODSPAccidentPROFITID: TFloatField;
    Label8: TLabel;
    Label47: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    lbBeginDate: TLabel;
    edBeginDate: TDateTimePicker;
    lbEndDate: TLabel;
    edEndDate: TDateTimePicker;
    OPCOMMON: TOraclePackage;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
    ODSContractsBLANK_ID: TFloatField;
    ODSContractsSUGG_ID: TFloatField;
    ODSContractsPOLICY_ID: TFloatField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSContractsVALUTE_ID: TFloatField;
    ODSContractsAMMOUNT: TFloatField;
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSContractsPOLICY_NUM: TStringField;
    DSContracts: TDataSource;
    SuggestContainer: TPlgModalContainer;
    ODSPAccSuggest: TOracleDataSet;
    ODSPAccSuggestID: TFloatField;
    ODSPAccSuggestPAID: TFloatField;
    ODSPAccSuggestCNDT_ID: TFloatField;
    ODSPAccSuggestINSURANCESUM: TFloatField;
    ODSPAccSuggestINSURANCETIME: TDateTimeField;
    ODSPAccSuggestMEDICALCOST: TFloatField;
    ODSPAccSuggestALL_INSAMMOUNT: TFloatField;
    ODSPAccSuggestGEO: TStringField;
    PAccSugestSource: TDataSource;
    ODSPAccidentAGENTID: TFloatField;
    Label42: TLabel;
    AgentLookupComboBox: TDBLookupComboBox;
    AgentSource: TDataSource;
    ODSAgent: TOracleDataSet;
    ODSAgentID: TFloatField;
    ODSAgentNAME: TStringField;
    MonthEdit: TEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure btRisksAddClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure AccidentPageControlChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure CommitClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure ODSPAccidentNewRecord(DataSet: TDataSet);
    procedure edBeginDateChange(Sender: TObject);
    procedure SuggestClick(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    //resultID:integer;
    FParams: TStrings;
    FOwnerHandle : Integer;
    FEvents: IPAccidentBlankEvents;
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
    procedure Initialize; override;
    //procedure BuildAccidentInfo(PAccidentInfo:TPAccidentInfo);
    function SaveData():boolean;
    procedure LoadData;
    procedure MonthPeriod;
  end;

var
    PAccidentBlank:TPAccidentBlank;
implementation

uses ComObj,sboapiDataModuleImpl,ComServ, UPAccidentRisks;

{$R *.DFM}

{ TPAccidentBlank }

procedure TPAccidentBlank.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_PAccidentBlankPage); }
end;

procedure TPAccidentBlank.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPAccidentBlankEvents;
end;

procedure TPAccidentBlank.Initialize;
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

function TPAccidentBlank.Get_Active: WordBool;
begin
  Result := Active;
end;

function TPAccidentBlank.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TPAccidentBlank.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TPAccidentBlank.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TPAccidentBlank.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TPAccidentBlank.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TPAccidentBlank.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TPAccidentBlank.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TPAccidentBlank.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TPAccidentBlank.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TPAccidentBlank.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TPAccidentBlank.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TPAccidentBlank.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TPAccidentBlank.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TPAccidentBlank.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TPAccidentBlank.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TPAccidentBlank.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TPAccidentBlank.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TPAccidentBlank._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPAccidentBlank.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TPAccidentBlank.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPAccidentBlank.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TPAccidentBlank.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPAccidentBlank.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TPAccidentBlank.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TPAccidentBlank.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TPAccidentBlank.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TPAccidentBlank.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TPAccidentBlank.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TPAccidentBlank.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TPAccidentBlank.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TPAccidentBlank.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TPAccidentBlank.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TPAccidentBlank.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TPAccidentBlank.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TPAccidentBlank.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TPAccidentBlank.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPAccidentBlank.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TPAccidentBlank.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TPAccidentBlank.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TPAccidentBlank.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TPAccidentBlank.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TPAccidentBlank.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TPAccidentBlank.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TPAccidentBlank.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TPAccidentBlank.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TPAccidentBlank.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TPAccidentBlank.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TPAccidentBlank.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TPAccidentBlank.UIObjectActivate: HResult;
begin
       if Get_Params('Mod') = 'Insert' then
       begin
           if not ODSPAccident.Active then
           ODSPAccident.Open;
           ODSPAccident.Insert;
           edBeginDate.DateTime := Now;
           edEndDate.DateTime := Now;
           InsLookupComboBox.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
           MonthPeriod;
       end;
       if Get_Params('Mod')='Edit' then
       begin
          Suggest.Enabled:=true;
          Report.Enabled:=true;
          ODSPAccident.Close;
          ODSPAccident.SetVariable('id',StrToInt(Get_Params('ID')));
          ODSPAccident.Open;

          ODSContracts.Close;
          ODSContracts.SetVariable('blankid',ODSPAccidentID.value);
          ODSContracts.Open;
          edBeginDate.DateTime :=ODSContractsbegin_date.AsDateTime;
          edEndDate.DateTime :=ODSContractsEnd_date.AsDateTime;
          LoadData;
          MonthPeriod;
          ODSPAccident.Edit;
       end;
       Result := S_OK;
end;

function TPAccidentBlank.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TPAccidentBlank.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TPAccidentBlank.SaveState: HResult;
begin
  Result := S_OK;
end;

function TPAccidentBlank.Get_Height : Integer;
begin
  Result := Height;
end;

function TPAccidentBlank.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TPAccidentBlank.ActiveFormCreate(Sender: TObject);
begin
    PAccidentBlank:=Self;
    FParams := TStringList.Create;
    Back.Enabled:=false;

end;

procedure TPAccidentBlank.btRisksAddClick(Sender: TObject);
begin
    ODSRisktype.Open;
    with TfmRiskTypes.Create(Self) do
    ShowModal;
    if memRisk.Text <> '' then
    cbRisks.State := cbChecked;
    ODSRisktype.Close;
end;

procedure TPAccidentBlank.BackClick(Sender: TObject);
begin
      with AccidentPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
          Next.Enabled:=true;
     end;
end;

procedure TPAccidentBlank.NextClick(Sender: TObject);
begin
      AccidentPageControl.ActivePageIndex:= AccidentPageControl.ActivePageIndex+1;
      if  AccidentPageControl.ActivePageIndex= AccidentPageControl.PageCount-1 then
      Next.Enabled:=false;
      Back.Enabled:=true;
end;

procedure TPAccidentBlank.AccidentPageControlChange(Sender: TObject);
begin
      with AccidentPageControl do
      begin
          if ActivePageIndex<>PageCount-1 then Next.Enabled:=true else Next.Enabled:=false;
          if ActivepageIndex<>0 then Back.Enabled:=true else Back.Enabled:=false;
      end;
end;

procedure TPAccidentBlank.BitBtn2Click(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TPAccidentBlank.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
      if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
     end;
end;



function TPAccidentBlank.SaveData: boolean;
begin
  Result:=false;

  if cbRisks.State = cbChecked then
  with Risks do
  begin
       Insert;
       FieldByName('name').asString := memRisk.Text;
       Post;
       RefreshRecord;
  end;

  if ODSPAccident.State in [dsInsert] then
  begin
       ODSPAccidentKLI_ID.Value:=InsLookupComboBox.KeyValue;
       OPCommon.CallIntegerFunction('newinsurance',[3,ODSPAccidentID.Value,edBeginDate.DateTime,edEndDate.DateTime,ODSPAccidentKLI_ID.Value]);
  end;

  if ODSPAccident.State in [dsEdit] then
  begin
       OPCommon.CallBooleanFunction('setblankdata',[3,ODSPAccidentID.Value,edBeginDate.DateTime,edEndDate.DateTime,ODSPAccidentKLI_ID.Value]);
 end;

  if ODSPAccident.State in [dsInsert,dsEdit] then
  begin
      ODSPAccident.FieldByName('NOT_COVEREDPERIOD').AsDateTime:=DateTP1.DateTime;
      ODSPAccident.FieldByName('NOT_COVEREPERIOD1').AsDateTime:=DateTP2.DateTime;
      ODSPAccident.Post;
      ODSPAccident.RefreshRecord;
  end;
  Result:=true;
end;

procedure TPAccidentBlank.CommitClick(Sender: TObject);
begin
    if SaveData then  PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
    AccidentPageControl.ActivePageIndex:=0;
end;

procedure TPAccidentBlank.LoadData;
begin
     with ODSPAccident do
     begin
          DateTP1.DateTime:=FieldByName('NOT_COVEREDPERIOD').AsDateTime;
          DateTP2.DateTime:=FieldByName('NOT_COVEREPERIOD1').AsDateTime;
     end;
end;

procedure TPAccidentBlank.btApplyClick(Sender: TObject);
begin
     if SaveData() then
     begin
        Report.Enabled:=true;
        Suggest.Enabled:=true;
        btApply.Enabled:=false;
     end;
end;

procedure TPAccidentBlank.ReportClick(Sender: TObject);
var
    idr:double;
begin
    idr:=ODSPAccidentID.Value;
    ODSPAccidentR.CloseAll;
    ODSPAccidentR.SetVariable('id',idr);
    ODSPAccidentR.Open;
    try
       with AccidentExporter do
       begin
            FileName:=ExtractFilePath(Application.ExeName)+ '\GPAccidentAppl.doc';
            Open(False);
            Risks.Locate('id',ODSPAccidentRRiskid.Value,[]);
            if ODSPAccidentRRiskid.Value<>0 then
               SetBookmark('RISKS',RISKSNAME.Value, false, false, False, false, 8, 'Arial AzLat', False);

            SetBookmark('Insured',ODSPAccidentRName.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Address',ODSPAccidentRAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('ITel',ODSPAccidentRPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('fax',ODSPAccidentRfax.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('CPerson',ODSPAccidentRContact_person.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('CPerson1',ODSPAccidentRContact_person.value, false, false, False, false, 8, 'Arial AzLat', False);
            
            SetBookmark('Banking',ODSPAccidentRBanking_details.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Beneficiary',ODSBeneficiaryName.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BAddress',ODSBeneficiaryAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BTel',ODSBeneficiaryPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BBanking',ODSBeneficiaryBanking_Details.value, false, false, False, false, 8, 'Arial AzLat', False);
            //SetBookmark('RPeriod',ODSPAccidentRReqins_period.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Empnum',FloatToStr(ODSPAccidentRTotalemp_number.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('AOG',FloatToStr(ODSPAccidentRAOG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('AOP',FloatToStr(ODSPAccidentRAOP.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('SMG',FloatToStr(ODSPAccidentRSMG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('SMP',FloatToStr(ODSPAccidentRSMP.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BCG',FloatToStr(ODSPAccidentRBCG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BCP',FloatToStr(ODSPAccidentRBCP.value), false, false, False, false, 8, 'Arial AzLat', False);
            if not ODSPAccidentRDecired_amount.IsNull then
            begin
               SetBookmark('ISMultiple','Áÿëè', false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('ISMultiplesum',FloatToStr(ODSPAccidentRDecired_amount.value), false, false, False, false, 8, 'Arial AzLat', False);
            end
            else
               SetBookmark('ISMultiple','Õåéð', false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('EME',FloatToStr(ODSPAccidentREME.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('HC',FloatToStr(ODSPAccidentRHC.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('HS',FloatToStr(ODSPAccidentRHS.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BRB',FloatToStr(ODSPAccidentRBRB.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BURN',FloatToStr(ODSPAccidentRBURN.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('TTD',FloatToStr(ODSPAccidentRTTD.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('WEEKS',FloatToStr(ODSPAccidentMAXWEEKS.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('NOTCOVERED',ODSPAccidentRNOT_COVEREDPERIOD.value+'  -  '+ODSPAccidentRNOT_COVEREPERIOD1.value, false, false, False, false, 8, 'Arial AzLat', False);

            //SetBookmark('RISKS',RISKSNAME.Value, false, false, False, false, 8, 'Arial AzLat', False);
            IF (ODSPAccidentROUTSIDEOFAZE.Value='Õåéð') or (ODSPAccidentROUTSIDEOFAZE.Value='Áÿëè') then
               SetBookmark('OUTOFAZE',ODSPAccidentROUTSIDEOFAZE.Value, false, false, False, false, 8, 'Arial AzLat', False);
            IF (ODSPAccidentROUTSIDEOFAZE.Value<>'Õåéð') and (ODSPAccidentROUTSIDEOFAZE.Value<>'Áÿëè') then
            begin
                SetBookmark('OUTOFAZE1',ODSPAccidentROUTSIDEOFAZE.Value, false, false, False, false, 8, 'Arial AzLat', False);
                SetBookmark('OUTOFAZE','Áÿëè', false, false, False, false, 8, 'Arial AzLat', False);
            end;
            SetBookmark('RENEWAL',ODSPAccidentRRENEWAL.Value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('TRAVELS',ODSPAccidentRTRAVELS.Value, false, false, False, false, 8, 'Arial AzLat', False);
       end
    finally
       AccidentExporter.Show;
    end;

end;

procedure TPAccidentBlank.DBEdit4Change(Sender: TObject);
begin
     btApply.Enabled:=true;
end;

procedure TPAccidentBlank.ODSPAccidentNewRecord(DataSet: TDataSet);
begin
     DataSet.FieldByName('ID').AsInteger:=PINS_Paccident.CallIntegerFunction('generateID',[]);
end;

procedure TPAccidentBlank.edBeginDateChange(Sender: TObject);
begin
     MonthPeriod;
     ODSPAccident.Edit;
     btApply.Enabled:=true;
end;

procedure TPAccidentBlank.SuggestClick(Sender: TObject);
var
   p : TStringList;
begin
   p:= TStringList.Create;
   p.Values['MK_ID'] := FloatToStr(ODSPAccidentId.value);
   p.Values['PAID'] := FloatToStr(ODSPAccSuggestPAID.value);
   p.Values['KLI_ID'] := IntToStr(ODSCustomersID.Value);
   ODSPaccSuggest.Close;
   ODSPaccSuggest.SetVariable('paid',ODSPAccidentId.value);
   ODSPaccSuggest.Open;
   if ODSPAccSuggest.RecordCount<1 then
       p.Values['Mod']:='Insert'
   else
      p.Values['Mod']:='Edit';
   with SuggestContainer do begin
     ShowModal(StringToGuid('{F64B6260-CAB7-4D0A-9149-CF1A4639CD5C}'),p );
   end;
   p.Free;

end;

procedure TPAccidentBlank.MonthPeriod;
begin
     MonthEdit.Text:=IntToStr(trunc((edEndDate.DateTime - edBeginDate.DateTime)/30))+' ay';
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TPAccidentBlank,
    Class_PAccidentBlank,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

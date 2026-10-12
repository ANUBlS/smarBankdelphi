unit UConstraction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PConstractiondpr_TLB, StdVcl, ComCtrls, StdCtrls, DBCtrls, Mask,SBPlgAx50_TLB,
  Buttons, ExtCtrls, Db, OracleData, Oracle, PlgModalContainer,
  INSWordExporter;

const
     WM_ModalResult = WM_USER+139;

type
   TConstructionInfo=record
     id:longint;
     kli_id :longint;
     req_period:string;
     profitname :string;
     profitaddress:string;
     profit_phone : string;
     profit_bankingdetails:string;
     fulldescription:string;
     locationobj:string;
     yearsinbusiness:string;
     contactperson: string;
     contactperson_tel :string;
     buildingusage : string;
     floorsnum :integer;
     wallsm  :string;
     ceilingsm:string;
     roofm:string;
     area :real;
     applicantspace:real;
     earthquakedetails:string;
     flamable:string;
     surroindingdetails:string;
     situeted:string;
     guard:string;
     alarm :string;
     locks :string;
     securitylocks:string;
     bars:string;
     other:string;
     settings:string;
     repair:string;
     heated:string;
     annual:real;
     wages:real;
     rent:real;
     employes:integer;
     losshistory:string;
     renewal: string;
     thirdparty:string;
     otherinf :string;
     indeminity:string;
     valuetype :string;
     buildings :real;
     engineer:real;
     exdeco:real;
     indeco:real;
     firesys:real
   end;

type
  TConstraction = class(TActiveForm, IConstraction,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    ConstructionPageControl: TPageControl;
    SECTION1: TTabSheet;
    DatailsGroupBox: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FulDescrip: TDBEdit;
    Location: TDBEdit;
    YearsInBus: TDBEdit;
    SECTION23: TTabSheet;
    SecurityGroupBox: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    ESpecify: TDBEdit;
    EHeat: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    DBComboBox9: TDBComboBox;
    DBMemo1: TDBMemo;
    SECTION4: TTabSheet;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    SECTION5: TTabSheet;
    CoverGroupBox: TGroupBox;
    LossOfProfitGroupBox: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ERent: TDBEdit;
    EAnnual: TDBEdit;
    EWages: TDBEdit;
    EEmploy: TDBEdit;
    EIndeminity: TDBEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    ConstYearDateTimePicker: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    DBComboBox1: TDBComboBox;
    Panel1: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    Report: TBitBtn;
    Suggest: TBitBtn;
    InsLookupComboBox: TDBLookupComboBox;
    ConstructionData: TDataSource;
    CustomersData: TDataSource;
    RiskTypeData: TDataSource;
    Label17: TLabel;
    DBLookupComboBoxRisk: TDBLookupComboBox;
    btRisksAdd: TBitBtn;
    memRisk: TMemo;
    cbRisks: TCheckBox;
    ODSRiskType: TOracleDataSet;
    ODSRiskTypeID: TFloatField;
    ODSRiskTypeNAME: TStringField;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    RisksData: TDataSource;
    PINS_CONSTRUCTION: TOraclePackage;
    ODSConstruction: TOracleDataSet;
    ODSCustomers: TOracleDataSet;
    DBComboBox5: TDBComboBox;
    ODSConstructionID: TFloatField;
    ODSConstructionKLI_ID: TFloatField;
    ODSConstructionFULLDESCRIPTION: TStringField;
    ODSConstructionLOCATIONOBJ: TStringField;
    ODSConstructionYEARSINBUSINESS: TStringField;
    ODSConstructionBUILDINGUSAGE: TStringField;
    ODSConstructionCONSTYEAR: TDateTimeField;
    ODSConstructionFLOORSNUM: TIntegerField;
    ODSConstructionWALLSM: TStringField;
    ODSConstructionCEILINGSM: TStringField;
    ODSConstructionROOFM: TStringField;
    ODSConstructionAREA: TFloatField;
    ODSConstructionAPPLICANTSPACE: TFloatField;
    ODSConstructionEARTHQUAKEDETAILS: TStringField;
    ODSConstructionFLAMABLE: TStringField;
    ODSConstructionSURROINDINGDETAILS: TStringField;
    ODSConstructionSITUETED: TStringField;
    ODSConstructionGUARD: TStringField;
    ODSConstructionALARM: TStringField;
    ODSConstructionLOCKS: TStringField;
    ODSConstructionSECURITYLOCKS: TStringField;
    ODSConstructionBARS: TStringField;
    ODSConstructionOTHER: TStringField;
    ODSConstructionSETTINGS: TStringField;
    ODSConstructionREPAIR: TStringField;
    ODSConstructionHEATED: TStringField;
    ODSConstructionRISKID: TFloatField;
    ODSConstructionANNUAL: TFloatField;
    ODSConstructionWAGES: TFloatField;
    ODSConstructionRENT: TFloatField;
    ODSConstructionEMPLOYES: TFloatField;
    ODSConstructionEXPIRITY: TDateTimeField;
    ODSConstructionLOSSHISTORY: TStringField;
    ODSConstructionRENEWAL: TStringField;
    ODSConstructionTHIRDPARTY: TStringField;
    ODSConstructionOTHERINF: TStringField;
    ODSConstructionINDEMINITY: TStringField;
    ODSConstructionVALUETYPE: TStringField;
    ODSConstructionBUILDINGS: TFloatField;
    ODSConstructionENGINEER: TFloatField;
    ODSConstructionEXDECO: TFloatField;
    ODSConstructionINDECO: TFloatField;
    ODSConstructionFIRESYS: TFloatField;
    ODSConstructionTYPEID: TIntegerField;
    PlgSuggest: TPlgModalContainer;
    ODSConstructionR: TOracleDataSet;
    PINS_FULLMOTOR: TOraclePackage;
    DataSource1: TDataSource;
    ODSConstructionRNAME: TStringField;
    ODSConstructionRADDRESS: TStringField;
    ODSConstructionRPHONE: TStringField;
    ODSConstructionRFAX: TStringField;
    ODSConstructionRID: TFloatField;
    ODSConstructionRKLI_ID: TFloatField;
    ODSConstructionRFULLDESCRIPTION: TStringField;
    ODSConstructionRLOCATIONOBJ: TStringField;
    ODSConstructionRYEARSINBUSINESS: TStringField;
    ODSConstructionRBUILDINGUSAGE: TStringField;
    ODSConstructionRCONSTYEAR: TDateTimeField;
    ODSConstructionRFLOORSNUM: TIntegerField;
    ODSConstructionRWALLSM: TStringField;
    ODSConstructionRCEILINGSM: TStringField;
    ODSConstructionRROOFM: TStringField;
    ODSConstructionRAREA: TFloatField;
    ODSConstructionRAPPLICANTSPACE: TFloatField;
    ODSConstructionREARTHQUAKEDETAILS: TStringField;
    ODSConstructionRFLAMABLE: TStringField;
    ODSConstructionRSURROINDINGDETAILS: TStringField;
    ODSConstructionRSITUETED: TStringField;
    ODSConstructionRGUARD: TStringField;
    ODSConstructionRALARM: TStringField;
    ODSConstructionRLOCKS: TStringField;
    ODSConstructionRSECURITYLOCKS: TStringField;
    ODSConstructionRBARS: TStringField;
    ODSConstructionROTHER: TStringField;
    ODSConstructionRSETTINGS: TStringField;
    ODSConstructionRREPAIR: TStringField;
    ODSConstructionRHEATED: TStringField;
    ODSConstructionRRISKID: TFloatField;
    ODSConstructionRANNUAL: TFloatField;
    ODSConstructionRWAGES: TFloatField;
    ODSConstructionRRENT: TFloatField;
    ODSConstructionREMPLOYES: TFloatField;
    ODSConstructionREXPIRITY: TDateTimeField;
    ODSConstructionRLOSSHISTORY: TStringField;
    ODSConstructionRRENEWAL: TStringField;
    ODSConstructionRTHIRDPARTY: TStringField;
    ODSConstructionROTHERINF: TStringField;
    ODSConstructionRINDEMINITY: TStringField;
    ODSConstructionRVALUETYPE: TStringField;
    ODSConstructionRBUILDINGS: TFloatField;
    ODSConstructionRENGINEER: TFloatField;
    ODSConstructionREXDECO: TFloatField;
    ODSConstructionRINDECO: TFloatField;
    ODSConstructionRFIRESYS: TFloatField;
    ODSConstructionRTYPEID: TIntegerField;
    ConstructionExporter: TINSWordExporter;
    btApply: TBitBtn;
    DBLookupComboBox5: TDBLookupComboBox;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSConstructionPROFITID: TFloatField;
    ODSConstructionRPROFITID: TFloatField;
    Label6: TLabel;
    ExpirityDateTimePicker: TDateTimePicker;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label2: TLabel;
    DBComboBox12: TDBComboBox;
    Label3: TLabel;
    DBComboBox13: TDBComboBox;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    Label16: TLabel;
    edBeginDate: TDateTimePicker;
    lbBeginDate: TLabel;
    edEndDate: TDateTimePicker;
    lbEndDate: TLabel;
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
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSCustomersADDRESS: TStringField;
    ODSCustomersMOBILEPHONE: TStringField;
    ODSCustomersFAX: TStringField;
    ODSCustomersCONTACTPERSON: TStringField;
    ODSCustomersCONTACTPERSONPHONE: TStringField;
    MonthEdit: TEdit;
    Shape1: TShape;
    procedure ActiveFormCreate(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure ConstructionPageControlChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure InsLookupComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure btRisksAddClick(Sender: TObject);
    procedure CommitClick(Sender: TObject);
    procedure ODSConstructionNewRecord(DataSet: TDataSet);
    procedure SuggestClick(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure PeriodOinsChange(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
  private
    { Private declarations }
    id : Integer;            //???????
    FParams: TStrings;
    FOwnerHandle : Integer;

    FEvents: IConstractionEvents;
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
    procedure MonthPeriod;
    
  public
    { Public declarations }
    resultID :integer;
    resultB:boolean;
    procedure Initialize; override;
    function SaveData:boolean;
    procedure LoadData;
  end;

var
    Constraction:TConstraction;

implementation

uses ComObj, ComServ,sboapiDataModuleImpl, URiskTypes;

{$R *.DFM}

{ TConstraction }

procedure TConstraction.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ConstractionPage); }
end;

procedure TConstraction.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IConstractionEvents;
end;

procedure TConstraction.Initialize;
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

function TConstraction.Get_Active: WordBool;
begin
  Result := Active;
end;

function TConstraction.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TConstraction.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TConstraction.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TConstraction.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TConstraction.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TConstraction.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TConstraction.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TConstraction.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TConstraction.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TConstraction.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TConstraction.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TConstraction.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TConstraction.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TConstraction.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TConstraction.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TConstraction.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TConstraction.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TConstraction._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TConstraction.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TConstraction.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TConstraction.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TConstraction.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TConstraction.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TConstraction.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TConstraction.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TConstraction.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TConstraction.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TConstraction.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TConstraction.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TConstraction.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TConstraction.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TConstraction.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TConstraction.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TConstraction.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TConstraction.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TConstraction.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TConstraction.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TConstraction.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TConstraction.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TConstraction.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TConstraction.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TConstraction.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;



function  TConstraction.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TConstraction.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TConstraction.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TConstraction.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TConstraction.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TConstraction.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TConstraction.UIObjectActivate: HResult;
begin
       if  Get_Params('Mod') = 'Insert' then
       begin
           ODSConstruction.Open;
           ODSConstruction.Insert;
           edBeginDate.DateTime := Now;
           edEndDate.DateTime := Now;
           InsLookupComboBox.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
           MonthPeriod
       end;
       if Get_Params('Mod')='Edit' then
       begin
          Suggest.Enabled:=true;
          Report.Enabled:=true;
          ODSConstruction.CloseAll;
          id:=StrToInt(Get_Params('ID'));
          ODSConstruction.SetVariable('ID',id);
          ODSConstruction.Open;
          ODSContracts.Close;
          ODSContracts.SetVariable('blankid',ODSConstructionID.value);
          ODSContracts.Open;
          edBeginDate.DateTime :=ODSContractsbegin_date.AsDateTime;
          edEndDate.DateTime :=ODSContractsEnd_date.AsDateTime;
          LoadData;
          MonthPeriod;
          ODSConstruction.Edit;
       end;
       Result := S_OK;
end;

function TConstraction.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TConstraction.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TConstraction.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TConstraction.Get_Height : Integer;
begin
  Result := Height;
end;

function  TConstraction.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TConstraction.ActiveFormCreate(Sender: TObject);
begin
     Constraction:=Self;
     FParams := TStringList.Create;
     //LoadData;
     Back.Enabled:=false;
end;

procedure TConstraction.BackClick(Sender: TObject);
begin
     with ConstructionPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;
end;

procedure TConstraction.NextClick(Sender: TObject);
begin
      ConstructionPageControl.ActivePageIndex:= ConstructionPageControl.ActivePageIndex+1;
      if ConstructionPageControl.ActivePageIndex=ConstructionPageControl.PageCount-1 then
      Next.Enabled:=false;
      Back.Enabled:=true;
end;

procedure TConstraction.ConstructionPageControlChange(Sender: TObject);
begin
      with ConstructionPageControl do
      begin
          if ActivePageIndex<>PageCount-1 then Next.Enabled:=true else Next.Enabled:=false;
          if ActivepageIndex<>0 then Back.Enabled:=true else Back.Enabled:=false;
      end;
end;

procedure TConstraction.BitBtn2Click(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TConstraction.InsLookupComboBoxKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TConstraction.btRisksAddClick(Sender: TObject);
begin
    ODSRisktype.Open;
    with TfmRiskTypes.Create(Self) do
    ShowModal;
    if memRisk.Text <> '' then
    cbRisks.State := cbChecked;
    ODSRisktype.Close;
end;

function TConstraction.SaveData: boolean;
var
    nid:double;
begin
      Result:=false;

       if ODSConstruction.State in [dsInsert] then
       begin
          ODSConstructionKli_ID.Value:= InsLookupComboBox.KeyValue;
          OPCommon.CallIntegerFunction('newinsurance',[10,ODSConstructionID.Value,edBeginDate.DateTime,edEndDate.DateTime,ODSConstructionKLI_ID.Value]);
       end;

       if ODSConstruction.State in [dsEdit] then
       begin
          OPCommon.CallBooleanFunction('setblankdata',[10,ODSConstructionID.Value,edBeginDate.DateTime,edEndDate.DateTime,ODSConstructionKLI_ID.Value]);
       end;
      if   cbRisks.State = cbChecked then
      with Risks do
      begin
           Insert;
           FieldByName('name').asString := memRisk.Text;
           Post;
           RefreshRecord;
      end;
      with ODSConstruction do
      begin
           FieldByName('riskid').AsInteger := Risks.FieldByName('id').AsInteger;
           FieldByName('ConstYear').AsDateTime:=ConstYearDateTimePicker.Date;
           FieldByName('Expirity').AsDateTime:=ExpirityDateTimePicker.Date;
      end;
      with ODSConstruction do
      if State in [dsInsert, dsEdit] then
      begin
         Post;
         nid:=ODSConstructionID.Value;
         Close;
         Setvariable('id',nid);
         Open;
       end;
      Result:=true;

end;

procedure TConstraction.LoadData;
begin
    with ODSConstruction do
    begin
         ConstYearDateTimePicker.Date:= FieldByName('ConstYear').AsDateTime;
         ExpirityDateTimePicker.Date:= FieldByName('Expirity').AsDateTime;
    end;
end;

procedure TConstraction.CommitClick(Sender: TObject);
begin
     if SaveData() then
     PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TConstraction.ODSConstructionNewRecord(DataSet: TDataSet);
begin
     DataSet.FieldByName('ID').AsInteger:=PINS_CONSTRUCTION.CallIntegerFunction('generateID',[]);
end;

procedure TConstraction.SuggestClick(Sender: TObject);
var
   p : TStringList;
begin
    p:= TStringList.Create;
    p.Values['ID']:=FloatToStr(ODSConstructionID.Value);
    with plgSuggest do
         ShowModal(StringToGuid('{0D0BAE0E-C323-439C-AAD6-EBBB63D04E9C}'),p );
    p.Free;
end;

procedure TConstraction.ReportClick(Sender: TObject);
var
    idr:double;
begin
     idr:=ODSConstructionID.value;
     ODSConstructionR.CloseAll;
     ODSConstructionR.SetVariable('ID',idr);
     ODSConstructionR.Open;
     ODSContracts.Close;
     ODSContracts.SetVariable('blankid',idr);
     ODSContracts.Open;
     try
        with ConstructionExporter do
        begin
             FileName:=ExtractFilePath(Application.ExeName)+ '\ConstructionAppl.doc';
             Open(False);
             SetBookmark('Insured',ODSConstructionRName.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('AInsured',ODSConstructionRAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('TInsured',ODSConstructionRPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('FInsured',ODSConstructionRFax.value, false, false, False, false, 8, 'Arial AzLat', False);
             //SetBookmark('RPeriod',ODSCONSTRUCTIONREQ_PERIOD.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RPeriod',DateToStr(ODSContractsBegin_Date.value)+' - '+DateToStr(ODSContractsEnd_Date.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Beneficiary',ODSBeneficiaryName.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BAddress',ODSBeneficiaryAddress.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BTel',ODSBeneficiaryPhone.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('BBank',ODSBeneficiaryBanking_details.value, True, false, False, false, 10, 'Arial AzLat', False);
             SetBookmark('FullDesc',ODSCONSTRUCTIONFullDescription.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Location',ODSCONSTRUCTIONLocationObj.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Yearsinb',ODSCONSTRUCTIONYEARSINBUSINESS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('CPerson',ODSCustomersContactPerson.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('TCPerson',ODSCustomersContactPersonPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('BUsage',ODSCONSTRUCTIONBuildingusage.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('YearConst',DateToStr(ODSCONSTRUCTIONconstyear.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('FloorsNum',IntToStr(ODSCONSTRUCTIONFloorsNum.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('WallsM',ODSCONSTRUCTIONWallsM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('CeilingsM',ODSCONSTRUCTIONCeilingsM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RoofM',ODSCONSTRUCTIONRoofM.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Area',FloatToStr(ODSCONSTRUCTIONArea.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('AppArea',FloatToStr(ODSCONSTRUCTIONApplicantSpace.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Earthquake',ODSCONSTRUCTIONEARTHQUAKEDETAILS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Flamable',ODSCONSTRUCTIONFlamable.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Surroinding',ODSCONSTRUCTIONSURROINDINGDETAILS.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Situeted',ODSCONSTRUCTIONSitueted.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Issecure',ODSCONSTRUCTIONGuard.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Alarm',ODSCONSTRUCTIONAlarm.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Locks',ODSCONSTRUCTIONLocks.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('SLocks',ODSCONSTRUCTIONSecurityLocks.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Bars',ODSCONSTRUCTIONBars.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Other',ODSCONSTRUCTIONOther.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Settings',ODSCONSTRUCTIONSettings.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Repair',ODSCONSTRUCTIONRepair.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('RepairDetail',ODSCONSTRUCTIONRepair.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Heated',ODSCONSTRUCTIONHeated.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('ValueType',ODSCONSTRUCTIONValueType.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Buildings',floatToStr(ODSCONSTRUCTIONBuildings.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Engineering',floatToStr(ODSCONSTRUCTIONEngineer.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Exdeco',floatToStr(ODSCONSTRUCTIONExDeco.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Indeco',floatToStr(ODSCONSTRUCTIONIndeco.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Firesys',floatToStr(ODSCONSTRUCTIONFiresys.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Annual',floatToStr(ODSCONSTRUCTIONAnnual.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Wages',floatToStr(ODSCONSTRUCTIONWages.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Rent',floatToStr(ODSCONSTRUCTIONRent.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Employes',floatToStr(ODSCONSTRUCTIONEmployes.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Indeminity',ODSCONSTRUCTIONIndeminity.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Expirity',DateToStr(ODSCONSTRUCTIONExpirity.value), false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('LHistory',ODSCONSTRUCTIONLossHistory.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('OtherInf',ODSCONSTRUCTIONRenewal.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('Thirdp',ODSCONSTRUCTIONThirdParty.value, false, false, False, false, 8, 'Arial AzLat', False);
             SetBookmark('OtherInform',ODSCONSTRUCTIONOtherInf.value, false, false, False, false, 8, 'Arial AzLat', False);
         end;
     finally
        ConstructionExporter.Show;
     end;

end;

procedure TConstraction.btApplyClick(Sender: TObject);
begin
     if SaveData() then
     begin
        Report.Enabled:=true;
        Suggest.Enabled:=true;
        btApply.Enabled:=false;
     end;
end;

procedure TConstraction.PeriodOinsChange(Sender: TObject);
begin
    btApply.Enabled:=true;
end;

procedure TConstraction.edBeginDateChange(Sender: TObject);
begin
    MonthPeriod;
    ODSConstruction.Edit;
    btApply.Enabled:=true;
end;

procedure TConstraction.MonthPeriod;
begin
     MonthEdit.Text:=IntToStr(trunc((edEndDate.DateTime - edBeginDate.DateTime)/30))+' ay';
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TConstraction,
    Class_Constraction,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

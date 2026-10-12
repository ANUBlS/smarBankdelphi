unit UMFBlank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, PMFBlank_TLB, StdVcl, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, Mask, ComCtrls,SBPlgAx50_TLB, Oracle, Db,
  OracleData, INSWordExporter, PlgModalContainer;

const
     WM_ModalResult = WM_USER+139;
     cs_generateID = 'GenerateID';
     cs_generateAcc_ID = 'GenerateAcc_ID';
     cs_generateAcs_id='GenerateAcs_ID';
     cs_generateMoreID='generateMore_ID';
     cs_add_motorinfo = 'add_fullmotor';
     cs_update_motorinfo='update_fullmotor';    

type
  TMotorFull=record
     id:longint;
     kli_id:longint;
     //contact_person:string;
     banking_details:string;
     profitid:longint;
     {profitname:string;
     profitaddress:string;
     profit_phone:string;
     profit_bankingdetails:string;}
     insuredtype:string;
     insuredcolor:string;
     insuredoutputyear:integer;
     insuredmodel:string;
     insuredstatenum:string;
     insurednumseats:byte;
     insuredenginenum:string;
     insuredchassisnum:string;
     insuredactualvalue:longint;
     transmission_type:string;
     presence_alarm:string;
     motor_usage:string;
     motorstorageplace:string;
     existingdamage:string;
     insurancegeographicallimit:string;
     broker:longint;
     insuredbody:string;
     begindate:variant;
     enddate:variant;
  end;

type
  TMFBlank = class(TActiveForm, IMFBlank,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    MotorAppPageControl: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    DBEditBanking: TDBEdit;
    InsLookupComboBox: TDBLookupComboBox;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label31: TLabel;
    Label3: TLabel;
    DBEditModel: TDBEdit;
    DBEditType: TDBEdit;
    DBEdit1StateNum: TDBEdit;
    DBEditColor: TDBEdit;
    DBEditOutputYear: TDBEdit;
    DBEditSeatCount: TDBEdit;
    DBEditEnginNum: TDBEdit;
    DBEditChassisNum: TDBEdit;
    DBEditActualValue: TDBEdit;
    DBEditTransmission: TDBEdit;
    DBEdit3: TDBEdit;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    TabSheet6: TTabSheet;
    GroupBox6: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Panel1: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    Ins_MotorFullData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
    Accesories: TOracleDataSet;
    AccesoriesData: TDataSource;
    MoreThanOneData: TDataSource;
    MoreThanOne: TOracleDataSet;
    CustomersData: TDataSource;
    Customers: TOracleDataSet;
    Ins_ReportData: TDataSource;
    Ins_Report: TOracleDataSet;
    Ins_ReportID: TFloatField;
    Ins_ReportNAME: TStringField;
    Ins_ReportADDRESS: TStringField;
    Ins_ReportPHONE: TStringField;
    Ins_ReportFAX: TStringField;
    Ins_ReportBANKING_DETAILS: TStringField;
    Ins_ReportINSUREDMODEL: TStringField;
    Ins_ReportINSUREDTYPE: TStringField;
    Ins_ReportINSUREDSTATENUM: TStringField;
    Ins_ReportINSUREDCOLOR: TStringField;
    Ins_ReportINSUREDOUTPUTYEAR: TIntegerField;
    Ins_ReportINSUREDNUMSEATS: TIntegerField;
    Ins_ReportINSUREDENGINENUM: TStringField;
    Ins_ReportINSUREDCHASSISNUM: TStringField;
    Ins_ReportINSUREDACTUALVALUE: TFloatField;
    Ins_ReportTRANSMISSION_TYPE: TStringField;
    Ins_ReportPRESENCE_ALARM: TStringField;
    Ins_ReportMOTOR_USAGE: TStringField;
    Ins_ReportMOTORSTORAGEPLACE: TStringField;
    Ins_ReportEXISTINGDAMAGE: TStringField;
    Ins_ReportINSURANCEGEOGRAPHICALLIMIT: TStringField;
    PINS_FULLMOTOR: TOraclePackage;
    Report: TBitBtn;
    Suggest: TBitBtn;
    INSWordExporter1: TINSWordExporter;
    lbBookmarks: TListBox;
    More_Report: TOracleDataSet;
    MoreReportData: TDataSource;
    PlgSuggest: TPlgModalContainer;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersADDRESS: TStringField;
    CustomersMOBILEPHONE: TStringField;
    CustomersFAX: TStringField;
    MoreThanOneID: TFloatField;
    MoreThanOneNAME: TStringField;
    MoreThanOneSURNAME: TStringField;
    MoreThanOneFATHERNAME: TStringField;
    MoreThanOneAGE: TIntegerField;
    MoreThanOneEXPERIENCE: TStringField;
    MoreThanOneFULL_ID: TFloatField;
    MoreThanOneHISTORY: TStringField;
    More_ReportID: TFloatField;
    More_ReportFULL_ID: TFloatField;
    More_ReportNAME: TStringField;
    More_ReportEXPERIENCE: TStringField;
    More_ReportHISTORY: TStringField;
    More_ReportAGE: TIntegerField;
    Suggestion: TOracleDataSet;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    SuggestionData: TDataSource;
    btApply: TBitBtn;
    AgentsSource: TDataSource;
    ODSAgents: TOracleDataSet;
    DBLookupComboBox2: TDBLookupComboBox;
    Ins_MotorFullID: TFloatField;
    Ins_MotorFullKLI_ID: TFloatField;
    Ins_MotorFullBANKING_DETAILS: TStringField;
    Ins_MotorFullINSUREDMODEL: TStringField;
    Ins_MotorFullINSUREDTYPE: TStringField;
    Ins_MotorFullINSUREDSTATENUM: TStringField;
    Ins_MotorFullINSUREDCOLOR: TStringField;
    Ins_MotorFullINSUREDOUTPUTYEAR: TIntegerField;
    Ins_MotorFullINSUREDNUMSEATS: TIntegerField;
    Ins_MotorFullINSUREDENGINENUM: TStringField;
    Ins_MotorFullINSUREDCHASSISNUM: TStringField;
    Ins_MotorFullINSUREDACTUALVALUE: TFloatField;
    Ins_MotorFullTRANSMISSION_TYPE: TStringField;
    Ins_MotorFullPRESENCE_ALARM: TStringField;
    Ins_MotorFullMOTOR_USAGE: TStringField;
    Ins_MotorFullMOTORSTORAGEPLACE: TStringField;
    Ins_MotorFullEXISTINGDAMAGE: TStringField;
    Ins_MotorFullINSURANCEGEOGRAPHICALLIMIT: TStringField;
    Ins_MotorFullBROKER: TFloatField;
    Ins_MotorFullINSUREDBODY: TStringField;
    Ins_MotorFullTYPEID: TIntegerField;
    ODSAgentsID: TFloatField;
    ODSAgentsNAME: TStringField;
    Ins_MotorFullPROFITID: TFloatField;
    DBLookupComboBox3: TDBLookupComboBox;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    Label7: TLabel;
    DBComboBox2: TDBComboBox;
    Label17: TLabel;
    DBComboBox1: TDBComboBox;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    Label19: TLabel;
    DBEdit22: TDBEdit;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    Label24: TLabel;
    DBEdit4: TDBEdit;
    AccesoriesDBGrid: TDBGrid;
    DBGrid1: TDBGrid;
    Label25: TLabel;
    lbBeginDate: TLabel;
    edBeginDate: TDateTimePicker;
    lbEndDate: TLabel;
    edEndDate: TDateTimePicker;
    OPCOMMON: TOraclePackage;
    DSContracts: TDataSource;
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
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    CPLookupComboBox: TDBLookupComboBox;
    CustomersCONTACTPERSON: TStringField;
    AccesoriesID: TFloatField;
    AccesoriesTYPE: TStringField;
    AccesoriesMAKE: TStringField;
    AccesoriesVALUE: TFloatField;
    AccesoriesHOWCREATED: TStringField;
    AccesoriesFULL_ID: TFloatField;
    MonthEdit: TEdit;
    procedure ActiveFormCreate(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure Ins_MotorFullApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
   
    procedure InsLookupComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure MotorAppPageControlChange(Sender: TObject);
    procedure CommitClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure SuggestClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure DBEditContactPersonChange(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
  private
    { Private declarations }
    resultID :integer;
    id : Integer;
    FParams: TStrings;
    FEvents: IMFBlankEvents;
    FOwnerHandle : Integer;

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


    function GenerateID: Longint;
    function GenerateAcs_ID: Longint;
    function GenerateMoreID: Longint;
    Procedure AddMotorInfo(Motor: TMotorFull);
    Procedure UpdateMotorInfo(Motor: TMotorFull);
    procedure MonthPeriod;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

var
      MFBlank:TMFBlank;

implementation

uses ComObj, ComServ,sboapiDataModuleImpl;

{$R *.DFM}

{ TMFBlank }

procedure TMFBlank.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MFBlankPage); }
end;

procedure TMFBlank.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMFBlankEvents;
end;

procedure TMFBlank.Initialize;
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

function TMFBlank.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMFBlank.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMFBlank.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMFBlank.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMFBlank.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMFBlank.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMFBlank.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMFBlank.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMFBlank.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMFBlank.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMFBlank.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMFBlank.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMFBlank.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMFBlank.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMFBlank.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMFBlank.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMFBlank.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMFBlank.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMFBlank._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMFBlank.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMFBlank.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMFBlank.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMFBlank.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMFBlank.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMFBlank.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMFBlank.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMFBlank.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMFBlank.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMFBlank.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMFBlank.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMFBlank.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMFBlank.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMFBlank.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMFBlank.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMFBlank.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMFBlank.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMFBlank.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMFBlank.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMFBlank.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMFBlank.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMFBlank.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMFBlank.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMFBlank.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TMFBlank.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TMFBlank.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TMFBlank.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TMFBlank.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TMFBlank.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TMFBlank.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TMFBlank.UIObjectActivate: HResult;  
begin
    if Get_Params('Mod') = 'Insert' then
    begin
       Ins_MotorFull.Insert;
       edBeginDate.DateTime := Now;
       edEndDate.DateTime := Now;
       Report.Enabled:=false;
       InsLookUpComboBox.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
       CPLookUpComboBox.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
       MonthPeriod;
    end;
    if Get_Params('Mod') = 'Edit' then
    begin
       id := StrToInt(Get_Params('ID'));
       Ins_MotorFull.Locate('ID',id,[]);
       ODSContracts.Close;
       ODSContracts.SetVariable('blankid',ins_motorfullid.value);
       ODSContracts.Open;
       edBeginDate.DateTime :=ODSContractsbegin_date.AsDateTime;
       edEndDate.DateTime :=ODSContractsEnd_date.AsDateTime;
       Suggest.Enabled := True;
       btApply.Enabled:=true;
       MonthPeriod;
    end;
    Result := S_OK;
end;

function TMFBlank.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMFBlank.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMFBlank.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TMFBlank.Get_Height : Integer;
begin
  Result := Height;
end;

function  TMFBlank.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TMFBlank.ActiveFormCreate(Sender: TObject);
begin
     MFBlank:=self;
     FParams := TStringList.Create;
     Back.Enabled:=false;
end;

procedure TMFBlank.BackClick(Sender: TObject);
begin
      with MotorAppPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;
end;

procedure TMFBlank.NextClick(Sender: TObject);
begin
     MotorAppPageControl.ActivePageIndex:= MotorAppPageControl.ActivePageIndex+1;
      if MotorAppPageControl.ActivePageIndex=MotorAppPageControl.PageCount-1 then
      Next.Enabled:=false;
      Back.Enabled:=true;

      if MotorAppPageControl.ActivePageIndex=2 then
      begin

          with Ins_MotorFull do
          if State in [dsInsert] then
          begin
             Post;
             Refresh;
             Locate('ID',ResultID,[]);
          end;
       end;

       case MotorAppPageControl.ActivePageIndex of
       0:InsLookupComboBox.SetFocus;
       1:DBEditModel.SetFocus;
       2:AccesoriesDBGrid.SetFocus; 
       end;
end;

procedure TMFBlank.AddMotorInfo(Motor: TMotorFull);
begin
      with PINS_FULLMOTOR, Motor do
      resultID:=CallIntegerFunction(cs_add_motorinfo, [
                'kli_id',kli_id,
                //'contact_person',contact_person,
                'banking_details',banking_details,
                'profitid',profitid,
                {'profitname',profitname,
                'profitaddress',profitaddress,
                'profit_phone',profit_phone,
                'profit_bankingdetails',profit_bankingdetails}
                'insuredtype',insuredtype,
                'insuredcolor',insuredcolor,
                'insuredoutputyear',insuredoutputyear,
                'insuredmodel',insuredmodel,
                'insuredstatenum',insuredstatenum,
                'insurednumseats',insurednumseats,
                'insuredenginenum',insuredenginenum,
                'insuredchassisnum',insuredchassisnum,
                'insuredactualvalue',insuredactualvalue,
                'transmission_type',transmission_type,
                'presence_alarm',presence_alarm,
                'motor_usage',motor_usage,
                'motorstorageplace',motorstorageplace,
                'existingdamage',existingdamage,
                'insurancegeographicallimit',insurancegeographicallimit,
                'broker',broker,
                'insuredbody',insuredbody,
                'begindate',begindate,
                'enddate',enddate
           ]);

end;

function TMFBlank.GenerateAcs_ID: Longint;
begin
    with PINS_FULLMOTOR do
    Result :=CallIntegerFunction( cs_generateAcs_ID, []);
end;

function TMFBlank.GenerateID: Longint;
begin
    with PINS_FULLMOTOR do
    Result :=CallIntegerFunction(cs_generateID, []);
end;

function TMFBlank.GenerateMoreID: Longint;
begin
     with PINS_FULLMOTOR do
     Result :=CallIntegerFunction(cs_generateMoreID, []);
end;

procedure TMFBlank.UpdateMotorInfo(Motor: TMotorFull);
begin

      with PINS_FULLMOTOR, Motor do
  CallProcedure(  cs_update_motorinfo, [
                'v_id',id,
                'kli_id',kli_id,
                //'contact_person',contact_person,
                'banking_details',banking_details,
                'profitid',profitid,
                {'profitname',profitname,
                'profitaddress',profitaddress,
                'profit_phone',profit_phone,
                'profit_bankingdetails',profit_bankingdetails,}
                'insuredtype',insuredtype,
                'insuredcolor',insuredcolor,
                'insuredoutputyear',insuredoutputyear,
                'insuredmodel',insuredmodel,
                'insuredstatenum',insuredstatenum,
                'insurednumseats',insurednumseats,
                'insuredenginenum',insuredenginenum,
                'insuredchassisnum',insuredchassisnum,
                'insuredactualvalue',insuredactualvalue,
                'transmission_type',transmission_type,
                'presence_alarm',presence_alarm,
                'motor_usage',motor_usage,
                'motorstorageplace',motorstorageplace,
                'existingdamage',existingdamage,
                'insurancegeographicallimit',insurancegeographicallimit,
                'broker',broker,
                'insuredbody',insuredbody{,
                'begindate',begindate,
                'enddate',enddate }
           ]);
end;

procedure TMFBlank.Ins_MotorFullApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
   MotorInfo:TMotorFull;

   procedure BuildMotorInfo;
   begin
    with Sender, MotorInfo do
    begin
         id:=FieldByName('ID').AsInteger;
         kli_id:=InsLookUpComboBox.KeyValue;//FieldByName('kli_id').AsInteger;
         //contact_person:=FieldByName('contact_person').AsString;
         banking_details:=FieldByName('banking_details').AsString;
         profitID:=FieldByName('profitId').AsInteger;
         {profitname:=FieldByName('profitname').AsString;
         profitaddress:=FieldBYName('profitaddress').AsString;
         profit_phone:=FieldByName('profit_phone').AsString;
         profit_bankingdetails:=FieldByName('profit_bankingdetails').AsString; }
         insuredtype:=FieldByName('insuredtype').AsString;
         insuredcolor:=FieldByName('insuredcolor').AsString;
         insuredoutputyear:=FieldByName('insuredoutputyear').AsInteger;
         insuredmodel:=FieldByName('insuredmodel').AsString;
         insuredstatenum:=FieldByName('insuredstatenum').AsString;
         insurednumseats:=FieldByName('insurednumseats').AsInteger;
         insuredenginenum:=FieldByName('insuredenginenum').AsString;
         insuredchassisnum:=FieldByName('insuredchassisnum').AsString;
         insuredactualvalue:=FieldByName('insuredactualvalue').AsInteger;
         transmission_type:=FieldByName('transmission_type').AsString;
         presence_alarm:=FieldByName('presence_alarm').AsString;
         motor_usage:=FieldByName('motor_usage').AsString;
         motorstorageplace:=FieldByName('motorstorageplace').AsString;
         existingdamage:=FieldByName('existingdamage').AsString;
         insurancegeographicallimit:=FieldByName('insurancegeographicallimit').AsString;
         broker:=FieldByName('broker').AsInteger;
         insuredbody:=FieldByName('insuredbody').AsString;
         begindate:=edBeginDate.DateTime;
         enddate:=edEndDate.DateTime;
    end;
   end;
begin
      case Action of
   'I':
     begin
         BuildMotorInfo;
         AddMotorInfo(MotorInfo);
         Applied := True;

     end;
   'E'{,'U'}:
      begin
         BuildMotorInfo;
         UpdateMotorInfo(MotorInfo);
         Applied := True;
      end;
      'L','R','C':
         Applied := True;
   else
         Applied := False;

  end;
end;


procedure TMFBlank.InsLookupComboBoxKeyPress(Sender: TObject;
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

procedure TMFBlank.MotorAppPageControlChange(Sender: TObject);
begin
       with MotorAppPagecontrol do
      begin
          if ActivePageIndex<>PageCount-1 then Next.Enabled:=true else Next.Enabled:=false;
          if ActivepageIndex<>0 then Back.Enabled:=true else Back.Enabled:=false;
      end;

       if MotorAppPageControl.ActivePageIndex=2 then
       begin
          with Ins_MotorFull do
          if State in [dsInsert] then
          begin
             Post;
             Refresh;
             Locate('ID',ResultID,[]);
          end;
       end;
end;

procedure TMFBlank.CommitClick(Sender: TObject);
var
    a1,a2:real;
begin

      if Ins_MotorFull.State in [dsEdit] then
      begin         
       a1:=ins_motorfullid.value;
       a2:=ins_motorfullkli_id.value;
       OPCommon.CallBooleanFunction('setblankdata',[4,a1,edBeginDate.DateTime,edEndDate.DateTime,a2]);
      end;
      with Ins_MotorFull do
      if State in [dsInsert, dsEdit] then
      begin
         Post;
         Refresh;
      end;
      if Accesories.State in [dsEdit,dsInsert] then
      begin
         Accesories.Post;
         Accesories.Refresh;
      end;
      if MoreThanOne.State in [dsEdit,dsInsert] then
      begin
         MoreThanOne.Post;
         MoreThanOne.Refresh;
      end;

         PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
         MotorAppPageControl.ActivePageIndex:=0;
end;

procedure TMFBlank.BitBtn2Click(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TMFBlank.ActiveFormDestroy(Sender: TObject);
begin
    FParams.Free;
end;

procedure TMFBlank.ReportClick(Sender: TObject);
var
    i:integer;
    p:TStringList;
    id:double;
begin
       p:=TStringList.Create;
       p.Values['R_ID'] :=FloatToStr(Ins_MotorFullID.value);
       id:=Ins_MotorFullID.value;
       Ins_Report.Locate('ID',id,[]);
       Customers.Locate('id',Ins_MotorFullKli_ID.Value,[]);
       with INSWordExporter1 do
       begin
          FileName:=ExtractFilePath(Application.ExeName)+ '\MotorFullApplicationForm.doc';
          Open(False);
          for i:=0 to lbBookmarks.Items.Count-1 do
          begin
             if Ins_Report.Fields[i+1].IsNull then Continue;
             SetBookmark(lbBookmarks.Items[i],Ins_Report.Fields[i+1].value, true, false, False, false, 10, 'Arial AzLat', False);
          end;
          SetBookmark('ContactP',CustomersContactperson.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('ContactP1',CustomersContactperson.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('Beneficiary',ODSBeneficiaryName.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryA',ODSBeneficiaryAddress.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryT',ODSBeneficiaryPhone.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryB',ODSBeneficiaryBanking_details.value, True, false, False, false, 10, 'Arial AzLat', False);
          if Accesories.RecordCount<>0 then
          begin
             Accesories.First;
             for i:=0 to Accesories.RecordCount-1 do
             begin
                 SetBookmark('AType',AccesoriesType.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 SetBookmark('AMake',AccesoriesMake.value+','+#13#10,false, false, false, false, 10, 'Arial AzLat', False);
                 SetBookmark('AValues',FloatToStr(AccesoriesValue.value)+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 SetBookmark('Hcreated',AccesoriesHowcreated.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 Accesories.Next;
             end;
          end;
          if More_Report.RecordCount<>0 then
          begin
             More_Report.First;
             for i:=0 to More_Report.RecordCount-1 do
             begin
                 SetBookmark('MName',More_ReportName.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 SetBookmark('MAge',IntToStr(More_ReportAge.value)+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 SetBookmark('MExp',More_ReportExperience.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 SetBookmark('MHist',More_ReportHistory.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
                 More_Report.Next;
             end;
          end;
       Show;
       end;
end;

procedure TMFBlank.SuggestClick(Sender: TObject);
var
   p : TStringList;
begin
   p:= TStringList.Create;
   p.Values['MK_ID'] := FloatToStr(Ins_MotorFullId.value);
   p.Values['KLI_ID'] := IntToStr(CustomersID.Value);
   if Suggestion.RecordCount<1 then
       p.Values['Mod']:='Insert'
   else
      p.Values['Mod']:='Edit';
   with plgSuggest do begin
     ShowModal(StringToGuid('{9D5D6D94-4ED9-4D64-9BC1-67394E009B52}'),p );
   end;
   p.Free;
end;

procedure TMFBlank.btApplyClick(Sender: TObject);
var
    eid:double;
    a1,a2:real;
begin
      if Ins_MotorFull.State in [dsEdit] then
      begin   
       a1:=ins_motorfullid.value;
       a2:=ins_motorfullkli_id.value;
       OPCommon.CallBooleanFunction('setblankdata',[4,a1,edBeginDate.DateTime,edEndDate.DateTime,a2]);
      end;

      with Ins_MotorFull do
      if State in [dsInsert] then
      begin
         Post;
         Refresh;
         Locate('id',resultId,[]);
         Ins_Report.Refresh;
        // ShowMessage(inTtoStr(resultId));
         Ins_Report.Locate('id',resultID,[]);
      end;

      if Ins_MotorFull.State in [dsEdit] then
      begin
         eid:=Ins_MotorFullID.value;
         Ins_MotorFull.Post;
         Ins_MotorFull.Refresh;
         Ins_MotorFull.Locate('id',eid,[]);
         Ins_Report.Refresh;
         Ins_Report.Locate('id',eid,[]);
      end;

      if Accesories.State in [dsEdit,dsInsert] then
      begin
         Accesories.Post;
         Accesories.Refresh;
      end;
      if MoreThanOne.State in [dsEdit,dsInsert] then
      begin
         MoreThanOne.Post;
         MoreThanOne.Refresh;
      end;
      Suggest.Enabled:=true;
      Report.Enabled:=true;
      btApply.Enabled:=false;
end;

procedure TMFBlank.DBEditContactPersonChange(Sender: TObject);
begin
     btApply.Enabled:=true;
end;

procedure TMFBlank.edBeginDateChange(Sender: TObject);
begin
     MonthPeriod;
     Ins_Motorfull.Edit;
end;

procedure TMFBlank.MonthPeriod;
begin
     MonthEdit.Text:=IntToStr(trunc((edEndDate.DateTime - edBeginDate.DateTime)/30))+' ay';
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMFBlank,
    Class_MFBlank,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

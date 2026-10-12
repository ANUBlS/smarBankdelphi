unit UMFSuggestion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, PMFSuggestion_TLB, StdVcl, Db, OracleData, StdCtrls,
  DBCtrls, Buttons, Mask, ExtCtrls,SBPlgAx50_TLB, ComCtrls, Oracle,
  INSWordExporter, PlgModalContainer;

const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Teklifname formasi: (%s)';


type
  TMFSuggestion = class(TActiveForm, IMFSuggestion,
                          IUIObject,
                          IParamInput,
                          ISBPlgAc50BufferForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbBookmarks: TListBox;
    Suggestion: TOracleDataSet;
    SuggestionData: TDataSource;
    BankInfo: TOracleDataSet;
    BankInfoData: TDataSource;
    Suggest_Rep: TOracleDataSet;
    Suggest_RepID: TFloatField;
    Suggest_RepMK_ID: TFloatField;
    Suggest_RepRISKADDRESS: TStringField;
    Suggest_RepINSURANCEAMMOUNT: TFloatField;
    Suggest_RepENDDATE: TDateTimeField;
    Suggest_RepData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
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
    Ins_MotorFullINSUREDBODY: TStringField;
    Ins_MotorFullData: TDataSource;
    Customers: TOracleDataSet;
    CustomersData: TDataSource;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersADDRESS: TStringField;
    CustomersMOBILEPHONE: TStringField;
    CustomersFAX: TStringField;
    DBLookupComboBoxCondition: TDBLookupComboBox;
    cbRisks: TCheckBox;
    btRisksAdd: TBitBtn;
    cbFranshiz: TCheckBox;
    cbConditions: TCheckBox;
    RisksData: TDataSource;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    Conditions: TOracleDataSet;
    ConditionsID: TFloatField;
    ConditionsNAME: TStringField;
    ConditionsData: TDataSource;
    Franshiz: TOracleDataSet;
    FranshizID: TFloatField;
    FranshizNAME: TStringField;
    FranshizData: TDataSource;
    Risktypes: TOracleDataSet;
    RisktypesID: TFloatField;
    RisktypesNAME: TStringField;
    RisktypesData: TDataSource;
    DBLookupComboBoxFranshiz: TDBLookupComboBox;
    DBLookupComboBoxRisk: TDBLookupComboBox;
    DTPContractDate: TDateTimePicker;
    memRisk: TMemo;
    memFrashize: TMemo;
    memConditions: TMemo;
    btApply: TBitBtn;
    DBEdit4: TDBEdit;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    btPrint: TBitBtn;
    PINS_FULLMOTOR: TOraclePackage;
    SugWordExporter: TINSWordExporter;
    Ins_RepData: TDataSource;
    Ins_Rep: TOracleDataSet;
    Ins_RepNAME: TStringField;
    Ins_RepADDRESS: TStringField;
    Ins_RepID: TFloatField;
    btPolicy: TBitBtn;
    PlgPolicy: TPlgModalContainer;
    Policy: TOracleDataSet;
    PolicyID: TFloatField;
    PolicyMS_ID: TFloatField;
    PolicyPOLICYNUM: TStringField;
    PolicySUBJECTVALUE: TFloatField;
    PolicyData: TDataSource;
    Ins_MotorFullBROKER: TFloatField;
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
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    DBLookupComboBox3: TDBLookupComboBox;
    Label6: TLabel;
    Suggest_RepINSURANCESUM: TFloatField;
    AValute: TOracleDataSet;
    AValuteVALU_NAME: TStringField;
    AValuteVALUTE: TIntegerField;
    AValuteVAL_NAME: TStringField;
    AValuteVALU_SHORT: TStringField;
    AValuteData: TDataSource;
    procedure ActiveFormCreate(Sender: TObject);
    procedure btRisksAddClick(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxRiskClick(Sender: TObject);
    procedure DBLookupComboBoxFranshizClick(Sender: TObject);
    procedure DBLookupComboBoxConditionClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure memConditionsChange(Sender: TObject);
    procedure DTPContractDateChange(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure SuggestionNewRecord(DataSet: TDataSet);
    procedure btPrintClick(Sender: TObject);
    procedure btPolicyClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
  private
    { Private declarations }
    FParams : TStrings;
    FOwnerHandle : Integer;
    id : integer;
    f:boolean;
    FEvents: IMFSuggestionEvents;
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

    {}
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

    function  SaveData():Boolean;
    procedure LoadValues(var params : TStringlist);
    //function GenerateSug_ID: Longint;
  public
    { Public declarations }
    //ID : Integer;
    procedure Initialize; override;
  end;

var
    MFSuggestion:TMFSuggestion;
implementation

uses ComObj, ComServ,sboapiDataModuleImpl, URiskTypes;

{$R *.DFM}

{ TMFSuggestion }

procedure TMFSuggestion.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MFSuggestionPage); }
end;

procedure TMFSuggestion.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMFSuggestionEvents;
end;

procedure TMFSuggestion.Initialize;
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

function TMFSuggestion.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMFSuggestion.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMFSuggestion.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMFSuggestion.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMFSuggestion.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMFSuggestion.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMFSuggestion.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMFSuggestion.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMFSuggestion.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMFSuggestion.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMFSuggestion.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMFSuggestion.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMFSuggestion.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMFSuggestion.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMFSuggestion.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMFSuggestion.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMFSuggestion.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMFSuggestion.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMFSuggestion._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMFSuggestion.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMFSuggestion.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMFSuggestion.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMFSuggestion.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMFSuggestion.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMFSuggestion.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMFSuggestion.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMFSuggestion.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMFSuggestion.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMFSuggestion.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMFSuggestion.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMFSuggestion.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMFSuggestion.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMFSuggestion.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMFSuggestion.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMFSuggestion.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMFSuggestion.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMFSuggestion.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMFSuggestion.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMFSuggestion.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMFSuggestion.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMFSuggestion.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMFSuggestion.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMFSuggestion.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TMFSuggestion.ActiveFormCreate(Sender: TObject);
begin
     MFSuggestion:=Self;
     FParams := TStringList.Create;
     Risks.Open;
     Conditions.Open;
     Franshiz.Open;
end;

function  TMFSuggestion.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TMFSuggestion.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TMFSuggestion.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TMFSuggestion.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TMFSuggestion.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TMFSuggestion.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TMFSuggestion.UIObjectActivate: HResult;
begin
       id := StrToInt(Get_Params('MK_ID'));
       f:=true;
       Ins_motorFull.Locate('ID',id,[]);

       ODSContracts.Close;
       ODSContracts.SetVariable('blankid', id);
       ODSContracts.Open;

       if Get_Params('Mod') = 'Insert' then
       begin
          Suggestion.Insert;
          Caption := format(fmCaption, ['Elave']);
          DTPContractDate.DateTime:=Now;
          //Customers.SetVariable('id',StrToInt(Get_Params('KLI_ID')));
          Customers.Open;
          Suggestion.SetVariable('MK_ID',id);
          Suggestion.Open;

       end
       else
          begin  //-----Edit mode
              DTPContractDate.DateTime := SuggestionENDDATE.value;
              Suggestion.Edit;
              Caption := format(fmCaption, ['Redakte']);   
              btPrint.Enabled := True;
              btPolicy.Enabled := True;
           end;
         //    end;
  Result := S_OK;
end;

function TMFSuggestion.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMFSuggestion.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMFSuggestion.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TMFSuggestion.Get_Height : Integer;
begin
  Result := Height;
end;

function  TMFSuggestion.Get_Width  : Integer;
begin
  Result := Width;
end;


procedure TMFSuggestion.btRisksAddClick(Sender: TObject);
begin
  Risktypes.Open;
  with TfmRiskTypes.Create(Self) do
    ShowModal;
  if memRisk.Text <> '' then
  cbRisks.State := cbChecked;
  Risktypes.Close;
end;

procedure TMFSuggestion.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end else btApply.Enabled := True;
end;

procedure TMFSuggestion.DBLookupComboBoxRiskClick(Sender: TObject);
begin
    with Risks do
    memRisk.Text := FieldByName('name').asString;
    btApply.Enabled:=true;
end;

procedure TMFSuggestion.DBLookupComboBoxFranshizClick(Sender: TObject);
begin
    with Franshiz do
    memFrashize.Text := FieldByName('name').asString;
end;

procedure TMFSuggestion.DBLookupComboBoxConditionClick(Sender: TObject);
begin
     with Conditions do
     memConditions.Text := FieldByName('name').asString;
end;

procedure TMFSuggestion.LoadValues(var params: TStringlist);
begin
    with params do
    begin
         values['name'] := CustomersNAME.Value;
    end;
end;

function TMFSuggestion.SaveData: Boolean;
begin
       Result := False;
  //----------Save new risk----------------
  if   cbRisks.State = cbChecked then
  with Risks do begin
    Insert;
    FieldByName('name').asString := memRisk.Text;
    Post;
    RefreshRecord;
  end;

  //----------Save new franshiz----------------
  if   cbFranshiz.State = cbChecked then
  with Franshiz do begin
    Insert;
    FieldByName('name').asString := memFrashize.Text;
    Post;
    RefreshRecord;
  end;

  //----------Save new conditions----------------
  if   cbConditions.State = cbChecked then
  with Conditions do begin
    Insert;
    FieldByName('name').asString := memConditions.Text;
    Post;
    RefreshRecord;
  end;

  with Suggestion do begin
    FieldByName('mk_id').AsFloat := id;
    FieldByName('rsk_id').AsFloat := Risks.FieldByName('id').asFloat;
    FieldByName('frz_id').AsFloat := Franshiz.FieldByName('id').asFloat;
    FieldByName('cndt_id').AsFloat := Conditions.FieldByName('id').asFloat;
    FieldByName('enddate').AsDateTime := DTPContractDate.DateTime;
    if  state in [dsInsert,dsEdit] then
    Post;
    RefreshRecord();
    if f then
    begin
       ODSContracts.Edit;
       ODSContracts.FieldByName('sugg_id').AsFloat := FieldByName('id').asFloat;
       ODSContracts.FieldByName('ins_date').AsDateTime := DTPContractDate.DateTime;
       ODSContracts.Post;
    end;
    f:=false;
    result := True;
  end;
end;

procedure TMFSuggestion.BitBtn1Click(Sender: TObject);
begin
     if SaveData() or f then
     PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TMFSuggestion.BitBtn2Click(Sender: TObject);
begin
    PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TMFSuggestion.memConditionsChange(Sender: TObject);
begin
      DTPContractDateChange(Sender);
end;

procedure TMFSuggestion.DTPContractDateChange(Sender: TObject);
var
     key:Char;
begin
     DBEdit4KeyPress(Sender, Key);
end;

procedure TMFSuggestion.btApplyClick(Sender: TObject);
begin
  if SaveData()then
  begin
    btPrint.Enabled := True;
    btPolicy.Enabled := True;
    btApply.Enabled := False;
  end;
  //Policy.Edit;
end;

procedure TMFSuggestion.SuggestionNewRecord(DataSet: TDataSet);
begin
     //DataSet.FieldByName('ID').AsInteger:=PINS_FULLMOTOR.CallIntegerFunction('generateSug_ID', []);
end;

procedure TMFSuggestion.btPrintClick(Sender: TObject);
const
    months : array [1..12] of String = ('Йанвар', 'Феврал', 'Март', 'Апрел', 'Май', 'Ийун',
                                         'Ийул', 'Август', 'Сентйабр', 'Октйабр', 'Нойабр', 'Декабр');
var
   day, month, year : word;
begin
     try

     with SugWordExporter do
     begin
          FileName:=ExtractFilePath(Application.ExeName)+ '\MotorFullSuggest.doc';
          Open(False);
          DecodeDate(SuggestionENDDATE.AsDateTime, year, month, day);
          SetBookmark('Insured',CustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('IAddress',CustomersADDRESS.value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('RAddress',SuggestionRISKADDRESS.value, false, false, False, false, 8, 'Arial AzLat', False);
          //SetBookmark('IObject',Suggestion.value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('IValue',CurrToStr(SuggestionInsuranceSum.value), false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('ISum',CurrToStr(ODSContractsAmmount.value), false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('EndDate', IntToStr(day)+'    '+months[month]+'    '+IntToStr(year), False, False, False,
                 False, 8, 'Arial AzLat', False);
          SetBookmark('IPeriod', DateToStr(ODSContractsBegin_Date.Value)+' - '+DateToStr(ODSContractsEnd_Date.Value), False, False, False, False, 10, 'Arial AzLat', False);
          //SetBookmark('ETime', str2, False, False, False, False, 10, 'Arial AzLat', False);
          SetBookmark('IRisks',Risks.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('IFrans',Franshiz.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('ICond',Conditions.Fields[1].value, false, false, False, false, 8, 'Arial AzLat', False);
          SetBookmark('Insured2',CustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
       end;
       finally
          SugWordExporter.Show;
     end;
end;

procedure TMFSuggestion.btPolicyClick(Sender: TObject);
var
     PolicFormGuid : TGuid;
     p: TStringList;
begin
     p:= TStringList.Create;
     try
        PolicFormGuid := StringToGUID('{7269AF35-5AC3-406B-8330-29850E49B6A6}');
        p.Values['MFS_ID'] := FloatToStr(FranshizID.Value);
        P.Values['ID']:=FloatToStr(Ins_MotorFullID.Value);
        Policy.Close;
        Policy.SetVariable('MS_ID', FloatToStr(SuggestionId.value));
        Policy.Open;
        if Policy.RecordCount<1 then
            p.Values['Mod']:='Insert'
        else
           p.Values['Mod']:='Edit';
        with PlgPolicy do
           ShowModal(PolicFormGuid, p);
     finally
        p.Free;
     end;

end;

procedure TMFSuggestion.DBEdit4Change(Sender: TObject);
begin
     btApply.Enabled:=true;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMFSuggestion,
    Class_MFSuggestion,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

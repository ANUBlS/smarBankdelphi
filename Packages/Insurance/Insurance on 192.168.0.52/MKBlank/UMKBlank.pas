unit UMKBlank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MKBlank_TLB, StdVcl, StdCtrls, DBCtrls, Mask, Buttons,
  ExtCtrls, Db, OracleData, SBPlgAx50_TLB, Oracle, DBViewComboBox, HintBox,
  CurrencyEdit, ComCtrls, PlgModalContainer;

const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Kasko sigortasi anket formasi: (%s)';

type
  TConversionExcept = Exception;
  TCalcException = Exception;
  TOutputYear = Exception;

  TRowIns_Motorkasco = record
    rKli_ID : Integer;
    rProfId : Integer;
//    rProfPhone : String;
//    rProfAddress : String;
    rInsType : String;
    rInsMark : Integer;
    rInsModel : Integer;
    rInsBanNum : String;
    rInsColor : String;
    rInsStateNum : String;
    rInsEngineNum : String;
    rInsOutputYear : Variant;
    rUnderframeNum : String;
    rDrAccessPeople1 : String;
    rDrAccessPeople2 : String;
    rDriverBirthday1 : Variant;
    rDriverBirthday2 : Variant;
    rDrExper1 : Variant;
    rDrExper2 : Variant;
    rDrInvented : String;
    rDriveCost : Variant;
    rBeginDate : Variant;
    rInsSumm : Variant;
    rEndDate : Variant;
    rInsFranshiz : Variant;
    rBankID : Integer;
    rMonthID : Integer;
    rFranshizID : Integer;
  end;

  TfmMKBlank = class(
             TActiveForm,
             IfmMKBlank,
             IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    lbDBCBCustName: TLabel;
    GroupBox3: TGroupBox;
    lbInsType: TLabel;
    lbInsModel: TLabel;
    lbInsBanNum: TLabel;
    lbInsColor: TLabel;
    lbInsStateNum: TLabel;
    lbInsEngineNum: TLabel;
    lbInsOutputYear: TLabel;
    lbUnderframeNum: TLabel;
    lbDrAccessPeople1: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    lbDriverBirthday1: TLabel;
    lbDrExper1: TLabel;
    lbDrIntend: TLabel;
    GroupBox5: TGroupBox;
    lbDriveCost: TLabel;
    lbInsSumm: TLabel;
    lbInsFranshiz: TLabel;
    lbBeginDate: TLabel;
    lbEndDate: TLabel;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TStringField;
    ODSCustsADDRESS: TStringField;
    DSCusts: TDataSource;
    edInsType: TEdit;
    edInsBanNum: TEdit;
    edInsColor: TEdit;
    edInsStateNum: TEdit;
    edInsEngineNum: TEdit;
    edUnderframeNum: TEdit;
    edDrAccessPeople1: TEdit;
    edDrAccessPeople2: TEdit;
    pkgMotorKasco: TOraclePackage;
    edDrExper1: TMaskEdit;
    edDrExper2: TMaskEdit;
    hbErrMsg: THintBox;
    edDriveCost: TCurrencyEdit;
    edInsSumm: TCurrencyEdit;
    edBeginDate: TDateTimePicker;
    edEndDate: TDateTimePicker;
    edDriverBirthday1: TDateTimePicker;
    edDriverBirthday2: TDateTimePicker;
    edDrIntend: TComboBox;
    edInsFranshiz: TCurrencyEdit;
    btSuggestion: TBitBtn;
    btApply: TBitBtn;
    pmcSuggestion: TPlgModalContainer;
    OPCOMMON: TOraclePackage;
    Label1: TLabel;
    DBBeneficiary: TDBLookupComboBox;
    DSBeneficiary: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    DBCBCustName: TDBLookupComboBox;
    ODSModels: TOracleDataSet;
    ODSMarks: TOracleDataSet;
    DSModels: TDataSource;
    DSMarks: TDataSource;
    Label2: TLabel;
    DBInsMarks: TDBLookupComboBox;
    DBInsModels: TDBLookupComboBox;
    Label3: TLabel;
    lbBank: TLabel;
    DBBanks: TDBLookupComboBox;
    ODSBanks: TOracleDataSet;
    DSBanks: TDataSource;
    ODSBanksID: TFloatField;
    ODSBanksNAME: TStringField;
    ODSMarksID: TFloatField;
    ODSMarksNAME: TStringField;
    ODSMarksSTATE_ID: TFloatField;
    ODSMarksCALCOPTIONS: TIntegerField;
    ODSModelsID: TFloatField;
    ODSModelsNAME: TStringField;
    ODSModelsMARK_ID: TFloatField;
    ODSModelsCALCOPTIONS: TIntegerField;
    DBFranshiz: TDBLookupComboBox;
    DBMonths: TDBLookupComboBox;
    ODSFranshiz: TOracleDataSet;
    ODSMonths: TOracleDataSet;
    DSFranshiz: TDataSource;
    DSMonths: TDataSource;
    ODSMonthsID: TFloatField;
    ODSMonthsRELEASE_ID: TFloatField;
    ODSMonthsCOUNT: TFloatField;
    ODSFranshizID: TFloatField;
    ODSFranshizMONTH_ID: TFloatField;
    ODSFranshizAMMOUNT: TFloatField;
    ODSReliaseDates: TOracleDataSet;
    Label4: TLabel;
    ODSReliaseDatesID: TFloatField;
    ODSReliaseDatesBEGINDATE: TDateTimeField;
    ODSReliaseDatesENDDATE: TDateTimeField;
    ODSReliaseDatesSTATE_ID: TFloatField;
    SpeedButton1: TSpeedButton;
    edInsOutputYear: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edDBCBCustNameChange(Sender: TObject);
    procedure edDBCBCustNameKeyPress(Sender: TObject; var Key: Char);
    procedure btApplyClick(Sender: TObject);
    procedure btSuggestionClick(Sender: TObject);
    procedure edDrIntendChange(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
    procedure DBBeneficiaryClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBMonthsClick(Sender: TObject);
    procedure DBMonthsKeyPress(Sender: TObject; var Key: Char);
    procedure DBFranshizClick(Sender: TObject);
    procedure DBFranshizKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FEvents: IfmMKBlankEvents;
    FOwnerHandle : Integer;
    IsSaved : Boolean;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function  SaveData():Boolean;
    procedure LoadData(id:Integer);
    procedure SetControlsData(values : TRowIns_Motorkasco);
    function GetControlsData(var values : TRowIns_Motorkasco):Boolean;
    function  AssignVariables(Valname : String; Value : Variant;
                                      Valtype:Integer; var Varbl:Variant):Integer;
    procedure CalcMonth();
    procedure CalcEndDate();
    procedure EnableBankInfo(Sender: TObject);
//    procedure LoadValues(var params : TStringlist);
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
  end;

var
  fmMKBlank : TfmMKBlank;
  callfuncname : String;
implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TfmMKBlank }



procedure TfmMKBlank.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmMKBlankPage); }
end;

procedure TfmMKBlank.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmMKBlankEvents;
end;

procedure TfmMKBlank.Initialize;
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

function TfmMKBlank.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmMKBlank.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmMKBlank.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmMKBlank.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmMKBlank.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmMKBlank.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmMKBlank.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmMKBlank.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmMKBlank.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmMKBlank.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmMKBlank.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmMKBlank.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmMKBlank.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmMKBlank.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmMKBlank.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmMKBlank.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmMKBlank.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmMKBlank.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmMKBlank._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMKBlank.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmMKBlank.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmMKBlank.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmMKBlank.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmMKBlank.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmMKBlank.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmMKBlank.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmMKBlank.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmMKBlank.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmMKBlank.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmMKBlank.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmMKBlank.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmMKBlank.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmMKBlank.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmMKBlank.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmMKBlank.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmMKBlank.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmMKBlank.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMKBlank.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmMKBlank.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmMKBlank.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmMKBlank.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmMKBlank.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmMKBlank.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TfmMKBlank.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TfmMKBlank.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TfmMKBlank.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TfmMKBlank.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TfmMKBlank.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TfmMKBlank.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TfmMKBlank.UIObjectActivate: HResult;
begin
    if Get_Params('Mod') = 'Insert' then begin
       id := -1;
       callfuncname := 'add_blank';
       edBeginDate.DateTime := Now;
       edEndDate.DateTime := Now;
       Caption := format(fmCaption, ['Yeni anket']);
       DBCBCustName.KeyValue :=  StrToInt(Get_Params('KLI_ID'));//ODSCusts.Locate('id',StrToInt(Get_Params('KLI_ID')), []);
    end;
    if Get_Params('Mod') = 'Edit' then begin
       id := StrToInt(Get_Params('ID'));
       callfuncname := 'edit_blank';
       LoadData(id);
       Caption := format(fmCaption, ['Redakte']);

       with pkgMotorKasco do
         //if CallBooleanFunction('CheckSuggestionExisting',[id]) then
         btSuggestion.Enabled := True;

       //--Initialization
       SpeedButton1Click(edInsOutputYear);
//       CalcMonth();
//       ODSFranshiz.Locate('ammount', StrToInt(edInsFranshiz.Text), []);
       EnableBankInfo(DBBeneficiary);
    end;
  Result := S_OK;
end;

function TfmMKBlank.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMKBlank.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMKBlank.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TfmMKBlank.Get_Height : Integer;
begin
  Result := Height;
end;

function  TfmMKBlank.Get_Width  : Integer;
begin
  Result := Width;
end;

function TfmMKBlank.SaveData():Boolean;
var
 RowIns_Motorkasc : TRowIns_Motorkasco;
// ins_id : integer;
begin
 Result := false;
  if IsSaved or (not GetControlsData(RowIns_Motorkasc)) then exit;
  with pkgMotorKasco,  RowIns_Motorkasc do
  try
//    rKli_ID := ODSCustsID.value;
    CallBooleanFunction(callfuncname, [
    id,
    rKli_ID,
    rProfID,
//    rProfAddress,
//    rProfPhone,
    rInsType,
    rInsColor,
    rInsOutputYear,
    rInsMark,
    rInsModel,
    rInsStateNum,
    rUnderframeNum,
    rInsBanNum,
    rInsEngineNum,
    rDrAccessPeople1,
    rDrAccessPeople2,
    rDriverBirthday1,
    rDriverBirthday2,
    rDrExper1,
    rDrExper2,
    rDrInvented,
    rDriveCost,
    rInsSumm,
    rInsFranshiz,
    rBeginDate,
    rEndDate,
    rBankID,
    rMonthID,
    rFranshizID
    ]);

  id := GetParameter(0);
//  OPCOMMON.CallBooleanFunction('setblankdata', [ins_id, 0, id, rBeginDate, rEndDate, rKli_ID]);
  IsSaved := True;
  Result := True;
  except
   on E:Exception do hbErrMsg.ShowMessage(E.message);
  end;
end;

procedure TfmMKBlank.BitBtn1Click(Sender: TObject);
begin
  if SaveData() or IsSaved then
   PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;




procedure TfmMKBlank.ActiveFormCreate(Sender: TObject);
begin
  fmMKBlank := Self;
  FParams := TStringList.Create;
  isSaved := False;
end;


procedure TfmMKBlank.ActiveFormDestroy(Sender: TObject);
begin
   FParams.Free;
end;

procedure TfmMKBlank.BitBtn2Click(Sender: TObject);
begin
  PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

function ReplaceStr(Substr: string; S: string):String;
var res : String;
    p : Integer;
begin
  p := pos (SubStr, S);
  Res := 'lb'+copy(S, p+2, Length(S));
  Result := Res;
end;

function TfmMKBlank.AssignVariables(Valname : String; Value : Variant;
                                      Valtype:Integer; var Varbl:Variant):Integer;
begin
  try
    ///if TVarData(varbl).VType = Valtype;
    varCast(varbl, value, valtype);
{    case Valtype of
      varInteger   : Varbl := StrToInt(Value);
      varString    : Varbl := Value;
      varDate      : Varbl := StrToDate(Value);
      varCurrency  : Varbl := StrToCurr(Value);
    end;  }
    Result := mrOk;
  except
   on E:Exception do begin
    raise TConversionExcept.Create((FindComponent(ReplaceStr('ed', Valname)) as TLabel).Caption+
                                    '-сящв дахил едилиб'#13+E.message);
   end;
  end;
end;

function TfmMKBlank.GetControlsData(var values : TRowIns_Motorkasco): Boolean;
begin
 Result := True;
  with values do
  try
    rProfID := DBBeneficiary.KeyValue ;

    rKli_ID := DBCBCustName.KeyValue;

    rInsType := edInsType.text ;

    rInsMark := Integer(DBInsMarks.KeyValue);

//    rMonthID := Integer(DBMonths.KeyValue);
    if varisnull(DBMonths.KeyValue) or ODSMonths.IsEmpty then rMonthID := 0
    else rMonthID := DBMonths.KeyValue;


//    rFranshizID := Integer(DBFranshiz.KeyValue);
    if varisnull(DBFranshiz.KeyValue) or ODSFranshiz.IsEmpty then rFranshizID := 0
    else rFranshizID := DBFranshiz.KeyValue;

    if varisnull(DBInsModels.KeyValue) or ODSModels.IsEmpty then rInsModel := 0
    else rInsModel := DBInsModels.KeyValue;

    rBankID := DBBanks.KeyValue;

    rInsBanNum := edInsBanNum.text ;

    rInsColor := edInsColor.text ;

    rInsStateNum := edInsStateNum.text ;

    rInsEngineNum := edInsEngineNum.text ;

    AssignVariables(edInsOutputYear.Name, edInsOutputYear.text, varInteger, rInsOutputYear);

    rUnderframeNum:= edUnderframeNum.text;
    rDrAccessPeople1:= edDrAccessPeople1.text;
    rDrAccessPeople2:= edDrAccessPeople2.text;
    AssignVariables(edDriverBirthday1.Name, edDriverBirthday1.DateTime, varDate, rDriverBirthday1);

    AssignVariables(edDriverBirthday1.Name, edDriverBirthday2.DateTime, varDate, rDriverBirthday2);

    AssignVariables(edDrExper1.Name, edDrExper1.text, varInteger, rDrExper1);

    AssignVariables(edDrExper1.Name, edDrExper2.text, varInteger, rDrExper2);

    rDrInvented := edDrIntend.Text;

    AssignVariables(edDriveCost.Name, edDriveCost.text, varCurrency, rDriveCost);

    AssignVariables(edInsSumm.Name, edInsSumm.text, varCurrency, rInsSumm);

//    rBeginDate:= StrToDate(edBeginDate.text);
    AssignVariables(edBeginDate.Name, edBeginDate.DateTime, varDate, rBeginDate);

    AssignVariables(edEndDate.Name, edEndDate.DateTime, varDate, rEndDate);

    AssignVariables(edInsFranshiz.Name, edInsFranshiz.text, varCurrency, rInsFranshiz);


//    rInsFranshiz:= edInsFranshiz.text;
  except
   on E:TConversionExcept do begin hbErrMsg.ShowMessage(E.message, 3000);
     result := false;
   end;

  end;
end;

procedure TfmMKBlank.SetControlsData(values : TRowIns_Motorkasco);
begin
  with values do
  begin
    DBCBCustName.KeyValue := rKli_ID;
    DBBeneficiary.KeyValue:= rProfID;
//    edProfPhone.text:= rProfPhone;
//    edProfAddress.text:= rProfAddress;
    edInsType.text:= rInsType;
    DBInsMarks.KeyValue := rInsMark;
    DBInsModels.KeyValue := rInsModel;
    edInsBanNum.text:= rInsBanNum;
    edInsColor.text:= rInsColor;
    edInsStateNum.text:= rInsStateNum;
    edInsEngineNum.text:= rInsEngineNum;
    edInsOutputYear.text:= IntToStr(rInsOutputYear);
    edUnderframeNum.text:= rUnderframeNum;
    edDrAccessPeople1.text:= rDrAccessPeople1;
    edDrAccessPeople2.text:= rDrAccessPeople2;
    edDriverBirthday1.DateTime:= rDriverBirthday1;
    edDriverBirthday2.DateTime:= rDriverBirthday2;
    edDrExper1.text:= IntToStr(rDrExper1);
    edDrExper2.text:= IntToStr(rDrExper2);
    edDrIntend.Text := rDrInvented;
    edDriveCost.text:= CurrToStr(rDriveCost);
    edInsSumm.text:= CurrToStr(rInsSumm);
    edBeginDate.DateTime:= rBeginDate;
    edEndDate.DateTime:= rEndDate;
    edInsFranshiz.text:= CurrToStr(rInsFranshiz);
    DBBanks.KeyValue := rBankID;
    DBMonths.KeyValue := rMonthID;
    DBFranshiz.KeyValue := rFranshizID; 
  end;
end;

procedure TfmMKBlank.LoadData(id : Integer);
var
 RowIns_Motorkasc : TRowIns_Motorkasco;
begin
  with RowIns_Motorkasc, pkgMotorKasco do
   if CallBooleanFunction('get_blank',[id, parInteger, parString,parString,parInteger,parInteger,parInteger,
   parString,parString,parString,parString,parString,parString,parDate,pardate,parInteger, parInteger,
   parString,parFloat, parFloat, parFloat,parDate, parDate, parInteger, parInteger, parInteger]) then
   begin
     rProfID := GetParameter(1);
     rKli_ID := StrToInt(Get_Params('KLI_ID'));
     rInsType:= GetParameter(2);
     rInsColor:= GetParameter(3);
     rInsOutputYear:= GetParameter(4);
     rInsMark:= GetParameter(5);
     rInsModel:= GetParameter(6);
     rInsStateNum:= GetParameter(7);
     rUnderframeNum:= GetParameter(8);
     rInsBanNum:= GetParameter(9);
     rInsEngineNum:= GetParameter(10);
     rDrAccessPeople1:= GetParameter(11);
     rDrAccessPeople2:= GetParameter(12);
     rDriverBirthday1:= GetParameter(13);
     rDriverBirthday2:= GetParameter(14);
     rDrExper1:= GetParameter(15);
     rDrExper2:= GetParameter(16);
     rDrInvented:= GetParameter(17);
     rDriveCost:= GetParameter(18);
     rInsSumm:= GetParameter(19);
     rInsFranshiz:= GetParameter(20);
     rBeginDate:= GetParameter(21);
     rEndDate:= GetParameter(22);
     rBankID := GetParameter(23);
     rMonthID := GetParameter(24);
     rFranshizID := GetParameter(25);
     SetControlsData(RowIns_Motorkasc)
   end
        else ShowMessage('Can''''t load data');
end;


procedure TfmMKBlank.edDBCBCustNameChange(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.edDBCBCustNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end else btApply.Enabled := True;
  IsSaved := not btApply.Enabled;
end;

procedure TfmMKBlank.btApplyClick(Sender: TObject);
begin
  if SaveData then begin
      btSuggestion.Enabled := True;
      btApply.Enabled := False;
  end;
end;

procedure TfmMKBlank.btSuggestionClick(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['MK_ID'] := IntToStr(id);
   params.Values['KLI_ID'] := IntToStr(ODSCustsID.Value);
//   LoadValues(params);
   with pmcSuggestion do begin
     ShowModal(StringToGuid('{D5269FCA-2559-4984-A565-16C0EE110CF6}'),params )
   end;
   params.Free;
end;

procedure TfmMKBlank.edDrIntendChange(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.CalcMonth();
begin
  ODSMonths.Locate('count',
    IntToStr(trunc((edEndDate.DateTime - edBeginDate.DateTime)/30)), [] );
end;

procedure TfmMKBlank.CalcEndDate();
begin
   edEndDate.DateTime :=
       IncMonth(edBeginDate.DateTime, ODSMonths.fieldbyname('COUNT').asInteger);
end;

procedure TfmMKBlank.edBeginDateChange(Sender: TObject);
var key : Char;
begin
   CalcEndDate();
   edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.EnableBankInfo(Sender: TObject);
begin
  lbBank.Enabled := (Sender as TDBLookupComboBox).KeyValue = -1;
  DBBanks.Enabled := lbBank.Enabled;
end;

procedure TfmMKBlank.DBBeneficiaryClick(Sender: TObject);
var key : Char;
begin
  EnableBankInfo(Sender);
  edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.SpeedButton1Click(Sender: TObject);
begin
  with ODSReliaseDates do
  try
    Close;
    if (ODSMarks.FieldByName('calcoptions').asInteger = 1)  then
         raise TCalcException.Create('Verilmish avtomobil markasi ucun franshiza yoxdur');
    if trim(edInsOutputYear.Text) = '' then
         raise TOutputYear.Create('Avtomobilin buraxilish ilini daxil edin');
    SetVariable('state', ODSMarks.fieldbyName('state_id').asInteger);
    SetVariable('releaseyear', StrToInt(edInsOutputYear.Text));
    Open;
    ODSMonths.Open;
    ODSFranshiz.Open;
  except
   on E : Exception do
    MessageDlg(E.Message , mtInformation, [mbOK], 0);
  end;
end;

procedure TfmMKBlank.DBMonthsClick(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
  CalcEndDate();
end;

procedure TfmMKBlank.DBMonthsKeyPress(Sender: TObject; var Key: Char);
begin
  edDBCBCustNameKeyPress(Sender, key);
  CalcEndDate();
end;

procedure TfmMKBlank.DBFranshizClick(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
//  edInsFranshiz.text := FloatToStr((Sender as TOracleDataSet).fieldbyName('ammount').asFloat);
end;

procedure TfmMKBlank.DBFranshizKeyPress(Sender: TObject; var Key: Char);
begin
  edDBCBCustNameKeyPress(Sender, key);
//  edInsFranshiz.text := FloatToStr((Sender as TOracleDataSet).fieldbyName('ammount').asFloat);
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmMKBlank,
    Class_fmMKBlank,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

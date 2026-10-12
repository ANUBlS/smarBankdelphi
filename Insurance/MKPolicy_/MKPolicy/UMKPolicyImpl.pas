unit UMKPolicyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MKPolicy_TLB, StdVcl, SBPlgAx50_TLB, ComCtrls, HintBox,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Db, OracleData,
  INSWordExporter, Oracle, Grids, DBGrids, olectnrs, TntStdCtrls;

const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Kasko sigortasi policy: (%s)';
   pDisabled = 6;
   pMaking = 4;
type
  TfmMKPolicy = class(TActiveForm,
                      IfmMKPolicy,
                      IUIObject,
                      IParamInput,
                      ISBPlgAc50BufferForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btPrint: TBitBtn;
    btApply: TBitBtn;
    hbErrMsg: THintBox;
    ODSPolicy: TOracleDataSet;
    ODSPolicyID: TFloatField;
    ODSPolicyTHEFT: TFloatField;
    ODSPolicyFIRE: TFloatField;
    ODSPolicyEXPLOSION: TFloatField;
    ODSPolicyTRAFFICACCIDENT: TFloatField;
    ODSPolicyIMPACTANYOBJECT: TFloatField;
    ODSPolicyNATCATASTROPHE: TFloatField;
    ODSPolicyPOLICYNUM: TStringField;
    DSPolicy: TDataSource;
    DSAvalute: TDataSource;
    INSWordExporter: TINSWordExporter;
    ODSReport: TOracleDataSet;
    ODSReportNAME: TStringField;
    ODSReportADDRESS: TStringField;
    ODSReportINSUREDTYPE: TStringField;
    ODSReportINSUREDCOLOR: TStringField;
    ODSReportINSUREDOUTPUTYEAR: TIntegerField;
    ODSReportINSUREDMODEL: TStringField;
    ODSReportINSUREDSTATENUM: TStringField;
    ODSReportUNDERFRAMENUM: TStringField;
    ODSReportINSUREDBANNUM: TStringField;
    ODSReportINSUREDENGINENUM: TStringField;
    ODSReportDRIVEACCESSPIOPLE: TStringField;
    ODSReportBEGINDATE: TStringField;
    ODSReportENDDATE: TStringField;
    ODSReportPOLICYNUM: TStringField;
    OPCOMMON: TOraclePackage;
    ODSReportLOANACC_ID: TFloatField;
    ODSReportCURRACC_ID: TFloatField;
    ODSReportVALUTE: TStringField;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
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
    SpeedButton1: TSpeedButton;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSReportAGENT: TStringField;
    BitBtn1: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    ODSPolicyUNDERTABLE: TBlobField;
    DSTemplates: TDataSource;
    ODSTemplates: TOracleDataSet;
    ODSTemplatesID: TFloatField;
    ODSTemplatesNAME: TStringField;
    ODSTemplatesTEMPLATE: TBlobField;
    ODSReportACCESSORIESNAME: TStringField;
    ODSReportINSDATE: TStringField;
    OPMKKASCO: TOraclePackage;
    ODSPolicyCID: TFloatField;
    DSCustomers: TDataSource;
    ODSCustomers: TOracleDataSet;
    ODSCustomersID: TIntegerField;
    ODSCustomersINSURED_TYPEID: TIntegerField;
    ODSMotorkasko: TOracleDataSet;
    ODSMotorkaskoID: TFloatField;
    ODSMotorkaskoCID: TFloatField;
    ODSMotorkaskoINSUREDTYPE: TStringField;
    ODSMotorkaskoINSUREDCOLOR: TStringField;
    ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField;
    ODSMotorkaskoINSUREDSTATENUM: TStringField;
    ODSMotorkaskoUNDERFRAMENUM: TStringField;
    ODSMotorkaskoINSUREDBANNUM: TStringField;
    ODSMotorkaskoINSUREDENGINENUM: TStringField;
    ODSMotorkaskoDRIVEINTENDED: TStringField;
    ODSMotorkaskoDRIVECOST: TFloatField;
    ODSMotorkaskoBEGINDATE: TDateTimeField;
    ODSMotorkaskoENDDATE: TDateTimeField;
    ODSMotorkaskoTYPEID: TIntegerField;
    ODSMotorkaskoCLOSE_PREFIX: TIntegerField;
    ODSMotorkaskoBANK_ID: TFloatField;
    ODSMotorkaskoMONTH_ID: TFloatField;
    ODSMotorkaskoINSUREDMARK: TStringField;
    ODSMotorkaskoINSUREDMODEL: TStringField;
    ODSMotorkaskoCLAIM_DATE: TDateTimeField;
    ODSMotorkaskoCLAIM_NUM: TStringField;
    ODSMotorkaskoAREA: TStringField;
    ODSReportBENEFICIARY: TStringField;
    ODSMotorkaskoFRANSHIZ: TFloatField;
    ODSMotorkaskoTARIFF: TFloatField;
    ODSMotorkaskoINSSUMM: TFloatField;
    ODSMotorkaskoAMMOUNT: TFloatField;
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TStringField;
    ODSAvaluteVALU_NAME: TStringField;
    ODSAvaluteVALU_SHORT: TStringField;
    ODSCustomersNAME: TStringField;
    ODSContractsBENEFICIARY: TStringField;
    ODSReportSEX: TIntegerField;
    ODSReportDRIVECOST: TFloatField;
    ODSReportINSURANCESUM: TFloatField;
    ODSReportTHEFT: TFloatField;
    ODSReportFIRE: TFloatField;
    ODSReportEXPLOSION: TFloatField;
    ODSReportTRAFFICACCIDENT: TFloatField;
    ODSReportIMPACTANYOBJECT: TFloatField;
    ODSReportINSURANCEAMMOUNT: TFloatField;
    ODSMotorkaskoNUMSEATS: TStringField;
    lbNonUnicode: TListBox;
    tlbUnicode: TTntListBox;
    ODSAvtoIntend: TOracleDataSet;
    ODSAvtoIntendID: TFloatField;
    ODSAvtoIntendNAME: TStringField;
    ODSReportDRIVEINTENDED: TStringField;
    ODSReportavtointend: TStringField;
    ODSReportCONDITIONS: TStringField;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure btApplyClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ODSContractsAfterEdit(DataSet: TDataSet);
    procedure ODSPolicyAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    FParams : TStrings;
    FOwnerHandle : Integer;

    tid:real;
    FEvents: IfmMKPolicyEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function  SaveData():Boolean;
    procedure ExportToWord();
    function  AddTransh():Boolean;
    procedure DisableControls(ControlName : TCustomControl; disable : boolean = true);

    procedure MakeExtras(wrdDataDoc: Variant);
    procedure FillRow(Doc : Variant; Row : Integer;
                 Text0,Text1,Text2,Text3,Text4 : String);
    procedure FillRow1(Doc : Variant; Row : Integer;
                 Text0,Text1,Text2: String);
    function UTFEncoder(str:WideString):WideString;

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
////////////////////////////////////////////////////////
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
    CID : Integer;
    { Public declarations }
    procedure Initialize; override;
  end;
var
  fmMKPolicy : TfmMKPolicy;
implementation

uses ComObj, ComServ, sboapiDataModuleImpl, UUnderTable, UProceses;

{$R *.DFM}

{ TfmMKPolicy }

procedure TfmMKPolicy.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmMKPolicyPage); }
end;

procedure TfmMKPolicy.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmMKPolicyEvents;
end;

procedure TfmMKPolicy.Initialize;
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

function TfmMKPolicy.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmMKPolicy.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmMKPolicy.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmMKPolicy.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmMKPolicy.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmMKPolicy.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmMKPolicy.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmMKPolicy.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmMKPolicy.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmMKPolicy.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmMKPolicy.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmMKPolicy.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmMKPolicy.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmMKPolicy.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmMKPolicy.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmMKPolicy.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmMKPolicy.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmMKPolicy.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmMKPolicy._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMKPolicy.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmMKPolicy.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmMKPolicy.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmMKPolicy.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmMKPolicy.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmMKPolicy.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmMKPolicy.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmMKPolicy.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmMKPolicy.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmMKPolicy.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmMKPolicy.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmMKPolicy.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmMKPolicy.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmMKPolicy.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmMKPolicy.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmMKPolicy.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmMKPolicy.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmMKPolicy.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMKPolicy.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmMKPolicy.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmMKPolicy.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmMKPolicy.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmMKPolicy.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmMKPolicy.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TfmMKPolicy.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TfmMKPolicy.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TfmMKPolicy.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TfmMKPolicy.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TfmMKPolicy.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TfmMKPolicy.Cleanup: HResult;
begin
  Result := S_OK;
end;

procedure TfmMKPolicy.DisableControls(ControlName : TCustomControl; disable : boolean = true);

  procedure DisableControl(CName : TCustomControl);
  var i : Integer;
  begin
    with CName do
      for i := 0 to ControlCount -1 do begin
        if (Controls[i] is TCustomControl) then
          DisableControl(Controls[i] as TCustomControl);
        Controls[i].Enabled := disable;

      end
  end;

begin

  if OPCOMMON.CallIntegerFunction('disablepolicies', []) = 0 then
    Exit;

  DisableControl(ControlName);

  btApply.Enabled := Disable;
  btOk.Enabled := Disable;
  btPrint.Enabled := Disable;
end;

function TfmMKPolicy.UIObjectActivate: HResult;
begin
       CID := StrToInt(Get_Params('CID'));
       ODSTemplates.Open;
       with ODSContracts do begin
          SetVariable('CID', CID);
          Open;
          ODSCustomers.SetVariable('kli_id',ODSContractsKli_id.AsInteger);
          ODSCustomers.Open;
          tid:=FieldByName('TYPE_ID').asInteger;
          Edit;
       end;
       ODSMotorKasko.SetVariable('cid',cid);
       ODSMotorKasko.Open;
       ODSPolicy.SetVariable('CID', CID);
       ODSPolicy.Open;
       if ODSPolicy.isEmpty then begin   //-----Insert mod
         ODSPolicy.Insert;
//         ODSContracts.FieldByName('POLICY_NUM').AsString :=
//            OPCommon.callStringFunction('generatePolicy_Num',[tid]);
         with ODSPolicy do begin
           Fieldbyname('CID').AsInteger := CID; 
           Fieldbyname('THEFT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('FIRE').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('EXPLOSION').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('TRAFFICACCIDENT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('IMPACTANYOBJECT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
         end;
         Caption := format(fmCaption, ['Yeni policy']);
       end
       else begin  //-----Edit mod
         btPrint.Enabled := True;
         ODSPolicy.Edit;
       //-----------Disable controls -------------
       with OPCOMMON do
         if CallIntegerFunction('get_state',[CID]) = pDisabled {is disable?} then
           DisableControls(GroupBox1, false);

         with ODSPolicy do
         begin
           Fieldbyname('CID').AsInteger := CID;
          { if not ODSCustomersInsured_TypeID.Value<>1 then
           begin }
        //   ShowMessage(FloatToStr(ODSCustomersInsured_TypeID.Value));
           Fieldbyname('THEFT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('FIRE').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('EXPLOSION').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('TRAFFICACCIDENT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
           Fieldbyname('IMPACTANYOBJECT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;    
         end;
         Caption := format(fmCaption, ['Redakte']);
       end;

  Result := S_OK;
end;

function TfmMKPolicy.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMKPolicy.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMKPolicy.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TfmMKPolicy.Get_Height : Integer;
begin
  Result := Height;
end;

function  TfmMKPolicy.Get_Width  : Integer;
begin
  Result := Width;
end;

function TfmMKPolicy.SaveData():Boolean;
var
  res : boolean;
begin

{  with ODSPolicy do
  if State in [dsInsert] then begin
    ODSContracts.FieldByName('POLICY_NUM').AsString :=
          OPCommon.callStringFunction('generatePolicy_Num',[tid]);
  end;
}
  res := False;
  try
    with ODSPolicy do
     if State in [dsEdit, dsInsert] then begin
      Post;
      RefreshRecord();
    end;

    with ODSContracts do
     if State in [dsEdit, dsInsert] then begin
      Post;
      RefreshRecord();
    end;
    OPCOMMON.CallBooleanFunction('change_state', [CID, pMaking]);
    res := True;
  finally
    btPrint.Enabled := res;
    btApply.Enabled := not res;
  end;
  Result := res;

try
 if not res then RaiseLastWin32Error;
except
 on E: Exception do
  hbErrMsg.ShowMessage(E.Message);
end; 
end;

procedure TfmMKPolicy.btOkClick(Sender: TObject);
begin
  if SaveData() then
    PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TfmMKPolicy.btCancelClick(Sender: TObject);
begin
    PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TfmMKPolicy.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end
  else btApply.Enabled := True;
end;

procedure TfmMKPolicy.btApplyClick(Sender: TObject);
begin
  SaveData()

end;

procedure TfmMKPolicy.ActiveFormCreate(Sender: TObject);
begin
  fmMKPolicy := Self;
  FParams := TStringList.Create;
end;

procedure TfmMKPolicy.ExportToWord();
const
    months : array [1..12] of String = ('Йанвар', 'Феврал', 'Март', 'Апрел', 'Май', 'Ийун',
                                         'Ийул', 'Август', 'Сентйабр', 'Октйабр', 'Нойабр', 'Декабр');
var
  DocFile : TFileName;
  i,n,j: integer;

  WordApp:OleVariant;
  wrdDataDoc,wrdApp,wrdSelection : Variant;
  FileName,str,StrIntend:String;
begin      
   ODSAValute.Locate('valute',ODSContractsValute_ID.Value,[]);
   ODSContracts.Close;
   ODSContracts.SetVariable('CID', CID);
   ODSContracts.Open;              
   if ODSCustomersInsured_TypeID.Value<>3 then
   begin
        FileName:=ExtractFilePath(Application.ExeName)+ '\KaskoPolicyEmpty1.doc';
        wrdApp := CreateOleObject('Word.Application');
        wrdApp.Visible := True;
        wrdDataDoc := wrdApp.Documents.Open(FileName);
        wrdSelection:=wrdApp.Selection;

        ODSReport.Close;
        ODSReport.SetVariable('CID', CID);
        ODSReport.Open;

        StrIntend:=ODSReportAvtoIntend.AsString;
        if Pos(',',StrIntend)>0 then
           StrIntend:=Copy(StrIntend,0,Pos(',',StrIntend)-1);
        if ODSReportSex.Value=0 then str:='оьлу'
           else if ODSReportSex.Value=1 then str:='гызы';
        for i:=0 to ODSReport.FieldCount-4 do
        begin
          try
            wrdSelection.GoTo(-1,unAssigned,unAssigned,lowercase(ODSReport.fields[i].DisplayName));
            wrdSelection.TypeText(UTFEncoder(VarToStr( ODSReport.fields[i].AsVariant )));
          except
          end;
        end;
        try
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'name2');
        wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(ODSReportName.Value)));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'str');
        wrdSelection.TypeText(UTFEncoder(str));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'intend');
        wrdSelection.TypeText(UTFEncoder(StrIntend));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'str1');
        wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(str)));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'beneficiary1');
        wrdSelection.TypeText(UTFEncoder('вя сыьорта етдирян'));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'beneficiary2');
        wrdSelection.TypeText(UTFEncoder(ODSReportBeneficiary.Value));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'date');
        wrdSelection.TypeText(UTFEncoder(ODSReportBeginDate.AsString));
        wrdSelection.GoTo(-1,unAssigned,unAssigned,'date1');
        wrdSelection.TypeText(UTFEncoder(ODSReportInsDate.AsString));

        wrdSelection.GoTo(-1,unAssigned,unAssigned,'cond');
        wrdSelection.TypeText(UTFEncoder(ODSReportConditions.AsString));

        except
        end;
        {INSWordExporter.FileName:=FileName;
        INSWordExporter.Open(false);
        INSWordExporter.WordSearch('undertable');
        INSWordExporter.Show;
         ShowMessage('sd');
        with fmUndertable do begin
        fmUndertable.Show;
        OleContainer1.OleObject.Application.Selection.WholeStory;
        OleContainer1.OleObject.Application.Selection.Copy;
        fmUndertable.Free;
      end;
      INSWordExporter.Paste;  }
  end
     else
  begin

      FileName:=ExtractFilePath(Application.ExeName)+ '\CMotorKaskoPolicy.doc';
      wrdApp := CreateOleObject('Word.Application');
      wrdApp.Visible := True;
      wrdDataDoc := wrdApp.Documents.Open(FileName);
      wrdSelection:=wrdApp.Selection;

      ODSReport.Close;
      ODSReport.SetVariable('CID', CID);
      ODSReport.Open;

      if ODSReportSex.Value=0 then str:='оьлу'
         else str:='гызы';
      try
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'str');
         wrdSelection.TypeText(UTFEncoder(str));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'str1');
         wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(str)));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'policynum');
         wrdSelection.TypeText(UTFEncoder(ODSReportPolicyNum.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'agent');
         wrdSelection.TypeText(UTFEncoder(ODSReportAgent.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'insured');
         wrdSelection.TypeText(UTFEncoder(ODSReportName.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'insured1');
         wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(ODSReportName.AsString)));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'insuredaddress');
         wrdSelection.TypeText(UTFEncoder(ODSReportAddress.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'beneficiary');
         wrdSelection.TypeText(UTFEncoder(ODSReportBeneficiary.AsString));
         if ODSCustomersInsured_TypeID.Value=3 then
            wrdSelection.GoTo(-1,unAssigned,unAssigned,'beneficiary1');
            wrdSelection.TypeText(UTFEncoder('вя сыьорта етдирян'));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'begindate');
         wrdSelection.TypeText(UTFEncoder(ODSReportBeginDate.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'begindate1');
         wrdSelection.TypeText(UTFEncoder(ODSReportBeginDate.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'begindate2');
         wrdSelection.TypeText(UTFEncoder(ODSReportBeginDate.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'enddate');
         wrdSelection.TypeText(UTFEncoder(ODSReportEndDate.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'allinssum');
         wrdSelection.TypeText(UTFEncoder(ODSContractsInssumm.AsString));
         wrdSelection.GoTo(-1,unAssigned,unAssigned,'allinscost');
         wrdSelection.TypeText(UTFEncoder(ODSContractsAmmount.AsString));
       except
       end;


     FileName:=ExtractFilePath(Application.ExeName)+ '\CMotorKaskoPolicyExra.doc';
     wrdApp := CreateOleObject('Word.Application');
     wrdApp.Visible := True;
     wrdDataDoc := wrdApp.Documents.Open(FileName);
     wrdSelection:=wrdApp.Selection;
     wrdSelection.GoTo(-1,unAssigned,unAssigned,'policynum');
     wrdSelection.Font.Name := 'Times New Roman';
     wrdSelection.Font.Size :=14;
     wrdSelection.Font.Bold:=true;
     wrdSelection.TypeText(UTFEncoder(ODSContractsPolicy_Num.AsString));

     wrdSelection.GoTo(-1,unAssigned,unAssigned,'insured');
     wrdSelection.Font.Size :=8;
     wrdSelection.Font.Bold:=true;
     wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(ODSCustomersName.AsString)));

     wrdSelection.GoTo(-1,unAssigned,unAssigned,'str');
     wrdSelection.Font.Size :=8;
     wrdSelection.Font.Bold:=true;
     wrdSelection.TypeText(UTFEncoder(AnsiUpperCase(str)));

     wrdSelection.GoTo(-1,unAssigned,unAssigned,'date1');
     wrdSelection.Font.Size :=8;
     wrdSelection.Font.Bold:=true;
     wrdSelection.TypeText(UTFEncoder(ODSReportBeginDate.AsString));

     MakeExtras(wrdDataDoc);
  end;

end;

function TfmMKPolicy.AddTransh():Boolean;
begin
   with TfmProceses.Create(Self) do
   try
     Result := ShowModal = mrOk
   finally
     Free
   end
end;

procedure TfmMKPolicy.btPrintClick(Sender: TObject);
begin
  if  MessageDlg('Emeliyyat aparilsin?', mtConfirmation	, [mbYes, mbNo], 0) = mrYes then
    if SaveData() then
    if  AddTransh() then begin
//       if not (ODSPolicy.state in [dsEdit, dsInsert]) then ODSPolicy.Edit;
       ExportToWord();
       DisableControls(GroupBox1, false);
    end;

end;

procedure TfmMKPolicy.SpeedButton1Click(Sender: TObject);
begin
   ODSContracts.FieldByName('POLICY_NUM').AsString :=
       OPCommon.callStringFunction('generatePolicy_Num',[tid]);
   btApply.Enabled := True;
end;

procedure TfmMKPolicy.BitBtn1Click(Sender: TObject);
begin
{ with TfmUndertable.Create(Self) do
 try
   ShowModal;
 finally
   free;
 end;}
 fmUndertable := TfmUndertable.Create(Self);
 fmUndertable.ShowModal;
 fmUndertable.Free;

end;

procedure TfmMKPolicy.ODSContractsAfterEdit(DataSet: TDataSet);
begin
  btApply.Enabled := True;
end;

procedure TfmMKPolicy.ODSPolicyAfterEdit(DataSet: TDataSet);
begin
    btApply.Enabled := True;
end;

procedure TfmMKPolicy.FillRow(Doc: Variant; Row: Integer; Text0, Text1,
  Text2, Text3, Text4: String);
begin
     Doc.Tables.Item(1).Cell(Row,1).Range.InsertAfter(Text0);
     Doc.Tables.Item(1).Cell(Row,2).Range.InsertAfter(Text1);
     Doc.Tables.Item(1).Cell(Row,3).Range.InsertAfter(Text2);
     Doc.Tables.Item(1).Cell(Row,4).Range.InsertAfter(Text3);
     Doc.Tables.Item(1).Cell(Row,5).Range.InsertAfter(Text4);
end;

procedure TfmMKPolicy.MakeExtras(wrdDataDoc: Variant);
var
    i,n:integer;
    str:WideString;
begin
    with ODSMotorKasko do
    begin
        n:=RecordCount;
        First;
        for i:= 1 to n do
        begin
            wrdDataDoc.Tables.Item(1).Rows.Add;
            wrdDataDoc.Tables.Item(1).Rows.Item(i+1).Range.Font.Name := 'Arial AzLat';
            wrdDataDoc.Tables.Item(1).Rows.Item(i+1).Range.Bold:=false;
            FillRow(wrdDataDoc, i+1,ODSMotorKaskoInsuredMark.AsString+' '+ODSMotorKaskoInsuredModel.AsString,ODSMotorKaskoInsuredColor.AsString+', '+ODSMotorKaskoInsuredType.AsString+','+IntToStr(ODSMotorKaskoInsuredOutputYear.Value),ODSMotorKaskoInsuredEngineNum.AsString,ODSMotorKaskoInsuredBanNum.AsString,ODSMotorKaskoInsuredStateNum.AsString);

            wrdDataDoc.Tables.Item(2).Rows.Add;
            wrdDataDoc.Tables.Item(2).Rows.Item(i+1).Range.Font.Name := 'Arial AzLat';
            wrdDataDoc.Tables.Item(2).Rows.Item(i+1).Range.Bold:=false;
            FillRow1(wrdDataDoc,i+1,ODSMotorKaskoFranshiz.AsString+' '+ODSAvaluteVal_Name.Value,ODSMotorKaskoInssumm.AsString+' '+ODSAvaluteVal_Name.Value,ODSMotorKaskoAmmount.AsString+' '+ODSAvaluteVal_Name.Value);
            Next;
        end;
    end;

end;

procedure TfmMKPolicy.FillRow1(Doc: Variant; Row: Integer; Text0, Text1,Text2: String);
begin
    Doc.Tables.Item(2).Cell(Row,1).Range.InsertAfter(Text0);
    Doc.Tables.Item(2).Cell(Row,2).Range.InsertAfter(Text1);
    Doc.Tables.Item(2).Cell(Row,3).Range.InsertAfter(Text2);
end;

function TfmMKPolicy.UTFEncoder(str: WideString): WideString;
var
   i,j:integer;
begin
   for i:=1 to length(str) do
   begin
       for j:=0 to lbNonUnicode.Items.Count-1 do
       begin
           if str[i]=lbNonUnicode.Items[j] then
              str[i]:=tlbUnicode.Items[j][1];
       end;
   end;
   result:=str;
end;



initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmMKPolicy,
    Class_fmMKPolicy,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

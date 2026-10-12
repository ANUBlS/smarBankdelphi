unit UMKPolicyImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MKPolicy_TLB, StdVcl, SBPlgAx50_TLB, ComCtrls, HintBox,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Db, OracleData,
  INSWordExporter, Oracle;

const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Kasko sigortasi policy: (%s)';
   pDisabled = 1;
   pEnabled = 0;
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
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btPrint: TBitBtn;
    btApply: TBitBtn;
    hbErrMsg: THintBox;
    ODSPolicy: TOracleDataSet;
    ODSPolicyID: TFloatField;
    ODSPolicyMKS_ID: TFloatField;
    ODSPolicyVAL_ID: TFloatField;
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
    ODSReportPROFITNAME: TStringField;
    ODSReportINSUREDTYPE: TStringField;
    ODSReportINSUREDCOLOR: TStringField;
    ODSReportINSUREDOUTPUTYEAR: TIntegerField;
    ODSReportINSUREDMODEL: TStringField;
    ODSReportINSUREDSTATENUM: TStringField;
    ODSReportUNDERFRAMENUM: TStringField;
    ODSReportINSUREDBANNUM: TStringField;
    ODSReportINSUREDENGINENUM: TStringField;
    ODSReportDRIVEACCESSPIOPLE: TStringField;
    ODSReportDRIVECOST: TFloatField;
    ODSReportINSURANCESUM: TFloatField;
    ODSReportBEGINDATE: TStringField;
    ODSReportBEGINDATE2: TStringField;
    ODSReportBEGINDATE3: TStringField;
    ODSReportBEGINDATE4: TStringField;
    ODSReportENDDATE: TStringField;
    ODSReportPOLICYNUM: TStringField;
    ODSReportTHEFT: TFloatField;
    ODSReportFIRE: TFloatField;
    ODSReportEXPLOSION: TFloatField;
    ODSReportTRAFFICACCIDENT: TFloatField;
    ODSReportIMPACTANYOBJECT: TFloatField;
    ODSReportNATCATASTROPHE: TFloatField;
    ODSReportINSURANCEAMMOUNT: TFloatField;
    ODSReportINSURANCEAMMOUNT2: TFloatField;
    OPCOMMON: TOraclePackage;
    ODSReportLOANACC_ID: TFloatField;
    ODSReportCURRACC_ID: TFloatField;
    ODSReportVALUTE: TStringField;
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
    ODSPolicyENABLED: TIntegerField;
    SpeedButton1: TSpeedButton;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure btApplyClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FParams : TStrings;
    FOwnerHandle : Integer;
    ID : Integer;
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
    procedure DisableControls(ControlName : TWinControl; disable : boolean = true);
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
    { Public declarations }
    procedure Initialize; override;
  end;
var
  fmMKPolicy : TfmMKPolicy;
implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

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

procedure TfmMKPolicy.DisableControls(ControlName : TWinControl; disable : boolean = true);
var i : Integer;
begin

  if OPCOMMON.CallIntegerFunction('disablepolicies', []) = pEnabled then
    Exit;

  with ControlName do
    for i := 0 to ControlCount -1 do
       Controls[i].Enabled := Disable;
  btPrint.Enabled := Disable; 
end;

function TfmMKPolicy.UIObjectActivate: HResult;
begin
       id := StrToInt(Get_Params('MKS_ID'));
//       ODSCusts.SetVariable('id',StrToInt(Get_Params('KLI_ID')));
//       ODSCusts.Open;
//       ODSAvalute.open;
       ODSContracts.SetVariable('suggid', id);
       ODSContracts.Open;
       tid:=ODSContractsType_ID.value;
       ODSContracts.Edit;
       ODSPolicy.SetVariable('MKS_ID', id);
       ODSPolicy.Open;
       if ODSPolicy.isEmpty then begin   //-----Insert mod
         ODSPolicy.Insert;
         ODSContracts.FieldByName('POLICY_NUM').AsString :=
            OPCommon.callStringFunction('generatePolicy_Num',[tid]);
         Caption := format(fmCaption, ['Yeni policy']);
       end
       else begin  //-----Edit mod
         btPrint.Enabled := True;
         if Integer(ODSPolicyENABLED.Value) = pEnabled then
           ODSPolicy.Edit
         else
           DisableControls(GroupBox1, false);
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
begin

  with ODSPolicy do
  if State in [dsEdit, dsInsert] then begin
    FieldByName('MKS_ID').asFloat := id;
    Post;
    RefreshRecord();
  end;

  with ODSContracts do
  if State in [dsEdit, dsInsert] then begin
     FieldByName('policy_id').asFloat := ODSPolicy.FieldByName('id').asFloat;
     Post;
     RefreshRecord();
  end;

  Result := True;
end;

procedure TfmMKPolicy.btOkClick(Sender: TObject);
begin
  if SaveData() then
    PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TfmMKPolicy.btCancelClick(Sender: TObject);
begin
  if SaveData() then
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
  if SaveData() then
  begin
    btPrint.Enabled := True;
    btApply.Enabled := False;
  end;
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
//  day, month, year : word;
  i : integer;
begin
  try
    DocFile := ExtractFilePath(Application.ExeName)+'\KaskoPolicy.doc';
    with INSWordExporter, ODSReport do begin
      FileName := DocFile;
      INSWordExporter.Open(False);
      SetVariable('mks_id', id);
      ODSReport.Open;
      for i:=0 to FieldCount-3 do
        SetBookmark(lowercase(fields[i].DisplayName), VarToStr( fields[i].AsVariant ),
              False, False, False, False, 10, 'Arial AzLat', False);
//      SetBookmark('valute', ODSAvaluteVAL_NAME.Value,
//              False, False, False, False, 10, 'Arial AzLat', False);
      Show;
      INSWordExporter.Close;
      Close;
    end;
  except
    // INSWordExporter.Show;
    Raise;
  end;

end;

function TfmMKPolicy.AddTransh():Boolean;
begin
   Result := False;
    with ODSReport, OPCOMMON do begin
      ODSReport.SetVariable('mks_id', id);
      Open;
      CallIntegerFunction('addtransaction', [
                      FieldByName('LOANACC_ID').asFloat,
                      FieldByName('CURRACC_ID').asFloat,
                      FieldByName('INSURANCEAMMOUNT').asFloat]);
      MessageDlg('Emeliyyat kecirildi.', mtInformation, [mbOK], 0);
      Close;
      Result := True;
    end;
end;

procedure TfmMKPolicy.btPrintClick(Sender: TObject);
begin
  if  MessageDlg('Emeliyyat aparilsin?', mtConfirmation	, [mbYes, mbNo], 0) = mrYes then
    if  AddTransh() then begin
       if not (ODSPolicy.state in [dsEdit, dsInsert]) then ODSPolicy.Edit;
       ODSPolicy.Fieldbyname('ENABLED').asInteger := pDisabled;
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

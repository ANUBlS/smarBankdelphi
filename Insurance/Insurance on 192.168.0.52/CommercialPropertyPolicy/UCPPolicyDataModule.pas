unit UCPPolicyDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, PCPropertyPolicy_TLB, StdVcl, INSWordExporter, StdCtrls,
  Buttons, Mask, DBCtrls, ExtCtrls,SBPlgAx50_TLB,db;

const
     WM_ModalResult = WM_USER+139;
     fmCaption = 'Policy: (%s)';

type
  TCPropertyPolicy = class(TActiveForm, ICPropertyPolicy,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    Panel2: TPanel;
    Label4: TLabel;
    ENum: TDBEdit;
    Panel1: TPanel;
    btPrint: TBitBtn;
    btApply: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PolicyExporter: TINSWordExporter;
    procedure ActiveFormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure ENumChange(Sender: TObject);
    procedure ENumKeyPress(Sender: TObject; var Key: Char);
    procedure btPrintClick(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    tid:integer;
    FParams: TStrings;
    FOwnerHandle : Integer;

    FEvents: ICPropertyPolicyEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    procedure AddTransh;
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
     CPropertyPolicy:TCPropertyPolicy;

implementation

uses ComObj, ComServ, UCPropertyPolicy;

{$R *.DFM}

{ TCPropertyPolicy }

procedure TCPropertyPolicy.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CPropertyPolicyPage); }
end;

procedure TCPropertyPolicy.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICPropertyPolicyEvents;
end;

procedure TCPropertyPolicy.Initialize;
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

function TCPropertyPolicy.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCPropertyPolicy.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCPropertyPolicy.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCPropertyPolicy.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCPropertyPolicy.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCPropertyPolicy.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCPropertyPolicy.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCPropertyPolicy.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCPropertyPolicy.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCPropertyPolicy.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCPropertyPolicy.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCPropertyPolicy.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCPropertyPolicy.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCPropertyPolicy.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCPropertyPolicy.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCPropertyPolicy.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCPropertyPolicy.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCPropertyPolicy.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCPropertyPolicy._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCPropertyPolicy.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCPropertyPolicy.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCPropertyPolicy.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCPropertyPolicy.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCPropertyPolicy.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCPropertyPolicy.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCPropertyPolicy.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCPropertyPolicy.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCPropertyPolicy.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCPropertyPolicy.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCPropertyPolicy.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCPropertyPolicy.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCPropertyPolicy.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCPropertyPolicy.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCPropertyPolicy.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCPropertyPolicy.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCPropertyPolicy.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCPropertyPolicy.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCPropertyPolicy.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCPropertyPolicy.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCPropertyPolicy.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCPropertyPolicy.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCPropertyPolicy.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCPropertyPolicy.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TCPropertyPolicy.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TCPropertyPolicy.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TCPropertyPolicy.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TCPropertyPolicy.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TCPropertyPolicy.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TCPropertyPolicy.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TCPropertyPolicy.UIObjectActivate: HResult;
begin
      id := StrToInt(Get_Params('id'));  
      with PolicyDataModule do
      begin
           ODSCProperty.Close;
           ODSCProperty.SetVariable('id',id);
           ODSCProperty.Open;
           ODSCustomers.Close;
           ODSCustomers.SetVariable('id',ODSCPropertykli_id.Value);
           ODSCustomers.Open;
           ODSContracts.Close;
           ODSContracts.SetVariable('blankid',ODSCPropertyId.value);
           ODSContracts.Open;
           ODSCPropertySuggest.Close;
           ODSCPropertySuggest.SetVariable('BID',StrToInt(Get_Params('id')));
           ODSCPropertySuggest.Open;
           tid:=ODSCPropertyTypeID.Value;
           if ODSContractsPolicy_Num.IsNull then
           begin
              ODSContracts.Close;
              ODSContracts.SetVariable('blankid',ODSCPropertyId.value);
              ODSContracts.Open;
              ODSContracts.Edit;
              Caption := format(fmCaption, ['Elave']);
              btPrint.Enabled:=false;
           end
           else
           begin
              ODSContracts.Edit;
              Caption := format(fmCaption, ['Redakte']);
              btPrint.Enabled:=true;
           end;
      end;
      Result := S_OK;
end;

function TCPropertyPolicy.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TCPropertyPolicy.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TCPropertyPolicy.SaveState: HResult;
begin
  Result := S_OK;
end;

function TCPropertyPolicy.Get_Height : Integer;
begin
  Result := Height;
end;

function TCPropertyPolicy.Get_Width  : Integer;
begin
  Result := Width;
end;


procedure TCPropertyPolicy.ActiveFormCreate(Sender: TObject);
begin
     CPropertyPolicy:=Self;
     FParams := TStringList.Create;
     PolicyDataModule:=TPolicyDataModule.Create(Self);
end;

procedure TCPropertyPolicy.BitBtn2Click(Sender: TObject);
begin
     PostMessage(FOwnerHandle, WM_ModalResult, mrCancel, 0);
end;

procedure TCPropertyPolicy.BitBtn1Click(Sender: TObject);
begin
     with PolicyDataModule,ODSContracts do
     if State in [dsEdit, dsInsert] then
     begin
        if ODSContractsPolicy_Num.IsNull then
        FieldByName('POLICY_NUM').AsString:=OPCommon.callStringFunction('generatePolicy_Num',[tid]);
        Post;
     end;
     PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TCPropertyPolicy.btApplyClick(Sender: TObject);
begin
     with PolicyDataModule,ODSContracts do
     if State in [dsEdit, dsInsert] then
     begin
        if ODSContractsPolicy_Num.IsNull then
        FieldByName('POLICY_NUM').AsString:=OPCommon.callStringFunction('generatePolicy_Num',[tid]);
        Post;
        RefreshRecord();
     end;
     btApply.Enabled:=false;
     btPrint.Enabled:=true;
end;

procedure TCPropertyPolicy.ENumChange(Sender: TObject);
begin
      btApply.Enabled:=true;
end;

procedure TCPropertyPolicy.ENumKeyPress(Sender: TObject; var Key: Char);
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

procedure TCPropertyPolicy.AddTransh;
begin
      with PolicyDataModule do begin
      ODSContracts.Close;
      ODSContracts.SetVariable('blankid',ODSCPropertyID.Value);
      ODSContracts.Open;
      if OPCOMMON.CallIntegerFunction('addtransaction', [
                      ODSContracts.FieldByName('LOANACC_ID').asFloat,
                      ODSContracts.FieldByName('CURRACC_ID').asFloat,
                      ODSContracts.FieldByName('AMMOUNT').asFloat]) > 0 then
      MessageDlg('ям€лиййат кечирилди.', mtInformation, [mbOK], 0);
      Close;
    end;
end;

procedure TCPropertyPolicy.btPrintClick(Sender: TObject);
begin
     if  MessageDlg('ям€лиййат апарылсын?', mtConfirmation	, [mbYes, mbNo], 0) = mrYes then
     AddTransh();
     with PolicyDataModule do
     begin
       ODSCondition.Close;
       ODSCondition.SetVariable('vid',ODSCPropertySuggestCNDT_ID.Value);
       ODSCondition.Open;
       Franshiz.Close;
       Franshiz.SetVariable('fid',ODSCPropertySuggestFRZ_ID.Value);
       Franshiz.Open;
       ODSBeneficiary.Locate('id',ODSCPropertyPROFITID.Value,[]);
       ODSRisks.Close;
       ODSRisks.SetVariable('id',ODSCPropertyRiskId.value);
       ODSRisks.Open;
       ODSAgent.Locate('id',ODSCPropertyAgentid.Value,[]);
       try
          with PolicyExporter do
          begin
               FileName:=ExtractFilePath(Application.ExeName)+ '\cpropertypolicy.doc';
               Open(False);
               SetBookmark('Policynum',ODSContractsPolicy_num.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Policynum1',ODSContractsPolicy_num.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Agent',ODSAgentName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Insured',ODSCustomersName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Beneficiary',ODSBeneficiaryName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('IRisks',ODSRisksName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Insperiod',DateToStr(ODSContractsBegin_date.value)+' - '+DateToStr(ODSContractsEnd_date.value), false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Inssum',FloatToStr(ODSCPropertySuggestInsurancesum.value), false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Inspremium',CurrToStr(ODSCONtractsAmmount.value), false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Franshiz',FranshizName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Condt',ODSConditionName.value, false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Instime',DateToStr(ODSCPropertySuggestEndDate.value), false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Instime1',DateToStr(ODSCPropertySuggestEndDate.value), false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('Insured1',ODSCustomersName.value, false, false, False, false, 9, 'Arial AzLat', False);
        end;
    finally
        PolicyExporter.Show;
    end;
    end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCPropertyPolicy,
    Class_CPropertyPolicy,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

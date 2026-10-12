unit UMKBlank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MKBlank_TLB, StdVcl, StdCtrls, DBCtrls, Mask, Buttons,
  ExtCtrls, Db, OracleData, SBPlgAx50_TLB, Oracle, DBViewComboBox, HintBox,
  CurrencyEdit, ComCtrls, PlgModalContainer, Grids, DBGrids;

const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Kasko sigortasi anket formasi: (%s)';
   pBlankDone = 1;
type
  TConversionExcept = Exception;
  TCalcException = Exception;
  TOutputYear = Exception;

  TfmMKBlank = class(
             TActiveForm,
             IfmMKBlank,
             IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    Panel1: TPanel;
    btOk: TBitBtn;
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
    GroupBox5: TGroupBox;
    lbBeginDate: TLabel;
    lbEndDate: TLabel;
    hbErrMsg: THintBox;
    edBeginDate: TDateTimePicker;
    edEndDate: TDateTimePicker;
    btSuggestion: TBitBtn;
    btApply: TBitBtn;
    pmcSuggestion: TPlgModalContainer;
    Label1: TLabel;
    DBCBCustName: TDBLookupComboBox;
    Label2: TLabel;
    DBInsMarks: TDBLookupComboBox;
    Label3: TLabel;
    lbBank: TLabel;
    DBBanks: TDBLookupComboBox;
    DBMonths: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    lbDrIntend: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    gdDrAccessPeople: TDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    dbBeneficiary: TDBEdit;
    edInsOutputYear: TDBComboBox;
    edInsType: TDBEdit;
    edInsBanNum: TDBEdit;
    edInsColor: TDBEdit;
    edInsStateNum: TDBEdit;
    edInsEngineNum: TDBEdit;
    edUnderframeNum: TDBEdit;
    edDrIntend: TDBComboBox;
    cbBenType: TDBLookupComboBox;
    DBInsModels: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    dbAvalute: TDBLookupComboBox;
    edDriveCost: TDBEdit;
    lbDriveCost: TLabel;
    edInsSumm: TDBEdit;
    lbInsSumm: TLabel;
    lbFranshiz: TLabel;
    edFranshiz: TDBComboBox;
    lbTariff: TLabel;
    edTariff: TDBEdit;
    Label10: TLabel;
    edAmmount: TDBEdit;
    SpeedButton7: TSpeedButton;
    Label4: TLabel;
    DBAgents: TDBLookupComboBox;
    procedure btOkClick(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edDBCBCustNameChange(Sender: TObject);
    procedure edDBCBCustNameKeyPress(Sender: TObject; var Key: Char);
    procedure btApplyClick(Sender: TObject);
    procedure btSuggestionClick(Sender: TObject);
    procedure edDrIntendChange(Sender: TObject);
    procedure edBeginDateChange(Sender: TObject);
    procedure DBBentypeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBMonthsClick(Sender: TObject);
    procedure DBMonthsKeyPress(Sender: TObject; var Key: Char);
    procedure DBFranshizClick(Sender: TObject);
    procedure DBFranshizKeyPress(Sender: TObject; var Key: Char);
    procedure edFranshizClick(Sender: TObject);
    procedure ODSFranshizAfterOpen(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ODSdrAccessPeopleAfterInsert(DataSet: TDataSet);
    procedure ODSdrAccessPeopleBeforePost(DataSet: TDataSet);
    procedure ODSdrAccessPeopleBeforeDelete(DataSet: TDataSet);
    procedure cbBenTypeChange(Sender: TObject);
    procedure DBBanksClick(Sender: TObject);
    procedure DBBanksKeyPress(Sender: TObject; var Key: Char);
    procedure cbBenTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edFranshizChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
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
    function  AssignVariables(Valname : String; Value : Variant;
                                      Valtype:Integer; var Varbl:Variant):Integer;
    procedure CalcMonth();
    procedure CalcEndDate();
    procedure DisableControls(ControlName : TCustomControl; disable : boolean = true);
    procedure MakeFranshizList();
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
    CID : Integer;
    procedure Initialize; override;
  end;

var
  fmMKBlank : TfmMKBlank;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl, UMKDataMod;

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

procedure TfmMKBlank.DisableControls(ControlName : TCustomControl; disable : boolean = true);

  procedure DisableControl(CName : TCustomControl);
  var i : Integer;
  begin
    with CName do
      for i := 0 to ControlCount -1 do begin
        //ShowMessage(Controls[i].name);
        if (Controls[i] is TCustomControl) then
          DisableControl(Controls[i] as TCustomControl);
        Controls[i].Enabled := disable;

      end
  end;

begin
  with InsMKDataMod do
  if OPCOMMON.CallIntegerFunction('disablepolicies', []) = 0 then
    Exit;

  DisableControl(ControlName);

  btApply.Enabled := Disable;
  btOk.Enabled := Disable;

end;

function TfmMKBlank.UIObjectActivate: HResult;
begin

    CID := Get_Params('—ID');

    with InsMKDataMod do begin
      ODSMotorKasko.SetVariable('ID', StrToInt(Get_Params('ID')));
      ODSMotorKasko.Open;

      ODSContracts.SetVariable('CID', CID);
      ODSContracts.Open;

      ODSModels.Open;
    end;

    if Get_Params('Mod') = 'Insert' then begin

       with InsMKDataMod do begin
         ODSMotorkasko.Insert;
         ODSContracts.Insert;
       end;
       
       edBeginDate.DateTime := Now;
       edEndDate.DateTime := Now;
       Caption := format(fmCaption, ['Yeni anket']);

       DBCBCustName.KeyValue :=  StrToInt(Get_Params('KLI_ID'));
       with InsMKDataMod, ODSCusts do
        ODSContracts.FieldByName('KLI_ID').AsInteger :=StrToInt(Get_Params('KLI_ID'));
    end;
    if Get_Params('Mod') = 'Edit' then begin
       Caption := format(fmCaption, ['Redakte']);

       with InsMKDataMod, ODSdrAccessPeople do begin
        SetVariable('CID', CID);
        Open;
       end;

       with InsMKDataMod do begin
         ODSMotorkasko.Edit;
         ODSContracts.Edit;
       end;

       //--Initialization
       SpeedButton1Click(edInsOutputYear);
       btSuggestion.Enabled := True;
       //-----------Disable controls -------------
       with InsMKDataMod, OPCOMMON do
         if CallIntegerFunction('get_state',[CID]) = 6 {is disable?} then

       DisableControls(Panel2, false);


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
begin
 Result := false;
  try
    with InsMKDataMod, ODSdrAccessPeople do
     if State in [dsEdit, dsInsert] then
       begin
         Post;
         RefreshRecord;
       end;

    with InsMKDataMod, ODSMotorkasko do
     if State in [dsEdit, dsInsert] then
       begin
         Post;
         RefreshRecord;
         ODSContracts.Edit;
         ODSContracts.FieldByName('blank_id').asInteger := FieldByName('id').asInteger;
       end;

    with InsMKDataMod, ODSContracts do
     if State in [dsEdit, dsInsert] then
        begin
          Post;
          RefreshRecord;
          CID := FieldByName('id').asInteger;          
        end;

    IsSaved := True;
    Result := True;
  except
   on E:Exception do hbErrMsg.ShowMessage(E.message);
  end;
end;

procedure TfmMKBlank.btOkClick(Sender: TObject);
begin
  if SaveData() or IsSaved then begin

   PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
  end;
end;




procedure TfmMKBlank.ActiveFormCreate(Sender: TObject);
begin
  fmMKBlank := Self;
  FParams := TStringList.Create;

  InsMKDataMod := TInsMKDataMod.Create(Self);

  isSaved := False;
end;


procedure TfmMKBlank.ActiveFormDestroy(Sender: TObject);
begin
   InsMKDataMod.free;
   FParams.Free;
end;

procedure TfmMKBlank.BitBtn2Click(Sender: TObject);
begin
  with InsMKDataMod do begin
    ODSMotorkasko.Cancel;
    ODSContracts.Cancel;
    ODSdrAccessPeople.Cancel;
  end;
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
                                    '-Òˇ˘‚ ‰‡ıËÎ Â‰ËÎË·'#13+E.message);
   end;
  end;
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
   with InsMKDataMod, OPCOMMON do
     CallBooleanFunction('change_state', [CID, pBlankDone]);
   params := TStringList.Create;
   with InsMKDataMod, ODSMotorkasko do
    params.Values['MK_ID'] := IntToStr(FieldByName('ID').asInteger);
   with InsMKDataMod, ODSCusts do
   params.Values['KLI_ID'] := IntToStr(FieldByName('ID').asInteger);
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
  with InsMKDataMod do
    ODSMonths.Locate('count',
       IntToStr(trunc((edEndDate.DateTime - edBeginDate.DateTime)/30)), [] );
end;

procedure TfmMKBlank.CalcEndDate();
begin
  with InsMKDataMod do
   edEndDate.DateTime :=
       IncMonth(edBeginDate.DateTime, ODSMonths.fieldbyname('COUNT').asInteger);
end;

procedure TfmMKBlank.edBeginDateChange(Sender: TObject);
var key : Char;
begin
   CalcEndDate();
   edDBCBCustNameKeyPress(Sender, key);
end;


procedure TfmMKBlank.DBBentypeClick(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.MakeFranshizList();
begin

  with InsMKDataMod, ODSFranshiz do
  begin
    edFranshiz.Items.Clear;
    First;
    while not EOF do begin
      edFranshiz.Items.Add(FloatToStr(FieldByName('FRANSHIZ').asFloat));
      Next;
    end;
    First  
  end;

end;

procedure TfmMKBlank.SpeedButton1Click(Sender: TObject);
begin
  with InsMKDataMod, ODSReliaseDates do
  try
    Close;
    if (ODSMarks.FieldByName('calcoptions').asInteger = 1)  then
         raise TCalcException.Create('Verilmish avtomobil markasi ucun tarif hesablanmir.');
    if trim(edInsOutputYear.Text) = '' then
         raise TOutputYear.Create('Avtomobilin buraxilish ilini daxil edin');
    SetVariable('state', ODSMarks.fieldbyName('state_id').asInteger);
    SetVariable('releaseyear', StrToInt(edInsOutputYear.Text));
    Open;
    ODSMonths.Open;
    ODSFranshiz.Close;
    ODSFranshiz.Open;
    MakeFranshizList;
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
  MakeFranshizList;
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

procedure TfmMKBlank.edFranshizClick(Sender: TObject);
var key : Char;
begin
   with InsMKDataMod, ODSFranshiz do begin
     First;
     Locate('FRANSHIZ', StrToFloat(edFranshiz.Text), []);
     edTariff.Text := FloatToStr( FieldByName('tariff').asFloat);
   end;
   edDBCBCustNameKeyPress(Sender, key);
end;

procedure TfmMKBlank.ODSFranshizAfterOpen(DataSet: TDataSet);
begin
   edFranshiz.Items.Clear;
   with DataSet do
     while not EOF do begin
       edFranshiz.Items.Add(FloatToStr(FieldByName('FRANSHIZ').asFloat));
       Next;
     end;
end;

procedure TfmMKBlank.SpeedButton2Click(Sender: TObject);
begin
  with InsMKDataMod.ODSdrAccessPeople do
    if Active then Insert
     else if MessageDlg('Melumatlar yadda saxlanilsin?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                if SaveData then begin
                  SetVariable('CID', CID);
                  Open;
                  Insert;
                end;

end;

procedure TfmMKBlank.SpeedButton3Click(Sender: TObject);
begin
  with InsMKDataMod.ODSdrAccessPeople do
    if Active then
      Edit else hbErrMsg.ShowMessage('Can''t change the data.');
end;

procedure TfmMKBlank.SpeedButton4Click(Sender: TObject);
begin
  with InsMKDataMod.ODSdrAccessPeople do
    if Active then
      Delete else hbErrMsg.ShowMessage('Can''t change the data.');
end;

procedure TfmMKBlank.SpeedButton5Click(Sender: TObject);
begin
  with InsMKDataMod.ODSdrAccessPeople do
    if Active then
      Refresh else hbErrMsg.ShowMessage('Can''t change the data.');
end;

procedure TfmMKBlank.SpeedButton6Click(Sender: TObject);
begin
  with InsMKDataMod.ODSdrAccessPeople do
    if Active and (State in [dsEdit, dsInsert]) then
      Post else hbErrMsg.ShowMessage('Can''t change the data or there''re no changes.');
end;

procedure TfmMKBlank.ODSdrAccessPeopleAfterInsert(DataSet: TDataSet);
begin
 with InsMKDataMod, DataSet do
  FieldByName('CID').asInteger := CID;
end;

procedure TfmMKBlank.ODSdrAccessPeopleBeforePost(DataSet: TDataSet);
var
  exp : TdateTime;
  procedure ShowMsg(Msg : String);
  begin
     hbErrMsg.ShowMessage(Msg);
     Raise Exception.Create('goto');
  end;
begin

    try
     with InsMKDataMod,  ODSdrAccessPeople do begin
       exp := FieldByName('DREXPERIENCE').AsDateTime;
       if  (exp - FieldByName('BIRTHDAY').AsDateTime) <= 0 then
           ShowMsg('—ˆˆÊˆÎˆÍ ÚˇÊˆ·ˇÒË ‰Ó¸ÛÏ Ú‡ËıËÌ‰ˇÌ ‡Á ÓÎ‡ ·ËÎÏˇÁ!');
       if  ((exp - FieldByName('BIRTHDAY').AsDateTime) / 364) < 18 then
           ShowMsg('18 È‡¯‰‡Ì ‡¯‡¸˚ ¯ˇıÒÎˇËÌ ÒˆˆÊˆÎˆÍ ‚ˇÒË„ˇÒË ÓÎ‡ ·ËÎÏˇÁ!');
       exp := FieldByName('BIRTHDAY').AsDateTime;
       if  ((now - exp) / 364) < 18 then
           ShowMsg('18 È‡¯‰‡Ì ‡¯‡¸˚ ¯ˇıÒÎˇËÌ ÒˆˆÊˆÎˆÍ ‚ˇÒË„ˇÒË ÓÎ‡ ·ËÎÏˇÁ!');
     end;
    except
      Abort;
    end;

end;

procedure TfmMKBlank.ODSdrAccessPeopleBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Secilmish surucu pozulacaq',
                       mtWarning, [mbYes, mbNo], 0) = mrNo then Abort;

end;

procedure TfmMKBlank.cbBenTypeChange(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);

  with InsMKDataMod, ODSMotorkasko do
  begin

    if (Sender as TDBLookupComboBox).KeyValue = 1 then
      FieldByName('BENEFICIARY').AsString := ODSCusts.FieldByName('Name').asString;
    dbBanks.enabled := (Sender as TDBLookupComboBox).KeyValue = 0;
    dbBeneficiary.Enabled := (Sender as TDBLookupComboBox).KeyValue = 1;
    FieldByName('BEN_ID').asInteger := (Sender as TDBLookupComboBox).KeyValue;
  end;

 

end;

procedure TfmMKBlank.DBBanksClick(Sender: TObject);
var key : Char;
begin
  edDBCBCustNameKeyPress(Sender, key);
  
  with InsMKDataMod, ODSBanks do
     FieldByName('NAME').AsString := ODSMotorkasko.fieldbyname('BENEFICIARY').asString;
end;

procedure TfmMKBlank.DBBanksKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       DBBanksClick(DBBanks);
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end else btApply.Enabled := True;
  IsSaved := not btApply.Enabled;
end;

procedure TfmMKBlank.cbBenTypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       cbBenTypeChange(cbBenType);
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end else btApply.Enabled := True;
  IsSaved := not btApply.Enabled;
end;

procedure TfmMKBlank.edFranshizChange(Sender: TObject);
begin
  with InsMKDataMod, ODSFranshiz do begin
    Locate('FRANSHIZ', ODSContracts.FieldByName('FRANSHIZ').asFloat, []);
    ODSContracts.FieldByName('TARIFF').asFloat :=  FieldByName('TARIFF').asFloat;
  end;  
end;

procedure TfmMKBlank.SpeedButton7Click(Sender: TObject);
begin
  with InsMKDataMod, ODSContracts do
     FieldByName('AMMOUNT').asFloat :=
                (FieldByName('INSSUMM').asFloat / 100) * FieldByName('TARIFF').asFloat;

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

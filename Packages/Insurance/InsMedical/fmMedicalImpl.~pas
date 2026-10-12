unit fmMedicalImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, InsMedical_TLB, StdVcl, PlgModalContainer, Menus,
  ActnList, ImgList, Grids, DBGrids, StdCtrls, ComCtrls, ToolWin, SBPlgAx50_TLB,
  Db, OracleData, Oracle;

type
  TMEDError = Exception;
  TfmMedical = class(TActiveForm,
                     IfmMedical,
                     IUIObject,
                     IParamInput,
                     ISBPlgAc50BufferForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    NewBlank: TAction;
    DelBlank: TAction;
    EditBlank: TAction;
    Refresh: TAction;
    CallSuggestion: TAction;
    CallPolicy: TAction;
    aRefreshAll: TAction;
    pmcObject: TPlgModalContainer;
    ODSMedical: TOracleDataSet;
    DSMedical: TDataSource;
    ODSMedicalID: TIntegerField;
    ODSMedicalEMPNUM: TIntegerField;
    ODSMedicalGROUPA: TIntegerField;
    ODSMedicalGROUPACOVERAGE: TStringField;
    ODSMedicalGROUPB: TIntegerField;
    ODSMedicalGROUPBCOVERAGE: TStringField;
    ODSMedicalGROUPC: TIntegerField;
    ODSMedicalGROUPCCOVERAGE: TStringField;
    ODSMedicalINSPROGRAM: TStringField;
    ODSMedicalSERV_ID: TIntegerField;
    ODSMedicalBEGINDATE: TDateTimeField;
    ODSMedicalENDDATE: TDateTimeField;
    ODSMedicalEMPS_ID: TStringField;
    ODSMedicalINPATSERV: TIntegerField;
    ODSMedicalOUTPATSERV: TIntegerField;
    ODSMedicalEMERAID: TIntegerField;
    ODSMedicalPRESCDRUGS: TIntegerField;
    ODSMedicalDENTSERV: TIntegerField;
    ODSMedicalPROPHYSERV: TIntegerField;
    ODSMedicalPROPHYINS: TIntegerField;
    ODSMedicalSANATORIUM: TIntegerField;
    ODSMedicalCHILDBIRTH: TIntegerField;
    ODSMedicalPRIVATEDRSERV: TIntegerField;
    ODSMedicalMEDICALEVAC: TIntegerField;
    ODSMedicalPROSTINS: TIntegerField;
    ODSMedicalCHEMORADIOTHERAPY: TIntegerField;
    ODSMedicalKLI_ID: TIntegerField;
    ODSMedicalTYPEID: TIntegerField;
    ODSMedicalID_1: TIntegerField;
    ODSMedicalCUST_ID: TIntegerField;
    ODSMedicalNAME: TStringField;
    ODSMedicalSURNAME: TStringField;
    ODSMedicalFATHERNAME: TStringField;
    ODSMedicalHOMEPHONE: TStringField;
    ODSMedicalWORKPHONE: TStringField;
    ODSMedicalMOBILEPHONE: TStringField;
    ODSMedicalFAX: TStringField;
    ODSMedicalADDRESS: TStringField;
    ODSMedicalDATEOFBIRTH: TDateTimeField;
    ODSMedicalPLACEOFBIRTH: TStringField;
    ODSMedicalAGE: TIntegerField;
    ODSMedicalSEX: TIntegerField;
    ODSMedicalPASPORTNO: TStringField;
    ODSMedicalMS_ID: TIntegerField;
    ODSMedicalCITY: TStringField;
    ODSMedicalINDEX_: TStringField;
    ODSMedicalMAILINGADDRESS: TStringField;
    ODSMedicalOCC_ID: TIntegerField;
    ODSMedicalED_ID: TIntegerField;
    ODSMedicalSTATE: TStringField;
    ODSMedicalACT_ID: TIntegerField;
    ODSMedicalCONTACTPERSON: TStringField;
    ODSMedicalMEDS_ID: TFloatField;
    ODSMedicalMEDP_ID: TFloatField;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Policy1: TMenuItem;
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
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSContractsPOLICY_NUM: TStringField;
    ODSContractsAMMOUNT: TFloatField;
    DSContracts: TDataSource;
    ODSMedicalCLOSE_PREFIX: TIntegerField;
    PINS_Medical: TOraclePackage;
    procedure ActiveFormCreate(Sender: TObject);
    procedure NewBlankExecute(Sender: TObject);
    procedure EditBlankExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure DelBlankExecute(Sender: TObject);
    procedure CallSuggestionExecute(Sender: TObject);
    procedure CallPolicyExecute(Sender: TObject);
    procedure MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ODSMedicalAfterScroll(DataSet: TDataSet);
    procedure ODSMedicalAfterFetchRecord(Sender: TOracleDataSet;
      FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
  private
    { Private declarations }
    FParams : TStrings;
    FOwnerHandle : Integer;
    FEvents: IfmMedicalEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function  ShowBlank(params : TStringList):Integer;
    function  ShowPolicy(params : TStringList):Integer;
    function  ShowSuggestion(params : TStringList):Integer;
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
  fmMedical : TfmMedical;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TfmMedical }

procedure TfmMedical.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmMedicalPage); }
end;

procedure TfmMedical.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmMedicalEvents;
end;

procedure TfmMedical.Initialize;
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

function TfmMedical.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmMedical.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmMedical.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmMedical.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmMedical.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmMedical.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmMedical.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmMedical.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmMedical.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmMedical.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmMedical.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmMedical.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmMedical.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmMedical.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmMedical.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmMedical.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmMedical.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmMedical.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmMedical._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMedical.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmMedical.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmMedical.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmMedical.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmMedical.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmMedical.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmMedical.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmMedical.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmMedical.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmMedical.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmMedical.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmMedical.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmMedical.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmMedical.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmMedical.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmMedical.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmMedical.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmMedical.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMedical.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmMedical.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmMedical.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmMedical.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmMedical.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmMedical.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TfmMedical.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TfmMedical.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TfmMedical.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TfmMedical.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TfmMedical.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TfmMedical.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TfmMedical.UIObjectActivate: HResult;
begin
  Result := S_OK;
end;

function TfmMedical.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMedical.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmMedical.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TfmMedical.Get_Height : Integer;
begin
  Result := Height;
end;

function  TfmMedical.Get_Width  : Integer;
begin
  Result := Width;
end;


procedure TfmMedical.ActiveFormCreate(Sender: TObject);
begin
  fmMedical := Self;
end;

function TfmMedical.ShowBlank(params : TStringList):Integer;
begin
   with pmcObject do begin

    Result := ShowModal(StringToGuid('{0B7E3E71-EE29-4EED-9D88-4BC424513DDC}'),params )
   end;
end;

procedure TfmMedical.NewBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['Mod'] := 'Insert';
   params.Values['KLI_ID'] := '-1';
    if ShowBlank(params) = mrOk then
      ODSMedical.Refresh;
   params.Free;


end;

procedure TfmMedical.EditBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['Mod'] := 'Edit';
   params.Values['ID'] := VarToStr(ODSMedicalID.Value);
   params.Values['KLI_ID'] := FloatToStr(ODSMedicalKLI_ID.Value);
   if ShowBlank(params) = mrOk then
      ODSMedical.RefreshRecord;

   params.Free;

end;

procedure TfmMedical.RefreshExecute(Sender: TObject);
begin
   with ODSMedical do
     Refresh;
end;

procedure TfmMedical.DelBlankExecute(Sender: TObject);
var
    id:double;
begin
    id:=ODSMedicalID.Value;
    PInS_Medical.CallProcedure('delete_medicalinfo',['v_id',id]);      
end;

function TfmMedical.ShowSuggestion(params : TStringList):Integer;
begin
   with pmcObject do begin
    Result := ShowModal(StringToGuid('{8488AAD4-B4AC-42D2-B3F4-53A042977147}'),params )
   end;
end;

procedure TfmMedical.CallSuggestionExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   try
     if ODSMedical.IsEmpty then
       raise TMEDError.Create('goto');
     params.Values['MED_ID'] := VarToStr(ODSMedicalID.Value);
     params.Values['KLI_ID'] := FloatToStr(ODSMedicalKLI_ID.Value);
     ShowSuggestion(Params);
   finally
     Params.Free;
   end;

end;

function TfmMedical.ShowPolicy(params : TStringList):Integer;
begin

   with pmcObject do begin
    Result := ShowModal(StringToGuid('{6730B53F-5460-40A6-8554-F904B6690915}'),params )
   end;
end;

procedure TfmMedical.CallPolicyExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   try
     if ODSMedicalMEDS_ID.Value = 0 then
        raise TMEDError.Create('goto');
     params.Values['MEDS_ID'] := VarToStr(ODSMedicalMEDS_ID.Value);
     ShowPolicy(params);
   finally
     Params.Free;
   end;

end;

procedure TfmMedical.MenuItem1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := DEFAULT_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;
     // Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+20, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;


end;

procedure TfmMedical.DBGrid1DblClick(Sender: TObject);
begin
  EditBlank.Execute;
end;

procedure TfmMedical.ODSMedicalAfterScroll(DataSet: TDataSet);
begin
  CallPolicy.Enabled := ODSMedicalMEDS_ID.Value > 0;
end;

procedure TfmMedical.ODSMedicalAfterFetchRecord(Sender: TOracleDataSet;
  FilterAccept: Boolean; var Action: TAfterFetchRecordAction);
begin
  CallPolicy.Enabled := ODSMedicalMEDS_ID.Value > 0;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmMedical,
    Class_fmMedical,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

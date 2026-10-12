unit InsMotorKascoImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, InsMotorKasco_TLB, StdVcl, SBPlgAx50_TLB, ImgList,
  Grids, DBGrids, StdCtrls, Db, OracleData, ComCtrls, ToolWin, ActnList,
  PlgModalContainer, Menus, Oracle, ExtCtrls, Buttons, DBCtrls,
  ExcelExporter;

type
   
  TExportedFieldsInfo = (efiName,efiDescription);
  TExportedFields = array[TExportedFieldsInfo] of String;

const
   ExportedFieldsCount = 12;
   FieldsInfo : array [0..ExportedFieldsCount - 1] of TExportedFields = (
                                                   ('POLICY_NUM','Полис нюмряси')
                                                  ,('NAME','Сыьорта етдирян')
                                                  ,('MARK','Марка')
                                                  ,('INSUREDSTATENUM','Дювлят нюмряси')
                                                  ,('VALYUTA','Валйутасы')
                                                  ,('FRANSHIZ','Франшиза')
                                                  ,('INSSUMM','Сыьорта мябляьи')
                                                  ,('AMMOUNT','Сыьорта щаггы')
                                                  ,('BEGIN_DATE','Башланма тарихи')
                                                  ,('END_DATE','Битмя тарихи')
                                                  ,('BENEFICIARY','Файдаэютцрян')
                                                  ,('AGENT','Аэент')
                                                  );

type

  TMKError = Exception;
  TfmInsMotorKasco = class(TActiveForm,
                           IfmInsMotorKasco,
                           IUIObject,
                           IParamInput,
                           ISBPlgAc50BufferForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    ODSMotorKasco: TOracleDataSet;
    DSMotorKasco: TDataSource;
    ActionList1: TActionList;
    NewBlank: TAction;
    DelBlank: TAction;
    EditBlank: TAction;
    Refresh: TAction;
    CallSuggestion: TAction;
    CallPolicy: TAction;
    aRefreshAll: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    pmcObject: TPlgModalContainer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Policy1: TMenuItem;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    CallSettings: TAction;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
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
    PINS_MCasco: TOraclePackage;
    OPCOMMON: TOraclePackage;
    ToolButton10: TToolButton;
    aFindFilter: TAction;
    ODSMotorKascoID: TFloatField;
    ODSMotorKascoINSUREDTYPE: TStringField;
    ODSMotorKascoINSUREDCOLOR: TStringField;
    ODSMotorKascoINSUREDOUTPUTYEAR: TIntegerField;
    ODSMotorKascoINSUREDSTATENUM: TStringField;
    ODSMotorKascoUNDERFRAMENUM: TStringField;
    ODSMotorKascoINSUREDBANNUM: TStringField;
    ODSMotorKascoINSUREDENGINENUM: TStringField;
    ODSMotorKascoDRIVEINTENDED: TStringField;
    ODSMotorKascoTYPEID: TIntegerField;
    ODSMotorKascoBEN_ID: TFloatField;
    ODSMotorKascoINSUREDMARK: TStringField;
    ODSMotorKascoINSUREDMODEL: TStringField;
    ODSMotorKascoBANK_ID: TFloatField;
    ODSMotorKascoMONTH_ID: TFloatField;
    ODSMotorKascoBEGIN_DATE: TDateTimeField;
    ODSMotorKascoEND_DATE: TDateTimeField;
    ODSMotorKascoKLI_ID: TFloatField;
    ODSMotorKascoCID: TFloatField;
    ODSMotorKascoNAME: TStringField;
    ODSMotorKascoMARK: TStringField;
    ODSMotorKascoBENEFICIARY: TStringField;
    ODSMotorKascoPOLICY_NUM: TStringField;
    ODSMotorKascoAGENT: TStringField;
    ODSMotorKascoDRIVECOST: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    edInsSum: TEdit;
    edInsAmmount: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ODSMotorKascoAMMOUNT: TFloatField;
    ODSMotorKascoINSSUMM: TFloatField;
    ODSMotorKascoFRANSHIZ: TFloatField;
    Label2: TLabel;
    edFranshiz: TEdit;
    SpeedButton1: TSpeedButton;
    ODSOperkurs: TOracleDataSet;
    DSOperkurs: TDataSource;
    ODSOperkursVALUTE_ID: TFloatField;
    ODSOperkursVALUTE: TIntegerField;
    ODSOperkursVAL_NAME: TStringField;
    ODSOperkursOSTAT: TFloatField;
    ODSMotorKascoVALUTE: TIntegerField;
    rgValute: TRadioGroup;
    DSAvtoTypes: TDataSource;
    ODSAutoTypes: TOracleDataSet;
    DBNavigator1: TDBNavigator;
    ODSMotorKascoaznfranshiz: TFloatField;
    ODSMotorKascoAZNInsSum: TFloatField;
    ODSMotorKascoAZNAmmount: TFloatField;
    ODSMotorKascoIsDisabled: TStringField;
    ODSMotorKascoCLOSE_PREFIX: TIntegerField;
    ExcelExporter: TExcelExporter;
    ToolButton5: TToolButton;
    ODSMotorKascoVALYUTA: TStringField;
    procedure NewBlankExecute(Sender: TObject);
    procedure EditBlankExecute(Sender: TObject);
    procedure DelBlankExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure CallSuggestionExecute(Sender: TObject);
    procedure CallPolicyExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure CallSettingsExecute(Sender: TObject);
    procedure aFindFilterExecute(Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ODSMotorKascoCalcFields(DataSet: TDataSet);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    FParams : TStrings;
    FOwnerHandle : Integer;
    FEvents: IfmInsMotorKascoEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function  ShowPolicy(params : TStringList):Integer;
    function  ShowSuggestion(params : TStringList):Integer;
    function  ShowBlank(params : TStringList):Integer;    
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
  fmInsMotorKasco : TfmInsMotorKasco;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl, InsSettings, InsFindFilter;

{$R *.DFM}

{ TfmInsMotorKasco }

procedure TfmInsMotorKasco.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmInsMotorKascoPage); }
end;

procedure TfmInsMotorKasco.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmInsMotorKascoEvents;
end;

procedure TfmInsMotorKasco.Initialize;
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

function TfmInsMotorKasco.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmInsMotorKasco.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmInsMotorKasco.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmInsMotorKasco.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmInsMotorKasco.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmInsMotorKasco.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmInsMotorKasco.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmInsMotorKasco.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmInsMotorKasco.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmInsMotorKasco.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmInsMotorKasco.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmInsMotorKasco.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmInsMotorKasco.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmInsMotorKasco.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmInsMotorKasco.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmInsMotorKasco.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmInsMotorKasco.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmInsMotorKasco.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmInsMotorKasco._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmInsMotorKasco.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmInsMotorKasco.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmInsMotorKasco.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmInsMotorKasco.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmInsMotorKasco.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmInsMotorKasco.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmInsMotorKasco.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmInsMotorKasco.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmInsMotorKasco.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmInsMotorKasco.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmInsMotorKasco.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmInsMotorKasco.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmInsMotorKasco.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmInsMotorKasco.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmInsMotorKasco.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmInsMotorKasco.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmInsMotorKasco.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmInsMotorKasco.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmInsMotorKasco.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmInsMotorKasco.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmInsMotorKasco.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmInsMotorKasco.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmInsMotorKasco.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmInsMotorKasco.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TfmInsMotorKasco.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TfmInsMotorKasco.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TfmInsMotorKasco.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TfmInsMotorKasco.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TfmInsMotorKasco.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TfmInsMotorKasco.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TfmInsMotorKasco.UIObjectActivate: HResult;
begin
  Result := S_OK;
  ODSMotorKasco.Open;
  ODSContracts.Open;
end;

function TfmInsMotorKasco.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmInsMotorKasco.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TfmInsMotorKasco.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TfmInsMotorKasco.Get_Height : Integer;
begin
  Result := Height;
end;

function  TfmInsMotorKasco.Get_Width  : Integer;
begin
  Result := Width;
end;

function TfmInsMotorKasco.ShowBlank(params : TStringList):Integer;
begin
   with pmcObject do begin
    Result := ShowModal(StringToGuid('{10B7A209-A993-466D-A763-98A80A7E74C6}'),params )
   end;
end;

procedure TfmInsMotorKasco.NewBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['Mod'] := 'Insert';
//   with DataModkasco do begin
    params.Values['KLI_ID'] := '-1';
    params.Values['СID']:='-1';
    if ShowBlank(params) = mrOk then
      ODSMotorKasco.Refresh;
   params.Free;

end;

procedure TfmInsMotorKasco.EditBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   ODSContracts.Close;
   ODSContracts.SetVariable('cid',FloatToStr(ODSMotorKascoCID.Value));
   ODSContracts.Open;
   params.Values['Mod'] := 'Edit';
   params.Values['ID'] := VarToStr(ODSMotorKascoID.Value);
   params.Values['KLI_ID'] := FloatToStr(ODSMotorKascoKLI_ID.Value);
   params.Values['СID']:= FloatToStr(ODSContractsID.Value);
   if ShowBlank(params) = mrOk then
      ODSMotorKasco.RefreshRecord;

   params.Free;

end;

procedure TfmInsMotorKasco.DelBlankExecute(Sender: TObject);
var
    id:double;
begin
   id:=ODSMotorKascoCID.Value;
 if MessageDlg('Secilmish sigorta lagv olunacaq!',mtConfirmation,
 mbYesNoCancel, 0) = mrYes then
   try
     OPCommon.CallBooleanFunction('del_ins',[id,1]);
   except on E:EOracleError do
    case E.ErrorCode of
       20002: ShowMessage('Яввялжя сылы щесаблары баьлайын!');
       20001: ShowMessage('Асылы щесабларда галыг сыфырдан фярглидир!');
     end;
   end;
end;

procedure TfmInsMotorKasco.RefreshExecute(Sender: TObject);
begin
   with ODSMotorKasco do
     Refresh;
end;

function TfmInsMotorKasco.ShowSuggestion(params : TStringList):Integer;
begin
   with pmcObject do begin
    Result := ShowModal(StringToGuid('{D5269FCA-2559-4984-A565-16C0EE110CF6}'),params )
   end;
end;

procedure TfmInsMotorKasco.CallSuggestionExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   try
    { if ODSMotorKasco.IsEmpty then
       raise TMKError.Create('goto');
     params.Values['MK_ID'] := VarToStr(ODSMotorKascoID.Value);}
     params.Values['KLI_ID'] := FloatToStr(ODSMotorKascoKLI_ID.Value);
     params.Values['CID'] := FloatToStr(ODSMotorKascoCID.Value);
     ShowSuggestion(Params);
   finally
     Params.Free;
   end;

end;

function TfmInsMotorKasco.ShowPolicy(params : TStringList):Integer;
begin

   with pmcObject do begin
    Result := ShowModal(StringToGuid('{3C454A4C-C304-4633-AAAD-4C46C68BB8EE}'),params )
   end;
end;

procedure TfmInsMotorKasco.CallPolicyExecute(Sender: TObject);
var
   params : TStringList;
begin
   Params := TStringList.Create;
   try
     {if ODSMotorKascoPOLICY_ID.Value = 0 then
        raise TMKError.Create('goto'); }
     Params.Values['CID'] := FloatToStr(ODSContractsID.Value);;
     ShowPolicy(params);
   finally
     Params.Free;
   end;

end;

procedure TfmInsMotorKasco.DBGrid1DblClick(Sender: TObject);
begin
  EditBlank.Execute;
end;

procedure TfmInsMotorKasco.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
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

procedure TfmInsMotorKasco.CallSettingsExecute(Sender: TObject);
begin
  fmSettings := TfmSettings.Create(Self);
  with fmSettings do
  try
    ODSStates.Open;
    ODSPerRates.Open;
    ODSBankm.Open;
    ODSTariffs.Open;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmInsMotorKasco.aFindFilterExecute(Sender: TObject);
begin

  if not Assigned(fmFind) then
    fmFind := TfmFind.Create(Self);
  fmFind.ShowModal;

end;

procedure TfmInsMotorKasco.ActiveFormCreate(Sender: TObject);
begin
     fmInsMotorKasco := Self;
     ODSOperkurs.Locate('valute_id',1,[]); 
end;

procedure TfmInsMotorKasco.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   s,s1,s2:real;
   i:integer;
begin
   s:=0; s1:=0; s2:=0;
   with DBGrid1,SelectedRows,ODSMotorKasco do
   begin
   if Count = 0 then  CurrentRowSelected := True;
   for  I:=0 to  Count - 1 do
   begin
      GotoBookmark(Pointer(Items[I]));
      if rgValute.ItemIndex=0 then
      begin
         ODSOperkurs.Locate('valute_id',1,[]);
         if not(ODSMotorKascoValute.Value=0) then
         begin
            s:=s+ FieldbyName('Franshiz').AsFloat*ODSOperkursOstat.Value;
            s1:=s1+FieldbyName('InsSumm').AsFloat*ODSOperkursOstat.Value;
            s2:=s2+FieldbyName('Ammount').AsFloat*ODSOperkursOstat.Value;
            s:=round(s); s1:=round(s1); s2:=round(s2);
         end
         else
            begin
                s:=s+ FieldbyName('Franshiz').AsFloat;
                s1:=s1+FieldbyName('InsSumm').AsFloat;
                s2:=s2+FieldbyName('Ammount').AsFloat;
            end;
      end;
      if  rgValute.ItemIndex=1 then
      begin
         ODSOperkurs.Locate('valute_id',1,[]);
         if not(ODSMotorKascoValute.Value=1) then
         begin
            s:=s+ FieldbyName('Franshiz').AsFloat/ODSOperkursOstat.Value;
            s1:=s1+FieldbyName('InsSumm').AsFloat/ODSOperkursOstat.Value;
            s2:=s2+FieldbyName('Ammount').AsFloat/ODSOperkursOstat.Value;
            s:=round(s); s1:=round(s1); s2:=round(s2);
         end
         else
            begin
                s:=s+ FieldbyName('Franshiz').AsFloat;
                s1:=s1+FieldbyName('InsSumm').AsFloat;
                s2:=s2+FieldbyName('Ammount').AsFloat;
            end;
      end;
   end;
   end;
   edFranshiz.Text:=FloatToStr(s);
   edInsSum.Text:=FloatToStr(s1);
   edInsAmmount.Text:=FloatToStr(s2);
end;

procedure TfmInsMotorKasco.SpeedButton1Click(Sender: TObject);
begin
     edFranshiz.Text:='';
     edInsSum.Text:='';
     edInsAmmount.Text:='';
end;

procedure TfmInsMotorKasco.ODSMotorKascoCalcFields(DataSet: TDataSet);
begin
     with DataSet do
     begin
          if FieldbyName('Valute').AsFloat<>0 then
          begin
             FieldbyName('AZNFranshiz').AsFloat:=FieldbyName('Franshiz').AsFloat*ODSOperkursOstat.AsFloat;
             FieldbyName('AZNInsSum').AsFloat:=FieldbyName('InsSumm').AsFloat*ODSOperkursOstat.AsFloat;
             FieldbyName('AZNAmmount').AsFloat:=FieldbyName('Ammount').AsFloat*ODSOperkursOstat.AsFloat;
          end
          else
             begin
                 FieldbyName('AZNFranshiz').AsFloat:=FieldbyName('Franshiz').AsFloat*1;
                 FieldbyName('AZNInsSum').AsFloat:=FieldbyName('InsSumm').AsFloat*1;
                 FieldbyName('AZNAmmount').AsFloat:=FieldbyName('Ammount').AsFloat*1;
             end;
          {if FieldbyName('Close_Prefix').AsFloat=0 then
             FieldbyName('IsDisabled').Value:='Ok';}
     end;
end;

procedure TfmInsMotorKasco.ToolButton5Click(Sender: TObject);
var
   i : 0..ExportedFieldsCount - 1;
begin
     with ExcelExporter do
     begin
          Font.Name:='Azl Sans Serif';
          ExportList.Clear;
          for i := 0 to ExportedFieldsCount - 1 do
          ExportList.Add(UpperCase(FieldsInfo[i][efiName]));
          Report;
     end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmInsMotorKasco,
    Class_fmInsMotorKasco,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

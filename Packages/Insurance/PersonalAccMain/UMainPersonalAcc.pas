unit UMainPersonalAcc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, PMainPersonalAcc_TLB, StdVcl, Db, OracleData, ActnList, Menus,
  ImgList, Grids, DBGrids, ComCtrls, ToolWin,SBPlgAx50_TLB,
  PlgModalContainer, Oracle, INSWordExporter;

const
     WM_ModalResult = WM_USER+139;

type
  TMainPersonalAcc = class(TActiveForm, IMainPersonalAcc,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    AccidentGrid: TDBGrid;
    ImageList: TImageList;
    ToolButton3: TToolButton;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    AInsert: TAction;
    AEdit: TAction;
    ADelete: TAction;
    AReport: TAction;
    ARefresh: TAction;
    AFullRefresh: TAction;
    ASuggestion: TAction;
    APolicy: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    AccidentReportSource: TDataSource;
    ODSPAccidentR: TOracleDataSet;
    ODSPAccidentSource: TDataSource;
    ODSCustomersSource: TDataSource;
    ODSPAccident: TOracleDataSet;
    ODSPAccidentID: TFloatField;
    ODSPAccidentKLI_ID: TFloatField;
    ODSPAccidentCONTACT_PERSON: TStringField;
    ODSPAccidentBANKING_DETAILS: TStringField;
    ODSPAccidentTOTALEMP_NUMBER: TFloatField;
    ODSPAccidentAOG: TFloatField;
    ODSPAccidentAOP: TFloatField;
    ODSPAccidentSMG: TFloatField;
    ODSPAccidentSMP: TFloatField;
    ODSPAccidentBCG: TFloatField;
    ODSPAccidentBCP: TFloatField;
    ODSPAccidentDECIRED_AMOUNT: TFloatField;
    ODSPAccidentAD: TFloatField;
    ODSPAccidentPD: TFloatField;
    ODSPAccidentPLU: TFloatField;
    ODSPAccidentEME: TFloatField;
    ODSPAccidentHC: TFloatField;
    ODSPAccidentHS: TFloatField;
    ODSPAccidentBRB: TFloatField;
    ODSPAccidentBURN: TFloatField;
    ODSPAccidentTTD: TFloatField;
    ODSPAccidentNOT_COVEREDPERIOD: TStringField;
    ODSPAccidentOUTSIDEOFAZE: TStringField;
    ODSPAccidentRENEWAL: TStringField;
    ODSPAccidentTRAVELS: TStringField;
    ODSPAccidentTYPEID: TIntegerField;
    ODSCustomers: TOracleDataSet;
    ODSPAccidentRISKID: TFloatField;
    BlankModalContainer: TPlgModalContainer;
    PINS_PACCIDENT: TOraclePackage;
    ODSPAccidentNOT_COVEREPERIOD1: TStringField;
    ODSPAccidentMAXWEEKS: TIntegerField;
    AccidentExporter: TINSWordExporter;
    DataSource1: TDataSource;
    ODSActivity: TOracleDataSet;
    ODSPAccidentRNAME: TStringField;
    ODSPAccidentRPHONE: TStringField;
    ODSPAccidentRFAX: TStringField;
    ODSPAccidentRADDRESS: TStringField;
    ODSPAccidentRCONTACT_PERSON: TStringField;
    ODSPAccidentRBANKING_DETAILS: TStringField;
    ODSPAccidentRTOTALEMP_NUMBER: TFloatField;
    ODSPAccidentRAOG: TFloatField;
    ODSPAccidentRAOP: TFloatField;
    ODSPAccidentRSMG: TFloatField;
    ODSPAccidentRSMP: TFloatField;
    ODSPAccidentRBCG: TFloatField;
    ODSPAccidentRBCP: TFloatField;
    ODSPAccidentRDECIRED_AMOUNT: TFloatField;
    ODSPAccidentRAD: TFloatField;
    ODSPAccidentRPD: TFloatField;
    ODSPAccidentRPLU: TFloatField;
    ODSPAccidentREME: TFloatField;
    ODSPAccidentRHC: TFloatField;
    ODSPAccidentRHS: TFloatField;
    ODSPAccidentRBRB: TFloatField;
    ODSPAccidentRBURN: TFloatField;
    ODSPAccidentRTTD: TFloatField;
    ODSPAccidentRNOT_COVEREDPERIOD: TStringField;
    ODSPAccidentROUTSIDEOFAZE: TStringField;
    ODSPAccidentRRENEWAL: TStringField;
    ODSPAccidentRTRAVELS: TStringField;
    ODSPAccidentRTYPEID: TIntegerField;
    ODSPAccidentRRISKID: TFloatField;
    ODSPAccidentRNOT_COVEREPERIOD1: TStringField;
    ODSPAccidentRMAXWEEKS: TIntegerField;
    Risks: TOracleDataSet;
    RisksID: TFloatField;
    RisksNAME: TStringField;
    RisksData: TDataSource;
    ODSPAccidentPROFITID: TFloatField;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    ODSCustomersID: TIntegerField;
    ODSCustomersNAME: TStringField;
    ODSCustomersADDRESS: TStringField;
    ODSCustomersMOBILEPHONE: TStringField;
    ODSCustomersFAX: TStringField;
    ODSPAccSuggest: TOracleDataSet;
    ODSPAccSuggestID: TFloatField;
    ODSPAccSuggestPAID: TFloatField;
    ODSPAccSuggestCNDT_ID: TFloatField;
    ODSPAccSuggestINSURANCESUM: TFloatField;
    ODSPAccSuggestINSURANCETIME: TDateTimeField;
    ODSPAccSuggestMEDICALCOST: TFloatField;
    ODSPAccSuggestALL_INSAMMOUNT: TFloatField;
    ODSPAccSuggestGEO: TStringField;
    PAccSugestSource: TDataSource;
    SuggestContainer: TPlgModalContainer;
    ODSPAccidentAGENTID: TFloatField;
    PolicyContainer: TPlgModalContainer;
    ODSPAccSuggestFRZ_ID: TFloatField;
    ODSPAccidentCLOSE_PREFIX: TIntegerField;
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
    OPCOMMON: TOraclePackage;
    ASearch: TAction;
    ToolButton8: TToolButton;
    ODSPAccidentNAME: TStringField;
    ODSPAccidentBEGIN_DATE: TDateTimeField;
    ODSPAccidentEND_DATE: TDateTimeField;
    procedure ActiveFormCreate(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure AInsertExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure AFullRefreshExecute(Sender: TObject);
    procedure ADeleteExecute(Sender: TObject);
    procedure AccidentGridTitleClick(Column: TColumn);
    procedure AReportExecute(Sender: TObject);
    procedure ASuggestionExecute(Sender: TObject);
    procedure APolicyExecute(Sender: TObject);
    procedure ASearchExecute(Sender: TObject);
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FOwnerHandle : Integer;
    FEvents: IMainPersonalAccEvents;
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
  public
    { Public declarations }
    procedure Initialize; override;
    procedure FullRefresh(DataSetName: String);
    procedure DeletePAccidentInfo(id:integer);
  end;

var
    MainPersonalAcc:TMainPersonalAcc;

implementation

uses ComObj, ComServ,sboapiDataModuleImpl, USearch;

{$R *.DFM}

{ TMainPersonalAcc }

procedure TMainPersonalAcc.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MainPersonalAccPage); }
end;

procedure TMainPersonalAcc.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMainPersonalAccEvents;
end;

procedure TMainPersonalAcc.Initialize;
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

function TMainPersonalAcc.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMainPersonalAcc.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMainPersonalAcc.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMainPersonalAcc.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMainPersonalAcc.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMainPersonalAcc.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMainPersonalAcc.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TMainPersonalAcc.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMainPersonalAcc.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMainPersonalAcc.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMainPersonalAcc.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMainPersonalAcc.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMainPersonalAcc.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMainPersonalAcc.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMainPersonalAcc.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMainPersonalAcc.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMainPersonalAcc.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMainPersonalAcc.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMainPersonalAcc._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainPersonalAcc.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TMainPersonalAcc.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMainPersonalAcc.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMainPersonalAcc.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMainPersonalAcc.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMainPersonalAcc.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMainPersonalAcc.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMainPersonalAcc.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMainPersonalAcc.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMainPersonalAcc.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMainPersonalAcc.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMainPersonalAcc.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMainPersonalAcc.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMainPersonalAcc.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TMainPersonalAcc.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMainPersonalAcc.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMainPersonalAcc.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMainPersonalAcc.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainPersonalAcc.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TMainPersonalAcc.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMainPersonalAcc.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMainPersonalAcc.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMainPersonalAcc.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMainPersonalAcc.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;


function  TMainPersonalAcc.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TMainPersonalAcc.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TMainPersonalAcc.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TMainPersonalAcc.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TMainPersonalAcc.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TMainPersonalAcc.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TMainPersonalAcc.UIObjectActivate: HResult;
begin
       Result := S_OK;

end;

function TMainPersonalAcc.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMainPersonalAcc.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TMainPersonalAcc.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TMainPersonalAcc.Get_Height : Integer;
begin
  Result := Height;
end;

function  TMainPersonalAcc.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TMainPersonalAcc.ActiveFormCreate(Sender: TObject);
begin
     MainPersonalAcc:=Self;
     FParams := TStringList.Create;
end;

procedure TMainPersonalAcc.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
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
      Charset := RUSSIAN_CHARSET;
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
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
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

procedure TMainPersonalAcc.AInsertExecute(Sender: TObject);
var
   p : TStringList;
begin
     p:= TStringList.Create;
     p.Values['Mod']:='Insert';
     p.Values['KLI_ID'] := IntToStr(ODSCustomersId.Value);
    // INS_CONSTRUCTION.Insert;
     with BlankModalContainer do
         ShowModal(StringToGuid('{4CE12A01-2B74-46A1-B926-62459B0099FF}'),p );
     p.Free;

end;

procedure TMainPersonalAcc.AEditExecute(Sender: TObject);
var
   p : TStringList;
begin
     if ODSPAccident.IsEmpty then
     begin
        ShowMessage('∆€дв€лд€ м€лумат йохдур !');
        exit;
     end;
     p:= TStringList.Create;
     p.Values['Mod']:='Edit';
     p.Values['ID']:=FloatToStr(ODSPAccidentID.Value);
     //p.Values['ID'] := IntToStr(PINS_CONSTRUCTION.CallIntegerFunction('generateID',[]));
    // INS_CONSTRUCTION.Insert;
     with BlankModalContainer do
         ShowModal(StringToGuid('{4CE12A01-2B74-46A1-B926-62459B0099FF}'),p );
     p.Free;
end;

procedure TMainPersonalAcc.ARefreshExecute(Sender: TObject);
var
    accidentID: Longint;
begin
    with ODSPAccident do
    begin
        accidentID :=FieldByName('ID').AsInteger;
        CloseAll;
        Open;
        Locate('ID',accidentID, []);
    end;

end;

procedure TMainPersonalAcc.FullRefresh(DataSetName: String);
const
     c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
     i: Word;
begin
     for i :=0 to ComponentCount- 1 do
     if (Components[i] is TOracleDataSet) and (Components[i].Name <> DataSetName) then
     try
        (Components[i] as TOracleDataSet).Close;
        (Components[i] as TOracleDataSet).Open;
     except
         raise Exception.Create(Format(c_err_message, [(Components[i] as TDataSet).Name]));
     end;

end;

procedure TMainPersonalAcc.AFullRefreshExecute(Sender: TObject);
begin
     FullRefresh('');
end;

procedure TMainPersonalAcc.DeletePAccidentInfo(id: integer);
begin
     try
        OPCommon.CallBooleanFunction('del_ins',[id,3]);
     except on E:EOracleError do
     case E.ErrorCode of
           20001: ShowMessage('јсылы щесабларда галыг сыфырдан ф€рглидир!');
           20002: ShowMessage('явв€лж€ асылы щесаблары баьлайын!');
     end;
     end;
end;

procedure TMainPersonalAcc.ADeleteExecute(Sender: TObject);
var
    id:longint;
    i: Integer;
    WaitNextConfirm, WillRefresh: Boolean;
begin
    WaitNextConfirm :=True;
    WillRefresh :=False;
    with AccidentGrid,SelectedRows,ODSPAccident do
    try
       if Count = 0 then  CurrentRowSelected := True;
       for  I:=0 to  Count - 1 do
    begin
      GotoBookmark(Pointer(Items[I]));
      ID :=FieldbyName('ID').AsInteger;
      if  WaitNextConfirm  then
      case MessageDlg('ћ€луматлар силинсин ?'
               ,mtConfirmation
       ,[mbYes, mbNo ,mbCancel ,mbYesToAll]
       ,0
       )   of
        mrNo       : Continue;
        mrCancel   : Break;
        mrYesToAll :
          if MessageDlg(Format('%d  сайда м€лумат силинсин?', [Count - I]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
             WaitNextConfirm :=False
          else
             Continue;
      end;
      Application.ProcessMessages;
      DeletePAccidentInfo(ID);
      WillRefresh :=True;
    end;
     ARefreshExecute(sender);

   finally
      if WillRefresh then
      ARefreshExecute(Sender);

  end;
end;

procedure TMainPersonalAcc.AccidentGridTitleClick(Column: TColumn);
var
   TitleName :string;
begin
   if Column.Field.Calculated then Exit;
   TitleName :=Column.FieldName;
   if Column.FieldName='NAME' then
      TitleName:='kli_id';
   with ODSPAccident do
   begin
        Screen.Cursor :=crSQLWait;
        SetVariable('ID',TitleName);
        Refresh;
        Screen.Cursor :=crDefault;
   end

end;

procedure TMainPersonalAcc.AReportExecute(Sender: TObject);
var
    idr:double;
begin
    idr:=ODSPAccidentID.Value;
    ODSPAccidentR.CloseAll;
    ODSPAccidentR.SetVariable('id',idr);
    ODSPAccidentR.Open;
    try
       with AccidentExporter do
       begin
            FileName:=ExtractFilePath(Application.ExeName)+ '\GPAccidentAppl.doc';
            Open(False);
            Risks.Locate('id',ODSPAccidentRRiskid.Value,[]);
            if ODSPAccidentRRiskid.Value<>0 then
               SetBookmark('RISKS',RISKSNAME.Value, false, false, False, false, 8, 'Arial AzLat', False);

            SetBookmark('Insured',ODSPAccidentRName.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Address',ODSPAccidentRAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('ITel',ODSPAccidentRPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('fax',ODSPAccidentRfax.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('CPerson',ODSPAccidentRContact_person.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('CPerson1',ODSPAccidentRContact_person.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Banking',ODSPAccidentRBanking_details.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Beneficiary',ODSBeneficiaryName.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BAddress',ODSBeneficiaryAddress.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BTel',ODSBeneficiaryPhone.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BBanking',ODSBeneficiaryBanking_Details.value, false, false, False, false, 8, 'Arial AzLat', False);
            //SetBookmark('RPeriod',ODSPAccidentRReqins_period.value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('Empnum',FloatToStr(ODSPAccidentRTotalemp_number.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('AOG',FloatToStr(ODSPAccidentRAOG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('AOP',FloatToStr(ODSPAccidentRAOP.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('SMG',FloatToStr(ODSPAccidentRSMG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('SMP',FloatToStr(ODSPAccidentRSMP.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BCG',FloatToStr(ODSPAccidentRBCG.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BCP',FloatToStr(ODSPAccidentRBCP.value), false, false, False, false, 8, 'Arial AzLat', False);
            if not ODSPAccidentRDecired_amount.IsNull then
            begin
               SetBookmark('ISMultiple','Ѕ€ли', false, false, False, false, 8, 'Arial AzLat', False);
               SetBookmark('ISMultiplesum',FloatToStr(ODSPAccidentRDecired_amount.value), false, false, False, false, 8, 'Arial AzLat', False);
            end
            else
               SetBookmark('ISMultiple','’ейр', false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('EME',FloatToStr(ODSPAccidentREME.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('HC',FloatToStr(ODSPAccidentRHC.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('HS',FloatToStr(ODSPAccidentRHS.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BRB',FloatToStr(ODSPAccidentRBRB.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('BURN',FloatToStr(ODSPAccidentRBURN.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('TTD',FloatToStr(ODSPAccidentRTTD.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('WEEKS',FloatToStr(ODSPAccidentMAXWEEKS.value), false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('NOTCOVERED',ODSPAccidentRNOT_COVEREDPERIOD.value+'  -  '+ODSPAccidentRNOT_COVEREPERIOD1.value, false, false, False, false, 8, 'Arial AzLat', False);

            IF (ODSPAccidentROUTSIDEOFAZE.Value='’ейр') or (ODSPAccidentROUTSIDEOFAZE.Value='Ѕ€ли') then
               SetBookmark('OUTOFAZE',ODSPAccidentROUTSIDEOFAZE.Value, false, false, False, false, 8, 'Arial AzLat', False);
            IF (ODSPAccidentROUTSIDEOFAZE.Value<>'’ейр') and (ODSPAccidentROUTSIDEOFAZE.Value<>'Ѕ€ли') then
            begin
                SetBookmark('OUTOFAZE1',ODSPAccidentROUTSIDEOFAZE.Value, false, false, False, false, 8, 'Arial AzLat', False);
                SetBookmark('OUTOFAZE','Ѕ€ли', false, false, False, false, 8, 'Arial AzLat', False);
            end;
            SetBookmark('RENEWAL',ODSPAccidentRRENEWAL.Value, false, false, False, false, 8, 'Arial AzLat', False);
            SetBookmark('TRAVELS',ODSPAccidentRTRAVELS.Value, false, false, False, false, 8, 'Arial AzLat', False);
       end
    finally
       AccidentExporter.Show;
    end;
end;

procedure TMainPersonalAcc.ASuggestionExecute(Sender: TObject);
var
   p : TStringList;
begin
   if ODSPAccident.IsEmpty then
    begin
       ShowMessage('явв€лж€ анкет формасы щазырланмалыдыр !');
       exit;
    end;    
   p:= TStringList.Create;
   ODSPaccSuggest.Close;
   ODSPaccSuggest.SetVariable('paid',ODSPAccidentId.value);
   ODSPaccSuggest.Open;
   p.Values['MK_ID']:=FloatToStr(ODSPAccidentID.value);
   if ODSPaccSuggest.RecordCount<1 then
      p.Values['Mod']:='Insert'
   else
      p.Values['Mod']:='Edit';
   with SuggestContainer do begin
      ShowModal(StringToGuid('{F64B6260-CAB7-4D0A-9149-CF1A4639CD5C}'),p );
   end;
   p.Free;
end;

procedure TMainPersonalAcc.APolicyExecute(Sender: TObject);
var
   p : TStringList;
begin
   ODSPAccSUGGEST.Close;
   ODSPAccSuggest.SetVariable('paid',ODSPAccidentID.value);
   ODSPAccSuggest.Open;
   if ODSPAccSUGGESTID.Value=0 then
   begin
           ShowMessage('“€клифнам€ щазыр дейил ! явв€лж€ т€клифнам€ щазырланмалыдыр !');
           exit;
   end;
   p:= TStringList.Create;
   p.Values['ID']:=FloatToStr(ODSPAccidentId.value);
   with PolicyContainer do begin
     ShowModal(StringToGuid('{DF05FA85-2A5E-472D-8506-3C31DF75BDD8}'),p );
   end;
   p.Free;

end;

procedure TMainPersonalAcc.ASearchExecute(Sender: TObject);
begin
     if not Assigned(frmSearch) then
      frmSearch := TfrmSearch.Create(Self);
      frmSearch.ShowModal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMainPersonalAcc,
    Class_MainPersonalAcc,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

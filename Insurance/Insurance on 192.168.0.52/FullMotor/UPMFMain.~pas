unit UPMFMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, PPMFMain_TLB, StdVcl, Oracle, Db, OracleData, StdCtrls,
  Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin, INSWordExporter, ActnList,
  ImgList, Menus,SBPlgAx50_TLB, PlgModalContainer;

type
  TPMFMain = class(TActiveForm, IPMFMain,IUIObject,
             IParamInput,
             ISBPlgAc50BufferForm)
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
    ImageList: TImageList;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionRefresh: TAction;
    ActionFullRefresh: TAction;
    ActionSearch: TAction;
    ActionSpeedSearch: TAction;
    ActionDelete: TAction;
    Report: TAction;
    ActionSuggestion: TAction;
    ActionPolicy: TAction;
    ActionExtra: TAction;
    INSWordExporter1: TINSWordExporter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    PanelAcc: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    GridMore: TDBGrid;
    GroupBox1: TGroupBox;
    GridMotor: TDBGrid;
    lbBookmarks: TListBox;
    Ins_MotorFullData: TDataSource;
    Ins_MotorFull: TOracleDataSet;
    Ins_MotorFullID: TFloatField;
    Ins_MotorFullKLI_ID: TFloatField;
    Ins_MotorFullBANKING_DETAILS: TStringField;
    Ins_MotorFullPROFITID: TFloatField;
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
    Ins_MotorFullCLOSE_PREFIX: TIntegerField;
    MoreThanOneData: TDataSource;
    MoreThanOne: TOracleDataSet;
    MoreThanOneID: TFloatField;
    MoreThanOneNAME2: TStringField;
    MoreThanOneSURNAME: TStringField;
    MoreThanOneFATHERNAME: TStringField;
    MoreThanOneAGE: TIntegerField;
    MoreThanOneEXPERIENCE: TStringField;
    MoreThanOneFULL_ID: TFloatField;
    MoreThanOneHISTORY: TStringField;
    Accesories: TOracleDataSet;
    AccesoriesID: TFloatField;
    AccesoriesTYPE: TStringField;
    AccesoriesMAKE: TStringField;
    AccesoriesVALUE: TFloatField;
    AccesoriesHOWCREATED: TStringField;
    AccesoriesFULL_ID: TFloatField;
    AccesoriesData: TDataSource;
    Customers: TOracleDataSet;
    CustomersID: TIntegerField;
    CustomersNAME: TStringField;
    CustomersADDRESS: TStringField;
    CustomersMOBILEPHONE: TStringField;
    CustomersFAX: TStringField;
    CustomersCONTACTPERSON: TStringField;
    CustomersData: TDataSource;
    SuggestionData: TDataSource;
    Suggestion: TOracleDataSet;
    SuggestionID: TFloatField;
    SuggestionMK_ID: TFloatField;
    SuggestionRISKADDRESS: TStringField;
    SuggestionINSURANCEAMMOUNT: TFloatField;
    SuggestionENDDATE: TDateTimeField;
    SuggestionRSK_ID: TFloatField;
    SuggestionFRZ_ID: TFloatField;
    SuggestionCNDT_ID: TFloatField;
    SuggestionVAL_ID: TFloatField;
    SuggestionINSURANCESUM: TFloatField;
    BeneficiarySource: TDataSource;
    ODSBeneficiary: TOracleDataSet;
    ODSBeneficiaryID: TFloatField;
    ODSBeneficiaryNAME: TStringField;
    ODSBeneficiaryADDRESS: TStringField;
    ODSBeneficiaryPHONE: TStringField;
    ODSBeneficiaryBANKING_DETAILS: TStringField;
    OPCOMMON: TOraclePackage;
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
    PlgBlank: TPlgModalContainer;
    Policy: TOracleDataSet;
    PolicyID: TFloatField;
    PolicyMS_ID: TFloatField;
    PolicyPOLICYNUM: TStringField;
    PolicySUBJECTVALUE: TFloatField;
    PolicyData: TDataSource;
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
    Ins_ReportPROFITID: TFloatField;
    Ins_ReportData: TDataSource;
    PINS_FULLMOTOR: TOraclePackage;
    More_Report: TOracleDataSet;
    More_ReportID: TFloatField;
    More_ReportFULL_ID: TFloatField;
    More_ReportNAME: TStringField;
    More_ReportAGE: TIntegerField;
    More_ReportEXPERIENCE: TStringField;
    More_ReportHISTORY: TStringField;
    MoreReportData: TDataSource;
    ODSAgents: TOracleDataSet;
    ODSAgentsNAME: TStringField;
    ODSAgentsID: TFloatField;
    AgentsSource: TDataSource;
    N10: TMenuItem;
    Ins_MotorFullNAME: TStringField;
    ToolButton9: TToolButton;
    Ins_MotorFullBEGIN_DATE: TDateTimeField;
    Ins_MotorFullEND_DATE: TDateTimeField;
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionFullRefreshExecute(Sender: TObject);
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure ActionExtraExecute(Sender: TObject);
    procedure GridMotorTitleClick(Column: TColumn);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActionSuggestionExecute(Sender: TObject);
    procedure ActionPolicyExecute(Sender: TObject);
    procedure ReportExecute(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    
  private
    { Private declarations }
    id : Integer;
    FParams: TStrings;
    FOwnerHandle : Integer;

    FEvents: IPMFMainEvents;
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
    procedure DeleteMotorInfo(id:longint);
  end;

var
    PMFMain:TPMFMain;

implementation

uses ComObj, ComServ,sboapidatamoduleimpl, USearch;

{$R *.DFM}

{ TPMFMain }

procedure TPMFMain.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_PMFMainPage); }
end;

procedure TPMFMain.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IPMFMainEvents;
end;

procedure TPMFMain.Initialize;
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

function TPMFMain.Get_Active: WordBool;
begin
  Result := Active;
end;

function TPMFMain.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TPMFMain.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TPMFMain.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TPMFMain.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TPMFMain.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TPMFMain.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TPMFMain.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TPMFMain.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TPMFMain.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TPMFMain.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TPMFMain.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TPMFMain.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TPMFMain.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TPMFMain.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TPMFMain.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TPMFMain.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TPMFMain.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TPMFMain._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPMFMain.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TPMFMain.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TPMFMain.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TPMFMain.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TPMFMain.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TPMFMain.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TPMFMain.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TPMFMain.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TPMFMain.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TPMFMain.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TPMFMain.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TPMFMain.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TPMFMain.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TPMFMain.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TPMFMain.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TPMFMain.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TPMFMain.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TPMFMain.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TPMFMain.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TPMFMain.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TPMFMain.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TPMFMain.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TPMFMain.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TPMFMain.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TPMFMain.Get_Owner:Integer;
begin
  Result := handle;
end;

procedure TPMFMain.Set_Owner(val : Integer);
begin
  if val > 0 then
     FOwnerHandle := val;
end;


function  TPMFMain.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TPMFMain.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
end;

function TPMFMain.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TPMFMain.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TPMFMain.UIObjectActivate: HResult;
begin
      Result := S_OK;
end;

function TPMFMain.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TPMFMain.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TPMFMain.SaveState: HResult;
begin
  Result := S_OK;
end;

function  TPMFMain.Get_Height : Integer;
begin
  Result := Height;
end;

function  TPMFMain.Get_Width  : Integer;
begin
  Result := Width;
end;

procedure TPMFMain.ActionInsertExecute(Sender: TObject);
var
   p : TStringList;
begin
     p:= TStringList.Create;
     p.Values['id']:=FloatToStr(INS_MotorFullID.Value);
     p.Values['KLI_ID']:=FloatToStr(INS_MotorFullKLI_ID.Value);
     p.Values['Mod']:='Insert';
    // p.Values['ID'] := IntToStr(PINS_CONSTRUCTION.CallIntegerFunction('generateID',[]));
    // INS_CONSTRUCTION.Insert;
     with plgBlank do
         ShowModal(StringToGuid('{E23FC4C0-937D-4C1A-B8A0-00F4D9130FAA}'),p );
     p.Free;

end;

procedure TPMFMain.ActionEditExecute(Sender: TObject);
var
   p : TStringList;
begin
    if INS_MotorFull.IsEmpty then
    begin
       ShowMessage('∆€дв€лд€ м€лумат йохдур !');
       exit;
    end;
    p:= TStringList.Create;
    p.Values['Mod']:='Edit';
    p.Values['ID']:=FloatToStr(INS_MotorFullID.Value);
    with plgBlank do
         ShowModal(StringToGuid('{E23FC4C0-937D-4C1A-B8A0-00F4D9130FAA}'),p );
    p.Free;

end;

procedure TPMFMain.ActionDeleteExecute(Sender: TObject);
var
    id:longint;
    i: Integer;
    WaitNextConfirm, WillRefresh: Boolean;
begin
    WaitNextConfirm :=True;
    WillRefresh :=False;
    with GridMotor,SelectedRows,Ins_MotorFull do
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
      DeleteMotorInfo(ID);
      WillRefresh :=True;
    end;
     ActionRefreshExecute(sender);

   finally
      if WillRefresh then
      ActionRefreshExecute(Sender);

  end;

end;

procedure TPMFMain.ActionRefreshExecute(Sender: TObject);
var
    ID: Longint;
begin
    with Ins_MotorFull do
    begin
        ID :=FieldByName('ID').AsInteger;
        Close;
        Open;
        Locate('ID',ID, []);
    end;

end;

procedure TPMFMain.FullRefresh(DataSetName: String);
const
     c_err_message = ' Table or View in Dataset "%s" does not exist! ';
var
     i: Word;
begin
     for i :=0 to ComponentCount- 1 do
     if (Components[i] is TOracleDataSet) and (Components[i].Name <> DataSetName) and (Components[i].Tag=0) then
     try
        (Components[i] as TOracleDataSet).Close;
        (Components[i] as TOracleDataSet).Open;
     except
         raise Exception.Create(Format(c_err_message, [(Components[i] as TDataSet).Name]));
     end;


end;

procedure TPMFMain.ActionFullRefreshExecute(Sender: TObject);
begin
     FullRefresh('');
end;

procedure TPMFMain.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
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

procedure TPMFMain.ActionExtraExecute(Sender: TObject);
begin
     PanelAcc.Visible:=not PanelAcc.Visible;
end;

procedure TPMFMain.GridMotorTitleClick(Column: TColumn);
var
   TitleName :string;
begin
   if Column.Field.Calculated then Exit;
   TitleName :=Column.FieldName;
   if Column.FieldName='NAME' then
      TitleName:='kli_id';
   with Ins_MotorFull do
   begin
        Screen.Cursor :=crSQLWait;
        SetVariable('Title',TitleName);
        Refresh;
        Screen.Cursor :=crDefault;
   end;

end;

procedure TPMFMain.DeleteMotorInfo(id: Integer);
begin
      try
         OPCommon.CallBooleanFunction('del_ins',[id,4]);
      except on E:EOracleError do
      case E.ErrorCode of
          { 20002: if MessageDlg('Secilmish hesab lagv olunacaq!',mtConfirmation,mbYesNoCancel, 0) = mrYes then
                 InsDataMod.OPCOMMON.CallProcedure('close_acc', [InsDataMod.ODSAccountID.value]);  }
           20001: ShowMessage('јсылы щесабларда галыг сыфырдан ф€рглидир!');
           20002: ShowMessage('явв€лж€ асылы щесаблары баьлайын!');
      end;
      end;

end;

procedure TPMFMain.ActiveFormCreate(Sender: TObject);
begin
     PMFMain:=Self;
     FParams := TStringList.Create;
     PanelAcc.Visible:=false;

end;

procedure TPMFMain.ActionSuggestionExecute(Sender: TObject);
var
   p : TStringList;  
begin
    p:= TStringList.Create;
    p.Values['MK_ID']:=FloatToStr(INS_MotorFullID.Value);
    if Suggestion.RecordCount<1 then
      p.Values['Mod']:='Insert'
   else
      p.Values['Mod']:='Edit';
    with plgBlank do
         ShowModal(StringToGuid('{9D5D6D94-4ED9-4D64-9BC1-67394E009B52}'),p );
    p.Free;


end;

procedure TPMFMain.ActionPolicyExecute(Sender: TObject);
var
   p : TStringList;
begin
   if SUGGESTIONID.Value=0 then
   begin
           ShowMessage('“€клифнам€ щазыр дейил ! явв€лж€ т€клифнам€ щазырланмалыдыр !');
           exit;
   end;
   p:=TStringList.Create;
   p.Values['id']:=FloatToStr(INS_MotorFullId.value);
  { p.Values['fid']:=FloatToStr(ODSCONSTSUGGESTfrz_id.Value);
   p.Values['cdid']:=FloatToStr(ODSCONSTSUGGESTCNDT_id.Value);
   p.Values['riskid']:=FloatToStr(INS_CONSTRUCTIONRiskId.value);}
   Policy.Close;
   Policy.SetVariable('ms_id',SuggestionID.value);
   Policy.Open;
   if Policy.RecordCount<1 then
      p.Values['Mod']:='Insert'
   else
      p.Values['Mod']:='Edit';
   with plgBlank do
         ShowModal(StringToGuid('{7269AF35-5AC3-406B-8330-29850E49B6A6}'),p );
   p.Free;

end;

procedure TPMFMain.ReportExecute(Sender: TObject);
var
     i:byte;
begin
     Ins_Report.Close;
     Ins_Report.SetVariable('id',Ins_MotorFullId.Value);
     Ins_Report.Open;
     More_Report.RefreshRecord;
     ODSBeneficiary.Locate('id',Ins_MotorFullProfitId.Value,[]);
     ODSAgents.Locate('id',Ins_MotorFullBroker.Value,[]);
     Customers.Locate('id',Ins_MotorFullKli_ID.Value,[]);
     with INSWordExporter1 do
       begin
          FileName:=ExtractFilePath(Application.ExeName)+ '\MotorFullApplicationForm.doc';
          Open(False);
          for i:=0 to lbBookmarks.Items.Count-1 do
          begin
             if Ins_Report.Fields[i+1].IsNull then Continue;
             SetBookmark(lbBookmarks.Items[i],Ins_Report.Fields[i+1].value, True, false, False, false, 10, 'Arial AzLat', False);
          end;

          
          SetBookmark('ContactP',CustomersContactperson.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('ContactP1',CustomersContactperson.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('Beneficiary',  ODSBeneficiaryName.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryA', ODSBeneficiaryAddress.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryT', ODSBeneficiaryPhone.value, True, false, False, false, 10, 'Arial AzLat', False);
          SetBookmark('BeneficiaryB', ODSBeneficiaryBanking_details.value, True, false, False, false, 10, 'Arial AzLat', False);
          if Accesories.RecordCount<>0 then
          begin
          Accesories.First;
          for i:=0 to Accesories.RecordCount-1 do
          begin
              if Accesories.Fields[i].IsNull then continue;
              SetBookmark('AType',AccesoriesType.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
              SetBookmark('AMake',AccesoriesMake.value+','+#13#10,false, false, False, false, 10, 'Arial AzLat', False);
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
              if More_Report.Fields[i].IsNull then continue;
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



procedure TPMFMain.ActionSearchExecute(Sender: TObject);
begin
     if not Assigned(frmSearch) then
      frmSearch := TfrmSearch.Create(Self);
      frmSearch.ShowModal;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TPMFMain,
    Class_PMFMain,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

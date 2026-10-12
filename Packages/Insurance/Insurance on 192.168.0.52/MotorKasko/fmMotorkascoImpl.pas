unit fmMotorkascoImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, MotorKasco_TLB, StdVcl, Grids, DBGrids, ComCtrls,
  ImgList, ToolWin, ActnList, StdCtrls, SBPlgAx50_TLB, OracleData,
  Menus, PlgModalContainer;

type
  TMKError = Exception;
  TfmMotorKasco = class(
      TActiveForm,
      IfmMotorkasco,
      IIconExporter)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ActionList1: TActionList;
    NewBlank: TAction;
    DelBlank: TAction;
    EditBlank: TAction;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ToolButton4: TToolButton;
    Refresh: TAction;
    ToolButton5: TToolButton;
    CallPolicy: TAction;
    CallSuggestion: TAction;
    ToolButton6: TToolButton;
    pmRefresh: TPopupMenu;
    N1: TMenuItem;
    aRefreshAll: TAction;
    pmcObject: TPlgModalContainer;
    procedure ActiveFormCreate(Sender: TObject);
    procedure NewBlankExecute(Sender: TObject);
    procedure DelBlankExecute(Sender: TObject);
    procedure EditBlankExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CallSuggestionExecute(Sender: TObject);
    procedure aRefreshAllExecute(Sender: TObject);
    procedure CallPolicyExecute(Sender: TObject);
  private
    { Private declarations }
    FEvents: IfmMotorkascoEvents;
{    frmClass: TFormClass;
    FPackageHandle : THandle;
    frm : TForm;   }
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
    function Get_Icon: OLE_HANDLE; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;
var
  fmMotorKasco : TfmMotorKasco;
implementation

uses ComObj, ComServ, UMotorKascoDataMod, sboapiDataModuleImpl;

{$R *.DFM}

{ TfmMotorkasco }
function TfmMotorKasco.Get_Icon: OLE_HANDLE;
const
  IconIndex = 8;
begin
  ImageList1.GetIcon(IconIndex, Icon);
  Result := Icon.Handle;
end;



procedure TfmMotorKasco.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_fmMotorkascoPage); }
end;

procedure TfmMotorKasco.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfmMotorkascoEvents;
end;

procedure TfmMotorKasco.Initialize;
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

function TfmMotorKasco.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfmMotorKasco.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfmMotorKasco.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfmMotorKasco.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfmMotorKasco.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfmMotorKasco.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfmMotorKasco.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfmMotorKasco.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfmMotorKasco.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfmMotorKasco.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfmMotorKasco.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfmMotorKasco.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfmMotorKasco.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfmMotorKasco.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfmMotorKasco.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfmMotorKasco.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfmMotorKasco.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfmMotorKasco.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfmMotorKasco._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMotorKasco.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfmMotorKasco.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfmMotorKasco.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfmMotorKasco.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfmMotorKasco.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfmMotorKasco.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfmMotorKasco.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfmMotorKasco.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfmMotorKasco.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfmMotorKasco.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfmMotorKasco.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfmMotorKasco.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfmMotorKasco.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfmMotorKasco.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfmMotorKasco.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfmMotorKasco.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfmMotorKasco.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfmMotorKasco.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfmMotorKasco.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfmMotorKasco.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfmMotorKasco.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfmMotorKasco.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfmMotorKasco.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfmMotorKasco.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfmMotorKasco.ActiveFormCreate(Sender: TObject);
begin
  fmMotorKasco := Self;
  DataModkasco := TDataModkasco.Create(Self);
end;

function TfmMotorKasco.ShowBlank(params : TStringList):Integer;
begin
   with pmcObject do begin
    Result := ShowModal(StringToGuid('{10B7A209-A993-466D-A763-98A80A7E74C6}'),params )
   end;
end;

procedure TfmMotorKasco.NewBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['Mod'] := 'Insert';
   with DataModkasco do begin
    params.Values['KLI_ID'] := IntToStr(ODSCustsID.Value);
    if ShowBlank(params) = mrOk then
      ODSINSMotorKasco.Refresh;
   end;
   params.Free;
end;

procedure TfmMotorKasco.DelBlankExecute(Sender: TObject);
begin
  with  DataModkasco.ODSINSMotorKasco do
     Delete();
end;

procedure TfmMotorKasco.EditBlankExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   params.Values['Mod'] := 'Edit';
   with DataModkasco do begin
     params.Values['ID'] := VarToStr(ODSINSMotorKascoID.Value);
     params.Values['KLI_ID'] := IntToStr(ODSCustsID.Value);
    if ShowBlank(params) = mrOk then
      ODSINSMotorKasco.RefreshRecord;
   end;   
   params.Free;
end;

procedure TfmMotorKasco.RefreshExecute(Sender: TObject);
begin
   with DataModkasco.ODSINSMotorKasco do
     Refresh;
end;

procedure TfmMotorKasco.DBGrid1DblClick(Sender: TObject);
begin
  EditBlank.Execute;
end;

function TfmMotorKasco.ShowSuggestion(params : TStringList):Integer;
begin
   with pmcObject do begin
    Result := ShowModal(StringToGuid('{D5269FCA-2559-4984-A565-16C0EE110CF6}'),params )
   end;
end;

procedure TfmMotorKasco.CallSuggestionExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   with DataModkasco do
   try
     if ODSINSMotorKasco.IsEmpty then
       raise TMKError.Create('goto');;
     params.Values['MK_ID'] := VarToStr(ODSINSMotorKascoID.Value);
     params.Values['KLI_ID'] := IntToStr(ODSCustsID.Value);
     ShowSuggestion(Params);
   finally
     Params.Free;
   end;
end;

procedure TfmMotorKasco.aRefreshAllExecute(Sender: TObject);
begin
  with DataModkasco do
    RefreshAll();
end;

function TfmMotorKasco.ShowPolicy(params : TStringList):Integer;
begin

   with pmcObject do begin
    Result := ShowModal(StringToGuid('{3C454A4C-C304-4633-AAAD-4C46C68BB8EE}'),params )
   end;
end;

procedure TfmMotorKasco.CallPolicyExecute(Sender: TObject);
var
   params : TStringList;
begin
   params := TStringList.Create;
   with DataModkasco do
   try
     if ODSINSMotorKasco.IsEmpty or ODSMKSuggestion.IsEmpty then
        raise TMKError.Create('goto');
//     ShowMessage(VarToStr(ODSMKSuggestionID.Value));
     params.Values['MKS_ID'] := VarToStr(ODSMKSuggestionID.Value);
     ShowPolicy(params);
   finally
     Params.Free;
   end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfmMotorKasco,
    Class_fmMotorKasco,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

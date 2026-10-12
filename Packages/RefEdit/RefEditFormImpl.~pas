unit RefEditFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, RefEdit_TLB, StdVcl, Grids, DBGrids, ExtCtrls, DBCtrls,
  ToolWin, ComCtrls, SBPlgAx50_TLB, Db, OracleData, ImgList;

type
  TRefEditForm = class(
      TActiveForm,
      IParamInput,
      IRefEditForm,
      IUIObject,
      IIconExporter)
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RefData: TOracleDataSet;
    RefDataNAME: TStringField;
    RefDataID: TFloatField;
    ImageList1: TImageList;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FParams: TStrings;
    FEvents: IRefEditFormEvents;
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
    function IRefEditForm.Get_Font = IRefEditForm_Get_Font;
    procedure IRefEditForm._Set_Font = IRefEditForm__Set_Font;
    procedure IRefEditForm.Set_Color = IRefEditForm_Set_Color;
    procedure IRefEditForm.Set_Font = IRefEditForm_Set_Font;
    function IRefEditForm_Get_Color: OLE_COLOR; safecall;
    function IRefEditForm_Get_Font: IFontDisp; safecall;
    procedure IRefEditForm__Set_Font(const Value: IFontDisp); safecall;
    procedure IRefEditForm_Set_Color(Value: OLE_COLOR); safecall;
    procedure IRefEditForm_Set_Font(var Value: IFontDisp); safecall;
    function IRefEditForm.Get_Color = IRefEditForm_Get_Color;
    {IParamInput}
    function  Get_Params(const Name: WideString): OleVariant; safecall;
    procedure Set_Params(const Name: WideString; Value: OleVariant); safecall;
    property Params[const Name: WideString]: OleVariant read Get_Params write Set_Params;
    {IInstance}
    function InstanceInitialize: HResult; safecall;
    function IUIObject.Initialize = InstanceInitialize;
    function Cleanup: HResult; safecall;
    {IUIObject}
    function  Get_Icon: OLE_HANDLE; safecall;
    function UIObjectActivate: HResult; safecall;
    function IUIObject.Activate = UIObjectActivate;
    function QueryDeactivate: HResult; safecall;
    function UIObjectDeactivate: HResult; safecall;
    function IUIObject.Deactivate = UIObjectDeactivate;
    function SaveState: HResult; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
    procedure View(const RefName: String; ReadOnly: Boolean);
  end;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TRefEditForm }

resourcestring
  sRefSql = 'select r.*, r.rowid from REF_%s r order by ID';
  sRefNameParam = 'RefName';
  sModeParam = 'ViewMode';
  sCaptionParam = 'Caption';

procedure TRefEditForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_RefEditFormPage); }
end;

procedure TRefEditForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IRefEditFormEvents;
end;

procedure TRefEditForm.Initialize;
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

function TRefEditForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TRefEditForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TRefEditForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TRefEditForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TRefEditForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TRefEditForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TRefEditForm.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TRefEditForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TRefEditForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TRefEditForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TRefEditForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TRefEditForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TRefEditForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TRefEditForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TRefEditForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TRefEditForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TRefEditForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TRefEditForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TRefEditForm._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TRefEditForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TRefEditForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TRefEditForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TRefEditForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TRefEditForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TRefEditForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TRefEditForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TRefEditForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TRefEditForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TRefEditForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TRefEditForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TRefEditForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TRefEditForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TRefEditForm.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TRefEditForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TRefEditForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TRefEditForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TRefEditForm.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TRefEditForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TRefEditForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TRefEditForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TRefEditForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TRefEditForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TRefEditForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function  TRefEditForm.Get_Params(const Name: WideString): OleVariant;
begin
  Result := FParams.Values[Name];
end;

procedure TRefEditForm.Set_Params(const Name: WideString; Value: OleVariant);
begin
  FParams.Values[Name] := Value;
  if Name = sCaptionParam then
    Caption := Value;
end;

procedure TRefEditForm.ActiveFormCreate(Sender: TObject);
begin
  FParams := TStringList.Create;
end;

procedure TRefEditForm.ActiveFormDestroy(Sender: TObject);
begin
  FParams.Free;
end;

function TRefEditForm.IRefEditForm_Get_Color: OLE_COLOR;
begin

end;

function TRefEditForm.IRefEditForm_Get_Font: IFontDisp;
begin

end;

procedure TRefEditForm.IRefEditForm__Set_Font(const Value: IFontDisp);
begin

end;

procedure TRefEditForm.IRefEditForm_Set_Color(Value: OLE_COLOR);
begin

end;

procedure TRefEditForm.IRefEditForm_Set_Font(var Value: IFontDisp);
begin

end;

function  TRefEditForm.Get_Icon: OLE_HANDLE;
begin
  ImageList1.GetIcon(0, Icon);
  Result := Icon.Handle;
end;

function TRefEditForm.InstanceInitialize: HResult;
begin
  Result := S_OK;
end;

function TRefEditForm.Cleanup: HResult;
begin
  Result := S_OK;
end;

function TRefEditForm.UIObjectActivate: HResult;
begin
  View(Params[sRefNameParam], Params[sModeParam] = 'view');
  Result := S_OK;
end;

function TRefEditForm.QueryDeactivate: HResult;
begin
  Result := S_OK;
end;

function TRefEditForm.UIObjectDeactivate: HResult;
begin
  Result := S_OK;
end;

function TRefEditForm.SaveState: HResult;
begin
  Result := S_OK;
end;

procedure TRefEditForm.View(const RefName: String; ReadOnly: Boolean);
begin
  with RefData do
  begin
    Close;
    SQL.Text := Format(sRefSql, [RefName]);
    Open;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TRefEditForm,
    Class_RefEditForm,
    2,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

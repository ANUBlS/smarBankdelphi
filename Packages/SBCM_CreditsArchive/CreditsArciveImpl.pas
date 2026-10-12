unit CreditsArciveImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, CreditsArcive_TLB, StdVcl, Grids, DBGrids, ExtCtrls,
  ComCtrls, ToolWin, ImgList, Db, OracleData,SBPlgAx50_TLB;

type
  TFrmCreditsArcive = class(TActiveForm, IFrmCreditsArcive,IIconExporter)
    ArchiveViewer: TDBGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    TBCommit: TToolButton;
    ToolButton2: TToolButton;
    TBRollback: TToolButton;
    ToolButton4: TToolButton;
    TBRefresh: TToolButton;
    MainImageList: TImageList;
    ArchiveCredits: TOracleDataSet;
    DataSrcArchiveCredits: TDataSource;
    ArchiveCreditsCLIENTACCNO: TStringField;
    ArchiveCreditsCLIENTACCNAME: TStringField;
    ArchiveCreditsCONTRACTNO: TStringField;
    ArchiveCreditsTYPE: TFloatField;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure TBRefreshClick(Sender: TObject);
    procedure TBCommitClick(Sender: TObject);
    procedure TBRollbackClick(Sender: TObject);
    procedure ArchiveCreditsAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FEvents: IFrmCreditsArciveEvents;
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
    procedure Set_Visible(Value: WordBool); safecall;  function IFrmCreditsArcive.Get_Color = IFrmCreditsArcive_Get_Color;
    function IFrmCreditsArcive.Get_Font = IFrmCreditsArcive_Get_Font;
    procedure IFrmCreditsArcive._Set_Font = IFrmCreditsArcive__Set_Font;
    procedure IFrmCreditsArcive.Set_Color = IFrmCreditsArcive_Set_Color;
    procedure IFrmCreditsArcive.Set_Font = IFrmCreditsArcive_Set_Font;
  
    function IFrmCreditsArcive_Get_Color: Ole_Color; safecall;
    function IFrmCreditsArcive_Get_Font: IFontDisp; safecall;
    procedure IFrmCreditsArcive__Set_Font(const Value : IFontDisp); safecall;
    procedure IFrmCreditsArcive_Set_Color(Value: OLE_COLOR); safecall;
    procedure IFrmCreditsArcive_Set_Font(var Value : IFontDisp); safecall;
    function  Get_Icon: OLE_HANDLE; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ,sboapiDataModuleImpl;

{$R *.DFM}

{ TFrmCreditsArcive }

procedure TFrmCreditsArcive.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmCreditsArcivePage); }
end;

procedure TFrmCreditsArcive.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmCreditsArciveEvents;
end;

procedure TFrmCreditsArcive.Initialize;
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

function TFrmCreditsArcive.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmCreditsArcive.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmCreditsArcive.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmCreditsArcive.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmCreditsArcive.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmCreditsArcive.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmCreditsArcive.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmCreditsArcive.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmCreditsArcive.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmCreditsArcive.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmCreditsArcive.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmCreditsArcive.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmCreditsArcive.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmCreditsArcive.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmCreditsArcive.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmCreditsArcive.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmCreditsArcive.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmCreditsArcive.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmCreditsArcive._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmCreditsArcive.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmCreditsArcive.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmCreditsArcive.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmCreditsArcive.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmCreditsArcive.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmCreditsArcive.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmCreditsArcive.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmCreditsArcive.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmCreditsArcive.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmCreditsArcive.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmCreditsArcive.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmCreditsArcive.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmCreditsArcive.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmCreditsArcive.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmCreditsArcive.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmCreditsArcive.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmCreditsArcive.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmCreditsArcive.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmCreditsArcive.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmCreditsArcive.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmCreditsArcive.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmCreditsArcive.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmCreditsArcive.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmCreditsArcive.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TFrmCreditsArcive.ActiveFormCreate(Sender: TObject);
begin
  ArchiveCredits.Open;
end;

procedure TFrmCreditsArcive.ActiveFormDestroy(Sender: TObject);
begin
  ArchiveCredits.CloseAll;
end;

procedure TFrmCreditsArcive.TBRefreshClick(Sender: TObject);
begin
  ArchiveCredits.Refresh  
end;

procedure TFrmCreditsArcive.TBCommitClick(Sender: TObject);
begin
  ArchiveCredits.Session.Commit;
  (Sender as TToolButton).Enabled := False;
  TBRollback.Enabled := False;
  TBRefreshClick(nil)
end;

procedure TFrmCreditsArcive.TBRollbackClick(Sender: TObject);
begin
  ArchiveCredits.Session.Rollback;
  (Sender as TToolButton).Enabled := False;
  TBCommit.Enabled := False;
  TBRefreshClick(nil)
end;

procedure TFrmCreditsArcive.ArchiveCreditsAfterPost(DataSet: TDataSet);
begin
  TBCommit.Enabled := true;
  TBRollback.Enabled := true;
end;

function TFrmCreditsArcive.IFrmCreditsArcive_Get_Color: OLE_COLOR;
begin

end;

function TFrmCreditsArcive.IFrmCreditsArcive_Get_Font: IFontDisp;
begin

end;

procedure TFrmCreditsArcive.IFrmCreditsArcive__Set_Font(const Value : IFontDisp);
begin

end;

procedure TFrmCreditsArcive.IFrmCreditsArcive_Set_Color(Value : OLE_COLOR);
begin

end;

procedure TFrmCreditsArcive.IFrmCreditsArcive_Set_Font(var Value : IFontDisp);
begin

end;

function TFrmCreditsArcive.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 3;
begin
  MainImageList.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;


initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmCreditsArcive,
    Class_FrmCreditsArcive,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit UntContractCorrectionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ContractCorrection_TLB, StdVcl, StdCtrls, ExtCtrls,
  Grids, DBGrids,DB,SBPlgAx50_TLB, ImgList, ComCtrls, ToolWin, OracleData;

type
  TFrmContractCorrection = class(TActiveForm, IFrmContractCorrection,IIconExporter)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    CorrectionGrid: TDBGrid;
    ContractNameEdit: TEdit;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DataSrcContracts: TDataSource;
    Contracts: TOracleDataSet;
    ContractsID: TFloatField;
    ContractsRESIDUARYAMOUNT: TFloatField;
    ContractsCLIENTCURRENCY: TStringField;
    ContractsCLIENTACCNO: TStringField;
    ContractsCLIENTACCNAME: TStringField;
    ContractsCONTRACTNO: TStringField;
    ContractsLASTPROCESSDATE: TDateTimeField;
    ContractsFACTICALDEBT: TFloatField;
    ContractsFACTICALINTERESTDEBT: TFloatField;
    ContractsOVERDUEDEBT: TFloatField;
    ContractsOVERDUEINTERESTDEBT: TFloatField;
    ContractsCALCULATIONENABLED: TFloatField;
    procedure ContractNameEditChange(Sender: TObject);
    procedure ContractNameEditExit(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ContractsAfterPost(DataSet: TDataSet);
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FEvents: IFrmContractCorrectionEvents;
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
    function  Get_Icon: OLE_HANDLE; safecall;
    function IFrmContractCorrection.Get_Color = IFrmContractCorrection_Get_Color;
    function IFrmContractCorrection.Get_Font = IFrmContractCorrection_Get_Font;
    procedure IFrmContractCorrection._Set_Font = IFrmContractCorrection__Set_Font;
    procedure IFrmContractCorrection.Set_Color = IFrmContractCorrection_Set_Color;
    procedure IFrmContractCorrection.Set_Font = IFrmContractCorrection_Set_Font;

    function IFrmContractCorrection_Get_Color:Ole_Color ; safecall;
    function IFrmContractCorrection_Get_Font: IFontDisp; safecall;
    procedure IFrmContractCorrection__Set_Font(const Value : IFontDisp); safecall;
    procedure IFrmContractCorrection_Set_Color(Value :OLE_COLOR); safecall;
    procedure IFrmContractCorrection_Set_Font(var Value :IFontDisp); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
    procedure MouseWheelHandler(var Message: TMessage);override;
  end;

var
  FrmContractCorrection :TFrmContractCorrection;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl;

{$R *.DFM}

{ TFrmContractCorrection }

procedure TFrmContractCorrection.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_FrmContractCorrectionPage); }
end;

procedure TFrmContractCorrection.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IFrmContractCorrectionEvents;
end;

procedure TFrmContractCorrection.Initialize;
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

function TFrmContractCorrection.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmContractCorrection.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmContractCorrection.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmContractCorrection.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmContractCorrection.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmContractCorrection.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmContractCorrection.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmContractCorrection.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmContractCorrection.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmContractCorrection.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmContractCorrection.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmContractCorrection.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmContractCorrection.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmContractCorrection.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmContractCorrection.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmContractCorrection.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmContractCorrection.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmContractCorrection.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmContractCorrection._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmContractCorrection.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmContractCorrection.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmContractCorrection.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmContractCorrection.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmContractCorrection.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmContractCorrection.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmContractCorrection.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmContractCorrection.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmContractCorrection.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmContractCorrection.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmContractCorrection.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmContractCorrection.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmContractCorrection.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmContractCorrection.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmContractCorrection.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmContractCorrection.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmContractCorrection.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmContractCorrection.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmContractCorrection.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmContractCorrection.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmContractCorrection.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmContractCorrection.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmContractCorrection.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmContractCorrection.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;
    {**********************************************************}
function TFrmContractCorrection.Get_Icon: OLE_HANDLE;
const
  ImageIndex = 0;
begin
  ImageList1.GetIcon(ImageIndex, Icon);
  Result := Icon.Handle;
end;
procedure TFrmContractCorrection.ContractNameEditChange(Sender: TObject);
begin
  if ContractNameEdit.Text <> '' then
  Contracts.Locate('ContractNO',ContractNameEdit.Text,[loCaseInsensitive, loPartialKey])
end;

procedure TFrmContractCorrection.ContractNameEditExit(Sender: TObject);
begin
  ContractNameEdit.Text :='';
end;

function TFrmContractCorrection.IFrmContractCorrection_Get_Color: OLE_COLOR;
begin

end;

function TFrmContractCorrection.IFrmContractCorrection_Get_Font: IFontDisp ;
begin

end;

procedure TFrmContractCorrection.IFrmContractCorrection__Set_Font(
  const Value :IFontDisp);
begin

end;

procedure TFrmContractCorrection.IFrmContractCorrection_Set_Color(Value :OLE_COLOR);
begin

end;

procedure TFrmContractCorrection.IFrmContractCorrection_Set_Font(
  var Value :IFontDisp);
begin

end;

procedure TFrmContractCorrection.MouseWheelHandler(var Message: TMessage);
begin
  if CorrectionGrid.Focused then
  begin
    CorrectionGrid.SelectedRows.Clear;
    with TCMMouseWheel(Message), CorrectionGrid.DataSource.DataSet do
      if WheelDelta < 0 then
        Next
      else
        Prior;
  end;
end;


procedure TFrmContractCorrection.ToolButton1Click(Sender: TObject);
begin
  with  Contracts.Session do
   Commit;
   (Sender as TToolButton).Enabled := False;
   ToolButton3.Enabled := False;
   ToolButton5Click(nil);
end;

procedure TFrmContractCorrection.ToolButton5Click(Sender: TObject);
begin
  with  Contracts do
  Refresh;
end;

procedure TFrmContractCorrection.ToolButton3Click(Sender: TObject);
begin
  with  Contracts.Session do
  Rollback;
  (Sender as TToolButton).Enabled := False;
  ToolButton1.Enabled := False;
  ToolButton5Click(nil);
end;

procedure TFrmContractCorrection.ContractsAfterPost(DataSet: TDataSet);
begin
  ToolButton1.Enabled := True;
  ToolButton3.Enabled := True;
end;

procedure TFrmContractCorrection.ActiveFormCreate(Sender: TObject);
begin
  Contracts.Open;
end;

procedure TFrmContractCorrection.ActiveFormDestroy(Sender: TObject);
begin
  Contracts.CloseAll;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmContractCorrection,
    Class_FrmContractCorrection,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

unit CableSettingsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  ActiveX, AxCtrls, CableSet_TLB, StdVcl, ComCtrls, Db, OracleData, Oracle,
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask, AppEvnts,
  Menus;

type
  TCableSettings = class(TActiveForm, ICableSettings)
    odsDocTypes: TOracleDataSet;
    CABLE_SETTINGS: TOraclePackage;
    OracleDataSet2: TOracleDataSet;
    dsDocTypes: TDataSource;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    odsStatuses: TOracleDataSet;
    dsStatuses: TDataSource;
    odsServices: TOracleDataSet;
    dsServices: TDataSource;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    DBGrid4: TDBGrid;
    odsCountries: TOracleDataSet;
    dsCountries: TDataSource;
    TabSheet5: TTabSheet;
    odsChannels: TOracleDataSet;
    dsChannels: TDataSource;
    TabSheet6: TTabSheet;
    odsPackages: TOracleDataSet;
    dsPackages: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBGrid5: TDBGrid;
    Panel6: TPanel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    edDTName: TEdit;
    edStName: TEdit;
    edSeName: TEdit;
    edCoName: TEdit;
    edChName: TEdit;
    cbChCountry: TDBLookupComboBox;
    edChDesc: TEdit;
    odsPackChan: TOracleDataSet;
    dsPackChan: TDataSource;
    Panel7: TPanel;
    DBGrid6: TDBGrid;
    Panel8: TPanel;
    DBGrid7: TDBGrid;
    Panel9: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    edPackName: TEdit;
    edPackInst: TEdit;
    Panel10: TPanel;
    BitBtn19: TBitBtn;
    BitBtn21: TBitBtn;
    cbChannel: TDBLookupComboBox;
    edPackAb: TEdit;
    edPackDep: TEdit;
    TabSheet7: TTabSheet;
    DBGrid8: TDBGrid;
    Panel11: TPanel;
    BitBtn20: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    edEngineerName: TEdit;
    odsEngineers: TOracleDataSet;
    dsEngineers: TDataSource;
    cbAccs: TDBLookupComboBox;
    odsAccs: TOracleDataSet;
    dsAccs: TDataSource;
    dbAccP: TDBLookupComboBox;
    TabSheet8: TTabSheet;
    odsSett: TOracleDataSet;
    dsSett: TDataSource;
    odsSettMAXREST: TFloatField;
    odsSettDEFBALCN: TFloatField;
    odsSettDEFCUST: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    odsPackagesID: TFloatField;
    odsPackagesNAME: TStringField;
    odsPackagesINST_PRICE: TFloatField;
    odsPackagesPRICE: TFloatField;
    odsPackagesDEPOSIT: TFloatField;
    odsPackagesACID: TFloatField;
    odsPackagesACC_NO: TStringField;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    Yenile1: TMenuItem;
    odsPackagesSYMB: TStringField;
    edSymb: TEdit;
    EdtServPrice: TEdit;
    procedure ActiveFormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure OrderByColumn(DataSet: TOracleDataSet; Column: TColumn); 
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid8CellClick(Column: TColumn);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Yenile1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: ICableSettingsEvents;
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
  public
    { Public declarations }
    procedure Initialize; override;
  end;

var orderbyAD: String[5];

implementation

uses ComObj, ComServ, sboapidatamoduleimpl;

{$R *.DFM}

{ TCableSettings }

procedure TCableSettings.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CableSettingsPage); }
end;

procedure TCableSettings.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICableSettingsEvents;
end;

procedure TCableSettings.Initialize;
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

function TCableSettings.Get_Active: WordBool;
begin
  Result := Active;
end;

function TCableSettings.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TCableSettings.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TCableSettings.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TCableSettings.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TCableSettings.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TCableSettings.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TCableSettings.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TCableSettings.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TCableSettings.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TCableSettings.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TCableSettings.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TCableSettings.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TCableSettings.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TCableSettings.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TCableSettings.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TCableSettings.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TCableSettings.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TCableSettings._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableSettings.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TCableSettings.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TCableSettings.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TCableSettings.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TCableSettings.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TCableSettings.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TCableSettings.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TCableSettings.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TCableSettings.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TCableSettings.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TCableSettings.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TCableSettings.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TCableSettings.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TCableSettings.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TCableSettings.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TCableSettings.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TCableSettings.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TCableSettings.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TCableSettings.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TCableSettings.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TCableSettings.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TCableSettings.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TCableSettings.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TCableSettings.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TCableSettings.ActiveFormActivate(Sender: TObject);
var
  i: Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if (Components[i] is TOracleDataSet) and (Components[i].Tag=1) then
      (Components[i] as TOracleDataSet).Open;
  end;
  for i:=0 to ComponentCount-1 do begin
    orderbyAD := ' desc';
    if (Components[i] is TDBGrid) then
      OrderByColumn(TOracleDataSet((Components[i] as TDBGrid).datasource.dataset), (Components[i] as TDBGrid).Columns[0]);
  end;
  PageControl1.ActivePageIndex := 0;
  odsSett.Edit;
end;

procedure TCableSettings.DBGrid1CellClick(Column: TColumn);
begin
  edDTName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
end;

procedure TCableSettings.DBGrid2CellClick(Column: TColumn);
begin
  edStName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
end;

procedure TCableSettings.DBGrid3CellClick(Column: TColumn);
begin
  edSeName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
  cbAccs.KeyValue := Column.Grid.DataSource.DataSet.Fields[2].AsString;
  EdtServPrice.Text := Column.Grid.DataSource.DataSet.FieldByName('price').AsString;
end;

procedure TCableSettings.DBGrid4CellClick(Column: TColumn);
begin
  edCoName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
end;

procedure TCableSettings.DBGrid5CellClick(Column: TColumn);
begin
  edChName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
  cbChCountry.KeyValue := Column.Grid.DataSource.DataSet.Fields[4].AsVariant;
  edChDesc.Text := Column.Grid.DataSource.DataSet.Fields[3].AsString;
end;

procedure TCableSettings.DBGrid8CellClick(Column: TColumn);
begin
  edEngineerName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
end;

procedure TCableSettings.BitBtn1Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('doctypeadd',[edDTName.Text]);
  odsDocTypes.Close;
  odsDocTypes.Open;
end;

procedure TCableSettings.BitBtn4Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('statusadd',[edStName.Text]);
  odsStatuses.Close;
  odsStatuses.Open;
end;
     
procedure TCableSettings.BitBtn20Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('engineeradd',[edEngineerName.Text]);
  odsEngineers.Close;
  odsEngineers.Open;
end;

procedure TCableSettings.BitBtn7Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('serviceadd',[edSeName.Text, cbAccs.KeyValue, EdtServPrice.Text]);
  odsServices.Close;
  odsServices.Open;
end;

procedure TCableSettings.BitBtn10Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('countryadd',[edCoName.Text]);
  odsCountries.Close;
  odsCountries.Open;
end;

procedure TCableSettings.BitBtn2Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('doctypeupd',[odsDocTypes.Fields[0].Value, edDTName.Text]);
  odsDocTypes.Close;
  odsDocTypes.Open;
end;

procedure TCableSettings.BitBtn5Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('statusupd',[odsStatuses.Fields[0].Value, edStName.Text]);
  odsStatuses.Close;
  odsStatuses.Open;
end;

procedure TCableSettings.BitBtn8Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('serviceupd',[odsServices.Fields[0].Value, edSeName.Text, cbAccs.KeyValue, EdtServPrice.Text]);
  odsServices.Close;
  odsServices.Open;
end;
 
procedure TCableSettings.BitBtn22Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('engineerupd',[odsEngineers.Fields[0].Value, edEngineerName.Text]);
  odsEngineers.Close;
  odsEngineers.Open;
end;

procedure TCableSettings.BitBtn11Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('countryupd',[odsCountries.Fields[0].Value, edCoName.Text]);
  odsCountries.Close;
  odsCountries.Open;
end;

procedure TCableSettings.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('doctypedel',[odsDocTypes.Fields[0].Value]);
  odsDocTypes.Close;
  odsDocTypes.Open;
end;

procedure TCableSettings.BitBtn6Click(Sender: TObject);
begin                   
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('statusdel',[odsStatuses.Fields[0].Value]);
  odsStatuses.Close;
  odsStatuses.Open;
end;

procedure TCableSettings.BitBtn23Click(Sender: TObject);
begin                           
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('engineerdel',[odsEngineers.Fields[0].Value]);
  odsEngineers.Close;
  odsEngineers.Open;
end;

procedure TCableSettings.BitBtn9Click(Sender: TObject);
begin                          
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('servicedel',[odsServices.Fields[0].Value]);
  odsServices.Close;
  odsServices.Open;
end;

procedure TCableSettings.BitBtn12Click(Sender: TObject);
begin                                  
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('countrydel',[odsCountries.Fields[0].Value]);
  odsCountries.Close;
  odsCountries.Open;
end;

procedure TCableSettings.BitBtn13Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('channeladd',[edChName.Text, cbChCountry.KeyValue, edChDesc.Text]);
  odsChannels.Close;
  odsChannels.Open;
end;

procedure TCableSettings.BitBtn14Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('channelupd',[odsChannels.Fields[0].Value, edChName.Text, cbChCountry.KeyValue, edChDesc.Text]);
  odsChannels.Close;
  odsChannels.Open;
end;

procedure TCableSettings.BitBtn15Click(Sender: TObject);
begin                          
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('channeldel',[odsChannels.Fields[0].Value]);
  odsChannels.Close;
  odsChannels.Open;
end;

procedure TCableSettings.DBGrid7CellClick(Column: TColumn);
begin
  edPackName.Text := Column.Grid.DataSource.DataSet.Fields[1].AsString;
  edPackAb.Text := Column.Grid.DataSource.DataSet.Fields[3].AsString;
  edPackInst.Text := Column.Grid.DataSource.DataSet.Fields[2].AsString;
  edPackDep.Text := Column.Grid.DataSource.DataSet.Fields[4].AsString;
  dbAccP.KeyValue := Column.Grid.DataSource.DataSet.Fields[5].AsVariant;
end;

procedure TCableSettings.BitBtn16Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('packageadd',[edPackName.Text, edPackInst.Text, edPackAb.Text, edPackDep.Text, dbAccP.KeyValue, edSymb.Text ]);
  odsPackages.Close;
  odsPackages.Open;
end;

procedure TCableSettings.BitBtn17Click(Sender: TObject);
begin
  CABLE_SETTINGS.CallProcedure('packageupd',[odsPackages.Fields[0].Value, edPackName.Text, edPackInst.Text, edPackAb.Text, edPackDep.Text, dbAccP.KeyValue, edSymb.Text]);
  odsPackages.Close;
  odsPackages.Open;
end;

procedure TCableSettings.BitBtn18Click(Sender: TObject);
begin                             
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('packagedel',[odsPackages.Fields[0].Value]);
  odsPackages.Close;
  odsPackages.Open;
end;

procedure TCableSettings.DBGrid6CellClick(Column: TColumn);
begin
  cbChannel.KeyValue := Column.Grid.DataSource.DataSet.Fields[0].AsString;
end;

procedure TCableSettings.BitBtn19Click(Sender: TObject);
var
  Res: Integer;
begin
  Res := CABLE_SETTINGS.CallIntegerFunction('packchnadd',[cbChannel.KeyValue, odsPackages.Fields[0].AsString]);
  odsPackChan.Close;
  odsPackChan.Open;
end;

procedure TCableSettings.BitBtn21Click(Sender: TObject);
begin                            
  if MessageDlg ('…азы силин€ж€к. яминсиниз?',mtWarning,[mbYes, mbNo],sw_show)=idno then exit;
  CABLE_SETTINGS.CallProcedure('packchndel',[cbChannel.KeyValue, odsPackages.Fields[0].Value]);
  odsPackChan.Close;
  odsPackChan.Open;
end;

procedure TCableSettings.OrderByColumn(DataSet: TOracleDataSet; Column: TColumn);
var
  PosT: Integer;
begin
  if (orderbyAD=' desc') then orderbyAD := ' asc' else orderbyAD := ' desc';
  PosT := DataSet.SQL.Add('order by '+ Column.FieldName+orderbyAD);
  DataSet.Close;
  DataSet.Open;
  DataSet.SQL.Delete(PosT);
end;

procedure TCableSettings.DBGrid1TitleClick(Column: TColumn);
begin
  OrderByColumn(TOracleDataSet(Column.Grid.DataSource.DataSet), Column);
end;

procedure TCableSettings.Button1Click(Sender: TObject);
begin
  odsSett.Post;
  odsSett.Edit;
end;

procedure TCableSettings.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if (copy(E.Message, 5, 5)='12899') then
    ShowMessage('…азы сащ€й€ йерл€шмир.')
  else
    ShowMessage('ћ€лумат с€щв даxил олунур в€ йа нам€лум с€щв '+copy(E.Message, 5, 5));
end;

procedure TCableSettings.Yenile1Click(Sender: TObject);
var i: integer;
begin

  for i:=0 to ComponentCount-1 do begin
    if (Components[i] is TOracleDataSet) and (Components[i].Tag=1) then begin
      (Components[i] as TOracleDataSet).Close;
      (Components[i] as TOracleDataSet).Open;
    end;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TCableSettings,
    Class_CableSettings,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

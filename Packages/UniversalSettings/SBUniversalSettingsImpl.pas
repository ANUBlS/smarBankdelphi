unit SBUniversalSettingsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, SSTUniversalSettings_TLB, StdVcl, Db, OracleData,
  Grids, DBGrids, ExtCtrls, ActnList, DBCtrls, StdCtrls;

type
  TSBUniversalSettings = class(TActiveForm, ISBUniversalSettings)
    ODSTables: TOracleDataSet;
    Panel1: TPanel;
    grSettings: TDBGrid;
    Panel2: TPanel;
    grTables: TDBGrid;
    DSTables: TDataSource;
    DSCont: TDataSource;
    ODSCont1: TOracleDataSet;
    ODSTablesID: TFloatField;
    ODSTablesNAME: TWideStringField;
    ODSTablesQUERYST: TWideStringField;
    ODSTablesDESCRT: TWideStringField;
    ODSColumnTitlles: TOracleDataSet;
    ODSColumnTitllesCOLUMNID: TFloatField;
    ODSColumnTitllesCOLUMNTITLE: TWideStringField;
    ODSColumnTitllesCOLUMNWIDTH: TFloatField;
    acts: TActionList;
    actNew: TAction;
    ODSTablesORDERCOL: TWideStringField;
    DBNavigator1: TDBNavigator;
    ODSTablesQUERY_WHERE: TWideStringField;
    ODSTablesDEF_VALUE: TWideStringField;
    Panel3: TPanel;
    EditID: TEdit;
    EditDESCRT: TEdit;
    ODSCont: TOracleDataSet;
    procedure grTablesCellClick(Column: TColumn);
    procedure grTablesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actNewExecute(Sender: TObject);
    procedure ODSCont1BeforePost(DataSet: TDataSet);
    procedure ODSCont1AfterPost(DataSet: TDataSet);
    procedure ODSCont1AfterDelete(DataSet: TDataSet);
    procedure ODSCont1AfterEdit(DataSet: TDataSet);
    procedure ODSCont1ApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
      procedure ActionSpeedSearchExecute(
  Sender: TObject);
    procedure ActiveFormCreate(Sender: TObject);
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure ODSTablesAfterScroll(DataSet: TDataSet);
    procedure EditIDExit(Sender: TObject);
    procedure EditDESCRTExit(Sender: TObject);
  private
    { Private declarations }
    FEvents: ISBUniversalSettingsEvents;
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
    procedure AboutBox; safecall;
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

implementation

uses ComObj, ComServ, About1, sboapidatamoduleimpl, uNewUSImpl,SBTranslateProc;
   var j,doc_deps_type_id:Integer;
{$R *.DFM}

{ TSBUniversalSettings }

procedure TSBUniversalSettings.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_SBUniversalSettingsPage); }
end;
procedure TSBUniversalSettings.ActionSpeedSearchExecute(
  Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    with  TOracleDataSet(grTables.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlansın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmayıb!',mtInformation,[mbOK],0);
 end;

end;

procedure TSBUniversalSettings.EditDESCRTExit(Sender: TObject);
begin
TEdit(Sender).Text :=EmptyStr;
end;

procedure TSBUniversalSettings.EditIDExit(Sender: TObject);
begin
TEdit(Sender).Text :=EmptyStr;
end;

procedure TSBUniversalSettings.EditIDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13  then
   ActionSpeedSearchExecute(Sender);
end;

procedure TSBUniversalSettings.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ISBUniversalSettingsEvents;
end;

procedure TSBUniversalSettings.Initialize;
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

function TSBUniversalSettings.Get_Active: WordBool;
begin
  Result := Active;
end;

function TSBUniversalSettings.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TSBUniversalSettings.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TSBUniversalSettings.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TSBUniversalSettings.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TSBUniversalSettings.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TSBUniversalSettings.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TSBUniversalSettings.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TSBUniversalSettings.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TSBUniversalSettings.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TSBUniversalSettings.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TSBUniversalSettings.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TSBUniversalSettings.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TSBUniversalSettings.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TSBUniversalSettings.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TSBUniversalSettings.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TSBUniversalSettings.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TSBUniversalSettings.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TSBUniversalSettings._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBUniversalSettings.AboutBox;
begin
  ShowSBUniversalSettingsAbout;
end;

procedure TSBUniversalSettings.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TSBUniversalSettings.ActiveFormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

procedure TSBUniversalSettings.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TSBUniversalSettings.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TSBUniversalSettings.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TSBUniversalSettings.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TSBUniversalSettings.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TSBUniversalSettings.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TSBUniversalSettings.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TSBUniversalSettings.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TSBUniversalSettings.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TSBUniversalSettings.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TSBUniversalSettings.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TSBUniversalSettings.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TSBUniversalSettings.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TSBUniversalSettings.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TSBUniversalSettings.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TSBUniversalSettings.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TSBUniversalSettings.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TSBUniversalSettings.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TSBUniversalSettings.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TSBUniversalSettings.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TSBUniversalSettings.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TSBUniversalSettings.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TSBUniversalSettings.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TSBUniversalSettings.grTablesCellClick(Column: TColumn);
const
  sqlref = 'select r.rowid, %s from %s r where %s order by %s';
var
  i: Integer;
begin
  with ODSCont do begin
    close;
       if ODSTablesQUERY_WHERE.isNull
        then
        sql.text := format(sqlref, [ODSTablesQUERYST.AsVariant
                               , ODSTablesNAME.AsVariant
                               , '1=1'
                                      , ODSTablesORDERCOL.AsVariant])
        else
        sql.text := format(sqlref, [ODSTablesQUERYST.AsVariant
                                      , ODSTablesNAME.AsVariant
                                      , ODSTablesQUERY_WHERE.AsVariant
                                      , ODSTablesORDERCOL.AsVariant]);

        open;

    for i:=0 to Fields.Count-1 do
      Fields[i].Required := False;
  end;
  with ODSColumnTitlles do begin
    Close;
    SetVariable('tableid', ODSTablesID.AsInteger);
    Open;
  end;
  with grSettings do
    for i:=0 to Columns.Count-1 do begin
      ODSColumnTitlles.Locate('columnid', i, []);
      Columns[i].Title.Caption := ODSColumnTitllesCOLUMNTITLE.AsString;
      if ODSColumnTitllesCOLUMNWIDTH.AsInteger>0 then
        Columns[i].Width := ODSColumnTitllesCOLUMNWIDTH.AsInteger;
    end;
end;

procedure TSBUniversalSettings.grTablesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f5 then ((Sender as TDBGrid).DataSource.DataSet.Refresh);
  
end;

procedure TSBUniversalSettings.actNewExecute(Sender: TObject);
begin
  if not assigned(frmNewUS) then frmNewUS := TfrmNewUS.Create(Self);
  with frmNewUS do begin
    ShowModal;
  end;
end;

procedure TSBUniversalSettings.ODSCont1BeforePost(DataSet: TDataSet);
var value_column,a,c:string;
    value,b:Integer;
begin
{if not ODSTables.FieldByName('DEF_VALUE').isNull then
begin
a:=ODSTables.FieldByName('DEF_VALUE').AsVariant;
value_column:=a;
c:=a;
b:=Length(a);

Delete(value_column,b-1,2);
Delete(value_column,1,2);
Delete(c,1,b-1);
 value:=strtoint(c);

 ODSCont.FieldByName(value_column).asVariant:=value;
 end;     }
 //DOC_TYPE value_column
 end;

procedure TSBUniversalSettings.ODSTablesAfterScroll(DataSet: TDataSet);
const
  sqlref = 'select r.rowid, %s from %s r where %s order by %s';
var
  i: Integer;
begin
  with ODSCont do begin
    close;
       if ODSTablesQUERY_WHERE.isNull
        then
        sql.text := format(sqlref, [ODSTablesQUERYST.AsVariant
                               , ODSTablesNAME.AsVariant
                               , '1=1'
                                      , ODSTablesORDERCOL.AsVariant])
        else
        sql.text := format(sqlref, [ODSTablesQUERYST.AsVariant
                                      , ODSTablesNAME.AsVariant
                                      , ODSTablesQUERY_WHERE.AsVariant
                                      , ODSTablesORDERCOL.AsVariant]);

        open;

    for i:=0 to Fields.Count-1 do
      Fields[i].Required := False;
  end;
  with ODSColumnTitlles do begin
    Close;
    SetVariable('tableid', ODSTablesID.AsInteger);
    Open;
  end;
  with grSettings do
    for i:=0 to Columns.Count-1 do begin
      ODSColumnTitlles.Locate('columnid', i, []);
      Columns[i].Title.Caption := ODSColumnTitllesCOLUMNTITLE.AsString;
      if ODSColumnTitllesCOLUMNWIDTH.AsInteger>0 then
        Columns[i].Width := ODSColumnTitllesCOLUMNWIDTH.AsInteger;
    end;
end;


procedure TSBUniversalSettings.ODSCont1AfterPost(DataSet: TDataSet);
begin
j:= ODSTables.FieldByNAme('ID').asInteger;
ODSTables.Refresh;
ODSTables.Locate('ID',j,[loCaseInsensitive,LoPartialKey]);
end;

procedure TSBUniversalSettings.ODSCont1AfterDelete(DataSet: TDataSet);
begin
j:= ODSTables.FieldByNAme('ID').asInteger;
ODSTables.Refresh;
ODSTables.Locate('ID',j,[loCaseInsensitive,LoPartialKey]);
end;

procedure TSBUniversalSettings.ODSCont1AfterEdit(DataSet: TDataSet);
begin
j:= ODSTables.FieldByNAme('ID').asInteger;
ODSTables.Refresh;
ODSTables.Locate('ID',j,[loCaseInsensitive,LoPartialKey]);
end;

procedure TSBUniversalSettings.ODSCont1ApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var value_column,a,c:string;
    value,b:Integer;
begin
if not ODSTables.FieldByName('DEF_VALUE').isNull then
begin
a:=ODSTables.FieldByName('DEF_VALUE').AsVariant;
value_column:=a;
c:=a;
b:=Length(a);

Delete(value_column,b-1,2);
Delete(value_column,1,2);
Delete(c,1,b-1);
 value:=strtoint(c);

 ODSCont.FieldByName(value_column).asVariant:=value;
 end;// else showmessage('olmadi!!');
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TSBUniversalSettings,
    Class_SBUniversalSettings,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

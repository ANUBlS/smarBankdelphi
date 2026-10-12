unit CMDBSearchEdit;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, ComCtrls, Db, StdCtrls,
  DBConsts;

type

  TUpdateDataEvent = procedure (Sender : TObject;
                       var Handled : Boolean);

  TCMSearchEdit = class;

  TDataSourceLink = class(TDataLink)
  private
    FDBLookupControl: TCMSearchEdit;
  protected
    procedure FocusControl(Field: TFieldRef); override;
    procedure ActiveChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create;
  end;

  TListSourceLink = class(TDataLink)
  private
    FDBLookupControl: TCMSearchEdit;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure LayoutChanged; override;
  public
    constructor Create;
  end;

  TCMSearchEdit = class(TEdit)
  private
    FLookupSource: TDataSource;
    FDataLink: TDataSourceLink;
    FListLink: TListSourceLink;
    FDataFieldName: string;
    FKeyFieldName: string;
    FListFieldName: string;
    FListFieldIndex: Integer;
    FDataField: TField;
    FMasterField: TField;
    FKeyField: TField;
    FListField: TField;
    FListFields: TList;
    FKeyValue: Variant;
    FSearchText: string;
    FLookupMode: Boolean;
    FListActive: Boolean;
    FHasFocus: Boolean;
    FScrollingGaranted : Boolean;
    FDefaultColor : TColor;
    FErrorColor : TColor;
    FBeepOnNotFound : Boolean;
  //  FOnUpdateData : TUpdateDataEvent;
    procedure CheckNotCircular;
    procedure CheckNotLookup;
    procedure DataLinkRecordChanged(Field: TField);
    function GetDataSource: TDataSource;
    function GetKeyFieldName: string;
    function GetListSource: TDataSource;
    function GetReadOnly: Boolean;
    procedure SetDataFieldName(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetKeyFieldName(const Value: string);
    procedure SetKeyValue(const Value: Variant);
    procedure SetListFieldName(const Value: string);
    procedure SetListSource(Value: TDataSource);
    procedure SetLookupMode(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure WMGetDlgCode(var Message: TMessage); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  protected
    procedure Change; override;
    procedure SetSelectedText(const S: String); virtual;
    procedure KeyPress(var Key : Char); override;
    function CanModify: Boolean; virtual;
    procedure KeyValueChanged; virtual;
    procedure ListLinkDataChanged; virtual;
    function LocateKey: Boolean; virtual;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure ProcessSearchKey(const SearchText : String); virtual;
    procedure SelectKeyValue(const Value: Variant); virtual;
    procedure UpdateDataFields; virtual;
    procedure UpdateListFields; virtual;
    property HasFocus: Boolean read FHasFocus;
    property KeyValue: Variant read FKeyValue write SetKeyValue;
    property ListActive: Boolean read FListActive;
    property ListLink: TListSourceLink read FListLink;
    property ListFields: TList read FListFields;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property SearchText: string read FSearchText write FSearchText;
    property ScrollingGaranted : Boolean read FScrollingGaranted write FScrollingGaranted default True;
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMCopy(var Message: TMessage); message WM_COPY;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateWnd(); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read FDataField;
    property ColorSave : TColor read FDefaultColor write FDefaultColor; 
  published
    property DataField: string read FDataFieldName write SetDataFieldName;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property KeyField: string read GetKeyFieldName write SetKeyFieldName;
    property ListField: string read FListFieldName write SetListFieldName;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property ListFieldIndex: Integer read FListFieldIndex write FListFieldIndex default 0;
    property ErrorColor : TColor read FErrorColor write FErrorColor;
    property BeepOnNotFound : Boolean read FBeepOnNotFound write FBeepOnNotFound;
//    property OnUpdateData : TUpdateDataEvent read FUpdateData write FUpdateData;
  end;

procedure Register;

implementation

{ TDataSourceLink }

constructor TDataSourceLink.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TDataSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TDataSourceLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FDBLookupControl.Field) and
    (FDBLookupControl <> nil) and FDBLookupControl.CanFocus then
  begin
    Field^ := nil;
    FDBLookupControl.SetFocus;
  end;
end;

procedure TDataSourceLink.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateDataFields;
end;

procedure TDataSourceLink.RecordChanged(Field: TField);
begin
  if FDBLookupControl <> nil then FDBLookupControl.DataLinkRecordChanged(Field);
end;

{ TListSourceLink }

constructor TListSourceLink.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TListSourceLink.ActiveChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

procedure TListSourceLink.DataSetChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.ListLinkDataChanged;
end;

procedure TListSourceLink.LayoutChanged;
begin
  if FDBLookupControl <> nil then FDBLookupControl.UpdateListFields;
end;

function VarEquals(const V1, V2: Variant): Boolean;
begin
  Result := False;
  try
    Result := V1 = V2;
  except
  end;
end;

constructor TCMSearchEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if NewStyleControls then
    ControlStyle := [csOpaque] else
    ControlStyle := [csOpaque, csFramed];
  FLookupSource := TDataSource.Create(Self);
  FDataLink := TDataSourceLink.Create;
  FDataLink.FDBLookupControl := Self;
  FListLink := TListSourceLink.Create;
  FListLink.FDBLookupControl := Self;
  FListFields := TList.Create;
  FKeyValue := Null;
  ErrorColor := clRed;
  BeepOnNotFound := True;
end;

procedure TCMSearchEdit.CreateWnd();
begin
    FDefaultColor := Color;
    inherited 
end;

destructor TCMSearchEdit.Destroy;
begin
  inherited Destroy;
  FListFields.Free;
  FListFields := nil;
  FListLink.FDBLookupControl := nil;
  FListLink.Free;
  FListLink := nil;
  FDataLink.FDBLookupControl := nil;
  FDataLink.Free;
  FDataLink := nil;
end;

function TCMSearchEdit.CanModify: Boolean;
begin
  Result := FListActive and not ReadOnly and ((FDataLink.DataSource = nil) or
    (FMasterField <> nil) and FMasterField.CanModify);
end;

procedure TCMSearchEdit.CheckNotCircular;
begin
  if FListLink.Active and FListLink.DataSet.IsLinkedTo(DataSource) then
    DatabaseError(SCircularDataLink);
end;

procedure TCMSearchEdit.CheckNotLookup;
begin
  if FLookupMode then DatabaseError(SPropDefByLookup);
  if FDataLink.DataSourceFixed then DatabaseError(SDataSourceFixed);
end;

procedure TCMSearchEdit.UpdateDataFields;
begin
  FDataField := nil;
  FMasterField := nil;
  if FDataLink.Active and (FDataFieldName <> '') then
  begin
    CheckNotCircular;
    FDataField := GetFieldProperty(FDataLink.DataSet, Self, FDataFieldName);
    if FDataField.FieldKind = fkLookup then
      FMasterField := GetFieldProperty(FDataLink.DataSet, Self, FDataField.KeyFields)
    else
      FMasterField := FDataField;
  end;
  SetLookupMode((FDataField <> nil) and (FDataField.FieldKind = fkLookup));
  DataLinkRecordChanged(nil);
end;

procedure TCMSearchEdit.DataLinkRecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FMasterField) then
    if FMasterField <> nil then
      SetKeyValue(FMasterField.Value) else
      SetKeyValue(Null);
end;

function TCMSearchEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCMSearchEdit.GetKeyFieldName: string;
begin
  if FLookupMode then Result := '' else Result := FKeyFieldName;
end;

function TCMSearchEdit.GetListSource: TDataSource;
begin
  if FLookupMode then Result := nil else Result := FListLink.DataSource;
end;

function TCMSearchEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TCMSearchEdit.KeyValueChanged;
begin
  if not Focused then
  begin
    ScrollingGaranted := False;
    if ListActive and (not FListField.IsNull) and LocateKey() then
      Text := FListField.AsString
    else Text := ''; 
  end
end;

procedure TCMSearchEdit.UpdateListFields;
var
  DataSet: TDataSet;
  ResultField: TField;
begin
  FListActive := False;
  FKeyField := nil;
  FListField := nil;
  FListFields.Clear;
  if FListLink.Active and (FKeyFieldName <> '') then
  begin
    CheckNotCircular;
    DataSet := FListLink.DataSet;
    FKeyField := GetFieldProperty(DataSet, Self, FKeyFieldName);
    try
      DataSet.GetFieldList(FListFields, FListFieldName);
    except
      DatabaseErrorFmt(SFieldNotFound, [Self.Name, FListFieldName]);
    end;
    if FLookupMode then
    begin
      ResultField := GetFieldProperty(DataSet, Self, FDataField.LookupResultField);
      if FListFields.IndexOf(ResultField) < 0 then
        FListFields.Insert(0, ResultField);
      FListField := ResultField;
    end else
    begin
      if FListFields.Count = 0 then FListFields.Add(FKeyField);
      if (FListFieldIndex >= 0) and (FListFieldIndex < FListFields.Count) then
        FListField := FListFields[FListFieldIndex] else
        FListField := FListFields[0];
    end;
    FListActive := True;
  end;
  KeyValueChanged;
end;

procedure TCMSearchEdit.ListLinkDataChanged;
begin

end;

function TCMSearchEdit.LocateKey: Boolean;
var
  KeySave: Variant;
begin
  Result := False;
  try
    KeySave := FKeyValue;
    if not VarIsNull(FKeyValue) and FListLink.DataSet.Active and
      FListLink.DataSet.Locate(FKeyFieldName, FKeyValue, [loCaseInsensitive,loPartialKey]) then
    begin
      Result := True;
      FKeyValue := KeySave;
    end;
  except
  end;
end;

procedure TCMSearchEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if (FDataLink <> nil) and (AComponent = DataSource) then DataSource := nil;
    if (FListLink <> nil) and (AComponent = ListSource) then ListSource := nil;
  end;
end;

procedure TCMSearchEdit.ProcessSearchKey(const SearchText: String);
begin
  ScrollingGaranted := False;
  if FListLink.DataSet.Locate(FListField.FieldName, SearchText,[loCaseInsensitive, loPartialKey]) then
  begin
    SetSelectedText(FListField.AsString);
    if CanModify then
      SelectKeyValue(FKeyField.Value);
    Color := FDefaultColor
  end else
  begin
    if CanModify then SelectKeyValue(Null);
    if BeepOnNotFound then Beep;
    Color := ErrorColor;
  end;
end;

procedure TCMSearchEdit.SelectKeyValue(const Value: Variant);
begin

  if FMasterField <> nil then
  begin
    FDataLink.Edit;
    FMasterField.Value := Value;
  end else
    SetKeyValue(Value);
  Repaint;
  Click;
end;

procedure TCMSearchEdit.SetDataFieldName(const Value: string);
begin
  if FDataFieldName <> Value then
  begin
    FDataFieldName := Value;
    UpdateDataFields;
  end;
end;

procedure TCMSearchEdit.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCMSearchEdit.SetKeyFieldName(const Value: string);
begin
  CheckNotLookup;
  if FKeyFieldName <> Value then
  begin
    FKeyFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TCMSearchEdit.SetKeyValue(const Value: Variant);
begin
  if not VarEquals(FKeyValue, Value) then
  begin
    FKeyValue := Value;
    KeyValueChanged;
  end;
end;

procedure TCMSearchEdit.SetListFieldName(const Value: string);
begin
  if FListFieldName <> Value then
  begin
    FListFieldName := Value;
    UpdateListFields;
  end;
end;

procedure TCMSearchEdit.SetListSource(Value: TDataSource);
begin
  CheckNotLookup;
  FListLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCMSearchEdit.SetLookupMode(Value: Boolean);
begin
  if FLookupMode <> Value then
    if Value then
    begin
      FMasterField := GetFieldProperty(FDataField.DataSet, Self, FDataField.KeyFields);
      FLookupSource.DataSet := FDataField.LookupDataSet;
      FKeyFieldName := FDataField.LookupKeyFields;
      FLookupMode := True;
      FListLink.DataSource := FLookupSource;
    end else
    begin
      FListLink.DataSource := nil;
      FLookupMode := False;
      FKeyFieldName := '';
      FLookupSource.DataSet := nil;
      FMasterField := FDataField;
    end;
end;

procedure TCMSearchEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TCMSearchEdit.WMGetDlgCode(var Message: TMessage);
begin
  Message.Result := DLGC_WANTARROWS or DLGC_WANTCHARS;
end;

procedure TCMSearchEdit.WMKillFocus(var Message: TMessage);
begin
  FHasFocus := False;
  inherited;
  Invalidate;
end;

procedure TCMSearchEdit.WMSetFocus(var Message: TMessage);
begin
  SearchText := '';
  FHasFocus := True;
  inherited;
  Invalidate;
end;

procedure TCMSearchEdit.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

function TCMSearchEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TCMSearchEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TCMSearchEdit.KeyPress(var Key : Char);
begin
  //ScrollingGaranted := True;
  ScrollingGaranted := not (Ord(Key) in [VK_DELETE,VK_BACK]);
  inherited KeyPress(Key)
end;

procedure  TCMSearchEdit.SetSelectedText(const S: String);
var
  LastLen : Integer;
begin
  LastLen := Length(Text);
  Text := S;
  SelStart := LastLen;
  SelLength := Length(S)-LastLen;
  Color := clWhite
end;

procedure TCMSearchEdit.Change;
begin
  inherited Change;
  if (Text = '') then SelectKeyValue(Null)
  else
  if ScrollingGaranted and Focused then
    ProcessSearchKey(Text);
end;

procedure TCMSearchEdit.WMCut(var Message: TMessage);
begin
  ScrollingGaranted := True;
  inherited;
end;

procedure TCMSearchEdit.WMCopy(var Message: TMessage);
begin
  inherited;
end;

procedure TCMSearchEdit.WMPaste(var Message: TMessage);
begin
  ScrollingGaranted := True;
  inherited;
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TCMSearchEdit])
end;

end.

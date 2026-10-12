unit DBViewComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  DB, DBTables, DBCtrls, DBGrids, Dialogs;

type
  TDBViewComboBox = class(TComboBox)
  private
    FFieldInterval: Integer;
    FDataLink: TDataLink;
    FListSource: TDataSource;
    FListFields: String;
    FDropDownOnEnter: Boolean;
    FFirstAfterOpen: Boolean;
    procedure SetListFields(const Value: String);
    procedure SetListSource(Value: TDataSource);
    function GetDesignModeText: String;
    procedure RefreshDesignModeList;
  protected
    procedure ActiveChanged; virtual;
    procedure DataSetScrolled(Distance: Integer); virtual;
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure DisableScrolling;
    procedure EnableScrolling;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ListAvailable: Boolean;
    procedure RefreshList; virtual;  // currently call it manually to refresh
                                     // list when master dataset scrolled,
                                     // in future, will done automatically
  published
    property ListSource: TDataSource read FListSource write SetListSource;
    property ListFields: String read FListFields write SetListFields;
    property FieldInterval: Integer read FFieldInterval write FFieldInterval;
    property DropDownOnEnter: Boolean read FDropDownOnEnter write FDropDownOnEnter;
    property FirstAfterOpen: Boolean read FFirstAfterOpen write FFirstAfterOpen default False;
  end;

implementation

var
  IsScrollingEnabled: Boolean = True;

type
  TDBViewComboBoxDataLink = class(TDataLink)
  private
    FDBViewComboBox: TDBViewComboBox;
    FFirstScroll: Boolean;
  protected
    procedure ActiveChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure DataSetChanged; override;
  public
    property DBViewComboBox: TDBViewComboBox read FDBViewComboBox write FDBViewComboBox;
    constructor Create;
  end;

  { TDBViewComboBoxDataLink }

constructor TDBViewComboBoxDataLink.Create;
begin
  FFirstScroll := True;
  inherited;
end;

procedure TDBViewComboBoxDataLink.ActiveChanged;
begin
  DBViewComboBox.ActiveChanged;
//  inherited;
end;

procedure TDBViewComboBoxDataLink.DataSetScrolled(Distance: Integer);
begin
  {Kak zastavit eto rabotat???}
  DBViewComboBox.DataSetScrolled(Distance);
//  inherited;
end;

procedure TDBViewComboBoxDataLink.DataSetChanged;
var
  ItemIndex: Integer;
begin
  inherited;
  if not FFirstScroll then
  begin
    if
      Assigned(DataSource)
      and Assigned(DataSource.DataSet)
      and Active
      and (not (DataSource.DataSet.ControlsDisabled))
      and (IsScrollingEnabled)
    then
    begin
      ItemIndex := FDBViewComboBox.ItemIndex;
      if (ItemIndex = -1) {and (DataSource.DataSet.RecordCount <> 1)} then
        ItemIndex := 0;
      if ItemIndex <> DataSource.DataSet.RecNo-1 then
        FDBViewComboBox.ItemIndex := DataSource.DataSet.RecNo-1;
    end;
  end
  else
    FFirstScroll := False;
end;

  { TDBViewComboBox }

constructor TDBViewComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TDBViewComboBoxDataLink.Create;
  with FDataLink as TDBViewComboBoxDataLink do
  begin
    DBViewComboBox := Self;
    VisualControl := True;
  end;
  FFieldInterval := 5;
end;

destructor TDBViewComboBox.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

procedure TDBViewComboBox.SetListSource(Value: TDataSource);
begin
  FListSource := Value;
  FDataLink.DataSource := ListSource;
  RefreshList;
end;

function TDBViewComboBox.GetDesignModeText: String;
begin
  if ListAvailable then
    Result := Format('%s - %s { %s }', [Name, ListSource.Name, ListFields])
  else
    Text := Format('%s - {LIST UNAVAILABLE}', [Name]);
end;

procedure TDBViewComboBox.RefreshDesignModeList;
begin
  if csDesigning in ComponentState then
    Text := GetDesignModeText
  else
  if not ListAvailable then
    Text := Name
  else
    Text := '';
end;

procedure TDBViewComboBox.ActiveChanged;
begin
  RefreshList;
  RefreshDesignModeList;
end;

procedure TDBViewComboBox.DataSetScrolled(Distance: Integer);
begin
  if ItemIndex = -1 then
    ItemIndex := 0;
  ItemIndex := ItemIndex + Distance;
end;

procedure TDBViewComboBox.SetListFields(const Value: String);
begin
  FListFields := Value;
  RefreshList;
  RefreshDesignModeList;
end;

function TDBViewComboBox.ListAvailable: Boolean;
begin
  {$B-}
  Result :=
    Assigned(ListSource)
    and Assigned(ListSource.DataSet)
    and ListSource.DataSet.Active
    and (ListFields <> '');
  {$B+}
end;

procedure TDBViewComboBox.RefreshList;
var
  Fields: TList;

  procedure PrepareFields;
  var
    Index: Integer;
    FieldList: TStrings;
  begin
    FieldList := TStringList.Create;
    try
      FieldList.CommaText := ListFields;
      Fields := TList.Create;
      for Index := 0 to FieldList.Count-1 do
        Fields.Add(Pointer(ListSource.DataSet.FieldByName(FieldList[Index])));
    finally
      FieldList.Free;
    end;
  end;

  function GetRowString: String;
  var
    Index: Integer;
  begin
    Result := '';
    for Index := 0 to Fields.Count-1 do
      Result := Format('%s%s%s', [Result, StringOfChar(#32, FieldInterval), TField(Fields[Index]).AsString]);
    System.Delete(Result, 1, FieldInterval);
  end;

  procedure ReleaseFields;
  begin
    Fields.Free;
  end;

var
  SavedPos: TBookmark;

begin
  if ListAvailable and (not (csDesigning in ComponentState)) then
  begin
    Items.Clear;
    PrepareFields;
    DisableScrolling;
    try
      with Items, ListSource.DataSet do
      begin
        SavedPos := GetBookmark;
        DisableControls;
        ItemIndex := -1;
        try
          First;
          while not Eof do
          begin
            Add(GetRowString);
            Next;
          end;
          GotoBookmark(Pointer(SavedPos));
        finally
          EnableControls;
        end;
      end;
    finally
      ReleaseFields;
      EnableScrolling;
    end;
    if FirstAfterOpen then
      ItemIndex := 0;
  end;
end;

procedure TDBViewComboBox.Change;

  procedure DoAfterScroll(DataSet: TDataSet);
  begin
    if Assigned(DataSet.AfterScroll) then
      DataSet.AfterScroll(DataSet);
  end;

begin
  if ListAvailable then
    with ListSource.DataSet do
      if not ControlsDisabled then
      begin
        if RecordCount = 1 then
          RecNo := 0;
        RecNo := ItemIndex+1;
        if ItemIndex = 0 then
          DoAfterScroll(ListSource.DataSet);
      end;
  inherited;
end;

procedure TDBViewComboBox.DoEnter;
begin
  DroppedDown := DropDownOnEnter;
  inherited;
end;

procedure TDBViewComboBox.DoExit;
begin
  if DropDownOnEnter then
    DroppedDown := False;
  inherited;
end;

procedure TDBViewComboBox.DisableScrolling;
begin
  // for multithread synchronization add mutex here
  IsScrollingEnabled := False;
end;

procedure TDBViewComboBox.EnableScrolling;
begin
  IsScrollingEnabled := True;
end;

end.

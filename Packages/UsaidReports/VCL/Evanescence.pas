unit Evanescence;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, DB;

type
  TEvanescence = class(TCheckListBox)
  private
    FDataSource: TDataSource;
    FListField: String;
    FKeyField: String;
    FActive: Boolean;
    FKeyItems: TStringList;
    procedure SetDataSource(Value: TDataSource);
    procedure SetListField(Value: String);
    procedure SetKeyField(Value: String);
    procedure SetActive(Value: Boolean);
    procedure FillList;
    procedure ClearList;
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    property KeyItems: TStringList read FKeyItems;
    procedure Open;
    procedure Close;                              
    function GetCheckedKeyList: TStringList;
    procedure RefreshList;
    procedure CheckAll;
    procedure UncheckAll;
    procedure ToggleAll;                                
    property Active: Boolean read FActive write SetActive;
  published
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property ListField: String read FListField write SetListField;
    property KeyField: String read FKeyField write SetKeyField;
  end;

procedure Register;

implementation

constructor TEvanescence.Create;
begin
  inherited;
  FKeyItems := TStringList.Create;
end;

procedure TEvanescence.SetDataSource;
begin
  FDataSource := Value;
end;

procedure TEvanescence.SetListField;
begin
  FListField := Value;
end;

procedure TEvanescence.SetKeyField;
begin
  FKeyField := Value;
end;

procedure TEvanescence.SetActive;
begin
  FActive := Value;
  if [csDesigning, csLoading] * ComponentState = [] then
  if FActive then FillList
             else ClearList;
end;

procedure TEvanescence.ClearList;
begin
  Items.Clear;
  KeyItems.Clear;
end;

procedure TEvanescence.FillList;
begin
  if DataSource<>nil then
  with DataSource, DataSet do begin
    if not Active then Open;
    Items.Clear;
    KeyItems.Clear;
    FindFirst;
    while not Eof do begin
      Items.Add(FieldByName(ListField).AsString);
      if FieldByName(KeyField).DataType = ftString then
        FKeyItems.Add(''''+FieldByName(KeyField).AsString+'''')
      else
        FKeyItems.Add(FieldByName(KeyField).AsString);
      Next;
    end;
  end;
end;

function TEvanescence.GetCheckedKeyList;
var
  i: Integer;
  List: TStringList;
begin
  List := TStringList.Create;
  for i := 0 to Self.Items.Count - 1 do
    if Self.Checked[i] then
      List.Add(FKeyItems[i]);
  Result := List;
end;

procedure TEvanescence.Open;
begin
  SetActive(True);
end;

procedure TEvanescence.Close;
begin
  SetActive(False);
end;

procedure TEvanescence.RefreshList;
begin
  Close;
  Open;
end;

procedure TEvanescence.CheckAll;
var
  i: Integer;
begin
  for i := 0 to Items.Count - 1 do
    Checked[i] := True;
end;

procedure TEvanescence.UncheckAll;
var
  i: Integer;
begin
  for i := 0 to Items.Count - 1 do
    Checked[i] := False;
end;

procedure TEvanescence.ToggleAll;    
var
  i: Integer;
begin
  for i := 0 to Items.Count - 1 do
    Checked[i] := not Checked[i];
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr', [TEvanescence]);
end;

end.

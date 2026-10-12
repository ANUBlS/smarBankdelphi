unit FieldSearchEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Db;

type
  TFieldSearchEdit = class(TEdit)
  private
    { Private declarations }
  protected
    FDataSource :TDataSource;
    FSearchField  :String;
    procedure Change;override;
    procedure DoEnter;override;
    procedure DoExit;override;
    procedure KeyDown(var Key :Word;Shift :TShiftState);override;
    { Protected declarations }
  public
    constructor Create(AOwner :TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  published
     property  DataSource  :TDataSource read FDataSource write FDataSource;
     property  SearchField :String read FSearchField write FSearchField;
    { Published declarations }
  end;

procedure Register;

implementation
constructor TFieldSearchEdit.Create(AOwner :TComponent);
begin
  inherited Create(AOwner);
end;
destructor TFieldSearchEdit.Destroy;
begin
  inherited Destroy;
end;
procedure TFieldSearchEdit.Change;
 function  SearchFields :Boolean;
 begin
  Result :=False;
  if
     Assigned(FDataSource) and
     Assigned(FDataSource.DataSet)and
     (FSearchField <> '')
  then
  with   FDataSource.DataSet  do
  begin
    if   Focused  then
    if   Text <> ''  then
    if  Locate(FSearchField,Text,[loCaseInsensitive,loPartialKey])  then
    begin
      Color :=clWhite;
      Result :=True;
    end
     else
      begin
        Color :=clRed;
        Self.Tag :=1;
        Beep;
      end;
  end;
 end;//SearchField;
 procedure  SetSelectedText(const S: String);
 var
   LastLen       : Integer;
 begin
    LastLen := Length(Text);
    Text := S;
    if Focused then
    begin
      SelStart := LastLen;
      SelLength := Length(S)-LastLen;
    end;
    Color := clWhite;
 end;
begin

  if  Tag = 0  then
  if SearchFields and
     Assigned(FDataSource) and
     Assigned(FDataSource.DataSet)and
     (FSearchField <> '')
  then
    SetSelectedText(FDataSource.DataSet.FieldByName(FSearchField).AsString);
  inherited;
end;
procedure TFieldSearchEdit.DoEnter;
begin
  inherited;
end;
procedure TFieldSearchEdit.DoExit;
begin
  Color :=clWhite;
  if Text<>'' then
    Text :=FDataSource.DataSet.FieldByName(FSearchField).AsString;
  inherited;
end;
procedure TFieldSearchEdit.KeyDown;
begin
  if   Key in [VK_DELETE,VK_BACK] then
    Tag :=1
   else
    Tag :=0;
  if  Key = VK_RETURN  then
    Text :=FDataSource.DataSet.FieldByName(FSearchField).AsString;
  inherited;
end;
procedure Register;
begin
  RegisterComponents('Samples', [TFieldSearchEdit]);
end;

end.


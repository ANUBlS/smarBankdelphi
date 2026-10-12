unit SearchEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Db,DBViewComboBox;

type
  TSearchEdit = class(TEdit)
  private
    { Private declarations }
  protected
    FPartnership :TDBViewComboBox; 
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
     property  Partnership :TDBViewComboBox read FPartnership write FPartnership;
     property  DataSource :TDataSource read FDataSource write FDataSource;
     property  SearchField :String read FSearchField write FSearchField;
    { Published declarations }
  end;

procedure Register;

implementation
constructor TSearchEdit.Create(AOwner :TComponent);
begin
  inherited Create(AOwner);
end;
destructor TSearchEdit.Destroy;
begin
  inherited Destroy;
end;
procedure TSearchEdit.Change;
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
      if  Assigned(FPartnership) and (FPartnership.ItemIndex=-1) then
        FPartnership.ItemIndex :=0;
      Color :=clWhite;
      Result :=True;
    end
     else
      begin
        if  Assigned(FPartnership)  then
          FPartnership.ItemIndex :=-1;
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
  begin
    SetSelectedText(FDataSource.DataSet.FieldByName(FSearchField).AsString);
  end;
  inherited;
end;
procedure TSearchEdit.DoEnter;
begin
  inherited;
end;
procedure TSearchEdit.DoExit;
begin
  Color :=clWhite;
  if Text<>'' then
  begin
   Text :=FDataSource.DataSet.FieldByName(FSearchField).AsString;
   if  Assigned(FPartnership) and (FPartnership.ItemIndex=-1) then
        FPartnership.ItemIndex :=0;
  end
  else
  if  Assigned(FPartnership) and (FPartnership.ItemIndex<>-1) then
     FPartnership.ItemIndex :=-1;
  inherited;
end;

procedure TSearchEdit.KeyDown;
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
  RegisterComponents('Smart', [TSearchEdit]);
end;

end.

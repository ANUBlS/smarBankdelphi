unit SearchCombo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DB;

type
  TSearchCombo = class(TComboBox)
  private
   FDataSource :TDataSource;
   FDefStr,FViewField :String;
   FUseDefStr: Boolean;
   FDefStrCol: TColor;
  protected
    procedure SetDefStr(Value: String);
    procedure SetUseDefStr(Value: Boolean);
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;
  public
   constructor Create(AOwner : TComponent);override;
   destructor Destroy;override;
   procedure CreateWnd;override;
   procedure Change;override;
   function Refresh: Boolean;
  published
   property Style default csOwnerDrawFixed;
   property DataSource :TDataSource read FDataSource write FDataSource;
   property ViewField  :String read FViewField write FViewField;
   property DefaultString: String read FDefStr write SetDefStr;
   property DefaultStringUse: Boolean read FUseDefStr write SetUseDefStr;
   property DefaultStringColor: TColor read  FDefStrCol write FDefStrCol;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TSearchCombo]);
end;

constructor TSearchCombo.Create(AOwner : TComponent);
begin
inherited Create(AOwner);
Style:=csOwnerDrawFixed;
FDefStr:='';
FUseDefStr:=False;
FDefStrCol:=Font.Color;
end;

destructor TSearchCombo.Destroy;
begin
inherited Destroy;
end;

procedure TSearchCombo.CreateWnd;
begin
 inherited CreateWnd;
Refresh;
end;

function TSearchCombo.Refresh: Boolean;
var
 Point: TBookmark;
begin
 if (not(csDesigning in ComponentState)) and Assigned(FDataSource) and
   Assigned(FDataSource.DataSet) and (FViewField<>'') then
  begin
   Items.Clear;
   if FUseDefStr then
     Items.Add(FDefStr);
   with FDataSource.DataSet do
   begin
    if not(Active) then Open;
    Point:=GetBookmark;
    DisableControls;
    First;
    while not(Eof) do
     begin
      Items.Add(FieldbyName(FViewField).AsString);
      Next;
     end;
     GotoBookmark(Point);
     EnableControls;
    Result:=True;
   end;
  end
  else
   Result:=False;
end;

procedure TSearchCombo.DrawItem(Index: Integer; Rect: TRect;State: TOwnerDrawState);
begin
if DefaultStringUse then
 begin
  Canvas.FillRect(Rect);
   if (Index = 0) and (not (odComboBoxEdit in State)) then
    if odSelected in State then
     Canvas.Font.Color := clWhite
    else
    Canvas.Font.Color := DefaultStringColor;
  Canvas.TextOut(Rect.Left+2, Rect.Top+2, Items[Index]);
  end;
inherited;
end;

procedure TSearchCombo.Change;
begin
 if not((FUseDefStr)and(ItemIndex=0)) then
 FDataSource.DataSet.Locate(FViewField,Text,[]);
 inherited ;
end;

procedure TSearchCombo.SetDefStr(Value: String);
begin
 FDefStr:=Value;
 if Assigned(Parent) then Refresh;
end;

procedure TSearchCombo.SetUseDefStr(Value: Boolean);
begin
 FUseDefStr:=Value;
 if Assigned(Parent) then Refresh;
end;


end.



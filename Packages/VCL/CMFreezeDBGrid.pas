unit CMFreezeDBGrid;


interface

uses
  Windows, SysUtils, Classes, Controls, Grids, DBGrids, DB, Graphics;
type
  TFixDBGrid = class(TDBGrid)
  private
    { Private ?? }
    FFixedCols : Integer;
  protected
    { Protected ?? }
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure LayoutChanged; Override;
    procedure LinkActive(Value: Boolean); Override;
    function  SelectCell(ACol, ARow: Longint): Boolean; Override;
    Procedure SetFixedCols(Value : Integer); Virtual;
{$IFDEF VER120}
    procedure DrawCell(ACol, ARow: Integer; ARect: TRect;
      AState: TGridDrawState); Override;
{$ENDIF}
  public
    { Public ?? }
    Constructor Create(AOwner : TComponent); Override;
    Property LeftCol;
  published
    { Published ?? }
    Property FixedCols : Integer Read FFixedCols Write SetFixedCols Default 1;
  end;
Procedure Register;
implementation
Constructor TFixDBGrid.Create(AOwner : TComponent);
Begin
     Inherited Create(AOwner);
     FFixedCols := 1;
End;
procedure TFixDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
Begin
     If Not (ssCtrl In Shift) Then
        Case Key Of
          VK_HOME :
               If Col > FFixedCols Then
               Begin
                  Col := FixedCols;
                  Exit;
               End;
        End;
     Inherited;
End;
{$IFDEF VER120}
procedure TFixDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; 
                                AState: TGridDrawState);
var
   C : Integer;
   DrawFlg : Integer;
   Text : string;
   Column : TColumn;
begin
     if dgIndicator in Options then
        C := ACol - 1
     else
        C := ACol;
     if C >= 0 then
     begin
       Column := Columns[C];
       Canvas.Font := Column.Font;
     end;
     inherited;
     if (dgTitles in Options) and (ARow = 0) and (C >= 0) And 
        (C < FFixedCols) then
     begin
        Canvas.Font := Column.Title.Font;
        Canvas.Brush.Color := Column.Title.Color;
        Canvas.FillRect(ARect);
        Text := Column.Title.Caption;
        case Column.Title.Alignment of
          taLeftJustify  : DrawFlg := DT_LEFT;
          taRightJustify : DrawFlg := DT_RIGHT;
          else             DrawFlg := DT_CENTER;
        end;
        DrawFlg := DrawFlg or DT_SINGLELINE;
        InflateRect(ARect, -2, -2);
        DrawText(Canvas.Handle, PChar(Text), -1 , ARect, DrawFlg);
        InflateRect(ARect, 2, 2);
        if [dgRowLines, dgColLines] * Options = [dgRowLines, dgColLines] then
        begin
          DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
          DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
        end;
     end;
end;
{$ENDIF}
procedure TFixDBGrid.LayoutChanged;
var
   Save : Integer;
Begin
     Inherited;
     if (csLoading in ComponentState) then Exit;
     Save := FixedCols;
     FixedCols := 1;
     FixedCols := Save;
     If (DataSource <> Nil) And (DataSource.DataSet <> Nil) Then
        Scroll(0);
End;
procedure TFixDBGrid.LinkActive(Value: Boolean);
var
   i : Integer;
Begin
     Inherited;
     If Value Then
     Begin
        Inherited FixedCols := FFixedCols;
        For i := 0 To FFixedCols - 1 Do
           TabStops[i] := False;
     End
     Else
     Begin
        Inherited FixedCols := 1;
     End;
     Invalidate;
End;
function TFixDBGrid.SelectCell(ACol, ARow: Longint): Boolean;
Begin
     Result := Inherited SelectCell(ACol, ARow);
     If ACol < FFixedCols Then
        Result := False;
End;
Procedure TFixDBGrid.SetFixedCols(Value : Integer);
var
   i, j, k : Integer;
Begin
  If FFixedCols <> Value Then
  Begin
     If dgIndicator In Options Then
        k := 1
     Else
        k := 0;
     If ColCount < FFixedCols Then
        j := ColCount
     Else
         j := FFixedCols;
     For i := k To j - 1 Do
        TabStops[i] := True;
     If (DataSource <> Nil) And (DataSource.DataSet <> Nil) And
        (DataSource.DataSet.Active) Then
     Begin
        If ColCount <= Value Then
           Raise EInvalidOperation.Create(
                             '??????????????????');
        If Value < k Then
           Raise EInvalidOperation.Create(
                             '????????' + IntToStr(k) + '?????');
        FFixedCols := Value;
        Inherited FixedCols := Value;
        For i := 0 To FFixedCols - 1 Do
           TabStops[i] := False;
        Col := FFixedCols;
     End
     Else
        FFixedCols := Value;
     Invalidate;
  End;
End;

Procedure Register;
Begin
  RegisterComponents('CreditsMgr', [TFixDBGrid]);
end;

end.

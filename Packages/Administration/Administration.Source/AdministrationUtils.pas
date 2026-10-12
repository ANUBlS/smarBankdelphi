unit AdministrationUtils;
interface

uses SysUtils,grids;

 function GRFind(SG: TStringGrid;Value: string): Boolean;
 procedure ReinitializeRows(SG:TStringGrid);
 procedure DeleteCell(SG:TStringGrid;DColl,DRow:Integer);
 procedure DeleteLast(SG: TStringGrid;DColl: Integer);
 procedure CopyCell(SG:TStringGrid;DColl,DRow,IColl:Integer);
 procedure CutCell(SG:TStringGrid;DColl,DRow,IColl:Integer);
 procedure DeleteCellRect(SG:TStringGrid;DColl,DRow:Integer);
 procedure CutCellRect(SG:TStringGrid;DColl,DRow,IColl:Integer);
 procedure AddToCell(SG:TStringGrid;InCol: Integer;Value: string);
 procedure ClearGrid(Sg: TStringGrid);

 implementation


procedure ReinitializeRows(SG:TStringGrid);
var i,z:Integer;
DelRow : Boolean;
begin
  with SG do
   begin
    DelRow :=True;
    for i:=RowCount-1 downto 0 do
     begin
       for z:=0 to ColCount-1 do
         DelRow:=DelRow and (Cells[z,i]=EmptyStr);

       if DelRow then
        begin
        RowCount:=RowCount-1;
        DelRow:=True;
        end;
     end;
   end;
end;

procedure DeleteCell(SG:TStringGrid;DColl,DRow:Integer);
var i: Integer;
begin
 with SG do
   for i:=DRow to RowCount-1 do
     begin
      Cells[DColl,i]:=Cells[DColl,i+1];
      Cells[DColl,i+1]:=EmptyStr;
     end;
end;


procedure DeleteLast(SG: TStringGrid;DColl: Integer);
var i:integer;
begin
  with SG do
   for i:=RowCount-1 downto 0 do
    if Cells[DColl,i]<>EmptyStr then
     begin
      DeleteCell(SG,DColl,i);
      Break;
     end;
end;

procedure CopyCell(SG:TStringGrid;DColl,DRow,IColl:Integer);
var i: Integer;AddRow: Boolean;
begin
 with SG do
  begin
    AddRow:=True;
    for i:=0 to RowCount-1 do
     if (Cells[IColl,i]=EmptyStr) then
      begin
        AddRow:=False;
        Cells[IColl,i]:=Cells[DColl,DRow];
        Break;
      end;

      if AddRow then
       begin
         RowCount:=RowCount+1;
         Cells[IColl,RowCount-1]:=Cells[DColl,DRow];
       end;
  end;
end;

procedure CutCell(SG:TStringGrid;DColl,DRow,IColl:Integer);
begin
 CopyCell(SG,DColl,DRow,IColl);
 DeleteCell(SG,DColl,DRow);
end;

procedure DeleteCellRect(SG:TStringGrid;DColl,DRow:Integer);
var
i: Integer;
begin
  with SG,Selection do
   if (Left=DColl) or (Right=DColl) then
     for i:=Bottom downto Top do
       DeleteCell(SG,DColl,i);
  ReinitializeRows(SG);
end;

procedure CutCellRect(SG:TStringGrid;DColl,DRow,IColl:Integer);
var
i: Integer;
SelRect: TGridRect;
begin
  with SG,Selection do
   begin
   SelRect:=Selection;
   if (Left=DColl) or (Right=DColl) then
     for i:=top to Bottom do
       CopyCell(SG,DColl,i,IColl);
  Selection:=SelRect;
  DeleteCellRect(SG,DColl,DRow);
  end;
end;

function GRFind(SG: TStringGrid;Value: string): Boolean;
var i,z: Integer;
begin
Result:=False;
 with SG do
  for i:=0 to RowCount do
    for z:=0 to ColCount-1 do
     Result:=Result or (Cells[z,i]=Value)
end;

procedure AddToCell(SG:TStringGrid;InCol: Integer;Value: string);
var i: Integer;
begin
 with SG do
  begin
   ReinitializeRows(SG);
   for i:=0 to RowCount-1 do
    if (Cells[InCol,i]=EmptyStr) then
     begin
      Cells[InCol,i]:=Value;
      Exit;
     end;
    RowCount:=RowCount+1;
    Cells[InCol,RowCount-1]:=Value;
  end;
end;

procedure ClearGrid(Sg: TStringGrid);
var i,z: integer;
begin
 with SG do
   begin
   for z:=0 to RowCount do
    for i:=0 to ColCount-1 do
     Cells[i,z]:=EmptyStr;
    RowCount:=0;
   end;
end;

end.
 
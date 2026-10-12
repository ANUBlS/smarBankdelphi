unit SBStoredProc;

interface

uses Classes, CheckLst;

function StrToComma(S: string; const CommaDelimiter: char = ''''): string;
function TrimAll(S: string; const CommaDelimiter: char = ' '): string;
function DeleteGaps(var S: string; const CommaDelimiter: char = ' '): string;
function WillEnabled(Sender: TCheckListBox): boolean;
function IsEnabled(Sender: TCheckListBox): boolean;

implementation

function StrToComma(S: string; const CommaDelimiter: char = ''''): string;

  procedure Reverse(S: string; StringList: TStringList);
  var
     p: word;
     ParedStr: string;
  begin
   p :=Pos(',', S);
   if p <> 0 then
    begin
     ParedStr :=CommaDelimiter + Copy(S, 1, p-1) + CommaDelimiter;
     StringList.Add(ParedStr);
     Delete(S, 1, p);
     Reverse(S, StringList);
    end
   else
    StringList.Add(CommaDelimiter + S + CommaDelimiter);
  end;

var
   StringList: TStringList;
begin
 S :=TrimAll(S);
 StringList :=TStringList.Create;
 Reverse(S, StringList);
 Result :=StringList.CommaText;
end;

function TrimAll(S: string; const CommaDelimiter: char = ' '): string;
var
   P: word;
begin
 P :=1;
 while P > 0 do
 begin
  P :=Pos(CommaDelimiter, S);
  Delete(S, P, 1 )
 end;
 Result :=S;
end;

function DeleteGaps(var S: string; const CommaDelimiter: char = ' '): string;
var
   P: word;
begin
 P :=Pos(CommaDelimiter, S);
 if P > 0 then
 begin
  Delete(S, P, 1);
  DeleteGaps(S, CommaDelimiter);
 end;
 Result :=S;
end;

function WillEnabled(Sender: TCheckListBox): boolean;
var
   i,icount: integer;
   IsChecked: boolean;
begin
 i := 0;
 IsChecked :=false;
 with Sender do
  begin
   icount :=Items.Count;
   while (i <= icount -1) and (not IsChecked) do
   begin
    IsChecked :=Checked[i];
    inc(i);
   end;
  end;
 Result :=IsChecked;
end;

function IsEnabled(Sender: TCheckListBox): boolean;
var
   i,icount: integer;
   IsChecked: boolean;
begin
 i :=0;
 IsChecked :=true;
 with Sender do
  begin
   icount :=Items.Count;
   while (i <= icount -1) and (IsChecked) do
   begin
    IsChecked :=IsChecked and Checked[i];
    inc(i);
   end
  end;
 Result :=IsChecked; 
end;

end.

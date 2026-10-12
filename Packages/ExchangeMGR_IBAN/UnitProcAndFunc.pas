unit UnitProcAndFunc;

interface

uses   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
       Menus, ExtCtrls, Grids, StdCtrls, Mask, Buttons,ComCtrls, ImgList;

  procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;ARect: TRect; Selected: Boolean);
  function RoundEx(X: Double; Precision: Integer ): Double;
  function SumNumToFullVal(Number :real; val_name, val :string):string;
  function SumNumToFull(Number:real):string;
  procedure SetEN;
  procedure SetRU;

implementation


function RoundEx(X: Double; Precision: Integer ): Double;

var
  ScaledFractPart, Temp: Double;
begin
  ScaledFractPart := Frac(X) * Precision;
  Temp := Frac(ScaledFractPart);
  ScaledFractPart := Int(ScaledFractPart);
  if Temp=5 then
    ScaledFractPart := ScaledFractPart + 1;
  if Temp=-5 then
    ScaledFractPart := ScaledFractPart - 1;


  RoundEx := Int(X) + ScaledFractPart / Precision;
end;


procedure SetRU;
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  LoadKeyboardLayout(StrCopy(Layout, '00000419'), KLF_ACTIVATE);
end;

procedure SetEN;
var
  Layout: array [0.. KL_NAMELENGTH] of char;
begin
  LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
end;

function SumNumToFullVal(Number :real; val_name, val :string):string;
var
  PartNum, TruncNum, NumTMP, D: integer;
  NumStr : string;
  i, R : byte;
  Flag11 : boolean;
begin
PartNum:=0;
  D:=1000000;
  R:=4;

  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;
      Dec(R);
      D:=D div 1000;
    until
      PartNum<>0
  else
    R:=0;


  for i:=R downto 1 do
  begin
    Flag11:=False;

    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'יצח ';
      2: NumStr:=NumStr+'טךט יצח ';
      3: NumStr:=NumStr+'צק יצח ';
      4: NumStr:=NumStr+'ה‏נה יצח ';
      5: NumStr:=NumStr+'בור יצח ';
      6: NumStr:=NumStr+'אכעû יצח ';
      7: NumStr:=NumStr+'יוההט יצח ';
      8: NumStr:=NumStr+'סÿךךטח יצח ';
      9: NumStr:=NumStr+'המדדףח יצח ';
    end;

    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'מם ';
          11: NumStr:=NumStr+'מם בטנ ';
          12: NumStr:=NumStr+'מם טךט ';
          13: NumStr:=NumStr+'מם צק ';
          14: NumStr:=NumStr+'מם ה‏נה ';
          15: NumStr:=NumStr+'מם בור ';
          16: NumStr:=NumStr+'מם אכעû ';
          17: NumStr:=NumStr+'מם יוההט ';
          18: NumStr:=NumStr+'מם סוךךטח ';
          19: NumStr:=NumStr+'מם המדדףח ';
        end;
        case i of
          3: NumStr:=NumStr+'לטכימם ';
          2: NumStr:=NumStr+'לטם ';
          1: NumStr:=NumStr+val_name;
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'טיטנלט ';
      3: NumStr:=NumStr+'מעףח ';
      4: NumStr:=NumStr+'דûנץ ';
      5: NumStr:=NumStr+'ÿככט ';
      6: NumStr:=NumStr+'אעלûר ';
      7: NumStr:=NumStr+'יועלטר ';
      8: NumStr:=NumStr+'סוךסום ';
      9: NumStr:=NumStr+'המץסאם ';
    end;

    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'בטנ '
          else
            NumStr:=NumStr+'בטנ ';
        2:
          if i=2 then
            NumStr:=NumStr+'טךט '
          else
            NumStr:=NumStr+'טךט ';
        3: NumStr:=NumStr+'צק ';
        4: NumStr:=NumStr+'ה‏נה ';
        5: NumStr:=NumStr+'בור ';
        6: NumStr:=NumStr+'אכעû ';
        7: NumStr:=NumStr+'יוההט ';
        8: NumStr:=NumStr+'סוךךטח ';
        9: NumStr:=NumStr+'המדדףח ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'לטכימם ';
            2,3,4: NumStr:=NumStr+'לטכימם ';
            else
              NumStr:=NumStr+'לטכימם ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'לטם ';
            2,3,4: NumStr:=NumStr+'לטם ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'לטם ';
          end;
        1:
          case NumTMP of
            1 : NumStr:=NumStr+val_name;
            2,3,4: NumStr:=NumStr+val_name;
            else
              NumStr:=NumStr+val_name;
          end;
      end;
    end;
    if i>1 then
    begin
      PartNum:=(TruncNum mod (D*1000)) div D;
      D:=D div 1000;
    end;
  end;


  PartNum:=Round(Frac(Number)*100);
  if PartNum=0 then
  begin
    SumNumToFullVal:=NumStr;
    Exit;
  end;

  NumTMP:=PartNum div 10;
  if NumTMP=0 then
    NumStr:=NumStr+'0'+IntToStr(PartNum)+' '
  else
    NumStr:=NumStr+IntToStr(PartNum)+' ';

  NumTMP:=PartNum mod 10;
  case NumTMP of
    1:
      if PartNum<>11 then
        NumStr:=NumStr+val
      else
        NumStr:=NumStr+val;
    2,3,4:
      if (PartNum<5) or (PartNum>14) then
        NumStr:=NumStr+val
      else
        NumStr:=NumStr+val
    else
      NumStr:=NumStr+val;
  end;
  SumNumToFullVal:=NumStr;
end;


function SumNumToFull(Number:real):string;
var
  PartNum, TruncNum, NumTMP, D: integer;
  NumStr : string;
  i, R : byte;
  Flag11 : boolean;
begin
PartNum:=0;
  D:=1000000;
  R:=4;

  TruncNum:=Trunc(Number);
  if TruncNum<>0 then
    repeat
      PartNum:=TruncNum div D;
      Dec(R);
      D:=D div 1000;
    until
      PartNum<>0
  else
    R:=0;


  for i:=R downto 1 do
  begin
    Flag11:=False;

    NumTMP:=PartNum div 100;
    case NumTMP of
      1: NumStr:=NumStr+'יצח ';
      2: NumStr:=NumStr+'טךט יצח ';
      3: NumStr:=NumStr+'צק יצח ';
      4: NumStr:=NumStr+'ה‏נה יצח ';
      5: NumStr:=NumStr+'בור יצח ';
      6: NumStr:=NumStr+'אכעû יצח ';
      7: NumStr:=NumStr+'יוההט יצח ';
      8: NumStr:=NumStr+'סÿךךטח יצח ';
      9: NumStr:=NumStr+'המדדףח יצח ';
    end;

    NumTMP:=(PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP:=PartNum mod 100;
        case NumTMP of
          10: NumStr:=NumStr+'מם ';
          11: NumStr:=NumStr+'מם בטנ ';
          12: NumStr:=NumStr+'מם טךט ';
          13: NumStr:=NumStr+'מם צק ';
          14: NumStr:=NumStr+'מם ה‏נה ';
          15: NumStr:=NumStr+'מם בור ';
          16: NumStr:=NumStr+'מם אכעû ';
          17: NumStr:=NumStr+'מם יוההט ';
          18: NumStr:=NumStr+'מם סוךךטח ';
          19: NumStr:=NumStr+'מם המדדףח ';
        end;
        case i of
          3: NumStr:=NumStr+'לטכימם ';
          2: NumStr:=NumStr+'לטם ';
        end;
        Flag11:=True;
      end;
      2: NumStr:=NumStr+'טיטנלט ';
      3: NumStr:=NumStr+'מעףח ';
      4: NumStr:=NumStr+'דûנץ ';
      5: NumStr:=NumStr+'ÿככט ';
      6: NumStr:=NumStr+'אעלûר ';
      7: NumStr:=NumStr+'יועלטר ';
      8: NumStr:=NumStr+'סוךסום ';
      9: NumStr:=NumStr+'המץסאם ';
    end;

    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i=2 then
            NumStr:=NumStr+'בטנ '
          else
            NumStr:=NumStr+'בטנ ';
        2:
          if i=2 then
            NumStr:=NumStr+'טךט '
          else
            NumStr:=NumStr+'טךט ';
        3: NumStr:=NumStr+'צק ';
        4: NumStr:=NumStr+'ה‏נה ';
        5: NumStr:=NumStr+'בור ';
        6: NumStr:=NumStr+'אכעû ';
        7: NumStr:=NumStr+'יוההט ';
        8: NumStr:=NumStr+'סוךךטח ';
        9: NumStr:=NumStr+'המדדףח ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr:=NumStr+'לטכימם ';
            2,3,4: NumStr:=NumStr+'לטכימם ';
            else
              NumStr:=NumStr+'לטכימם ';
          end;
        2:
          case NumTMP of
            1 : NumStr:=NumStr+'לטם ';
            2,3,4: NumStr:=NumStr+'לטם ';
            else
              if PartNum<>0 then
                NumStr:=NumStr+'לטם ';
          end;

      end;
    end;
    if i>1 then
    begin
      PartNum:=(TruncNum mod (D*1000)) div D;
      D:=D div 1000;
    end;
  end;
 
  SumNumToFull:=NumStr;
end;




procedure MenuShrift(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;

      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)+2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 1;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 1;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 1);
            Inc(Bar.Right, 1);
            Inc(Bar.Top, 1);
            Inc(Bar.Bottom, 1);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;
end;


end.

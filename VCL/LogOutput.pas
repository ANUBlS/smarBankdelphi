unit LogOutput;

interface

uses Windows, Messages, Graphics, Classes, Controls, ComCtrls, StdCtrls, ImgList;

type
  TLogMessages = (lmWarning, lmError, lmInformation);

type
  TLogOutput = class(TListBox)
  private
    FImages : TImageList;
    FImgIndex : Integer;
    FBitmap : TBitmap;
    procedure PutLine(Log : String;LogType : TLogMessages);
  protected
    procedure CustomDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure SetImages(Value : TImageList);
    procedure Notification(AComponent: TComponent;
      Operation: TOperation);override;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    procedure LogError(Message : String);
    procedure LogWarning(Message : String);
    procedure LogInformation(Message : String);
  published
    property Images : TImageList read FImages write SetImages;
  end;

procedure Register;

implementation

constructor TLogOutput.Create(AOwner : TComponent);
begin
  inherited;
  FImgIndex := -1;
  Style := lbOwnerDrawFixed;
  OnDrawItem := CustomDrawItem;
  FBitmap := TBitmap.Create;
//  ItemHeight := 16;
end;

destructor TLogOutput.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TLogOutput.SetImages;
begin
  FImages := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TLogOutput.PutLine(Log : String;LogType : TLogMessages);
const
  Logs : array[TLogMessages] of Integer = (0,1,2);
begin
  if FImages <> nil then
  begin
    FImgIndex := Logs[LogType];
    Images.GetBitmap(FImgIndex,FBitmap);

    if FBitmap <> nil then
      Items.AddObject(Log,FBitmap)
    else
      Items.Add(Log);
  end;
end;

procedure TLogOutput.Notification;
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  if (AComponent = Images) then Images := nil;
end;

procedure TLogOutput.CustomDrawItem;
var
	Offset: Integer;      { text offset width }
  Bitmap : TBitmap;
begin
	with Canvas do  { draw on control canvas, not on the form }
	begin
  	FillRect(Rect);       { clear the rectangle }
  	Offset := 2;          { provide default offset }
  	Bitmap := TBitmap(Items.Objects[Index]);  { get the bitmap }
    if (Bitmap <> nil) then
  	begin
  		BrushCopy(Bounds(Rect.Left + 2, Rect.Top, Bitmap.Width, Bitmap.Height),
			Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);  {render bitmap}
  		Offset := Bitmap.width + 6;    { add four pixels between bitmap and text}
	  end;
  TextOut(Rect.Left + Offset, Rect.Top, Items[Index])  { display the text }
  end;
end;

procedure TLogOutput.LogError(Message : String);
begin
  PutLine(Message,lmError);
end;

procedure TLogOutput.LogWarning(Message : String);
begin
  PutLine(Message,lmWarning);
end;

procedure TLogOutput.LogInformation(Message : String);
begin
  PutLine(Message,lmInformation);
end;

procedure Register;
begin
end;


end.

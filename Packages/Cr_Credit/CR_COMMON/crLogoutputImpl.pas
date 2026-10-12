unit crLogoutputImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ImgList, StdCtrls, Menus;

type
  TLogMessage = (lmWarning, lmError, lmInformation);

  TfrmLogOutput = class(TForm)
    LogImages: TImageList;
    LogMenu: TPopupMenu;
    LogListBox: TListBox;
    procedure LogListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FWarningBitmap : TBitmap;
    FErrorBitmap : TBitmap;
    FInformationBitmap : TBitmap;
    procedure AddOutput(OutputMsg : String; Msgtype : TLogMessage; MakeVisible : Boolean);
    { Private declarations }
  public
    procedure LogWarning(OutputMsg : String);
    procedure LogError(OutputMsg : String);
    procedure LogInformation(OutputMsg : String; MakeVisible : Boolean = False);
    { Public declarations }
  end;

var
  frmLogOutput: TfrmLogOutput;

implementation

{$R *.DFM}

procedure TfrmLogOutput.LogListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
	Bitmap: TBitmap;
	Offset: Integer;
begin
  with (Control as TListBox).Canvas do
  begin
    FillRect(Rect);
    Offset := 2;
    Bitmap := TBitmap((Control as TListBox).Items.Objects[Index]);  { get the bitmap }

    if Bitmap <> nil then
    begin
       BrushCopy(Bounds(Rect.Left + 2, Rect.Top, Bitmap.Width, Bitmap.Height),
        Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);
      Offset := Bitmap.width + 6;    { add four pixels between bitmap and text}
    end;
    TextOut(Rect.Left + Offset, Rect.Top, (Control as TListBox).Items[Index])  { display the text }
  end;
end;

procedure TfrmLogOutput.FormCreate(Sender: TObject);
begin
    FWarningBitmap := TBitmap.Create;
    LogImages.GetBitmap(0,FWarningBitmap);
    FErrorBitmap := TBitmap.Create;
    LogImages.GetBitmap(1,FErrorBitmap);
    FInformationBitmap := TBitmap.Create;
    LogImages.GetBitmap(2,FInformationBitmap);
end;

procedure TfrmLogOutput.FormDestroy(Sender: TObject);
begin
    FWarningBitmap.Free;
    FErrorBitmap.Free;
    FInformationBitmap.Free;
end;

procedure TfrmLogOutput.AddOutput(OutputMsg : String; Msgtype : TLogMessage; MakeVisible : Boolean);
var
  Message : String;
begin
  Message := '*** '+TimeToStr(Now)+' - '+OutputMsg;
  with LogListBox,Items do
  begin
  case Msgtype of
    lmWarning : ItemIndex := AddObject(Message,
      FWarningBitmap);
    lmError:ItemIndex := AddObject(Message,
      FErrorBitmap);
    lmInformation:ItemIndex := AddObject(Message,
      FInformationBitmap);
  end; // case
  end;
  if MakeVisible and
     not Visible
  then
    Show
end;

procedure TfrmLogOutput.LogWarning(OutputMsg : String);
begin
  AddOutput(OutputMsg,lmWarning,True)
end;

procedure TfrmLogOutput.LogError(OutputMsg : String);
begin
  AddOutput(OutputMsg,lmError,True)
end;

procedure TfrmLogOutput.LogInformation(OutputMsg : String; MakeVisible : Boolean = False);
begin
  AddOutput(OutputMsg,lmInformation,MakeVisible)
end;

end.

unit PhotoImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtDlgs, DBCtrls;

type
  TFormPhoto = class(TForm)
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPhoto: TFormPhoto;

implementation
 uses CashDataModule;
{$R *.DFM}

procedure TFormPhoto.SpeedButton1Click(Sender: TObject);
var
   Photo:TPicture;
begin
//*********** sakartvelo************/
 Photo :=TPicture.Create;
 CashDataMod.Settings.open;
  try
   if  OpenPictureDialog1.Execute  then
    Photo.LoadFromFile(OpenPictureDialog1.FileName);
    CashDataMod.Settings.Edit;
    DBImage1.Picture.Assign(Photo);
   finally
    Photo.Free;
   end;
CashDataMod.Settings.Post
  end;
procedure TFormPhoto.SpeedButton2Click(Sender: TObject);
begin
CashDataMod.Settings.Edit;
CashDataMod.Settings.FieldByName('PHOTO').Clear;
CashDataMod.Settings.post;
end;

end.

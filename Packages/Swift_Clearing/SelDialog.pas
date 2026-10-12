unit SelDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, AppEvnts;

type
  TSelDirFrm = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    But_Ok: TBitBtn;
    But_cancel: TBitBtn;
    ApplicationEvents1: TApplicationEvents;
    procedure But_cancelClick(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure But_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelDirFrm: TSelDirFrm;

implementation

uses  Properties_Unit;

{$R *.DFM}

procedure TSelDirFrm.But_cancelClick(Sender: TObject);
begin
  close;
end;

procedure TSelDirFrm.DriveComboBox1Change(Sender: TObject);
begin

//    if DriveComboBox1.Drive =
end;

procedure TSelDirFrm.But_OkClick(Sender: TObject);
begin
   if PropertiesForm.GetIndir then
      PropertiesForm.Edit_IN_Dir.Text:=DirectoryListBox1.Directory else
   if PropertiesForm.GetOutdir then
      PropertiesForm.Edit_OUT_Dir.Text:=DirectoryListBox1.Directory else
      {}
   if PropertiesForm.sw_GetIndir then
      PropertiesForm.Edit_swIN.Text:=DirectoryListBox1.Directory else
   if PropertiesForm.sw_GetOutdir then
      PropertiesForm.Edit_swOUT.Text:=DirectoryListBox1.Directory ;
      {}
   PropertiesForm.Getindir:=false;
   PropertiesForm.GetOutdir:=false;
   PropertiesForm.sw_Getindir:=false;
   PropertiesForm.sw_GetOutdir:=false;
   close;
end;

end.

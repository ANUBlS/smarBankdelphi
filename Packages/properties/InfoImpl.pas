unit InfoImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, ExtDlgs,OracleData,db, ExtCtrls,
  OracleNavigator,ShellApi;

type
  TInfoFrm = class(TForm)
    DBGrid1: TDBGrid;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    OpenPictureDialog2: TOpenPictureDialog;
    OracleNavigator3: TOracleNavigator;
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoFrm: TInfoFrm;

implementation

{$R *.dfm}
 uses DMprop;
procedure TInfoFrm.SpeedButton14Click(Sender: TObject);
var fileName,Path:String;
DataSet: TOracleDataSet;
begin

 DataSet:= DMproperties.Info;

with DataSet do
 begin
  Edit;
  if OpenPictureDialog2.Execute then
    TBlobField(DataSet.FieldByName('info')).LoadFromFile(OpenPictureDialog2.FileName)
  else
    begin
    exit;
    DataSet.cancel;
    end;
  DataSet.FieldByName('filename').Value:=ExtractFileName( OpenPictureDialog2.FileName);
  DataSet.Post;
 end;

end;

procedure TInfoFrm.SpeedButton15Click(Sender: TObject);
  var fileName,Path:String;
DataSet: TOracleDataSet;
begin

 DataSet:= DMproperties.Info;

if TBlobField(DataSet.FieldByName('info')).IsNull then
  begin
    ShowMessage('Məlumat yoxdur ');
    exit
  end;
   Path:=ExtractFilePath(Application.ExeName)+'DocTemp\';
   FileName:=Path+DataSet.FieldByName('filename').Value;

if not DirectoryExists(Path) then
   MkDir(Path);
   TBlobField(DataSet.FieldByName('info')).SaveToFile(FileName);
   ShellExecute(handle,'Open',PChar(FileName),nil,nil,SW_SHOW)

end;

end.

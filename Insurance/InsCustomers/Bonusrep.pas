unit Bonusrep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ShlObj,
  Dialogs, CMExcelExport, StdCtrls, ComCtrls,ShellApi, QExport4, QExport4XLS,
  QExport4Xlsx;

type
  TBonusReport = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    QExport4Xlsx1: TQExport4Xlsx;
    CMExcelExport1: TCMExcelExport;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BonusReport: TBonusReport;

implementation

uses InsDataModule;

{$R *.dfm}


function DesktopPath:string;
var zpath: array [0..MAX_PATH] of char;
 begin
 SHGetFolderPath(0, CSIDL_DESKTOP, 0, SHGFP_TYPE_CURRENT, @zpath);
 result:=   (zpath);
end ;

procedure TBonusReport.Button1Click(Sender: TObject);
begin
InsDataMod.ins_bonushesabat.CloseAll;

InsDataMod.ins_bonushesabat.SetVariable('dat1',trunc(DateTimePicker1.Date));
InsDataMod.ins_bonushesabat.SetVariable('dat2',trunc(DateTimePicker2.Date));
InsDataMod.ins_bonushesabat.SetVariable('DBBALCN',edit1.text);
InsDataMod.ins_bonushesabat.SetVariable('KRBALCN',edit2.text);

InsDataMod.ins_bonushesabat.Open;

     with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( InsDataMod.ins_bonushesabat, 'Transactions', True, false);
      Disconnect;
   end;
InsDataMod.ins_bonushesabat.close;
end;

end.

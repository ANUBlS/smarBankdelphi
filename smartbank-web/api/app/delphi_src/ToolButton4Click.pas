{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 3786-3818 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.ToolButton4Click(Sender: TObject);
var
fileformat:integer;  //0 prt   1 fin
v_currDir: String;
begin
v_currDir:=GetCurrentDir;
SWDataModule.settings.open;
OutFilePath:=SWDataModule.settingsPATH.asstring;

case  SWDataModule.settingsINN_FILETYPE.AsInteger of
0: struktur:='SWF';
1: struktur:='FIN';
end;
sw_out_FileListBox.ApplyFilePath(OutFilePath);
sw_out_FileListBox.Update;

if struktur='SWF' then
  sw_out_FileListBox.Mask:=('*.SWF');

if struktur='FIN' then
  sw_out_FileListBox.Mask:=('*.fin');

fileformat:=SWDataModule.sw_settings.FieldByName('INN_FILETYPE').asInteger;
 if fileformat=0 then
 //konvert.Execute;
 Konvertex.Execute;

 if fileformat=1 then
 konvert3.Execute;


 sw_out_FileListBox.ApplyFilePath(v_currDir);
end;

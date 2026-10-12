unit PdfForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, Grids, XDBGrids, ExtCtrls,DB,ShellAPI;

type
  TFormPdf = class(TForm)
    XFPanel1: TXFPanel;
    XDBGrid1: TXDBGrid;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    XFButton3: TXFButton;
    ODExport: TOpenDialog;
    SDImport: TSaveDialog;
    XFButton4: TXFButton;
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure XFButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPdf: TFormPdf;

implementation
uses UnitDataModuleCourt;

{$R *.dfm}

procedure TFormPdf.XFButton1Click(Sender: TObject);
begin
 if ODExport.Execute then
  begin
    With DataModuleCourt do
    begin
      ODSPdf.Open;
      ODSPdf.insert;
     // ODSPdf.FieldByName('name').AsString:=ODExport.FileName;
      ODSPdf.FieldByName('name').AsString:=ChangeFileExt(ExtractFileName(ODExport.Filename),'')+'.pdf';
      tblobfield(ODSPdf.FieldByName('pdf')).LoadFromFile(ODExport.FileName);
      ODSPdf.Post;
      ODSPdf.Refresh;
      ShowMessage('Fayıl qəbul olundu');
    end;
  end;
end;

procedure TFormPdf.XFButton2Click(Sender: TObject);
var
ptkwrd:Tmemorystream;
begin
  ptkwrd:= Tmemorystream.Create;
  tblobfield(DataModuleCourt.ODSPdf.FieldByName('pdf')).SaveToStream(ptkwrd);
  ptkwrd.Position:=0;
  SDImport.FileName:=DataModuleCourt.ODSPdf.FieldByName('name').AsString;
  if SDImport.Execute then ptkwrd.SaveToFile(SDImport.FileName);
  ptkwrd.Free;
end;

procedure TFormPdf.XFButton3Click(Sender: TObject);
begin

  DataModuleCourt.ODSPdf.edit;
  XDBGrid1.SelectedRows.Delete;
  DataModuleCourt.ODSPdf.Refresh;
end;

procedure TFormPdf.XFButton4Click(Sender: TObject);
var
ptkwrd:Tmemorystream;
begin
  ShowMessage('Texniki işlər gedir yekunlaşdırdıqda sizə xəbər veriləcək');
  {ptkwrd:= Tmemorystream.Create;
  with SDImport.Create(nil) do
   BEGIN
 // try



    tblobfield(DataModuleCourt.ODSPdf.FieldByName('pdf')).SaveToStream(ptkwrd);
    FileName:=DataModuleCourt.ODSPdf.FieldByName('name').AsString;
    if Execute and (ExtractFileExt(FileName) = '.pdf') then  ptkwrd.SaveToFile(FileName);

      ShellExecute(0, 'Open', PChar(FileName), nil, nil, SW_SHOWNORMAL);

 // finally

    Free;

 // end;
end;           }
end;

end.

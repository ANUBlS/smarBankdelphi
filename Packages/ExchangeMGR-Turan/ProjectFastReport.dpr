program ProjectFastReport;

uses
  Forms,
  Unit1 in 'C:\Documents and Settings\Teymur\Desktop\Misal\Unit1.pas' {Form1},
  UnitFastReport in 'UnitFastReport.pas' {FormFastReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormFastReport, FormFastReport);
  Application.Run;
end.

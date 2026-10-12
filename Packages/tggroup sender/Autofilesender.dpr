program Autofilesender;

uses
  Vcl.Forms,
  Sendtotelegram in 'Sendtotelegram.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

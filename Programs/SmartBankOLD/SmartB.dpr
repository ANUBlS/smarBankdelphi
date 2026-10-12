program SmartB;

uses
  Forms,
  sbMainForm_Unit in 'sbMainForm_Unit.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

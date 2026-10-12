program IniSourceEditor;

uses
  Forms,
  MainForm_Unit in 'MainForm_Unit.pas' {Form1},
  OpenIniFileFormImpl in 'OpenIniFileFormImpl.pas' {OpenIniFileForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TOpenIniFileForm, OpenIniFileForm);
  Application.Run;
end.

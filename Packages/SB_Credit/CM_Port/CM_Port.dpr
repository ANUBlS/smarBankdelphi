program CM_Port;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  PortDatModImpl in 'PortDatModImpl.pas' {PortDatMod: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPortDatMod, PortDatMod);
  Application.Run;
end.

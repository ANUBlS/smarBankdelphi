program Account;
{$APPTYPE GUI}

uses
  Forms,
  WebReq,
  IdHTTPWebBrokerBridge,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {WebModule2: TWebModule},
  Account_gridImpl in 'Account_gridImpl.pas',
  Account_gridIntf in 'Account_gridIntf.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

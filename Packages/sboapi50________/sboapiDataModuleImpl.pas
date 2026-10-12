unit sboapiDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SBOInitPkg, Oracle, OracleData, ICECrypt, ICEOralogon;

type
  TsboapiDataModule = class(TDataModule)
    SBSession: TOracleSession;
    SBLogon: TOracleLogon;
    SBOperationDay: TOraclePackage;
    GetCustomer: TOracleDataSet;
    SBSecurity: TOraclePackage;
    SBReferences: TOraclePackage;
    SBReport: TOraclePackage;
    SBRateManagement: TOraclePackage;
    SBSystem: TOraclePackage;
    SBUtil: TOraclePackage;
    SBInstallation: TOraclePackage;
    SBCorrection: TOraclePackage;
    SBSettings: TOraclePackage;
    SBTransaction: TOraclePackage;
    SBMessage: TOraclePackage;
    SBSessionMgr: TOraclePackage;
    SBLogin: TOraclePackage;
    SBModules: TOraclePackage;
    SBAca: TOraclePackage;
    Crypt: TICECrypt;
    OraLogon: TICEOralogon;
  private
    { Private declarations }
    FCurrentSBData: TSBOData;
  public
    { Public declarations }
    function AskForLogon(var SBData: TSBOData; LogonOptions: TAskForLogonOptions): Boolean;
    procedure SetSBData(const SBData: TSBOData);
    procedure GetSBData(var SBData: TSBOData);
    procedure LogOn;
    procedure LogOff;
  end;

var
  sboapiDataModule: TsboapiDataModule;

implementation

{$R *.DFM}

function TsboapiDataModule.AskForLogon(var SBData: TSBOData; LogonOptions: TAskForLogonOptions): Boolean;
begin
  with SBSession, SBData do
  begin
    LogonUsername := UserName;
    LogonPassword := Password;
    LogonDatabase := Database;
  end;
  with OraLogon do
  begin   {
    if aflShowDatabase in LogonOptions then
    begin
      Options := Options + [ldDatabase];
      if aflShowDatabaseList in LogonOptions then
        Options := Options + [ldDatabaseList];
    end;   }
    IniSource := ExtractFilePath(ParamStr(0))+'ICELogon.ini';
    Result := Execute=1;
  end;
  if Result then
    with SBSession, SBData do
    begin
      UserName := LogonUsername;
      Password := LogonPassword;
      Database := LogonDatabase;
    end;     
end;

procedure TsboapiDataModule.SetSBData(const SBData: TSBOData);
begin
  with SBData, SBSession do
  begin
    LogonUsername := UserName;
    LogonPassword := Password;
    LogonDatabase := Database;
  end;
  FCurrentSBData := SBData;
end;

procedure TsboapiDataModule.GetSBData(var SBData: TSBOData);
begin
  SBData := FCurrentSBData;
end;

procedure TsboapiDataModule.LogOn;
begin
  with SBSession do
    LogOn;
end;

procedure TsboapiDataModule.LogOff;
begin
  with SBSession do
    LogOff;
end;

end.

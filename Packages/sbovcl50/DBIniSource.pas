unit DBIniSource;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CustomInst, IniSource, Oracle;

type
  TDBIniSource = class(TWinIniSource)
  private
    FSession: TOracleSession;
    procedure SetSession(Value: TOracleSession);
  protected
    procedure ChangeState(DoOpen: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    property Session: TOracleSession read FSession write SetSession;
  end;

const
  istOracle = 'ora';

implementation

uses DBIniFile;

constructor TDBIniSource.Create(AOwner: TComponent);
begin
  inherited;
  IniFileClass := TDBIniFile;
end;

procedure TDBIniSource.SetSession(Value: TOracleSession);
begin
  (IniFile as TDBIniFile).Session := Value;
  FSession := Value;
end;

procedure TDBIniSource.ChangeState(DoOpen: Boolean);
begin
{  if not Assigned(Session) then
    ConfigRequired;}
  inherited;
end;

initialization
  IniSourceManager.RegFactory( TIniSourceFactory.Create(nil, TDBIniSource, istOracle ) );
end.

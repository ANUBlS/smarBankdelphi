unit IniPkg;

interface

uses SysUtils;

type
  ENotInitialized = class(Exception);

procedure Initialize;
procedure CheckInitialized;
function GetInitialized: Boolean;
procedure FailIfClean;

implementation

uses
  SmartBaseDecls,
  SmartBaseUnit,
  AccountUnit,
  CurrencyUnit,
  TransactionUnit,
  MoviesUnit;

var
  Initialized       : Boolean = False;

const
  LibName = 'smapi50';

procedure Initialize;
begin
  if not Initialized then
  begin
    AccountUnit.Initialize;
    CurrencyUnit.Initialize;
    MoviesUnit.Initialize;
    SmartBaseUnit.Initialize;
    TransactionUnit.Initialize;
    
    Initialized := True;
  end;
end;

procedure Cleanup;
begin
  if Initialized then
  begin
    AccountUnit.Cleanup;
    CurrencyUnit.Cleanup;
    MoviesUnit.Cleanup;
    SmartBaseUnit.Cleanup;
    TransactionUnit.Cleanup;

    Initialized := False;
  end;
end;

procedure CheckInitialized;
begin
  if not GetInitialized then
    Initialize;
end;

function GetInitialized: Boolean;
begin
  Result := Initialized;
end;

procedure FailIfClean;
begin
  if not GetInitialized then
    raise ENotInitialized.CreateFmt('Library "%s" not initialized', [LibName]);
end;

initialization
finalization
  Cleanup;
end.

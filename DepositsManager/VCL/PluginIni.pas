unit PluginIni;

interface

uses
   Windows, SysUtils, Classes, IniFiles;

type
   TMenuIni = class(TComponent)
   private
     FIniLocation : string;
     FIniSection : string;
     FActive : Boolean;
   protected
     function GetActive : Boolean;
     procedure SetActive(const Value : Boolean);
   public
     Location : TIniFile;
     constructor Create(AOwner : TComponent); override;
     destructor  Destroy; override;
     procedure Open;
     procedure Close;
   published
     property IniLocation : string read FIniLocation write FIniLocation;
     property IniSection : string read FIniSection write FIniSection;
     property Active : Boolean read GetActive write SetActive;
   end;

procedure Register;

implementation

constructor TMenuIni.Create;
begin
  inherited Create(AOwner);
end;

destructor  TMenuIni.Destroy;
begin
  inherited Destroy;
end;

function TMenuIni.GetActive : Boolean;
begin
  Result := FActive;
end;

procedure TMenuIni.SetActive(const Value : Boolean);
begin
  if ([csDesigning] * ComponentState = []) then
  if Value <> FActive then
    if Value then
      Location := TIniFile.Create(IniLocation)
    else Location.Free;

  FActive := Value;
end;

procedure TMenuIni.Open;
begin
  Active := True;
end;

procedure TMenuIni.Close;
begin
  Active := False;
end;

procedure Register;
begin
  RegisterComponents('CreditsMgr',[TMenuIni])
end;

end.

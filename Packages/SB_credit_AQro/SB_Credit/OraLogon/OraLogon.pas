unit OraLogon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,Oracle,OracleData,
  FrmConnectionImpl,FrmChangePasswordImpl,Registry;

type
  TOraLogon = class(TComponent)
  private
    FCaption : String;
    FSession : TOracleSession;
    FRetries : Integer;
    //FOracleHome : String;
    FOracleHomes : TStringlist;
    procedure SetSession(Ses :TOracleSession);
    function PrepareLogon :Boolean;
    procedure GetLogonParams;
    function GetNewPassword :String;
    procedure GetOracleHomes;
    function GetServiceNames(StrKey :String) :Boolean;
    procedure SetFirstParams;
    procedure SetPass(NewPass :String; Sess :TOracleSession);
  protected

  public
    PLogonDatabase : String;
    PLogonUsername :String;
    PLogonPassword :String;
    procedure Execute;
    constructor Create (COwner :TComponent); override;
    destructor Destroy; override;
  published
     property Caption :String read FCaption write FCaption;
     property Session : TOracleSession read FSession write SetSession;
     property Retries : Integer read FRetries write FRetries;
   //  property OracleHome : String read FOracleHome write SetOracleHomes;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Smart', [TOraLogon]);
end;


procedure TOraLogon.Execute;
var Ret :Integer;
begin
   Ret := 1;
   while Ret <= Retries do
   begin
      with Session do
      try
       if  not PrepareLogon then  exit;
       LogonUsername := PLogonUsername;
       LogonPassword := PLogonPassword;
       LogonDatabase := PLogonDatabase;
       LogOn;
       if Connected then exit;
       if ExpirationMessage <> '' then
          ShowMessage(ExpirationMessage);
      except
      on E:EOracleError do
    begin
    if E.ErrorCode <> 28001 then
      ShowMessage(E.Message)
    else try
          ShowMessage(E.Message);
             SetPass(GetNewPassword,Session);
          if FrmConnection.TryConnect then
             Logon;
    except
      on E:EOracleError do ShowMessage(E.Message);
    end;
   end;
   end;
   Ret := Ret +1;
  end;
end;

procedure TOraLogon.SetPass(NewPass :String; Sess :TOracleSession);
begin
   if (NewPass <> '') and FrmChangePassword.ChangePass then
    with Sess do
       SetPassword(NewPass);
end;

function TOraLogon.GetNewPassword :String;
begin
   FrmChangePassword := TFrmChangePassword.Create(Self);
   with FrmChangePassword do
   begin
     try
       ShowModal;
       Result := NewPassword;
     finally
       Free;
     end;
   end;  
end;

procedure TOraLogon.GetLogonParams;
begin
   PLogonDatabase := FrmConnection.LogonDatabase;
   PLogonUsername := FrmConnection.LogonUsername;
   PLogonPassword := FrmConnection.LogonPassword;
end;

function TOraLogon.PrepareLogon :Boolean;
var CountOraHomes,Index : Integer;
begin
   CountOraHomes := FOracleHomes.Count;
   FrmConnection := TFrmConnection.Create(Self);
   SetFirstParams;
   with FrmConnection do       
     try
       index := 0;
       while not GetServiceNames(FOracleHomes.Strings[index]) do
       begin
          index := index +1;
          if index = CountOraHomes then
          break;
       end;
       Caption := FCaption;
       Result:=  ShowModal = mrOk;
       GetLogonParams;
     finally
        Free;
     end;
end;


procedure TOraLogon.GetOracleHomes;
const
   MaxOracleHomes = 10;

var   hOracleReg: HKEY;
      NumSubKeys: Integer;
      MaxSubKeyLen: Integer;
      Len: UINT;
      St1: string;
      i:integer;

      OracleHomePaths : array [0..MaxOracleHomes - 1] of string;

begin
    for i := 0 to MaxOracleHomes - 1 do
        OracleHomePaths[i] := '';
  // Find Oracle homes
    if RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar('SOFTWARE\ORACLE'),
      0, KEY_READ, hOracleReg) = ERROR_SUCCESS
    then
     begin
        if RegQueryInfoKey(hOracleReg, nil, nil, nil, @NumSubKeys,
            @MaxSubKeyLen, nil, nil, nil, nil, nil, nil) = ERROR_SUCCESS
       then
         begin
           for i := 0 to NumSubKeys - 1 do
           begin
             Len := MaxSubKeyLen + 1;
             SetLength(St1, Len);
             RegEnumKeyEx(hOracleReg, i, PChar(St1), Len, nil, nil, nil, nil);
             if (AnsiStrLIComp(Pchar(St1), 'HOME', 4) = 0) or (AnsiStrLIComp(Pchar(St1), 'KEY_', 4) = 0) then begin
               Setlength(St1, Len);
               FOracleHomes.Add(St1);
           end;
         end;
     end;
      RegCloseKey(hOracleReg);
      hOracleReg := 0;
    end;
end;

constructor TOraLogon.Create (COwner :TComponent);
begin
   inherited Create(COwner);
   FRetries := 3;
   FOracleHomes := TStringList.Create;
   GetOracleHomes;
   //FOracleHome := FOracleHomes.GetText;
end;

destructor TOraLogon.Destroy;
begin
  FOracleHomes.Free;
  inherited Destroy;
end;

function  TOraLogon.GetServiceNames(StrKey :String) :Boolean;
var
  i,k: integer;
  n:Pchar;
  Mem : TStringList;

    function GetTNSFile :Boolean;
     const
       Cval = '\NETWORK\ADMIN\tnsnames.ora';
    var
      Reg : TRegistry;
      Value : String;
    begin
      reg := TRegistry.Create;
      with reg do
        begin
          RootKey := HKEY_LOCAL_MACHINE;
          OpenKey('SOFTWARE\ORACLE\'+StrKey,False);
          value := ReadString('ORACLE_HOME');
         if FileExists(value+cval) then begin
            Mem.LoadFromFile(value+cval);
            Result := True;
          end
        else
          Result := False;
        end;
    end;

begin
 mem :=  TStringList.Create;
 Result := GetTNSFile;
  with Mem do
    begin
     for i:=0 to  Count-1 do
        begin
          n:= PChar(mem[i]);
          if (n[0] <> '#') and (n[0]<>'') and (n[0]<>' ') then
           begin
             k:= Pos('=',mem[i]);
             FrmConnection.CBDatabases.items.add(copy(mem[i],0,k-2));
           end;
        end;
    end;
end;


procedure TOraLogon.SetSession(Ses :TOracleSession);
begin
   FSession := Ses;
end;

procedure TOraLogon.SetFirstParams;
begin
   with FrmConnection do
    begin
       LogonDatabase := PLogonDatabase;
       LogonUsername := PLogonUsername;
       LogonPassword := PLogonPassword;
    end;
end;

end.
 
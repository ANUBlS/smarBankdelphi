unit ICEOralogon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uLogonImpl, Oracle, ICECrypt, Inifiles;

type
  TSmallChars = 'a'..'z';

  TICEOralogon = class(TComponent)
  private
    FIniSource: String;
    FOraSession: TOracleSession;
    FCrypt: TICECrypt;
    FlFont: TFont;
    FlUsername: String;
    FlPassword: String;
    FlDatabase: String;
    FlOKButton: String;
    FlCancelButton: String;
    FlClearList: String;
    FlSavePassword: String;
    FlSaveUserslist: String;
    FlCaption: String;
    FPasswordChar: Char;
    FErrorStr: String;
    FCryptChar: TSmallChars;
    procedure SetIniSource(Value: String);
    procedure SetOraSession(Value: TOracleSession);
    procedure SetICEcrypt(Value: TICECrypt);
    procedure SetlUsername(Value: String);
    procedure SetlPassword(Value: String);
    procedure SetlDatabase(Value: String);
    procedure SetlOKButton(Value: String);
    procedure SetlCancelButton(Value: String);
    procedure SetlCaption(Value: String);
    procedure SetlFont(Value: TFont);
    procedure SetlSavePassword(Value: String);
    procedure SetlSaveUserslist(Value: String);
    procedure SetPasswordChar(Value: Char);
    procedure IniSet(Sender: TObject; var Action: TCloseAction);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    function Execute:Integer;
    function GetErrorStr: String;
  published
    property IniSource: String read FIniSource write SetIniSource;
    property Session: TOracleSession read FOraSession write SetOraSession;
    property ICECrypt: TICECrypt read FCrypt write SetICEcrypt;
    property lUsername: String read FlUsername write SetlUsername;
    property lPassword: String read FlPassword write SetlPassword;
    property lDatabase: String read FlDatabase write SetlDatabase;
    property lOKButton: String read FlOKButton write SetlOKButton;
    property lCancelButton: String read FlCancelButton write SetlCancelButton;
    property lCaption: String read FlCaption write SetlCaption;
    property lFont: TFont read FlFont write SetlFont;
    property lSavePassword: String read FlSavePassword write SetlSavePassword;
    property lSaveUserList: String read FlSaveUserslist write SetlSaveUserslist;
    property PasswordChar: Char read FPasswordChar write SetPasswordChar;
    property CryptChar: TSmallChars read FCryptChar write FCryptChar;
    property lClearList: String read FlClearList write FlClearList;
  end;

procedure Register;

var
  frmLogon: TfrmLogon;

implementation

constructor TICEOraLogon.Create;
begin
  inherited;
  FlFont := TFont.Create;
  FIniSource := 'c:\ICELogon.ini';
  FlUsername := 'Username';
  FlPassword := 'Password';
  FlDatabase := 'Database';
  FlOKButton := 'OK';
  FlCancelButton := 'Cancel';
  FlCaption := 'Oracle Logon';
  FlSavePassword := 'Save password';
  FlSaveUserslist := 'Save Userslist';
  FlClearList := 'Clear list';
  FPasswordChar := 'x';
  FCryptChar := 's';
end;

procedure TICEOraLogon.SetIniSource;
begin
  FIniSource := Value;
end;

procedure TICEOralogon.SetOraSession;
begin
  FOraSession := Value;
end;

procedure TICEOralogon.SetICECrypt;
begin
  FCrypt := Value;
end;

procedure TICEOralogon.SetlUsername;
begin
  FlUsername := Value;
end;

procedure TICEOralogon.SetlPassword;
begin
  FlPassword := Value;
end;
            
procedure TICEOralogon.SetlDatabase;
begin
  FlDatabase := Value;
end;

procedure TICEOralogon.SetlOKButton;
begin
  FlOKButton := Value;
end;

procedure TICEOralogon.SetlCancelButton;
begin
  FlCancelButton := Value;
end;

procedure TICEOralogon.SetlCaption;
begin
  FlCaption := Value;
end;

procedure TICEOralogon.SetlFont;
begin
  FlFont := Value;
end;

procedure TICEOralogon.SetlSavePassword;
begin
  FlSavePassword := Value;
end;

procedure TICEOralogon.SetlSaveUserslist;
begin
  FlSaveUserslist := Value;
end;

procedure TICEOralogon.SetPasswordChar;
begin
  FPasswordChar := Value;
end;

function ConvertStrToList(Str: String; Separator: Char=','): TStringList;
var
  S2: String;
  List: TStringList;
begin
  List:=TStringList.Create;
  S2 := Str;
  while pos(Separator, S2)>0 do begin
    List.Add(UpperCase(copy(S2,1,pos(Separator, S2)-1)));
    S2 := Copy(S2,pos(Separator, S2)+1,length(S2)-pos(Separator, S2));
  end;
  List.Add(UpperCase(S2));
  List.Sorted:=True;
  List.Duplicates := dupIgnore;
  Result := List;
end;

function ConvertListToStr(List:TStrings; Separator:Char=','):String;
var
  i : Integer;
  S : String;
begin
  S := List[0];
  if List.Count>1 then
    for i:=1 to List.Count-1 do
      S := S +Separator+list[i];
  if copy(S,1,1)=Separator then S := Copy(S,2,length(S)-1);
  result := S;
end;

procedure TICEOraLogon.IniSet;
var
  Ini: TIniFile;
begin  
  Ini := TIniFile.Create(FIniSource);
  with Ini,frmLogon do begin
    if oCSaveUser.Checked then
      WriteString('connect','users',ConvertListToStr(oCUser.Items));
    if oCSavePassword.Checked then
      WriteString('connect','password',oCPassword.Text)
    else                                                
      WriteString('connect','password','');
    WriteString('connect','databases',ConvertListToStr(oCDBList.Items));
    WriteBool('connect','savepassword',oCSavePassword.Checked);
    WriteBool('connect','saveusers',oCSaveUser.Checked);
  end;
end;

function TICEOraLogon.Execute;
var
  Res : Integer;
  Ini: TIniFile;
  ModalRes: Integer;
begin
  Res := -1;
  Ini := TIniFile.Create(FIniSource);
  try                   
    frmLogon := TfrmLogon.Create(Owner);
    with frmLogon , Ini do begin
      Font := FlFont;
      lbDatabase.Caption := FlDatabase;
      lbPassword.Caption := FlPassword;
      lbUsername.Caption := FlUsername;
      Caption := FlCaption;
      btnOK.Caption := FlOKButton;
      btnCancel.Caption := FlCancelButton;
      btnClear.Hint := FlClearList;
      oCSavePassword.Caption := FlSavePassword;
      oCSaveUser.Caption := FlSaveUserslist;
      oCPassword.PasswordChar := FPasswordChar;
      oCUser.Items.Assign(ConvertStrToList(Ini.ReadString('connect','users','')));
      oCPassword.Text := ReadString('connect','password','');
      oCDBList.Items.Assign(ConvertStrToList(Ini.ReadString('connect','databases','SB,SBNEW,SB-CURRENT')));
      oCSavePassword.Checked := ReadBool('connect','savepassword',false);
      oCSaveUser.Checked := ReadBool('connect','saveusers',false);
      OnClose := iniset;
      ModalRes := ShowModal;
    end;
    with frmLogon,Session do begin
      FCrypt.CryptType := cHASH_CRC32;
      FCrypt.Text := oCPassword.Text;
      LogonUsername := oCUser.Text;
      LogonPassword := FCryptChar+FCrypt.GetCrypted;
      LogonDatabase := oCDBList.Text;
      Connected := ModalRes<>IDCANCEL;
      if Connected then Res := 1;
    end;
  except
    on E:Exception do FErrorStr:=E.Message;
  end;
  Result := Res;
end;

function TICEOraLogon.GetErrorStr;
begin
  Result := FErrorStr;
end;






procedure Register;
begin
  RegisterComponents('System', [TICEOralogon]);
end;

end.
 
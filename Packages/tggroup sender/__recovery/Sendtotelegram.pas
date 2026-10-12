unit Sendtotelegram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,IdMultipartFormData, IdServerIOHandler,
  IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Vcl.StdCtrls,shellapi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
 // procedure SendFileToTelegramGroup(const AToken, AChatID, AFilePath: string);
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  function EnumWindowsProc(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;

implementation

{$R *.dfm}

type
  TEnumWindowsCallback = function(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;



const
  TelegramBotToken = '5547473364:AAHoh0kyv_UrbES5BVQuoJ0WQfh6pI-D4u8';
  TelegramGroupChatID = '-1001503811110';
  FilePath = 'D:\file.xlsx';






procedure SendFileToTelegramGroup(const AToken, AChatID, AFilePath: string);
var
  HTTP: TIdHTTP;
  Params: TIdMultipartFormDataStream;
  ResponseContent: string;
begin
  HTTP := TIdHTTP.Create(nil);
  Params := TIdMultipartFormDataStream.Create;
  try
    Params.AddFormField('chat_id', AChatID);
    Params.AddFile('document', AFilePath, 'application/octet-stream');

    HTTP.Request.ContentType := Params.RequestContentType;


    HTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
    TIdSSLIOHandlerSocketOpenSSL(HTTP.IOHandler).SSLOptions.Method := sslvTLSv1_2;

    ResponseContent := HTTP.Post('https://api.telegram.org/bot' + AToken + '/sendDocument', Params);

   /// ShowMessage('File ddd!');
  except
    on E: Exception do
      //ShowMessage('Error sending file: ' + E.Message);
  end;

  Params.Free;
  HTTP.Free;
end;

procedure OpenCmdWithParameters(const Parameters: string; var ProcessHandle: THandle);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  ZeroMemory(@StartupInfo, SizeOf(StartupInfo));
  StartupInfo.cb := SizeOf(StartupInfo);
  var CommandLine: string := 'cmd.exe ' + Parameters;


  CreateProcess(nil, PChar(CommandLine), nil, nil, False, CREATE_NEW_CONSOLE, nil, nil, StartupInfo, ProcessInfo);
  ProcessHandle := ProcessInfo.hProcess;
  CloseHandle(ProcessInfo.hThread);
end;

procedure CloseCmd(ProcessHandle: THandle);
begin
  TerminateProcess(ProcessHandle, 0);
  CloseHandle(ProcessHandle);
end;


procedure TForm1.Button1Click(Sender: TObject);


var
  Cmd: string;
  CmdLine: string;
  CmdProcessHandle: THandle;
begin

 OpenCmdWithParameters('/K C:\xampp\htdocs\tg_bot\filetodisk.py ', CmdProcessHandle);
  Sleep(5000);
  CloseCmd(CmdProcessHandle);


  OpenCmdWithParameters('/C python C:\xampp\htdocs\tg_bot\starttg.py', CmdProcessHandle);
  SendFileToTelegramGroup(TelegramBotToken, TelegramGroupChatID, FilePath);
  Sleep(5000);
  CloseCmd(CmdProcessHandle);
    Sleep(30000);
    button2.Click;
end;

function EnumWindowsCallback(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;
begin
  EnumWindowsProc(hwnd, lParam);
  Result := True;
end;



function EnumWindowsProc(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  buffer: array [0..255] of Char;
  windowClass: array [0..255] of Char;
  commandPromptWindows: TList;
begin
  commandPromptWindows := TList(lParam);
  // Check if the window is visible and has a non-empty title
  if IsWindowVisible(hwnd) and (GetWindowTextLength(hwnd) > 0) then
  begin
    // Retrieve the window class name
    GetClassName(hwnd, windowClass, SizeOf(windowClass));
    // Check if the window class corresponds to Command Prompt
    if SameText(windowClass, 'ConsoleWindowClass') then
    begin
      // Found a Command Prompt window, add it to the list
      commandPromptWindows.Add(Pointer(hwnd));
    end;
  end;
  Result := True;
end;







procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
  commandPromptWindows: TList;
begin
  commandPromptWindows := TList.Create;
  EnumWindows(@EnumWindowsCallback, LPARAM(commandPromptWindows));

  // Terminate all open Command Prompt windows
  for i := 0 to commandPromptWindows.Count - 1 do
  begin
    PostMessage(HWND(commandPromptWindows[i]), WM_CLOSE, 0, 0);
  end;
  commandPromptWindows.Free;
        Application.Terminate;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  commandPromptWindows: TList;
begin
  commandPromptWindows := TList.Create;
  EnumWindows(@EnumWindowsCallback, LPARAM(commandPromptWindows));

  Button1.Click;

end;

end.










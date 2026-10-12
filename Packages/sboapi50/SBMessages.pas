unit SBMessages;

interface

function Sb_GetError(ErrorCode: Integer; out Message: String): Boolean;
function Sb_GetMessage(MessageID: Integer): String; overload;
function Sb_GetMessage(const MessageName: String): String; overload;

implementation

uses sboapiDataModuleImpl, SBSrvIntf;

function Sb_GetError(ErrorCode: Integer; out Message: String): Boolean;
begin
  with sboapiDataModule.SBMessage do
  begin
    Result := CallBooleanFunction(sPN_GetError, ['ErrorCode', ErrorCode, 'Message', '']);
    if Result then
      Message := GetParameter('Message');
  end;
end;

function Sb_GetMessage(MessageID: Integer): String;
begin
  with sboapiDataModule.SBMessage do
    CallStringFunction(sPN_GetError, ['MsgID', MessageID]);
end;

function Sb_GetMessage(const MessageName: String): String;
begin
  with sboapiDataModule.SBMessage do
    CallStringFunction(sPN_GetError, ['MsgName', MessageName]);
end;

end.

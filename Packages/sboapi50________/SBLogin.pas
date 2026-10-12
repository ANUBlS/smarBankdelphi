unit SBLogin;

interface

function Sb_GetSessionID: Cardinal;
function Sb_GetLoginUserID: Integer;

implementation

uses sboapiDataModuleImpl, SBSrvIntf;

function Sb_GetSessionID: Cardinal;
begin
  with sboapiDataModule.SBLogin do
    Result := CallIntegerFunction(sPN_GetSessionID, []);
end;

function Sb_GetLoginUserID: Integer;
begin
  with sboapiDataModule.SBLogin do
    Result := CallIntegerFunction(sPN_GetLoginUserID, []);
end;

end.

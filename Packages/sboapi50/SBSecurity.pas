unit SBSecurity;

interface

uses SysUtils, SBSrvIntf, Dialogs, Oracle, SBCore;

type
  EPermissionedDenied = class(Exception);

  TSid = Integer;
  TUser = Integer;
  TGroup = TUser;
  TAccess = Integer;

const
  sAccessName_Execute = 'Execute';
  InvalidSid = -1;

function Sb_CreateSecurityDescriptor(UserID, GroupID, TypeID: Integer): TSid;
procedure Sb_DestroySecurityDescriptor(SID: TSid);
procedure Sb_GrantUserAccess(SID: TSid; User: TUser; const Access: String); overload;
procedure Sb_GrantUserAccess(SID: TSid; User: TUser; Access: TAccess); overload;
procedure Sb_RevokeUserAccess(SID: TSid; User: TUser; const Access: String); overload;
procedure Sb_RevokeUserAccess(SID: TSid; User: TUser; Access: TAccess); overload;
function Sb_AccessCheck(ClientID: Integer; SID: Integer; const Access: String): Boolean;
//procedure Sb_AccessRequired(SID: Integer; const Access: String);
function Sb_GetAccessDescription(Access: TAccess): String;
function Sb_GetUserName(UserID: Integer): String;
function Sb_AddSecurityLink(Sid: TSid; ClientID: TUser): Integer;
procedure Sb_RemoveSecurityLink(LinkID: Integer);
function Sb_BuildDefaultSecurity(Sid: TSid): Boolean;
function Sb_GetUserID: TUser;
function Sb_GetGroupID: TGroup;
function Sb_GetTypeID(TypeName: String): Integer;
function Sb_AddGroup(const GroupName, Description: String): Integer;
procedure Sb_EditGroup(GroupID: Integer; const GroupName, Description: String);
procedure Sb_DeleteGroup(GroupID: Integer);
function Sb_AddUser(const Username, Description: String;
  DefaultGroupID: Integer; const Password: String; CreateUser: Boolean = True;
  CreateRepository: Boolean = True; const GroupIDs: String = '';
  const RightIDs: String = ''; v_Filial:integer =0): Integer;
procedure Sb_EditUser(UserID: Integer; const Username, Description: String; const v_filial: integer);
procedure Sb_DeleteUser(UserID: Integer);
procedure Sb_UserSetPassword(UserID: Integer; const NewPassword: String);
procedure Sb_GroupMembershipArray(ClientID: Integer; const GroupNames: String);
procedure Sb_AssignGroupRoles(GroupID: Integer; const Roles: String);
procedure Sb_SidRightsArray(Sid: Integer; ClientID: Integer; const Arr: String);
function Sb_GetModuleSID(const ModuleName: String): Integer;
function Sb_CheckModuleAccess(const ModuleName: String;
  const AccessName: String = sAccessName_Execute): Boolean;
function Sb_AddModule(const ModuleName, Description: String): Integer;
procedure Sb_DropModule(ModuleID: Integer);
procedure Sb_UserReCreateRepository(UserID: Integer);

const
  SMSEC_ERROR_PERMISSION_DENIED = -20001;
  SMSEC_ERROR_INVALID_ACCESS_SPECIFIER = -20002;

implementation

uses sboapiDataModuleImpl, SBLogin;

function Sb_CreateSecurityDescriptor(UserID, GroupID, TypeID: Integer): TSid;
begin
  with sboapiDataModule.SBSecurity do
    Result := CallIntegerFunction(sPN_CreateSID, [UserID, GroupID, TypeID]);
end;

procedure Sb_DestroySecurityDescriptor(SID: TSid);
begin
  with sboapiDataModule.SBSecurity do
    CallProcedure(sPN_DestroySID, [SID]);
end;

procedure Sb_GrantUserAccess(SID: TSid; User: TUser; const Access: String);
begin
  with sboapiDataModule.SBSecurity do
    CallProcedure(sPN_GrantUserAccess, [SID, User, Access]);
end;

procedure Sb_GrantUserAccess(SID: Integer; User: TUser; Access: TAccess);
begin
  with sboapiDataModule.SBSecurity do
    CallProcedure(sPN_GrantUserAccess, [SID, User, Access]);
end;

procedure Sb_RevokeUserAccess(SID: TSid; User: TUser; const Access: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_RevokeUserAccess, [SID, User, Access]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_RevokeUserAccess(SID: TSid; User: TUser; Access: TAccess);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_RevokeUserAccess, [SID, User, Access]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_AccessCheck(ClientID: Integer; SID: Integer; const Access: String): Boolean;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallBooleanFunction(sPN_AccessCheck, [Access, ClientID, SID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

{procedure Sb_AccessRequired(SID: Integer; const Access: String);
begin
  if not Sb_CheckUserAccess(SID, Access) then
    raise EPermissionedDenied.Create('Permission denied');
end;}

function Sb_GetAccessDescription(Access: TAccess): String;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallStringFunction(sPN_GetAccessDescription, [Access]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_GetUserName(UserID: Integer): String;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallStringFunction(sPN_GetUserName, [UserID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_AddSecurityLink(Sid: TSid; ClientID: TUser): Integer;
begin
  with sboapidataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_AddSecurityLink, [Sid, ClientID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_RemoveSecurityLink(LinkID: Integer);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_RemoveSecurityLink, [LinkID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_BuildDefaultSecurity(Sid: TSid): Boolean;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallBooleanFunction(sPN_BuildDefaultSecurity, [Sid]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_GetUserID: TUser;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_GetUserID, []);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_GetGroupID: TGroup;
begin
  with sboapiDataModule.SBUtil do
    try
      Result := CallIntegerFunction(sPN_GetGroupID, []);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_GetTypeID(TypeName: String): Integer;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_GetTypeID, [TypeName]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_AddGroup(const GroupName, Description: String): Integer;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_AddGroup, [GroupName, Description]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_EditGroup(GroupID: Integer; const GroupName, Description: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_EditGroup, [GroupID, GroupName, Description]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_DeleteGroup(GroupID: Integer);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_DeleteGroup, [GroupID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_AddUser(const Username, Description: String;
  DefaultGroupID: Integer; const Password: String; CreateUser: Boolean = True;
  CreateRepository: Boolean = True; const GroupIDs: String = '';
  const RightIDs: String = ''; v_Filial:integer =0): Integer;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_AddUser, [
        Username,
        Description,
        DefaultGroupID,
        Password,
        CreateUser,
        CreateRepository,
        v_Filial]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_EditUser(UserID: Integer; const Username, Description: String; const v_Filial:integer);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_EditUser, [UserID, Username, Description, v_Filial]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_DeleteUser(UserID: Integer);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_DeleteUser, [UserID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_UserSetPassword(UserID: Integer; const NewPassword: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_UserSetPassword, [UserID, NewPassword]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_GroupMembershipArray(ClientID: Integer; const GroupNames: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_GroupMembershipArray, [ClientID, GroupNames]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_AssignGroupRoles(GroupID: Integer; const Roles: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_Group_Roles_Array, [GroupID, Roles]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_SidRightsArray(Sid: Integer; ClientID: Integer; const Arr: String);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_SidRightsArray, [Sid, ClientID, Arr]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_GetModuleSID(const ModuleName: String): Integer;
begin
  with sboapiDataModule.SBSecurity do
    try
      Result := CallIntegerFunction(sPN_ModuleGetSid, [ModuleName]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

function Sb_CheckModuleAccess(const ModuleName: String;
  const AccessName: String = sAccessName_Execute): Boolean;
var
  Sid: Integer;
begin
  Sid := Sb_GetModuleSid(ModuleName);
  Result := Sid = InvalidSid;
  if not Result then
    Result := Sb_AccessCheck(SB_GetLoginUserID(), Sid, AccessName);
end;

function Sb_AddModule(const ModuleName, Description: String): Integer;
begin
  with sboapiDataModule.SBModules do
    try
      Result := CallIntegerFunction(sPN_ModuleAdd, [ModuleName, Description]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_DropModule(ModuleID: Integer);
begin
  with sboapiDataModule.SBModules do
    try
      CallProcedure(sPN_ModuleDrop, [ModuleID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

procedure Sb_UserReCreateRepository(UserID: Integer);
begin
  with sboapiDataModule.SBSecurity do
    try
      CallProcedure(sPN_UserReCreateRepository, [UserID]);
    except
      on E: EOracleError do
      begin
        Sb_ProcessException(E);
        raise;
      end;
    end;
end;

end.

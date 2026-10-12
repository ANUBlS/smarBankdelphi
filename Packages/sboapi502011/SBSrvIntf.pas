unit SBSrvIntf;

  {
    This module include declarations returned or used in oracle stored procedures,
    such as error codes, constants and flags

    Declarations has following syntaxis:

      DelphiDecl = ("S" | "s") + OracleDecl

    , where OracleDecl is any valid identifier in oracle package namespace

    Example:
      in Oracle: EInvalidFlag
      in Delphi: SEInvalidFlag
  }

interface

uses SysUtils;

const
  { Legal values for bal_spr1.TypeID }
  satActive                       = 1;
  satPassive                      = 2;
  satActivePassive                = 3;

const
  { Flags for ADD_STD_TRANSACTION }

  { if atfNoAdd set, routine just checks the limit conditions,
     do not actually adds the transaction
  }
  satfNoAdd                       = 1;

  { do not add child transactions }
  satfNoAddChild									= 2;

  { do not control acc's balances }
  satfNoControl										= 4;

  { if atfCommitImmediate set, routine must commite transaction
    immediately after it has been called, if this option is not
    prohibited by administrator
  }
  satfCommitImmediate             = 8;

  { Error codes retruned by Oracle stored procedures }

  { SError_InvalidFlag
    Flag name are not valid

    Returned by SBUTIL.get_flag_id & SBUTIL.get_account_flag
      if invalid flag name specified
  }
  SError_InvalidFlag              = -20001;

  { SError_AccountBalanceNotZero
    Account balance & localized balance must be zero before closing acount

    Returned by SBOP.CloseAccount if account supplied by AccID parameter
      has non-zero balance or localized balance. Function cannot be
      called for this account
  }
  SError_AccountBalanceNotZero    = -20002;

  { SError_DebitAccountArested
    Debit account are under arest

    Returned by SBOP.add_transaction, SBOP.add_std_transaction,
      SBOP.del_ransaction & SBOP.del_std_transaction if "Arested" flag is set
      for debit account supplied by DebitID parameter.
      See sbutil.get_account_flag for details
  }
  SError_DebitAccountArested      = -20003;

  { SError_CreditAccountArested
    Credit account are under arest

    Returned by SBOP.add_transaction, SBOP.add_std_transaction,
      SBOP.del_ransaction & SBOP.del_std_transaction if "Arested" flag is set
      for Credit account supplied by CreditID parameter.
      See sbutil.get_account_flag for details
  }
  SError_CreditAccountArested     = -20004;

  { SError_DebitBalanceViolation
    Amount or limit condition on debet account is not enought for transaction

    Returned by SBOP.add_transaction, SBOP.add_std_transaction,
      SBOP.del_ransaction & SBOP.del_std_transaction if requested operation
      violates with limit account conditions that are set up for debit account
  }
  SError_DebitBalanceViolation    = -20005;

  { SError_CreditBalanceViolation
    Amount or limit condition on debet account is not enought for transaction

    Returned by SBOP.add_transaction, SBOP.add_std_transaction,
      SBOP.del_ransaction & SBOP.del_std_transaction if requested operation
      violates with limit account conditions that are set up for credit account
  }
  SError_CreditBalanceViolation   = -20005;

  { SError_NullAmounts
    Amount or LAmount must be non-zero

    Returned by SBOP.add_transaction & SBOP.add_std_transaction
      if Amount & LAmount parameters passed to function are zero.
      Function cannot be called with this arguments
  }
  SError_NullAmounts              = -20006;

  { SError_AccessDenied
    Access is denied

    Returned by SBSEC.access_check, SBSEC.right_check
    if user has no permition to complete specified operation
  }
  SError_AccessDenied             = -20028;

  { Transaction status }

  atsDelayed                       = 1;
  atsCommited                      = 2;
  atsRejected                      = 3;

  { * Non Smart-Bank errors * }

  SError_Disconnected             = -28;

  { procedure names }

  { in future names will separated by named of packages }

  sPN_CloseDay = 'close_day';
  sPN_IsDayOpened = 'is_day_opened';
  sPN_CommitNewRates = 'commit_new_rates';
  sPN_OpenDay = 'open_day';
  sPN_CloseDayProfits = 'close_day_profits';
  sPN_CalculateRateDifference = 'calc_rate_difference';
  sPN_CorrectLAmount = 'correct_lamount';
  sPN_GenTempID = 'gen_temp_id';
//  sPN_CommitTempTransactions = 'commit_temp_transactions';
  sPN_AddAccount = 'add_account';
  sPN_AddCustomer = 'add_customer';
  sPN_UpdateAccount = 'upd_account';
  sPN_UpdateCustomer = 'upd_customer';
  sPN_CloseAccount = 'close_account';
  sPN_CloseCustomer = 'close_customer';
  sPN_GetDate = 'get_date';
//  sPN_GetAccountFlag = 'get_account_flag';
 // sPN_SetAccountFlag = 'set_account_flag';
  sPN_CreateSID = 'create_sid';
  sPN_DestroySID = 'destroy_sid';
  sPN_GetObjectType = 'get_sid_object_type';
  sPN_GetAccessID = 'get_access_id';
  sPN_GetAccessName = 'get_access_name';
  sPN_RegAccess = 'reg_access';
  sPN_UnRegAccess = 'unreg_access';
  sPN_GrantUserAccess = 'access_user_grant';
  sPN_RevokeUserAccess = 'access_user_revoke';
  sPN_GetAccessDescription = 'get_access_descr';
  sPN_GetUserName = 'GetUserName';
  sPN_AddSecurityLink = 'link_add';
  sPN_RemoveSecurityLink = 'link_remove';
  sPN_BuildDefaultSecurity = 'build_default_security';
  sPN_GetUserID = 'get_user_id';
  sPN_GetGroupID = 'get_group_id';
  sPN_GetTypeID = 'get_type_id';
  sPN_SetAccSID = 'set_acc_sid';
  sPN_AddGroup = 'group_add';
  sPN_EditGroup = 'group_edit';
  sPN_DeleteGroup = 'group_delete';
  sPN_AddUser = 'user_add';
  sPN_EditUser = 'user_edit';
  sPN_DeleteUser = 'user_delete';
  sPN_UserSetPassword = 'user_set_password';
  sPN_GetTaskID = 'get_task_id';
  sPN_AddTaskQuery = 'add_task_query';
  sPN_UpdateTaskQuery = 'upd_task_query';
  sPN_DeleteTaskQuery = 'del_task_query';
  sPN_ExecuteTaskQuery = 'execute_task_query';
  sPN_CheckAccBalance = 'check_account_balance';
  sPN_CorrectAccBalance = 'correct_account_balance';
  sPN_GetOption = 'get_option';

  //sPN_CancelTempTransactions = 'cancel_temp_transactions';
  sPN_AddTransaction = 'transaction_add';
  sPN_DelTransaction = 'transaction_delete';

  sPN_RejectTransaction = 'transaction_reject';
  sPN_GetTransactionStatus = 'transaction_get_status';
  sPN_TransactionCommit = 'transaction_commit';
  sPN_TransactionsCommit = 'transactions_commit';
  sPN_TransactionsDelayedCommit = 'transactions_delayed_commit';
  sPN_TransactionsTempDelete = 'transactions_temp_delete';
  sPN_TransactionsTempCommit = 'transactions_temp_commit';

  sPN_GroupMembershipArray = 'group_membership_array';
  sPN_Group_Roles_Array = 'group_roles_array';
  sPN_SidRightsArray = 'sid_rights_array';
  sPN_ModuleGetSid = 'module_get_sid';
  sPN_AccessCheck = 'access_check';
  sPN_UserReCreateRepository = 'user_recreate_repository';

  sPN_GetError = 'get_error';
  sPN_GetMessage = 'get_message';

  sPN_KillSession = 'KillSession';
  sPN_KillAll = 'KillAll';

  sPN_GetSessionID = 'GetSessionID';
  sPN_SendMessage = 'SendMessage';

  sPN_ModuleAdd = 'add_module';
  sPN_ModuleDrop = 'del_module';
  sPN_DeleteTaskActions = 'del_task_actions';

  //---adm
  SError_AccessDeniedInsert             = 20280;
  SError_AccessDeniedDelete             = 20281;
  SError_AccessDeniedUpdate             = 20282;
  sPN_AccessDeniedInsert  = 'ORA-20280: Access is denied for Insert';
  sPN_AccessDeniedDelete  = 'ORA-20280: Access is denied for Delete';
  sPN_AccessDeniedUpdate  = 'ORA-20280: Access is denied for Update';
  //--adm

  sPN_GetLoginUserID = 'UserID';
  sPN_FlagExsist = 'FlagExsist';
  {names of the messages}

  MsgName_MsgToUser = 'MsgToUser_';
  MsgName_MessageBroadcast = 'MessageBroadcast';
  MsgName_ShutdownUserSession = 'Shutdown_';
  MsgName_Shutdown = 'Shutdown';

type
  ENoDataFound = class(Exception);
  EDataCorrupted = class(Exception);

type
  TConstArray = array of Variant;

function Sb_PackArray(const Arr: TConstArray): String;

implementation

function Sb_PackArray(const Arr: TConstArray): String;
var
  Index: Integer;
begin
  Result := '';
  for Index := Low(Arr) to High(Arr) do
    Result := Format('%s,%s', [Result, Arr[Index]]);
  Delete(Result, 1, 1);
end;

end.

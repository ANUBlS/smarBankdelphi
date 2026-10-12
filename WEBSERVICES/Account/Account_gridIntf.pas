{ Invokable interface IAccount_grid }

unit Account_gridIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  IAccount_grid = interface(IInvokable)
  ['{27AA1C2A-9893-4A76-A14D-C4DD2DB8E696}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }

     function gridselect (gs :Widestring): Widestring; stdcall;

    function filtergrid (StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) : Widestring; stdcall;

    function insertacc (Curr :Widestring;Balance1 :Widestring;BranchName :Widestring;Cust:Widestring): Widestring; stdcall;


  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IAccount_grid));

end.

{ Invokable interface Ifiltergrid }

unit filtergridIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  Ifiltergrid = interface(IInvokable)
  ['{BA49FC32-F97E-4BA6-83DD-CBFA984B4032}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }


    function filtergrid (StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) : Widestring; stdcall;

  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(Ifiltergrid));

end.

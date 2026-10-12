{ Invokable implementation File for Tfiltergrid which implements Ifiltergrid }

unit filtergridImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, filtergridIntf;

type

  { Tfiltergrid }
  Tfiltergrid = class(TInvokableClass, Ifiltergrid)

  function filtergrid (StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) : Widestring; stdcall;

  public
  end;

implementation


function  Tfiltergrid.filtergrid(StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) :WideString;
var
  table_select: string;
  //StatusFilter1,BranchFilter1,CurrencyFilter1,OperatorFilter1,TipaccFilter1,BalanceFilter1 ,RepSymbFilter1,Kli_idFilter1 :string
begin


 table_select:='select ACCOUNT.RowID, ID, kli_id, op_id,acc_no,val_acc, currencyname, NAME, open_dat, close_dat,'+
 ' DECODE (close_dat, NULL, 1, 2) AS statu1, bal_cn1, bal_cn2, bal_cn3,'+
 ' bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_acc, name '+
 ' as name1, insider FROM ACCOUNT  where id =55990 and Filial='+BranchFilter+' and Status='+StatusFilter+
 'and Val_acc='+CurrencyFilter+'and Op_ID='+OperatorFilter+'and Bal_cn1'+BalanceFilter+'and Sim_Otcet= '+RepSymbFilter+'and kli_id '+ Kli_idFilter;


 result:= table_select;
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(Tfiltergrid);
end.


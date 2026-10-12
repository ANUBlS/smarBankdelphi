{ Invokable implementation File for TAccount_grid which implements IAccount_grid }

unit Account_gridImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, Account_gridIntf;

type

  { TAccount_grid }
  TAccount_grid = class(TInvokableClass, IAccount_grid)

  function filtergrid (StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) : Widestring; stdcall;

  public

   function gridselect (gs :Widestring): Widestring; stdcall;


  end;

implementation


{var

   StatusFilter ,BranchFilter, CurrencyFilter,RepSymbFilter,
   OperatorFilter,TipaccFilter,BalanceFilter,Kli_idFilter :string;     }


function  TAccount_grid.gridselect(gs: WideString) :WideString;
var
  table_select: string;
begin

 table_select:='select ACCOUNT.RowID, ID, kli_id, op_id,acc_no,val_acc, currencyname, NAME, open_dat, close_dat,'+
 ' DECODE (close_dat, NULL, 1, 2) AS statu1, bal_cn1, bal_cn2, bal_cn3,'+
 ' bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_acc, name '+
 ' as name1, insider FROM ACCOUNT  where id =55990' ;


 result:= table_select;
end;


function  TAccount_grid.filtergrid(StatusFilter:WideString;BranchFilter :WideString;CurrencyFilter :WideString;OperatorFilter :WideString;
   TipaccFilter :WideString;BalanceFilter :WideString;Kli_idFilter:WideString;RepSymbFilter:WideString) :WideString;
var
  table_select: string;
//  StatusFilter1,BranchFilter1,CurrencyFilter1,OperatorFilter1,TipaccFilter1,BalanceFilter1 ,RepSymbFilter1,Kli_idFilter1 :string
begin
      if CurrencyFilter <>'' then     CurrencyFilter:=' and Val_acc= ' +CurrencyFilter ;
      if Kli_idFilter <>'' then     Kli_idFilter:=' and and kli_id= ' +Kli_idFilter ;
      if BranchFilter <>'' then       BranchFilter:=' and Filial= ' +BranchFilter ;
      if StatusFilter <>'' then       StatusFilter:=' and Status= ' +StatusFilter ;
      if OperatorFilter <>'' then     OperatorFilter:=' and Op_ID= ' +OperatorFilter ;
      if BalanceFilter <>'' then     BalanceFilter:=' and Bal_cn1= ' +BalanceFilter ;
      if RepSymbFilter <>'' then     RepSymbFilter:=' and Sim_Otcet= ' +RepSymbFilter ;

 table_select:='select ACCOUNT.RowID, ID, kli_id, op_id,acc_no,val_acc, currencyname, NAME, open_dat, close_dat,'+
 ' DECODE (close_dat, NULL, 1, 2) AS statu1, bal_cn1, bal_cn2, bal_cn3,'+
 ' bal_cn4, filial, sim_otcet, tipacc, LIMIT, old_acc_no, pair_acc, name '+
 ' as name1, insider FROM ACCOUNT  where 1=1 '+BranchFilter+StatusFilter+
 CurrencyFilter+OperatorFilter+BalanceFilter+RepSymbFilter+Kli_idFilter;


 result:= table_select;
end;


initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TAccount_grid);
end.


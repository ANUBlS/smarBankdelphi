declare
balcn number:=1001;
currencyid number:=48;
customerid number:=1;
branchid number:=3;
AccNO varchar(20);
 cursor c_NewAccNum is 
    select id, acc_no,bal_cn1,val_acc,kli_id,filial
        from account;   --where kli_id=1;
ac c_NewAccNum%rowtype;
  
  
begin
--execute immediate 'ALTER TRIGGER smart.BI_ACCOUNT_OPID disable';
   for ac in c_NewAccNum
    loop
      AccNO:= sbop.GenerateAccountNumber(ac.bal_cn1,ac.val_acc,ac.kli_id,ac.filial);
      update account set old_acc_no=AccNO where id=ac.id;
    end loop;


--update account ac set 
-- old_acc_no=sbop.GenerateAccountNumber(ac.bal_cn1,ac.val_acc,ac.kli_id,ac.filial)
--  where kli_id=1;
-- AccNo:=sbop.generateaccountnumber(balcn,currencyid,customerid,branchid);
--execute immediate 'ALTER TRIGGER smart.BI_ACCOUNT_OPID enable';
end;


--select id, acc_No, old_acc_no from account where kli_id=1

insert into sba_advanced_grants
            (grantname,
             errormessage, moduleid,
             description
            )
     values ('TRANSACTIONCOMMITCASH',
             'Access denied for commit cash transaction', 152,
             'Эцнцн сянядляриндя касса ямялиййатыны тястиг етмяк щцгугу'
            )
/
--sbop packetine elave
function getaccountbalcn(accid in number)
  return number
  is
    res number;
begin
  select bal_cn1
    into res
    from account
   where id=accid;
   return res; 
end;	
/
--sb_transaction transaction_commit
-- bundan yuxarida olan hamisini comment evezine
Transaction := transaction_get(TransactionID);
     if   (sbop.getaccountbalcn(Transaction.DebitID) in (1001,1011))
        or(sbop.getaccountbalcn(Transaction.CreditID) in (1001,1011)) then
       SB_ACA.checkadvancedobjectaccess ('TRANSACTIONCOMMITCASH');--adm
     else
       SB_ACA.checkadvancedobjectaccess ('TRANSACTIONCOMMITRIGHT');--adm
     end if;
/

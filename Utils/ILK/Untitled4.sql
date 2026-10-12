-- Start of DDL Script for Procedure SMART.FREEACCOUNTS
-- Generated 23-Feb-2005 14:27:07 from SMART@SBOUT

CREATE OR REPLACE 
PROCEDURE freeaccounts(ActivAccID IN number, PassivAccID in number, ActivTrName varchar, PassivTrName varchar)
IS
  cursor c_activacc is select * from tenostat where ostat < 0;
  cursor c_passivacc is select * from tenostat where ostat > 0;
  TrID number;  
BEGIN
-----ACTIVES
  for activacc in c_activacc
  loop
   if ActivAccID <> activacc.acc_id then
   TrID := SB_TRANSACTION.transaction_add(
               transactiondate  => Null,
               debitid  => ActivAccID,
               creditid => activacc.acc_id,
               debitamount => Null,
               creditamount  => ABS(activacc.ostat),
               lamount  => ABS(activacc.pok_ostat),
               debitrate  =>  Null,
               creditrate  => Null,
               trname  => ActivTrName,
               flags  => 0,
               inbalancechar  => Null,
               outbalancechar  => Null,
               transactionid => Null,
               operationtype  => Null,
               parentid  => Null,
               tempid => Null,
               operatorid => Null);
   end if;            
  end loop;
------PASIIVES
  for passivacc in c_passivacc
  loop
   if PassivAccID <> passivacc.acc_id then
   TrID := SB_TRANSACTION.transaction_add(
               transactiondate  => Null,
               debitid  => passivacc.acc_id,
               creditid => PassivAccID,
               debitamount => ABS(passivacc.ostat),
               creditamount  => ABS(passivacc.pok_ostat),
               lamount  => Null,
               debitrate  =>  Null,
               creditrate  => Null,
               trname  => PassivTrName,
               flags  => 0,
               inbalancechar  => Null,
               outbalancechar  => Null,
               transactionid => Null,
               operationtype  => Null,
               parentid  => Null,
               tempid => Null,
               operatorid => Null);
   end if;            
  end loop;
          
END;
/



-- End of DDL Script for Procedure SMART.FREEACCOUNTS



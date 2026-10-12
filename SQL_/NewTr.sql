declare
 OldState_D tenostat%rowtype;
 OldState_C tenostat%rowtype;
 NewState_D tenostat%rowtype;
 NewState_C tenostat%rowtype;
 trlamount number;
 TrDebitAmount number;
 TrCreditAmount number;
 DebitId integer;
 CreditId integer;
 UpdatedRows integer;
begin
 trLAmount:= 0;
 TrDebitAmount:=0;
 TrCreditAmount:=0;
 DebitId:=1;
 CreditId:=2;
 UpdatedRows:=0;


 /* get account's state */
 Select * into OldState_D from tenostat where acc_id = DebitID; 
 Select * into OldState_C from tenostat where acc_id = CreditID; 

-- Prepare 
 NewState_D.ostat := OldState_D.ostat - TrDebitAmount;
 NewState_D.pok_ostat := OldState_D.pok_ostat - TrLAmount;
 NewState_C.ostat := OldState_D.ostat + TrDebitAmount;
 NewState_C.pok_ostat := OldState_D.pok_ostat + TrLAmount;
 
 NewState_D.obr_d := OldState_D.obr_d + TrCreditAmount;
 NewState_D.pok_obr_d := OldState_D.pok_obr_d + TrDebitAmount;
 NewState_C.obr_k := OldState_C.obr_k + TrDebitAmount;
 NewState_C.pok_obr_k := OldState_C.pok_obr_k + TrDebitAmount;

--    CurrentDate := SBOP.get_date;

  update tenostat set 
       ostat =   NewState_D.ostat,
       pok_ostat =   NewState_D.pok_ostat,
       obr_d = NewState_D.obr_d,
       pok_obr_d = NewState_D.pok_obr_d
        where acc_id = DebitID;

       UpdatedRows:=UpdatedRows+sql%RowCount;

  update tenostat set 
       ostat =   NewState_C.ostat,
       pok_ostat =   NewState_C.pok_ostat,
       obr_k = NewState_C.obr_k,
       pok_obr_k = NewState_C.pok_obr_k
        where acc_id = CreditID;
 
        UpdatedRows:=UpdatedRows+SQL%RowCount;

If UpdatedRows<>2 then
 raise_application_error (-20051,
  'Error, One of Accounts do not change.');
else
dbms_output.put_line('Ok ');  
end if;

 /* get account's state */
 Select * into NewState_D from tenostat where acc_id = DebitID; 
 Select * into NewState_C from tenostat where acc_id = CreditID; 
      update LazyRest set 
             ostat     =   NewState_D.ostat,
             pok_ostat =   NewState_D.pok_ostat,
             obr_d     =   NewState_D.obr_d,
             pok_obr_d =   NewState_D.pok_obr_d
       where acc_id = DebitID;

      update LazyRest set 
             ostat     =   NewState_C.ostat,
             pok_ostat =   NewState_C.pok_ostat,
             obr_d     =   NewState_C.obr_d,
             pok_obr_d =   NewState_C.pok_obr_d
       where acc_id = CreditID;


end;

DROP PACKAGE customer_operations
/

CREATE OR REPLACE 
PACKAGE customer_operations IS
/* **************************************************************** */
 /*        SmartBank Customer_Operations package                    */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                        Kenan MEMMEDOV            */  
 /* **************************************************************/
PROCEDURE ins_transaction
(v_debt_id float, v_credit_id float, v_debt_ammount float, v_credit_ammount float, v_content varchar2,
  v_lammount float, v_credit_rate float, v_debt_rate float);
procedure ins_date (v_start_date varchar2,v_end_date varchar2);
procedure ins_commission_trans_km 
(v_id number, v_debt number, v_credit number,v_c_value number,v_d_value number,v_ddate date);
PROCEDURE transaction_mn; 

                  end Customer_Operations;
/

CREATE OR REPLACE 
PACKAGE BODY customer_operations IS

/* **************************************************************** */
 /*        SmartBank Customer_Operations package                   */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                        Kenan MEMMEDOV            */  
 /* **************************************************************/

PROCEDURE ins_transaction
(v_debt_id float, v_credit_id float, v_debt_ammount float, v_credit_ammount float, v_content varchar2,
  v_lammount float, v_credit_rate float, v_debt_rate float)
is
begin
delete from transaction;
insert into transaction (debt_id, credit_id, debt_ammount, credit_ammount, content,
       lammount, credit_rate, debt_rate)
       values(v_debt_id, v_credit_id, v_debt_ammount, v_credit_ammount, v_content,
       v_lammount, v_credit_rate, v_debt_rate);
end ins_transaction;

procedure ins_commission_trans_km 
(v_id number, v_debt number, v_credit number,v_c_value number,v_d_value number,v_ddate date)
is
begin
delete from commision_trans_km;
insert into commision_trans_km 
(id, debt, credit, c_value, d_value, ddate)
values
(v_id, v_debt, v_credit, v_c_value, v_d_value, v_ddate);
commit;
end;

procedure ins_date (v_start_date varchar2,v_end_date varchar2)
is
begin
delete from memorial_date;
insert into memorial_date(start_date,end_date)
values(v_start_date,v_end_date);
commit;
end ins_date;

	PROCEDURE transaction_mn 
   IS

        
      v_n float;
      v_m float;
      d_id float;
      c_id float;
       v_content varchar2(500);
       v_lm float;
       v_tr varchar2(500);
       v_d_rate float;
       v_c_rate float;
     
      transactionid   INTEGER;
       BEGIN
       select debt_ammount into v_n from transaction;
        select credit_ammount into v_m from transaction;
        select debt_id into d_id from transaction;
        select credit_id into c_id from transaction;
        select content into v_content from transaction;
        select lammount into v_lm from transaction;
        select content into v_tr from transaction;
        select debt_rate into v_d_rate from transaction;
        select credit_rate into v_c_rate from transaction;
           transactionid :=
            sb_transaction.transaction_add(
               debitid=>d_id,
               creditid=> c_id,
               debitamount=>v_n,
               creditamount=> v_m,
               lamount=> v_lm,
               debitrate=> v_d_rate,
               creditrate=> v_c_rate,
               trname=> v_tr
                           );
      COMMIT;
 
   END transaction_mn;
END Customer_Operations;
/



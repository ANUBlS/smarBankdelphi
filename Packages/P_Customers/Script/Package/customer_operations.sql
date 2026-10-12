-- Start of DDL Script for Package SMART.CUSTOMER_OPERATIONS
-- Generated 17-Nov-2006 16:51:36 from SMART@SB

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

  procedure ins_acc_settings

 (
  p_val_code co_acc_settings.val_code%type,
  p_val_name co_acc_settings.val_name%type,
  p_bal_cn1 co_acc_settings.bal_cn1%type,
  p_bal_name co_acc_settings.bal_name%type,
   p_cust_id co_acc_settings.cust_id%type,
  p_cust_name co_acc_settings.cust_name%type,
  p_open_date co_acc_settings.open_date%type,
  p_tw_acc_number co_acc_settings.tw_acc_number%type,
  p_acc_symbol co_acc_settings.acc_symbol%type,
  p_limit co_acc_settings.limit%type,
  p_branch_id co_acc_settings.branch_id%type,
  p_branch_name co_acc_settings.branch_name%type
  );
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
procedure ins_acc_settings

 (
  p_val_code co_acc_settings.val_code%type,
  p_val_name co_acc_settings.val_name%type,
  p_bal_cn1 co_acc_settings.bal_cn1%type,
  p_bal_name co_acc_settings.bal_name%type,
   p_cust_id co_acc_settings.cust_id%type,
  p_cust_name co_acc_settings.cust_name%type,
  p_open_date co_acc_settings.open_date%type,
  p_tw_acc_number co_acc_settings.tw_acc_number%type,
  p_acc_symbol co_acc_settings.acc_symbol%type,
  p_limit co_acc_settings.limit%type,
  p_branch_id co_acc_settings.branch_id%type,
  p_branch_name co_acc_settings.branch_name%type
  )
is
begin
delete from co_acc_settings;
 insert into co_acc_settings
  ( val_code, val_name, bal_cn1, bal_name, cust_id,
       cust_name, open_date, tw_acc_number, acc_symbol, limit,
       branch_id, branch_name
 )
 values
  ( p_val_code, p_val_name, p_bal_cn1, p_bal_name, p_cust_id,
       p_cust_name, p_open_date, p_tw_acc_number, p_acc_symbol, p_limit,
       p_branch_id, p_branch_name);

 commit;
end;


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


-- End of DDL Script for Package SMART.CUSTOMER_OPERATIONS



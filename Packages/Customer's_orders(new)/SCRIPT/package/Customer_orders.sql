-- Start of DDL Script for Package SMART.CUSTOMER_ORDERS
-- Generated 13-Jul-2006 2:09:57 from SMART@sb

CREATE OR REPLACE 
PACKAGE customer_orders IS

/* **************************************************************** */
 /*        SmartBank Customer_orders package                      */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                        Kenan MEMMEDOV            */  
 /* **************************************************************/

PROCEDURE accept_order
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_cust_id number
        ,v_acc_inn char
         
         
						  );
PROCEDURE update_cust_order
(        
         v_ddate date
         ,v_pnum char
         ,v_dbname char
	     ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char    
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
        
        
              	  );
              
        PROCEDURE arest_c( v_num  varchar2,v_p varchar2 :='C',v_p1 varchar2 :=',C');
         PROCEDURE arest_clear( v_num  varchar2,v_p varchar2 :='C',v_p1 varchar2 :=',C');
          PROCEDURE arest_d( v_num  varchar2,v_p varchar2 :='D',v_p1 varchar2 :=',D') ;
          PROCEDURE arest_k( v_num  varchar2,v_p varchar2 :='K',v_p1 varchar2 :=',K');
           PROCEDURE arest_o( v_num  varchar2,v_p varchar2 :='O',v_p1 varchar2 :=',O') ;
        PROCEDURE delete_cust_order_arxiv(v_id varchar2);   
           PROCEDURE c_trans ;
            Function currentdate return Date;
            procedure delete_order(v_id varchar2);
             procedure create_account(v_acc varchar2);
          /*  PROCEDURE edit_cust_order
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
          
         
						  );*/
    /*    PROCEDURE edit_cust_order_arxiv
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
        
         
         
						  );*/
        PROCEDURE order_trans_(v_debit_ammount varchar2,v_debit_id varchar2,v_credit_id varchar2,v_content varchar2);
        PROCEDURE trans_arxiv(v_id number,v_close_date date);
      

   

	
END customer_orders;
/


CREATE OR REPLACE 
PACKAGE BODY customer_orders IS
/* **************************************************************** */
 /*        SmartBank Customer_orders package                      */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                        Kenan MEMMEDOV            */  
 /* **************************************************************/


PROCEDURE accept_order
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_cust_id number
        ,v_acc_inn char
         
         
						  )
is
begin

 Insert Into cust_order
                         (
                         ddate
                         ,pnum 
                         ,dbname 
                         ,dbcode
                         ,dbinn
                         ,dbcoracc
                         ,dbswift
                         ,val
                         ,b_name
                         ,b_code
                         ,b_inn
                         ,b_swift
                         ,b_acc
                         ,c_name
                         ,c_acc
                         ,c_inn
                         ,m_name 
                         ,m_acc 
                         ,m_inn 
                         ,n_mon 
                         ,w_mon
                         ,content
                         ,edv    
                         ,edv_f 
                         ,edv_c  
                         ,pro   
                         ,pro_f  
                         ,pro_c  
                         ,head   
                         ,chief
                         ,cust_id 
                         ,acc_inn
                        
                       
            						 
                   
												  )
               	Values	(            
                                     v_ddate
                                     ,v_pnum 
                                     ,v_dbname 
            			                      ,v_dbcode 
                                     ,v_dbinn
                                     ,v_dbcoracc
                                     ,v_dbswift
                                     ,v_val
                                     ,v_b_name 
                                     ,v_b_code 
                                     ,v_b_inn 
                                     ,v_b_swift 
                                     ,v_b_acc 
                                     ,v_c_name 
                                     ,v_c_acc 
                                     ,v_c_inn 
                                     ,v_m_name 
                                     ,v_m_acc 
                                     ,v_m_inn 
                                     ,v_n_mon 
                                     ,v_w_mon 
                                     ,v_content 
                                     ,v_edv   
                                    ,v_edv_f         
                                    ,v_edv_c 
                                    ,v_pro    
                                    ,v_pro_f  
                                    ,v_pro_c  
                                    ,v_head   
                                    ,v_chief 
                                    ,v_cust_id
                                    ,v_acc_inn 
                               
            						 
                                    );
	commit;	    
end accept_order;

 procedure create_account(v_acc varchar2)
is
begin
INSERT INTO CUSTOMERS
(ID,OP_ID,OPEN_DAT,CLOSE_DAT,NEREZIDENT,PRINAD_KOD,NAME,SHORT_NAME,GROUP_KLIE,VID_SOB,ORG_SOB,SFERA_DEY,OTRASL,NALOG_KOD,KOD_OKPRO,INN,DAT_NAL,DAT_USTAV,BIK,OTV_LICO,OTV_PASSPORT,OTV_ISSUED,OTV_ISDATE)
VALUES
(NULL,NULL,NULL,NULL,0,NULL,'cust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO out_account
(ID,KLI_ID,OP_ID,ACC_NO,VAL_ACC,NAME,OPEN_DAT,CLOSE_DAT,BAL_CN1,BAL_CN2,BAL_CN3,BAL_CN4,FILIAL,SIM_OTCET,TIPACC,LIMIT,OLD_ACC_NO,PAIR_ACC,INSIDER,SID#)
VALUES
(NULL,NULL,NULL,v_acc,0,'acc',null,null,NULL,null,null,null,null,1,NULL,0,NULL,0,NULL,NULL);
end create_account;

PROCEDURE arest_c( v_num  varchar2,v_p varchar2 :='C',v_p1 varchar2 :=',C')                                        
                                             is
          Cursor Cr is Select *
  From account Where acc_no=v_num;  
          RCr Cr%rowtype;
Begin
         
                  Open Cr;
                  Fetch Cr Into RCr;
                  Close Cr;
   
              if (rcr.tipacc) is null  then 
                     Update account Set tipacc=v_p Where acc_no=v_num;
                                     elsif
                 (rcr.tipacc) is not null  then 
                     Update account Set tipacc=tipacc||v_p1 Where acc_no=v_num;
                     end if;                                               
                                                   
          Commit;
          End arest_c;
         
PROCEDURE update_cust_order
(        
         v_ddate date
         ,v_pnum char
         ,v_dbname char
	     ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char    
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
        
        
              	  )
is
begin

 update cust_order set  
                         ddate=v_ddate
                         ,pnum=v_pnum 
                         ,dbname=v_dbname 
                         ,dbcode=v_dbcode
                         ,dbinn=v_dbinn
                         ,dbcoracc=v_dbcoracc
                         ,dbswift=v_dbswift
                         ,val=v_val
                         ,b_name=v_b_name
                         ,b_code=v_b_code
                         ,b_inn=v_b_inn
                         ,b_swift=v_b_swift
                         ,b_acc=v_b_acc
                         ,c_name=v_c_name
                         ,c_acc=v_c_acc
                         ,c_inn=v_c_inn
                         ,m_name=v_m_name 
                         ,m_acc=v_m_acc 
                         ,m_inn=v_m_inn 
                         ,n_mon=v_n_mon 
                         ,w_mon=v_w_mon
                         ,content=v_content
                         ,edv=v_edv    
                         ,edv_f=v_edv_f 
                         ,edv_c=v_edv_c  
                         ,pro=v_pro   
                         ,pro_f=v_pro_f  
                         ,pro_c=v_pro_c  
                         ,head=v_head   
                         ,chief=v_chief
                         ,acc_inn=v_acc_inn  where pnum=v_pnum and val=v_val ;
	commit;
    
end update_cust_order;
 
          
          PROCEDURE arest_clear( v_num  varchar2,v_p varchar2 :='C',v_p1 varchar2 :=',C')                                        
                                             is
          Cursor Cr is Select *
  From account Where acc_no=v_num;  
          RCr Cr%rowtype;
Begin
         
                  Open Cr;
                  Fetch Cr Into RCr;
                  Close Cr;
   
              if (rcr.tipacc) is null  then 
                     Update account Set tipacc='' Where acc_no=v_num;
                                     elsif
                 (rcr.tipacc) is not null  then 
                     Update account Set tipacc = null  Where acc_no=v_num;
                     end if;                                               
                                                   
          Commit;
          End arest_clear;
          
          PROCEDURE arest_d( v_num  varchar2,v_p varchar2 :='D',v_p1 varchar2 :=',D')                                        
                                             is
          Cursor Cr is Select *
  From account Where acc_no=v_num;  
          RCr Cr%rowtype;
Begin
         
                  Open Cr;
                  Fetch Cr Into RCr;
                  Close Cr;
   
              if (rcr.tipacc) is null  then 
                     Update account Set tipacc=v_p Where acc_no=v_num;
                                     elsif
                 (rcr.tipacc) is not null  then 
                     Update account Set tipacc=tipacc||v_p1 Where acc_no=v_num;
                     end if;                                               
                                                   
          Commit;
          End arest_d;
          
          PROCEDURE arest_k( v_num  varchar2,v_p varchar2 :='K',v_p1 varchar2 :=',K')                                        
                                             is
          Cursor Cr is Select *
  From account Where acc_no=v_num;  
          RCr Cr%rowtype;
Begin
         
                  Open Cr;
                  Fetch Cr Into RCr;
                  Close Cr;
   
              if (rcr.tipacc) is null  then 
                     Update account Set tipacc=v_p Where acc_no=v_num;
                                     elsif
                 (rcr.tipacc) is not null  then 
                     Update account Set tipacc=tipacc||v_p1 Where acc_no=v_num;
                     end if;                                               
                                                   
          Commit;
          End arest_k;
          
          PROCEDURE arest_o( v_num  varchar2,v_p varchar2 :='O',v_p1 varchar2 :=',O')                                        
                                             is
          Cursor Cr is Select *
  From account Where acc_no=v_num;  
          RCr Cr%rowtype;
Begin
         
                  Open Cr;
                  Fetch Cr Into RCr;
                  Close Cr;
   
              if (rcr.tipacc) is null  then 
                     Update account Set tipacc=v_p Where acc_no=v_num;
                                     elsif
                 (rcr.tipacc) is not null  then 
                     Update account Set tipacc=tipacc||v_p1 Where acc_no=v_num;
                     end if;                                               
                                                   
          Commit;
          End arest_o;
          
          
          PROCEDURE delete_cust_order_arxiv(v_id varchar2)
is
begin
 delete from cust_order_arxiv
  where id = v_id ;
commit;	
end delete_cust_order_arxiv;


PROCEDURE c_trans 
   IS
   cursor cr is select debt_ammount,credit_ammount from order_trans;
        
      v_n float;
      v_m float;
      d_id float;
      c_id float;
      v_content varchar2(500);
     
      transactionid   INTEGER;
       BEGIN
       select debt_ammount into v_n from order_trans;
        select credit_ammount into v_m from order_trans;
        select debit_id into d_id from order_trans;
        select credit_id into c_id from order_trans;
        select content into v_content from order_trans;
           transactionid :=
            out_sb_transaction.transaction_add(
               debitid=>d_id,
               creditid=> c_id,
               debitamount=>v_n,
               creditamount=> v_m,
               lamount=> NULL,
               debitrate=> NULL,
               creditrate=> NULL,
               trname=> v_content
                           );
      COMMIT;
 
   END c_trans;
   
   Function currentdate
return Date
Is
 CurrentDate Date;  
Begin
  Select TEK_DAT Into CurrentDate From SYSDAT;
	return CurrentDate;	
End currentdate;


procedure delete_order(v_id varchar2)
is
begin
 delete from cust_order
  where id = v_id;
commit;	
end delete_order;
/*
PROCEDURE edit_cust_order
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
        
         
         
						  )
is
begin
delete from cust_order
  where pnum = v_pnum;
 Insert Into cust_order
                         (
                         ddate
                         ,pnum 
                         ,dbname 
                         ,dbcode
                         ,dbinn
                         ,dbcoracc
                         ,dbswift
                         ,val
                         ,b_name
                         ,b_code
                         ,b_inn
                         ,b_swift
                         ,b_acc
                         ,c_name
                         ,c_acc
                         ,c_inn
                         ,m_name 
                         ,m_acc 
                         ,m_inn 
                         ,n_mon 
                         ,w_mon
                         ,content
                         ,edv    
                         ,edv_f 
                         ,edv_c  
                         ,pro   
                         ,pro_f  
                         ,pro_c  
                         ,head   
                         ,chief
                         ,acc_inn 
                        
                       
            						 
                   
												  )
               	Values	(            
                                     v_ddate
                                     ,v_pnum 
                                     ,v_dbname 
            			                      ,v_dbcode 
                                     ,v_dbinn
                                     ,v_dbcoracc
                                     ,v_dbswift
                                     ,v_val
                                     ,v_b_name 
                                     ,v_b_code 
                                     ,v_b_inn 
                                     ,v_b_swift 
                                     ,v_b_acc 
                                     ,v_c_name 
                                     ,v_c_acc 
                                     ,v_c_inn 
                                     ,v_m_name 
                                     ,v_m_acc 
                                     ,v_m_inn 
                                     ,v_n_mon 
                                     ,v_w_mon 
                                     ,v_content 
                                     ,v_edv   
                                    ,v_edv_f         
                                    ,v_edv_c 
                                    ,v_pro    
                                    ,v_pro_f  
                                    ,v_pro_c  
                                    ,v_head   
                                    ,v_chief 
                                    ,v_acc_inn 
                               
            						 
                                    );
	commit;	    
end edit_cust_order;
*/

/*PROCEDURE edit_cust_order_arxiv
(         
         v_ddate date
         ,v_pnum char
         ,v_dbname char
		 ,v_dbcode  char
         ,v_dbinn char
         ,v_dbcoracc char
         ,v_dbswift char
         ,v_val char
        ,v_b_name char
        ,v_b_code char
        ,v_b_inn char
        ,v_b_swift char
        ,v_b_acc char
        ,v_c_name char
        ,v_c_acc char
        ,v_c_inn char             
           
        ,v_m_name char
        ,v_m_acc char
        ,v_m_inn char
        ,v_n_mon char
        ,v_w_mon char
        ,v_content char
        ,v_edv    char
        ,v_edv_f  char
        ,v_edv_c  char
        ,v_pro    char
        ,v_pro_f  char
        ,v_pro_c  char
        ,v_head   char
        ,v_chief  char
        ,v_acc_inn char
        
         
         
						  )
is
begin
delete from cust_order_arxiv
  where pnum = v_pnum;
 Insert Into cust_order_arxiv
                         (
                         ddate
                         ,pnum 
                         ,dbname 
                         ,dbcode
                         ,dbinn
                         ,dbcoracc
                         ,dbswift
                         ,val
                         ,b_name
                         ,b_code
                         ,b_inn
                         ,b_swift
                         ,b_acc
                         ,c_name
                         ,c_acc
                         ,c_inn
                         ,m_name 
                         ,m_acc 
                         ,m_inn 
                         ,n_mon 
                         ,w_mon
                         ,content
                         ,edv    
                         ,edv_f 
                         ,edv_c  
                         ,pro   
                         ,pro_f  
                         ,pro_c  
                         ,head   
                         ,chief
                         ,acc_inn 
                        
                       
            						 
                   
												  )
               	Values	(            
                                     v_ddate
                                     ,v_pnum 
                                     ,v_dbname 
            			                      ,v_dbcode 
                                     ,v_dbinn
                                     ,v_dbcoracc
                                     ,v_dbswift
                                     ,v_val
                                     ,v_b_name 
                                     ,v_b_code 
                                     ,v_b_inn 
                                     ,v_b_swift 
                                     ,v_b_acc 
                                     ,v_c_name 
                                     ,v_c_acc 
                                     ,v_c_inn 
                                     ,v_m_name 
                                     ,v_m_acc 
                                     ,v_m_inn 
                                     ,v_n_mon 
                                     ,v_w_mon 
                                     ,v_content 
                                     ,v_edv   
                                    ,v_edv_f         
                                    ,v_edv_c 
                                    ,v_pro    
                                    ,v_pro_f  
                                    ,v_pro_c  
                                    ,v_head   
                                    ,v_chief 
                                    ,v_acc_inn 
                               
            						 
                                    );
	commit;	    
end edit_cust_order_arxiv;*/

PROCEDURE order_trans_(v_debit_ammount varchar2,v_debit_id varchar2,v_credit_id varchar2,v_content varchar2)
is
begin
delete from order_trans;
insert into order_trans
(debt_ammount,credit_ammount,debit_id,credit_id,content)
values(v_debit_ammount,v_debit_ammount,v_debit_id,v_credit_id,v_content);

end order_trans_;

PROCEDURE trans_arxiv(v_id number,v_close_date date)
is
Cursor Cr is Select * From cust_order where id=v_id  ;
BEGIN
                   
For   k in Cr
              Loop

 Insert Into
  cust_order_arxiv(  dbname, dbcode, pnum, dbinn, dbcoracc, dbswift, val, b_name,
  b_code, b_inn, b_swift, b_acc, c_name, c_acc, c_inn, m_name,
       m_acc, m_inn, n_mon, w_mon, content, edv, edv_f, edv_c, pro,
       pro_f, pro_c, head, chief, ddate, id, acc_inn, close_date
 
       
)
           Values(k.dbname, k.dbcode, k.pnum, k.dbinn, k.dbcoracc, k.dbswift, k.val, k.b_name,
           K.b_code, k.b_inn, k.b_swift, k.b_acc, k.c_name, k.c_acc, k.c_inn, k.m_name,
       k.m_acc, k.m_inn, k.n_mon, k.w_mon, k.content, k.edv, k.edv_f, k.edv_c, k.pro,
       k.pro_f, k.pro_c, k.head, k.chief, k.ddate, k.id, k.acc_inn, v_close_date
 
       
);

commit;	
 End Loop;
                                                                                  
                 commit;
                  end trans_arxiv;
                  end customer_orders;
/


-- End of DDL Script for Package SMART.CUSTOMER_ORDERS



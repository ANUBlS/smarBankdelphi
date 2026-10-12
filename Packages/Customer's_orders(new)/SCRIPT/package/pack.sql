-- Start of DDL Script for Package SMART.CUSTOMER_ORDERS
-- Generated 15-Apr-2006 1:24:42 from SMART@SB

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
          
         
						  );
        PROCEDURE edit_cust_order_arxiv
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
        PROCEDURE order_trans_(v_debit_ammount varchar2,v_debit_id varchar2,v_credit_id varchar2,v_content varchar2);
        PROCEDURE trans_arxiv(v_id number,v_close_date date);
      

   

	
END customer_orders;
/



-- End of DDL Script for Package SMART.CUSTOMER_ORDERS



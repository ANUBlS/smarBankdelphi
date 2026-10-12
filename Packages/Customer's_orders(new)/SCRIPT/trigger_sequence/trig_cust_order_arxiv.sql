CREATE SEQUENCE sb_cust_order_arxiv
	START WITH 1
	INCREMENT BY 1
 /
CREATE OR REPLACE TRIGGER tr_cust_order_arxiv
	BEFORE INSERT ON cust_order_arxiv	FOR EACH ROW
	
DECLARE

BEGIN
	
	SELECT sb_cust_order_arxiv.NEXTVAL 
		INTO :NEW.ID 
	FROM DUAL;

END tr_cust_order;
/

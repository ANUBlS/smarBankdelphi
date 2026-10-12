-- Start of DDL Script for Package SMART.P_GB_REPORT
-- Generated 20-Jul-2006 15:21:30 from SMART@SB

CREATE OR REPLACE 
PACKAGE p_gb_report
  IS

procedure add_SQL(Q_name varchar2
                 ,Q_sql  varchar2);
PROCEDURE Unicode_change (V_az                          VARCHAR2,
                          V_az_font                        VARCHAR2,
                          V_az_font_size                   NUMBER,
                          V_az_charset                     NUMBER,
                          V_q_az                           VARCHAR2,
                          V_q_az_font                      VARCHAR2,
                          V_q_az_font_size                 NUMBER,
                          V_q_az_charset                   NUMBER,
                          V_id                             NUMBER,
                          V_component                      VARCHAR2,
                          V_component_type                 VARCHAR2,
                          V_component_type_c               VARCHAR2,
                          V_comp                           VARCHAR2);
               

END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY p_gb_report
IS
procedure add_SQL(Q_name varchar2
                 ,Q_sql  varchar2)
is
begin
   insert into REPORT_SQL values(Q_name
                                ,Q_sql);
   commit;
end;


--*******************************************
PROCEDURE Unicode_change (V_az                          VARCHAR2,
                          V_az_font                        VARCHAR2,
                          V_az_font_size                   NUMBER,
                          V_az_charset                     NUMBER,
                          V_q_az                           VARCHAR2,
                          V_q_az_font                      VARCHAR2,
                          V_q_az_font_size                 NUMBER,
                          V_q_az_charset                   NUMBER,
                          V_id                             NUMBER,
                          V_component                      VARCHAR2,
                          V_component_type                 VARCHAR2,
                          V_component_type_c               VARCHAR2,
                          V_comp                           VARCHAR2)

   IS

BEGIN
   insert into REPORT_UNICODE values (V_az,
                                      V_az_font,
                                      V_az_font_size,
                                      V_az_charset,
                                      V_q_az,
                                      V_q_az_font,
                                      V_q_az_font_size,
                                      V_q_az_charset,
                                      V_id,
                                      V_component,
                                      V_component_type,
                                      V_component_type_c,
                                      V_comp
                                      );
commit;                                                

END; -- Procedure

END;
/


-- End of DDL Script for Package SMART.P_GB_REPORT


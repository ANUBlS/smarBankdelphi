
CREATE SEQUENCE seq_cm_ip_insurancee
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
CREATE SEQUENCE seq_cm_ip_type
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/
CREATE TABLE cm_ip_info
    (creditid                       NUMBER NOT NULL,
    predaddress                    VARCHAR2(127),
    predtype                       NUMBER,
    predplatz                      NUMBER,
    predcost                       NUMBER,
    contractno                     VARCHAR2(20),
    paperno                        VARCHAR2(20),
    evaluater                      VARCHAR2(127),
    insurancecompany               NUMBER)
/
CREATE TABLE cm_ip_insurances
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(127) NOT NULL)
/
ALTER TABLE cm_ip_insurances
ADD CONSTRAINT pk_ip_insuranceid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER cm_bi_ip_insuranceidgen
 BEFORE
  INSERT
 ON cm_ip_insurances
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select seq_cm_ip_insurancee.nextval
     into :new.id
     from DUAL;
end;
/
CREATE TABLE cm_ip_types
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(127) NOT NULL)
/
ALTER TABLE cm_ip_types
ADD CONSTRAINT pk_ip_typeid PRIMARY KEY (id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/
CREATE OR REPLACE TRIGGER cm_bi_ip_typeidgen
 BEFORE
  INSERT
 ON cm_ip_types
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select seq_cm_ip_type.nextval
     into :new.id
     from DUAL;
end;
/
ALTER TABLE cm_ip_info
ADD CONSTRAINT fk_cm_ip_creditid FOREIGN KEY (creditid)
REFERENCES cm_portfolio (id) ON DELETE CASCADE
/
ALTER TABLE cm_ip_info
ADD CONSTRAINT fk_cm_ip_insurid FOREIGN KEY (insurancecompany)
REFERENCES cm_ip_insurances (id) ON DELETE CASCADE
/
ALTER TABLE cm_ip_info
ADD CONSTRAINT fk_cm_ip_typeid FOREIGN KEY (predtype)
REFERENCES cm_ip_types (id) ON DELETE CASCADE
/
INSERT INTO cm_ip_types
VALUES
(1,'„охм€нзилли бинада ф€рди м€нзил')
/
INSERT INTO cm_ip_types
VALUES
(2,'‘€рди йашайыш еви')
/
INSERT INTO cm_ip_insurances
VALUES
(1,'MBask')
/
INSERT INTO cm_ip_insurances
VALUES
(2,'Most Insurance')
/
INSERT INTO cm_ip_insurances
VALUES
(3,'Birlik')
/

CREATE OR REPLACE 
PACKAGE cm_ip
  IS
  
--------------------Type Manipulating----------------------------
  procedure ipAddType(typedesc varchar2);
  procedure ipDelType(typeid number);
  procedure ipUpdType(typeid number, typedesc varchar2);
--------------------Type Manipulating----------------------------

--------------------Insurance Manipulating-----------------------
  procedure ipAddIns(insdesc varchar2);
  procedure ipDelIns(insid number);
  procedure ipUpdIns(insid number, insdesc varchar2);
--------------------Insurance Manipulating-----------------------

--------------------Info Manipulating----------------------------
  procedure ipAddEditInfo(
              i_creditid number,                                                                                                                          
              i_predaddress varchar2,                                                                                                                     
              i_predtype number,                                                                                                                    
              i_predplatz number,                                                                                                                         
              i_predcost number,                                                                                                                          
              i_contractno varchar2,                                                                                                                      
              i_paperno varchar2,                                                                                                                         
              i_evaluater varchar2,                                                                                                                       
              i_insurancecompany varchar2
             );
             
--------------------Info Manipulating----------------------------
END;
/

CREATE OR REPLACE 
PACKAGE BODY cm_ip
IS
--------------------Type Manipulating----------------------------
  procedure ipAddType(typedesc varchar2)
  is
  begin
    insert into cm_ip_types (description) values (typedesc);
    commit;
  end;
  
  procedure ipUpdType(typeid number, typedesc varchar2)
  is
  begin
    update cm_ip_types set description=typedesc where id=typeid;
    commit;
  end;
  
  procedure ipDelType(typeid number)
  is
  begin
    delete from cm_ip_types where id=typeid;
    commit;
  end;
--------------------Type Manipulating----------------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

--------------------Insurance Manipulating-----------------------
  procedure ipAddIns(insdesc varchar2)
  is
  begin
    insert into cm_ip_insurances (description) values (insdesc);
    commit;
  end;
  
  procedure ipUpdIns(insid number, insdesc varchar2)
  is
  begin
    update cm_ip_insurances set description=insdesc where id=insid;
    commit;
  end;
  
  procedure ipDelIns(insid number)
  is
  begin
    delete from cm_ip_insurances where id=insid;
    commit;
  end;
--------------------Insurance Manipulating-----------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

--------------------Info Manipulating----------------------------
  procedure ipAddEditInfo(
              i_creditid number,                                                                                                                          
              i_predaddress varchar2,                                                                                                                     
              i_predtype number,                                                                                                                    
              i_predplatz number,                                                                                                                         
              i_predcost number,                                                                                                                          
              i_contractno varchar2,                                                                                                                      
              i_paperno varchar2,                                                                                                                         
              i_evaluater varchar2,                                                                                                                       
              i_insurancecompany varchar2
             )
  is
  begin
    update cm_ip_info set                                            
                predaddress = i_predaddress                                      
                ,predtype = i_predtype                                            
                ,predplatz = i_predplatz                                          
                ,predcost = i_predcost                                            
                ,contractno = i_contractno                                        
                ,paperno = i_paperno                                              
                ,evaluater = i_evaluater                                          
                ,insurancecompany = i_insurancecompany
     where creditid=i_creditid;
     if sql%rowcount=0 then
       insert into cm_ip_info (
                creditid                      
                ,predaddress                   
                ,predtype                      
                ,predplatz                     
                ,predcost                      
                ,contractno                    
                ,paperno                       
                ,evaluater                     
                ,insurancecompany)
           values(
                 i_creditid                      
                ,i_predaddress                   
                ,i_predtype                      
                ,i_predplatz                     
                ,i_predcost                      
                ,i_contractno                    
                ,i_paperno                       
                ,i_evaluater                     
                ,i_insurancecompany);
     end if;                         
     commit;   

  end;
--------------------Info Manipulating----------------------------
END;
/


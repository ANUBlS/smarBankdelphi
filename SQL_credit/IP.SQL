CREATE TABLE cm_ip_info
    (creditid                       NUMBER NOT NULL,
    predaddress                    VARCHAR2(127),
    predtype                       NUMBER,
    predplatz                      NUMBER,
    ownername                      VARCHAR2(127),
    predcost                       NUMBER,
    proplawno                      VARCHAR2(15),
    proplawregno                   VARCHAR2(15),
    contractno                     VARCHAR2(20),
    contractdate                   DATE,
    contractnot                    VARCHAR2(15),
    paperno                        VARCHAR2(20),
    paperdate                      DATE,
    evaluater                      VARCHAR2(127),
    insurancecompany               NUMBER,
    insuranceamount                NUMBER,
    insuranceno                    VARCHAR2(15),
    insurancedate                  DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
/
CREATE TABLE cm_ip_insurances
    (id                             NUMBER NOT NULL,
    description                    VARCHAR2(127) NOT NULL)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
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
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
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
INSERT INTO cm_ip_types VALUES(1,'„охм€нзилли бинада ф€рди м€нзил')
/
INSERT INTO cm_ip_types VALUES(2,'‘€рди йашайыш еви')
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
INSERT INTO cm_ip_insurances
VALUES
(5,'ёззцн сыьорта')
/
INSERT INTO cm_ip_insurances
VALUES
(4,'Ata Sigorta')
/
INSERT INTO cm_ip_insurances
VALUES
(6,'Standart Insurance')
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
  procedure ipAddEditInfo (
       i_creditid           number,
       i_predaddress        varchar2,
       i_predtype           number,
       i_predplatz          number,
       i_ownername          varchar2,
       i_predcost           number,
       i_proplawno          varchar2,
       i_proplawregno       varchar2,
       i_contractno         varchar2,
       i_contractdate       date,
       i_contractnot        varchar2,
       i_paperno            varchar2,
       i_paperdate          date,
       i_evaluater          varchar2,
       i_insurancecompany   number,
       i_insuranceamount    number,
       i_insuranceno        varchar2,
       i_insurancedate      date
    );
--------------------Info Manipulating----------------------------

---------------------Other Functions-----------------------------
  function crdGetTrchDate(c_id number)
  return date;
---------------------Other Functions-----------------------------
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
    procedure ipAddEditInfo (
       i_creditid           number,
       i_predaddress        varchar2,
       i_predtype           number,
       i_predplatz          number,
       i_ownername          varchar2,
       i_predcost           number,
       i_proplawno          varchar2,
       i_proplawregno       varchar2,
       i_contractno         varchar2,
       i_contractdate       date,
       i_contractnot        varchar2,
       i_paperno            varchar2,
       i_paperdate          date,
       i_evaluater          varchar2,
       i_insurancecompany   number,
       i_insuranceamount    number,
       i_insuranceno        varchar2,
       i_insurancedate      date
    )
    is
    begin
       update cm_ip_info
          set  predaddress= i_predaddress,                                      
               predtype= i_predtype,                                            
               predplatz= i_predplatz,                                          
               ownername= i_ownername,                                          
               predcost= i_predcost,                                            
               proplawno= i_proplawno,                                          
               proplawregno= i_proplawregno,                                    
               contractno= i_contractno,                                        
               contractdate= i_contractdate,                                    
               contractnot= i_contractnot,                                      
               paperno= i_paperno,                                              
               paperdate= i_paperdate,                                          
               evaluater= i_evaluater,                                          
               insurancecompany= i_insurancecompany,                            
               insuranceamount= i_insuranceamount,                              
               insuranceno= i_insuranceno,                                      
               insurancedate= i_insurancedate  
        where creditid = i_creditid;
    
       if sql%rowcount = 0
       then
          insert into cm_ip_info
                      (creditid,                      
                       predaddress,                   
                       predtype,                      
                       predplatz,                     
                       ownername,                     
                       predcost,                      
                       proplawno,                     
                       proplawregno,                  
                       contractno,                    
                       contractdate,                  
                       contractnot,                   
                       paperno,                       
                       paperdate,                     
                       evaluater,                     
                       insurancecompany,              
                       insuranceamount,               
                       insuranceno,                   
                       insurancedate
                      )
               values (i_creditid,                      
                       i_predaddress,                   
                       i_predtype,                      
                       i_predplatz,                     
                       i_ownername,                     
                       i_predcost,                      
                       i_proplawno,                     
                       i_proplawregno,                  
                       i_contractno,                    
                       i_contractdate,                  
                       i_contractnot,                   
                       i_paperno,                       
                       i_paperdate,                     
                       i_evaluater,                     
                       i_insurancecompany,              
                       i_insuranceamount,               
                       i_insuranceno,                   
                       i_insurancedate
                      );
       end if;
    
       commit;
    end;
--------------------Info Manipulating----------------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

---------------------Other Functions-----------------------------
function crdGetTrchDate(c_id number)
  return date
  is
  res date; 
begin
  select nvl(max(tranchedate),sysdate)
    into res
    from cm_tranches
   where creditid=c_id;
   return res;  
end;
---------------------Other Functions-----------------------------
END;
/

CREATE OR REPLACE VIEW cm_ip_yminfo (
   creditid,
   ipdate,
   ymbank,
   mkbank,
   boorower,
   kotirovkarate,
   ymdate,
   ymperiod,
   crdpaydate,
   ymamount )
AS
select c.id creditid,to_date (SYSDATE) ipdate, b.az_name ymbank, u.description mkbank,
       i.name boorower, c.annualyinterestrate kotirovkarate,
       to_date(cm_ip.crdgettrchdate (c.id)) ymdate, TO_NUMBER (1) ymperiod,
       to_date (SYSDATE) crdpaydate, c.creditlineamount ymamount
  from sb_bankinfo b,
       cm_active_credits c, 
       cm_usergroups u, 
       cm_boorowerinfo i
 where c.id = i.creditid
   and c.usrgroup = u.id
/

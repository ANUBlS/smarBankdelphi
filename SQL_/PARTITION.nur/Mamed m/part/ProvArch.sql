drop SEQUENCE tr_seg_Provarch
/
CREATE SEQUENCE tr_seg_Provarch
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  NOCACHE
/

LOCK TABLE ProvArch IN EXCLUSIVE  MODE ; 

create table  ProvArch_copy as select * from ProvArch ;

drop table Provarch;

CREATE TABLE ProvArch
    (
    id                             NUMBER(10,0) not null,
    op_id                          NUMBER(10,0),
    no_prov                        VARCHAR2(8),
    dat                            DATE NOT NULL,
    debt                           NUMBER(10,0) NOT NULL,
    kredit                         NUMBER(10,0) NOT NULL,
    val_acc                        NUMBER(10,0) DEFAULT 0 NOT NULL,
    vid_op                         NUMBER(5,0),
    ammount                        NUMBER(15,2) NOT NULL,
    lammount                       NUMBER(15,2) NOT NULL,
    tim                            DATE,
    Shifr                          NUMBER(5,0),
    no_pack                        NUMBER(5,0),
    kassa_b                        NUMBER(5,0),
    kassa_z                        NUMBER(5,0),
    no_filial                      NUMBER(5,0),
    sloj_prov                      NUMBER(5,0),
    bank_d                         NUMBER,
    bank_k                         NUMBER,
    no_doc                         NUMBER(5,0),
    no_mem                         NUMBER(5,0),
    d1                             VARCHAR2(20),
    k1                             VARCHAR2(20),
    rate_d                         NUMBER(15,2),
    rate_c                         NUMBER(15,2),
    parentid                       NUMBER(10,0),
    currencyid_c                   NUMBER(4,0) DEFAULT 0 NOT NULL,
    ammount_c                      NUMBER(15,2) NOT NULL,
    name                           VARCHAR2(255)
 , CONSTRAINT PK_Provarch PRIMARY KEY (id) )
  PARTITION BY RANGE (Shifr)
  (
   PARTITION Archivalday VALUES LESS THAN (1)
  ,PARTITION Reserve     VALUES LESS THAN (2)
  ,PARTITION Yesterday   VALUES LESS THAN (3)
  ,PARTITION Currentday  VALUES LESS THAN (4)
  ,PARTITION Unknownday  VALUES LESS THAN (MAXVALUE)
  );


ALTER TABLE Provarch  ENABLE ROW MOVEMENT;

insert into provArch select * from provarch_copy;

update provarch set shifr=0;
update provarch set shifr=3 where dat=(select tek_dat from sysdat);
update provarch set shifr=2 where dat=(select pred_dat from sysdat);

 
CREATE OR REPLACE TRIGGER tr_Provarch_opid BEFORE INSERT ON provarch
REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
begin
 :new.OP_ID := sblogin.UserID;
end;
/
--drop index idx_Provarh_dat;
CREATE INDEX idx_Provarch_dat ON ProvArch (dat) local
/
/*
CREATE OR REPLACE TRIGGER inc_Provarch BEFORE INSERT ON Provarch
REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
declare nw integer;
begin
 select seg_Provarch.nextval into nw from dual;
 :new.id:=nw;
end inc_provarch;
*/

ALTER TABLE Provarch ADD CONSTRAINT fk_Provarch_acc_cred FOREIGN KEY (kredit)
REFERENCES account (id) ON DELETE CASCADE
/

ALTER TABLE Provarch ADD CONSTRAINT fk_Provarch_acc_deb FOREIGN KEY (debt)
REFERENCES account (id) ON DELETE CASCADE
/



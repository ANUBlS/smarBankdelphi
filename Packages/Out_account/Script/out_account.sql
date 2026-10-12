CREATE TABLE out_account
    (id                             NUMBER(10,0) NOT NULL,
    kli_id                         NUMBER(10,0),
    op_id                          NUMBER(10,0),
    acc_no                         VARCHAR2(20),
    val_acc                        NUMBER(3,0),
    name                           VARCHAR2(90),
    open_dat                       DATE,
    close_dat                      DATE,
    bal_cn1                        NUMBER(10,0),
    bal_cn2                        NUMBER(10,0),
    bal_cn3                        NUMBER(10,0),
    bal_cn4                        NUMBER(10,0),
    filial                         NUMBER(5,0),
    sim_otcet                      NUMBER(10,0),
    tipacc                         VARCHAR2(20),
    limit                          NUMBER DEFAULT 0
,
    old_acc_no                     VARCHAR2(20),
    pair_acc                       NUMBER(10,0),
    insider                        VARCHAR2(1),
    sid#                           NUMBER,
    tempid                         NUMBER,
    ownid                          NUMBER)
  TABLESPACE  smartbank
  PARTITION BY RANGE (CLOSE_DAT)
  (
  PARTITION closeacc VALUES LESS THAN (TO_DATE(' 2100-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')),
  PARTITION activacc VALUES LESS THAN (MAXVALUE)
  )
/
CREATE INDEX out_idx_account_acc_no ON out_account
  (
    acc_no                          ASC
  )
  TABLESPACE  smartidx
/

CREATE INDEX out_idx_account_bal_cn1 ON out_account
  (
    bal_cn1                         ASC
  )
  TABLESPACE  smartidx
/


ALTER TABLE out_account
ADD CONSTRAINT out_pk_account PRIMARY KEY (id)
USING INDEX
  TABLESPACE  smartidx
/

ALTER TABLE out_account
ADD CONSTRAINT out_uk_acc_no_val_acc UNIQUE (acc_no)
/





CREATE OR REPLACE TRIGGER out_after_inc_account
 AFTER
  INSERT
 ON out_account
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  cursor dats is (select distinct dat from operkurs where dat>=:new.open_dat);
  I INTEGER;
  nw INTEGER;
  part integer;
  CurrentDate DATE;
 	PrevDate DATE;
 	
BEGIN
  SELECT tr_seg_account.CURRVAL INTO nw FROM dual;
  SELECT Tek_dat, Pred_Dat INTO CurrentDate, PrevDate FROM sysdat;

if :new.open_dat < CurrentDate then

  For c_Dat in dats loop   
   if c_Dat.dat=CurrentDate Then 
    Part:=3; 
   Elsif c_Dat.dat=PrevDate Then 
    Part:=2; 
   else 
    Part:=0;
   End If;
   out_sbop.add_archost(part, nw, c_Dat.dat);

End loop;

else
  out_sbop.add_archost(3,nw, CurrentDate);
  out_sbop.add_archost(2,nw, PrevDate);
end if;

END out_After_Inc_Account;
/

CREATE OR REPLACE TRIGGER out_befor_inc_account
 BEFORE
  INSERT
 ON out_account
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   SELECT tr_seg_account.NEXTVAL
     INTO :NEW.id
     FROM dual;
	:new.OP_ID := sblogin.UserID;
END out_befor_inc_account;
/

CREATE OR REPLACE TRIGGER out_bi_account_opid
 BEFORE
  UPDATE
 ON out_account
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
 AccRest out_Archost.ostat%type;
 AccPokRest out_Archost.pok_ostat%type;
begin
  if :new.OP_ID = :old.OP_ID then
	:new.OP_ID := sblogin.UserID;
  end if;
 
 if :new.close_dat is not null then
  select ostat, pok_ostat into AccRest, AccPokRest from out_tenostat where acc_id = :new.ID;
  if (AccRest <> 0) or (AccPokRest <> 0) then
   raise_application_error(-20010, 'Qaligi olan hesabi baglamaq olmaz!!!');
  end if;  
 end if;  
end;
/

CREATE OR REPLACE TRIGGER out_before_update
 BEFORE
  UPDATE
 ON out_account
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin 
   :New.OP_ID:=SBLogin.UserID;

end;
/

CREATE OR REPLACE TRIGGER out_trg_account_branch
 BEFORE
  INSERT OR UPDATE
 ON out_account
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
begin
 if SB_ACA.getuserfilialid(user) <> 0 then
  :new.filial :=SB_ACA.getuserfilialid(user);
 end if; 
end;
/

ALTER TABLE out_account
ADD CONSTRAINT out_fk_account_bal_spr1 FOREIGN KEY (bal_cn1)
REFERENCES out_bal_spr1 (bal_cn)
ENABLE NOVALIDATE
/
ALTER TABLE out_account
ADD CONSTRAINT out_fk_account_filial FOREIGN KEY (filial)
REFERENCES filial_t (id)
ENABLE NOVALIDATE
/
ALTER TABLE out_account
ADD CONSTRAINT out_fk_acc_avalute FOREIGN KEY (val_acc)
REFERENCES avalute_t (valute)
/
ALTER TABLE out_account
ADD CONSTRAINT out_fk_acc_customers FOREIGN KEY (kli_id)
REFERENCES customers (id) ON DELETE CASCADE
/

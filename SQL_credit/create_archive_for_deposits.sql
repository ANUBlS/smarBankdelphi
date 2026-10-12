CREATE TABLE sbcm_contract_state_history (id#                            NUMBER NOT NULL,
    hdate  date,
    facticaldebt                   NUMBER,
    overduedebt                    NUMBER,
    facticalinterestdebt           NUMBER,
    overdueinterestdebt            NUMBER,
    closedate                      DATE,
    stopcalculationdate            DATE,
    lastprocessdate                DATE,
    calculationenabled             NUMBER NOT NULL,
    reguiredamountdec              NUMBER,
    reguiredpercentdec             NUMBER,
    residuaryamount                NUMBER,
    lastfacticaldebt               NUMBER(18,2),
    lastoverduedebt                NUMBER(18,2),
    partitionkey                   NUMBER DEFAULT 0   NOT NULL)
  PARTITION BY RANGE (PARTITIONKEY)
  (
  PARTITION curr_state VALUES LESS THAN (1),
  PARTITION prev_state VALUES LESS THAN (2),
  PARTITION archive_state VALUES LESS THAN (MAXVALUE)
  )
; 
ALTER TABLE sbcm_contract_state_history  ENABLE ROW MOVEMENT;

ALTER TABLE SBCM_CONTRACT_STATE 
 ADD (
  partitionkey number 
 );
 
 update SBCM_CONTRACT_STATE
 set partitionkey = 0;
 commit;
 
ALTER TABLE SBCM_CONTRACT_STATE 
 MODIFY (
  PARTITIONKEY NOT NULL
); 
 
 
insert into sbcm_contract_state_history
SELECT a.id#, '10-Feb-2006', a.facticaldebt, a.overduedebt,
       a.facticalinterestdebt, a.overdueinterestdebt, a.closedate,
       a.stopcalculationdate, a.lastprocessdate, a.calculationenabled,
       a.reguiredamountdec, a.reguiredpercentdec, a.residuaryamount,
       a.lastfacticaldebt, a.lastoverduedebt, a.partitionkey
  FROM sbcm_contract_state a ;
  
  
ALTER TABLE sbcm_contract_state_history
 EXCHANGE PARTITION curr_state WITH TABLE sbcm_contract_state
  WITHOUT VALIDATION;
  
  drop table sbcm_contract_state;
  
  create view sbcm_contract_state as   
  select * from  sbcm_contract_state_history partition ( curr_state );
  
CREATE UNIQUE INDEX uk_contract_state_history ON sbcm_contract_state_history
  (
    hdate                 ASC,
    id#                        ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255;
  
ALTER TABLE SBCM_CONTRACT_STATE_HISTORY ADD CONSTRAINT FK_CONTRACTS
  FOREIGN KEY (
ID#
)
 REFERENCES SMART.SBCM_CONTRACTS
 (
ID
) 
 ON DELETE CASCADE ;
  


ALTER TABLE archost EXCHANGE PARTITION currentday WITH TABLE a2 --WITHOUT VALIDATION;

alter table archost drop index idx_archost_accid;
CREATE INDEX idx_archost_accid ON archost ( acc_id ASC );
alter table archost drop index idx_archost_datdate;
CREATE INDEX idx_archost_datdate ON archost ( datdate ASC );


alter table archost disable constraint pk_archost_accid_datdate;
alter table archost enable constraint pk_archost_accid_datdate;

CREATE UNIQUE INDEX pk_archost_accid_datdate ON archost
  ( acc_id ASC,  datdate  ASC );
/



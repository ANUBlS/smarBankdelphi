CREATE INDEX idx_archost_datdate ON archost
  (
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE INDEX idx_nu_account_id ON archost
  (
    acc_id                          ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
PARALLEL (DEGREE DEFAULT)
/
CREATE UNIQUE INDEX pk_archost ON archost
  (
    acc_id                          ASC,
    datdate                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

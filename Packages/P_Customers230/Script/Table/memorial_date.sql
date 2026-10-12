DROP TABLE memorial_date
/

CREATE TABLE memorial_date
    (start_date                     DATE,
    end_date                       DATE)
  PCTFREE     10
  PCTUSED     40
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  smartbank
PARALLEL (DEGREE DEFAULT)
/


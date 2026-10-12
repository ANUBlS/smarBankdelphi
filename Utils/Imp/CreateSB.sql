create tablespace &1
  datafile '&2'
  size 500m
  autoextend on
;

create user smart
  identified by sm
  default tablespace &1
  temporary tablespace temp
;

grant all privileges to smart;

grant dba to smart;

exit
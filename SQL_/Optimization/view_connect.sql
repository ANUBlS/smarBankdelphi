create or replace view aaa as
select * from account 
connect by prior id<300
start with id<300

select * from aaa



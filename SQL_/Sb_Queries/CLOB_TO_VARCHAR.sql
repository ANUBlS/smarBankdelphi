alter table sb_queries add (qvar varchar2(32676));
update sb_queries
set qvar = dbms_lob.substr(query, dbms_lob.getlength(query),1);
commit;
alter table sb_queries drop (query);
alter table sb_queries add (query varchar2(32676));
update sb_queries
set query = qvar;
alter table sb_queries drop (qvar);
commit;


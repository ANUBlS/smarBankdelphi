insert into cm_interests (partitionkey, creditid, hdate, interest, dueinterest, inttrid,
       dueinttrid, trprocessed,INTPRECISION,DUEINTPRECISION)
select 0,ID , '8-Nov-2004' ,0,0,null,null,0,0,0 from cm_portfolio       
       

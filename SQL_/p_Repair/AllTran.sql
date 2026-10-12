select *  from v_provarch1 where (dat>'4-jun-03' 
and (vid_op=1 or vid_op=2)
and 
(
debt=(select debt from v_provarch1 where id=117556) 
or
kredit=(select debt from v_provarch1 where id=117556)
or
debt=(select kredit from v_provarch1 where id=117556) 
or
kredit=(select kredit from v_provarch1 where id=117556)
))
or id=117556
or parentid=117556
order by dat,id
;
--select * from temprepairtrans order by dat,vid_op;


rename filial to filial_t
/

CREATE OR REPLACE VIEW filial (
   id,
   name )
AS
select 
f.*
 from smart.filial_t f
where 
(sb_aca.isadm_num(user)=0 and f.id = ( select filialid from sba_objinf where obj=user))
or sb_aca.isadm_num(user)=1
/

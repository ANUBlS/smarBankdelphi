update lazyrest l set 
 l.ostat=(select t.ostat from tenostat t where l.acc_id= t.acc_id)
,l.pok_ostat=(select t.pok_ostat from tenostat t where l.acc_id= t.acc_id)
,l.obr_d=(select t.obr_d from tenostat t where l.acc_id= t.acc_id)
,l.obr_k=(select t.obr_k from tenostat t where l.acc_id= t.acc_id)
,l.pok_obr_d=(select t.pok_obr_d from tenostat t where l.acc_id= t.acc_id)
,l.pok_obr_k=(select t.pok_obr_k from tenostat t where l.acc_id= t.acc_id)


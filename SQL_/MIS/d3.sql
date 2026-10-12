Select type, count(type) Sayi,  
val_name, 
  sum(Ostat) as Ostat --, sum(Pok_ostat)
, sum(obr_d) as Obr_D
, sum(obr_k) as Obr_K
--,sum(pok_obr_d), sum(pok_obr_k)
--, max(opendate)
--, max(closedate)

from v_mis1
where datdate='26-jul-04'
group by type, val_name
order by Sayi desc, type, val_name


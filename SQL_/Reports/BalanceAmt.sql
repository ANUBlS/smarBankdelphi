select 
balancecode, currencyname
--, accountname
, sum(ostat)
, sum(Pok_ostat)
, Sum(obr_d)
, sum(pok_obr_d)
, sum(obr_k)
, sum(pok_obr_k)
, MAX(TYPEID)
, MAX(ADDITIONALTYPEID)
 from v_balance1 where datdate='6-jan-4'
 and currencyid=1
 group by balancecode, currencyname
 order by balancecode, currencyname
 

-- Start of DDL Script for View SMART.V_MIS1
-- Generated 17-Apr-2004 1:21:50 from SMART@SB

CREATE OR REPLACE VIEW v_mis1 (
   datdate,
   balancecode,
   currencyname,
   ostat,
   pok_ostat,
   activ,
   pok_activ,
   passiv,
   pok_passiv,
   obr_d,
   pok_obr_d,
   obr_k,
   pok_obr_k )
AS
select 
datdate, balancecode, currencyname
, Sum(ostat) Ostat
, Sum(Pok_Ostat) Pok_Ostat
 
, sum(sb_mtoutview.active (Ostat, typeid, Additionaltypeid ))    Activ
, sum(sb_mtoutview.active (Pok_ostat, Typeid, Additionaltypeid)) Pok_Activ
, sum(sb_mtoutview.passiv (Ostat, typeid, Additionaltypeid))     Passiv
, sum(sb_mtoutview.passiv (Pok_ostat, Typeid, Additionaltypeid)) Pok_Passiv

, Sum(obr_d)       Obr_D
, sum(pok_obr_d)   Pok_Obr_D
, sum(obr_k)       Obr_K
, sum(pok_obr_k)   Pok_Obr_K

 from v_balance1 
-- where datdate='6-jan-4'
-- and currencyid=1
 group by datdate, balancecode, currencyname
 order by datdate, balancecode, currencyname
/


-- End of DDL Script for View SMART.V_MIS1


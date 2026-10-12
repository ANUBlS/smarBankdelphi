-- Start of DDL Script for Function CREDITSMGR.CALC
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.calc (p_creditid IN INTEGER)
   RETURN NUMBER
IS
   RESULT         NUMBER;

   CURSOR c_credittranches(p_dat in date)
   IS
      SELECT   tranchedate, trancheamount
          FROM cm_tranches
         WHERE creditid = p_creditid AND tranchedate > p_dat
      ORDER BY tranchedate;

   currdate       DATE;
   prevdate       DATE;
   calcdate       DATE;
   dateinterval   INTEGER;
   CalcAmt        NUMBER;
BEGIN
   SELECT tek_dat, pred_dat
     INTO currdate, prevdate
     FROM sb_sysdat;

   calcdate := DEFCALCDATE(p_creditid,CalcAmt);
     
   FOR credittranches IN c_credittranches(calcdate)
   LOOP
      dateinterval :=
              cm_utils.bankdaysbetween (calcdate, credittranches.tranchedate);
   END LOOP;

   RETURN RESULT;
END;
/



-- End of DDL Script for Function CREDITSMGR.CALC

-- Start of DDL Script for Function CREDITSMGR.CM_CRIDNUM
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.cm_cridnum
  ( crnum in varchar2)
  RETURN  integer IS
  res integer;
BEGIN 
  select id 
    into res
    from cm_portfolio
   where numberofcredit = crnum;
   
   return res; 
  
END;
/



-- End of DDL Script for Function CREDITSMGR.CM_CRIDNUM

-- Start of DDL Script for Function CREDITSMGR.DEFCALCDATE
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.defcalcdate (p_creditid IN INTEGER,p_tramt out number)
      RETURN date
   IS
      RESULT          date                    ;

      CURSOR c_cardtranches
      IS
         SELECT tranchedate, trancheamount
           FROM cm_tranches
          WHERE creditid = p_creditid
          order by TRANCHEDATE;


      CURSOR c_cardspayments
      IS
         SELECT SUM (payedamt) AS payamt
           FROM cm_payments
          WHERE creditid = p_creditid;

      CURSOR c_cardsetting
      IS
         SELECT beginperiod, endperiod, annualintrate, fixedday
           FROM cm_calc_cardsettings
          WHERE cardid = (SELECT cardid
                            FROM cm_calc_cardcustsettings
                           WHERE categoryid = (SELECT customertype
                                                 FROM cm_portfolio
                                                WHERE ID = p_creditid));

      cardsetting     c_cardsetting%ROWTYPE;
      cardspayments   c_cardspayments%ROWTYPE;
      sumpay          NUMBER                    := 0;
      tranchamt       NUMBER;
      annint          NUMBER;
      temp            NUMBER                    := 0;
      temppay         NUMBER                    := 0;
      tempcalc        NUMBER                    := 0;
      tekdat          DATE;
      preddat         DATE;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO tekdat, preddat
        FROM sb_sysdat;

      OPEN c_cardspayments;
      FETCH c_cardspayments INTO sumpay;
      CLOSE c_cardspayments;

      temppay := NVL (sumpay, 0);

         FOR cardtranches IN c_cardtranches
         LOOP

            tranchamt := cardtranches.trancheamount;
            temp := tranchamt - temppay;
            
            if temp >0 then
               temppay := 0;
               Result := cardtranches.tranchedate;
               p_tramt := temp;
               exit;
            else
               temppay := ABS(temp);  
            end if;
            
         END LOOP;

      RETURN RESULT;
   END;
/



-- End of DDL Script for Function CREDITSMGR.DEFCALCDATE

-- Start of DDL Script for Function CREDITSMGR.GET_CONCDATE
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.get_concdate (crdid INTEGER)
   RETURN DATE
IS
   res   DATE;
BEGIN
   SELECT dateofconclusion
     INTO res
     FROM cm_portfolio
    WHERE ID = crdid;

   RETURN res;
END;
/



-- End of DDL Script for Function CREDITSMGR.GET_CONCDATE

-- Start of DDL Script for Function CREDITSMGR.GET_DUEDATE
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.get_duedate (crdid INTEGER)
   RETURN DATE
IS
   res   DATE;
BEGIN
   SELECT duedatefirstcontract
     INTO res
     FROM cm_portfolio
    WHERE ID = crdid;

   RETURN res;
END;
/



-- End of DDL Script for Function CREDITSMGR.GET_DUEDATE

-- Start of DDL Script for Function CREDITSMGR.GET_FILIALNAME
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.get_filialname (b_id IN INTEGER)
   RETURN VARCHAR2
IS
   res   VARCHAR2 (255);
BEGIN
   SELECT NAME
     INTO res
     FROM sb_filial
    WHERE ID = b_id;

   RETURN res;
END;
/



-- End of DDL Script for Function CREDITSMGR.GET_FILIALNAME

-- Start of DDL Script for Function CREDITSMGR.GET_RESERVE_PERCENT
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.get_reserve_percent(p_id in integer) 
return integer
is
 cursor c_res is
 select PERCENT
 from cm_reserves
 where id=p_id;
 result integer;
begin
 open c_res;
 fetch c_res into result;
 close c_res;
 return result;
END;
/



-- End of DDL Script for Function CREDITSMGR.GET_RESERVE_PERCENT

-- Start of DDL Script for Function CREDITSMGR.GET_RESERVES_NAME
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.get_reserves_name(p_id in integer)
return varchar2
is
result varchar2(67);
begin
if p_id is null then Result :=  ' ';
else
select description||'-'||percent into result
from cm_reserves
where id = p_id;
end if;
return result;

end;
/



-- End of DDL Script for Function CREDITSMGR.GET_RESERVES_NAME

-- Start of DDL Script for Function CREDITSMGR.GETBRANCHNAME
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.getbranchname (b_id IN INTEGER)
   RETURN VARCHAR2
IS
   res   VARCHAR2 (255);
BEGIN
   SELECT NAME
     INTO res
     FROM sb_filial
    WHERE ID = b_id;

   RETURN res;
END;
/



-- End of DDL Script for Function CREDITSMGR.GETBRANCHNAME

-- Start of DDL Script for Function CREDITSMGR.GETTABLESELECT
-- Generated 17/04/2007 2:08:42 PM from CREDITSMGR@SB

CREATE OR REPLACE 
FUNCTION creditsmgr.gettableselect (usgrp INTEGER)
   RETURN VARCHAR2
IS
   CURSOR c1
   IS
      SELECT 'select * from ' || table_name || ' ' selquery
        FROM all_tables
       WHERE table_name LIKE 'CM_FORM1_%_' || usgrp AND owner = USER;

   res   VARCHAR2 (255);
BEGIN
   res := chr(10);

   FOR x IN c1
   LOOP
      IF res <> chr(10)
      THEN
         res := res || ' union ';
      END IF;

      res := res || x.selquery;
   END LOOP;

   RETURN res;
END;
/



-- End of DDL Script for Function CREDITSMGR.GETTABLESELECT


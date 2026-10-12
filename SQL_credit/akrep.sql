CREATE GLOBAL TEMPORARY TABLE cm_report_sd1
    (creditid                       NUMBER NOT NULL,
    pbmain                         NUMBER(18,2) NOT NULL,
    pbint                          NUMBER(18,2) NOT NULL,
    pbduemain                      NUMBER(18,2) NOT NULL,
    pbdueint                       NUMBER(18,2) NOT NULL,
    paymain                        NUMBER(18,2) NOT NULL,
    payint                         NUMBER(18,2) NOT NULL,
    paydue                         NUMBER(18,2) NOT NULL,
    paydueint                      NUMBER(18,2) NOT NULL,
    tranchemain                    NUMBER(18,2) NOT NULL,
    pemain                         NUMBER(18,2) NOT NULL,
    peint                          NUMBER(18,2) NOT NULL,
    peduemain                      NUMBER(18,2) NOT NULL,
    pedueint                       NUMBER(18,2) NOT NULL,
    crdperiod                      NUMBER(10) DEFAULT 0   NOT NULL)
ON COMMIT DELETE ROWS
/
CREATE GLOBAL TEMPORARY TABLE cm_report_f1
    (creditid                       NUMBER(20) NOT NULL,
    boorowerid                     NUMBER(20) NOT NULL,
    crdnum                         VARCHAR2(255) NOT NULL,
    boorowername                   VARCHAR2(255) NOT NULL,
    branchid                       NUMBER NOT NULL,
    branch                         VARCHAR2(255) NOT NULL,
    districtid                     NUMBER NOT NULL,
    district                       VARCHAR2(255) NOT NULL,
    villageid                      NUMBER NOT NULL,
    village                        VARCHAR2(255) NOT NULL,
    purposeid                      NUMBER NOT NULL,
    purpose                        VARCHAR2(255) NOT NULL,
    typeid                         NUMBER NOT NULL,
    typedesc                       VARCHAR2(10) NOT NULL,
    crdcount                       NUMBER DEFAULT 1   NOT NULL,
    payedcrdcount                  NUMBER DEFAULT 1   NOT NULL,
    firsttrchdate                  DATE NOT NULL,
    lastpaydate                    DATE NOT NULL,
    givenamount                    NUMBER(18,2) NOT NULL,
    calculatedpercent              NUMBER(18,2) NOT NULL,
    datedebtmain                   NUMBER(18,2) NOT NULL,
    datedebtint                    NUMBER(18,2) NOT NULL,
    payedmain                      NUMBER(18,2) NOT NULL,
    payedint                       NUMBER(18,2) NOT NULL,
    payedmonmain                   NUMBER(18,2) NOT NULL,
    payedmonint                    NUMBER(18,2) NOT NULL,
    debtmain                       NUMBER(18,2) NOT NULL,
    debtint                        NUMBER(18,2) NOT NULL,
    debtovermain                   NUMBER(18,2) NOT NULL,
    debtoverint                    NUMBER(18,2) NOT NULL)
ON COMMIT DELETE ROWS
/
CREATE OR REPLACE TRIGGER cm_bi_report_f1
BEFORE INSERT 
ON cm_report_f1
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
   :NEW.givenamount := ROUND (:NEW.givenamount / 1000, 1);
   :NEW.calculatedpercent := ROUND (:NEW.calculatedpercent / 1000, 1);
   :NEW.datedebtmain := ROUND (:NEW.datedebtmain / 1000, 1);
   :NEW.datedebtint := ROUND (:NEW.datedebtint / 1000, 1);
   :NEW.payedmain := ROUND (:NEW.payedmain / 1000, 1);
   :NEW.payedint := ROUND (:NEW.payedint / 1000, 1);
   :NEW.payedmonmain := ROUND (:NEW.payedmonmain / 1000, 1);
   :NEW.payedmonint := ROUND (:NEW.payedmonint / 1000, 1);
   :NEW.debtmain := ROUND (:NEW.debtmain / 1000, 1);
   :NEW.debtint := ROUND (:NEW.debtint / 1000, 1);
   :NEW.debtovermain := ROUND (:NEW.debtovermain / 1000, 1);
   :NEW.debtoverint := ROUND (:NEW.debtoverint / 1000, 1);
END;
/
CREATE OR REPLACE 
PACKAGE cm_ak_reports
  IS
  PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
END;
/

CREATE OR REPLACE 
PACKAGE BODY cm_ak_reports 
IS
   PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
   IS
      CURSOR c_portfoliotrunc
      IS
         SELECT dateofconclusion d1, duedatefirstcontract d2
           FROM cm_portfolio
          WHERE ID = p_id;

      CURSOR c_begininfo
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history
          WHERE creditid = p_id AND hdate = p_bdate;

      CURSOR c_endinfo
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history
          WHERE creditid = p_id AND hdate = p_edate;

      CURSOR c_paymentinfo
      IS
         SELECT NVL (SUM (i.payedamt), 0) amtmain,
                NVL (SUM (i.payedintamt), 0) amtint,
                NVL (SUM (i.payeddueamt), 0) amtduemain,
                NVL (SUM (i.payeddueintamt), 0) amtdueint
           FROM cm_payments i
          WHERE creditid = p_id
            AND paydate between p_bdate and p_edate;

      CURSOR c_trchinfo
      IS
         SELECT NVL (SUM (trancheamount), 0) trchamt
           FROM cm_tranches
          WHERE creditid = p_id
            AND tranchedate between p_bdate and p_edate;

      begininfo      c_begininfo%ROWTYPE;
      endinfo        c_endinfo%ROWTYPE;
      paymentinfo    c_paymentinfo%ROWTYPE;
      trchinfo       c_trchinfo%ROWTYPE;
      portfoliotrunc c_portfoliotrunc%rowtype;
      montrunc       integer;
   BEGIN
      OPEN c_begininfo;
      FETCH c_begininfo INTO begininfo;
      CLOSE c_begininfo;
      OPEN c_endinfo;
      FETCH c_endinfo INTO endinfo;
      CLOSE c_endinfo;
      OPEN c_paymentinfo;
      FETCH c_paymentinfo INTO paymentinfo;
      CLOSE c_paymentinfo;
      OPEN c_trchinfo;
      FETCH c_trchinfo INTO trchinfo;
      CLOSE c_trchinfo;
      open c_portfoliotrunc;
      fetch c_portfoliotrunc into portfoliotrunc;
      close c_portfoliotrunc;

      montrunc := Trunc(Months_Between(portfoliotrunc.d2, portfoliotrunc.d1));
      
      INSERT INTO cm_report_sd1
           VALUES (p_id, 
                   NVL (begininfo.rest, 0),
                   NVL (begininfo.interestrest, 0),
                   NVL (begininfo.duerest, 0),
                   NVL (begininfo.dueinterestrest, 0),
                   NVL (paymentinfo.amtmain, 0), 
                   NVL (paymentinfo.amtint, 0),
                   NVL (paymentinfo.amtduemain, 0),
                   NVL (paymentinfo.amtdueint, 0), 
                   NVL (trchinfo.trchamt, 0),
                   NVL (endinfo.rest, 0), 
                   NVL (endinfo.interestrest, 0),
                   NVL (endinfo.duerest, 0),
                   NVL (endinfo.dueinterestrest, 0),
                   montrunc);
   END;

PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
IS
   CURSOR c_crd_info
   IS
      SELECT d.ID districtid, d.NAME district, v.ID villageid,
             v.NAME village, t.ID typeid, t.typedesc, m.ID purposeid,
             m.NAME purpose, f.ID branchid, f.NAME branch,
             p.numberofcredit crdnum, p.boorowerid, i.NAME boorowername
        FROM cm_business_plan b,
             agro_region d,
             agro_village v,
             cm_bp_types t,
             agro_kredit_purpose m,
             sb_filial f,
             cm_portfolio p,
             cm_boorowerinfo i
       WHERE v.depend_id = d.ID
         AND b.villageid = v.ID
         AND b.TYPE = t.ID
         AND b.akpurpose = m.ID
         AND b.creditid = p.ID
         AND p.branchid = f.ID
         AND p.ID = i.creditid
         AND p.ID = p_id;

   CURSOR c_min_date
   IS
      SELECT MIN (tranchedate) trdate
        FROM cm_tranches
       WHERE creditid = p_id;

   CURSOR c_max_date
   IS
      SELECT MAX (paydate) paydate
        FROM cm_payments
       WHERE creditid = p_id;

   CURSOR c_histinfo
   IS
      SELECT rest, interestrest, duerest, dueinterestrest
        FROM cm_history
       WHERE creditid = p_id
         AND hdate = p_edate;

   CURSOR c_amount
   IS
      SELECT sum(trancheamount) amt
        FROM cm_tranches
       WHERE creditid = p_id
         AND tranchedate < p_edate;       
         
   CURSOR c_payinfo_month
   IS
      SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt
        FROM cm_payments
       WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

   CURSOR c_payinfo
   IS
      SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt,
             SUM (payeddueamt) payeddueamt, SUM (payeddueintamt) payeddueintamt
        FROM cm_payments
       WHERE creditid = p_id AND paydate < p_edate;       
       
   CURSOR c_payplane
   IS
      SELECT sum(principal) principal, sum(interest) interest
        FROM cm_payment_schedule
       WHERE creditid=p_id
         AND paymentdate < p_edate; 
         
   crdinfo c_crd_info%rowtype;
   
   histinfo c_histinfo%rowtype;
   overcount integer;
   
   min_date c_min_date%rowtype;
   max_date c_max_date%rowtype;
   
   amounti c_amount%rowtype;
   
   payplaneinfo c_payplane%rowtype;
   
   payinfo c_payinfo%rowtype;
   payinfo_month  c_payinfo_month%rowtype;   
BEGIN
   OPEN c_crd_info;
   FETCH c_crd_info INTO crdinfo;
   CLOSE c_crd_info;
   
   OPEN c_histinfo;
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo; 
   
   if (    (histinfo.rest = 0)
       AND (histinfo.interestrest = 0) 
       AND (histinfo.duerest = 0) 
       AND (histinfo.dueinterestrest = 0)
      ) then
     overcount := 0;  
   else
     overcount := 1;
   end if;
   
   OPEN c_min_date;
   FETCH c_min_date INTO min_date;
   CLOSE c_min_date;    
      
   OPEN c_max_date;
   FETCH c_max_date INTO max_date;
   CLOSE c_max_date;
   
   OPEN c_amount;
   FETCH c_amount INTO amounti;
   CLOSE c_amount;    

   OPEN c_payplane;
   FETCH c_payplane INTO payplaneinfo;
   CLOSE c_payplane;    

   OPEN c_payinfo;
   FETCH c_payinfo INTO payinfo;
   CLOSE c_payinfo;

   OPEN c_payinfo_month;
   FETCH c_payinfo_month INTO payinfo_month;
   CLOSE c_payinfo_month;    
       

   INSERT INTO cm_report_f1
        VALUES (
          p_id,
          nvl(crdinfo.boorowerid, 0),
          nvl(crdinfo.crdnum, ''),
          nvl(crdinfo.boorowername, ''),
          nvl(crdinfo.branchid, 0),
          nvl(crdinfo.branch, ''),
          nvl(crdinfo.districtid, 0),
          nvl(crdinfo.district, ''),
          nvl(crdinfo.villageid, 0),
          nvl(crdinfo.village, ''),
          nvl(crdinfo.purposeid, 0),
          nvl(crdinfo.purpose, ''),
          nvl(crdinfo.typeid, 0),
          nvl(crdinfo.typedesc, ''),
          1,
          overcount,
          nvl(min_date.trdate, SYSDATE),
          nvl(max_date.paydate, SYSDATE),
          nvl(amounti.amt, 0),
          nvl(payplaneinfo.interest, 0),
          nvl(payplaneinfo.principal, 0),
          nvl(payplaneinfo.interest, 0),
          nvl(payinfo.payedamt, 0) + nvl(payinfo.payeddueamt, 0),
          nvl(payinfo.payedintamt, 0) + nvl(payinfo.payeddueintamt, 0),
          nvl(payinfo_month.payedamt, 0),
          nvl(payinfo_month.payedintamt, 0),
          nvl(histinfo.rest, 0) + nvl(histinfo.duerest, 0),
          nvl(histinfo.interestrest, 0) + nvl(histinfo.dueinterestrest, 0),
          nvl(histinfo.Duerest, 0),
          nvl(histinfo.dueinterestrest, 0)
        );
END;

END;
/



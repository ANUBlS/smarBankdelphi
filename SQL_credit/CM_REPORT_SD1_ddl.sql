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
    crdperiod                      NUMBER(10,0) DEFAULT 0  NOT NULL)
ON COMMIT DELETE ROWS
/
CREATE OR REPLACE 
PACKAGE cm_ak_reports
  IS
  PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
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
            AND paydate BETWEEN p_bdate AND p_edate;

      CURSOR c_trchinfo
      IS
         SELECT NVL (SUM (trancheamount), 0) trchamt
           FROM cm_tranches
          WHERE creditid = p_id
            AND tranchedate BETWEEN p_bdate AND p_edate;

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
           VALUES (p_id, NVL (begininfo.rest, 0),
                   NVL (begininfo.interestrest, 0),
                   NVL (begininfo.duerest, 0),
                   NVL (begininfo.dueinterestrest, 0),
                   NVL (paymentinfo.amtmain, 0), NVL (paymentinfo.amtint, 0),
                   NVL (paymentinfo.amtduemain, 0),
                   NVL (paymentinfo.amtdueint, 0), NVL (trchinfo.trchamt, 0),
                   NVL (endinfo.rest, 0), NVL (endinfo.interestrest, 0),
                   NVL (endinfo.duerest, 0),
                   NVL (endinfo.dueinterestrest, 0),
                   montrunc);
   END;
END;
/


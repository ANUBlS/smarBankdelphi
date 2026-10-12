CREATE GLOBAL TEMPORARY TABLE smart.sb_business_proc_trans
    (trid                           NUMBER,
    debitaccid                     NUMBER NOT NULL,
    creditaccid                    NUMBER NOT NULL,
    debitamount                    NUMBER,
    creditamount                   NUMBER,
    natamount                      NUMBER,
    flags                          NUMBER,
    optype                         NUMBER,
    inbalancechar                  NUMBER,
    outbalancechar                 NUMBER,
    trdate                         DATE NOT NULL,
    trdescription                  VARCHAR2(255) NOT NULL,
    canprocess                     NUMBER,
    reportid                       NUMBER,
    countrid                       NUMBER,
    parenttrid                     NUMBER)
ON COMMIT DELETE ROWS
/
CREATE TABLE smart.sb_business_proc_tarifs
    (id                             NUMBER NOT NULL,
    groupid                        NUMBER,
    bpchildid                      NUMBER NOT NULL,
    minamt                         NUMBER(20,2),
    maxamt                         NUMBER(20,2),
    amtpercent                     NUMBER,
    amtvalue                       NUMBER(20,2))
/
ALTER TABLE smart.sb_business_proc_tarifs
ADD CONSTRAINT pk_sb_business_proc_tarifs PRIMARY KEY (id)
USING INDEX
/



CREATE OR REPLACE TRIGGER smart.bi_sb_business_proc_tarifs
 BEFORE
  INSERT
 ON smart.sb_business_proc_tarifs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select nvl (max (id), 0) + 1
     into :new.id
     from sb_business_proc_tarifs;
end;
/

CREATE TABLE smart.sb_business_proc_childs
    (id                             NUMBER(*,0) NOT NULL,
    parentid                       NUMBER(*,0) NOT NULL,
    userid                         NUMBER(*,0) NOT NULL,
    branchid                       NUMBER(*,0) NOT NULL,
    debt                           NUMBER(10,0) DEFAULT -1,
    kredit                         NUMBER(10,0) DEFAULT -2

 ,
    kassa_b                        NUMBER(5,0),
    kassa_z                        NUMBER(5,0),
    name                           VARCHAR2(255),
    reportid                       NUMBER(10,0),
    countrid                       NUMBER(10,0),
    operid                         NUMBER)
/
ALTER TABLE smart.sb_business_proc_childs
ADD CONSTRAINT pk_sb_business_proc_childs PRIMARY KEY (id)
USING INDEX
/


CREATE OR REPLACE TRIGGER smart.bi_sb_business_proc_childs
 BEFORE
  INSERT
 ON smart.sb_business_proc_childs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select nvl (max (id), 0) + 1, uid, sb_aca.getuserfilial (uid)
     into :new.id, :new.userid, :new.branchid
     from sb_business_proc_childs;

   select count (*) + 1
     into :new.operid
     from sb_business_proc_childs
    where parentid = :new.parentid;
end;
/

CREATE TABLE smart.sb_business_processes
    (id                             NUMBER(*,0) NOT NULL,
    name                           VARCHAR2(127) NOT NULL)
/
ALTER TABLE smart.sb_business_processes
ADD CONSTRAINT pk_sb_business_processes PRIMARY KEY (id)
USING INDEX
/

CREATE OR REPLACE TRIGGER smart.bi_sb_business_processes
 BEFORE
  INSERT
 ON smart.sb_business_processes
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select nvl(max(id),0)+1 into :new.id from sb_business_processes ;
end;
/

ALTER TABLE smart.sb_business_proc_tarifs
ADD CONSTRAINT fk_sb_b_proc_tarifs_group FOREIGN KEY (groupid)
REFERENCES SMART.qrp_klie (id) ON DELETE CASCADE
/
ALTER TABLE smart.sb_business_proc_tarifs
ADD CONSTRAINT fk_sb_proc_tarifs_child FOREIGN KEY (bpchildid)
REFERENCES SMART.sb_business_proc_childs (id) ON DELETE CASCADE
/
ALTER TABLE smart.sb_business_proc_childs
ADD CONSTRAINT fk_sb_business_proc_parent FOREIGN KEY (parentid)
REFERENCES SMART.sb_business_processes (id)
/
CREATE OR REPLACE VIEW smart.sb_bproc_acc (
   id,
   acc_no,
   name )
AS
select   -1 id, ' (D)' acc_no, 'Debet hesab' name
    from dual
union
select   -2 id, ' (K)' acc_no, 'Kredit hesab' name
    from dual
union
select   id, acc_no, name
    from account partition (activacc)
order by 2
/
CREATE OR REPLACE 
PACKAGE smart.p_business_proc
is
  function getaccountgroup (accid number)
      return number;
  function bprocadd (pnam varchar2)
      return number;
  procedure bprocupd (pid number, pnam varchar2);
  procedure bprocdel (pid number);
  function bpchildadd (
      pparentid   number,
      pdebt       number,
      pkredit     number,
      pkassa_b    number,
      pkassa_z    number,
      pname       varchar2,
      preportid   number,
      pcountrid   number
   )
      return number;
  procedure bpchildupd (
      pid         number,
      pparentid   number,
      pdebt       number,
      pkredit     number,
      pkassa_b    number,
      pkassa_z    number,
      pname       varchar2,
      preportid   number,
      pcountrid   number
   );
  procedure bpchilddel (
      pid         number
   );
  procedure execbprocess (
      procid         number,
      debtaccid      number,
      credaccid      number,
      debtamount     number,
      credamount     number,
      equivamount    number,
      inbalchar      number,
      outbalchar     number,
      tdescription   varchar2,
      trreportid     number,
      trcountrid     number
   );
  procedure commitprocs;
end;
/

CREATE OR REPLACE 
PACKAGE BODY smart.p_business_proc
is
   function getaccountgroup (accid number)
      return number
   is
      res   number;
   begin
      select group_klie
        into res
        from customers
       where id = (select kli_id
                     from account
                    where id = accid);

      return res;
   exception
      when no_data_found
      then
         return -1;
   end;

   function bprocadd (pnam varchar2)
      return number
   is
      res   number;
   begin
      insert into sb_business_processes
                  (name
                  )
           values (pnam
                  )
        returning id
             into res;

      return res;
   end;

   procedure bprocupd (pid number, pnam varchar2)
   is
   begin
      update sb_business_processes
         set name = pnam
       where id = pid;
   end;

   procedure bprocdel (pid number)
   is
   begin
      delete from sb_business_processes
            where id = pid;
   end;

   function bpchildadd (
      pparentid   number,
      pdebt       number,
      pkredit     number,
      pkassa_b    number,
      pkassa_z    number,
      pname       varchar2,
      preportid   number,
      pcountrid   number
   )
      return number
   is
      res   number;
   begin
      insert into sb_business_proc_childs
                  (parentid, debt, kredit, kassa_b,
                   kassa_z, name, reportid, countrid
                  )
           values (pparentid, pdebt, pkredit, pkassa_b,
                   pkassa_z, pname, preportid, pcountrid
                  )
        returning id
             into res;

      return res;
   end;

   procedure bpchildupd (
      pid         number,
      pparentid   number,
      pdebt       number,
      pkredit     number,
      pkassa_b    number,
      pkassa_z    number,
      pname       varchar2,
      preportid   number,
      pcountrid   number
   )
   is
   begin
      update sb_business_proc_childs
         set parentid = pparentid,
             debt = pdebt,
             kredit = pkredit,
             kassa_b = pkassa_b,
             kassa_z = pkassa_z,
             name = pname,
             reportid = preportid,
             countrid = pcountrid
       where id = pid;
   end;

   procedure bpchilddel (pid number)
   is
   begin
      delete from sb_business_proc_childs
            where id = pid;
   end;

   procedure execbprocess (
      procid         number,
      debtaccid      number,
      credaccid      number,
      debtamount     number,
      credamount     number,
      equivamount    number,
      inbalchar      number,
      outbalchar     number,
      tdescription   varchar2,
      trreportid     number,
      trcountrid     number
   )
   is
      cursor c_childs
      is
         select   debt, kredit, kassa_b, kassa_z, name,
                  reportid, countrid, operid, id
             from sb_business_proc_childs
            where parentid = procid
         order by operid;

      cursor c_tarif (chld number, operid number, amnt number)
      is
         select decode (amtpercent,
                        null, amtvalue,
                        amtpercent * amnt/100
                       ) val
           from sb_business_proc_tarifs
          where amnt between minamt and maxamt and bpchildid = chld;
      --groupid = p_business_proc.getaccountgroup (accid)
      
      parid    number;
      trid     number;
      tekdat   date;
      tarif    c_tarif%rowtype;
   begin
      select tek_dat
        into tekdat
        from sysdat;

        insert into sb_business_proc_trans
                    (trid, debitaccid, creditaccid, debitamount,
                     creditamount, natamount, inbalancechar, outbalancechar, trdate, trdescription,
                     reportid, countrid
                    )
             values (tr_seg_provarch.nextval, debtaccid, credaccid, debtamount,
                     credamount, equivamount, inbalchar, outbalchar, tekdat, tdescription,
                     trreportid, trcountrid
                    )
          returning trid
               into trid;

      for tr in c_childs
      loop

         open c_tarif (tr.id, tr.operid, equivamount);

         fetch c_tarif
          into tarif;

         close c_tarif;

      insert into sb_business_proc_trans
                  (trid, debitaccid, creditaccid, debitamount,
                   creditamount, natamount, inbalancechar, outbalancechar, trdate,
                   trdescription, reportid, countrid, parenttrid
                  )
           values (tr_seg_provarch.nextval
                 , decode(tr.debt, -1, debtaccid, -2, credaccid, tr.debt)
                 , decode(tr.kredit, -1, debtaccid, -2, credaccid, tr.kredit)
                 , null
                 , null
                 , tarif.val
                 , nvl(tr.kassa_b,inbalchar)
                 , nvl(tr.kassa_z,outbalchar)
                 , tekdat
                 , nvl(tr.name,tdescription) --||' ('||trid||')'
                 , nvl(tr.reportid,trreportid)
                 , nvl(tr.countrid,trcountrid)
                 , trid
                  );
      end loop;
   end;

    procedure commitprocs
    is
       cursor c1
       is
          select trid, debitaccid, creditaccid, debitamount, creditamount,
                 natamount, flags, optype, inbalancechar, outbalancechar, trdate, trdescription,
                 canprocess, reportid, countrid, parenttrid
            from sb_business_proc_trans;

       r   number;
    begin
       for z in c1
       loop
          r :=
             sb_transaction.transaction_add (debitid              => z.debitaccid,
                                             creditid             => z.creditaccid,
                                             debitamount          => z.debitamount,
                                             creditamount         => z.creditamount,
                                             lamount              => z.natamount,
                                             debitrate            => null,
                                             creditrate           => null,
                                             trname               => z.trdescription,
                                             flags                => 0,
                                             transactionid        => z.trid,
                                             parentid             => z.parenttrid,
                                             transactiondate      => z.trdate,
                                             inbalancechar        => z.inbalancechar,
                                             outbalancechar        => z.outbalancechar
                                            );
       end loop;
       commit work;
    end;
end;
/


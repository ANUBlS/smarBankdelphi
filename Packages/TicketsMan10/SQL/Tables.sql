create sequence seq_tm_settings start with 5 nocache
/
create sequence seq_tm_archive start with 21 nocache
/
CREATE TABLE tm_archive
    (id                             NUMBER NOT NULL,
    pdate                          DATE,
    pnum                           NUMBER,
    dbankfilial                    NUMBER,
    dacc_no                        VARCHAR2(50),
    daccname                       VARCHAR2(300),
    daccinn                        VARCHAR2(15),
    kbankfilial                    NUMBER,
    kacc_no                        VARCHAR2(50),
    kaccname                       VARCHAR2(300),
    kaccinn                        VARCHAR2(15),
    ammount                        NUMBER,
    description                    VARCHAR2(500),
    information                    VARCHAR2(500),
    userid                         NUMBER,
    status                         NUMBER DEFAULT 0

  NOT NULL)
/
ALTER TABLE tm_archive
ADD CONSTRAINT pk_tm_archive PRIMARY KEY (id)
USING INDEX
/
CREATE OR REPLACE TRIGGER trg_tm_archive
 BEFORE
  INSERT
 ON tm_archive
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
   select seq_tm_archive.nextval, UID, filialid
     into :new.id, :new.userid, :new.dbankfilial
     from sba_objinf
    where obj = user;

   select NVL (max (s.id), 1) statusid
     into :new.status
     from smart.tm_status s, sba_advanced_grants g, sba_usergrants_advanced a
    where s.privname = g.grantname
      and g.id = a.advancedgrantid
      and username = user;
end;
/
CREATE TABLE tm_report_settings
    (id                             NUMBER(*,0) NOT NULL,
    reportname                     VARCHAR2(100),
    lblabel                        VARCHAR2(2),
    lbtitle                        VARCHAR2(50),
    lbdescr                        VARCHAR2(255),
    lbbnumb                        VARCHAR2(20),
    formatdat                      VARCHAR2(20) DEFAULT 'dd/mm/yyyy'
 )
/
ALTER TABLE tm_report_settings
ADD CONSTRAINT pk_settingsid PRIMARY KEY (id)
USING INDEX
/
ALTER TABLE tm_report_settings
ADD CONSTRAINT uk_settingsname UNIQUE (reportname)
USING INDEX
/
CREATE OR REPLACE TRIGGER trg_tm_settings
 BEFORE
  INSERT
 ON tm_report_settings
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tm_settings.nextval into :new.id from dual;
end;
/
CREATE TABLE tm_status
    (id                             NUMBER(*,0) NOT NULL,
    privname                       VARCHAR2(30),
    privdesc                       VARCHAR2(30))
/
ALTER TABLE tm_status
ADD CONSTRAINT pk_tm_privid PRIMARY KEY (id)
USING INDEX
/
CREATE OR REPLACE TRIGGER bi_tm_priv
 BEFORE
  INSERT
 ON tm_status
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tm_priv.nextval
    into :new.id
    from dual;
end;
/
CREATE TABLE tm_userprivs
    (username                       VARCHAR2(30),
    privid                         NUMBER(*,0) NOT NULL)
/
ALTER TABLE tm_archive
ADD CONSTRAINT fk_archive_status FOREIGN KEY (status)
REFERENCES tm_status (id) ON DELETE CASCADE
/
ALTER TABLE tm_userprivs
ADD CONSTRAINT fk_tm_userprivid FOREIGN KEY (privid)
REFERENCES tm_status (id)
/
alter trigger TRG_TM_ARCHIVE disable
/
alter trigger TRG_TM_SETTINGS disable
/
INSERT INTO tm_report_settings
VALUES
(1,'Гиймятли каьызларын алынмасы','ХШ','Гиймятли каьызларын алынмасы','Юдянишин тяйинаты вя ясас:','ХШ №__','dd/mm/yyyy')
/
INSERT INTO tm_report_settings
VALUES
(2,'Инзибати хяржляр','МШ','Инзибати хяржляр','Юдянишин тяйинаты вя ясас: ________тар.__№-ли щесаба вя ______тар.__№-ли мцгавиляйя ясасян _______алынмасы цчцн юдянилир','МШ №__','dd/mmm/yyyy')
/
INSERT INTO tm_report_settings
VALUES
(3,'Юдяниш тапшырыьы','МШ','Юдяниш тапшырыьы','Юдянишин тяйинаты вя ясас: ________тар.__№-ли щесаба вя ______тар.__№-ли мцгавиляйя ясасян _______алынмасы цчцн юдянилир','МШ №__','dd/mm/yyyy')
/
INSERT INTO tm_status
VALUES
(2,'TICKETMANDEPOSCHIEF','Хязинядарлыг шюбясинин ряиси')
/
INSERT INTO tm_status
VALUES
(3,'TICKETMANEXECASSIST','Ижрачы директорун мцавини')
/
INSERT INTO tm_status
VALUES
(4,'TICKETMANEXECCHIEF','Ижрачы директор')
/
INSERT INTO tm_status
VALUES
(5,'TICKETMANACC','Щесаблашмалар шюбяси')
/
INSERT INTO tm_status
VALUES
(6,'TICKETCOMMITED','Tam tясдиглянмиш')
/
INSERT INTO sba_advanced_grants
VALUES
(56,'TICKETMANDEPOSWORKER','Access denied. Only depository worker can commit this operation! ',361,'Хязинядарлыг шюбясини ишчиси')
/
INSERT INTO sba_advanced_grants
VALUES
(57,'TICKETMANDEPOSCHIEF','Access denied. Only depository chief can commit this operation! ',361,'Хязинядарлыг шюбясини ряиси')
/
INSERT INTO sba_advanced_grants
VALUES
(58,'TICKETMANEXECASSIST','Access denied. Only executive chief assistant can commit this operation!',361,'Ижрачы директорорун мцавини')
/
INSERT INTO sba_advanced_grants
VALUES
(59,'TICKETMANEXECCHIEF','Access denied. Only executive chief can commit this operation!',361,'Ижрачы директор')
/
INSERT INTO sba_advanced_grants
VALUES
(60,'TICKETMANACC','Access denied. Only accountancy department can commit this operation!',361,'Щесаблашмалар шюбяси')
/
alter trigger TRG_TM_ARCHIVE enable
/
alter trigger TRG_TM_SETTINGS enable
/
CREATE OR REPLACE VIEW sba_tm_archive 
AS
select a.id, to_date(pdate) pdate, pnum, dbankfilial, to_char(i.kod_b) dbankcode, i.az_name dbankname,
       i.inn dbankinn, i.swift dbankswift, to_char(i.krno) dbankkacc, dacc_no,
       daccname, daccinn, kbankfilial, to_char(b.bankcode) kbankcode, b.name kbankname,
       b.inn kbankinn, b.swift kbankswift, to_char(b.krno) kbankkacc,
       b.subkrno kbanksubkacc, kacc_no, kaccname, kaccinn, ammount,
       description, information, userid, a.status
  from tm_archive a, bankinfo_t i, bankm b
 where     a.dbankfilial = i.kod_fil
       and b.id = a.kbankfilial
       and ((not exists (select suser from sba_userman where muser = UID and (type# = 2 or type# = 0)))
         or (userid in (select suser from sba_userman where muser = UID and (type# = 2 or type# = 0))))
/

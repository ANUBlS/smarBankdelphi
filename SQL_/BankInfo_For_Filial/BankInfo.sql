create table bankinfo_t as
select
    b.kod_b, b.bank, b.az_name, b.krno, b.inn,
    b.seher, b.adress, b.sedr, b.buhaltr, b.tel, 
    b.fax, b.swift, b.telex, b.email, b.post_in, 
    f.id kod_fil,
    b.filial, b.adres_fil, b.tel_fil, b.fax_fil,
    b.swift_fil, b.telex_fil, b.postin_fil,
    b.seher_fil, b.inn_fil, b.krno_fil, b.sedrfil,
    b.buhal_fil, b.kod_bfil, b.nb,
    b.val_mov, b.logo, b.link, b.sdv, b.svm,
    b.bf, b.managertitle, b.accountanttitle,
    b.svm_currencyid, b.capital
from bankinfo b,filial f;

drop table bankinfo;

CREATE OR REPLACE VIEW bankinfo AS
select * from bankinfo_t where kod_fil=
(select filialid from sba_objinf where obj=(select user from dual));
/

ALTER TABLE bankinfo_t
ADD CONSTRAINT fk_bankinfo_filial FOREIGN KEY (kod_fil)
REFERENCES filial (id) ON DELETE CASCADE;
/
drop table filialinfo;
/ 

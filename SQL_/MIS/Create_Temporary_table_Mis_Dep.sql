drop table Mis_Dep;
/ 
CREATE GLOBAL TEMPORARY TABLE Mis_Dep
(
 OnDate date,
 Type varchar(32),
 val_name varchar(6),
 Ostat Number(15,2),
 Obr_d Number(15,2),
 Obr_k Number(15,2),
 Sayi integer,
 Daxil integer,
 Cixish integer
)
--ON COMMIT DELETE ROWS
 ON COMMIT PRESERVE ROWS;







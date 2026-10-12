INSERT INTO &&table_name
VALUES
(101,'Kochurme',' select id_, name_, Debet_sum from  (Select c.id id_, c.name name_, sum(pr.LAMMOUNT) Debet_sum from customers c, account a, provarch pr where (pr.dat between :BEGDATE and :ENDDATE)      and pr.debt=a.id and pr.debt in (select id from account where  (bal_cn1 like ''%'' )  )  and pr.kredit in (select id from account where  (bal_cn1 like ''%'' )  )       and a.kli_id=c.id group by c.id, c.name order by Debet_Sum) where (debet_sum>0) order by Debet_sum')
/
INSERT INTO &&table_name
VALUES
(102,'Konvertasiya',' select id_, name_, Debet_sum from  (Select c.id id_, c.name name_, sum(pr.LAMMOUNT) Debet_sum from customers c, account a, provarch pr where (pr.dat between :BEGDATE and :ENDDATE)      and pr.debt=a.id and pr.debt in (select id from account where  (bal_cn1 like ''%'' )  )  and pr.kredit in (select id from account where  (bal_cn1 like ''%'' )  )       and a.kli_id=c.id and (pr.val_acc<>pr.CURRENCYID_C)  and (pr.vid_op not in ( 2) ) group by c.id, c.name order by Debet_Sum) where (debet_sum>0) order by Debet_sum')
/
INSERT INTO &&table_name
VALUES
(103,'salam',' select id_, name_, Debet_sum from  (Select c.id id_, c.name name_, sum(pr.LAMMOUNT) Debet_sum from customers c, account a, provarch pr where (pr.dat between :BEGDATE and :ENDDATE)      and pr.debt=a.id and pr.debt in (select id from account where  (bal_cn1 like ''%'' )  )  and pr.kredit in (select id from account where  (bal_cn1 like ''%'' )  )       and a.kli_id=c.id group by c.id, c.name order by Debet_Sum) where (debet_sum>30000) order by Debet_sum')
/
INSERT INTO &&table_name
VALUES
(104,'sagol',' select id_, name_, Debet_sum from  (Select c.id id_, c.name name_, sum(pr.LAMMOUNT) Debet_sum from customers c, account a, provarch pr where (pr.dat between :BEGDATE and :ENDDATE)      and pr.debt=a.id and pr.debt in (select id from account where  (bal_cn1 like ''%'' )  )  and pr.kredit in (select id from account where  (bal_cn1 like ''%'' )  )       and a.kli_id=c.id group by c.id, c.name order by Debet_Sum) where (debet_sum>40000) order by Debet_sum')
/
INSERT INTO &&table_name
VALUES
(121,'11',' select id_, name_, Debet_sum from  (Select c.id id_, c.name name_, sum(pr.LAMMOUNT) Debet_sum from customers c, account a, provarch pr where (pr.dat between :BEGDATE and :ENDDATE)      and pr.debt=a.id and pr.debt in (select id from account where  (bal_cn1 like ''3%'' )  )  and pr.kredit in (select id from account where  (bal_cn1 like ''5%'' )  )       and a.kli_id=c.id group by c.id, c.name order by Debet_Sum) where (debet_sum>0) order by Debet_sum')
/

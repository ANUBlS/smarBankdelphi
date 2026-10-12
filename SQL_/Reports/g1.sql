select bal_cn1,balname, Rest
 from (
  select bal_cn1,balname, 0 - (sum(decode(Rest1, null, 0, Rest1)-decode(Rest2, null, 0, Rest2))) as Rest
  from (
    select
      a.bal_cn1,
      b.balname,
      (
        select sum(lammount) as rest from provarch
        where
          --(dat between :BegDate and :EndDate) and
           (debt = a.ID)
          and (kredit in (select ID from Account_Inc where bal_cn1 <> 5501))
      ) as Rest1,
      (
        select sum(lammount) as rest from provarch
        where
--          (dat between :BegDate and :EndDate) and
           (debt in (select ID from Account_Inc where bal_cn1 <> 5501)
          )
          and (kredit = a.ID)
      ) as Rest2
    from
      Account_Inc a,
      bal_spr1 b
    where
      (a.bal_cn1 between 6000 and 9999)
--      and a.Filial = :FilialCode
      and b.bal_cn=a.bal_cn1
  )
  group by bal_cn1,balname
)
  where (bal_cn1 < 8000) and (Rest <>0)
--__________________________________________________________________________


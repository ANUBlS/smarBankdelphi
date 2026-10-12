
update sbcm_contracts c
set c.personaltype= (select id from sbcm_persons
 where name=(select TRUECATEGORY from sbcm_categories
 where id=(select clienttype from sbcm_contracts where id=c.id)))--sbcm_stored_programs.Get_DepositCat(id)
where type# in(3,4);

update sbcm_contracts c
set c.currency= sbcm_stored_programs.GetContractCurrency(c.id)--sbcm_stored_programs.Get_DepositCat(id)
where type# in(3,4);

update sbcm_contracts a
set a.branchid = (select filial from account where id in
(select contractaccid from sbcm_contract_accounts where id#=a.id)) 



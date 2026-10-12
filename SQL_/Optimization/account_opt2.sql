Select * from accounts where
(not EXISTS(select SUSER from userman where MUSER=0 and (type#=2 or type#=0)))
or 
(op_id in(select SUSER from userman where MUSER=0 and (type#=2 or type#=0)))



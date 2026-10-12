update cm_visible_fields
  set UserID = (select USER# from SYS.USER$ where NAME=USER )
-- where UserID =:UserID
/
Commit
/  

--update customers c set  op_id=(select tempid from user2 where oldid=c.op_id);
--update customers c set  op_id=(select newid from user2 where tempid=c.op_id);
--update account c set  op_id=(select tempid from user2 where oldid=c.op_id);
--update account c set  op_id=(select newid from user2 where tempid=c.op_id);
update provarch c set  op_id=(select tempid from user2 where oldid=c.op_id);
update provarch c set  op_id=(select newid from user2 where tempid=c.op_id);


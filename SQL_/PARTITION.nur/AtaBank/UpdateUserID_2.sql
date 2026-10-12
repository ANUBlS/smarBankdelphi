--update customers c set  op_id=(select tempid from user2 where oldid=c.op_id);
--update customers c set  op_id=(select newid from user2 where tempid=c.op_id);
--update account c set  op_id=(select tempid from user2 where oldid=c.op_id);
--update account c set  op_id=(select newid from user2 where tempid=c.op_id);
update provarch c set  op_id=(select tempid from user2 where oldid=c.op_id)
where dat between '2-Jun-2003' and '30-Jun-2003';
commit;
update provarch c set  op_id=(select newid from user2 where tempid=c.op_id)
where dat between '2-Jun-2003' and '30-Jun-2003';
commit;


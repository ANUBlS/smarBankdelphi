INSERT INTO cm_visible_fields (seqno, fieldname, frozen, userid, visible, id, fielddesc) 
SELECT seqno, fieldname, frozen, 230, visible, id, fielddesc
  FROM cm_fields_list
/  

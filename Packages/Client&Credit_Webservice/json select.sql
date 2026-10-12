SELECT jt.*
FROM websrv_client_creditit_infoes ,
JSON_TABLE(data, '$.ClientInfo[*]'

COLUMNS (row_number FOR ORDINALITY,
         Name VARCHAR2(10) PATH '$.Name',
         LastName VARCHAR2(20) PATH '$.LastName',
         Patronimic VARCHAR2(20) PATH   '$.Patronimic'
         
         
         )
       
         )
AS jt 


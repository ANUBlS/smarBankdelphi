SELECT jt.*
FROM websrv_client_creditit_infoes ,
JSON_TABLE(data, '$'

COLUMNS (row_number FOR ORDINALITY,
         Name VARCHAR2(10) PATH '$.ClientInfo.Name',
         LastName VARCHAR2(20) PATH '$.ClientInfo.LastName',
         Patronimic VARCHAR2(20) PATH   '$.ClientInfo.Patronimic',
        /* NESTED PATH '$.ClientInfo.Relatives[*]'
         COLUMNS( phone_type VARCHAR2(10) PATH '$.RLDesc',
         phone_num VARCHAR2(20) PATH '$.LastName'),*/
         
         
         NESTED PATH '$.ClientInfo.CreditInfo.Guarantors[*]'
         COLUMNS( guarontorName VARCHAR2(10) PATH '$.Name',
         guarontorLName VARCHAR2(20) PATH '$.LastName')
         
         )
       
         )
AS jt 

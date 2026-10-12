SELECT jt.*
FROM websrv_client_creditit_infoes ,
JSON_TABLE(data, '$.ClientInfo.CreditInfo.Guarantors[*]'
COLUMNS (row_number FOR ORDINALITY,
         phone_type VARCHAR2(10) PATH '$.Name',
         phone_num VARCHAR2(20) PATH '$.LastName')) 
AS jt 



DECLARE
v_User number;
v_filial number;
v_baltype NUMBER;
v_currency NUMBER;
v_kli_id VARCHAR2(32767);
v_acc_no VARCHAR2(32767);
v_bal_cn VARCHAR2(32767);
v_date_beg DATE;
v_date_end DATE;

BEGIN
  v_filial :=0;
  v_baltype := 1;
  v_currency := -1;
  v_kli_id := '-1'; --'122'
  v_acc_no :=  '''-1''';--' ''4414001012930300'', ''3803201'' '; --id=83
  v_bal_cn := '1001'; --'-1';
  v_date_beg := '29-jul-2004';
  v_date_end := '29-jul-2004';
  v_user:=137;

-- Now call the stored program
  p_extraction.getextraction(v_user,v_filial,v_baltype,v_currency,v_kli_id,v_acc_no,v_bal_cn,v_date_beg,v_date_end,0,0);
--  Sb_extraction.getextraction(v_baltype,v_currency,v_kli_id,v_acc_no,v_bal_cn,v_date_beg,v_date_end);

--EXCEPTION
--WHEN OTHERS THEN
--  dbms_output.put_line(SubStr('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM, 1, 255));
--RAISE;
END;
/
select * from extraction --where endostat is null


DECLARE
p_creditid INTEGER;
p_date DATE;
p_custaccid INTEGER;
p_maindebt NUMBER;
p_maininterest NUMBER;
p_duedebt NUMBER;
p_dueinterest NUMBER;
p_processtransactions BOOLEAN;
BEGIN
  p_creditid := 1370;
  p_date := '5-Nov-2004';
  p_custaccid := 9502;
  p_maindebt := 0.74;
  p_maininterest := 0;
  p_duedebt := 0;
  p_dueinterest := 0;
  p_processtransactions := TRUE;

-- Now call the stored program
  cm_payment.paymentadd(p_creditid,p_date,p_custaccid,p_maindebt,p_maininterest,p_duedebt,p_dueinterest,p_processtransactions);

EXCEPTION
WHEN OTHERS THEN
  dbms_output.put_line(SubStr('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM, 1, 255));
RAISE;
END;

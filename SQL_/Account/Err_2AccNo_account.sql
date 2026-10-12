--delete from account where id in
--(
SELECT * FROM account A1,
(
SELECT * FROM (
SELECT acc_no,COUNT(acc_no) AS "CO" FROM account GROUP BY acc_no ORDER BY acc_no
) A3 WHERE CO>1
) A2
WHERE A1.acc_no=A2.acc_no --and close_dat is null
--) 

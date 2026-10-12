select count(*) from
(
select * from operkurs partition (today) t, operkurs partition (yesterday) y 
where t.val_kod=y.val_kod and t.ostat<>y.ostat
)
;


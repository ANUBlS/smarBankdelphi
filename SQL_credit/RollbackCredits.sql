delete from cm_history partition (CURR_STATE)
/
update cm_history set PARTITIONKEY = 0
where HDate = (Select tek_Dat from SB_SYSDAT)
/
update cm_history set PARTITIONKEY = 1
where HDate = (Select Pred_Dat from SB_SYSDAT)
/
delete from CM_INTERESTS partition (CURR_STATE)
/
update CM_INTERESTS set PARTITIONKEY = 0
where HDate = (Select tek_Dat from SB_SYSDAT)
/
update CM_INTERESTS set PARTITIONKEY = 1
where HDate = (Select Pred_Dat from SB_SYSDAT)
/


delete from CM_CARDTRCHINTRESTS partition (CURR_STATE)
/
update CM_CARDTRCHINTRESTS set partkey = 0
where HDate = (Select tek_Dat from SB_SYSDAT)
/
update CM_CARDTRCHINTRESTS set partkey = 1
where HDate = (Select Pred_Dat from SB_SYSDAT)
/


delete from CM_CARDTRCHRESTS partition (CURR_STATE)
/
update CM_CARDTRCHRESTS set partkey = 0
where HDate = (Select tek_Dat from SB_SYSDAT)
/
update CM_CARDTRCHRESTS set partkey = 1
where HDate = (Select Pred_Dat from SB_SYSDAT)
/




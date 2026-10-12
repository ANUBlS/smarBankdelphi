SELECT su.username AS slaveuser
  FROM cm_adm_vuserman v, all_users mu, all_users su
 WHERE v.masteruser = mu.user_id
   AND v.slaveuser = su.user_id
   AND mu.username = upper(:MASUSER)


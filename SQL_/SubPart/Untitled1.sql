select /*+ use_hash(t,v) */ * from account a, archost ar where a.id=ar.acc_id



select 
 id
, vid_op V
, dat
, no_doc N
, debt
, kredit
, ammount_d SumD
, ammount_c SumC
, lammount
, name
--, debitNumber
--, CreditNumber
, D_Ostat
, D_Pok_ostat
, C_Ostat
, C_Pok_ostat
 from v_provarch1 
 --temprepairtrans

order by no_doc desc, dat

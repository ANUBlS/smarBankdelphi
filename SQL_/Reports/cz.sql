Select d_bal, sum(amount_d), c_bal, sum(amount_c) 
From GZ
Group By d_bal, c_bal

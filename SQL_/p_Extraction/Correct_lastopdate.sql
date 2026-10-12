declare
NeedDate date; 
OldDate date;
AccNo varchar(32);
begin
AccNo:=''     ; -- Hansi hesabdir onu yazmag
NeedDate:=''  ; -- Hansi Tarixe deyishmek Lazimdir 
OldDate :=''  ; -- Hansi tarixi kosterir (duz olmayan tarix)
update Archost set lastopdate=NeedDate 
 where datdate = OldDate 
  and acc_id= (select id from account where acc_no=AccNo);
end;   

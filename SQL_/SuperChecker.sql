declare 

  cursor c_account is
  select ID, ACC_NO, BAL_CN1
    from account 
   where close_dat is null
   order by acc_no;
     
  cursor c_tenostat(AccID in Integer) is
  select Ostat , Pok_Ostat, Obr_D,Obr_K, Pok_Obr_D,Pok_Obr_K
    from tenostat 
   where acc_ID = AccID;
   
  cursor c_tempost(AccID in Integer) is
  select Ostat , Pok_Ostat
    from tempost
   where acc_ID = AccID;
  
  cursor c_DebitObr(AccID in Integer) is
  select NVL(SUM(AMMOUNT),0) as AmtSum , NVL(SUM(LAMMOUNT),0) as LAmtSum
    from Provdoc
   where debt = AccID; 

  cursor c_CreditObr(AccID in Integer) is
  select NVL(SUM(AMMOUNT_C),0) as AmtSum , NVL(SUM(LAMMOUNT),0) as LAmtSum
    from Provdoc
   where kredit = AccID; 
  
  tpRec   c_tempost%rowtype;
  ttRec   c_tenostat%rowtype;
  
  dObr c_DebitObr%rowtype;
  cObr c_CreditObr%rowtype;
  
  Rst Number := 0;
  PokRst Number := 0;
  TID  integer;
  
begin
  for Accs in c_Account
  loop
  
    open c_tempost(accs.id);
    fetch c_tempost into tpRec;
    close c_tempost;
    
    open c_tenostat(accs.ID);
    fetch c_tenostat into ttRec;
    close c_tenostat;
    
    --- Checking Turnosvers    
    
    open c_DebitObr(accs.ID);
    fetch c_DebitObr into dObr;
    close c_DebitObr;

    open c_CreditObr(accs.ID);
    fetch c_CreditObr into cObr;
    close c_CreditObr;
    
    if dObr.AmtSum <> ttRec.Obr_D then
      dbms_output.put_line(' Acc_NO(OBRD) = '||accs.acc_no);
      --dbms_output.put_line('  ');
    end if;

    if dObr.LAmtSum <> ttRec.Pok_Obr_D then
      dbms_output.put_line(' Acc_NO(POKOBRD) = '||accs.acc_no);
      --dbms_output.put_line('  ');
    end if;

    if cObr.AmtSum <> ttRec.Obr_k then
      dbms_output.put_line(' Acc_NO(OBRk) = '||accs.acc_no);
      --dbms_output.put_line('  ');
    end if;

    if cObr.LAmtSum <> ttRec.Pok_Obr_k then
      dbms_output.put_line(' Acc_NO(POKOBRk) = '||accs.acc_no);
      --dbms_output.put_line('  ');
    end if;
    
    --- Checking Rest in national;
    select typeid into TID 
     from bal_spr1
      where bal_cn = accs.bal_cn1;
    
    if TID = 3 then
      pokrst := 0; -- nUndef
    elsif TID  = 1 then 
      PokRst := ABS(tpRec.Pok_Ostat) + ttRec.Pok_Obr_D - ttRec.Pok_Obr_K - ABS(ttRec.Pok_Ostat); 
      if PokRst <> 0 then
        dbms_output.put_line(' (Rest)AccNo = '|| Accs.Acc_No);
        dbms_output.put_line(' Invalid Rest After Formul =  '|| To_CHar(PokRst));
      end if;
    else
      PokRst := ABS(tpRec.Pok_Ostat) - ttRec.Pok_Obr_D + ttRec.Pok_Obr_K - ABS(ttRec.Pok_Ostat); 
      if PokRst <> 0 then
        dbms_output.put_line('AccNo= '|| Accs.Acc_No);
        dbms_output.put_line('Rest =  '|| To_CHar(PokRst));
      end if;

    end if;
    
  end loop;
end;   
   
   
     

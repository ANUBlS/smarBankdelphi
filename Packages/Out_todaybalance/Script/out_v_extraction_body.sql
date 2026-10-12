create or replace PACKAGE BODY out_v_extraction
IS

   FUNCTION check_account_number(accno in varchar2, val_name out varchar2, accname out varchar2)
     RETURN  number
   is  
    result integer;
    cursor c_check is
     select acc.id, av.val_name, acc.name  
--       into result, val_name, accname 
       from out_account acc, avalute av
       where acc_no = accno
       and acc.val_acc = av.valute
       and close_dat is null;
     r_check c_check%rowtype;      
   BEGIN 
      open c_check;
      fetch c_check into r_check; 
      close c_check;
      val_name :=  r_check.val_name;
      accname := r_check.name;
      return r_check.id; 
   EXCEPTION
      WHEN no_data_found THEN
          return 0;
   END;

   FUNCTION check_account_number(accno in varchar2, val_name out varchar2)
     RETURN  number
   is  
    result integer;
   BEGIN 
     select acc.id, av.val_name
       into result, val_name
       from out_account acc, avalute av
       where acc_no = accno
       and acc.val_acc = av.valute;    
      return result; 
   EXCEPTION
      WHEN no_data_found THEN
          return 0;
   END;   

   FUNCTION get_acc_param(accid in number, val_name out varchar2, accname out varchar2)
     RETURN  number
   is  
    result integer;
   BEGIN 
     select acc.id, av.val_name, name
       into result, val_name, accname
       from out_account acc, avalute av
       where id = accid
       and acc.val_acc = av.valute;     
      return accid; 
   EXCEPTION
      WHEN no_data_found THEN
          return 0;
   END;    
   
   FUNCTION check_bal_number(balcn in varchar2)
     RETURN  number
   is  
    result integer;
   BEGIN 
     select bal_cn  
       into result 
       from out_bal_spr1
       where bal_cn = to_number(balcn);    
      return result; 
   EXCEPTION
      WHEN no_data_found THEN
          return 0;
   END;

   
   function get_old_date(accid number, bdate date)
     return date
   is
     result date;
   begin 
     SELECT MAX (arch.datdate)
         into result
         FROM out_archost arch
         WHERE arch.datdate < bdate
         AND arch.acc_id = accid;
     return result;
     
    exception when no_data_found then
       return null; 
   end;  

   function get_curr_date(accid number, bdate date)
     return date
   is
     result date;
   begin 
     SELECT MAX (arch.datdate)
         into result
         FROM out_archost arch
         WHERE arch.datdate <= bdate
         AND arch.acc_id = accid;
     return result;
     
    exception when no_data_found then
       return null; 
   end; 
      
   procedure get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2,
                        ostat out number,
                        pok_ostat out number)
   is
      cursor c_getbeginostat (accid in number, infodate in date) 
       is 
        SELECT arch.ostat, arch.pok_ostat
           FROM out_archost arch
           WHERE arch.datdate = infodate  
           AND arch.acc_id = accid;
         
     r_ostat c_getbeginostat%rowtype;
     tempdate date;
     ostat_not_found exception;
   begin
    
    if (acc_id is not null) and (begindate is not null) then

      if type = 'OLD' then 
        tempdate:=get_old_date(acc_id, begindate);
      elsif type = 'CURR' then
        tempdate:=get_curr_date(acc_id, begindate);
      else 
        raise ostat_not_found;      
      end if;    
     
    
     open c_getbeginostat(acc_id, tempdate );
      fetch c_getbeginostat into r_ostat; 
     close c_getbeginostat;

     if r_ostat.ostat <> 0 then   
       ostat := r_ostat.ostat;
       pok_ostat := r_ostat.pok_ostat;
     else
       raise ostat_not_found;
     end if;
    else
      raise ostat_not_found;
     end if;  

   exception when  ostat_not_found then
       ostat := 0;
       pok_ostat := 0;        
   end;                          

   
   function get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2)
   return number                     
   is
      cursor c_getbeginostat (accid in number, infodate in date) 
       is 
        SELECT arch.ostat, arch.pok_ostat
           FROM out_archost arch
           WHERE arch.datdate = infodate  
           AND arch.acc_id = accid;
         
     r_ostat c_getbeginostat%rowtype;
     tempdate date;
     ostat_not_found exception;
   begin
    
    if (acc_id is not null) and (begindate is not null) then

      if type = 'OLD' then 
        tempdate:=get_old_date(acc_id, begindate);
      elsif type = 'CURR' then
        tempdate:=get_curr_date(acc_id, begindate);
      else 
        raise ostat_not_found;      
      end if;    
     open c_getbeginostat(acc_id, tempdate );
      fetch c_getbeginostat into r_ostat; 
     close c_getbeginostat;

     if r_ostat.ostat <> 0 then   
       return  r_ostat.ostat;
     else
       raise ostat_not_found;
     end if;
    else
      raise ostat_not_found;
     end if;  

   exception when  ostat_not_found then
       return  0;       
   end;                          
   
  function get_rate(accid in number, Dat date)
  return number
  is
   result number;
  begin
    select ostat 
    into result
    from operkurs
     where dat = get_rate.dat
     and val_kod = (select val_acc from out_account where id = accid); 
    return result;
   exception when  no_data_found then
       return  0;     
  end;
   
END;


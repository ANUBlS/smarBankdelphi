create or replace PACKAGE out_v_extraction
  IS
 
  FUNCTION check_bal_number(balcn in varchar2)
     RETURN  number;
  function get_rate(accid in number, Dat date)
  return number;
  FUNCTION check_account_number(accno in varchar2, val_name out varchar2, accname out varchar2)
     RETURN  number;
  FUNCTION check_account_number(accno in varchar2, val_name out varchar2)
     RETURN  number;
  procedure get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2,
                        ostat out number,
                        pok_ostat out number);
  function get_ostat (acc_id in number,
                        begindate in date,
                        type in varchar2)
   return number;
  FUNCTION get_acc_param(accid in number, val_name out varchar2, accname out varchar2)
     RETURN  number;
END; -- Package spec


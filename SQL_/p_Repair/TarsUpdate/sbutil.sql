-- Start of DDL Script for Package Body SMART.SBUTIL
-- Generated 8-Jul-2003 13:41:33 from SMART@SB-CURRENT.ATLANT.SMART

CREATE OR REPLACE 
PACKAGE sbutil
IS

	type t_str_array is
		table of varchar2(256)
		index by binary_integer;
	
	type t_param_value is record (
		param varchar2(32),
		value varchar2(256)
	);
	
	TYPE t_params
		is table of t_param_value;

  CommaDelimiter constant char := ',';
	ParamDelimiter constant char := '=';

  function get_account_flag (v_acc_id integer, flag_name varchar2)
    return boolean;
  function get_flag_id (flag_name varchar2)
    return integer;
  function Round_Currency (value in number)
    return number;
  procedure set_account_flag (
    v_acc_id    integer,
    flag_name   varchar2,
    value       integer
  );
  function gen_unique_id
  return integer;
  function get_user_id
  return integer;
  function get_group_id(user# integer)
	return integer;
  function get_group_id
		return integer;
  function comma_to_params(
			text varchar2,
			p_count out integer,
			comma_delimiter varchar2 default CommaDelimiter,
			param_delimiter varchar2 default ParamDelimiter)
		return t_params;
  function comma_to_array(
			text varchar2,
			p_count out integer,
			comma_delimiter varchar2 default CommaDelimiter)
		return t_str_array;
  function expand_macroses(text varchar2, Params t_params)
		return varchar2;
  function get_param_value(
		params t_params, 
		name varchar2, 
		ErrorIfNotFound boolean default False
	)
		return varchar2;
  function array_to_comma(arr t_str_array)
		return varchar2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY sbutil
is

  function Round_Currency (value in number)
    return number
  as
  begin
    return ROUND (value, sbdecls.CurrencyDecimals);
  end;

  function get_account_flag (v_acc_id integer, flag_name varchar2)
    return boolean
  is
    flagid       integer;
    link_count   integer;
  begin
    flagid := get_flag_id (flag_name);

    select COUNT (*)
      into link_count
      from acc_flag_link
     where (acc_id = v_acc_id) and (flag_id = flagid);

    if link_count = 0
    then
      return false;
    else
      return true;
    end if;
  end;

  function get_flag_id (flag_name varchar2)
    return integer
  is
    flagid   integer;
  begin
    begin
      select id
        into flagid
        from acc_flags
       where name = flag_name;

      return flagid;
    exception
      when NO_DATA_FOUND
      then
        raise_application_error (
          sbdecls.Error_InvalidFlag,
             'GET_FLAG_ID: Invalid flag name: '
          || flag_name
        );
    end;
  end;

  procedure set_account_flag (
    v_acc_id    integer,
    flag_name   varchar2,
    value       integer
  )
  is
    flagid   integer;
  begin
    flagid := get_flag_id (flag_name);
    DBMS_OUTPUT.put_line (SUBSTR (   'Value of flagid='
                                  || flagid, 1, 255));

    if value = 0
    then
      delete from acc_flag_link
            where (acc_id = v_acc_id) and (flag_id = flagid);
    else
      if not get_account_flag (v_acc_id, flag_name)
      then
        insert into acc_flag_link
                    ("ACC_ID", "FLAG_ID")
             values (v_acc_id, flagid);
      end if;
    end if;
  end;

  function gen_unique_id
  return integer
  as
    Result integer;
  begin
    select SB_UNIQUE_ID.nextval
    into Result
    from dual;

    return Result;  
  end;

  function get_user_id
  return integer
  as
    Result integer;
  begin
    select USER_ID into Result
    from all_users
    where UPPER(USERNAME) = UPPER(user);
    return Result;
  end;

	function get_group_id(user# integer)
	return integer
	as
		Result integer;
	begin
		select group#
		into Result
		from user$
		where SysID = user#;
		return Result; 
	end;

	function get_group_id
		return integer
	as
	begin
		return get_group_id(get_user_id);
	end;

	function comma_to_array(
			text varchar2,
			p_count out integer,
			comma_delimiter varchar2 default CommaDelimiter)
		return t_str_array
	as
		cd_pos integer;
		last_cd_pos integer := 0;
		text_length integer := length(text);
    Result t_str_array;-- := t_str_array();
		Ind integer := 1;
	begin
		p_count := 0;
		if text_length <> 0 then
    	loop
        exit when cd_pos = text_length+1;
      	cd_pos := instr(text, comma_delimiter, last_cd_pos+1);
  			if cd_pos = 0 then
  				cd_pos := text_length+1;
  			end if;
  			p_count := p_count + 1;
  --			Result.EXTEND;
        Result(Ind) := substr(text, last_cd_pos+1, cd_pos-last_cd_pos-1);
  			Ind := Ind + 1;
        last_cd_pos := cd_pos;
      end loop;
		end if;
    return Result;
	end;
	
	function array_to_comma(arr t_str_array)
		return varchar2
	is
		item varchar2(64);
		Ind binary_integer := arr.FIRST;
		CommaFrag varchar2(3) := '';
		Result varchar2(1024) := '';
	begin
		dbms_output.put_line('arr.count: '||to_char(arr.count));
		
		for Ind in arr.FIRST .. arr.LAST
		loop
			item := arr(Ind);
			Result := Result || CommaFrag || item;
			CommaFrag := ', '; 
		end loop;
		
/*
		loop
			exit when Ind >= arr.COUNT;
			item := arr(Ind);
			Ind := arr.NEXT(ind);
			Result := Result || CommaFrag || item;
			CommaFrag := ', '; 
		end loop;
*/
		return Result;
	end;

	function comma_to_params(
			text varchar2,
			p_count out integer,
			comma_delimiter varchar2 default CommaDelimiter,
			param_delimiter varchar2 default ParamDelimiter)
		return t_params
	as
  	cd_pos integer;	-- comma delimiter position 
		pd_pos integer; -- param delimiter position
    last_cd_pos integer := 0;
    Result t_params := t_params();
		ParamStr varchar2(1024);
		text_length integer := length(text);
	begin
		p_count := 0;
  	loop
      exit when (cd_pos = text_length+1) or (text is Null) or (text = '');

    	cd_pos := instr(text, comma_delimiter, last_cd_pos+1);
			if cd_pos = 0 then
				cd_pos := text_length+1;
			end if;

			ParamStr := substr(text, last_cd_pos+1, cd_pos-last_cd_pos-1);
			pd_pos := instr(ParamStr, param_delimiter);
			
			p_count := p_count + 1;
			Result.EXTEND;
			
      Result(p_count).param := 
				substr(ParamStr, 1, pd_pos-1);
				
			Result(Result.LAST).value := 
				substr(
					ParamStr, 
					pd_pos+1, 
					length(ParamStr));

      last_cd_pos := cd_pos;
			
    end loop;
    return Result;
	end;
	
	function get_param_value(
		params t_params, 
		name varchar2, 
		ErrorIfNotFound boolean default False
	)
		return varchar2
	as
		Ind BINARY_INTEGER := params.FIRST;
	begin
		loop
			exit when Ind is null;
			if params(Ind).param = name then
				return params(Ind).value;
			end if; 
			Ind := params.NEXT(Ind);
		end loop;
		if ErrorIfNotFound then
			raise_application_error(
				sbdecls.Error_InvalidParameters, 
				'Invalid parameter name');
		else
			return null;
		end if;
	end;
	
	function expand_macroses(text varchar2, Params t_params)
		return varchar2
	is
	  p integer := -1;
  	lastp integer := 1;
	  varname varchar2(64);
		AText varchar2(2000) := text;
		Result varchar2(2000);
	begin
		Result := AText;
		loop
		  loop
  		  p := instr(Result, '$(', lastp);
    		if p = 0 then
      		exit;
		    end if;
  		  varname := SUBSTR(Result, p+2, instr(Result, ')', p)-p-2);
				Result := replace(Result, '$('||varname||')', get_param_value(params, varname));
	    	lastp := p+2;
	  	end loop;
			exit when Result = AText;
			AText := Result;
		end loop;
		return Result;
	end;

end;
/


-- End of DDL Script for Package Body SMART.SBUTIL



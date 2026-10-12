CREATE OR REPLACE PACKAGE OUT_SBMSG
  IS
  /* **************************************************************** */
 /*        SmartBank OUT_SBMSG package                               */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

	
	function get_message(MsgID integer)
		return varchar2;
	function get_message(MsgName varchar2)
		return varchar2;
	
  function format_msg(Message varchar2, ParamStr varchar2)
		return varchar2;
  function get_error(
		ErrorCode integer, 
		Message out varchar2)
	return boolean;
END; -- Package spec
/
CREATE OR REPLACE PACKAGE BODY out_sbmsg
IS
/* **************************************************************** */
 /*        SmartBank OUT_SBMSG package                               */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/
	function get_message(MsgID integer)
		return varchar2
	is
		Result OUT_SB_MESSAGES.TEXT%type;
	begin
		select TEXT	
			into Result
			from OUT_SB_MESSAGES
		where
			ID = MsgID;
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(
				sbdecls.Error_MessageNotFound,
				'Message with ID '||TO_CHAR(MsgID)||' could not be found');
	end;
	
	function get_message(MsgName varchar2)
		return varchar2
	is
		Result OUT_SB_MESSAGES.TEXT%type;
	begin
		select TEXT	
			into Result
			from OUT_SB_MESSAGES
		where
			Name = MsgName;
		return Result;
	exception
		when NO_DATA_FOUND then
			raise_application_error(
				sbdecls.Error_MessageNotFound,
				'Message "'||MsgName||'" could not be found'
			);
	end;
	
	function format_msg(Message varchar2, ParamStr varchar2)
		return varchar2
	is
		subtype t_params is OUT_sbutil.t_params;
		ParamCount integer;
		Params t_params;
	begin
		Params :=OUT_sbutil.comma_to_params(ParamStr, ParamCount);
		return OUT_sbutil.expand_macroses(Message, Params);
	end;
		
	function get_error(
		ErrorCode integer, 
		Message out varchar2)
	return boolean
	is
	begin
		begin
			select text
				into Message
			from OUT_SB_ERRORS
			where ID = ErrorCode;
		exception
		when NO_DATA_FOUND then
			return False;
		end;
		
		return True;
	end;

END;



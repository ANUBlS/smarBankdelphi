CREATE OR REPLACE PACKAGE OUT_SB_MTOUTVIEW
   IS
  	/* **************************************************************** */
 /*        SmartBank OUT_SB_MTOUTVIEW package                         */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

FUNCTION  GetLastOprDay(
       Curr_Date IN Date,
       Curr_ID   IN integer
                        ) 
return  Date;


Function GetBankDay return date;
Function GetUserName return varchar2;


 PROCEDURE  INTO_TABLE(
     TableName VarChar2,
     SqlString VarChar2
                      );
                                                                                                                                                         
procedure test(d date);                            
  FUNCTION ACTCONVERT(
  cValue Number
, cTypeID integer
, cAddTypeID integer  
) return Number;
  FUNCTION PASCONVERT
(
  cValue Number
, cTypeID integer
, cAddTypeID integer  
) return Number;
  FUNCTION ACTIVE
  ( aValue IN Number
    ,aTID IN Integer
    ,aAdd IN  Integer
    )
  RETURN  Number;
  FUNCTION PASSIV
  ( aValue IN Number
    ,aTID IN Integer
    ,aAdd IN  Integer
    )
  RETURN  Number;
  PROCEDURE   GetValuteNameFromID(
   aValID IN integer,
   aDate Date,
   aValName  OUT VarChar2,
   aValu  OUT number
);
  PROCEDURE   GetMarignAndTurn(
    CurrentDate  Date,  
    CurrentValute integer,
    BalanceType  integer, 
    BalanceList VarChar2,   
    hasMarignOrTurn integer,
    BranchID IN Integer                                                           
                             );
END; -- Package spec
/

CREATE OR REPLACE PACKAGE BODY OUT_SB_MTOUTVIEW
IS
 	/* **************************************************************** */
 /*        SmartBank OUT_SB_MTOUTVIEW package                         */
/*  Copyright 2006, Smart Systems Technology, Ltd.
                                 modified by Kenan MEMMEDOV        */  
 /* **************************************************************/

  
  UserName VarChar2(40);
  BankDay  Date;  
--*********************************
FUNCTION ACTCONVERT(
  cValue Number
, cTypeID integer
, cAddTypeID integer  
) return Number 
IS 
 retVal Number; 
Begin
 /* if  cValue=0 then
  return 0;
  end if;
  if  cValue<0 then
  retVal :=abs(cValue);
  else
  retVal :=0;
  end if;
  if cTypeId=1 then
  if cAddTypeID=2 then
   retVal :=0;
   else
  if (cAddTypeId=3)and(retVal=0) then  
  end if;
  end if;*/   
    
   if  cValue=0  then
       return 0;       
   end if;
   
   if  cValue<0 then
   retVal:=abs(cValue);
   else
   retVal:=0;
   end if;
    
   if (cTypeId=1)and(retVal =0) then
     retVal:=-cValue; 
   end if;
   if ((cTypeID=2))and(retVal<>0) then
      RetVal:=0;
   end if;
   return retVal;
      
  /* if  cTypeID=3 then
   if   cValue <0 then
     return  abs(cValue);
      else
     return 0;
    end if;
   end if;
   
   if  cTypeID=1  then
   if  cValue<0  then
   return  abs(cValue);
   else
   return 0;
   end if;        
    end if;
     
    if  cTypeID=2  then
      if  cValue<0 then
        return -abs(cValue);
        else
        return  0;
      end if;  
    end if;*/
    
End;
--*********************************
FUNCTION PASCONVERT
(
  cValue Number
, cTypeID integer
, cAddTypeID integer  
) return Number 
IS  
retVal number;
Begin
     if  cValue=0  then
       return 0;       
   end if;
   if  cValue>0 then
   retVal:=abs(cValue);
   else
   retVal:=0;
   end if; 
   if (cTypeId=1)and(retVal <>0) then
     retVal:=0; 
   end if;
   if (cTypeID=2)and(retVal=0) then
      RetVal:=-abs(cValue);
   end if;
   return retVal; 
End;

--*********************************
FUNCTION  GetLastOprDay(
      Curr_Date IN Date,
      Curr_ID  IN integer     
)
 return  Date
is
 LOprDate Date;
 begin
  select  Max(VB.Dat) into  LOprDate 
  from out_PROVARCH  VB where
    (VB.Dat<=Curr_Date)
    and ((VB.Debt = Curr_ID) or (VB.Kredit = Curr_ID));
     return LOprDate; 
 end;

--*********************************
PROCEDURE  INTO_TABLE(
     TableName VarChar2,
     SqlString VarChar2
                      )
IS

 V_Cursor Number(38);
     nRow Number(38);    
      vCount Integer;
	DotPos integer := Instr(TableName, '.');
	ATableName varchar2(32);
Begin
	if DotPos <> 0 then
		ATableName := substr(TableName, DotPos+1, Length(TableName)-DotPos);
	else
		ATableName := TableName; 
	end if;
	
	select count(*)
		into vCount 
	from sys.all_tables
	where (owner = GetUserName) and (TABLE_NAME = ATableName);

--  select Count(*) into vCount from tab where TNAME=TableName;
--  update a1 set c5=SqlString;
  --commit;  
  if   vCount=1  then     
       V_Cursor:=dbms_sql.open_cursor;
       dbms_sql.parse(V_Cursor,'Drop table ' || TableName ,dbms_sql.v7);
       NRow:=dbms_sql.execute(V_Cursor);
       dbms_sql.Close_cursor(v_cursor);
    end if;                                 
        v_Cursor:=dbms_sql.open_cursor;
        dbms_sql.parse(V_Cursor,SqlString,dbms_sql.v7);
        NRow:=dbms_sql.execute(V_Cursor);
        dbms_sql.Close_cursor(v_cursor);     
End;                       
 
--*********************************
PROCEDURE   GetMarignAndTurn(
    CurrentDate  Date,  
    CurrentValute integer,
    BalanceType  integer, 
    BalanceList VarChar2,   
    hasMarignOrTurn integer,
    BranchID IN Integer                                                           
                             )
IS
  cStrAs constant  VarChar2(20):=' as BAL_CN';
  cFrom  constant  VarChar2(64):='  FROM  out_ACCOUNT AC,AVALUTE AV,';  
  cQStr1 constant  VarChar2(556):=
  ' AS  Select AC.ACC_NO  ,Ac.Name BALNAME ,AV.Val_Name,AR.OBR_D,AR.OBR_K,
          AR.POK_OBR_D ,AR.POK_OBR_K 
        , out_SB_MTOUTVIEW.ACTIVE(AR.OSTAT,B.TypeID,B.AdditionalTypeID) S_ACT 
        , out_SB_MTOUTVIEW.PASSIV(AR.OSTAT,B.TypeID,B.AdditionalTypeID) S_PAS 
		, out_SB_MTOUTVIEW.ACTIVE(AR.POK_OSTAT,B.TypeID,B.AdditionalTypeID) P_ACT 
		, out_SB_MTOUTVIEW.PASSIV(AR.POK_OSTAT,B.TypeID,B.AdditionalTypeID) P_PAS, ';   
 cBalSpr constant VarChar(32):='BAL_SPR';
  
  aQStrBN       VarChar2(32);--RPAD  
   cQStr2       VarChar2(256); 
  aStrLOD       VarChar2(32);  
  aQStrValute   VarChar2(32);  
  aQStrOBROST   VarChar2(64);  
  aQStrBList    VarChar2(556);  
  aStrCreateTbl VarChar2(400);  
  UserTAB       VarChar2(64);
  aQueryStr     VarChar2(2000);--main
  aQStrView     VarChar2(32);
  aStrTableName VarChar2(64);
  LastOprDay Date;    
  Sum_Obr_K NUMBER(15,2);
  Sum_Obr_D NUMBER(15,2);
  Sum_Pok_Obr_K NUMBER(15,2);
  Sum_Pok_Obr_D NUMBER(15,2);
  Sum_Ostat  NUMBER(15,2);
  Sum_Pok_Ostat NUMBER(15,2);
  DateFilter VarChar2(256);
  
  aSumStr VarChar2(256);
  addSum  VarChar2(256);
  cACC_NO VarChar2(32);
  BankWorkDate Date;   
  BranchFilter  varchar2(256);            
Begin

 UserTAB :=  GetUserName||'.TURN_'||GetUserName ;
 
 select max(Dat) into BankWorkDate 
 from operkurs where dat<=CurrentDate;
 
 if  CurrentValute <> -1 Then 
   aQStrValute :='AND (AV.VALUTE='||TO_CHAR(CurrentValute)||')'; 
 else
   aQStrValute :='';
 end if;

 if BranchID <> -1 then 
  BranchFilter := '(Ac.Filial = '||TO_CHAR(BranchID)||')AND';
 else
   BranchFilter :='';
 end if;   
         
 aQStrBN :='AC.'||'BAL_CN'||TO_CHAR(BalanceType);
 if BalanceList<>'@' Then
     aQStrBList :='And('||aQStrBN||' in ('||BalanceList||'))';
    else
     aQStrBList :='';
 end if;
   
  aQStrView :=cBalSpr||TO_CHAR(BalanceType)||' B';
  cQStr2:=' WHERE '||BranchFilter||' (ac.id=ar.acc_id and ac.val_acc=av.valute and '||aQStrBN||'=b.bal_cn'||')AND((AC.CLOSE_DAT IS NULL) OR (AC.CLOSE_DAT >' ;
   
 if hasMarignOrTurn=0  Then
   aQStrOBROST :='And ((AR.POK_OBR_K<>0)OR(AR.POK_OBR_D <>0)OR(AR.POK_OSTAT<>0))';
   end if; 
 if  hasMarignOrTurn=1 Then
 if  CurrentValute in (-1 , 0)  then 
   aQStrOBROST :='And ((AR.POK_OBR_K<>0)OR(AR.POK_OBR_D <>0))';
 else
   aQStrOBROST :='And ((AR.OBR_K<>0)OR(AR.OBR_D <>0))';
 end if;	    
 end if; 
 if  hasMarignOrTurn=2 Then
   aQStrOBROST :='';   
 end if;
 
 if  GetBankDay=CurrentDate Then
 aStrLOD:='AR.LastOpDate as LastDate , ';
 DateFilter :='';
 aStrTableName:='out_TENOSTAT AR , ';
 else
 aStrLOD:='AR.LastOpDate as LastDate ,';
  DateFilter :=' and ( AR.DATDATE ='||''''||TO_CHAR(BankWorkDate)||''''||')';
 aStrTableName:='out_ARCHOST  AR  , ';
 end if;      
 
 
 aQueryStr :='CREATE TABLE  ' ||USERTAB||cQStr1||aStrLOD||aQStrBN||cStrAs||cFrom||aStrTableName||aQStrView||cQStr2||''''||TO_CHAR(CurrentDate)||''''||'))'||DateFilter||aQStrOBROST||aQStrBList||aQStrValute;
 
 INTO_TABLE(UserTAB,aQueryStr);     
   
commit;        
                 
End;

--*********************************
Function GetBankDay return date is
begin
 return BankDay;
end;

--*********************************
Function GetUserName return varchar2 is
begin
 return UserName;
end;
--*****************************************
--*********************************
PROCEDURE   GetValuteNameFromID(
   aValID IN integer,
   aDate Date,
   aValName  OUT VarChar2,
   aValu  OUT number
)  
IS
Begin
   Select  AV.VAL_NAME ,OP.Ostat  into  aValName ,aValu  
   from AVALUTE AV ,OperKurs OP 
   where (AV.VALUTE=aValID)and(aValID=Op.Val_Kod)and(Op.Dat=aDate);   
   EXCEPTION
  WHEN NO_DATA_FOUND THEN
  begin
    aValName :='';
    aValu :=0;
    raise;
  end;    
End;
procedure test(d date) as
 begin
   if d=sysdate then
   dbms_output.put_line('True'||To_Char(To_Number(d)));
   else
   dbms_output.put_line('False'||To_Char(To_Number(d)));
   end if;
--   EXECUTE IMMEDIATE 'Insert Into a1 (c1) Values ('||To_Number(d)||')'; 
 end; 
 FUNCTION ACTIVE
  ( aValue IN Number
    ,aTID IN Integer
    ,aAdd IN  Integer
    )
  RETURN  Number IS
  ReturnValue Number;
BEGIN
  if aValue=0 then
   return 0;
  end if;
  
  if  aValue<0 then
    ReturnValue :=abs(aValue);
   else
    ReturnValue :=0;
  end if;
  
  if ReturnValue<>0 then
  if  (aTID<>aAdd) then   
   if  aAdd=2 then
       ReturnValue :=0;
   end if;
   end if;
   else
   if  (aAdd=1)and(aADD<>aTID) then
   ReturnValue :=-abs(aValue);
   end if;   
  end if;
  return ReturnValue;
END;

 FUNCTION PASSIV
  ( aValue IN Number
    ,aTID IN Integer
    ,aAdd IN  Integer
    )
  RETURN  Number IS
  ReturnValue Number;
BEGIN
  if aValue=0 then
   return 0;
  end if;
  
  if  aValue>0 then
    ReturnValue :=abs(aValue);
   else
    ReturnValue :=0;
  end if;
  
  if ReturnValue<>0 then
  if  (aTID<>aAdd) then   
   if  aAdd=1 then
       ReturnValue :=0;
   end if;
   end if;
   else
   if  (aAdd=2)and(aADD<>aTID) then
   ReturnValue :=-abs(aValue);
   end if;   
  end if;
  Return ReturnValue;
END;
                   
BEGIN
 select user, trunc(tek_dat) into UserName, BankDay from sysdat;                           
END;


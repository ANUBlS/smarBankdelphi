-- Start of DDL Script for Package CREDITSMGR.CM_ACTIVATION
-- Generated 30-Apr-2007 11:01:26 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_activation
  IS

  procedure ActivateCredit(
            p_CreditID in Integer ,
            p_Date in Date ,
            p_Activate in Integer default 0 -- 0 : all;1 : pledge only; 2 : Obligation only
            );
  procedure CommitActivation(
            DoCommit in Boolean default True
  );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_activation
IS

  procedure ActivateCredit(
            p_CreditID in Integer ,
            p_Date in Date ,
            p_Activate in Integer default 0 -- 0 : all;1 : pledge only; 2 : Obligation only
            )
  is
  
  
    cursor c_Accounts(CrdID in Integer) is
    select OUTCOLLATERALACCID , OUTGUARANTEEACCID
      from CM_ACCOUNTS
     where CreditID = CrdID; 
         
    cursor c_State(CrdID in Integer) is
    select OBLIGATION , PLEDGEPRICE
      from CM_CURR_STATE
     where CreditID = CrdID;  
    
    cursor c_ACTV_TRANSACTIONS(CrdID in Integer) is
    select oblTrID, pledgeTrID, ActvDate
      from CM_ACTV_TRANSACTIONS
     where CreditID = CrdID; 
    
    cursor c_StateHistory(CrdID in Integer, ADate in Date) is
    select OBLIGATION , PLEDGEPRICE
      from CM_HISTORY
     where CreditID = CrdID
       and HDate = ADate;   
    
    cursor c_CreditInfo(CrdID in Integer) is
    select CURRENCY , CUSTOMERTYPE , BRANCHID , NUMBEROFCREDIT 
      from CM_ACTIVE_CREDITS
     where ID=CrdID; 
    
    Accs c_Accounts%rowtype;
    
    State c_State%rowtype;

    ActvCrTrans c_ACTV_TRANSACTIONS%rowtype;
    
    CrdInfo c_CreditInfo%rowtype; 
    
    History c_StateHistory%rowtype;
        
    PledgeAccID Integer;
    ObligationAccID Integer;
    
    PledgeInvAccID Integer;
    ObligationInvAccID Integer;
    
    oblTransID Integer;
    pledgeTransID Integer;
    
    AlreadyActivated Boolean;
    
    PledgeResultTrID Integer;
    ObligationResultTrID Integer;
    
    CrdCurrencyID Integer;
    CrdBranchID Integer;
    CrdCustType Integer;
    CrdNo Varchar2(255);
    
    SumObligation Number(18,2);
    SumPledgePrice Number(18,2);
    
    oldActvDate Date;
    odlPledgeActvTrID Integer;
    oldObligationActvTrID Integer;
    
    oldObligationAmt Number;
    oldPledgeAmt Number;
    
    TrDescPledge Varchar2(255);
    TrDescOblg   Varchar2(255);
     
  begin
  
    open c_ACTV_TRANSACTIONS(p_CreditID);
    fetch c_ACTV_TRANSACTIONS into ActvCrTrans;
    AlreadyActivated := c_ACTV_TRANSACTIONS%found; 
    close c_ACTV_TRANSACTIONS;     

    open c_Accounts(p_CreditID);
    fetch c_Accounts into Accs;
    PledgeAccID := Accs.OUTCOLLATERALACCID;
    ObligationAccID := Accs.OUTGUARANTEEACCID;     
    close c_Accounts;
        
    open c_CreditInfo(p_CreditID);
    fetch c_CreditInfo into CrdInfo;
    CrdCurrencyID := CrdInfo.CURRENCY;  
    CrdBranchID := CrdInfo.BRANCHID;
    CrdCustType := CrdInfo.CUSTOMERTYPE; 
    CrdNo := CrdInfo.NUMBEROFCREDIT;     
    close c_CreditInfo;
        
    PledgeInvAccID := 
          CM_UTILS.lnkOutInvPledgeAccount(
            p_CustCategory => CrdCustType ,
            p_CrdCurrency => CrdCurrencyID , 
            p_BankID => CrdBranchID
          );
    ObligationInvAccID := 
          CM_UTILS.lnkOutInvObligationAccount(
            p_CustCategory => CrdCustType ,
            p_CrdCurrency => CrdCurrencyID , 
            p_BankID => CrdBranchID
          );
    
    open c_State(p_CreditID);
    fetch c_State into State;
    SumObligation := State.OBLIGATION;
    SumPledgePrice :=State.PLEDGEPRICE;        
    close c_State;
    
    TrDescPledge := CM_UTILS.trDescSavePledgePrice;
    TrDescPledge := Replace(TrDescPledge,CM_DECLS.TrDescNumber,CrdNo); -- TODO
    TrDescPledge := Replace(TrDescPledge,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));        

    TrDescOblg := CM_UTILS.trDescObligationIncrease;
    TrDescOblg := Replace(TrDescOblg,CM_DECLS.TrDescNumber,CrdNo); -- TODO
    TrDescOblg := Replace(TrDescOblg,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));        
    
    if AlreadyActivated then --1
      
      oldActvDate := ActvCrTrans.ActvDate;
      odlPledgeActvTrID := ActvCrTrans.oblTrID; 
      oldObligationActvTrID := ActvCrTrans.pledgeTrID;
      
      if oldActvDate <> p_Date then --2 
          
            
        open c_StateHistory(p_CreditID , oldActvDate);
        fetch c_StateHistory into History;
        oldObligationAmt := History.OBLIGATION;
        oldPledgeAmt := History.PLEDGEPRICE;         
        close c_StateHistory;
                            
        if odlPledgeActvTrID is not null then--3
        if p_Activate in (0,1) then -- 4     
           PledgeResultTrID :=
                 CM_TRANSACTIONMGR.CM_TransactionAdd(
                 p_DEBITACCID => PledgeInvAccID ,
                 p_CREDITACCID => PledgeAccID ,
                 p_DEBITAMOUNT => oldPledgeAmt ,
                 p_CREDITAMOUNT => null ,
                 p_NATAMOUNT => null ,
                 p_optype => CM_DECLS.cmTransactionOpType ,                 
                 p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
                 p_INBALANCECHAR => null ,
                 p_TRDATE => p_Date,
                 p_TRDESCRIPTION => TrDescPledge                 
                 );             
        end if;--4
        end if;--3
        
        if oldObligationActvTrID is not null then--5     
        if p_Activate in (0,2) then  --6   
           ObligationResultTrID :=
                 CM_TRANSACTIONMGR.CM_TransactionAdd(
                 p_DEBITACCID => ObligationInvAccID ,
                 p_CREDITACCID => ObligationAccID ,
                 p_DEBITAMOUNT => oldObligationAmt ,
                 p_CREDITAMOUNT => null ,
                 p_NATAMOUNT => null ,
                 p_optype => CM_DECLS.cmTransactionOpType ,                 
                 p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
                 p_INBALANCECHAR => null ,
                 p_TRDATE => p_Date ,
                 p_TRDESCRIPTION => TrDescOblg                 
                 );             
        end if; --6          
        end if; --5
        
      else  -- Credit Activated today --2else 
      
        if odlPledgeActvTrID is not null then --7
        if p_Activate in (0,1) then --8
        if CM_TRANSACTIONMGR.TransactionExist(odlPledgeActvTrID, False) then --9
          PledgeResultTrID := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(odlPledgeActvTrID);
        end if;--Exist 9     
        end if; --8
        end if; --7
        
        if oldObligationActvTrID is not null then --10
        if p_Activate in (0,2) then -- 11
        if CM_TRANSACTIONMGR.TransactionExist(oldObligationActvTrID, False) then --12
          ObligationResultTrID := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(oldObligationActvTrID);
        end if;--Exist --12      
        end if; -- 11
        end if; -- 10
                  
      end if; -- Credit Activated no today --6
      
      if p_Activate in (0,1) then     
         PledgeResultTrID :=
               CM_TRANSACTIONMGR.CM_TransactionAdd(
               p_DEBITACCID => PledgeInvAccID ,
               p_CREDITACCID => PledgeAccID ,
               p_DEBITAMOUNT => null ,
               p_CREDITAMOUNT => SumPledgePrice ,
               p_NATAMOUNT => null ,
               p_optype => CM_DECLS.cmTransactionOpType ,
               p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
               p_INBALANCECHAR => null ,
               p_TRDATE => p_Date,
               p_TRDESCRIPTION => TrDescPledge                
               );             
      end if;
      if p_Activate in (0,2) then     
         ObligationResultTrID :=
               CM_TRANSACTIONMGR.CM_TransactionAdd(
               p_DEBITACCID => ObligationInvAccID ,
               p_CREDITACCID => ObligationAccID ,
               p_DEBITAMOUNT => null ,
               p_CREDITAMOUNT => SumObligation ,
               p_NATAMOUNT => null ,
               p_optype => CM_DECLS.cmTransactionOpType ,
               p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
               p_INBALANCECHAR => null ,
               p_TRDATE => p_Date ,
               p_TRDESCRIPTION => TrDescOblg                 
               );             
      end if;
                 
    else  -- Credit not activated yet  AlreadyActive
             
      if p_Activate in (0,1) then     
         PledgeResultTrID :=
               CM_TRANSACTIONMGR.CM_TransactionAdd(
               p_DEBITACCID => PledgeInvAccID ,
               p_CREDITACCID => PledgeAccID ,
               p_DEBITAMOUNT => null ,
               p_CREDITAMOUNT => SumPledgePrice ,
               p_NATAMOUNT => null ,
               p_optype => CM_DECLS.cmTransactionOpType ,
               p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
               p_INBALANCECHAR => null ,
               p_TRDATE => p_Date,
               p_TRDESCRIPTION => TrDescPledge               
               );             
      end if;
      if p_Activate in (0,2) then     
         ObligationResultTrID :=
               CM_TRANSACTIONMGR.CM_TransactionAdd(
               p_DEBITACCID => ObligationInvAccID ,
               p_CREDITACCID => ObligationAccID ,
               p_DEBITAMOUNT => null ,
               p_CREDITAMOUNT => SumObligation ,
               p_NATAMOUNT => null ,
               p_optype => CM_DECLS.cmTransactionOpType ,
               p_FLAGS => CM_DECLS.cmTrFlagOutBalance ,
               p_INBALANCECHAR => null ,
               p_TRDATE => p_Date ,
               p_TRDESCRIPTION => TrDescOblg                  
               );             
      end if;
            
    end if; -- Already Activated
    
    update CM_ACTV_TRANSACTIONS
       set OBLTRID = PledgeResultTrID , 
           PLEDGETRID = ObligationResultTrID , 
           ACTVDATE = p_Date 
     where CREDITID = p_CreditID;
    
    if SQL%ROWCOUNT <=0 then
      insert into cm_actv_transactions (
        creditid, obltrid, pledgetrid, actvdate
      )
      values(
        p_CreditID, ObligationResultTrID, PledgeResultTrID, p_Date 
      );
    end if;
             
  end;  

  procedure CommitActivation(
            DoCommit in Boolean default True
  )
  is
  begin
    if  DoCommit  then
      CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(null);
      commit work;
    else
      rollback work;
    end if;
  end;
          
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_ACTIVATION

-- Start of DDL Script for Package CREDITSMGR.CM_ADMINISTRATION
-- Generated 30-Apr-2007 11:01:26 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_administration
IS
   PROCEDURE createsynonyms (
      s_foruser    VARCHAR2,
      s_objowner   VARCHAR2,
      s_objtype    VARCHAR2
   );

   PROCEDURE createallsynonyms (s_foruser VARCHAR2, s_objowner VARCHAR2);

   PROCEDURE deleteplugin (p_id IN INTEGER);

   PROCEDURE dropsynonyms (s_fromuser VARCHAR2, s_owner VARCHAR2);

   PROCEDURE deluser (d_username VARCHAR2);

   PROCEDURE addcredituser (u_username VARCHAR2 DEFAULT USER);

   FUNCTION pluginaccess (c_pluginid INTEGER, c_userid INTEGER DEFAULT UID)
      RETURN BOOLEAN;

   PROCEDURE addusergrant (a_pluginid INTEGER, a_userid INTEGER DEFAULT UID);

   FUNCTION getpluginid (p_plugin VARCHAR2, p_param VARCHAR2)
      RETURN INTEGER;

   PROCEDURE checkuserexists (c_username VARCHAR2);

   PROCEDURE delusergrant (a_pluginid INTEGER, a_userid INTEGER DEFAULT UID);

   FUNCTION getuserid (g_username VARCHAR2)
      RETURN INTEGER;

   FUNCTION is_adminnum (i_username VARCHAR2)
      RETURN NUMBER;

   FUNCTION is_admin (i_username VARCHAR2)
      RETURN BOOLEAN;

   PROCEDURE grmdelgroup (g_id INTEGER);

   PROCEDURE grmaddgroup (
      g_name          VARCHAR2,
      g_typeid        INTEGER DEFAULT 0,
      g_description   VARCHAR2
   );

   PROCEDURE grmuseraddingroup (
      u_userid     INTEGER,
      u_groupid    INTEGER,
      u_usertype   INTEGER
   );

   PROCEDURE grmuserdelfromgroup (d_userid INTEGER, d_groupid INTEGER);

   PROCEDURE grmuserchangestatusingroup (
      c_userid      INTEGER,
      c_groupid     INTEGER,
      c_newstatus   INTEGER
   );

   PROCEDURE grmcleargroup (c_groupid INTEGER);

   PROCEDURE grmuseraddingroupbyname (
      u_username   VARCHAR2,
      u_groupid    INTEGER,
      u_usertype   INTEGER
   );

   PROCEDURE checkuserexistsbyid (c_userid INTEGER);

   PROCEDURE checkpluginexistsbyid (c_plugid INTEGER);

   PROCEDURE addcontroltype (c_typeid INTEGER, c_user VARCHAR2);

   PROCEDURE addplugin (
      p_pluginname    IN   VARCHAR2,
      p_paramname     IN   VARCHAR2,
      p_description   IN   VARCHAR2,
      p_typeid        IN   INTEGER
   );

   PROCEDURE updateplugin (
      p_id            IN   INTEGER,
      p_description   IN   VARCHAR2,
      p_typeid             INTEGER
   );

   FUNCTION fullviewcontrol (i_username VARCHAR2)
      RETURN NUMBER;

   FUNCTION checkaccessadvgr (p_name IN VARCHAR2)
      RETURN BOOLEAN;

   PROCEDURE addadvusergrant (
      p_userid      IN   INTEGER,
      p_advgrname   IN   VARCHAR2,
      p_def         IN   BOOLEAN
   );

   PROCEDURE addadvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER);

   PROCEDURE checkaccessoperation (
      debitaccid    IN   INTEGER,
      creditaccid   IN   INTEGER,
      vidop         IN   INTEGER
   );

   PROCEDURE checkadvgrants (p_name IN VARCHAR2, p_creditid IN INTEGER);

   FUNCTION checkadvusergrants (p_userid IN INTEGER, p_description IN VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION checkcredituser
      RETURN BOOLEAN;

   PROCEDURE deladvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER);

   PROCEDURE deladvusergrant (p_userid IN INTEGER, p_advgrname IN VARCHAR2);

   FUNCTION get_advgrerrormsg (p_name IN VARCHAR2)
      RETURN VARCHAR2;

   PROCEDURE updadvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_administration
IS
   ecode_userexists       CONSTANT INTEGER        := -20201;
   error_userexists       CONSTANT VARCHAR2 (255) := 'User already exists';
   ecode_usernotfound     CONSTANT INTEGER        := -20202;
   error_usernotfound     CONSTANT VARCHAR2 (255) := 'User does not exists';
   ecode_accessdenied     CONSTANT INTEGER        := -20203;
   error_accessdenied     CONSTANT VARCHAR2 (255) := 'Access denied';
   ecode_pluginnotfound   CONSTANT INTEGER        := -20204;
   error_pluginnotfound   CONSTANT VARCHAR2 (255) := 'Plugin not found';
   usercreditsmgr         CONSTANT VARCHAR2 (255) := 'CREDITSMGR';

--------------------------------------------------------------------------------
---------------------------->>   Plugin manager   ------------------------------
--------------------------------------------------------------------------------
   PROCEDURE addplugin (
      p_pluginname    IN   VARCHAR2,
      p_paramname     IN   VARCHAR2,
      p_description   IN   VARCHAR2,
      p_typeid        IN   INTEGER
   )
   IS
   BEGIN
      INSERT INTO cm_adm_plugins
                  (pluginname, paramname, description, typeid
                  )
           VALUES (p_pluginname, p_paramname, p_description, p_typeid
                  );

      COMMIT WORK;
   END;

   PROCEDURE updateplugin (
      p_id            IN   INTEGER,
      p_description   IN   VARCHAR2,
      p_typeid             INTEGER
   )
   IS
   BEGIN
      UPDATE cm_adm_plugins
         SET description = p_description,
             typeid = p_typeid
       WHERE ID = p_id;

      COMMIT WORK;
   END;

   PROCEDURE deleteplugin (p_id IN INTEGER)
   IS
   BEGIN
      DELETE FROM cm_adm_plugins
            WHERE ID = p_id;

      COMMIT WORK;
   END;

   FUNCTION getpluginid (p_plugin VARCHAR2, p_param VARCHAR2)
      RETURN INTEGER
   IS
      CURSOR c_plid
      IS
         SELECT ID
           FROM cm_adm_plugins
          WHERE pluginname = UPPER (p_plugin) AND paramname = UPPER (p_param);

      plid      c_plid%ROWTYPE;
      plug_id   INTEGER;
   BEGIN
      OPEN c_plid;
      FETCH c_plid INTO plid;

      IF c_plid%FOUND
      THEN
         plug_id := plid.ID;
      ELSE
         plug_id := -1;
      END IF;

      CLOSE c_plid;
      RETURN plug_id;
   END;

   PROCEDURE checkpluginexistsbyid (c_plugid INTEGER)
   IS
      res   cm_adm_plugins%ROWTYPE;
   BEGIN
      SELECT *
        INTO res
        FROM cm_adm_plugins
       WHERE ID = c_plugid;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (ecode_pluginnotfound,
                                   error_pluginnotfound || ' : ' || c_plugid
                                 );
   END;

--------------------------------------------------------------------------------
----------------------------   Plugin manager   >>------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
---------------------------->>    User manager    ------------------------------
--------------------------------------------------------------------------------

   PROCEDURE createsynonyms (
      s_foruser    VARCHAR2,
      s_objowner   VARCHAR2,
      s_objtype    VARCHAR2
   )
   IS
      CURSOR c_objects
      IS
         SELECT object_name
           FROM all_objects
          WHERE object_type = UPPER (s_objtype)
            AND owner = s_objowner
            AND object_name NOT IN (SELECT objectname
                                      FROM cm_adm_synreplace)
            AND object_name NOT IN (SELECT synonym_name
                                      FROM all_synonyms
                                     WHERE owner = s_foruser);

      CURSOR c_repobjs
      IS
         SELECT objectname, replacewith, objectowner
           FROM cm_adm_synreplace
          WHERE objecttype = UPPER (s_objtype)
            AND objectname NOT IN (SELECT synonym_name
                                     FROM all_synonyms
                                    WHERE owner = s_foruser);

      equery   VARCHAR2 (4000);
   BEGIN
      FOR objects IN c_objects
      LOOP
         equery :=
            UPPER (   'CREATE SYNONYM '
                   || s_foruser
                   || '.'
                   || objects.object_name
                   || ' FOR '
                   || s_objowner
                   || '.'
                   || objects.object_name
                  );
         EXECUTE IMMEDIATE (equery);
      END LOOP;

      FOR repobj IN c_repobjs
      LOOP
         equery :=
            UPPER (   'CREATE SYNONYM '
                   || s_foruser
                   || '.'
                   || repobj.objectname
                   || ' FOR '
                   || repobj.objectowner
                   || '.'
                   || repobj.replacewith
                  );
         EXECUTE IMMEDIATE (equery);
      END LOOP;
   END;

   PROCEDURE dropsynonyms (s_fromuser VARCHAR2, s_owner VARCHAR2)
   IS
      CURSOR c_synonyms
      IS
         SELECT synonym_name
           FROM all_synonyms
          WHERE owner = s_fromuser AND table_owner = s_owner;
   BEGIN
      FOR syn IN c_synonyms
      LOOP
         EXECUTE IMMEDIATE (   'DROP SYNONYM '
                            || s_fromuser
                            || '.'
                            || syn.synonym_name
                           );
      END LOOP;
   END;

   PROCEDURE createallsynonyms (s_foruser VARCHAR2, s_objowner VARCHAR2)
   IS
   BEGIN
      createsynonyms (s_foruser, s_objowner, 'TABLE');
      createsynonyms (s_foruser, s_objowner, 'VIEW');
      createsynonyms (s_foruser, s_objowner, 'PACKAGE');
      createsynonyms (s_foruser, s_objowner, 'FUNCTION');
      createsynonyms (s_foruser, s_objowner, 'PROCEDURE');
      createsynonyms (s_foruser, s_objowner, 'SYNONYM');
   END;

   PROCEDURE addcredituser (u_username VARCHAR2 DEFAULT USER)
   IS
      CURSOR c_userid
      IS
         SELECT user_id
           FROM SYS.all_users
          WHERE username = UPPER (u_username);
   BEGIN
      OPEN c_userid;

      IF c_userid%NOTFOUND
      THEN
         raise_application_error (ecode_usernotfound, error_usernotfound);
      END IF;

      CLOSE c_userid;

      INSERT INTO cm_adm_users
                  (NAME
                  )
           VALUES (UPPER (u_username)
                  );

      createallsynonyms (u_username, usercreditsmgr);

      INSERT INTO cm_visible_fields
                  (seqno, fieldname, frozen, userid, visible, ID, fielddesc)
         SELECT seqno, fieldname, frozen, getuserid (u_username), visible, ID,
                fielddesc
           FROM cm_fields_list;

      COMMIT WORK;
   END;

   PROCEDURE deluser (d_username VARCHAR2)
   IS
   BEGIN
      dropsynonyms (d_username, usercreditsmgr);

      DELETE FROM cm_adm_groupmanager
            WHERE userid = getuserid (d_username);

      DELETE FROM cm_adm_usergrants
            WHERE userid = getuserid (d_username);

      DELETE FROM cm_adm_users
            WHERE NAME = d_username;

      DELETE FROM cm_visible_fields
            WHERE userid = getuserid (d_username);

      COMMIT WORK;
   END;

   PROCEDURE checkuserexists (c_username VARCHAR2)
   IS
      c_res   all_users%ROWTYPE;
   BEGIN
      SELECT *
        INTO c_res
        FROM all_users
       WHERE username = UPPER (c_username);
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (ecode_usernotfound,
                                   error_usernotfound || ' : ' || c_username
                                 );
   END;

   PROCEDURE checkuserexistsbyid (c_userid INTEGER)
   IS
      c_res   all_users%ROWTYPE;
   BEGIN
      SELECT *
        INTO c_res
        FROM all_users
       WHERE user_id = c_userid;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (ecode_usernotfound,
                                   error_usernotfound || ' : ' || c_userid
                                 );
   END;

   FUNCTION getuserid (g_username VARCHAR2)
      RETURN INTEGER
   IS
      usid   INTEGER;
   BEGIN
      SELECT user_id
        INTO usid
        FROM all_users
       WHERE username = g_username;

      RETURN usid;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         raise_application_error (ecode_usernotfound,
                                   error_usernotfound || g_username
                                 );
   END;

   FUNCTION fullviewcontrol (i_username VARCHAR2)
      RETURN NUMBER
   IS
      CURSOR c_admusers
      IS
         SELECT NAME
           FROM cm_adm_users
          WHERE NAME = i_username AND typeid = 2;

      admusers   c_admusers%ROWTYPE;
   BEGIN
      OPEN c_admusers;
      FETCH c_admusers INTO admusers;

      IF admusers.NAME = i_username
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;

      CLOSE c_admusers;
   END;

   FUNCTION is_adminnum (i_username VARCHAR2)
      RETURN NUMBER
   IS
      CURSOR c_admusers
      IS
         SELECT NAME
           FROM cm_adm_users
          WHERE NAME = i_username AND typeid = 1;

      admusers   c_admusers%ROWTYPE;
      usrfound   BOOLEAN;
   BEGIN
      OPEN c_admusers;
      FETCH c_admusers INTO admusers;

      IF admusers.NAME = i_username
      THEN
         RETURN 1;
      END IF;

      CLOSE c_admusers;

      IF (usrfound) OR (UPPER (i_username) = usercreditsmgr)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION is_admin (i_username VARCHAR2)
      RETURN BOOLEAN
   IS
   BEGIN
      RETURN is_adminnum (i_username) = 1;
   END;

--------------------------------------------------------------------------------
----------------------------    User manager    >>------------------------------
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
---------------------------->>    Check Access    ------------------------------
--------------------------------------------------------------------------------

   FUNCTION pluginaccess (c_pluginid INTEGER, c_userid INTEGER DEFAULT UID)
      RETURN BOOLEAN
   IS
      CURSOR c_username
      IS
         SELECT username
           FROM all_users
          WHERE user_id = c_userid;

      g_res    cm_adm_usergrants%ROWTYPE;
      usname   c_username%ROWTYPE;
      uname    VARCHAR2 (255);
   BEGIN
      OPEN c_username;
      FETCH c_username INTO usname;

      IF c_username%NOTFOUND
      THEN
         RETURN FALSE;
      ELSE
         uname := usname.username;
      END IF;

      CLOSE c_username;

      SELECT *
        INTO g_res
        FROM cm_adm_usergrants
       WHERE pluginid = c_pluginid AND userid = c_userid;

      RETURN TRUE;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN is_admin (uname);
   END;

--------------------------------------------------------------------------------
----------------------------    Check Access    >>------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------->>    Grants Manager    -----------------------------
--------------------------------------------------------------------------------

   PROCEDURE addusergrant (a_pluginid INTEGER, a_userid INTEGER DEFAULT UID)
   IS
   BEGIN
      INSERT INTO cm_adm_usergrants
                  (pluginid, userid
                  )
           VALUES (a_pluginid, a_userid
                  );
   --COMMIT WORK;
   END;

   PROCEDURE delusergrant (a_pluginid INTEGER, a_userid INTEGER DEFAULT UID)
   IS
   BEGIN
      DELETE FROM cm_adm_usergrants
            WHERE pluginid = a_pluginid AND userid = a_userid;
   --COMMIT WORK;
   END;

   PROCEDURE addcontroltype (c_typeid INTEGER, c_user VARCHAR2)
   IS
   BEGIN
      UPDATE cm_adm_users
         SET typeid = c_typeid
       WHERE NAME = c_user;
   END;

--------------------------------------------------------------------------------
---------------------------    Grants Manager    >>-----------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------->>    Groups Manager    -----------------------------
--------------------------------------------------------------------------------
   PROCEDURE grmaddgroup (
      g_name          VARCHAR2,
      g_typeid        INTEGER DEFAULT 0,
      g_description   VARCHAR2
   )
   IS
   BEGIN
      INSERT INTO cm_adm_groups
                  (NAME, typeid, description
                  )
           VALUES (g_name, g_typeid, g_description
                  );

      COMMIT WORK;
   END;

   PROCEDURE grmdelgroup (g_id INTEGER)
   IS
   BEGIN
      DELETE FROM cm_adm_groups
            WHERE ID = g_id;

      COMMIT WORK;
   END;

   PROCEDURE grmuseraddingroup (
      u_userid     INTEGER,
      u_groupid    INTEGER,
      u_usertype   INTEGER
   )
   IS
   BEGIN
      INSERT INTO cm_adm_groupmanager
                  (userid, groupid, usertype
                  )
           VALUES (u_userid, u_groupid, u_usertype
                  );
   END;

   PROCEDURE grmuseraddingroupbyname (
      u_username   VARCHAR2,
      u_groupid    INTEGER,
      u_usertype   INTEGER
   )
   IS
   BEGIN
      INSERT INTO cm_adm_groupmanager
                  (userid, groupid, usertype
                  )
           VALUES (getuserid (u_username), u_groupid, u_usertype
                  );
   END;

   PROCEDURE grmuserdelfromgroup (d_userid INTEGER, d_groupid INTEGER)
   IS
   BEGIN
      DELETE FROM cm_adm_groupmanager
            WHERE userid = d_userid AND groupid = d_groupid;
   END;

   PROCEDURE grmuserchangestatusingroup (
      c_userid      INTEGER,
      c_groupid     INTEGER,
      c_newstatus   INTEGER
   )
   IS
   BEGIN
      UPDATE cm_adm_groupmanager
         SET usertype = c_newstatus
       WHERE userid = c_userid AND groupid = c_groupid;
   END;

   PROCEDURE grmcleargroup (c_groupid INTEGER)
   IS
   BEGIN
      DELETE FROM cm_adm_groupmanager
            WHERE groupid = c_groupid;
   END;

--------------------------------------------------------------------------------
---------------------------    Groups Manager    >>-----------------------------
--------------------------------------------------------------------------------


   /*-------------------------- Advanced Procs-----------------------------------*/
   FUNCTION checkcredituser
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;

      CURSOR c_crdusr
      IS
         SELECT NAME
           FROM cm_adm_users
          WHERE NAME = USER;

      crdusr   c_crdusr%ROWTYPE;
   BEGIN
      OPEN c_crdusr;
      FETCH c_crdusr INTO crdusr;
      RESULT := c_crdusr%FOUND;
      RETURN RESULT;
   END;

   PROCEDURE checkaccessoperation (
      debitaccid    IN   INTEGER,
      creditaccid   IN   INTEGER,
      vidop         IN   INTEGER
   )
   IS
      RESULT   BOOLEAN;
      balacc   INTEGER;

      CURSOR c_denacc (p_bal IN INTEGER)
      IS
         SELECT bal_cn
           FROM cm_adm_operationgrants
          WHERE userid = (SELECT ID
                            FROM sb_user$
                           WHERE NAME = USER) AND bal_cn = p_bal;

      denacc   c_denacc%ROWTYPE;
   BEGIN
      IF NVL (vidop, 0) <> cm_decls.cmtransactionoptype
      THEN
         IF checkcredituser
         THEN
            SELECT bal_cn1
              INTO balacc
              FROM sb_account
             WHERE ID = debitaccid;

            OPEN c_denacc (balacc);
            FETCH c_denacc INTO denacc;
            RESULT := c_denacc%FOUND;
            CLOSE c_denacc;

            SELECT bal_cn1
              INTO balacc
              FROM sb_account
             WHERE ID = creditaccid;

            OPEN c_denacc (balacc);
            FETCH c_denacc INTO denacc;
            RESULT := RESULT OR (c_denacc%FOUND);
            CLOSE c_denacc;

            IF RESULT
            THEN
               raise_application_error (-20007, 'Ямялиййат апармаг олмаз!');
            END IF;
         END IF;
      END IF;
   END;

   FUNCTION checkaccessadvgr (p_name IN VARCHAR2)
      RETURN BOOLEAN
   IS
      CURSOR c_ch
      IS
         SELECT *
           FROM cm_adm_user_advgrants
          WHERE userid = UID AND grantid = (SELECT ID
                                              FROM cm_adm_advanced_grants
                                             WHERE NAME = p_name);

      ch       c_ch%ROWTYPE;
      RESULT   BOOLEAN;
   BEGIN
      OPEN c_ch;
      FETCH c_ch INTO ch;
      RESULT := c_ch%FOUND;
      CLOSE c_ch;
      RETURN RESULT;
   END;

   FUNCTION get_advgrerrormsg (p_name IN VARCHAR2)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (225);
   BEGIN
      SELECT errormessage
        INTO RESULT
        FROM cm_adm_advanced_grants
       WHERE NAME = p_name;

      RETURN RESULT;
   END;

   PROCEDURE checkadvgrants (p_name IN VARCHAR2, p_creditid IN INTEGER)
   IS
      currdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      IF USER <> usercreditsmgr
      THEN
         IF     cm_utils.get_crdcalcmethod (p_creditid) =
                                                      'CalcMethodForPlanRest'
            AND currdat < cm_utils.get_crdcurrentpaymentdat (p_creditid)
            AND (NOT checkaccessadvgr ('CheckPayment'))
         THEN
            raise_application_error (-20007, get_advgrerrormsg (p_name));
         END IF;
      END IF;
   END;

   PROCEDURE grantsysplugin (g_pluginid INTEGER)
   IS
   BEGIN
      INSERT INTO cm_adm_usergrants
         SELECT getuserid (NAME) userid, g_pluginid pluginid
           FROM cm_adm_users
          WHERE getuserid (NAME) NOT IN (SELECT userid
                                           FROM cm_adm_usergrants
                                          WHERE pluginid = g_pluginid)
            AND g_pluginid IN (SELECT ID
                                 FROM cm_adm_plugins
                                WHERE typeid = 1);
   END;

   PROCEDURE grantsysplugins (g_userid INTEGER)
   IS
   BEGIN
      INSERT INTO cm_adm_usergrants
         SELECT g_userid userid, p.ID pluginid
           FROM cm_adm_plugins p
          WHERE typeid = 1 AND g_userid NOT IN (SELECT userid
                                                  FROM cm_adm_usergrants
                                                 WHERE pluginid = p.ID);
   END;

   PROCEDURE addadvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER)
   IS
   BEGIN
      INSERT INTO cm_adm_operationgrants
                  (userid, bal_cn
                  )
           VALUES (p_userid, p_bal_acc
                  );

      COMMIT;
   END;

   PROCEDURE deladvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER)
   IS
   BEGIN
      DELETE      cm_adm_operationgrants
            WHERE userid = p_userid AND bal_cn = p_bal_acc;

      COMMIT;
   END;

   PROCEDURE updadvgrants (p_userid IN INTEGER, p_bal_acc IN INTEGER)
   IS
   BEGIN
      UPDATE cm_adm_operationgrants
         SET bal_cn = p_bal_acc
       WHERE userid = p_userid;

      COMMIT;
   END;

   PROCEDURE addadvusergrant (
      p_userid      IN   INTEGER,
      p_advgrname   IN   VARCHAR2,
      p_def         IN   BOOLEAN
   )
   IS
      grid   INTEGER;
   BEGIN
      IF p_def
      THEN
         SELECT ID
           INTO grid
           FROM cm_adm_advanced_grants
          WHERE description = p_advgrname;

         INSERT INTO cm_adm_user_advgrants
                     (grantid, userid
                     )
              VALUES (grid, p_userid
                     );
      ELSE
         deladvusergrant (p_userid, p_advgrname);
      END IF;

      COMMIT;
   END;

   PROCEDURE deladvusergrant (p_userid IN INTEGER, p_advgrname IN VARCHAR2)
   IS
   BEGIN
      DELETE      cm_adm_user_advgrants
            WHERE grantid = (SELECT ID
                               FROM cm_adm_advanced_grants
                              WHERE description = p_advgrname)
              AND userid = p_userid;

      COMMIT;
   END;

   FUNCTION checkadvusergrants (p_userid IN INTEGER, p_description IN VARCHAR2)
      RETURN BOOLEAN
   IS
      RESULT       BOOLEAN;

      CURSOR c_check
      IS
         SELECT grantid
           FROM cm_adm_user_advgrants
          WHERE grantid = (SELECT ID
                             FROM cm_adm_advanced_grants
                            WHERE description = p_description)
            AND userid = p_userid;

      checkadvgr   c_check%ROWTYPE;
   BEGIN
      OPEN c_check;
      FETCH c_check INTO checkadvgr;
      RESULT := c_check%FOUND;
      CLOSE c_check;
      RETURN RESULT;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_ADMINISTRATION

-- Start of DDL Script for Package CREDITSMGR.CM_AK_FUNCS
-- Generated 30-Apr-2007 11:01:26 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ak_funcs
IS
  function GetLMCount(crdid in integer, mcode in integer)
  return number;
  function GetIcraCount(crdid in integer, mcode in integer)
  return number;
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_ak_funcs
IS
function GetLMCount(crdid in integer, mcode in integer)
  return number
is
  res number;
begin
  select count(*)
    into res
    from cm_legal_measures
   where measurecode = mcode
     and creditid = crdid;
  
  return res;
exception when no_data_found then
  return 0; 
end;
function GetIcraCount(crdid in integer, mcode in integer)
  return number
is
  res number;
begin
/*
  select count(*)
    into res
    from cm_legal_measures
   where measurecode = mcode
     and creditid = crdid;
  */
  return 0;
exception when no_data_found then
  return 0; 
end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AK_FUNCS

-- Start of DDL Script for Package CREDITSMGR.CM_AK_REPORTS
-- Generated 30-Apr-2007 11:01:26 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ak_reports
    IS 
    PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE); 
    Function get_currency_ostat(p_creditid in integer,p_dat in date)  
  return number; 
    procedure Portfel_Filials(p_filialid in integer, 
                             p_per integer, 
                             p_bdate in date,p_edate in date); 
    function Get_Balcn(p_no in varchar2) 
  return number; 
  FUNCTION get_purpose_target (purpid number)
   RETURN NUMBER;
  FUNCTION getpurposemainid (pid number)
   RETURN number;
  FUNCTION gettableselect (usgrp INTEGER)
   RETURN VARCHAR2;
  PROCEDURE ins_agro_bvalues (p_edate IN DATE, p_wherestr IN VARCHAR2);
  PROCEDURE ins_agro_projvalues (p_edate IN DATE, p_wherestr IN VARCHAR2);
  PROCEDURE ins_agro_values (p_edate IN DATE, p_wherestr IN VARCHAR2);
  procedure insinfoablegm(p_id number, p_bdate date, p_edate date);
  PROCEDURE insinfoaboutcrediting (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfoabouttrouble (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfobp (p_id INTEGER);
  PROCEDURE insinfocreditpaying (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfof2 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  PROCEDURE insinfof2_full (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  PROCEDURE insinfof3 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  PROCEDURE insinfof3_filial (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
);
  PROCEDURE insinfof3_full (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
);
  PROCEDURE insinfof3_proj (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
);
  PROCEDURE insinfolast5yearpayments (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfolast5yeartranches (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfolastyearmpays (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfolastyearpayments (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfolastyeartranches (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfomeasures (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfomong (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfomusttr (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfoprolong (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfotrouble (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfoworldbankactive (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE insinfoworldbankmain (p_id INTEGER, p_bdate DATE, p_edate DATE);
  PROCEDURE maketemp (pbdat DATE, pedat DATE);
  PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE, includeold integer:=0);
  function get_pay(pay_sh in integer,pdate in date)
   return number;
  Function get_pledge(port_id in integer)
  return number;
  Function get_reserves(port_id in integer)
  return number;
  function Get_MonthPayment(p_creditid in integer,p_date in date)
  return number;
  function get_payint(pay_sh in integer,pdate in date)
   return number;
  function Get_PlanPayment(p_CrdID in integer, 
                           p_OpType in integer,
                           p_Dat in date )
  return number;
  function Get_Catdesc(p_CatID in integer)
return varchar2;
  function Get_CrdTypedesc(p_CatID in integer)
return varchar2;
  function Get_CustName(p_CustID in integer)
return varchar2;
  FUNCTION            get_filialname (b_id IN INTEGER)
   RETURN VARCHAR2;
  function Get_Perdesc(p_CatID in integer)
return varchar2;
  FUNCTION GET_RESERVE_PERCENT(p_id in integer) 
return integer;
  FUNCTION get_reserves_name(p_id in integer)
return varchar2;
  function Get_UserGrdesc(p_CatID in integer)
return varchar2;
  FUNCTION datapercentdiv (div1 NUMBER, div2 NUMBER)
   RETURN NUMBER;
  function get_creditcalcmethod(p_methodid in integer)
 return varchar2;
  function Get_CreditFullPayAmt(
                        p_creditID in integer,
                        p_Dat in Date)
return number;
  FUNCTION get_reserve_percent_date(p_creditid in integer,p_date in date) 
return integer;
  function Get_userNameByID(p_id in integer)
return varchar2;
  END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_ak_reports
  IS 
     PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE) 
     IS 
        CURSOR c_portfoliotrunc 
        IS 
           SELECT dateofconclusion d1, duedatefirstcontract d2 
             FROM cm_portfolio 
            WHERE ID = p_id; 
   
        CURSOR c_begininfo 
        IS 
           SELECT rest, 
                  rest*get_currency_ostat(creditid,hdate) as Erest, 
                  interestrest, 
                  interestrest*get_currency_ostat(creditid,hdate) as Einterestrest, 
                  duerest, 
                  duerest*get_currency_ostat(creditid,hdate) as Eduerest, 
                  dueinterestrest, 
                  dueinterestrest*get_currency_ostat(creditid,hdate) as Edueinterestrest 
             FROM cm_history 
            WHERE creditid = p_id 
            AND hdate = ( select max(hdate) from cm_history where hdate<=p_bdate); 
   
        CURSOR c_endinfo 
        IS 
           SELECT rest, 
                  rest*get_currency_ostat(creditid,hdate) as Erest, 
                  interestrest, 
                  interestrest*get_currency_ostat(creditid,hdate) as Einterestrest, 
                  duerest, 
                  duerest*get_currency_ostat(creditid,hdate) as Eduerest, 
                  dueinterestrest, 
                  dueinterestrest*get_currency_ostat(creditid,hdate) as Edueinterestrest 
             FROM cm_history 
            WHERE creditid = p_id 
            AND hdate = ( select max(hdate) from cm_history where hdate<=p_edate); 
   
        CURSOR c_paymentinfo 
        IS 
           SELECT NVL (SUM (i.payedamt), 0) amtmain 
                , NVL (SUM (i.payedamt*get_currency_ostat(creditid,paydate) ), 0)as Eamtmain 
                , NVL (SUM (i.payedintamt), 0) amtint 
                , NVL (SUM (i.payedintamt*get_currency_ostat(creditid,paydate) ), 0)as Eamtint 
                , NVL (SUM (i.payeddueamt), 0) amtduemain 
                , NVL (SUM (i.payeddueamt*get_currency_ostat(creditid,paydate ) ), 0) as Eamtduemain 
                , NVL (SUM (i.payeddueintamt), 0) amtdueint 
                , NVL (SUM (i.payeddueintamt*get_currency_ostat(creditid,paydate)), 0) as Eamtdueint 
             FROM cm_payments i 
            WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate; 
   
        CURSOR c_trchinfo 
        IS 
           SELECT NVL (SUM (trancheamount), 0) trchamt 
                 ,NVL (SUM (trancheamount*get_currency_ostat(creditid,tranchedate) ), 0)as Etrchamt 
             FROM cm_tranches 
            WHERE creditid = p_id AND tranchedate BETWEEN p_bdate AND p_edate; 
            
        cursor c_accounts is
        select loanaccid,
               dueloanaccid,
               interestaccid,
               dueinterestaccid,
               primaryreserveaccid,
               secondaryreserveaccid
         from cm_accounts where creditid=p_id;       
   
        begininfo        c_begininfo%ROWTYPE; 
        endinfo          c_endinfo%ROWTYPE; 
        paymentinfo      c_paymentinfo%ROWTYPE; 
        trchinfo         c_trchinfo%ROWTYPE; 
        portfoliotrunc   c_portfoliotrunc%ROWTYPE; 
        Accounts         c_Accounts%rowtype;
        montrunc         INTEGER; 
        AccName          Varchar2(30); 
        DueloanAccno     varchar2(30);
        InterestAccno    varchar2(30);
        DueinterestAccno    varchar2(30);
        prresrveaccno    varchar2(30);
        duereserveaccno    varchar2(30); 
     BEGIN 
   
        select nvl(acc_no,'  ') into AccName 
        from sb_account 
        where id = (select Loanaccid from cm_accounts where creditid=p_id ); 
        
         
        open c_accounts;
        fetch c_accounts into accounts;
        close c_accounts;  
        
        DueloanAccno :=cm_common.accountnumber_get(accounts.dueloanaccid); 
        interestAccno :=cm_common.accountnumber_get(accounts.interestaccid);
        DueinterestAccno :=cm_common.accountnumber_get(accounts.Dueinterestaccid);
        prresrveaccno :=cm_common.accountnumber_get(accounts.primaryreserveaccid);
        duereserveaccno :=cm_common.accountnumber_get(accounts.secondaryreserveaccid);

        OPEN c_begininfo; 
        FETCH c_begininfo INTO begininfo; 
        CLOSE c_begininfo; 
        OPEN c_endinfo; 
        FETCH c_endinfo INTO endinfo; 
        CLOSE c_endinfo; 
        OPEN c_paymentinfo; 
        FETCH c_paymentinfo INTO paymentinfo; 
        CLOSE c_paymentinfo; 
        OPEN c_trchinfo; 
        FETCH c_trchinfo INTO trchinfo; 
        CLOSE c_trchinfo; 
        OPEN c_portfoliotrunc; 
        FETCH c_portfoliotrunc INTO portfoliotrunc; 
        CLOSE c_portfoliotrunc; 
        montrunc := 
                  TRUNC (MONTHS_BETWEEN (portfoliotrunc.d2, portfoliotrunc.d1 
  )); 
   
        INSERT INTO cm_report_sd1 
             VALUES (p_id 
                   , AccName 
                   ,interestAccno
                   ,DueloanAccno
                   ,DueinterestAccno
                   ,prresrveaccno
                   ,duereserveaccno
                   , NVL (begininfo.rest, 0) 
                   , NVL (begininfo.erest,0) 
                   , NVL (begininfo.interestrest, 0) 
                   , NVL (begininfo.einterestrest,0) 
                   , NVL (begininfo.duerest, 0) 
                   , NVL (begininfo.eduerest,0) 
                   , NVL (begininfo.dueinterestrest, 0) 
                   , NVL (begininfo.edueinterestrest,0) 
                   , NVL (paymentinfo.amtmain, 0) 
                   , NVL (paymentinfo.eamtmain,0) 
                   , NVL (paymentinfo.amtint, 0) 
                   , NVL (paymentinfo.eamtint, 0) 
                   , NVL (paymentinfo.amtduemain, 0) 
                   , NVL (paymentinfo.eamtduemain, 0) 
                   , NVL (paymentinfo.amtdueint, 0) 
                   , NVL (paymentinfo.eamtdueint, 0) 
                   , NVL (trchinfo.trchamt, 0) 
                   , NVL (trchinfo.etrchamt, 0) 
                   , NVL (endinfo.rest, 0) 
                   , NVL (endinfo.erest, 0) 
                   , NVL (endinfo.interestrest, 0) 
                   , NVL (endinfo.einterestrest, 0) 
                   , NVL (endinfo.duerest, 0) 
                   , NVL (endinfo.eduerest, 0) 
                   , NVL (endinfo.dueinterestrest, 0) 
                   , NVL (endinfo.edueinterestrest, 0) 
                   , montrunc); 
     END; 
   
     PROCEDURE insinfof1_ (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE) 
     IS 
        CURSOR c_crd_info 
        IS 
           SELECT d.ID districtid, d.NAME district, v.ID villageid 
                , v.NAME village, t.ID typeid, t.typedesc, m.ID purposeid 
                , m.NAME purpose, f.ID branchid, f.NAME branch 
                , p.numberofcredit crdnum, p.boorowerid, i.NAME boorowername 
             FROM cm_business_plan b 
                , agro_region d 
                , agro_village v 
                , cm_bp_types t 
                , agro_kredit_purpose m 
                , sb_filial f 
                , cm_portfolio p 
                , cm_boorowerinfo i 
            WHERE v.depend_id = d.ID 
              AND b.villageid = v.ID 
              AND b.TYPE = t.ID 
              AND b.akpurpose = m.ID 
              AND b.creditid = p.ID 
              AND p.branchid = f.ID 
              AND p.ID = i.creditid 
              AND p.ID = p_id; 
   
        CURSOR c_min_date 
        IS 
           SELECT MIN (tranchedate) trdate 
             FROM cm_tranches 
            WHERE creditid = p_id; 
   
        CURSOR c_max_date 
        IS 
           SELECT MAX (paydate) paydate 
             FROM cm_payments 
            WHERE creditid = p_id; 
   
        CURSOR c_histinfo 
        IS 
           SELECT rest, interestrest, duerest, dueinterestrest 
             FROM cm_history 
            WHERE creditid = p_id AND hdate = p_edate; 
   
        CURSOR c_amount 
        IS 
           SELECT SUM (trancheamount) amt 
             FROM cm_tranches 
            WHERE creditid = p_id AND tranchedate < p_edate; 
   
        CURSOR c_payinfo_month 
        IS 
           SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt 
             FROM cm_payments 
            WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate; 
   
        CURSOR c_payinfo 
        IS 
           SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt 
                , SUM (payeddueamt) payeddueamt 
                , SUM (payeddueintamt) payeddueintamt 
             FROM cm_payments 
            WHERE creditid = p_id AND paydate < p_edate; 
   
        CURSOR c_payplane 
        IS 
           SELECT SUM (principal) principal, SUM (interest) interest 
             FROM cm_payment_schedule 
            WHERE creditid = p_id AND paymentdate < p_edate; 
   
        crdinfo         c_crd_info%ROWTYPE; 
        histinfo        c_histinfo%ROWTYPE; 
        overcount       INTEGER; 
        min_date        c_min_date%ROWTYPE; 
        max_date        c_max_date%ROWTYPE; 
        amounti         c_amount%ROWTYPE; 
        payplaneinfo    c_payplane%ROWTYPE; 
        payinfo         c_payinfo%ROWTYPE; 
        payinfo_month   c_payinfo_month%ROWTYPE; 
     BEGIN 
        OPEN c_crd_info; 
        FETCH c_crd_info INTO crdinfo; 
        CLOSE c_crd_info; 
        OPEN c_histinfo; 
        FETCH c_histinfo INTO histinfo; 
        CLOSE c_histinfo; 
   
        IF (    (histinfo.rest = 0) 
            AND (histinfo.interestrest = 0) 
            AND (histinfo.duerest = 0) 
            AND (histinfo.dueinterestrest = 0) 
           ) 
        THEN 
           overcount := 0; 
        ELSE 
           overcount := 1; 
        END IF; 
   
        OPEN c_min_date; 
        FETCH c_min_date INTO min_date; 
        CLOSE c_min_date; 
        OPEN c_max_date; 
        FETCH c_max_date INTO max_date; 
        CLOSE c_max_date; 
        OPEN c_amount; 
        FETCH c_amount INTO amounti; 
        CLOSE c_amount; 
        OPEN c_payplane; 
        FETCH c_payplane INTO payplaneinfo; 
        CLOSE c_payplane; 
        OPEN c_payinfo; 
        FETCH c_payinfo INTO payinfo; 
        CLOSE c_payinfo; 
        OPEN c_payinfo_month; 
        FETCH c_payinfo_month INTO payinfo_month; 
        CLOSE c_payinfo_month; 
  ---raise_application_error(-20005, crdinfo.crdnum); 
        /*INSERT INTO cm_report_f1 
             VALUES (p_id, NVL (crdinfo.boorowerid, 0) 
                   , NVL (crdinfo.crdnum, ''), NVL (crdinfo.boorowername, '') 
                   , NVL (crdinfo.branchid, 0), NVL (crdinfo.branch, '') 
                   , NVL (crdinfo.districtid, 0), NVL (crdinfo.district, '') 
                   , NVL (crdinfo.villageid, 0), NVL (crdinfo.village, '') 
                   , NVL (crdinfo.purposeid, 0), NVL (crdinfo.purpose, '') 
                   , NVL (crdinfo.typeid, 0), NVL (crdinfo.typedesc, ''), 1 
                   , overcount, NVL (min_date.trdate, SYSDATE) 
                   , NVL (max_date.paydate, SYSDATE), NVL (amounti.amt, 0) 
                   , NVL (payplaneinfo.interest, 0) 
                   , NVL (payplaneinfo.principal, 0) 
                   , NVL (payplaneinfo.interest, 0) 
                   , NVL (payinfo.payedamt, 0) + NVL (payinfo.payeddueamt, 0) 
                   ,   NVL (payinfo.payedintamt, 0) 
                     + NVL (payinfo.payeddueintamt, 0) 
                   , NVL (payinfo_month.payedamt, 0) 
                   , NVL (payinfo_month.payedintamt, 0) 
                   , NVL (histinfo.rest, 0) + NVL (histinfo.duerest, 0) 
                   ,   NVL (histinfo.interestrest, 0) 
                     + NVL (histinfo.dueinterestrest, 0) 
                   , NVL (histinfo.duerest, 0) 
                   , NVL (histinfo.dueinterestrest, 0)); */
    /*  EXCEPTION 
         WHEN OTHERS 
         THEN 
            raise_application_error (-20003, p_id);*/ 
     END; 
   procedure Portfel_Filials(p_filialid in integer, 
                             p_per integer, 
                             p_bdate in date,p_edate in date) is 
    
    cursor c_persons is 
    select id  
    from cm_persons; 
     
    cursor c_filial is 
    select id,name 
    from sb_filial 
    where id in (select branchid from cm_active_credits); 
     
    cursor c_Rest(p_branchid in integer,p_dat in date,p_Per in number) is 
    select sum(rest*get_currency_ostat(creditid,hdate))+ 
           sum(duerest*get_currency_ostat(creditid,hdate)) as RestAll, 
           sum(rest*get_currency_ostat(creditid,hdate)) as Rest, 
           sum(Duerest*get_currency_ostat(creditid,hdate)) as RestDue 
           from cm_history 
    where creditid in (select id from cm_active_credits where branchid=p_branchid  
  and personaltype=p_Per) 
    and hdate =(select max(hdate) from cm_history where hdate<=p_dat); 
     
    cursor c_Tranches(p_branchid in integer,p_bdate in date,p_edate in date,p_Per in number) is 
    select sum(TRANCHEAMOUNT*get_currency_ostat(creditid,TRANCHEDATE)) as Tramt 
    from cm_tranches 
    where TRANCHEDATE between p_bdate and p_edate 
    and creditid in (select id from cm_active_credits where branchid=p_branchid and personaltype=p_per); 
     
    cursor c_Payments(p_branchid in integer,p_bdate in date,p_edate in date,p_Per in number) is 
    select sum(PAYEDAMT*get_currency_ostat(creditid,paydate)) as Payamt, 
           sum(PAYEDDUEAMT*get_currency_ostat(creditid,paydate)) as PayamtDue 
    from cm_payments 
    where paydate between p_bdate and p_edate 
    and creditid in (select id from cm_active_credits where branchid=p_branchid and personaltype=p_per); 
     
    cursor c_Expires(p_branchid in integer,p_bdate in date,p_edate in date,p_Per in number) is 
    select sum(EXPAMOUNT*get_currency_ostat(creditid,expdate)) as Expamt 
    from cm_expires 
    where expdate between p_bdate and p_edate 
    and creditid in (select id from cm_active_credits where branchid=p_branchid and personaltype=p_per); 
     
    cursor c_Tranche_Shedule(p_branchid in integer,p_dat in date,p_Per in number) is 
    select sum(trchamount*get_currency_ostat(creditid,trchdate)) as TramtSh 
    from cm_tranche_schedule 
    where creditid in (select id from cm_active_credits where branchid=p_branchid  
  and personaltype=p_per) 
    and trchdate = (select max(trchdate) from cm_tranche_schedule where trchdate<=p_dat); 
     
    cursor c_Payment_Shedule(p_branchid in integer,p_dat in date,p_Per in number) is 
    select sum(principal*get_currency_ostat(creditid,paymentdate)) as PaySh 
    from cm_payment_schedule 
    where creditid in (select id from cm_active_credits where branchid=p_branchid  
  and personaltype =p_per) 
    and paymentdate = (select max(paymentdate) from cm_payment_schedule where 
   paymentdate<=p_dat); 
     
     
     FilialInfo c_filial%RowType; 
     RestInfo c_Rest%RowType; 
     RestInfoLast c_Rest%RowType; 
     TranchInfo c_Tranches%RowType; 
     PaymentInfo c_Payments%Rowtype; 
     ExpInfo c_Expires%RowType; 
     Tranche_Shedule c_Tranche_Shedule%Rowtype; 
     Payment_Shedule c_Payment_Shedule%RowType; 
       
     pername varchar2(20); 
     Branchname varchar2(50); 
     PercentExpires number:=0;       
   begin 
   
          select DESCRIPION into pername 
          from cm_persons 
          where id=p_per; 
           
          select name into Branchname 
          from sb_filial 
          where id=p_filialid; 
           
            
           open c_rest(p_filialid,p_bdate,p_per); 
           fetch c_rest into RestInfo; 
           close c_rest; 
            
           open c_Tranches(p_filialid,p_bdate,p_edate,p_per); 
           fetch c_Tranches into TranchInfo; 
           close c_Tranches; 
            
           open c_Payments(p_filialid,p_bdate,p_edate,p_per); 
           fetch c_Payments into PaymentInfo; 
           close c_Payments; 
            
           open c_Expires(p_filialid,p_bdate,p_edate,p_per); 
           fetch c_Expires into ExpInfo; 
           close c_Expires; 
   
           open c_rest(p_filialid,p_edate,p_per); 
           fetch c_rest into RestInfoLast; 
           close c_rest; 
   
           open c_Tranche_Shedule(p_filialid,p_edate,p_per); 
           fetch c_Tranche_Shedule into Tranche_Shedule; 
           close c_Tranche_Shedule; 
             
           open c_Payment_Shedule(p_filialid,p_edate,p_per); 
           fetch c_Payment_Shedule into Payment_Shedule; 
           close c_Payment_Shedule; 
            
           PercentExpires := ExpInfo.expamt*100/(RestInfoLast.RestAll+1); 
            
           insert into cm_port_filials(personsname, filialname, facticalrest, 
    
                                       rest, restdue, tramt,payamt, paydue,  
                                       expamt, lastfacticalrest, lastrest, lastduerest, 
                                       percentexp, tranchplamt, payplamt) 
           values(pername,Branchname,nvl(RestInfo.RestAll,0), 
                  nvl(RestInfo.Rest,0),nvl(RestInfo.Restdue,0),nvl(TranchInfo.tramt,0), 
                  nvl(PaymentInfo.payamt,0),nvl(PaymentInfo.PayamtDue,0), 
                  nvl(expinfo.expamt,0),nvl(RestInfoLast.RestAll,0), 
                  nvl(RestInfoLast.Rest,0),nvl(RestInfoLast.Restdue,0), 
                  PercentExpires,nvl(Tranche_Shedule.TramtSh,0),nvl(Payment_Shedule.PaySh,0));                             
             
   
   end; 
      
  Function get_currency_ostat(p_creditid in integer,p_dat in date)  
  return number 
  is 
  result number; 
  begin 
    select ostat into result 
    from sb_operkurs 
    where val_kod =(select currency from cm_portfolio where id=p_creditid) 
    and dat = (select max(dat) from sb_operkurs where dat<=p_dat); 
    return result; 
  end;    
   
  function Get_Balcn(p_no in varchar2) 
  return number 
  is 
  result number; 
  begin 
   
     select bal_cn1 into result 
     from sb_account 
     where acc_no=p_no; 
      
     return result; 
  end;
  function get_pay(pay_sh in integer,pdate in date)
   return number
   is
      cursor p is
      select PAYEDAMT from cm_payments
      where creditid=pay_sh and PAYDATE=pdate;
   result number;
   begin
      open p ;
      fetch P into result;
      close p;
      if result is null
      then
      result:=0;
      end if;
      return result;
   end;
   Function get_reserves(port_id in integer)
  return number
  is
  cursor r is
    SELECT reserveid
        FROM cm_history
            WHERE creditid=port_id;
    result number;
    begin
      open r ;
      fetch r into result;
      close r;
      if result is null
      then
      result:=0;
      end if;
      return result;
   end;

  Function get_pledge(port_id in integer)
  return number
  is
  cursor pl is
    SELECT PLEDGEID
        FROM cm_guarantee
            WHERE creditid=port_id;
    result number;
    begin
      open pl ;
      fetch pl into result;
      close pl;
      if result is null
      then
      result:=0;
      end if;
      return result;
   end; 
  
PROCEDURE insinfof2 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND bp.creditid (+) = p.ID
         AND p.ID = p_id;

   CURSOR c_tranch_all
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

   CURSOR c_tranch_year
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id
         AND tranchedate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_tranch_mon
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate BETWEEN p_bdate AND p_edate;

   CURSOR c_scheduleinfo
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id AND paymentdate <= p_edate;

   CURSOR c_scheduleinfomon
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate BETWEEN p_bdate AND p_edate;
   CURSOR c_payments
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate <= p_edate;

   CURSOR c_payments_year
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_payments_mon
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

   CURSOR c_histinfo(pp_date date)
   IS
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= pp_date) AND creditid = p_id;

   crdinfo         c_crdinfo%ROWTYPE;
   tranch_all      c_tranch_all%ROWTYPE;
   tranch_year     c_tranch_year%ROWTYPE;
   tranch_mon      c_tranch_mon%ROWTYPE;
   scheduleinfo    c_scheduleinfo%ROWTYPE;
   scheduleinfomon c_scheduleinfomon%ROWTYPE;
   payments        c_payments%ROWTYPE;
   payments_year   c_payments_year%ROWTYPE;
   payments_mon    c_payments_mon%ROWTYPE;
   histinfo        c_histinfo%ROWTYPE;
   histinfoy       c_histinfo%ROWTYPE;
   histinfom       c_histinfo%ROWTYPE;
   
   percentmain     number;            
   percentint      number;  
   
   cntall          integer := 1;
   cntreturn       integer := 0;
   cntretyear      integer := 0;
   cntretmon       integer := 0;              
BEGIN
   OPEN c_crdinfo;
   FETCH c_crdinfo INTO crdinfo;
   CLOSE c_crdinfo;
   OPEN c_tranch_all;
   FETCH c_tranch_all INTO tranch_all;
   CLOSE c_tranch_all;
   OPEN c_tranch_year;
   FETCH c_tranch_year INTO tranch_year;
   CLOSE c_tranch_year;
   OPEN c_tranch_mon;
   FETCH c_tranch_mon INTO tranch_mon;
   CLOSE c_tranch_mon;
   OPEN c_scheduleinfo;
   FETCH c_scheduleinfo INTO scheduleinfo;
   CLOSE c_scheduleinfo;
   OPEN c_scheduleinfomon;
   FETCH c_scheduleinfomon INTO scheduleinfomon;
   CLOSE c_scheduleinfomon;
   OPEN c_payments;
   FETCH c_payments INTO payments;
   CLOSE c_payments;
   OPEN c_payments_year;
   FETCH c_payments_year INTO payments_year;
   CLOSE c_payments_year;
   OPEN c_payments_mon;
   FETCH c_payments_mon INTO payments_mon;
   CLOSE c_payments_mon;
   OPEN c_histinfo(p_edate);
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'Y'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'MON'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;

   IF (scheduleinfo.principal = 0)
   THEN
      percentmain := 100;
   ELSE
      percentmain := round((100*(payments.payedamt / scheduleinfo.principal)),1);
   END IF;


   IF (scheduleinfo.interest = 0)
   THEN
      percentint := 100;
   ELSE
      percentint := round((100*(payments.payedintamt / scheduleinfo.interest)),1);
   END IF;

   IF (histinfo.rest+histinfo.duerest+histinfo.interestrest+histinfo.dueinterestrest<100)
   THEN
     cntreturn := 0;
   ELSE
     cntreturn := 1;
   END IF;
   
   IF (histinfoy.rest+histinfoy.duerest+histinfoy.interestrest+histinfoy.dueinterestrest<100)
   THEN
     cntretyear := 1;
   ELSE
     cntretyear := 0;
   END IF;
   
   IF (histinfom.rest+histinfom.duerest+histinfom.interestrest+histinfom.dueinterestrest<100)
   THEN
     cntretmon := 1;
   ELSE
     cntretmon := 0;
   END IF;
   
   INSERT INTO cm_report_f2
        VALUES (
                NVL (crdinfo.crdid, 0) 
              , NVL (crdinfo.boorowerid, 0)
              , NVL (crdinfo.boorower, '-')
              , NVL (crdinfo.crdnum, '-')
              , NVL (crdinfo.branchid, 0)
              , NVL (crdinfo.branch, '-')
              , NVL (crdinfo.typeid, 0)
              , NVL (cntall, 0)
              , NVL (cntreturn, 0)
              , NVL (cntretyear, 0)
              , NVL (cntretmon, 0)
              , NVL (tranch_all.tramt, 0)
              , NVL (payments.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_year.tramt, 0)
              , NVL (payments_year.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_mon.tramt, 0)
              , NVL (payments_mon.payedintamt+histinfo.interestrest, 0)
              , NVL (scheduleinfo.principal, 0)
              , NVL (scheduleinfo.interest, 0)
              , NVL (scheduleinfomon.principal, 0)
              , NVL (scheduleinfomon.interest, 0)
              , NVL (payments.payedamt, 0)
              , NVL (payments.payedintamt, 0)
              , NVL (payments_year.payedamt, 0)
              , NVL (payments_year.payedintamt, 0)
              , NVL (payments_mon.payedamt, 0)
              , NVL (payments_mon.payedintamt, 0)
              , NVL (histinfo.rest+histinfo.duerest, 0)
              , NVL (histinfo.interestrest+histinfo.dueinterestrest, 0)
              , NVL (histinfo.duerest, 0)
              , NVL (histinfo.dueinterestrest, 0)
              , NVL (percentmain, 0)
              , NVL (percentint, 0));
END;

PROCEDURE insinfof3 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
           , get_purpose_target(bp.akpurpose) purposeid
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND bp.creditid (+) = p.ID
         AND p.ID = p_id;

   CURSOR c_tranch_all
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

   CURSOR c_tranch_year
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id
         AND tranchedate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_tranch_mon
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate BETWEEN p_bdate AND p_edate;

   CURSOR c_scheduleinfo
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id AND paymentdate <= p_edate;

   CURSOR c_payments
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate <= p_edate;

   CURSOR c_payments_year
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_payments_mon
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

   CURSOR c_histinfo(pp_date date)
   IS
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= pp_date) AND creditid = p_id;

   crdinfo         c_crdinfo%ROWTYPE;
   tranch_all      c_tranch_all%ROWTYPE;
   tranch_year     c_tranch_year%ROWTYPE;
   tranch_mon      c_tranch_mon%ROWTYPE;
   scheduleinfo    c_scheduleinfo%ROWTYPE;
   payments        c_payments%ROWTYPE;
   payments_year   c_payments_year%ROWTYPE;
   payments_mon    c_payments_mon%ROWTYPE;
   histinfo        c_histinfo%ROWTYPE;
   histinfoy       c_histinfo%ROWTYPE;
   histinfom       c_histinfo%ROWTYPE;
   
   percentmain     number;            
   percentint      number;  
   
   cntall          integer := 1;
   cntreturn       integer := 0;
   cntretyear      integer := 0;
   cntretmon       integer := 0;              
BEGIN
   OPEN c_crdinfo;
   FETCH c_crdinfo INTO crdinfo;
   CLOSE c_crdinfo;
   OPEN c_tranch_all;
   FETCH c_tranch_all INTO tranch_all;
   CLOSE c_tranch_all;
   OPEN c_tranch_year;
   FETCH c_tranch_year INTO tranch_year;
   CLOSE c_tranch_year;
   OPEN c_tranch_mon;
   FETCH c_tranch_mon INTO tranch_mon;
   CLOSE c_tranch_mon;
   OPEN c_scheduleinfo;
   FETCH c_scheduleinfo INTO scheduleinfo;
   CLOSE c_scheduleinfo;
   OPEN c_payments;
   FETCH c_payments INTO payments;
   CLOSE c_payments;
   OPEN c_payments_year;
   FETCH c_payments_year INTO payments_year;
   CLOSE c_payments_year;
   OPEN c_payments_mon;
   FETCH c_payments_mon INTO payments_mon;
   CLOSE c_payments_mon;
   OPEN c_histinfo(p_edate);
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'Y'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'MON'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;

   IF (scheduleinfo.principal = 0)
   THEN
      percentmain := 100;
   ELSE
      percentmain := round((100*(payments.payedamt / scheduleinfo.principal)),1);
   END IF;


   IF (scheduleinfo.interest = 0)
   THEN
      percentint := 100;
   ELSE
      percentint := round((100*(payments.payedintamt / scheduleinfo.interest)),1);
   END IF;

   IF (histinfo.rest+histinfo.duerest+histinfo.interestrest+histinfo.dueinterestrest<100)
   THEN
     cntreturn := 1;
   ELSE
     cntreturn := 0;
   END IF;
   
   IF (histinfoy.rest+histinfoy.duerest+histinfoy.interestrest+histinfoy.dueinterestrest<100)
   THEN
     cntretyear := 1;
   ELSE
     cntretyear := 0;
   END IF;
   
   IF (histinfom.rest+histinfom.duerest+histinfom.interestrest+histinfom.dueinterestrest<100)
   THEN
     cntretmon := 1;
   ELSE
     cntretmon := 0;
   END IF;
   
   INSERT INTO cm_report_f3
        VALUES (
                NVL (crdinfo.crdid, 0) 
              , NVL (crdinfo.boorowerid, 0)
              , NVL (crdinfo.boorower, '-')
              , NVL (crdinfo.crdnum, '-')
              , NVL (crdinfo.branchid, 0)
              , NVL (crdinfo.branch, '-')
              , NVL (crdinfo.typeid, 0)
              , NVL (crdinfo.purposeid, 0)
              , NVL (cntall, 0)
              , NVL (cntreturn, 0)
              , NVL (cntretyear, 0)
              , NVL (cntretmon, 0)
              , NVL (tranch_all.tramt, 0)
              , NVL (payments.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_year.tramt, 0)
              , NVL (payments_year.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_mon.tramt, 0)
              , NVL (payments_mon.payedintamt+histinfo.interestrest, 0)
              , NVL (scheduleinfo.principal, 0)
              , NVL (scheduleinfo.interest, 0)
              , NVL (payments.payedamt, 0)
              , NVL (payments.payedintamt, 0)
              , NVL (payments_year.payedamt, 0)
              , NVL (payments_year.payedintamt, 0)
              , NVL (payments_mon.payedamt, 0)
              , NVL (payments_mon.payedintamt, 0)
              , NVL (histinfo.rest+histinfo.duerest, 0)
              , NVL (histinfo.interestrest+histinfo.dueinterestrest, 0)
              , NVL (histinfo.duerest, 0)
              , NVL (histinfo.dueinterestrest, 0)
              , NVL (percentmain, 0)
              , NVL (percentint, 0));
END;

PROCEDURE insinfobp (p_id INTEGER)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid
           , c.boorowerid custid
           , i.NAME custname
           , c.numberofcredit crdnum
           , NVL (b.TYPE, 0) typeid
           , NVL (b.projectcost, 0) projectcost
           , NVL (b.givencredit, 0) givencredit
           , NVL (b.untmeansofproduction, 0) untmeansofproduction
           , NVL (b.numberofproduction, 0) numberofproduction
           , NVL (b.untproduction, 0) untproduction
           , NVL (b.production, 0) production
           , NVL (b.productivity, 0) productivity
           , NVL (b.productioncost, 0) productioncost
           , NVL (b.sumprofit, 0) sumprofit
           , NVL (b.boughtmaterial, 0) boughtmaterial
           , NVL (b.operationexpense, 0) operationexpense
           , NVL (b.taxexpense, 0) taxexpense
           , NVL (b.otherexpence, 0) otherexpence
           , NVL (b.sumexpense, 0) sumexpense
           , NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID) 
         AND c.ID = p_id;

   CURSOR c_min_date
   IS
      SELECT MIN (tranchedate) trdate
        FROM agro_tranches
       WHERE creditid = p_id;

   CURSOR c_max_date
   IS
      SELECT MAX (paymentdate) paydate
        FROM cm_all_payment_schedule
       WHERE creditid = p_id;

   crdinf     c_crdinf%ROWTYPE;
   min_date   c_min_date%ROWTYPE;
   max_date   c_max_date%ROWTYPE;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   OPEN c_min_date;
   FETCH c_min_date INTO min_date;
   CLOSE c_min_date;
   OPEN c_max_date;
   FETCH c_max_date INTO max_date;
   CLOSE c_max_date;

   INSERT INTO cm_report_bp
        VALUES (crdinf.creditid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.custid
              , crdinf.custname
              , crdinf.typeid
              , crdinf.crdnum
              , min_date.trdate
              , max_date.paydate
              , crdinf.projectcost
              , crdinf.givencredit
              , crdinf.untmeansofproduction
              , crdinf.untproduction
              , crdinf.numberofproduction
              , crdinf.production
              , crdinf.boughtmaterial
              , crdinf.operationexpense
              , crdinf.otherexpence
              , crdinf.productioncost
              , crdinf.productivity
              , crdinf.sumexpense
              , crdinf.sumprofit
              , crdinf.taxexpense
              , 'ясас'
              , crdinf.sumprofit
              , crdinf.sumprofit - crdinf.sumexpense
              , crdinf.givencredit);
END;

PROCEDURE insinfotrouble (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.branchid, NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid, c.boorowerid custid
           , i.NAME custname, NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum, g.pledgepricetorpaqha girovtorpaq
           , h.pledgepricetorpaq girovtorpaqcost, g.pledgepriceevkv girovev
           , h.pledgepriceev girovevcost, h.pledgeprice girovother
           , h.pledgepriceev + h.pledgeprice + h.pledgepricetorpaq girovyekun
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
           , cm_curr_state h
           , cm_guarantee g
       WHERE (b.creditid(+) = c.ID)
         AND (h.creditid = c.ID)
         AND (g.creditid = c.ID)
         AND (i.creditid = c.ID)
         AND c.ID = p_id;

   CURSOR c_min_date
   IS
      SELECT MIN (tranchedate) trdate
        FROM agro_tranches
       WHERE creditid = p_id;

   CURSOR c_max_date
   IS
      SELECT MAX (paymentdate) paydate
        FROM cm_all_payment_schedule
       WHERE creditid = p_id;

   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id AND hdate = (SELECT MAX (hdate)
                                            FROM cm_history
                                           WHERE hdate <= p_edate);

   CURSOR c_preten_info
   IS
      SELECT creditid, measurecode, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 4
       GROUP BY creditid, measurecode;

   CURSOR c_iddia_info
   IS
      SELECT creditid, measurecode, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 6
       GROUP BY creditid, measurecode;

   CURSOR c_qatname_info
   IS
      SELECT creditid, measurecode, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 7
       GROUP BY creditid, measurecode;

   CURSOR c_tranch
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

   CURSOR c_payments
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate <= p_edate;

   CURSOR c_payment_d(dd date)
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM cm_payments
       WHERE creditid = p_id AND paydate > dd;

   crdinf         c_crdinf%ROWTYPE;
   min_date       c_min_date%ROWTYPE;
   max_date       c_max_date%ROWTYPE;
   histinfo       c_histinfo%ROWTYPE;
   iddia_info     c_iddia_info%ROWTYPE;
   preten_info    c_preten_info%ROWTYPE;
   qatname_info   c_qatname_info%ROWTYPE;
   tranch         c_tranch%rowtype;
   payments       c_payments%rowtype;
   payment_d      c_payment_d%rowtype;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   OPEN c_min_date;
   FETCH c_min_date INTO min_date;
   CLOSE c_min_date;
   OPEN c_max_date;
   FETCH c_max_date INTO max_date;
   CLOSE c_max_date;
   OPEN c_histinfo;
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo;
   OPEN c_preten_info;
   FETCH c_preten_info INTO preten_info;
   CLOSE c_preten_info;
   OPEN c_iddia_info;
   FETCH c_iddia_info INTO iddia_info;
   CLOSE c_iddia_info;
   OPEN c_qatname_info;
   FETCH c_qatname_info INTO qatname_info;
   CLOSE c_qatname_info;
   
   OPEN c_tranch;
   FETCH c_tranch INTO tranch;
   CLOSE c_tranch;
   
   OPEN c_payments;
   FETCH c_payments INTO payments;
   CLOSE c_payments;
   
   OPEN c_payment_d(preten_info.givedate);
   FETCH c_payment_d INTO payment_d;
   CLOSE c_payment_d;

   INSERT INTO cm_report_trouble
        VALUES (crdinf.creditid
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.custid
              , crdinf.custname
              , crdinf.typeid
              , crdinf.crdnum
              , min_date.trdate
              , max_date.paydate
              , tranch.tramt
              , payments.payedintamt+histinfo.interestrest+histinfo.dueinterestrest
              , histinfo.rest+histinfo.duerest
              , histinfo.interestrest+histinfo.dueinterestrest
              , histinfo.duerest
              , histinfo.dueinterestrest
              , 0
              , 0
              , 0
              , 0
              , crdinf.girovtorpaq
              , crdinf.girovtorpaqcost
              , crdinf.girovev
              , crdinf.girovevcost
              , crdinf.girovother
              , crdinf.girovyekun
              , preten_info.givedate
              , iddia_info.givedate
              , preten_info.TOTALAMOUNT
              , iddia_info.TOTALAMOUNT
              , preten_info.maindebt
              , qatname_info.givedate
              , payment_d.payedamt+payment_d.payedintamt
              , payment_d.payedamt);
END;

PROCEDURE insinfolastyeartranches (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
        FROM cm_active_credits c, cm_boorowerinfo i, cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   CURSOR c_trchinfo (begd DATE := '01-jan-1970', endd DATE := SYSDATE)
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate BETWEEN begd AND endd;

   crdinf    c_crdinf%ROWTYPE;
   trchall   c_trchinfo%ROWTYPE;
   trch_01   c_trchinfo%ROWTYPE;
   trch_02   c_trchinfo%ROWTYPE;
   trch_03   c_trchinfo%ROWTYPE;
   trch_04   c_trchinfo%ROWTYPE;
   trch_05   c_trchinfo%ROWTYPE;
   trch_06   c_trchinfo%ROWTYPE;
   trch_07   c_trchinfo%ROWTYPE;
   trch_08   c_trchinfo%ROWTYPE;
   trch_09   c_trchinfo%ROWTYPE;
   trch_10   c_trchinfo%ROWTYPE;
   trch_11   c_trchinfo%ROWTYPE;
   trch_12   c_trchinfo%ROWTYPE;
   ydate     DATE;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   OPEN c_trchinfo;
   FETCH c_trchinfo INTO trchall;
   CLOSE c_trchinfo;
   ydate := TRUNC (p_edate, 'Y');
   OPEN c_trchinfo (ydate, ydate + 30);
   FETCH c_trchinfo INTO trch_01;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 31, ydate + 58);
   FETCH c_trchinfo INTO trch_02;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 59, ydate + 89);
   FETCH c_trchinfo INTO trch_03;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 90, ydate + 119);
   FETCH c_trchinfo INTO trch_04;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 120, ydate + 150);
   FETCH c_trchinfo INTO trch_05;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 151, ydate + 180);
   FETCH c_trchinfo INTO trch_06;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 181, ydate + 211);
   FETCH c_trchinfo INTO trch_07;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 212, ydate + 242);
   FETCH c_trchinfo INTO trch_08;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 243, ydate + 272);
   FETCH c_trchinfo INTO trch_09;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 273, ydate + 303);
   FETCH c_trchinfo INTO trch_10;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 304, ydate + 333);
   FETCH c_trchinfo INTO trch_11;
   CLOSE c_trchinfo;
   OPEN c_trchinfo (ydate + 334, ydate + 365);
   FETCH c_trchinfo INTO trch_12;
   CLOSE c_trchinfo;

   INSERT INTO cm_report_lastyeartrch
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , nvl(trchall.tramt,0)
              , nvl(trch_01.tramt,0)
              , nvl(trch_02.tramt,0)
              , nvl(trch_03.tramt,0)
              , nvl(trch_04.tramt,0)
              , nvl(trch_05.tramt,0)
              , nvl(trch_06.tramt,0)
              , nvl(trch_07.tramt,0)
              , nvl(trch_08.tramt,0)
              , nvl(trch_09.tramt,0)              
              , nvl(trch_10.tramt,0)
              , nvl(trch_11.tramt,0)
              , nvl(trch_12.tramt,0));
END;

PROCEDURE insinfolast5yearpayments (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
           , 1 crdcnt
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   CURSOR c_payinfo (begd DATE := '01-jan-1970', endd DATE := SYSDATE)
   IS
      SELECT SUM (payedamt + payeddueamt) paymain
           , SUM (payedintamt + payeddueintamt) payint
        FROM agro_payments
       WHERE creditid = p_id AND paydate BETWEEN begd AND endd;

   crdinf    c_crdinf%ROWTYPE;
   payinf    c_payinfo%ROWTYPE;
   payinf1   c_payinfo%ROWTYPE;
   payinf2   c_payinfo%ROWTYPE;
   payinf3   c_payinfo%ROWTYPE;
   payinf4   c_payinfo%ROWTYPE;
   payinf5   c_payinfo%ROWTYPE;
   dd        date;
   ddtr      date;
   ddte      date;
BEGIN
   dd := p_edate;
   
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_payinfo;   
   fetch c_payinfo into payinf;   
   close c_payinfo;
   
   ddtr := trunc(dd-1461,'y');
   ddte := trunc(dd-1095,'y')-1;   
   open c_payinfo(ddtr,ddte);   
   fetch c_payinfo into payinf1;   
   close c_payinfo;
      
   ddtr := trunc(dd-1095,'y');
   ddte := trunc(dd-730,'y')-1;   
   open c_payinfo(ddtr,ddte);   
   fetch c_payinfo into payinf2;   
   close c_payinfo;
         
   ddtr := trunc(dd-730,'y');
   ddte := trunc(dd-365,'y')-1;   
   open c_payinfo(ddtr,ddte);   
   fetch c_payinfo into payinf3;   
   close c_payinfo;   
         
   ddtr := trunc(dd-365,'y');
   ddte := trunc(dd,'y')-1;   
   open c_payinfo(ddtr,ddte);   
   fetch c_payinfo into payinf4;   
   close c_payinfo;
         
   ddtr := trunc(dd,'y');
   ddte := trunc(dd+365,'y')-1;   
   open c_payinfo(ddtr,ddte);   
   fetch c_payinfo into payinf5;   
   close c_payinfo;
   
   INSERT INTO cm_report_last5yearpay
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , payinf.paymain+payinf.payint
              , payinf.paymain
              , payinf.payint
              , payinf1.paymain
              , payinf1.payint
              , payinf2.paymain
              , payinf2.payint
              , payinf3.paymain
              , payinf3.payint
              , payinf4.paymain
              , payinf4.payint
              , payinf5.paymain
              , payinf5.payint
              );
   
END;

PROCEDURE insinfolast5yeartranches (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
           , 1 crdcnt
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   CURSOR c_trinfo (begd DATE := '01-jan-1970', endd DATE := SYSDATE)
   IS
      SELECT SUM (trancheamount) trmain
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate BETWEEN begd AND endd;

   crdinf    c_crdinf%ROWTYPE;
   trinf    c_trinfo%ROWTYPE;
   trinf1   c_trinfo%ROWTYPE;
   trinf2   c_trinfo%ROWTYPE;
   trinf3   c_trinfo%ROWTYPE;
   trinf4   c_trinfo%ROWTYPE;
   trinf5   c_trinfo%ROWTYPE;
   dd        date;
   ddtr      date;
   ddte      date;
BEGIN
   dd := p_edate;
   
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_trinfo;   
   fetch c_trinfo into trinf;   
   close c_trinfo;
   
   ddtr := trunc(dd-1461,'y');
   ddte := trunc(dd-1095,'y')-1;   
   open c_trinfo(ddtr,ddte);   
   fetch c_trinfo into trinf1;   
   close c_trinfo;
      
   ddtr := trunc(dd-1095,'y');
   ddte := trunc(dd-730,'y')-1;   
   open c_trinfo(ddtr,ddte);   
   fetch c_trinfo into trinf2;   
   close c_trinfo;
         
   ddtr := trunc(dd-730,'y');
   ddte := trunc(dd-365,'y')-1;   
   open c_trinfo(ddtr,ddte);   
   fetch c_trinfo into trinf3;   
   close c_trinfo;   
         
   ddtr := trunc(dd-365,'y');
   ddte := trunc(dd,'y')-1;   
   open c_trinfo(ddtr,ddte);   
   fetch c_trinfo into trinf4;   
   close c_trinfo;
         
   ddtr := trunc(dd,'y');
   ddte := trunc(dd+365,'y')-1;   
   open c_trinfo(ddtr,ddte);   
   fetch c_trinfo into trinf5;   
   close c_trinfo;
   
   INSERT INTO cm_report_last5yeartr
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , trinf.trmain
              , trinf1.trmain
              , trinf2.trmain
              , trinf3.trmain
              , trinf4.trmain
              , trinf5.trmain
              );
   
END;

PROCEDURE insinfolastyearmpays (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
        FROM cm_active_credits c, cm_boorowerinfo i, cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   CURSOR c_mpayinfo (begd DATE := '01-jan-1970', endd DATE := '01-jan-2030')
   IS
      SELECT SUM (principal) maind, sum(interest) intd
        FROM cm_all_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN begd AND endd;

   crdinf    c_crdinf%ROWTYPE;
   mpayall   c_mpayinfo%ROWTYPE;
   mpay_01   c_mpayinfo%ROWTYPE;
   mpay_02   c_mpayinfo%ROWTYPE;
   mpay_03   c_mpayinfo%ROWTYPE;
   mpay_04   c_mpayinfo%ROWTYPE;
   mpay_05   c_mpayinfo%ROWTYPE;
   mpay_06   c_mpayinfo%ROWTYPE;
   mpay_07   c_mpayinfo%ROWTYPE;
   mpay_08   c_mpayinfo%ROWTYPE;
   mpay_09   c_mpayinfo%ROWTYPE;
   mpay_10   c_mpayinfo%ROWTYPE;
   mpay_11   c_mpayinfo%ROWTYPE;
   mpay_12   c_mpayinfo%ROWTYPE;
   ydate     DATE;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   ydate := TRUNC (p_edate, 'Y');
   OPEN c_mpayinfo(ydate,ydate+364);
   FETCH c_mpayinfo INTO mpayall;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate, ydate + 30);
   FETCH c_mpayinfo INTO mpay_01;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 31, ydate + 58);
   FETCH c_mpayinfo INTO mpay_02;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 59, ydate + 89);
   FETCH c_mpayinfo INTO mpay_03;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 90, ydate + 119);
   FETCH c_mpayinfo INTO mpay_04;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 120, ydate + 150);
   FETCH c_mpayinfo INTO mpay_05;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 151, ydate + 180);
   FETCH c_mpayinfo INTO mpay_06;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 181, ydate + 211);
   FETCH c_mpayinfo INTO mpay_07;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 212, ydate + 242);
   FETCH c_mpayinfo INTO mpay_08;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 243, ydate + 272);
   FETCH c_mpayinfo INTO mpay_09;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 273, ydate + 303);
   FETCH c_mpayinfo INTO mpay_10;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 304, ydate + 333);
   FETCH c_mpayinfo INTO mpay_11;
   CLOSE c_mpayinfo;
   OPEN c_mpayinfo (ydate + 334, ydate + 364);
   FETCH c_mpayinfo INTO mpay_12;
   CLOSE c_mpayinfo;

   INSERT INTO cm_report_lastyearmpays
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , nvl(mpayall.maind,0)
              , nvl(mpayall.intd,0)
              , nvl(mpay_01.maind,0)
              , nvl(mpay_01.intd,0)
              , nvl(mpay_02.maind,0)
              , nvl(mpay_02.intd,0)
              , nvl(mpay_03.maind,0)
              , nvl(mpay_03.intd,0)
              , nvl(mpay_04.maind,0)
              , nvl(mpay_04.intd,0)
              , nvl(mpay_05.maind,0)              
              , nvl(mpay_05.intd,0)
              , nvl(mpay_06.maind,0)
              , nvl(mpay_06.intd,0)
              , nvl(mpay_07.maind,0)
              , nvl(mpay_07.intd,0)
              , nvl(mpay_08.maind,0)
              , nvl(mpay_08.intd,0)
              , nvl(mpay_09.maind,0)
              , nvl(mpay_09.intd,0)
              , nvl(mpay_10.maind,0)
              , nvl(mpay_10.intd,0)
              , nvl(mpay_11.maind,0)              
              , nvl(mpay_11.intd,0)
              , nvl(mpay_12.maind,0)
              , nvl(mpay_12.intd,0));
END;

PROCEDURE insinfolastyearpayments (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
        FROM cm_active_credits c, cm_boorowerinfo i, cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   CURSOR c_paymentinfo (begd DATE := '01-jan-1970', endd DATE := SYSDATE)
   IS
      SELECT SUM (payedamt+payeddueamt) maind
           , SUM (payedintamt+payeddueintamt) intd
        FROM agro_payments
       WHERE creditid = p_id AND paydate BETWEEN begd AND endd;

   crdinf       c_crdinf%ROWTYPE;
   paymentall   c_paymentinfo%ROWTYPE;
   payment_01   c_paymentinfo%ROWTYPE;
   payment_02   c_paymentinfo%ROWTYPE;
   payment_03   c_paymentinfo%ROWTYPE;
   payment_04   c_paymentinfo%ROWTYPE;
   payment_05   c_paymentinfo%ROWTYPE;
   payment_06   c_paymentinfo%ROWTYPE;
   payment_07   c_paymentinfo%ROWTYPE;
   payment_08   c_paymentinfo%ROWTYPE;
   payment_09   c_paymentinfo%ROWTYPE;
   payment_10   c_paymentinfo%ROWTYPE;
   payment_11   c_paymentinfo%ROWTYPE;
   payment_12   c_paymentinfo%ROWTYPE;
   ydate        DATE;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   OPEN c_paymentinfo;
   FETCH c_paymentinfo INTO paymentall;
   CLOSE c_paymentinfo;
   ydate := TRUNC (p_edate, 'Y');
   OPEN c_paymentinfo (ydate, ydate + 30);
   FETCH c_paymentinfo INTO payment_01;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 31, ydate + 58);
   FETCH c_paymentinfo INTO payment_02;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 59, ydate + 89);
   FETCH c_paymentinfo INTO payment_03;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 90, ydate + 119);
   FETCH c_paymentinfo INTO payment_04;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 120, ydate + 150);
   FETCH c_paymentinfo INTO payment_05;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 151, ydate + 180);
   FETCH c_paymentinfo INTO payment_06;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 181, ydate + 211);
   FETCH c_paymentinfo INTO payment_07;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 212, ydate + 242);
   FETCH c_paymentinfo INTO payment_08;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 243, ydate + 272);
   FETCH c_paymentinfo INTO payment_09;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 273, ydate + 303);
   FETCH c_paymentinfo INTO payment_10;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 304, ydate + 333);
   FETCH c_paymentinfo INTO payment_11;
   CLOSE c_paymentinfo;
   OPEN c_paymentinfo (ydate + 334, ydate + 365);
   FETCH c_paymentinfo INTO payment_12;
   CLOSE c_paymentinfo;

   INSERT INTO cm_report_lastyearpayments
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , nvl(paymentall.maind,0)
              , nvl(paymentall.intd,0)
              , nvl(payment_01.maind,0)
              , nvl(payment_01.intd,0)
              , nvl(payment_02.maind,0)
              , nvl(payment_02.intd,0)
              , nvl(payment_03.maind,0)
              , nvl(payment_03.intd,0)
              , nvl(payment_04.maind,0)
              , nvl(payment_04.intd,0)
              , nvl(payment_05.maind,0)              
              , nvl(payment_05.intd,0)
              , nvl(payment_06.maind,0)
              , nvl(payment_06.intd,0)
              , nvl(payment_07.maind,0)
              , nvl(payment_07.intd,0)
              , nvl(payment_08.maind,0)
              , nvl(payment_08.intd,0)
              , nvl(payment_09.maind,0)
              , nvl(payment_09.intd,0)
              , nvl(payment_10.maind,0)
              , nvl(payment_10.intd,0)
              , nvl(payment_11.maind,0)              
              , nvl(payment_11.intd,0)
              , nvl(payment_12.maind,0)
              , nvl(payment_12.intd,0));
END;

PROCEDURE insinfomong (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
           , 1 crdcnt
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

      CURSOR c_histinfo
      IS
        SELECT hdate, rest, interestrest, duerest, dueinterestrest
          FROM agro_history
         WHERE creditid = p_id
           AND hdate = (SELECT MAX (hdate)
                          FROM cm_history
                         WHERE hdate <= p_edate);

      CURSOR c_tranch
      IS
         SELECT SUM (trancheamount) tramt
           FROM agro_tranches
          WHERE creditid = p_id AND tranchedate <= p_edate;

      CURSOR c_payinfo
      IS
         SELECT SUM (payedamt+payeddueamt) payedamt,
                SUM (payedintamt+payeddueintamt) payedintamt
           FROM agro_payments
          WHERE creditid = p_id AND paydate <= p_edate;

   crdinf    c_crdinf%ROWTYPE;
   tranch    c_tranch%ROWTYPE;
   histin    c_histinfo%ROWTYPE;
   payinf    c_payinfo%ROWTYPE;

BEGIN
   
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_tranch;
   fetch c_tranch into tranch;
   close c_tranch;
   
   open c_payinfo;
   fetch c_payinfo into payinf;
   close c_payinfo;
   
   open c_histinfo;
   fetch c_histinfo into histin;
   close c_histinfo;
   
   INSERT INTO cm_report_mong
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , tranch.tramt
              , payinf.payedamt
              , payinf.payedintamt
              , histin.rest+histin.duerest
              , histin.interestrest+histin.dueinterestrest
              , histin.duerest
              , histin.dueinterestrest
              , 1
              , '31-oct-2003'
              
              );
   
END;

PROCEDURE insinfof2_full (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
           , bp.villageid, bp.akpurpose purposeid
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND bp.creditid (+) = p.ID
         AND p.ID = p_id;

   CURSOR c_village(vid integer) 
   IS
      SELECT name, depend_id dependid
        FROM agro_village
       WHERE id = vid;
   
   CURSOR c_tranch_all
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

   CURSOR c_tranch_year
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id
         AND tranchedate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_tranch_mon
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate BETWEEN p_bdate AND p_edate;

   CURSOR c_scheduleinfo
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id AND paymentdate <= p_edate;

   CURSOR c_scheduleinfomon
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate BETWEEN p_bdate AND p_edate;
         
   CURSOR c_scheduleinfoyear
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate BETWEEN trunc(p_edate,'Y') AND p_edate;
         
   CURSOR c_payments
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate <= p_edate;

   CURSOR c_payments_year
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate BETWEEN TRUNC (p_edate, 'Y') AND p_edate;

   CURSOR c_payments_mon
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

   CURSOR c_histinfo(pp_date date)
   IS
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= pp_date) AND creditid = p_id;

   CURSOR c_oldcrd is
      select closedate from cm_old_credits where creditid=p_id;     
                     
   crdinfo         c_crdinfo%ROWTYPE;
   village         c_village%ROWTYPE; 
   tranch_all      c_tranch_all%ROWTYPE;
   tranch_year     c_tranch_year%ROWTYPE;
   tranch_mon      c_tranch_mon%ROWTYPE;
   scheduleinfo    c_scheduleinfo%ROWTYPE;
   scheduleinfomon c_scheduleinfomon%ROWTYPE;
   scheduleinfoyear c_scheduleinfoyear%ROWTYPE;
   payments        c_payments%ROWTYPE;
   payments_year   c_payments_year%ROWTYPE;
   payments_mon    c_payments_mon%ROWTYPE;
   histinfo        c_histinfo%ROWTYPE;
   histinfoy       c_histinfo%ROWTYPE;
   histinfom       c_histinfo%ROWTYPE;
   oldcrd          c_oldcrd%rowtype; 
   
   percentmain     number;            
   percentint      number;  
   
   cntall          integer := 1;
   cntreturn       integer := 0;
   cntretyear      integer := 0;
   cntretmon       integer := 0;              
BEGIN
   OPEN c_crdinfo;
   FETCH c_crdinfo INTO crdinfo;
   CLOSE c_crdinfo;
   
   OPEN c_village(crdinfo.villageid);
   FETCH c_village INTO village;
   CLOSE c_village;
   
   OPEN c_tranch_all;
   FETCH c_tranch_all INTO tranch_all;
   CLOSE c_tranch_all;
   OPEN c_tranch_year;
   FETCH c_tranch_year INTO tranch_year;
   CLOSE c_tranch_year;
   OPEN c_tranch_mon;
   FETCH c_tranch_mon INTO tranch_mon;
   CLOSE c_tranch_mon;
   OPEN c_scheduleinfo;
   FETCH c_scheduleinfo INTO scheduleinfo;
   CLOSE c_scheduleinfo;
   OPEN c_scheduleinfomon;
   FETCH c_scheduleinfomon INTO scheduleinfomon;
   CLOSE c_scheduleinfomon;
   OPEN c_scheduleinfoyear;
   FETCH c_scheduleinfoyear INTO scheduleinfoyear;
   CLOSE c_scheduleinfoyear;
   OPEN c_payments;
   FETCH c_payments INTO payments;
   CLOSE c_payments;
   OPEN c_payments_year;
   FETCH c_payments_year INTO payments_year;
   CLOSE c_payments_year;
   OPEN c_payments_mon;
   FETCH c_payments_mon INTO payments_mon;
   CLOSE c_payments_mon;
   /* OPEN c_histinfo(p_edate);
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'Y'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;
   OPEN c_histinfo(trunc(p_edate,'MON'));
   FETCH c_histinfo INTO histinfoy;
   CLOSE c_histinfo;
*/
   open c_oldcrd;
   fetch c_oldcrd into oldcrd;
   close c_oldcrd;
   
   IF (scheduleinfo.principal = 0)
   THEN
      percentmain := 100;
   ELSE
      percentmain := round((100*(payments.payedamt / scheduleinfo.principal)),1);
   END IF;


   IF (scheduleinfo.interest = 0)
   THEN
      percentint := 100;
   ELSE
      percentint := round((100*(payments.payedintamt / scheduleinfo.interest)),1);
   END IF;

   --IF (histinfo.rest+histinfo.duerest+histinfo.interestrest+histinfo.dueinterestrest<100)
   if oldcrd.closedate is not null 
   THEN
     cntreturn := 0;
   ELSE
     cntreturn := 1;
   END IF;
   
   if oldcrd.closedate is not null and oldcrd.closedate between trunc(p_bdate,'Y')and p_edate  
   THEN
     cntretyear := 1;
   ELSE
     cntretyear := 0;
   END IF;
   
   if oldcrd.closedate is not null and oldcrd.closedate between trunc(p_bdate,'MON')and p_edate
   THEN
     cntretmon := 1;
   ELSE
     cntretmon := 0;
   END IF;
   
   histinfo.rest := tranch_all.tramt-payments.payedamt;
   histinfo.interestrest := scheduleinfo.interest - payments.payedintamt;
   histinfo.duerest := scheduleinfo.principal-payments.payedamt;
   histinfo.dueinterestrest := scheduleinfo.interest - payments.payedintamt;
   --if histinfo.rest<0 then histinfo.rest :=0;end if;
   if histinfo.interestrest<0 then histinfo.interestrest :=0;end if;
   if histinfo.duerest<0 then histinfo.duerest :=0;end if;
   if histinfo.dueinterestrest<0 then histinfo.dueinterestrest :=0;end if;
   
   INSERT INTO cm_report_f2_full
        VALUES (
                NVL (crdinfo.crdid, 0) 
              , NVL (crdinfo.boorowerid, 0)
              , NVL (crdinfo.boorower, '-')
              , NVL (crdinfo.crdnum, '-')
              , NVL (crdinfo.branchid, 0)
              , NVL (crdinfo.branch, '-')
              , NVL (crdinfo.villageid, -1)              
              , NVL (village.name, '-')              
              , NVL (village.dependid, 0)
              , NVL (crdinfo.purposeid, -1)
              , NVL (crdinfo.typeid, 0)
              , NVL (cntall, 0)
              , NVL (cntreturn, 0)
              , NVL (cntretyear, 0)
              , NVL (cntretmon, 0)
              , NVL (tranch_all.tramt, 0)
              , NVL (payments.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_year.tramt, 0)
              , NVL (payments_year.payedintamt+histinfo.interestrest, 0)
              , NVL (tranch_mon.tramt, 0)
              , NVL (payments_mon.payedintamt+histinfo.interestrest, 0)
              , NVL (scheduleinfo.principal, 0)
              , NVL (payments.payedintamt+histinfo.interestrest, 0)
              --, NVL (scheduleinfo.interest, 0)
              , NVL (scheduleinfomon.principal, 0)
              , NVL (payments_mon.payedintamt+histinfo.interestrest, 0)
              --, NVL (scheduleinfomon.interest, 0)
              , NVL (payments.payedamt, 0)
              , NVL (payments.payedintamt, 0)
              , NVL (payments_year.payedamt, 0)
              , NVL (payments_year.payedintamt, 0)
              , NVL (payments_mon.payedamt, 0)
              , NVL (payments_mon.payedintamt, 0)
              , NVL (histinfo.rest, 0)
              , NVL (histinfo.interestrest, 0)
              , NVL (histinfo.duerest, 0)
              , NVL (histinfo.dueinterestrest, 0)
              , NVL (percentmain, 0)
              , NVL (percentint, 0)
              , NVL (scheduleinfoyear.principal, 0)
              , NVL (payments_year.payedintamt+histinfo.interestrest, 0));
END;

PROCEDURE insinfoabouttrouble (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.branchid, NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid, c.boorowerid custid
           , i.NAME custname, NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum, g.pledgepricetorpaqha girovtorpaq
           , h.pledgepricetorpaq girovtorpaqcost, g.pledgepriceevkv girovev
           , h.pledgepriceev girovevcost, h.pledgeprice girovother
           , h.pledgepriceev + h.pledgeprice + h.pledgepricetorpaq girovyekun
        FROM cm_portfolio c
           , cm_boorowerinfo i
           , cm_business_plan b
           , cm_curr_state h
           , cm_guarantee g
       WHERE (b.creditid(+) = c.ID)
         AND (h.creditid = c.ID)
         AND (g.creditid = c.ID)
         AND (i.creditid = c.ID)
         AND c.ID = p_id;

   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id AND hdate = (SELECT MAX (hdate)
                                            FROM cm_history
                                           WHERE hdate <= p_edate);

   CURSOR c_preten_info
   IS
      SELECT creditid, count(*) cnti, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 4
       GROUP BY creditid, measurecode;

   CURSOR c_iddia_info
   IS
      SELECT creditid, count(*) cnti, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 6
       GROUP BY creditid, measurecode;

   CURSOR c_qatname_info
   IS
      SELECT creditid, count(*) cnti, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 7
       GROUP BY creditid, measurecode;

   CURSOR c_tranch
   IS
      SELECT SUM (trancheamount) tramt
        FROM agro_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

   CURSOR c_payments
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid = p_id AND paydate <= p_edate;

   crdinf         c_crdinf%ROWTYPE;
   histinfo       c_histinfo%ROWTYPE;
   iddia_info     c_iddia_info%ROWTYPE;
   preten_info    c_preten_info%ROWTYPE;
   qatname_info   c_qatname_info%ROWTYPE;
   tranch         c_tranch%rowtype;
   payments       c_payments%rowtype;
   res            integer;
BEGIN
/*
   SELECT MAX (ID)
     INTO res
     FROM cm_legal_measures
    WHERE creditid = p_id;
   
   IF NOT res IS NULL
   THEN*/
 
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
   
   OPEN c_histinfo;
   FETCH c_histinfo INTO histinfo;
   CLOSE c_histinfo;
   
   OPEN c_preten_info;
   FETCH c_preten_info INTO preten_info;
   CLOSE c_preten_info;
   OPEN c_iddia_info;
   FETCH c_iddia_info INTO iddia_info;
   CLOSE c_iddia_info;
   OPEN c_qatname_info;
   FETCH c_qatname_info INTO qatname_info;
   CLOSE c_qatname_info;
   
   OPEN c_tranch;
   FETCH c_tranch INTO tranch;
   CLOSE c_tranch;
   
   OPEN c_payments;
   FETCH c_payments INTO payments;
   CLOSE c_payments;
   INSERT INTO cm_report_abouttrouble
        VALUES (crdinf.creditid
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.custid
              , crdinf.custname
              , crdinf.typeid
              , crdinf.crdnum
              , preten_info.cnti
              , iddia_info.cnti
              , tranch.tramt
              , payments.payedintamt+histinfo.interestrest+histinfo.dueinterestrest
              , histinfo.rest+histinfo.duerest
              , histinfo.interestrest+histinfo.dueinterestrest
              , histinfo.duerest
              , histinfo.dueinterestrest
              , crdinf.girovtorpaq
              , crdinf.girovtorpaqcost
              , crdinf.girovev
              , crdinf.girovevcost
              , crdinf.girovother
              , crdinf.girovyekun
              , preten_info.TOTALAMOUNT
              , preten_info.maindebt
              , iddia_info.TOTALAMOUNT
              , iddia_info.maindebt
              , qatname_info.TOTALAMOUNT
              , qatname_info.maindebt
              , payments.payedamt+payments.payedintamt
              , payments.payedamt);
  -- END IF;
END;

PROCEDURE insinfomeasures (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.branchid, NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid, c.boorowerid custid
           , i.NAME custname, NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID)
         AND c.ID = p_id;

   CURSOR c_preten_info
   IS
      SELECT creditid, count(*) cnti, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 4
       GROUP BY creditid, measurecode;

   CURSOR c_iddia_info
   IS
      SELECT creditid, count(*) cnti, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 6
       GROUP BY creditid, measurecode;

   CURSOR c_qatname_info
   IS
      SELECT creditid, count(*) cnti, MIN (grantdate) grantdate
           , MIN (givedate) givedate, SUM (totalamount) totalamount
           , SUM (maindebt) maindebt
        FROM cm_legal_measures
       WHERE creditid = p_id AND measurecode = 7
       GROUP BY creditid, measurecode;

   CURSOR c_payment_d(dd date)
   IS
      SELECT SUM (payedamt + payeddueamt) payedamt
           , SUM (payedintamt + payeddueintamt) payedintamt
        FROM cm_payments
       WHERE creditid = p_id AND paydate > dd;
       
   crdinf         c_crdinf%ROWTYPE;
   iddia_info     c_iddia_info%ROWTYPE;
   preten_info    c_preten_info%ROWTYPE;
   qatname_info   c_qatname_info%ROWTYPE;
   ppaymentd      c_payment_d%rowtype;
   ipaymentd      c_payment_d%rowtype;
   qpaymentd      c_payment_d%rowtype;
   res            integer;
BEGIN

   SELECT MAX (ID)
     INTO res
     FROM cm_legal_measures
    WHERE creditid = p_id;
   
   IF NOT res IS NULL
   THEN
 
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
      
   OPEN c_preten_info;
   FETCH c_preten_info INTO preten_info;
   CLOSE c_preten_info;
   OPEN c_iddia_info;
   FETCH c_iddia_info INTO iddia_info;
   CLOSE c_iddia_info;
   OPEN c_qatname_info;
   FETCH c_qatname_info INTO qatname_info;
   CLOSE c_qatname_info;
   
   open c_payment_d(preten_info.givedate);
   fetch c_payment_d into ppaymentd;
   close c_payment_d;
   
   open c_payment_d(iddia_info.givedate);
   fetch c_payment_d into ipaymentd;
   close c_payment_d;
   
   open c_payment_d(qatname_info.givedate);
   fetch c_payment_d into qpaymentd;
   close c_payment_d;
   
   INSERT INTO cm_report_measures
        VALUES (crdinf.creditid
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.custid
              , crdinf.custname
              , crdinf.typeid
              , crdinf.crdnum
              , preten_info.grantdate
              , preten_info.givedate
              , nvl(preten_info.TOTALAMOUNT,0)
              , nvl(preten_info.maindebt,0)
              , nvl(ppaymentd.payedamt,0)
              , nvl(ppaymentd.payedintamt,0)
              , iddia_info.grantdate
              , iddia_info.givedate
              , nvl(iddia_info.TOTALAMOUNT,0)
              , nvl(iddia_info.maindebt,0)
              , nvl(ipaymentd.payedamt,0)
              , nvl(ipaymentd.payedintamt,0)
              , qatname_info.grantdate
              , qatname_info.givedate
              , nvl(qpaymentd.payedamt,0)
              , nvl(qpaymentd.payedintamt,0)
              , 0
              , 0);
   END IF;
END;

PROCEDURE insinfoprolong (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.branchid, NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid, c.boorowerid custid
           , i.NAME custname, NVL (b.TYPE, 0) typeid, DUEDATEFIRSTCONTRACT oldcdate
           , c.numberofcredit crdnum
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID)
         AND c.ID = p_id;
 
   CURSOR c_prolong(olddate date, minmonthcnt integer, maxmonthcnt integer)
   IS
     SELECT COUNT (*) cntp
       FROM cm_prolongations
      WHERE newclosedate BETWEEN olddate + minmonthcnt * 30
                             AND olddate + maxmonthcnt * 30;
                             
   CURSOR c_tranch
   IS
      SELECT count(*) cntt, SUM (trancheamount) tramt
        FROM cm_all_tranches
       WHERE creditid = p_id AND tranchedate <= p_edate;

 crdinf         c_crdinf%ROWTYPE;
 tranch         c_tranch%ROWTYPE;
 prolongall     c_prolong%ROWTYPE;
 prolong0       c_prolong%ROWTYPE;
 prolong3       c_prolong%ROWTYPE;
 prolong6       c_prolong%ROWTYPE;
 prolong12      c_prolong%ROWTYPE;
BEGIN
 
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;
 
   OPEN c_tranch;
   FETCH c_tranch INTO tranch;
   CLOSE c_tranch;

   OPEN c_prolong(crdinf.oldcdate,0,24);
   FETCH c_prolong INTO prolongall;
   CLOSE c_prolong;

   OPEN c_prolong(crdinf.oldcdate,0,3);
   FETCH c_prolong INTO prolong0;
   CLOSE c_prolong;

   OPEN c_prolong(crdinf.oldcdate,3,6);
   FETCH c_prolong INTO prolong3;
   CLOSE c_prolong;

   OPEN c_prolong(crdinf.oldcdate,6,12);
   FETCH c_prolong INTO prolong6;
   CLOSE c_prolong;

   OPEN c_prolong(crdinf.oldcdate,12,24);
   FETCH c_prolong INTO prolong12;
   CLOSE c_prolong;

   INSERT INTO cm_report_prolongations
        VALUES (crdinf.creditid
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.custid
              , crdinf.custname
              , crdinf.typeid
              , crdinf.crdnum
              , tranch.cntt
              , tranch.tramt
              , prolongall.cntp
              , 0
              , prolong0.cntp
              , 0
              , prolong3.cntp
              , 0
              , prolong6.cntp
              , 0
              , prolong12.cntp
              , 0);
END;

PROCEDURE insinfoaboutcrediting (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid
           , c.branchid
           , NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid
           , c.boorowerid custid
           , i.NAME custname
           , NVL (b.TYPE, 0) typeid
           , b.givencredit bpcost
           , b.projectcost
           , c.numberofcredit crdnum
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID) 
         AND c.ID = p_id;
         
   CURSOR c_tranch
   IS
      SELECT count(*) cnt, nvl(sum(trancheamount),0) tramt
        FROM cm_all_tranches
       WHERE creditid=p_id 
         AND tranchedate<=p_edate;
         
   CURSOR c_tranchd
   IS
      SELECT count(*) cnt, nvl(sum(trancheamount),0) tramt
        FROM agro_tranches
       WHERE creditid=p_id
         AND tranchedate between p_bdate AND p_edate;
       
   CURSOR c_payplane
   IS
      SELECT SUM (principal) principal, SUM (interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate <= p_edate;
         
   CURSOR c_payments
   IS
      SELECT count(*) cnt
           , sum(payedamt+payeddueamt) payedamt
           , sum(payedintamt+payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid=p_id
         AND paydate <= p_edate;
         
   CURSOR c_paymentsdat
   IS
      SELECT count(*) cnt
           , sum(payedamt+payeddueamt) payedamt
           , sum(payedintamt+payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid=p_id
         AND paydate BETWEEN p_bdate AND p_edate;
         
   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id
         AND hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= p_edate);
          
   crdinf           c_crdinf%ROWTYPE;
   tranch           c_tranch%ROWTYPE;
   tranchd          c_tranchd%ROWTYPE;
   payplane         c_payplane%ROWTYPE;
   payments         c_payments%ROWTYPE;
   paymentsdat      c_paymentsdat%ROWTYPE;
   histinfo         c_histinfo%ROWTYPE;
   
BEGIN
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_tranch;
   fetch c_tranch into tranch;
   close c_tranch;
   
   open c_tranchd;
   fetch c_tranchd into tranchd;
   close c_tranchd;
   
   open c_payplane;
   fetch c_payplane into payplane;
   close c_payplane;
   
   open c_payments;
   fetch c_payments into payments;
   close c_payments;
   
   open c_paymentsdat;
   fetch c_paymentsdat into paymentsdat;
   close c_paymentsdat;
   
   open c_histinfo;
   fetch c_histinfo into histinfo;
   close c_histinfo;
   
   INSERT INTO cm_report_aboutcrediting
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , crdinf.bpcost
              , crdinf.projectcost
              , tranch.tramt
              , histinfo.interestrest+histinfo.dueinterestrest+payments.payedintamt
              , decode(tranchd.cnt,0,0,1)
              , tranchd.tramt
              , payplane.principal
              , payplane.interest
              , decode(payments.cnt,0,0,1)
              , payments.payedamt
              , payments.payedintamt
              , decode(paymentsdat.cnt,0,0,1)
              , paymentsdat.payedamt
              , paymentsdat.payedintamt
              , decode(histinfo.rest+histinfo.duerest+
                       histinfo.interestrest+histinfo.dueinterestrest,0,0,1)
              , histinfo.rest+histinfo.duerest
              , histinfo.interestrest+histinfo.dueinterestrest
              , decode(histinfo.dueinterestrest+histinfo.duerest,0,0,1)
              , histinfo.duerest
              , histinfo.dueinterestrest
              ); 
END;

PROCEDURE insinfocreditpaying (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid
           , c.branchid
           , NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid
           , c.boorowerid custid
           , i.NAME custname
           , NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID) 
         AND c.ID = p_id;
         
   CURSOR c_tranch
   IS
      SELECT count(*) cnt, nvl(sum(trancheamount),0) tramt
        FROM agro_tranches
       WHERE creditid=p_id 
         AND tranchedate<=p_edate;
      
         
   CURSOR c_payments
   IS
      SELECT count(*) cnt
           , sum(payedamt+payeddueamt) payedamt
           , sum(payedintamt+payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid=p_id
         AND paydate <= p_edate;
         
   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id
         AND hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= p_edate);
          
   crdinf           c_crdinf%ROWTYPE;
   tranch           c_tranch%ROWTYPE;
   payments         c_payments%ROWTYPE;
   histinfo         c_histinfo%ROWTYPE;
   
   fullcnt integer;   
   fullman number;   
   fullint number;
   
   partcnt integer;   
   partman number;   
   partint number;
     
   partmcnt integer;   
   partmman number;   
   partmint number;
   
BEGIN
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_tranch;
   fetch c_tranch into tranch;
   close c_tranch;
      
   open c_payments;
   fetch c_payments into payments;
   close c_payments;
      
   open c_histinfo;
   fetch c_histinfo into histinfo;
   close c_histinfo;
   
   if (histinfo.rest+histinfo.dueinterestrest+
       histinfo.duerest+histinfo.interestrest=0) then
     fullcnt := 1;
     fullman := payments.payedamt;
     fullint := payments.payedintamt;
   else
     fullcnt := 0;
     fullman := 0;
     fullint := 0;
   end if;
   
   if payments.payedamt = 0 then
     partmcnt := 1;   
     partmman := payments.payedamt;
     partmint := payments.payedintamt;
     partcnt := 0;
     partman := 0;
     partint := 0;
   else
     partmcnt := 0;   
     partmman := 0;
     partmint := 0;
     partcnt := 1;
     partman := payments.payedamt;
     partint := payments.payedintamt;
   end if;
   
   INSERT INTO cm_report_creditpaying
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , tranch.tramt
              , histinfo.interestrest+histinfo.dueinterestrest+payments.payedintamt
              , fullcnt
              , fullman
              , fullint
              , partcnt
              , partman
              , partint
              , partmcnt
              , partmman
              , partmint
              , decode(histinfo.rest+histinfo.duerest+
                       histinfo.interestrest+histinfo.dueinterestrest,0,0,1)
              , histinfo.rest+histinfo.duerest
              , histinfo.interestrest+histinfo.dueinterestrest
              ); 
END;

PROCEDURE insinfomusttr (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid, c.boorowerid custid, c.branchid, i.NAME custname
           , c.numberofcredit crdnum, NVL (b.TYPE, 0) typeid
           , NVL (b.villageid, 0) villageid, NVL (b.akpurpose, 0) purposeid
        FROM cm_active_credits c, cm_boorowerinfo i, cm_business_plan b
       WHERE (b.creditid(+) = c.ID) AND (i.creditid = c.ID) AND c.ID = p_id;

   crdinf    c_crdinf%ROWTYPE;
BEGIN
   OPEN c_crdinf;
   FETCH c_crdinf INTO crdinf;
   CLOSE c_crdinf;

   INSERT INTO cm_report_lastyearmpays
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , 0 --nvl(mpayall.maind,0)
              , 0 --nvl(mpayall.maind,0)
              , 0 --nvl(mpay_01.maind,0)
              , 0 --nvl(mpay_01.intd,0)
              , 0 --nvl(mpay_02.maind,0)
              , 0 --nvl(mpay_02.intd,0)
              , 0 --nvl(mpay_03.maind,0)
              , 0 --nvl(mpay_03.intd,0)
              , 0 --nvl(mpay_04.maind,0)
              , 0 --nvl(mpay_04.intd,0)
              , 0 --nvl(mpay_05.maind,0)              
              , 0 --nvl(mpay_05.intd,0)
              , 0 --nvl(mpay_06.maind,0)
              , 0 --nvl(mpay_06.intd,0)
              , 0 --nvl(mpay_07.maind,0)
              , 0 --nvl(mpay_07.intd,0)
              , 0 --nvl(mpay_08.maind,0)
              , 0 --nvl(mpay_08.intd,0)
              , 0 --nvl(mpay_09.maind,0)
              , 0 --nvl(mpay_09.intd,0)
              , 0 --nvl(mpay_10.maind,0)
              , 0 --nvl(mpay_10.intd,0)
              , 0 --nvl(mpay_11.maind,0)              
              , 0 --nvl(mpay_11.intd,0)
              , 0 --nvl(mpay_12.maind,0)
              , 0 --nvl(mpay_12.intd,0)
              );
END;

PROCEDURE insinfoworldbankmain (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid
           , c.branchid
           , NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid
           , c.boorowerid custid
           , i.NAME custname
           , NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum
           , b.source
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID) 
         AND c.ID = p_id;
         
   CURSOR c_tranch
   IS
      SELECT count(*) cnt, nvl(sum(trancheamount),0) tramt
        FROM agro_tranches
       WHERE creditid=p_id 
         AND tranchedate<=p_edate;
   
   CURSOR c_payplane
   IS
      SELECT sum(principal) principal, sum(interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate <= p_edate;    
         
   CURSOR c_payments
   IS
      SELECT count(*) cnt
           , sum(payedamt+payeddueamt) payedamt
           , sum(payedintamt+payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid=p_id
         AND paydate <= p_edate;
         
   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id
         AND hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= p_edate);
          
   crdinf           c_crdinf%ROWTYPE;
   tranch           c_tranch%ROWTYPE;
   payments         c_payments%ROWTYPE;
   payplane         c_payplane%ROWTYPE;
   histinfo         c_histinfo%ROWTYPE;

BEGIN
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_tranch;
   fetch c_tranch into tranch;
   close c_tranch;
      
   open c_payments;
   fetch c_payments into payments;
   close c_payments;
      
   open c_payplane;
   fetch c_payplane into payplane;
   close c_payplane;
      
   open c_histinfo;
   fetch c_histinfo into histinfo;
   close c_histinfo;
      
   INSERT INTO cm_report_worldbankmain
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , decode(crdinf.source,1,1,2,1,0)
              , decode(crdinf.source,3,1,0)
              , decode(crdinf.source,4,1,0)
              , tranch.tramt
              , 0
              , 0
              , payplane.principal
              , payplane.interest
              , payplane.principal+payplane.interest
              , payments.payedamt
              , payments.payedintamt
              , payments.payedamt+payments.payedintamt
              , 0
              , 0
              , 0
              , 0
              , histinfo.duerest
              , histinfo.dueinterestrest
              , histinfo.duerest+histinfo.dueinterestrest
              ); 
END;

PROCEDURE insinfoworldbankactive (p_id INTEGER, p_bdate DATE, p_edate DATE)
IS
   CURSOR c_crdinf
   IS
      SELECT c.ID creditid
           , c.branchid
           , NVL (b.villageid, 0) villageid
           , NVL (b.akpurpose, 0) purposeid
           , c.boorowerid custid
           , i.NAME custname
           , NVL (b.TYPE, 0) typeid
           , c.numberofcredit crdnum
        FROM cm_active_credits c
           , cm_boorowerinfo i
           , cm_business_plan b
       WHERE (b.creditid(+) = c.ID)
         AND (i.creditid = c.ID) 
         AND c.ID = p_id;
         
   CURSOR c_tranch
   IS
      SELECT count(*) cnt, nvl(sum(trancheamount),0) tramt
        FROM agro_tranches
       WHERE creditid=p_id 
         AND tranchedate<=p_edate;
      
   CURSOR c_nextplane
   IS
      SELECT sum(principal) principal, sum(interest) interest
        FROM cm_all_payment_schedule
       WHERE creditid = p_id
         AND paymentdate BETWEEN trunc(trunc(p_edate,'mon')+32,'mon')
                             AND trunc(trunc(p_edate,'mon')+62,'mon');       
         
   CURSOR c_payments
   IS
      SELECT count(*) cnt
           , sum(payedamt+payeddueamt) payedamt
           , sum(payedintamt+payeddueintamt) payedintamt
        FROM agro_payments
       WHERE creditid=p_id
         AND paydate <= p_edate;
         
   CURSOR c_histinfo
   IS
      SELECT hdate, rest, interestrest, duerest, dueinterestrest
        FROM agro_history
       WHERE creditid = p_id
         AND hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= p_edate);
          
   crdinf           c_crdinf%ROWTYPE;
   tranch           c_tranch%ROWTYPE;
   payments         c_payments%ROWTYPE;
   histinfo         c_histinfo%ROWTYPE;
   nextplane        c_nextplane%ROWTYPE;
      
BEGIN
   open c_crdinf;
   fetch c_crdinf into crdinf;
   close c_crdinf;
   
   open c_tranch;
   fetch c_tranch into tranch;
   close c_tranch;
      
   open c_nextplane;
   fetch c_nextplane into nextplane;
   close c_nextplane;
      
   open c_payments;
   fetch c_payments into payments;
   close c_payments;
      
   open c_histinfo;
   fetch c_histinfo into histinfo;
   close c_histinfo;
   
   INSERT INTO cm_report_worldbankactive
        VALUES (crdinf.creditid
              , crdinf.custid
              , crdinf.crdnum
              , crdinf.custname
              , crdinf.branchid
              , crdinf.villageid
              , crdinf.purposeid
              , crdinf.typeid
              , 1
              , tranch.tramt
              , histinfo.duerest
              , histinfo.dueinterestrest
              , histinfo.duerest+histinfo.dueinterestrest
              , nextplane.principal
              , nextplane.interest
              , nextplane.principal+nextplane.interest
              , nextplane.interest+histinfo.interestrest+histinfo.dueinterestrest
              , payments.payedintamt
              , 0
              , 0
              , 0
              , 0
              , 0
              , 0
              , 0
              , 0
              , 0
              , 0
              ); 
END;

PROCEDURE insinfof3_full (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
           , bp.villageid, to_number(bp.akpurpose) purposeid, nvl(h.rest,0) rest
           , nvl(h.interestrest,0) interestrest, nvl(h.duerest,0) duerest
           , nvl(h.dueinterestrest,0) dueinterestrest
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
           , cm_hist2006 h
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND h.creditid(+) = p.ID
         AND bp.creditid(+) = p.ID
         AND p.ID = p_id;
         
   CURSOR c_tranche_y is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between TRUNC(p_edate,'Y') and p_edate;
      
   CURSOR c_tranche_m is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between p_bdate and p_edate;
        
   CURSOR c_over_info_y is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between TRUNC(p_edate,'Y') and p_edate;
        
   CURSOR c_over_info_m is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between p_bdate and p_edate;
           
   CURSOR c_payment_y is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments 
       WHERE creditid = p_id
         AND paydate between TRUNC(p_edate,'Y') and p_edate;
           
   CURSOR c_payment_m is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate between p_bdate and p_edate;

   CURSOR c_history is
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE creditid=p_id;  
       
   CURSOR c_oldcrd is
      select closedate from cm_old_credits where creditid=p_id and CLOSEDATE>=TRUNC(p_edate,'Y');     

   CURSOR c_values(mainpurpid integer) is
      select * from cm_agro_purprests where mainid=mainpurpid;    
   cursor c_val2 is
      select sum(rest+duerest) rrrest from cm_agro_purprests;
            
   crd     c_crdinfo%rowtype;
   try     c_tranche_y%rowtype;
   trm     c_tranche_m%rowtype;
   ody     c_over_info_y%rowtype;
   odm     c_over_info_m%rowtype;
   pyy     c_payment_y%rowtype;
   pym     c_payment_m%rowtype;
   hist    c_history%rowtype;
   oldc    c_oldcrd%rowtype;
   pval    c_values%rowtype;
   pva2    c_val2%rowtype;
   cnty    number;
   cntm    number;
   cntg    number;
   cntc    number;
   oim     number;
   oiy     number;
   ovm     number;
   ovy     number;
BEGIN
   open c_crdinfo;
   fetch c_crdinfo into crd;
   close c_crdinfo;
   
   open c_tranche_y;
   fetch c_tranche_y into try;
   close c_tranche_y;
      
   open c_tranche_m;
   fetch c_tranche_m into trm;
   close c_tranche_m;
      
   open c_over_info_y;
   fetch c_over_info_y into ody;
   close c_over_info_y;
      
   open c_over_info_m;
   fetch c_over_info_m into odm;
   close c_over_info_m;   
     
   open c_payment_y;
   fetch c_payment_y into pyy;
   close c_payment_y;
      
   open c_payment_m;
   fetch c_payment_m into pym;
   close c_payment_m;
      
   open c_history;
   fetch c_history into hist;
   close c_history;
         
   open c_oldcrd;
   fetch c_oldcrd into oldc;
   close c_oldcrd;

   open c_values(getpurposemainid(crd.purposeid));
   fetch c_values into pval;
   close c_values;
   
   open c_val2;
   fetch c_val2 into pva2;
   close c_val2;
      
   if crd.rest+crd.duerest+crd.interestrest+crd.dueinterestrest > 0  
   THEN cnty := 1; ELSE cnty := 0; END IF;
   
   if hist.rest+hist.duerest+hist.interestrest+hist.dueinterestrest > 0
   THEN cntm := 1; ELSE cntm := 0; END IF;
   
   if try.tramt > 0
   THEN cntg := 1; ELSE cntg := 0; END IF;
   /*
   if oldc.closedate is not null and oldc.closedate between TRUNC(p_edate, 'Y') and p_edate
   THEN cntc := 1; ELSE cntc := 0; END IF;
   */
   cntc := cnty+cntg-cntm;
   oim := 0;
   oiy := 0;
   ovm := 0;
   ovy := 0;
   
   if (try.tramt <> 0 ) then oiy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   if (trm.tramt <> 0 ) then oim := pym.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   
   ovy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;
   ovm := pym.payedintamt+hist.interestrest+hist.dueinterestrest;
   /*
   if crd.rest+crd.duerest > 0  
   THEN cnty := 1; ELSE cnty := 0; END IF;
   
   if hist.rest+hist.duerest > 0
   THEN cntm := 1; ELSE cntm := 0; END IF;
   
   if try.tramt > 0
   THEN cntg := 1; ELSE cntg := 0; END IF;
   
   if oldc.closedate is not null and oldc.closedate between p_bdate and p_edate
   THEN cntc := 1; ELSE cntc := 0; END IF;
   
   oim := 0;
   oiy := 0;
   
   if (try.tramt <> 0 ) then oiy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   if (try.tramt <> 0 ) then oim := pym.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   */
   if pva2.rrrest=0 then pva2.rrrest := 0.01; end if;
   if pval.rest=0 then pval.rest := 0.01; end if;
   insert into cm_report_f3_full
   values
      (
        p_id,
        crd.boorowerid,
        crd.boorower,
        crd.crdnum,
        crd.branchid,
        crd.branch,
        crd.villageid,
        0,
        crd.purposeid,
        cnty,
        cntm,
        cntg,
        cntc,
        crd.rest,
        crd.interestrest,
        crd.duerest,
        crd.dueinterestrest,
        try.tramt,
        oiy,
        trm.tramt,
        oim,
        ody.principal,
        ovy,
        odm.principal,
        ovm,
        pyy.payedamt,
        pyy.payedintamt,
        pym.payedamt,
        pym.payedintamt,
        hist.rest+hist.duerest,
        hist.interestrest+hist.dueinterestrest,
        hist.duerest,
        hist.dueinterestrest,
        (hist.rest+hist.duerest)/(pva2.rrrest),
        (hist.rest+hist.duerest)/(pval.rest+pval.duerest)
      );
   
END;

PROCEDURE insinfof3_filial (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
           , bp.villageid, to_number(bp.akpurpose) purposeid, nvl(h.rest,0) rest
           , nvl(h.interestrest,0) interestrest, nvl(h.duerest,0) duerest
           , nvl(h.dueinterestrest,0) dueinterestrest
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
           , cm_hist2006 h
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND h.creditid(+) = p.ID
         AND bp.creditid(+) = p.ID
         AND p.ID = p_id;
         
   CURSOR c_tranche_y is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between TRUNC(p_edate,'Y') and p_edate;
      
   CURSOR c_tranche_m is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between p_bdate and p_edate;
        
   CURSOR c_over_info_y is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between TRUNC(p_edate,'Y') and p_edate;
        
   CURSOR c_over_info_m is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between p_bdate and p_edate;
           
   CURSOR c_payment_y is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments 
       WHERE creditid = p_id
         AND paydate between TRUNC(p_edate,'Y') and p_edate;
           
   CURSOR c_payment_m is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate between p_bdate and p_edate;

   CURSOR c_history is
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE creditid=p_id;  
       
   CURSOR c_oldcrd is
      select closedate from cm_old_credits where creditid=p_id and CLOSEDATE>=TRUNC(p_edate,'Y');     

   CURSOR c_values(mainpurpid integer) is
      select * from cm_agro_branchrests where branchid=mainpurpid;    
   cursor c_val2 is
      select sum(rest+duerest) rrrest from cm_agro_branchrests;
            
   crd     c_crdinfo%rowtype;
   try     c_tranche_y%rowtype;
   trm     c_tranche_m%rowtype;
   ody     c_over_info_y%rowtype;
   odm     c_over_info_m%rowtype;
   pyy     c_payment_y%rowtype;
   pym     c_payment_m%rowtype;
   hist    c_history%rowtype;
   oldc    c_oldcrd%rowtype;
   pval    c_values%rowtype;
   pva2    c_val2%rowtype;
   cnty    number;
   cntm    number;
   cntg    number;
   cntc    number;
   oim     number;
   oiy     number;
   ovm     number;
   ovy     number;
BEGIN
   open c_crdinfo;
   fetch c_crdinfo into crd;
   close c_crdinfo;
   
   open c_tranche_y;
   fetch c_tranche_y into try;
   close c_tranche_y;
      
   open c_tranche_m;
   fetch c_tranche_m into trm;
   close c_tranche_m;
      
   open c_over_info_y;
   fetch c_over_info_y into ody;
   close c_over_info_y;
      
   open c_over_info_m;
   fetch c_over_info_m into odm;
   close c_over_info_m;   
     
   open c_payment_y;
   fetch c_payment_y into pyy;
   close c_payment_y;
      
   open c_payment_m;
   fetch c_payment_m into pym;
   close c_payment_m;
      
   open c_history;
   fetch c_history into hist;
   close c_history;
         
   open c_oldcrd;
   fetch c_oldcrd into oldc;
   close c_oldcrd;

   open c_values(crd.branchid);
   fetch c_values into pval;
   close c_values;
   
   open c_val2;
   fetch c_val2 into pva2;
   close c_val2;
      
   if crd.rest+crd.duerest+crd.interestrest+crd.dueinterestrest > 0  
   THEN cnty := 1; ELSE cnty := 0; END IF;
   
   if hist.rest+hist.duerest+hist.interestrest+hist.dueinterestrest > 0
   THEN cntm := 1; ELSE cntm := 0; END IF;
   
   if try.tramt > 0
   THEN cntg := 1; ELSE cntg := 0; END IF;
   /*
   if oldc.closedate is not null and oldc.closedate between TRUNC(p_edate, 'Y') and p_edate
   THEN cntc := 1; ELSE cntc := 0; END IF;
   */
   cntc := cnty+cntg-cntm;
   oim := 0;
   oiy := 0;
   ovm := 0;
   ovy := 0;
   
   if (try.tramt <> 0 ) then oiy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   if (trm.tramt <> 0 ) then oim := pym.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   
   ovy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;
   ovm := pym.payedintamt+hist.interestrest+hist.dueinterestrest;
   
   insert into cm_report_f3_full
   values
      (
        p_id,
        crd.boorowerid,
        crd.boorower,
        crd.crdnum,
        crd.branchid,
        crd.branch,
        crd.villageid,
        0,
        crd.purposeid,
        cnty,
        cntm,
        cntg,
        cntc,
        crd.rest,
        crd.interestrest,
        crd.duerest,
        crd.dueinterestrest,
        try.tramt,
        oiy,
        trm.tramt,
        oim,
        ody.principal,
        ovy,
        odm.principal,
        ovm,
        pyy.payedamt,
        pyy.payedintamt,
        pym.payedamt,
        pym.payedintamt,
        hist.rest+hist.duerest,
        hist.interestrest+hist.dueinterestrest,
        hist.duerest,
        hist.dueinterestrest,
        (hist.rest+hist.duerest)/(pva2.rrrest),
        (hist.rest+hist.duerest)/(pval.rest+pval.duerest)
      );
   
END;

PROCEDURE insinfof3_proj (
   p_id         IN   INTEGER
 , p_bdate      IN   DATE
 , p_edate      IN   DATE
)
IS
   CURSOR c_crdinfo
   IS
      SELECT b.ID branchid, b.NAME branch, p.boorowerid, c.NAME boorower
           , p.ID crdid, p.numberofcredit crdnum, bp.TYPE typeid
           , bp.villageid, to_number(bp.akpurpose) purposeid, nvl(h.rest,0) rest
           , nvl(h.interestrest,0) interestrest, nvl(h.duerest,0) duerest
           , nvl(h.dueinterestrest,0) dueinterestrest
        FROM cm_portfolio p
           , sb_filial b
           , cm_boorowerinfo c
           , cm_business_plan bp
           , cm_hist2006 h
       WHERE p.branchid = b.ID
         AND c.creditid = p.ID
         AND h.creditid(+) = p.ID
         AND bp.creditid(+) = p.ID
         AND p.ID = p_id;
         
   CURSOR c_tranche_y is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between TRUNC(p_edate,'Y') and p_edate;
      
   CURSOR c_tranche_m is
      SELECT NVL(SUM(trancheamount),0) tramt 
        FROM AGRO_TRANCHES 
       WHERE creditid = p_id
         AND tranchedate between p_bdate and p_edate;
        
   CURSOR c_over_info_y is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between TRUNC(p_edate,'Y') and p_edate;
        
   CURSOR c_over_info_m is
      SELECT SUM(principal) principal, SUM(interest) interest  
        FROM cm_all_payment_schedule 
       WHERE creditid = p_id
         AND paymentdate between p_bdate and p_edate;
           
   CURSOR c_payment_y is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments 
       WHERE creditid = p_id
         AND paydate between TRUNC(p_edate,'Y') and p_edate;
           
   CURSOR c_payment_m is
      SELECT SUM(payedamt+payeddueamt) payedamt,
             SUM(payedintamt+payeddueintamt) payedintamt  
        FROM agro_payments
       WHERE creditid = p_id
         AND paydate between p_bdate and p_edate;

   CURSOR c_history is
      SELECT rest, duerest, interestrest, dueinterestrest
        FROM agro_history
       WHERE creditid=p_id;  
       
   CURSOR c_oldcrd is
      select closedate from cm_old_credits where creditid=p_id and CLOSEDATE>=TRUNC(p_edate,'Y');     

   CURSOR c_values(mainpurpid integer) is
      select * from cm_agro_projrests where mainpurpid=projectid;    
   cursor c_val2 is
      select sum(rest+duerest) rrrest from cm_agro_projrests;
            
   crd     c_crdinfo%rowtype;
   try     c_tranche_y%rowtype;
   trm     c_tranche_m%rowtype;
   ody     c_over_info_y%rowtype;
   odm     c_over_info_m%rowtype;
   pyy     c_payment_y%rowtype;
   pym     c_payment_m%rowtype;
   hist    c_history%rowtype;
   oldc    c_oldcrd%rowtype;
   pval    c_values%rowtype;
   pva2    c_val2%rowtype;
   cnty    number;
   cntm    number;
   cntg    number;
   cntc    number;
   oim     number;
   oiy     number;
   ovm     number;
   ovy     number;
BEGIN
   open c_crdinfo;
   fetch c_crdinfo into crd;
   close c_crdinfo;
   
   open c_tranche_y;
   fetch c_tranche_y into try;
   close c_tranche_y;
      
   open c_tranche_m;
   fetch c_tranche_m into trm;
   close c_tranche_m;
      
   open c_over_info_y;
   fetch c_over_info_y into ody;
   close c_over_info_y;
      
   open c_over_info_m;
   fetch c_over_info_m into odm;
   close c_over_info_m;   
     
   open c_payment_y;
   fetch c_payment_y into pyy;
   close c_payment_y;
      
   open c_payment_m;
   fetch c_payment_m into pym;
   close c_payment_m;
      
   open c_history;
   fetch c_history into hist;
   close c_history;
         
   open c_oldcrd;
   fetch c_oldcrd into oldc;
   close c_oldcrd;

   open c_values(crd.branchid);
   fetch c_values into pval;
   close c_values;
   
   open c_val2;
   fetch c_val2 into pva2;
   close c_val2;
      
   if crd.rest+crd.duerest+crd.interestrest+crd.dueinterestrest > 0  
   THEN cnty := 1; ELSE cnty := 0; END IF;
   
   if hist.rest+hist.duerest+hist.interestrest+hist.dueinterestrest > 0
   THEN cntm := 1; ELSE cntm := 0; END IF;
   
   if try.tramt > 0
   THEN cntg := 1; ELSE cntg := 0; END IF;
   /*
   if oldc.closedate is not null and oldc.closedate between TRUNC(p_edate, 'Y') and p_edate
   THEN cntc := 1; ELSE cntc := 0; END IF;
   */
   cntc := cnty+cntg-cntm;
   oim := 0;
   oiy := 0;
   ovm := 0;
   ovy := 0;
   
   if (try.tramt <> 0 ) then oiy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   if (trm.tramt <> 0 ) then oim := pym.payedintamt+hist.interestrest+hist.dueinterestrest;end if;
   
   ovy := pyy.payedintamt+hist.interestrest+hist.dueinterestrest;
   ovm := pym.payedintamt+hist.interestrest+hist.dueinterestrest;
   
   insert into cm_report_f3_full
   values
      (
        p_id,
        crd.boorowerid,
        crd.boorower,
        crd.crdnum,
        crd.branchid,
        crd.branch,
        crd.villageid,
        0,
        crd.purposeid,
        cnty,
        cntm,
        cntg,
        cntc,
        crd.rest,
        crd.interestrest,
        crd.duerest,
        crd.dueinterestrest,
        try.tramt,
        oiy,
        trm.tramt,
        oim,
        ody.principal,
        ovy,
        odm.principal,
        ovm,
        pyy.payedamt,
        pyy.payedintamt,
        pym.payedamt,
        pym.payedintamt,
        hist.rest+hist.duerest,
        hist.interestrest+hist.dueinterestrest,
        hist.duerest,
        hist.dueinterestrest,
        (hist.rest+hist.duerest)/(pva2.rrrest),
        (hist.rest+hist.duerest)/(pval.rest+pval.duerest)
      );
   
END;

procedure insinfoablegm(p_id number, p_bdate date, p_edate date)
is
   cursor c_crdinf is
        SELECT p.ID, p.boorowerid, i.NAME boorowername,
               villageid, f.ID branchid, f.NAME branch, p.numberofcredit crdnum
          FROM cm_business_plan b, sb_filial f, cm_portfolio p, cm_boorowerinfo i
         WHERE b.creditid(+) = p.ID AND p.branchid = f.ID AND p.ID = i.creditid
               AND p.ID = p_id;

      CURSOR c_min_date
      IS
         SELECT NVL(MIN (tranchedate),SYSDATE) trdate
           FROM agro_TRANCHES
          WHERE creditid = p_id;

      CURSOR c_max_date
      IS
         SELECT NVL(MAX (paymentdate),SYSDATE) paydate
           FROM cm_all_payment_schedule
          WHERE creditid = p_id;

      CURSOR c_amount
      IS
         SELECT SUM (trancheamount) amt
           FROM agro_tranches
          WHERE creditid = p_id AND tranchedate <= p_edate;

      CURSOR c_histinfo
      IS
         SELECT hdate, rest, interestrest, duerest, dueinterestrest
              , DECODE (stopcalcdate, NULL, 1, 0) calcstatus
           FROM agro_history
          WHERE creditid = p_id AND hdate = (SELECT MAX (hdate)
                                               FROM cm_history
                                              WHERE hdate <= p_edate);
      cursor c_legmeasure(mcode integer)
      is
        SELECT MIN (grantdate) grantdate, MIN (givedate) givedate,
               SUM (totalamount) totalamount, SUM (maindebt) maindebt,
               count(*) cnt
          FROM cm_lm_all
         WHERE measurecode=mcode and creditid = p_id; 
      cursor c_pays (pdate in date)
      is
        select sum(payedamt+payeddueamt) payedamt,
               sum(payedintamt+payeddueintamt) payedintamt
          from cm_payments
         where creditid=p_id and paydate>pdate;        
      cursor c_guar
      is
      SELECT pledgepriceevkv, pledgepricetorpaqha
        FROM cm_guarantee
       WHERE creditid = p_id;
      cursor c_pledg 
      is
      select PLEDGEPRICE,PLEDGEPRICETORPAQ,PLEDGEPRICEEV from agro_history
      where creditid=p_id;
  crdinf c_crdinf%rowtype;
  mindate c_min_date%rowtype;
  maxdate c_max_date%rowtype;
  amount c_amount%rowtype;
  histinf c_histinfo%rowtype;
  legm1 c_legmeasure%rowtype;
  legm2 c_legmeasure%rowtype;
  legm3 c_legmeasure%rowtype;
  guar c_guar%rowtype;
  pledg c_pledg%rowtype;
  pays1 c_pays%rowtype;
  pays2 c_pays%rowtype;
  pays3 c_pays%rowtype;
  pays c_pays%rowtype;
begin
  open c_crdinf;
  fetch c_crdinf into crdinf;
  close c_crdinf;
  
  open c_min_date;
  fetch c_min_date into mindate;
  close c_min_date;
    
  open c_max_date;
  fetch c_max_date into maxdate;
  close c_max_date;

  open c_amount;
  fetch c_amount into amount;
  close c_amount;
  
  open c_pledg;  
  fetch c_pledg into pledg;  
  close c_pledg;
  
  open c_guar;  
  fetch c_guar into guar;  
  close c_guar;
  
  open c_legmeasure(4);
  fetch c_legmeasure into legm1;
  close c_legmeasure;
  
  open c_pays (legm1.givedate);
  fetch c_pays into pays1;
  close c_pays;
  
  open c_legmeasure(6);
  fetch c_legmeasure into legm2;
  close c_legmeasure;
  
  open c_pays (legm2.givedate);
  fetch c_pays into pays2;
  close c_pays;
  
  open c_legmeasure(7);
  fetch c_legmeasure into legm3;
  close c_legmeasure;
  
  open c_pays (legm3.givedate);
  fetch c_pays into pays3;
  close c_pays;
  
  open c_histinfo;
  fetch c_histinfo into histinf;
  close c_histinfo;

insert into cm_report_ab_legal_m values(0,                            
crdinf.id,                            
crdinf.boorowername,                           
crdinf.crdnum,                           
crdinf.branchid,                            
crdinf.branch,                           
crdinf.villageid,                            
0,                            
mindate.trdate,                  
maxdate.paydate,                  
amount.amt,                            
0,                            
histinf.rest+histinf.duerest,                            
histinf.interestrest+histinf.dueinterestrest,                            
legm1.givedate,                  
legm1.totalamount,                            
pays1.payedamt,                            
pays1.payedintamt,                            
legm2.givedate,                  
legm2.totalamount,                             
pays2.payedamt,                            
pays2.payedintamt,            
legm3.givedate,                  
legm3.totalamount,                             
pays3.payedamt,                            
pays3.payedintamt,           
0,                            
0,                            
0,                            
0,                            
guar.pledgepricetorpaqha,                            
pledg.pledgepricetorpaq,                            
guar.pledgepriceevkv,                            
pledg.pledgepriceev,                            
pledg.pledgeprice);
end;

PROCEDURE ins_agro_bvalues (p_edate IN DATE, p_wherestr IN VARCHAR2)
IS
  sqlstr varchar(255);
BEGIN
   BEGIN
      EXECUTE IMMEDIATE 'drop table cm_agro_branchrests';
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.put_line ('Table Does not exists');
   END;

   EXECUTE IMMEDIATE 'CREATE TABLE cm_agro_branchrests
(credcount NUMBER, rest NUMBER, interest NUMBER, duerest NUMBER, dueinterest NUMBER,
 branchid NUMBER, branchname VARCHAR2(255)
)';

EXECUTE IMMEDIATE  'INSERT INTO cm_agro_branchrests
SELECT   COUNT(*) CredCount, SUM (h.rest) rest, SUM (h.interestrest) interest
       , SUM (h.duerest) duerest, SUM (h.dueinterestrest) dueinterest
       ,b.branchid, getbranchname(branchid) branchname
    FROM cm_active_credits b
       , cm_history h
   WHERE b.id = h.creditid
     AND hdate = '''
                     || p_edate
                     || '''
     AND b.id IN (select id from cm_active_credits '
                     || p_wherestr
                     || ')
GROUP BY b.branchid';/*
update smart.a1 set c5='INSERT INTO cm_agro_branchrests
SELECT   COUNT(*) CredCount, SUM (h.rest) rest, SUM (h.interestrest) interest
       , SUM (h.duerest) duerest, SUM (h.dueinterestrest) dueinterest
       ,b.branchid, ''-'' branchname
    FROM cm_active_credits b
       , cm_history h
   WHERE b.id = h.creditid
     AND hdate = '''
                     || p_edate
                     || '''
     AND b.creditid IN (select id from cm_active_credits '
                     || p_wherestr
                     || ')
GROUP BY b.branchid';*/
   COMMIT WORK;
END;

PROCEDURE ins_agro_values (p_edate IN DATE, p_wherestr IN VARCHAR2)
IS
  sqlstr varchar(255);
BEGIN
   BEGIN
      EXECUTE IMMEDIATE 'drop table cm_agro_purprests';
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.put_line ('Table Does not exists');
   END;

   EXECUTE IMMEDIATE 'CREATE TABLE cm_agro_purprests
(credcount NUMBER, rest NUMBER, interest NUMBER, duerest NUMBER, dueinterest NUMBER,
 mainid NUMBER, mainpurpose VARCHAR2(255)
)';

EXECUTE IMMEDIATE  'INSERT INTO cm_agro_purprests
SELECT   COUNT(*) CredCount, SUM (h.rest) rest, SUM (h.interestrest) interest
       , SUM (h.duerest) duerest, SUM (h.dueinterestrest) dueinterest
       , m.ID mainid, m.NAME mainpurpose
    FROM cm_business_plan b
       , cm_history h
       , agro_kredit_purpose p
       , agro_kredit_target t
       , agro_kredit_mainpurpose m
   WHERE b.creditid = h.creditid
     AND b.akpurpose = p.ID
     AND p.depend_id = t.ID
     AND t.depend_id = m.ID
     AND hdate = '''
                     || p_edate
                     || '''
     AND b.creditid IN (select id from cm_active_credits '
                     || p_wherestr
                     || ')
GROUP BY m.ID, m.NAME';
   COMMIT WORK;
END;

PROCEDURE ins_agro_projvalues (p_edate IN DATE, p_wherestr IN VARCHAR2)
IS
  sqlstr varchar(255);
BEGIN
   BEGIN
      EXECUTE IMMEDIATE 'drop table cm_agro_projrests';
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.put_line ('Table Does not exists');
   END;

   EXECUTE IMMEDIATE 'CREATE TABLE cm_agro_projrests
(credcount NUMBER, rest NUMBER, interest NUMBER, duerest NUMBER, dueinterest NUMBER,
 projectid NUMBER, project VARCHAR2(255)
)';

   EXECUTE IMMEDIATE  'INSERT INTO cm_agro_projrests
SELECT   COUNT(*) CredCount, SUM (h.rest) rest, SUM (h.interestrest) interest
       , SUM (h.duerest) duerest, SUM (h.dueinterestrest) dueinterest
       , m.ID , m.description 
    FROM cm_active_credits b
       , cm_history h
       , cm_usergroups m
   WHERE b.id = h.creditid
     AND b.usrgroup = m.ID
     AND hdate = '''
                     || p_edate
                     || '''
     AND b.id IN (select id from cm_active_credits '
                     || p_wherestr
                     || ')
GROUP BY m.ID, m.description';
   COMMIT WORK;
END;

FUNCTION gettableselect (usgrp INTEGER)
   RETURN VARCHAR2
IS
   CURSOR c1
   IS
      SELECT 'select * from ' || table_name || ' ' selquery
        FROM all_tables
       WHERE table_name LIKE 'CM_FORM1_%_' || usgrp AND owner = USER;

   res   VARCHAR2 (255);
BEGIN
   res := CHR (10);

   FOR x IN c1
   LOOP
      IF res <> CHR (10)
      THEN
         res := res || ' union ';
      END IF;

      res := res || x.selquery;
   END LOOP;

   RETURN res;
END;

FUNCTION get_purpose_target (purpid number)
   RETURN NUMBER
IS
   res   NUMBER;
BEGIN
   SELECT depend_id
     INTO res
     FROM agro_kredit_purpose
    WHERE ID = to_number(purpid);

   IF res IS NULL
   THEN
      res := 0;
   END IF;

   RETURN res;
END;

FUNCTION datapercentdiv (div1 NUMBER, div2 NUMBER)
   RETURN NUMBER
IS
BEGIN
   IF div2 = 0
   THEN
      RETURN 100;
   ELSE
      RETURN 100 * div1 / div2;
   END IF;
END;

FUNCTION getpurposemainid (pid number)
   RETURN number
IS
   res   number;
BEGIN
   SELECT depend_id
     INTO res
     FROM agro_kredit_target
    WHERE ID = (SELECT depend_id
                  FROM agro_kredit_purpose
                 WHERE ID = pid);

   RETURN res;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN 0;
END;

PROCEDURE maketemp (pbdat DATE, pedat DATE)
IS
BEGIN
   INSERT INTO agro_history
      SELECT creditid, hdate, lastcalcdate, stopcalcdate, rest, interestrest
           , duerest, dueinterestrest, reserveid, givenamount, obligation
           , pledgeprice, partitionkey, duereserveid, pledgepricetorpaq
           , pledgepriceev
        FROM cm_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= pedat);
   /*                    
   INSERT INTO agro_history
      SELECT creditid, hdate, lastcalcdate, stopcalcdate, rest, interestrest
           , duerest, dueinterestrest, reserveid, givenamount, obligation
           , pledgeprice, partitionkey, duereserveid, pledgepricetorpaq
           , pledgepriceev
        FROM cm_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= trunc(pedat,'Y'));
                       
   INSERT INTO agro_history
      SELECT creditid, hdate, lastcalcdate, stopcalcdate, rest, interestrest
           , duerest, dueinterestrest, reserveid, givenamount, obligation
           , pledgeprice, partitionkey, duereserveid, pledgepricetorpaq
           , pledgepriceev
        FROM cm_history
       WHERE hdate = (SELECT MAX (hdate)
                        FROM cm_history
                       WHERE hdate <= trunc(pedat,'MON'));
*/
   INSERT INTO agro_tranches
      SELECT ID, creditid, tranchedate, trancheamount
        FROM cm_all_tranches
       WHERE tranchedate <= pedat;
 
   INSERT INTO agro_payments
      SELECT ID, creditid, paydate, payedamt, payedintamt, payeddueamt
           , payeddueintamt, payedpenaltyamt
        FROM cm_all_payments
       WHERE paydate <= pedat;
END;

  
   PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE, includeold integer:=0)
   IS
      CURSOR c_crd_info
      IS
         SELECT d.id districtid, d.NAME district, v.id villageid,
                v.NAME village, t.id typeid, t.typedesc, m.id purposeid,
                m.NAME purpose, f.id branchid, f.NAME branch, 
                r.purposedesc||'('||s.shortname||')' credperiod,
                p.numberofcredit crdnum, p.boorowerid, i.NAME boorowername,
                p.annualyinterestrate intrate, p.ANNUALYOVERDUERATE odrate
           FROM cm_business_plan b,
                agro_region d,
                agro_village v,
                cm_bp_types t,
                agro_kredit_purpose m,
                sb_filial f,
                cm_portfolio p,
                cm_boorowerinfo i,
                cm_bp_purposes r,
                cm_bp_sources s
          WHERE v.depend_id = d.id (+)
            AND b.villageid = v.id (+)
            AND b.TYPE = t.id (+)
            AND b.akpurpose = m.id(+)
            AND b.creditid (+) = p.id
            AND p.branchid = f.id
            AND p.id = i.creditid
            AND p.id = p_id
            AND b.purpose = r.id
            AND b.source = s.id;

      CURSOR c_min_date
      IS
         SELECT MIN (tranchedate) trdate
           FROM agro_TRANCHES
          WHERE creditid = p_id;

      CURSOR c_max_date
      IS
         SELECT NVL(MAX (paymentdate),SYSDATE) paydate
           FROM cm_all_payment_schedule
          WHERE creditid = p_id
            --AND paydate <= p_edate
            ;

      CURSOR c_histinfo
      IS
         SELECT hdate, rest, interestrest, duerest, dueinterestrest
              , DECODE (stopcalcdate, NULL, 1, 0) calcstatus
           FROM agro_history
          WHERE creditid = p_id AND hdate = (SELECT MAX (hdate)
                                               FROM cm_history
                                              WHERE hdate <= p_edate);

      CURSOR c_amount
      IS
         SELECT SUM (trancheamount) amt
           FROM agro_tranches
          WHERE creditid = p_id AND tranchedate <= p_edate;

      CURSOR c_payinfo_month
      IS
         SELECT SUM (payedamt+payeddueamt) payedamt,
                SUM (payedintamt+payeddueintamt) payedintamt
           FROM agro_payments
          WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

      CURSOR c_payinfo
      IS
         SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt,
                SUM (payeddueamt) payeddueamt,
                SUM (payeddueintamt) payeddueintamt
           FROM agro_payments
          WHERE creditid = p_id AND paydate <= p_edate;

      CURSOR c_payplane
      IS
         SELECT SUM (principal) principal, SUM (interest) interest
           FROM cm_all_payment_schedule
          WHERE creditid = p_id AND paymentdate <= p_edate;
          
        cursor c_numCrd (P_id in integer)
        is
        SELECT dateofconclusion, duedatefirstcontract
          FROM cm_portfolio
         WHERE ID = p_id;
           
      portinfo        c_numCrd%rowtype;
      crdinfo         c_crd_info%ROWTYPE;
      histinfo        c_histinfo%ROWTYPE;
      overcount       INTEGER;
      min_date        c_min_date%ROWTYPE;
      max_date        c_max_date%ROWTYPE;
      amounti         c_amount%ROWTYPE;
      payplaneinfo    c_payplane%ROWTYPE;
      payinfo         c_payinfo%ROWTYPE;
      payinfo_month   c_payinfo_month%ROWTYPE;
      calcpercent     NUMBER;
      overdatep       NUMBER;
      payintamt       NUMBER;
      histintamt      NUMBER;
      defDate Date;
      DefMaxDate Date;
   BEGIN
      
      open c_numCrd(p_id);
      fetch  c_numCrd into portinfo;
      close c_numCrd;
     
      OPEN c_histinfo;
      FETCH c_histinfo INTO histinfo;
      CLOSE c_histinfo;
      
      IF (    (histinfo.rest = 0)
          AND (histinfo.interestrest = 0)
          AND (histinfo.duerest = 0)
          AND (histinfo.dueinterestrest = 0)
         )
      THEN
         overcount := 0;         
      ELSE
         overcount := 1;
      END IF;
      
      if includeold<>0 or overcount=1 then
      
      OPEN c_crd_info;
      FETCH c_crd_info INTO crdinfo;
      CLOSE c_crd_info;
      OPEN c_payplane;
      FETCH c_payplane INTO payplaneinfo;
      CLOSE c_payplane;

      OPEN c_min_date;
      FETCH c_min_date INTO min_date;
      CLOSE c_min_date;

      
      OPEN c_max_date;
      FETCH c_max_date INTO max_date;
      CLOSE c_max_date;

      
      defdate := min_date.trdate;
      DefMaxDate := max_date.paydate;
      /*
      if histinfo.Rest = 0 then
      defdate := portinfo.DATEOFCONCLUSION;
      DefMaxDate :=portinfo.DUEDATEFIRSTCONTRACT;
      end if;*/


      OPEN c_amount;
      FETCH c_amount INTO amounti;
      CLOSE c_amount;
      OPEN c_payinfo;
      FETCH c_payinfo INTO payinfo;
      CLOSE c_payinfo;
      OPEN c_payinfo_month;
      FETCH c_payinfo_month INTO payinfo_month;
      CLOSE c_payinfo_month;

      --histinfo.Rest := amounti.amt-payinfo.payedamt; 
      
      payintamt := nvl(payinfo.payeddueintamt,0) + nvl(payinfo.payedintamt,0);
      histintamt:= nvl(histinfo.interestrest,0)+nvl(histinfo.dueinterestrest,0);
      calcpercent := payintamt+histintamt;
      overdatep := calcpercent;
 /*     IF (nvl(payplaneinfo.interest,0) < payintamt)
      THEN
         calcpercent := payintamt;
         overdatep := payintamt+nvl(histinfo.interestrest,0)+nvl(histinfo.dueinterestrest,0);
      ELSE
         calcpercent := payplaneinfo.interest;
         overdatep := payplaneinfo.interest;
      END IF;
      
      if calcpercent < overdatep then calcpercent := overdatep; end if;
      
      --IF (payplaneinfo.interest<) */
        /*
      IF (    (histinfo.rest < 100)
          AND (histinfo.interestrest < 100)
          AND (histinfo.duerest < 100)
          AND (histinfo.dueinterestrest < 100)
         )
      THEN
               payplaneinfo.principal :=
                            NVL (payinfo.payedamt, 0)
                          + NVL (payinfo.payeddueamt, 0);
      END IF;
        */

      INSERT INTO cm_report_f1
           VALUES (p_id
                 , NVL (crdinfo.boorowerid, 0)
                 , NVL (crdinfo.crdnum, '-')
                 , NVL (crdinfo.boorowername,'-')
                 , NVL (crdinfo.branchid,0)
                 , NVL (crdinfo.branch,'-')
                 , NVL (crdinfo.districtid,0)
                 , NVL (crdinfo.district,'-')
                 , NVL (crdinfo.villageid,0)
                 , NVL (crdinfo.village,'-')
                 , NVL (crdinfo.purposeid,0)
                 , NVL (crdinfo.purpose,'-')
                 , NVL (crdinfo.typeid,0)
                 , NVL (crdinfo.typedesc,'-')
                 , 1
                 , overcount
                 , defdate
                 , DefMaxDate
                 , NVL (amounti.amt, 0)
                 , NVL (calcpercent,0)
                 , NVL (payplaneinfo.principal,0)
                 , NVL (overdatep,0)
                 , NVL (payinfo.payedamt, 0) + NVL (payinfo.payeddueamt,0)
                 , NVL (payinfo.payedintamt, 0 )+ NVL (  payinfo.payeddueintamt,0)
                 , NVL (payinfo_month.payedamt,0)
                 , NVL (payinfo_month.payedintamt,0)
                 , NVL (histinfo.rest, 0 )  + NVL (histinfo.duerest, 0)
                 , NVL (histinfo.interestrest,0)  + NVL (histinfo.dueinterestrest,0 )
                 , NVL (histinfo.duerest,0 )
                 , NVL (histinfo.dueinterestrest, 0)
                 , decode (histinfo.calcstatus, 1,'-','Щ/S')
                 , NVL (crdinfo.credperiod, 'Диэяр')
                 , NVL (crdinfo.intrate, 0)
                 , NVL (crdinfo.odrate, 0));
      end if;
  /* EXCEPTION
      WHEN OTHERS
      THEN
         raise_application_error (-20003, p_id);*/
   END;
   function Get_MonthPayment(p_creditid in integer,p_date in date)
  return number
  is
     result number;
     
     cursor c_pay(bdat in date,edat in date) is
     select sum(PAYEDAMT) as payamt
     from cm_payments
     where creditid = p_creditid
     and paydate between bdat and edat;
     
     Lastdate date;
     firstdate date;
     
  begin

  select last_day(p_date) into
    Lastdate from dual;

  select (ADD_MONTHS(Lastdate,-1)+1) into
    firstdate  from dual;

   open c_pay(firstdate,Lastdate);
   fetch c_pay into result;
   close c_pay;

   Return nvl(result,0);
   
 end;
 function get_payint(pay_sh in integer,pdate in date)
   return number
   is
      cursor pi is
      select PAYEDINTAMT from cm_payments
      where creditid=pay_sh and PAYDATE=pdate;
   result number;
   begin
      open pi ;
      fetch Pi into result;
      close pi;
      if result is null
      then
      result:=0;
      end if;
      return result;
   end;
  
  function Get_PlanPayment(p_CrdID in integer, 
                           p_OpType in integer,
                           p_Dat in date )
  return number
   is
   Result number := 0;
   
   cursor c_planRest is
   select
           principal, 
           interest, 
           ipinterest
   from cm_payment_schedule
   where creditid = p_CrdID
   and  paymentdate = p_Dat;       
   
   planRest c_planRest%RowType;
   
   begin
      
      open c_planRest;
      fetch c_planRest into planRest;
      close c_planRest;
      
      if  p_OpType = cm_decls.cmPaymentMainTransactionOpType then
          Result := nvl(planRest.principal,0);    
      else if p_OpType = cm_decls.cmPaymentIntTransactionOpType then
          Result := nvl(planRest.interest,0) ;
      end if;
      
      end if;
      return result;
   end;
   
 FUNCTION GET_RESERVE_PERCENT(p_id in integer) 
return integer
is
 cursor c_res is
 select PERCENT
 from cm_reserves
 where id=p_id;
 result integer;
begin
 open c_res;
 fetch c_res into result;
 close c_res;
 return result;
END;

FUNCTION get_reserves_name(p_id in integer)
return varchar2
is
result varchar2(67);
begin
if p_id is null then Result :=  ' ';
else
select description||'-'||percent into result
from cm_reserves
where id = p_id;
end if;
return result;

end;

function Get_CustName(p_CustID in integer)
return varchar2
is
Result varchar2(95);
cursor C_CustName is
  select name from
  cm_sb_customers
 where ID =P_CustID;
begin
   
   open C_CustName;
   fetch C_CustName into Result;
   close C_CustName;
   
   Return nvl(Result, ' ');
end;

function Get_Catdesc(p_CatID in integer)
return varchar2
is
Result varchar2(95);
cursor C_Catdesc is
  select description from
  cm_categories
 where ID =p_CatID;
begin
   
   open C_Catdesc;
   fetch C_Catdesc into Result;
   close C_Catdesc;
   
   Return nvl(Result, ' ');
end;
  

function Get_Perdesc(p_CatID in integer)
return varchar2
is
Result varchar2(95);
cursor C_Catdesc is
  select descripion from
  cm_persons
 where ID =p_CatID;
begin
   
   open C_Catdesc;
   fetch C_Catdesc into Result;
   close C_Catdesc;
   
   Return nvl(Result, ' ');
end;

function Get_CrdTypedesc(p_CatID in integer)
return varchar2
is
Result varchar2(95);
cursor C_Catdesc is
  select description from
  cm_credittypes
 where ID =p_CatID;
begin
   
   open C_Catdesc;
   fetch C_Catdesc into Result;
   close C_Catdesc;
   
   Return nvl(Result, ' ');
end;
       
function Get_UserGrdesc(p_CatID in integer)
return varchar2
is
Result varchar2(95);
cursor C_Catdesc is
  select description from
  cm_usergroups
 where ID =p_CatID;
begin
   
   open C_Catdesc;
   fetch C_Catdesc into Result;
   close C_Catdesc;
   
   Return nvl(Result, ' ');
end;

FUNCTION            get_filialname (b_id IN INTEGER)
   RETURN VARCHAR2
IS
   res   VARCHAR2 (255);
BEGIN
   SELECT NAME
     INTO res
     FROM sb_filial
    WHERE ID = b_id;

   RETURN res;
END;

function Get_userNameByID(p_id in integer)
return varchar2
is
 cursor c_username is
 select name from sb_user$
 where id = p_id;
 
 result varchar2(35);
begin
    open c_username;
    fetch c_username into result;
    close c_username;
    return nvl(result,' ');
end;   

function Get_CreditFullPayAmt(
                        p_creditID in integer,
                        p_Dat in Date)
return number
is
Result number;
 
 cursor c_Acc is
 select boorowerAccID
 from cm_accounts
 where CreditID = P_CreditID;

BoorRest number;
 
 cursor C_PayPlan is
 select Rest
 from cm_payment_schedule
 where creditid =P_CreditID 
 and paymentdate =(
    select min(paymentdate) 
 from cm_payment_schedule where creditID =P_CreditID
 and PaymentDate > p_Dat);
 
 PlanRest number;
 Acc integer;
 
    
begin
   
   open c_payplan;
   fetch c_payplan into PlanRest;
   close c_payplan;
   
   open c_acc;
   fetch c_acc into acc;
   close c_acc;
   
   if acc is null then
      result :=  0;
   end if;
   
   BoorRest := cm_common.accountrest_get(acc);
   result := round(0.99*nvl(PlanRest,0)-BoorRest);
   return result;
   
end;

FUNCTION get_reserve_percent_date(p_creditid in integer,p_date in date) 
return integer
is
 cursor c_res is
 select PERCENT
 from cm_reserves
 where id=(
 select reserveid from cm_history
 where creditid =p_creditid and hdate=(
 select max(hdate) from cm_history where hdate<=p_date));
 result integer;
begin
 open c_res;
 fetch c_res into result;
 close c_res;
 return result;
END;

                               
 function get_creditcalcmethod(p_methodid in integer)
 return varchar2
 is
   result varchar2(10);
   cursor c_method is
   SELECT  description
  FROM cm_intcalcmethod
  where id =p_methodid;    
       
  begin

    open c_method;
    fetch c_method into result;
    close c_method;
    
    return result;
       
  end;                               




 END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AK_REPORTS

-- Start of DDL Script for Package CREDITSMGR.CM_AK_REPORTS2
-- Generated 30-Apr-2007 11:01:26 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ak_reports2
  IS
  PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
  function Get_CurrencyOstat(p_id in integer,p_dat in date)
   return number;
  function Get_CreditDateDueInterestRest(p_id in integer,
                               p_dat in date,
                               p_ek in boolean default false)
   return number;
  function Get_CreditDateRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer )
   return number;
  function get_balcn(p_id in integer)
return number;
  function Get_CreditTranches(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number;
  function Get_CreditMainPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number;
  function Get_CreditIntPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number;
  function Get_CreditDuePayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number;
  function Get_CreditDueIntPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number;
  function Get_CreditDateInteRestRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer )
   return number;
  function Get_CreditDateDueRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer)
   return number;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_ak_reports2
IS
   PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
   IS
      CURSOR c_portfoliotrunc
      IS
         SELECT dateofconclusion d1, duedatefirstcontract d2
           FROM cm_portfolio
          WHERE ID = p_id;

      CURSOR c_begininfo
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history
          WHERE creditid = p_id AND hdate = p_bdate;

      CURSOR c_endinfo
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history
          WHERE creditid = p_id AND hdate = p_edate;

      CURSOR c_paymentinfo
      IS
         SELECT NVL (SUM (i.payedamt), 0) amtmain
              , NVL (SUM (i.payedintamt), 0) amtint
              , NVL (SUM (i.payeddueamt), 0) amtduemain
              , NVL (SUM (i.payeddueintamt), 0) amtdueint
           FROM cm_payments i
          WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

      CURSOR c_trchinfo
      IS
         SELECT NVL (SUM (trancheamount), 0) trchamt
           FROM cm_tranches
          WHERE creditid = p_id AND tranchedate BETWEEN p_bdate AND p_edate;

      begininfo        c_begininfo%ROWTYPE;
      endinfo          c_endinfo%ROWTYPE;
      paymentinfo      c_paymentinfo%ROWTYPE;
      trchinfo         c_trchinfo%ROWTYPE;
      portfoliotrunc   c_portfoliotrunc%ROWTYPE;
      montrunc         INTEGER;
   BEGIN
      OPEN c_begininfo;
      FETCH c_begininfo INTO begininfo;
      CLOSE c_begininfo;
      OPEN c_endinfo;
      FETCH c_endinfo INTO endinfo;
      CLOSE c_endinfo;
      OPEN c_paymentinfo;
      FETCH c_paymentinfo INTO paymentinfo;
      CLOSE c_paymentinfo;
      OPEN c_trchinfo;
      FETCH c_trchinfo INTO trchinfo;
      CLOSE c_trchinfo;
      OPEN c_portfoliotrunc;
      FETCH c_portfoliotrunc INTO portfoliotrunc;
      CLOSE c_portfoliotrunc;
      montrunc :=
                TRUNC (MONTHS_BETWEEN (portfoliotrunc.d2, portfoliotrunc.d1));

      INSERT INTO cm_report_sd1
           VALUES (p_id, NVL (begininfo.rest, 0)
                 , NVL (begininfo.interestrest, 0)
                 , NVL (begininfo.duerest, 0)
                 , NVL (begininfo.dueinterestrest, 0)
                 , NVL (paymentinfo.amtmain, 0), NVL (paymentinfo.amtint, 0)
                 , NVL (paymentinfo.amtduemain, 0)
                 , NVL (paymentinfo.amtdueint, 0), NVL (trchinfo.trchamt, 0)
                 , NVL (endinfo.rest, 0), NVL (endinfo.interestrest, 0)
                 , NVL (endinfo.duerest, 0)
                 , NVL (endinfo.dueinterestrest, 0), montrunc);
   END;

   PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE)
   IS
      CURSOR c_crd_info
      IS
         SELECT d.ID districtid, d.NAME district, v.ID villageid
              , v.NAME village, t.ID typeid, t.typedesc, m.ID purposeid
              , m.NAME purpose, f.ID branchid, f.NAME branch
              , p.numberofcredit crdnum, p.boorowerid, i.NAME boorowername
           FROM cm_business_plan b
              , agro_region d
              , agro_village v
              , cm_bp_types t
              , agro_kredit_purpose m
              , sb_filial f
              , cm_portfolio p
              , cm_boorowerinfo i
          WHERE v.depend_id = d.ID
            AND b.villageid = v.ID
            AND b.TYPE = t.ID
            AND b.akpurpose = m.ID
            AND b.creditid = p.ID
            AND p.branchid = f.ID
            AND p.ID = i.creditid
            AND p.ID = p_id;

      CURSOR c_min_date
      IS
         SELECT MIN (tranchedate) trdate
           FROM cm_tranches
          WHERE creditid = p_id;

      CURSOR c_max_date
      IS
         SELECT MAX (paydate) paydate
           FROM cm_payments
          WHERE creditid = p_id;

      CURSOR c_histinfo
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history
          WHERE creditid = p_id AND hdate = p_edate;

      CURSOR c_amount
      IS
         SELECT SUM (trancheamount) amt
           FROM cm_tranches
          WHERE creditid = p_id AND tranchedate < p_edate;

      CURSOR c_payinfo_month
      IS
         SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN p_bdate AND p_edate;

      CURSOR c_payinfo
      IS
         SELECT SUM (payedamt) payedamt, SUM (payedintamt) payedintamt
              , SUM (payeddueamt) payeddueamt
              , SUM (payeddueintamt) payeddueintamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate < p_edate;

      CURSOR c_payplane
      IS
         SELECT SUM (principal) principal, SUM (interest) interest
           FROM cm_payment_schedule
          WHERE creditid = p_id AND paymentdate < p_edate;

      crdinfo         c_crd_info%ROWTYPE;
      histinfo        c_histinfo%ROWTYPE;
      overcount       INTEGER;
      min_date        c_min_date%ROWTYPE;
      max_date        c_max_date%ROWTYPE;
      amounti         c_amount%ROWTYPE;
      payplaneinfo    c_payplane%ROWTYPE;
      payinfo         c_payinfo%ROWTYPE;
      payinfo_month   c_payinfo_month%ROWTYPE;
   BEGIN
      OPEN c_crd_info;
      FETCH c_crd_info INTO crdinfo;
      CLOSE c_crd_info;
      OPEN c_histinfo;
      FETCH c_histinfo INTO histinfo;
      CLOSE c_histinfo;

      IF (    (histinfo.rest = 0)
          AND (histinfo.interestrest = 0)
          AND (histinfo.duerest = 0)
          AND (histinfo.dueinterestrest = 0)
         )
      THEN
         overcount := 0;
      ELSE
         overcount := 1;
      END IF;

      OPEN c_min_date;
      FETCH c_min_date INTO min_date;
      CLOSE c_min_date;
      OPEN c_max_date;
      FETCH c_max_date INTO max_date;
      CLOSE c_max_date;
      OPEN c_amount;
      FETCH c_amount INTO amounti;
      CLOSE c_amount;
      OPEN c_payplane;
      FETCH c_payplane INTO payplaneinfo;
      CLOSE c_payplane;
      OPEN c_payinfo;
      FETCH c_payinfo INTO payinfo;
      CLOSE c_payinfo;
      OPEN c_payinfo_month;
      FETCH c_payinfo_month INTO payinfo_month;
      CLOSE c_payinfo_month;

      /*INSERT INTO cm_report_f1
           VALUES (p_id, NVL (crdinfo.boorowerid, 0)
                 , NVL (crdinfo.crdnum, '')
                 , NVL (crdinfo.boorowername, '')
                 , NVL (crdinfo.branchid, 0)
                 , NVL (crdinfo.branch, '')
                 , NVL (crdinfo.districtid, 0)
                 , NVL (crdinfo.district, '')
                 , NVL (crdinfo.villageid, 0)
                 , NVL (crdinfo.village, '')
                 , NVL (crdinfo.purposeid, 0)
                 , NVL (crdinfo.purpose, '')
                 , NVL (crdinfo.typeid, 0)
                 , NVL (crdinfo.typedesc, ''), 1
                 , overcount
                 , NVL (min_date.trdate, SYSDATE)
                 , NVL (max_date.paydate, SYSDATE)
                 , NVL (amounti.amt, 0)
                 , NVL (payplaneinfo.interest, 0)
                 , NVL (payplaneinfo.principal, 0)
                 , NVL (payplaneinfo.interest, 0)
                 , NVL (payinfo.payedamt, 0)
                  +NVL (payinfo.payeddueamt, 0)
                 , NVL (payinfo.payedintamt, 0) 
                  +NVL (payinfo.payeddueintamt, 0)
                 , NVL (payinfo_month.payedamt, 0)
                 , NVL (payinfo_month.payedintamt, 0)
                 , NVL (histinfo.rest, 0) 
                  +NVL (histinfo.duerest, 0)
                 , NVL (histinfo.interestrest, 0)
                  +NVL (histinfo.dueinterestrest, 0)
                 , NVL (histinfo.duerest, 0)
                 , NVL (histinfo.dueinterestrest, 0),'-','-');*/
  /* EXCEPTION
      WHEN OTHERS
      THEN
         raise_application_error (-20003, p_id);*/
   END;
   
   
   function Get_CreditDateRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer )
   return number
   is
   result number;
   CurrencyOstat number;
   begin
     
     select rest into result
     from cm_history
     where creditid = p_id
     and hdate = (select max(hdate) from cm_history where hdate<=p_dat);
     
     if p_ek=1 then
        select ostat into CurrencyOstat
        from sb_operkurs
        where val_kod = (select currency from cm_portfolio
        where id = p_id)
        and dat =p_dat ;
        Result := Result*CurrencyOstat;
     end if;
     
     return result;
   end;

   function Get_CreditDateInteRestRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer )
   return number
   is
   result number;
   CurrencyOstat number;
   begin
     
     select Interestrest into result
     from cm_history
     where creditid = p_id
     and hdate = (select max(hdate) from cm_history where hdate<=p_dat);
     
     if p_ek=1 then
        select ostat into CurrencyOstat
        from sb_operkurs
        where val_kod = (select currency from cm_portfolio
        where id = p_id)
        and dat =p_dat ;
        Result := Result*CurrencyOstat;
     end if;
     
     return result;
   end;

    function Get_CreditDateDueRest(p_id in integer,
                               p_dat in date,
                               p_ek in integer)
   return number
   is
   result number;
   CurrencyOstat number;
   begin
     
     select Duerest into result
     from cm_history
     where creditid = p_id
     and hdate = (select max(hdate) from cm_history where hdate<=p_dat);
     
     if p_ek=1 then
        select ostat into CurrencyOstat
        from sb_operkurs
        where val_kod = (select currency from cm_portfolio
        where id = p_id)
        and dat = p_dat;
        Result := Result*CurrencyOstat;
     end if;
     
     return result;
   end;

      function Get_CreditDateDueInterestRest(p_id in integer,
                               p_dat in date,
                               p_ek in boolean default false)
   return number
   is
   result number;
   CurrencyOstat number;
   begin
     
     select DueInterestrest into result
     from cm_history
     where creditid = p_id
     and hdate = (select max(hdate) from cm_history where hdate<=p_dat);
     
     if p_ek then
        select ostat into CurrencyOstat
        from sb_operkurs
        where val_kod = (select currency from cm_portfolio
        where id = p_id);
        Result := Result*CurrencyOstat;
     end if;
     
     return result;
   end;

   function Get_CurrencyOstat(p_id in integer,p_dat in date)
   return number
   is
   result number;
   begin
     select ostat into result
     from sb_operkurs
     where val_kod = (select currency from cm_portfolio where id=p_id)
     and dat=p_dat;
     return result;
   end;                             
 
 
   function Get_CreditTranches(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number
   is
   Result number;
   
   cursor c_Tr is
   select sum(TRANCHEAMOUNT) as TrAmt,
          sum(TRANCHEAMOUNT*Get_CurrencyOstat(creditid,TRANCHEDATE)) as TrAmtEk
   from cm_tranches where creditid=p_id
   and TRANCHEDATE between p_bdat and p_edat;
   
   Tr c_Tr%rowtype;        
   begin
     
     open c_Tr;
     fetch c_Tr into Tr;
     close c_Tr;
     
     Result := Tr.TrAmt;
     
     if  p_ek=1 then 
         Result:= Tr.TrAmtEk;
     end if;
     Return Result;    
   end;
 
 function Get_CreditMainPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number
   is
   Result number;
   
   cursor c_Pay is
   select sum(PAYEDAMT) as PayAmt,
          sum(PAYEDAMT*Get_CurrencyOstat(creditid,PAYDATE)) as PayAmtEk
   from cm_payments where creditid=p_id
   and PAYDATE between p_bdat and p_edat;
   
   Pay c_Pay%rowtype;        
   begin
     
     open c_Pay;
     fetch c_Pay into Pay;
     close c_pay;
     
     Result := Pay.PayAmt;
     
     if  p_ek =1then 
         Result:= Pay.PayAmtEk;
     end if;
     Return Result;    
   end; 
   
    function Get_CreditIntPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number
   is
   Result number;
   
   cursor c_Pay is
   select sum(PAYEDINTAMT) as PayAmt,
          sum(PAYEDINTAMT*Get_CurrencyOstat(creditid,PAYDATE)) as PayAmtEk
   from cm_payments where creditid=p_id
   and PAYDATE between p_bdat and p_edat;
   
   Pay c_Pay%rowtype;        
   begin
     
     open c_Pay;
     fetch c_Pay into Pay;
     close c_pay;
     
     Result := Pay.PayAmt;
     
     if  p_ek=1 then 
         Result:= Pay.PayAmtEk;
     end if;
     Return Result;    
   end;   
 
    function Get_CreditDuePayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number
   is
   Result number;
   
   cursor c_Pay is
   select sum(PAYEDDUEAMT) as PayAmt,
          sum(PAYEDDUEAMT*Get_CurrencyOstat(creditid,PAYDATE)) as PayAmtEk
   from cm_payments where creditid=p_id
   and PAYDATE between p_bdat and p_edat;
   
   Pay c_Pay%rowtype;        
   begin
     
     open c_Pay;
     fetch c_Pay into Pay;
     close c_pay;
     
     Result := Pay.PayAmt;
     
     if  p_ek=1 then 
         Result:= Pay.PayAmtEk;
     end if;
     Return Result;    
   end;   
    function Get_CreditDueIntPayments(p_id in integer,
                               p_bdat in date,
                               p_edat in Date,
                               p_ek in integer)
   return number
   is
   Result number;
   
   cursor c_Pay is
   select sum(PAYEDDUEINTAMT) as PayAmt,
          sum(PAYEDDUEINTAMT*Get_CurrencyOstat(creditid,PAYDATE)) as PayAmtEk
   from cm_payments where creditid=p_id
   and PAYDATE between p_bdat and p_edat;
   
   Pay c_Pay%rowtype;        
   begin
     
     open c_Pay;
     fetch c_Pay into Pay;
     close c_pay;
     
     Result := Pay.PayAmt;
     
     if  p_ek=1 then 
         Result:= Pay.PayAmtEk;
     end if;
     Return Result;    
   end;   
  
  
  function get_balcn(p_id in integer)
return number is
result number;
begin 
  select bal_cn1 into result 
  from sb_account where id=p_id;
  return result;
end;

END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AK_REPORTS2

-- Start of DDL Script for Package CREDITSMGR.CM_AKF
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_akf
IS
   FUNCTION bpcreditaktarget (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditakpurpose (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditaktargetid (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditdistrict (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditdistrictid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcreditpurposeid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcredittype (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcredittypeid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcreditvillage (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditvillageid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION credit_count (cust_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION businessplan_ak_addedit (
      p_creditid               IN   INTEGER DEFAULT 0,
      p_projectcost            IN   NUMBER,
      p_givencredit            IN   NUMBER,
      p_concessionperiod       IN   INTEGER,
      p_purpose                IN   INTEGER,
      p_source                 IN   VARCHAR2,
      p_type                   IN   INTEGER,
      p_untmeansofproduction   IN   VARCHAR2,
      p_numberofproduction     IN   INTEGER,
      p_untproduction          IN   VARCHAR2,
      p_production             IN   INTEGER,
      p_productivity           IN   INTEGER,
      p_productioncost         IN   NUMBER,
      p_sumprofit              IN   NUMBER,
      p_boughtmaterial         IN   NUMBER,
      p_operationexpense       IN   NUMBER,
      p_taxexpense             IN   NUMBER,
      p_otherexpence           IN   NUMBER,
      p_sumexpense             IN   NUMBER,
      p_villageid              IN   NUMBER,
      p_akpurpose              IN   NUMBER
   )
      RETURN INTEGER;

   FUNCTION maxtranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE;

   FUNCTION mintranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE;

   FUNCTION allcalculatedpercent (p_id IN INTEGER, t_date IN DATE)
      RETURN NUMBER;

   FUNCTION currmonthintrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER;

   FUNCTION currmonthrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER;

   FUNCTION credit_debtcount (cust_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsamount (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsparagraph (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditspaypercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsincpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsprotocol (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpunitproduct (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpunitmeansproduction (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpnumberofproduction (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproduction (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproductivity (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproductioncost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpsumprofit (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpoperationexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpotherexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpsumexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bptaxexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpboughtmaterial (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION lastpaymentdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION districtcredittypecount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN INTEGER;

   FUNCTION districtcreditamountyear (districtid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtcredittypeamountyear (
      districtid   IN   INTEGER,
      typeid       IN   INTEGER,
      YEAR         IN   INTEGER
   )
      RETURN NUMBER;

   FUNCTION districtcreditcount (districtid IN INTEGER)
      RETURN INTEGER;

   FUNCTION districtcreditamount (districtid IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtcredittypeamount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN NUMBER;

   FUNCTION credittypecreditcount (typeid INTEGER)
      RETURN INTEGER;

   FUNCTION credittypecreditamount (typeid INTEGER)
      RETURN INTEGER;

   FUNCTION credittypeamountyear (typeid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER;

   FUNCTION creditdebtcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER;

   FUNCTION credit_debtcountbyid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpprojectcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpgivencredit (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtboorowerscount (district_id INTEGER, type_id INTEGER)
      RETURN INTEGER;

   FUNCTION bpgalir (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpistehsaltype (p_id IN INTEGER)
      RETURN VARCHAR;

   FUNCTION bpmanfaat (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bppartofcreditbp (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovtorpaqha (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovevkv (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovevcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovtorpaqcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovothercost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovsumcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiadate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureqatndate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measurepretcost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureprethave (p_id IN INTEGER)
      RETURN INT;

   FUNCTION measureiddiahave (p_id IN INTEGER)
      RETURN INT;

   FUNCTION measurepretgdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureiddiagdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureqatngdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretcost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4princmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4intrmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4summon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4countmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4count (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4intr (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4princ (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4sum (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION payedintdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedmaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedmonintdebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER;

   FUNCTION payedmonmaindebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER;

   FUNCTION mcreditdebtmaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mcreditdebtoverintdebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION mcreditdebtovermaindebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION calculatedpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mcreditdebtintdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION computedpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION overdatepercentdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION overdatemaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtpretenzia (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtpretenziadate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3payafterpretall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterpretmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION paypercentint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION paypercentmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterpretint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtiddiadate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3maindebtqatnamedate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3payafteriddiaall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafteriddiamain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnameall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafteriddiaint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION pretenziahad_num (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION iddiahad_num (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedalldebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishesasmebleg (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishfaizmebleg (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION cemiverilmishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION cemiverilmishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION creditproject (p_id INTEGER)
      RETURN INTEGER;

   FUNCTION overdatemaindebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION overdateintdebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;
  FUNCTION addeditgrantmachines (
      p_creditid    IN   INTEGER,
      p_machineid   IN   INTEGER,
      p_grantyear   IN   INTEGER,
      p_grantdate   IN   DATE,
      p_ammount     IN   NUMBER
   )
      RETURN INTEGER;
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_akf
IS
   FUNCTION credit_count (cust_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_portfolio
       WHERE boorowerid = cust_id;

      RETURN cnt;
   END;

   FUNCTION districtboorowerscount (district_id INTEGER, type_id INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_districtboorowers
       WHERE districtid = district_id AND typeid = type_id;

      RETURN res;
   END;

   FUNCTION creditcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.cm_business_plan b,
             creditsmgr.cm_bp_types t,
             creditsmgr.agro_kredit_purpose kp,
             creditsmgr.agro_village v
       WHERE (b.villageid = v.ID)
         AND (b.akpurpose = kp.ID)
         AND (b.creditid = p.ID)
         AND (t.ID = b.TYPE)
         AND t.ID = typeid_
         AND kp.ID = purposeid_
         AND v.ID = villageid_;

      RETURN res;
   END;

   FUNCTION credit_debtcount (cust_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_portfolio
       WHERE boorowerid = cust_id AND closedate IS NULL;

      RETURN cnt;
   END;

   FUNCTION credit_debtcountbyid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      cnt := 1;

      IF mcreditdebtmaindebt (p_id) = 0 AND mcreditdebtintdebt (p_id) = 0
      THEN
         cnt := 0;
      END IF;

      RETURN cnt;
   END;

   FUNCTION creditdebtcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.cm_business_plan b,
             creditsmgr.cm_bp_types t,
             creditsmgr.agro_kredit_purpose kp,
             creditsmgr.agro_village v
       WHERE (b.villageid = v.ID)
         AND (b.akpurpose = kp.ID)
         AND (b.creditid = p.ID)
         AND (t.ID = b.TYPE)
         AND t.ID = typeid_
         AND kp.ID = purposeid_
         AND v.ID = villageid_
         AND closedate IS NULL;

      RETURN res;
   END;

   FUNCTION intrestmaindbt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := 0;
      RETURN res;
   END;

   FUNCTION computedpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := overdatepercentdebt (p_id);
      RETURN res;
   END;

   FUNCTION mintranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE
   IS
      mindate   DATE;
   BEGIN
      SELECT MIN (tranchedate)
        INTO mindate
        FROM cm_tranches
       WHERE creditid = p_id;

      RETURN mindate;
   END;

   FUNCTION maxtranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE
   IS
      maxdate   DATE;
   BEGIN
      SELECT MAX (paydate)
        INTO maxdate
        FROM cm_payments
       WHERE creditid = p_id AND paydate = t_date;

      RETURN lastpaymentdate (p_id);
   END;

   FUNCTION overdatemaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_interestsum
      IS
         SELECT SUM (payedamt + payeddueamt) AS intamt
           FROM cm_payments
          WHERE creditid = p_id;

      CURSOR c_archostat
      IS
         SELECT SUM (ABS (pok_ostat)) ostatok
           FROM sb_tenostat
          WHERE acc_id = (SELECT loanaccid
                            FROM cm_accounts
                           WHERE creditid = p_id)
             OR acc_id = (SELECT dueloanaccid
                            FROM cm_accounts
                           WHERE creditid = p_id);

      intsum      c_interestsum%ROWTYPE;
      archostat   c_archostat%ROWTYPE;
      debt        NUMBER;
      odemdebt    NUMBER;
      ostdebt     NUMBER;
   BEGIN
      odemdebt := 0;
      ostdebt := 0;
      OPEN c_interestsum;
      FETCH c_interestsum INTO intsum;

      IF intsum.intamt IS NOT NULL
      THEN
         odemdebt := intsum.intamt;
      END IF;

      CLOSE c_interestsum;
      OPEN c_archostat;
      FETCH c_archostat INTO archostat;

      IF archostat.ostatok IS NOT NULL
      THEN
         ostdebt := archostat.ostatok;
      END IF;

      CLOSE c_archostat;
      debt := odemdebt + ostdebt;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdatemaindebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      debt   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO debt
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate <= p_date;

      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdateintdebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      debt   NUMBER;
   BEGIN
      /*SELECT SUM (interest)
        INTO Debt
        FROM Cm_payment_schedule
       WHERE Creditid = P_id AND Paymentdate <= P_date;*/
      debt := computedpercent (p_id) * 1000;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdatepercentdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_interestsum
      IS
         SELECT SUM (payedintamt + payeddueintamt) AS intamt
           FROM cm_payments
          WHERE creditid = p_id;

      CURSOR c_archostat
      IS
         SELECT SUM (ABS (pok_ostat)) ostatok
           FROM sb_tenostat
          WHERE acc_id = (SELECT interestaccid
                            FROM cm_accounts
                           WHERE creditid = p_id)
             OR acc_id = (SELECT dueinterestaccid
                            FROM cm_accounts
                           WHERE creditid = p_id);

      intsum      c_interestsum%ROWTYPE;
      archostat   c_archostat%ROWTYPE;
      debt        NUMBER;
      odemdebt    NUMBER;
      ostdebt     NUMBER;
   BEGIN
      odemdebt := 0;
      ostdebt := 0;
      OPEN c_interestsum;
      FETCH c_interestsum INTO intsum;

      IF intsum.intamt IS NOT NULL
      THEN
         odemdebt := intsum.intamt;
      END IF;

      CLOSE c_interestsum;
      OPEN c_archostat;
      FETCH c_archostat INTO archostat;

      IF archostat.ostatok IS NOT NULL
      THEN
         ostdebt := archostat.ostatok;
      END IF;

      CLOSE c_archostat;
      debt := odemdebt + ostdebt;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedalldebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_maind
      IS
         SELECT SUM (payedamt + payeddueamt + payedintamt + payeddueintamt
                    ) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      maind   c_maind%ROWTYPE;
      debt    NUMBER;
   BEGIN
      OPEN c_maind;
      FETCH c_maind INTO maind;
      debt := maind.pamt;

      IF c_maind%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_maind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_maind
      IS
         SELECT SUM (payedamt + payeddueamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      maind   c_maind%ROWTYPE;
      debt    NUMBER;
   BEGIN
      OPEN c_maind;
      FETCH c_maind INTO maind;
      debt := maind.pamt;

      IF c_maind%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_maind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedintdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_intd
      IS
         SELECT SUM (payedintamt + payeddueintamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      intd   c_intd%ROWTYPE;
      debt   NUMBER;
   BEGIN
      OPEN c_intd;
      FETCH c_intd INTO intd;
      debt := intd.pamt;

      IF c_intd%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_intd;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmonmaindebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER
   IS
      CURSOR c_monmaind
      IS
         SELECT SUM (payedamt + payeddueamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN t_date_b AND t_date_e;

      monmaind   c_monmaind%ROWTYPE;
      debt       NUMBER;
   BEGIN
      OPEN c_monmaind;
      FETCH c_monmaind INTO monmaind;
      debt := monmaind.pamt;

      IF debt IS NULL
      THEN
         debt := 0;
      END IF;

      CLOSE c_monmaind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmonintdebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER
   IS
      CURSOR c_monintd
      IS
         SELECT SUM (payedintamt + payeddueintamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN t_date_b AND t_date_e;

      monintd   c_monintd%ROWTYPE;
      debt      NUMBER;
   BEGIN
      OPEN c_monintd;
      FETCH c_monintd INTO monintd;
      debt := monintd.pamt;

      IF debt IS NULL
      THEN
         debt := 0;
      END IF;

      CLOSE c_monintd;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION paypercentmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := 100 * (payedmaindebt (p_id) / overdatemaindebt (p_id));
      RETURN ROUND (res, 1);
   END;

   FUNCTION paypercentint (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := 100 * (payedintdebt (p_id) / overdatepercentdebt (p_id));
      RETURN ROUND (res, 1);
   END;

   FUNCTION bpcredittypeid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      typeid   NUMBER;
   BEGIN
      SELECT TYPE
        INTO typeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN typeid;
   END;

   FUNCTION bpcredittype (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      tpdesc   VARCHAR2 (32);
   BEGIN
      SELECT typedesc
        INTO tpdesc
        FROM cm_bp_types
       WHERE ID = cm_akf.bpcredittypeid (p_id);

      RETURN tpdesc;
   END;

   FUNCTION bpcreditdistrict (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vdistrictid     NUMBER;
      vdistrictname   VARCHAR2 (128);
   BEGIN
      SELECT NAME
        INTO vdistrictname
        FROM agro_region
       WHERE ID = cm_akf.bpcreditdistrictid (p_id);

      RETURN vdistrictname;
   END;

   FUNCTION bpcreditvillageid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vvillageid   NUMBER;
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN vvillageid;
   END;

   FUNCTION bpcreditpurposeid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vpurposeid   NUMBER;
   BEGIN
      SELECT akpurpose
        INTO vpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN vpurposeid;
   END;

   FUNCTION bpcreditvillage (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vvillageid     NUMBER;
      vvillagename   VARCHAR2 (128);
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT NAME
        INTO vvillagename
        FROM agro_village
       WHERE ID = vvillageid;

      RETURN vvillagename;
   END;

   FUNCTION bpcreditdistrictid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vvillageid    NUMBER;
      vdistrictid   NUMBER;
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT depend_id
        INTO vdistrictid
        FROM agro_village
       WHERE ID = vvillageid;

      RETURN vdistrictid;
   END;

   FUNCTION bpcreditaktarget (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vaktargetid     NUMBER;
      vaktargetname   VARCHAR2 (128);
   BEGIN
      SELECT NAME
        INTO vaktargetname
        FROM agro_kredit_target
       WHERE ID = cm_akf.bpcreditaktargetid (p_id);

      RETURN vaktargetname;
   END;

   FUNCTION bpcreditakpurpose (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vakpurposeid     NUMBER;
      vakpurposename   VARCHAR2 (128);
   BEGIN
      SELECT akpurpose
        INTO vakpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT NAME
        INTO vakpurposename
        FROM agro_kredit_purpose
       WHERE ID = vakpurposeid;

      RETURN vakpurposename;
   END;

   FUNCTION bpcreditaktargetid (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vakpurposeid   NUMBER;
      vaktargetid    NUMBER;
   BEGIN
      SELECT akpurpose
        INTO vakpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT depend_id
        INTO vaktargetid
        FROM agro_kredit_purpose
       WHERE ID = vakpurposeid;

      RETURN vaktargetid;
   END;

   FUNCTION allcalculatedpercent (p_id IN INTEGER, t_date IN DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (i.interest)
        INTO res
        FROM cm_interests i
       WHERE i.creditid = p_id AND i.hdate = t_date;

      RETURN res;
   END;

   FUNCTION calculatedpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (i.interest)
        INTO res
        FROM cm_active_credits a, cm_interests i
       WHERE (a.ID = i.creditid) AND creditid = p_id;

      RETURN res;
   END;

   FUNCTION creditsamount (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT creditlineamount
        INTO res
        FROM cm_portfolio
       WHERE ID = p_id;

      RETURN res;
   END;

   FUNCTION creditsamount2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION creditsamount1 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_tranchesum
      IS
         SELECT SUM (trancheamount) amt
           FROM cm_tranches
          WHERE creditid = p_id;

      trsum   c_tranchesum%ROWTYPE;
      res     NUMBER;
   BEGIN
      /*Res :=   Mcreditdebtmaindebt (P_id)
             + Payedmaindebt (P_id);*/
      OPEN c_tranchesum;
      FETCH c_tranchesum INTO trsum;

      IF c_tranchesum%FOUND
      THEN
         res := trsum.amt;
      ELSE
         res := 0;
      END IF;

      CLOSE c_tranchesum;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION creditsprotocol (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      /*SELECT (SUBSTR (numberofcredit, 1,   INSTR (numberofcredit, '/')
                                         - 1)
             )
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;*/
      RETURN 3; --(res);
   END;

   FUNCTION creditsparagraph (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      /*SELECT SUBSTR (
                numberofcredit,
                  INSTR (numberofcredit, '/')
                + 1,
                LENGTH (numberofcredit)
             )
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;
*/
      RETURN 3;
   END;

   FUNCTION creditsincpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
/*  SELECT -7
    INTO res
    FROM dual;
--   WHERE creditid = p_id;*/
      SELECT annualyinterestrate
        INTO res
        FROM cm_portfolio
       WHERE ID = p_id;

      RETURN res;
   END;

   FUNCTION creditspaypercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT annualyoverduerate
        INTO res
        FROM cm_portfolio
       WHERE ID = p_id;

      RETURN res;
   END;

   FUNCTION currmonthrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER
   IS
      monmaindebt   NUMBER;
   BEGIN
      SELECT SUM (rest)
        INTO monmaindebt
        FROM cm_history
       WHERE hdate BETWEEN t_datebegin AND t_dateend AND creditid = p_id;

      RETURN monmaindebt;
   END;

   FUNCTION currmonthintrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER
   IS
      monintrdebt   NUMBER;
   BEGIN
      SELECT SUM (interestrest)
        INTO monintrdebt
        FROM cm_history
       WHERE hdate BETWEEN t_datebegin AND t_dateend AND creditid = p_id;

      RETURN monintrdebt;
   END;

   FUNCTION addeditgrantmachines (
      p_creditid    IN   INTEGER,
      p_machineid   IN   INTEGER,
      p_grantyear   IN   INTEGER,
      p_grantdate   IN   DATE,
      p_ammount     IN   NUMBER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER := p_creditid;
   BEGIN
      UPDATE cm_ak_grants
         SET machineid = p_machineid,
             grantyear = p_grantyear,
             grantdate = p_grantdate,
             machineammount = p_ammount
       WHERE creditid = p_creditid;

      IF SQL%ROWCOUNT = 0
      THEN
         INSERT INTO cm_ak_grants
                     (creditid, machineid, grantyear, grantdate,
                      machineammount
                     )
              VALUES (RESULT, p_machineid, p_grantyear, p_grantdate,
                      p_ammount
                     )
           RETURNING creditid
                INTO RESULT;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION businessplan_ak_addedit (
      p_creditid               IN   INTEGER DEFAULT 0,
      p_projectcost            IN   NUMBER,
      p_givencredit            IN   NUMBER,
      p_concessionperiod       IN   INTEGER,
      p_purpose                IN   INTEGER,
      p_source                 IN   VARCHAR2,
      p_type                   IN   INTEGER,
      p_untmeansofproduction   IN   VARCHAR2,
      p_numberofproduction     IN   INTEGER,
      p_untproduction          IN   VARCHAR2,
      p_production             IN   INTEGER,
      p_productivity           IN   INTEGER,
      p_productioncost         IN   NUMBER,
      p_sumprofit              IN   NUMBER,
      p_boughtmaterial         IN   NUMBER,
      p_operationexpense       IN   NUMBER,
      p_taxexpense             IN   NUMBER,
      p_otherexpence           IN   NUMBER,
      p_sumexpense             IN   NUMBER,
      p_villageid              IN   NUMBER,
      p_akpurpose              IN   NUMBER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER := p_creditid;
   BEGIN
      UPDATE cm_business_plan
         SET projectcost = p_projectcost,
             givencredit = p_givencredit,
             concessionperiod = p_concessionperiod,
             purpose = p_purpose,
             SOURCE = p_source,
             TYPE = p_type,
             untmeansofproduction = p_untmeansofproduction,
             numberofproduction = p_numberofproduction,
             untproduction = p_untproduction,
             production = p_production,
             productivity = p_productivity,
             productioncost = p_productioncost,
             sumprofit = p_sumprofit,
             boughtmaterial = p_boughtmaterial,
             operationexpense = p_operationexpense,
             taxexpense = p_taxexpense,
             otherexpence = p_otherexpence,
             sumexpense = p_sumexpense,
             villageid = p_villageid,
             akpurpose = p_akpurpose
       WHERE creditid = RESULT;

      IF SQL%ROWCOUNT = 0
      THEN
         INSERT INTO cm_business_plan
                     (creditid, projectcost, givencredit,
                      concessionperiod, purpose, SOURCE, TYPE,
                      untmeansofproduction, numberofproduction,
                      untproduction, production, productivity,
                      productioncost, sumprofit, boughtmaterial,
                      operationexpense, taxexpense, otherexpence,
                      sumexpense, villageid, akpurpose
                     )
              VALUES (RESULT, p_projectcost, p_givencredit,
                      p_concessionperiod, p_purpose, p_source, p_type,
                      p_untmeansofproduction, p_numberofproduction,
                      p_untproduction, p_production, p_productivity,
                      p_productioncost, p_sumprofit, p_boughtmaterial,
                      p_operationexpense, p_taxexpense, p_otherexpence,
                      p_sumexpense, p_villageid, p_akpurpose
                     )
           RETURNING creditid
                INTO RESULT;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION bpprojectcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT projectcost
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpgivencredit (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpunitmeansproduction (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (100);
   BEGIN
      SELECT untmeansofproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpunitproduct (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (100);
   BEGIN
      SELECT untproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpnumberofproduction (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT numberofproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpproduction (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT production
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpproductivity (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT productivity
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpproductioncost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT productioncost
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpsumprofit (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT sumprofit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpboughtmaterial (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT boughtmaterial
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpoperationexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT operationexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bptaxexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT taxexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpotherexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT otherexpence
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpsumexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT sumexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpistehsaltype (p_id IN INTEGER)
      RETURN VARCHAR
   IS
      res   VARCHAR (100);
   BEGIN
      res := 'ясас';
      RETURN res;
   END;

   FUNCTION bpgalir (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := bpsumprofit (p_id);
      RETURN res;
   END;

   FUNCTION bpmanfaat (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := bpsumprofit (p_id) - bpsumexpense (p_id);
      RETURN res;
   END;

   FUNCTION bppartofcreditbp (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION lastpaymentdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (paymentdate) AS lastpaydate
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION districtcredittypecount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid
         AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION districtcreditcount (districtid IN INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid;

      RETURN res;
   END;

   FUNCTION districtcredittypeamount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid
         AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION districtcreditamount (districtid IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid;

      RETURN res;
   END;

   FUNCTION districtcreditamountyear (districtid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid
         AND p.dateofconclusion BETWEEN '01-Jan-' || TO_CHAR (YEAR)
                                    AND '31-Dec-' || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION districtcredittypeamountyear (
      districtid   IN   INTEGER,
      typeid       IN   INTEGER,
      YEAR         IN   INTEGER
   )
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND v.depend_id = districtid
         AND b.TYPE = typeid
         AND p.dateofconclusion BETWEEN '01-Jan-' || TO_CHAR (YEAR)
                                    AND '31-Dec-' || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION credittypecreditcount (typeid INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID) AND (b.villageid = v.ID) AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION credittypecreditamount (typeid INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.ID) AND (b.villageid = v.ID) AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION credittypeamountyear (typeid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.ID)
         AND (b.villageid = v.ID)
         AND b.TYPE = typeid
         AND p.dateofconclusion BETWEEN '01-Jan-' || TO_CHAR (YEAR)
                                    AND '31-Dec-' || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION getgirovtorpaqha (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepricetorpaqha
        INTO res
        FROM cm_guarantee
       WHERE creditid = p_id;

      RETURN ROUND (res, 1);
   END;

   FUNCTION getgirovtorpaqcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepricetorpaq
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovevkv (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepriceevkv
        INTO res
        FROM cm_guarantee
       WHERE creditid = p_id;

      RETURN ROUND (res, 1);
   END;

   FUNCTION getgirovevcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepriceev
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovothercost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgeprice
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovsumcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=
            getgirovothercost (p_id)
          + getgirovtorpaqcost (p_id)
          + getgirovevcost (p_id);
      RETURN res;
   END;

   FUNCTION measurepretdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measurepretgdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiadate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiagdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatndate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatngdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measurepretcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measpretcost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_pretenzia
          WHERE creditid = pid AND grantdate = measurepretdate (pid);

      res   NUMBER;
      obj   c_measpretcost%ROWTYPE;
   BEGIN
      OPEN c_measpretcost (p_id);
      FETCH c_measpretcost INTO obj;
      res := obj.activeind1;

      IF c_measpretcost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measpretcost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measurepretcost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measpretcost2 (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_pretenzia
          WHERE creditid = pid AND grantdate = measurepretdate (pid);

      res   NUMBER;
      obj   c_measpretcost2%ROWTYPE;
   BEGIN
      OPEN c_measpretcost2 (p_id);
      FETCH c_measpretcost2 INTO obj;
      res := obj.activeind2;

      IF c_measpretcost2%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measpretcost2;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measurepretcost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := measurepretcost2 (p_id) - measurepretcost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION measureprethave (p_id IN INTEGER)
      RETURN INT
   IS
      res   INT;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiacost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_iddia
          WHERE creditid = pid AND grantdate = measureiddiadate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind1;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureiddiacost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_iddia
          WHERE creditid = pid AND grantdate = measureiddiadate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind2;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureiddiacost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := measureiddiacost2 (p_id) - measureiddiacost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION measureiddiahave (p_id IN INTEGER)
      RETURN INT
   IS
      res   INT;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatncost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_qatname
          WHERE creditid = pid AND grantdate = measureqatndate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind1;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureqatncost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_qatname
          WHERE creditid = pid AND grantdate = measureqatndate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind2;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureqatncost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := measureqatncost2 (p_id) - measureqatncost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION mustreturn4princmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4princ (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mustreturn4intrmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (interest)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4intr (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (interest)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mustreturn4summon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := mustreturn4intrmon (p_id, mon) + mustreturn4princmon (p_id, mon);
      RETURN res;
   END;

   FUNCTION mustreturn4sum (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := mustreturn4intr (p_id) + mustreturn4princ (p_id);
      RETURN res;
   END;

   FUNCTION mustreturn4countmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT COUNT (creditid)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4count (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT COUNT (creditid)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mcreditdebtmaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_accidl
      IS
         SELECT loanaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_accidd
      IS
         SELECT dueloanaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_ostat (accid IN INTEGER)
      IS
         SELECT ABS (pok_ostat) ostat
           FROM sb_tenostat
          WHERE acc_id = accid;

      accidl   c_accidl%ROWTYPE;
      accidd   c_accidd%ROWTYPE;
      ostatl   c_ostat%ROWTYPE;
      ostatd   c_ostat%ROWTYPE;
      debtl    NUMBER;
      debtd    NUMBER;
      res      NUMBER;
   BEGIN
      debtl := 0;
      debtd := 0;
      OPEN c_accidl;
      FETCH c_accidl INTO accidl;
      CLOSE c_accidl;
      OPEN c_accidd;
      FETCH c_accidd INTO accidd;
      CLOSE c_accidd;
      OPEN c_ostat (accidl.acid);
      FETCH c_ostat INTO ostatl;

      IF ostatl.ostat IS NOT NULL
      THEN
         debtl := ostatl.ostat;
      END IF;

      CLOSE c_ostat;
      OPEN c_ostat (accidd.acid);
      FETCH c_ostat INTO ostatd;

      IF ostatd.ostat IS NOT NULL
      THEN
         debtd := ostatd.ostat;
      END IF;

      CLOSE c_ostat;
      res := debtl + debtd;
      --creditsamount(p_id)-PayedMainDebt(p_id);
      res := 1000 * (creditsamount (p_id) - payedmaindebt (p_id));
      RETURN ROUND (res / 1000);
   END;

   FUNCTION mcreditdebtintdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_accidl
      IS
         SELECT interestaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_accidd
      IS
         SELECT dueinterestaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_ostat (accid IN INTEGER)
      IS
         SELECT ABS (pok_ostat) ostat
           FROM sb_tenostat
          WHERE acc_id = accid;

      accidl   c_accidl%ROWTYPE;
      accidd   c_accidd%ROWTYPE;
      ostatl   c_ostat%ROWTYPE;
      ostatd   c_ostat%ROWTYPE;
      debtl    NUMBER;
      debtd    NUMBER;
      res      NUMBER;
   BEGIN
      debtl := 0;
      debtd := 0;
      OPEN c_accidl;
      FETCH c_accidl INTO accidl;
      CLOSE c_accidl;
      OPEN c_accidd;
      FETCH c_accidd INTO accidd;
      CLOSE c_accidd;
      OPEN c_ostat (accidl.acid);
      FETCH c_ostat INTO ostatl;

      IF ostatl.ostat IS NOT NULL
      THEN
         debtl := ostatl.ostat;
      END IF;

      CLOSE c_ostat;
      OPEN c_ostat (accidd.acid);
      FETCH c_ostat INTO ostatd;

      IF ostatd.ostat IS NOT NULL
      THEN
         debtd := ostatd.ostat;
      END IF;

      CLOSE c_ostat;
      res := debtl + debtd;
      --creditsamount(p_id)-PayedMainDebt(p_id);
      --Res := CreditsAmount(p_id)-payedmaindebt(p_id);
      RETURN ROUND (res / 1000);
   /*
   Res :=   Computedpercent (P_id)
          - Payedintdebt (P_id);*/
   END;

   FUNCTION mcreditdebtovermaindebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := overdatemaindebt (p_id) - payedmaindebt (p_id);
      RETURN res;
   END;

   FUNCTION mcreditdebtoverintdebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=                                     /*Overdatepercentdebt (P_id)
                                               - Payedintdebt (P_id);*/
                                                    mcreditdebtintdebt (p_id);
      RETURN res;
   END;

   FUNCTION f3maindebtpretenzia (p_id INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_pret
      IS
         SELECT activeind2 ai1
           FROM cm_akf_measures_pretenzia
          WHERE creditid = p_id;

      pret   c_pret%ROWTYPE;
      res    NUMBER;
   BEGIN
      OPEN c_pret;
      res := 0;
      FETCH c_pret INTO pret;

      IF pret.ai1 IS NOT NULL
      THEN
         res := pret.ai1;
      END IF;

      CLOSE c_pret;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3maindebtpretenziadate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3maindebtiddiadate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3maindebtqatnamedate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3payafterpretall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payedintamt + payeddueamt + payeddueintamt)
                                                                    AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiaall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payedintamt + payeddueamt + payeddueintamt)
                                                                    AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnameall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payedintamt + payeddueamt + payeddueintamt)
                                                                    AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterpretmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiamain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedamt + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterpretint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedintamt + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiaint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedintamt + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (payedintamt + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION pretenziahad (p_id IN INTEGER)
      RETURN BOOLEAN
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN cnt > 0;
   END;

   FUNCTION iddiahad (p_id IN INTEGER)
      RETURN BOOLEAN
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN cnt > 0;
   END;

   FUNCTION pretenziahad_num (p_id IN INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF pretenziahad (p_id)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION iddiahad_num (p_id IN INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF iddiahad (p_id)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF (mcreditdebtmaindebt (p_id) = 0) AND (mcreditdebtintdebt (p_id) = 0)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishesasmebleg (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF (tamodenmishsay (p_id) <> 0)
      THEN
         RETURN payedmaindebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishfaizmebleg (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF (tamodenmishsay (p_id) <> 0)
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF     (payedmaindebt (p_id) > 0)
         AND (payedmaindebt (p_id) < creditsamount (p_id))
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF qismenodenmishsay (p_id) > 0
      THEN
         RETURN payedmaindebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF qismenodenmishsay (p_id) > 0
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenilmemishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN kreditqaligsay (p_id) - qismenodenmishsay (p_id);
   END;

   FUNCTION tamodenilmemishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF tamodenilmemishsay (p_id) <> 0
      THEN
         RETURN creditsamount (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenilmemishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF tamodenilmemishsay (p_id) <> 0
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION kreditqaligsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF mcreditdebtmaindebt (p_id) <> 0
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION kreditqaligesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF kreditqaligsay (p_id) = 0
      THEN
         RETURN 0;
      ELSE
         RETURN mcreditdebtmaindebt (p_id);
      END IF;
   END;

   FUNCTION kreditqaligfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF kreditqaligsay (p_id) = 0
      THEN
         RETURN 0;
      ELSE
         RETURN mcreditdebtintdebt (p_id);
      END IF;
   END;

   FUNCTION cemiverilmishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN ROUND (creditsamount (p_id) / 1000, 1);
   END;

   FUNCTION cemiverilmishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN ROUND (computedpercent (p_id) / 1000, 1);
   END;

   FUNCTION creditproject (p_id INTEGER)
      RETURN INTEGER
   IS
      CURSOR c_projid
      IS
         SELECT c.sid# proj_id
           FROM creditsmgr.cm_portfolio b,
                creditsmgr.cm_accounts a,
                sb_account c
          WHERE (a.creditid = b.ID)
            AND (c.ID = a.loanaccid)
            AND (b.ID = p_id);

      projid      c_projid%ROWTYPE;
      projectid   INTEGER;
   BEGIN
      OPEN c_projid;
      FETCH c_projid INTO projid;

      IF c_projid%FOUND
      THEN
         projectid := projid.proj_id;
      ELSE
         projectid := 0;
      END IF;

      CLOSE c_projid;
      RETURN projectid;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AKF

-- Start of DDL Script for Package CREDITSMGR.CM_AKF_1
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_akf_1
IS
   FUNCTION bpcreditaktarget (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditakpurpose (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditaktargetid (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditdistrict (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditdistrictid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcreditpurposeid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcredittype (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcredittypeid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpcreditvillage (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpcreditvillageid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION credit_count (cust_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION businessplan_ak_addedit (
      p_creditid               IN   INTEGER DEFAULT 0,
      p_projectcost            IN   NUMBER,
      p_givencredit            IN   NUMBER,
      p_concessionperiod       IN   INTEGER,
      p_purpose                IN   INTEGER,
      p_source                 IN   VARCHAR2,
      p_type                   IN   INTEGER,
      p_untmeansofproduction   IN   VARCHAR2,
      p_numberofproduction     IN   INTEGER,
      p_untproduction          IN   VARCHAR2,
      p_production             IN   INTEGER,
      p_productivity           IN   INTEGER,
      p_productioncost         IN   NUMBER,
      p_sumprofit              IN   NUMBER,
      p_boughtmaterial         IN   NUMBER,
      p_operationexpense       IN   NUMBER,
      p_taxexpense             IN   NUMBER,
      p_otherexpence           IN   NUMBER,
      p_sumexpense             IN   NUMBER,
      p_villageid              IN   NUMBER,
      p_akpurpose              IN   NUMBER
   )
      RETURN INTEGER;

   FUNCTION maxtranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE;

   FUNCTION mintranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE;

   FUNCTION currmonthintrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER;

   FUNCTION currmonthrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER;

   FUNCTION credit_debtcount (cust_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsamount (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsparagraph (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditspaypercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsincpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditsprotocol (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpunitproduct (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpunitmeansproduction (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION bpnumberofproduction (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproduction (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproductivity (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpproductioncost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpsumprofit (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpoperationexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpotherexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpsumexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bptaxexpense (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpboughtmaterial (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION lastpaymentdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION districtcredittypecount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN INTEGER;

   FUNCTION districtcreditamountyear (districtid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtcredittypeamountyear (
      districtid   IN   INTEGER,
      typeid       IN   INTEGER,
      YEAR         IN   INTEGER
   )
      RETURN NUMBER;

   FUNCTION districtcreditcount (districtid IN INTEGER)
      RETURN INTEGER;

   FUNCTION districtcreditamount (districtid IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtcredittypeamount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN NUMBER;

   FUNCTION credittypecreditcount (typeid INTEGER)
      RETURN INTEGER;

   FUNCTION credittypecreditamount (typeid INTEGER)
      RETURN INTEGER;

   FUNCTION credittypeamountyear (typeid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER;

   FUNCTION creditcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER;

   FUNCTION creditdebtcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER;

   FUNCTION credit_debtcountbyid (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpprojectcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpgivencredit (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION districtboorowerscount (district_id INTEGER, type_id INTEGER)
      RETURN INTEGER;

   FUNCTION bpgalir (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bpistehsaltype (p_id IN INTEGER)
      RETURN VARCHAR;

   FUNCTION bpmanfaat (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION bppartofcreditbp (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovtorpaqha (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovevkv (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovevcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovtorpaqcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovothercost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION getgirovsumcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiadate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureqatndate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretcost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measurepretcost2 (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureprethave (p_id IN INTEGER)
      RETURN INT;

   FUNCTION measureiddiahave (p_id IN INTEGER)
      RETURN INT;

   FUNCTION measurepretgdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureiddiagdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measureqatngdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION measurepretcost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureiddiacost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION measureqatncost2_cost (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4princmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4intrmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4summon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4countmon (p_id INTEGER, mon DATE)
      RETURN NUMBER;

   FUNCTION mustreturn4count (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4intr (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4princ (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION mustreturn4sum (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION payedintdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedmaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedmonintdebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER;

   FUNCTION payedmonmaindebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER;

   FUNCTION mcreditdebtmaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mcreditdebtoverintdebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION mcreditdebtovermaindebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION calculatedpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION mcreditdebtintdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION computedpercent (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION overdatepercentdebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION overdatemaindebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtpretenzia (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtpretenziadate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3payafterpretall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterpretmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION paypercentint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION paypercentmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterpretint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3maindebtiddiadate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3maindebtqatnamedate (p_id INTEGER)
      RETURN DATE;

   FUNCTION f3payafteriddiaall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafteriddiamain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnameall (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnmain (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafteriddiaint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION f3payafterqatnint (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION pretenziahad_num (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION iddiahad_num (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION payedalldebt (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishesasmebleg (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishfaizmebleg (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION qismenodenmishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenilmemishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION kreditqaligfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION tamodenmishsay (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION cemiverilmishesas (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION cemiverilmishfaiz (p_id INTEGER)
      RETURN NUMBER;

   FUNCTION creditproject (p_id INTEGER)
      RETURN INTEGER;

   FUNCTION overdatemaindebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION overdateintdebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER;
  FUNCTION allcalculatedpercent (p_id IN INTEGER)
      RETURN NUMBER;
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_akf_1
IS
   FUNCTION credit_count (cust_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_portfolio
       WHERE boorowerid = cust_id;

      RETURN cnt;
   END;

   FUNCTION districtboorowerscount (district_id INTEGER, type_id INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_districtboorowers
       WHERE districtid = district_id AND typeid = type_id;

      RETURN res;
   END;

   FUNCTION creditcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.cm_business_plan b,
             creditsmgr.cm_bp_types t,
             creditsmgr.agro_kredit_purpose kp,
             creditsmgr.agro_village v
       WHERE (b.villageid = v.id)
         AND (b.akpurpose = kp.id)
         AND (b.creditid = p.id)
         AND (t.id = b.TYPE)
         AND t.id = typeid_
         AND kp.id = purposeid_
         AND v.id = villageid_;

      RETURN res;
   END;

   FUNCTION credit_debtcount (cust_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_portfolio
       WHERE boorowerid = cust_id AND closedate IS NULL;

      RETURN cnt;
   END;

   FUNCTION credit_debtcountbyid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      cnt   NUMBER;
   BEGIN
      cnt := 1;

      IF  mcreditdebtmaindebt (p_id) = 0 AND mcreditdebtintdebt (p_id) = 0
      THEN
         cnt := 0;
      END IF;

      RETURN cnt;
   END;

   FUNCTION creditdebtcountbytype (
      typeid_      INTEGER,
      purposeid_   INTEGER,
      villageid_   INTEGER
   )
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.cm_business_plan b,
             creditsmgr.cm_bp_types t,
             creditsmgr.agro_kredit_purpose kp,
             creditsmgr.agro_village v
       WHERE (b.villageid = v.id)
         AND (b.akpurpose = kp.id)
         AND (b.creditid = p.id)
         AND (t.id = b.TYPE)
         AND t.id = typeid_
         AND kp.id = purposeid_
         AND v.id = villageid_
         AND closedate IS NULL;

      RETURN res;
   END;

   FUNCTION intrestmaindbt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := 0;
      RETURN res;
   END;

   FUNCTION computedpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := overdatepercentdebt (p_id);
      RETURN res;
   END;

   FUNCTION mintranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE
   IS
      mindate   DATE;
   BEGIN
      SELECT MIN (tranchedate)
        INTO mindate
        FROM cm_tranches
       WHERE creditid = p_id;

      RETURN mindate;
   END;

   FUNCTION maxtranchedate (p_id IN INTEGER, t_date IN DATE)
      RETURN DATE
   IS
      maxdate   DATE;
   BEGIN
      SELECT MAX (paydate)
        INTO maxdate
        FROM cm_payments
       WHERE creditid = p_id AND paydate = t_date;

      RETURN lastpaymentdate (p_id);
   END;

   FUNCTION overdatemaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_interestsum
      IS
         SELECT SUM (  payedamt
                     + payeddueamt) AS intamt
           FROM cm_payments
          WHERE creditid = p_id;

      CURSOR c_archostat
      IS
         SELECT SUM (ABS (pok_ostat)) ostatok
           FROM sb_tenostat
          WHERE acc_id =
                    (SELECT loanaccid
                       FROM cm_accounts
                      WHERE creditid = p_id)
             OR acc_id = (SELECT dueloanaccid
                            FROM cm_accounts
                           WHERE creditid = p_id);

      intsum      c_interestsum%ROWTYPE;
      archostat   c_archostat%ROWTYPE;
      debt        NUMBER;
      odemdebt    NUMBER;
      ostdebt     NUMBER;
   BEGIN
      odemdebt := 0;
      ostdebt := 0;
      OPEN c_interestsum;
      FETCH c_interestsum INTO intsum;

      IF intsum.intamt IS NOT NULL
      THEN
         odemdebt := intsum.intamt;
      END IF;

      CLOSE c_interestsum;
      OPEN c_archostat;
      FETCH c_archostat INTO archostat;

      IF archostat.ostatok IS NOT NULL
      THEN
         ostdebt := archostat.ostatok;
      END IF;

      CLOSE c_archostat;
      debt :=   odemdebt
              + ostdebt;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdatemaindebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      debt   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO debt
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate <= p_date;

      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdateintdebt1 (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      debt   NUMBER;
   BEGIN
      /*SELECT SUM (interest)
        INTO Debt
        FROM Cm_payment_schedule
       WHERE Creditid = P_id AND Paymentdate <= P_date;*/
      debt := computedpercent (p_id) * 1000;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION overdatepercentdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_interestsum
      IS
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS intamt
           FROM cm_payments
          WHERE creditid = p_id;

      CURSOR c_archostat
      IS
         SELECT SUM (ABS (pok_ostat)) ostatok
           FROM sb_tenostat
          WHERE acc_id = (SELECT interestaccid
                            FROM cm_accounts
                           WHERE creditid = p_id)
             OR acc_id = (SELECT dueinterestaccid
                            FROM cm_accounts
                           WHERE creditid = p_id);

      intsum      c_interestsum%ROWTYPE;
      archostat   c_archostat%ROWTYPE;
      debt        NUMBER;
      odemdebt    NUMBER;
      ostdebt     NUMBER;
   BEGIN
      odemdebt := 0;
      ostdebt := 0;
      OPEN c_interestsum;
      FETCH c_interestsum INTO intsum;

      IF intsum.intamt IS NOT NULL
      THEN
         odemdebt := intsum.intamt;
      END IF;

      CLOSE c_interestsum;
      OPEN c_archostat;
      FETCH c_archostat INTO archostat;

      IF archostat.ostatok IS NOT NULL
      THEN
         ostdebt := archostat.ostatok;
      END IF;

      CLOSE c_archostat;
      debt :=   odemdebt
              + ostdebt;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedalldebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_maind
      IS
         SELECT SUM (  payedamt
                     + payeddueamt
                     + payedintamt
                     + payeddueintamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      maind   c_maind%ROWTYPE;
      debt    NUMBER;
   BEGIN
      OPEN c_maind;
      FETCH c_maind INTO maind;
      debt := maind.pamt;

      IF c_maind%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_maind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_maind
      IS
         SELECT SUM (  payedamt
                     + payeddueamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      maind   c_maind%ROWTYPE;
      debt    NUMBER;
   BEGIN
      OPEN c_maind;
      FETCH c_maind INTO maind;
      debt := maind.pamt;

      IF c_maind%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_maind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedintdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_intd
      IS
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id;

      intd   c_intd%ROWTYPE;
      debt   NUMBER;
   BEGIN
      OPEN c_intd;
      FETCH c_intd INTO intd;
      debt := intd.pamt;

      IF c_intd%NOTFOUND
      THEN
         debt := 0;
      END IF;

      CLOSE c_intd;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmonmaindebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER
   IS
      CURSOR c_monmaind
      IS
         SELECT SUM (  payedamt
                     + payeddueamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN t_date_b AND t_date_e;

      monmaind   c_monmaind%ROWTYPE;
      debt       NUMBER;
   BEGIN
      OPEN c_monmaind;
      FETCH c_monmaind INTO monmaind;
      debt := monmaind.pamt;

      IF debt IS NULL
      THEN
         debt := 0;
      END IF;

      CLOSE c_monmaind;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION payedmonintdebt (p_id IN INTEGER, t_date_b DATE, t_date_e DATE)
      RETURN NUMBER
   IS
      CURSOR c_monintd
      IS
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS pamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN t_date_b AND t_date_e;

      monintd   c_monintd%ROWTYPE;
      debt      NUMBER;
   BEGIN
      OPEN c_monintd;
      FETCH c_monintd INTO monintd;
      debt := monintd.pamt;

      IF debt IS NULL
      THEN
         debt := 0;
      END IF;

      CLOSE c_monintd;
      RETURN ROUND (debt / 1000);
   END;

   FUNCTION paypercentmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   100
             * (payedmaindebt (p_id) / overdatemaindebt (p_id));
      RETURN ROUND (res, 1);
   END;

   FUNCTION paypercentint (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   100
             * (payedintdebt (p_id) / overdatepercentdebt (p_id));
      RETURN ROUND (res, 1);
   END;

   FUNCTION bpcredittypeid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      typeid   NUMBER;
   BEGIN
      SELECT TYPE
        INTO typeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN typeid;
   END;

   FUNCTION bpcredittype (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      tpdesc   VARCHAR2 (32);
   BEGIN
      SELECT typedesc
        INTO tpdesc
        FROM cm_bp_types
       WHERE id = cm_akf.bpcredittypeid (p_id);

      RETURN tpdesc;
   END;

   FUNCTION bpcreditdistrict (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vdistrictid     NUMBER;
      vdistrictname   VARCHAR2 (128);
   BEGIN
      SELECT NAME
        INTO vdistrictname
        FROM agro_region
       WHERE id = cm_akf.bpcreditdistrictid (p_id);

      RETURN vdistrictname;
   END;

   FUNCTION bpcreditvillageid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vvillageid   NUMBER;
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN vvillageid;
   END;

   FUNCTION bpcreditpurposeid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vpurposeid   NUMBER;
   BEGIN
      SELECT akpurpose
        INTO vpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN vpurposeid;
   END;

   FUNCTION bpcreditvillage (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vvillageid     NUMBER;
      vvillagename   VARCHAR2 (128);
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT NAME
        INTO vvillagename
        FROM agro_village
       WHERE id = vvillageid;

      RETURN vvillagename;
   END;

   FUNCTION bpcreditdistrictid (p_id IN INTEGER)
      RETURN NUMBER
   IS
      vvillageid    NUMBER;
      vdistrictid   NUMBER;
   BEGIN
      SELECT villageid
        INTO vvillageid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT depend_id
        INTO vdistrictid
        FROM agro_village
       WHERE id = vvillageid;

      RETURN vdistrictid;
   END;

   FUNCTION bpcreditaktarget (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vaktargetid     NUMBER;
      vaktargetname   VARCHAR2 (128);
   BEGIN
      SELECT NAME
        INTO vaktargetname
        FROM agro_kredit_target
       WHERE id = cm_akf.bpcreditaktargetid (p_id);

      RETURN vaktargetname;
   END;

   FUNCTION bpcreditakpurpose (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vakpurposeid     NUMBER;
      vakpurposename   VARCHAR2 (128);
   BEGIN
      SELECT akpurpose
        INTO vakpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT NAME
        INTO vakpurposename
        FROM agro_kredit_purpose
       WHERE id = vakpurposeid;

      RETURN vakpurposename;
   END;

   FUNCTION bpcreditaktargetid (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      vakpurposeid   NUMBER;
      vaktargetid    NUMBER;
   BEGIN
      SELECT akpurpose
        INTO vakpurposeid
        FROM cm_business_plan
       WHERE creditid = p_id;

      SELECT depend_id
        INTO vaktargetid
        FROM agro_kredit_purpose
       WHERE id = vakpurposeid;

      RETURN vaktargetid;
   END;

   FUNCTION allcalculatedpercent (p_id IN INTEGER) -- asif
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (i.interest)
        INTO res
        FROM  cm_interests i
       WHERE i.creditid = p_id;-- AND i.hdate = t_date;

      RETURN res;
   END;

   FUNCTION calculatedpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (i.interest)
        INTO res
        FROM cm_active_credits a, cm_interests i
       WHERE (a.id = i.creditid) AND creditid = p_id;

      RETURN res;
   END;

   FUNCTION creditsamount (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT creditlineamount
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;

      RETURN res;
   END;

   FUNCTION creditsamount2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION creditsamount1 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_tranchesum
      IS
         SELECT SUM (trancheamount) amt
           FROM cm_tranches
          WHERE creditid = p_id;

      trsum   c_tranchesum%ROWTYPE;
      res     NUMBER;
   BEGIN
      /*Res :=   Mcreditdebtmaindebt (P_id)
             + Payedmaindebt (P_id);*/
      OPEN c_tranchesum;
      FETCH c_tranchesum INTO trsum;

      IF c_tranchesum%FOUND
      THEN
         res := trsum.amt;
      ELSE
         res := 0;
      END IF;

      CLOSE c_tranchesum;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION creditsprotocol (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      /*SELECT (SUBSTR (numberofcredit, 1,   INSTR (numberofcredit, '/')
                                         - 1)
             )
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;*/

      RETURN 3;--(res);
   END;

   FUNCTION creditsparagraph (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      /*SELECT SUBSTR (
                numberofcredit,
                  INSTR (numberofcredit, '/')
                + 1,
                LENGTH (numberofcredit)
             )
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;
*/
      RETURN 3;
   END;

   FUNCTION creditsincpercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      
/*  SELECT -7
    INTO res
    FROM dual;
--   WHERE creditid = p_id;*/
      SELECT annualyinterestrate
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;

      RETURN res;
   END;

   FUNCTION creditspaypercent (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT annualyoverduerate
        INTO res
        FROM cm_portfolio
       WHERE id = p_id;

      RETURN res;
   END;

   FUNCTION currmonthrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER
   IS
      monmaindebt   NUMBER;
   BEGIN
      SELECT SUM (rest)
        INTO monmaindebt
        FROM cm_history
       WHERE hdate BETWEEN t_datebegin AND t_dateend AND creditid = p_id;

      RETURN monmaindebt;
   END;

   FUNCTION currmonthintrestmain (
      p_id          IN   INTEGER,
      t_datebegin   IN   DATE,
      t_dateend     IN   DATE
   )
      RETURN NUMBER
   IS
      monintrdebt   NUMBER;
   BEGIN
      SELECT SUM (interestrest)
        INTO monintrdebt
        FROM cm_history
       WHERE hdate BETWEEN t_datebegin AND t_dateend AND creditid = p_id;

      RETURN monintrdebt;
   END;

   FUNCTION businessplan_ak_addedit (
      p_creditid               IN   INTEGER DEFAULT 0,
      p_projectcost            IN   NUMBER,
      p_givencredit            IN   NUMBER,
      p_concessionperiod       IN   INTEGER,
      p_purpose                IN   INTEGER,
      p_source                 IN   VARCHAR2,
      p_type                   IN   INTEGER,
      p_untmeansofproduction   IN   VARCHAR2,
      p_numberofproduction     IN   INTEGER,
      p_untproduction          IN   VARCHAR2,
      p_production             IN   INTEGER,
      p_productivity           IN   INTEGER,
      p_productioncost         IN   NUMBER,
      p_sumprofit              IN   NUMBER,
      p_boughtmaterial         IN   NUMBER,
      p_operationexpense       IN   NUMBER,
      p_taxexpense             IN   NUMBER,
      p_otherexpence           IN   NUMBER,
      p_sumexpense             IN   NUMBER,
      p_villageid              IN   NUMBER,
      p_akpurpose              IN   NUMBER
   )
      RETURN INTEGER
   IS
      result   INTEGER := p_creditid;
   BEGIN
      UPDATE cm_business_plan
         SET projectcost = p_projectcost,
             givencredit = p_givencredit,
             concessionperiod = p_concessionperiod,
             purpose = p_purpose,
             SOURCE = p_source,
             TYPE = p_type,
             untmeansofproduction = p_untmeansofproduction,
             numberofproduction = p_numberofproduction,
             untproduction = p_untproduction,
             production = p_production,
             productivity = p_productivity,
             productioncost = p_productioncost,
             sumprofit = p_sumprofit,
             boughtmaterial = p_boughtmaterial,
             operationexpense = p_operationexpense,
             taxexpense = p_taxexpense,
             otherexpence = p_otherexpence,
             sumexpense = p_sumexpense,
             villageid = p_villageid,
             akpurpose = p_akpurpose
       WHERE creditid = result;

      IF SQL%ROWCOUNT = 0
      THEN
         INSERT INTO cm_business_plan
                     (creditid, projectcost, givencredit,
                      concessionperiod, purpose, SOURCE, TYPE,
                      untmeansofproduction, numberofproduction,
                      untproduction, production, productivity,
                      productioncost, sumprofit, boughtmaterial,
                      operationexpense, taxexpense, otherexpence,
                      sumexpense, villageid, akpurpose)
              VALUES (result, p_projectcost, p_givencredit,
                      p_concessionperiod, p_purpose, p_source, p_type,
                      p_untmeansofproduction, p_numberofproduction,
                      p_untproduction, p_production, p_productivity,
                      p_productioncost, p_sumprofit, p_boughtmaterial,
                      p_operationexpense, p_taxexpense, p_otherexpence,
                      p_sumexpense, p_villageid, p_akpurpose)
           RETURNING creditid
                INTO result;
      END IF;

      RETURN result;
   END;

   FUNCTION bpprojectcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT projectcost
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpgivencredit (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpunitmeansproduction (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (100);
   BEGIN
      SELECT untmeansofproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpunitproduct (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      res   VARCHAR2 (100);
   BEGIN
      SELECT untproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpnumberofproduction (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT numberofproduction
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpproduction (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT production
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpproductivity (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT productivity
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpproductioncost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT productioncost
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION bpsumprofit (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT sumprofit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpboughtmaterial (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT boughtmaterial
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpoperationexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT operationexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bptaxexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT taxexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpotherexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT otherexpence
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpsumexpense (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT sumexpense
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION bpistehsaltype (p_id IN INTEGER)
      RETURN VARCHAR
   IS
      res   VARCHAR (100);
   BEGIN
      res := 'ясас';
      RETURN res;
   END;

   FUNCTION bpgalir (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res := bpsumprofit (p_id);
      RETURN res;
   END;

   FUNCTION bpmanfaat (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   bpsumprofit (p_id)
             - bpsumexpense (p_id);
      RETURN res;
   END;

   FUNCTION bppartofcreditbp (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT givencredit
        INTO res
        FROM cm_business_plan
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION lastpaymentdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (paymentdate) AS lastpaydate
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION districtcredittypecount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid
         AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION districtcreditcount (districtid IN INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid;

      RETURN res;
   END;

   FUNCTION districtcredittypeamount (districtid IN INTEGER, typeid IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid
         AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION districtcreditamount (districtid IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid;

      RETURN res;
   END;

   FUNCTION districtcreditamountyear (districtid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid
         AND p.dateofconclusion BETWEEN    '01-Jan-'
                                        || TO_CHAR (YEAR)
                                    AND    '31-Dec-'
                                        || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION districtcredittypeamountyear (
      districtid   IN   INTEGER,
      typeid       IN   INTEGER,
      YEAR         IN   INTEGER
   )
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND v.depend_id = districtid
         AND b.TYPE = typeid
         AND p.dateofconclusion BETWEEN    '01-Jan-'
                                        || TO_CHAR (YEAR)
                                    AND    '31-Dec-'
                                        || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION credittypecreditcount (typeid INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id) AND (b.villageid = v.id) AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION credittypecreditamount (typeid INTEGER)
      RETURN INTEGER
   IS
      res   INTEGER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_portfolio p,
             creditsmgr.agro_village v,
             creditsmgr.cm_business_plan b
       WHERE (b.creditid = p.id) AND (b.villageid = v.id) AND b.TYPE = typeid;

      RETURN res;
   END;

   FUNCTION credittypeamountyear (typeid IN INTEGER, YEAR IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (p.creditlineamount)
        INTO res
        FROM creditsmgr.cm_business_plan b,
             creditsmgr.agro_village v,
             creditsmgr.cm_portfolio p
       WHERE (b.creditid = p.id)
         AND (b.villageid = v.id)
         AND b.TYPE = typeid
         AND p.dateofconclusion BETWEEN    '01-Jan-'
                                        || TO_CHAR (YEAR)
                                    AND    '31-Dec-'
                                        || TO_CHAR (YEAR);

      RETURN res;
   END;

   FUNCTION getgirovtorpaqha (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepricetorpaqha
        INTO res
        FROM cm_guarantee
       WHERE creditid = p_id;

      RETURN ROUND (res, 1);
   END;

   FUNCTION getgirovtorpaqcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepricetorpaq
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovevkv (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepriceevkv
        INTO res
        FROM cm_guarantee
       WHERE creditid = p_id;

      RETURN ROUND (res, 1);
   END;

   FUNCTION getgirovevcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepriceev
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovothercost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgeprice
        INTO res
        FROM cm_curr_state
       WHERE creditid = p_id;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION getgirovsumcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   getgirovothercost (p_id)
             + getgirovtorpaqcost (p_id)
             + getgirovevcost (p_id);
      RETURN res;
   END;

   FUNCTION measurepretdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measurepretgdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiadate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiagdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatndate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatngdate (p_id IN INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (givedate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measurepretcost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measpretcost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_pretenzia
          WHERE creditid = pid AND grantdate = measurepretdate (pid);

      res   NUMBER;
      obj   c_measpretcost%ROWTYPE;
   BEGIN
      OPEN c_measpretcost (p_id);
      FETCH c_measpretcost INTO obj;
      res := obj.activeind1;

      IF c_measpretcost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measpretcost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measurepretcost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measpretcost2 (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_pretenzia
          WHERE creditid = pid AND grantdate = measurepretdate (pid);

      res   NUMBER;
      obj   c_measpretcost2%ROWTYPE;
   BEGIN
      OPEN c_measpretcost2 (p_id);
      FETCH c_measpretcost2 INTO obj;
      res := obj.activeind2;

      IF c_measpretcost2%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measpretcost2;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measurepretcost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   measurepretcost2 (p_id)
             - measurepretcost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION measureprethave (p_id IN INTEGER)
      RETURN INT
   IS
      res   INT;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureiddiacost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_iddia
          WHERE creditid = pid AND grantdate = measureiddiadate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind1;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureiddiacost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_iddia
          WHERE creditid = pid AND grantdate = measureiddiadate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind2;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureiddiacost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   measureiddiacost2 (p_id)
             - measureiddiacost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION measureiddiahave (p_id IN INTEGER)
      RETURN INT
   IS
      res   INT;
   BEGIN
      SELECT COUNT (*)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION measureqatncost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind1
           FROM cm_akf_measures_qatname
          WHERE creditid = pid AND grantdate = measureqatndate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind1;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureqatncost2 (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_measiddiacost (pid IN INTEGER)
      IS
         SELECT activeind2
           FROM cm_akf_measures_qatname
          WHERE creditid = pid AND grantdate = measureqatndate (pid);

      res   NUMBER;
      obj   c_measiddiacost%ROWTYPE;
   BEGIN
      OPEN c_measiddiacost (p_id);
      FETCH c_measiddiacost INTO obj;
      res := obj.activeind2;

      IF c_measiddiacost%NOTFOUND
      THEN
         res := 0;
      END IF;

      CLOSE c_measiddiacost;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION measureqatncost2_cost (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   measureqatncost2 (p_id)
             - measureqatncost (p_id);
      RETURN ABS (res);
   END;

   FUNCTION mustreturn4princmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4princ (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (principal)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mustreturn4intrmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (interest)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4intr (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT SUM (interest)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mustreturn4summon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   mustreturn4intrmon (p_id, mon)
             + mustreturn4princmon (p_id, mon);
      RETURN res;
   END;

   FUNCTION mustreturn4sum (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   mustreturn4intr (p_id)
             + mustreturn4princ (p_id);
      RETURN res;
   END;

   FUNCTION mustreturn4countmon (p_id INTEGER, mon DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT COUNT (creditid)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id AND paymentdate BETWEEN mon AND LAST_DAY (mon);

      RETURN res;
   END;

   FUNCTION mustreturn4count (p_id INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT COUNT (creditid)
        INTO res
        FROM cm_payment_schedule
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION mcreditdebtmaindebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_accidl
      IS
         SELECT loanaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_accidd
      IS
         SELECT dueloanaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_ostat (accid IN INTEGER)
      IS
         SELECT ABS (pok_ostat) ostat
           FROM sb_tenostat
          WHERE acc_id = accid;

      accidl   c_accidl%ROWTYPE;
      accidd   c_accidd%ROWTYPE;
      ostatl   c_ostat%ROWTYPE;
      ostatd   c_ostat%ROWTYPE;
      debtl    NUMBER;
      debtd    NUMBER;
      res      NUMBER;
   BEGIN
      debtl := 0;
      debtd := 0;
      OPEN c_accidl;
      FETCH c_accidl INTO accidl;
      CLOSE c_accidl;
      OPEN c_accidd;
      FETCH c_accidd INTO accidd;
      CLOSE c_accidd;
      OPEN c_ostat (accidl.acid);
      FETCH c_ostat INTO ostatl;

      IF ostatl.ostat IS NOT NULL
      THEN
         debtl := ostatl.ostat;
      END IF;

      CLOSE c_ostat;
      OPEN c_ostat (accidd.acid);
      FETCH c_ostat INTO ostatd;

      IF ostatd.ostat IS NOT NULL
      THEN
         debtd := ostatd.ostat;
      END IF;

      CLOSE c_ostat;
      res :=   debtl
             + debtd;
      --creditsamount(p_id)-PayedMainDebt(p_id);
      res := 1000 * (  creditsamount (p_id)
                     - payedmaindebt (p_id)
                    );
      RETURN ROUND (res / 1000);
   END;

   FUNCTION mcreditdebtintdebt (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_accidl
      IS
         SELECT interestaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_accidd
      IS
         SELECT dueinterestaccid acid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_ostat (accid IN INTEGER)
      IS
         SELECT ABS (pok_ostat) ostat
           FROM sb_tenostat
          WHERE acc_id = accid;

      accidl   c_accidl%ROWTYPE;
      accidd   c_accidd%ROWTYPE;
      ostatl   c_ostat%ROWTYPE;
      ostatd   c_ostat%ROWTYPE;
      debtl    NUMBER;
      debtd    NUMBER;
      res      NUMBER;
   BEGIN
      debtl := 0;
      debtd := 0;
      OPEN c_accidl;
      FETCH c_accidl INTO accidl;
      CLOSE c_accidl;
      OPEN c_accidd;
      FETCH c_accidd INTO accidd;
      CLOSE c_accidd;
      OPEN c_ostat (accidl.acid);
      FETCH c_ostat INTO ostatl;

      IF ostatl.ostat IS NOT NULL
      THEN
         debtl := ostatl.ostat;
      END IF;

      CLOSE c_ostat;
      OPEN c_ostat (accidd.acid);
      FETCH c_ostat INTO ostatd;

      IF ostatd.ostat IS NOT NULL
      THEN
         debtd := ostatd.ostat;
      END IF;

      CLOSE c_ostat;
      res :=   debtl
             + debtd;
      --creditsamount(p_id)-PayedMainDebt(p_id);
      --Res := CreditsAmount(p_id)-payedmaindebt(p_id);
      RETURN ROUND (res / 1000);
   /*
   Res :=   Computedpercent (P_id)
          - Payedintdebt (P_id);*/
   END;

   FUNCTION mcreditdebtovermaindebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=   overdatemaindebt (p_id)
             - payedmaindebt (p_id);
      RETURN res;
   END;

   FUNCTION mcreditdebtoverintdebt (p_id IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      res :=                                     /*Overdatepercentdebt (P_id)
                                               - Payedintdebt (P_id);*/
                                                    mcreditdebtintdebt (p_id);
      RETURN res;
   END;

   FUNCTION f3maindebtpretenzia (p_id INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_pret
      IS
         SELECT activeind2 ai1
           FROM cm_akf_measures_pretenzia
          WHERE creditid = p_id;

      pret   c_pret%ROWTYPE;
      res    NUMBER;
   BEGIN
      OPEN c_pret;
      res := 0;
      FETCH c_pret INTO pret;

      IF pret.ai1 IS NOT NULL
      THEN
         res := pret.ai1;
      END IF;

      CLOSE c_pret;
      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3maindebtpretenziadate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3maindebtiddiadate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3maindebtqatnamedate (p_id INTEGER)
      RETURN DATE
   IS
      res   DATE;
   BEGIN
      SELECT MAX (grantdate)
        INTO res
        FROM cm_akf_measures_qatname
       WHERE creditid = p_id;

      RETURN res;
   END;

   FUNCTION f3payafterpretall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payedintamt
                     + payeddueamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiaall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payedintamt
                     + payeddueamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnameall (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      res := 0;
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payedintamt
                     + payeddueamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterpretmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiamain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnmain (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedamt
                     + payeddueamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterpretint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtpretenziadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafteriddiaint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtiddiadate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION f3payafterqatnint (p_id INTEGER)
      RETURN NUMBER
   IS
      res       NUMBER;
      pretdat   DATE;
   BEGIN
      pretdat := f3maindebtqatnamedate (p_id);

      IF pretdat IS NOT NULL
      THEN
         SELECT SUM (  payedintamt
                     + payeddueintamt) AS payamt
           INTO res
           FROM cm_payments
          WHERE creditid = p_id AND paydate >= pretdat;
      ELSE
         res := 0;
      END IF;

      RETURN ROUND (res / 1000);
   END;

   FUNCTION pretenziahad (p_id IN INTEGER)
      RETURN BOOLEAN
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_akf_measures_pretenzia
       WHERE creditid = p_id;

      RETURN cnt > 0;
   END;

   FUNCTION iddiahad (p_id IN INTEGER)
      RETURN BOOLEAN
   IS
      cnt   NUMBER;
   BEGIN
      SELECT COUNT (*)
        INTO cnt
        FROM cm_akf_measures_iddia
       WHERE creditid = p_id;

      RETURN cnt > 0;
   END;

   FUNCTION pretenziahad_num (p_id IN INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF pretenziahad (p_id)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION iddiahad_num (p_id IN INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF iddiahad (p_id)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF  (mcreditdebtmaindebt (p_id) = 0) AND (mcreditdebtintdebt (p_id) = 0)
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishesasmebleg (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF (tamodenmishsay (p_id) <> 0)
      THEN
         RETURN payedmaindebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenmishfaizmebleg (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF (tamodenmishsay (p_id) <> 0)
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF      (payedmaindebt (p_id) > 0)
          AND (payedmaindebt (p_id) < creditsamount (p_id))
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF qismenodenmishsay (p_id) > 0
      THEN
         RETURN payedmaindebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION qismenodenmishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF qismenodenmishsay (p_id) > 0
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenilmemishsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN   kreditqaligsay (p_id)
             - qismenodenmishsay (p_id);
   END;

   FUNCTION tamodenilmemishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF tamodenilmemishsay (p_id) <> 0
      THEN
         RETURN creditsamount (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION tamodenilmemishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF tamodenilmemishsay (p_id) <> 0
      THEN
         RETURN payedintdebt (p_id);
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION kreditqaligsay (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF mcreditdebtmaindebt (p_id) <> 0
      THEN
         RETURN 1;
      ELSE
         RETURN 0;
      END IF;
   END;

   FUNCTION kreditqaligesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF kreditqaligsay (p_id) = 0
      THEN
         RETURN 0;
      ELSE
         RETURN mcreditdebtmaindebt (p_id);
      END IF;
   END;

   FUNCTION kreditqaligfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      IF kreditqaligsay (p_id) = 0
      THEN
         RETURN 0;
      ELSE
         RETURN mcreditdebtintdebt (p_id);
      END IF;
   END;

   FUNCTION cemiverilmishesas (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN ROUND (creditsamount (p_id) / 1000, 1);
   END;

   FUNCTION cemiverilmishfaiz (p_id INTEGER)
      RETURN NUMBER
   IS
   BEGIN
      RETURN ROUND (computedpercent (p_id) / 1000, 1);
   END;

   FUNCTION creditproject (p_id INTEGER)
      RETURN INTEGER
   IS
      CURSOR c_projid
      IS
         SELECT c.sid# proj_id
           FROM creditsmgr.cm_portfolio b,
                creditsmgr.cm_accounts a,
                sb_account c
          WHERE (a.creditid = b.id)
            AND (c.id = a.loanaccid)
            AND (b.id = p_id);

      projid      c_projid%ROWTYPE;
      projectid   INTEGER;
   BEGIN
      OPEN c_projid;
      FETCH c_projid INTO projid;

      IF c_projid%FOUND
      THEN
         projectid := projid.proj_id;
      ELSE
         projectid := 0;
      END IF;

      CLOSE c_projid;
      RETURN projectid;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AKF_1

-- Start of DDL Script for Package CREDITSMGR.CM_AUTO_EXPIRE
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_auto_expire
  IS

  procedure ClearExpireMarks;
  procedure PastDueLoan(
            p_CreditID in Integer ,
            p_Date in Date
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_auto_expire
IS
  procedure MarkAboutExpire(
    p_CreditID in Integer ,
    p_DueMainAmt in Number ,
    p_DueIntAmt in Number ,
    p_DaysMain in Integer ,
    p_DaysInt in Integer
  )
  is
  begin
  
    insert into CM_AE_CACHE (creditid, duemainamt, dueintamt, daysmain, daysint)
    values (p_CreditID, p_DueMainAmt, p_DueIntAmt, p_DaysMain, p_DaysInt);
   
  end;
  
  procedure ClearExpireMarks
  is
  begin
    rollback work;
  end;
  
  ---  Calculate Expire
  
  procedure PastDueLoan(
            p_CreditID in Integer ,
            p_Date in Date
            )
  is
  
  cursor c_Payment_Schedule(CrdID in Integer, Dat in Date) is
  select NVL(SUM(PRINCIPAL), 0) as SumP ,
         Count(*) as CntP
         --NVL(SUM(INTEREST), 0)  as SumI
    from CM_PAYMENT_SCHEDULE
   where CREDITID = CrdID 
     and PAYMENTDATE < Dat;
  
  /*
  cursor c_InterestCalced(CrdID in Integer, Dat in Date) is
  select NVL(SUM(INTEREST), 0) as SumCI
    from CM_INTERESTS
   where CreditID = CrdID
     and HDate < Dat;   
  */
  
  cursor c_CreditState(CrdID in Integer, Dat in Date) is
  select GIVENAMOUNT ,
         REST ,
         INTERESTREST ,
         DUEREST ,
         DUEINTERESTREST           
    from CM_HISTORY
   where CreditID = CrdID
     and HDate = Dat;  

  cursor c_CreditState_Today(CrdID in Integer) is
  select GIVENAMOUNT ,
         REST ,
         INTERESTREST ,
         DUEREST ,
         DUEINTERESTREST           
    from CM_CURR_STATE
   where CreditID = CrdID;
  
  cursor c_CreditInfo(CrdID in Integer) is
  select DUEDATEFIRSTCONTRACT as DUEDATE --- !!!!!!!!!!!!!!!!!!!!! TEMPORARY 
    from CM_PORTFOLIO
   where ID = CrdID;         
  
  PmtSchedRec c_Payment_Schedule%rowtype;
  --IntCalcedRec  c_InterestCalced%rowtype;
  CrdStateRec c_CreditState%rowtype;
  CrdInfoRec c_CreditInfo%rowtype;
  
  DeltaMainAmt Number := 0;
  DeltaIntAmt  Number := 0;
  DMain Integer := 0;
  DInt Integer := 0;
  
  Today Date;
        
  begin
    
    select TEK_DAT 
      into Today
      from SB_SYSDAT;
      
    -- update smart.a1 set c5=TO_CHAR(p_CreditID)||' - '||TO_CHAR(p_Date); 
    -- commit;
    
    open c_CreditInfo(p_CreditID);
    fetch c_CreditInfo into CrdInfoRec;
    close c_CreditInfo;
    
    
    if p_Date  <  Today then
      open c_CreditState(p_CreditID, p_Date);
      fetch c_CreditState into CrdStateRec;
      close c_CreditState;
    elsif p_Date = Today then
      open c_CreditState_Today(p_CreditID);
      fetch c_CreditState_Today into CrdStateRec;
      close c_CreditState_Today;    
    else
      CM_UTILS.ProcessError(-20099); -- Not a valid Date
    end if;
    
    if CrdInfoRec.DUEDATE < p_Date then
      MarkAboutExpire(
        p_CreditID, 
        CrdStateRec.Rest + CrdStateRec.DueRest,
        CrdStateRec.InterestRest + CrdStateRec.DueInterestRest,
        p_Date - CrdInfoRec.DUEDATE ,
        0
      );
      return; -- Exit;
    end if; 
    
    open c_Payment_Schedule(p_CreditID, p_Date);
    fetch c_Payment_Schedule into PmtSchedRec;
    close c_Payment_Schedule; 
    
    /*
    open c_InterestCalced(p_CreditID, p_Date);
    fetch c_InterestCalced into IntCalcedRec;
    close c_InterestCalced;
    */
    
    /*
    dbms_output.put_line('Given='||TO_CHAR(CrdStateRec.GivenAmount));
    dbms_output.put_line('SumP='||TO_CHAR(PmtSchedRec.SumP));
    dbms_output.put_line('Rest= '||TO_CHAR(CrdStateRec.Rest));
    */
    
    DeltaMainAmt := CrdStateRec.GivenAmount - PmtSchedRec.SumP;
    
    DeltaMainAmt := CrdStateRec.Rest - DeltaMainAmt + CrdStateRec.DueRest;
    if DeltaMainAmt < 0 then
      DeltaMainAmt := 0;
    else
      if PmtSchedRec.CntP != 0 and PmtSchedRec.SumP != 0 then 
        DMain := DeltaMainAmt / (PmtSchedRec.SumP/PmtSchedRec.CntP);
      end if;     
    end if;
    
    DeltaIntAmt := CrdStateRec.InterestRest + CrdStateRec.DueInterestRest;
    
    
    
    if DeltaMainAmt > 0 then     
      MarkAboutExpire(
        p_CreditID, 
        DeltaMainAmt,
        DeltaIntAmt,
        0,
        DMain
      );            
    end if;
    
  end;          

END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AUTO_EXPIRE

-- Start of DDL Script for Package CREDITSMGR.CM_AUTOEXP
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE);

   PROCEDURE autores (p_opdate IN DATE);
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT id, numberofcredit, currency, customertype, branchid,
                credittype
           FROM cm_active_credits
          WHERE id IN (SELECT creditid
                         FROM cm_payment_schedule
                        WHERE paymentdate = p_date);

      CURSOR c_shedulerest (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT principal, interest
           FROM cm_payment_schedule
          WHERE creditid = p_id AND paymentdate = p_date;

      CURSOR c_currencyostat (val IN INTEGER)
      IS
         SELECT ostat
           FROM sb_temprate
          WHERE val_kod = val;

      CURSOR c_reserverate (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserve_types
          WHERE id = (SELECT reserveid
                        FROM cm_curr_state
                       WHERE creditid = p_id);

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT booroweraccid, contractaccid, loanaccid, dueloanaccid,
                interestaccid, dueinterestaccid, primaryreserveaccid,
                secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_payment (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT payedamt, payedintamt
           FROM cm_payments
          WHERE creditid = p_id AND paydate = p_date;

      CURSOR c_exp (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT expamount
           FROM cm_expires
          WHERE creditid = p_id AND expdate = p_date;

      EXP                  c_exp%ROWTYPE;
      shedulerest          c_shedulerest%ROWTYPE;
      currencyostat        c_currencyostat%ROWTYPE;
      reserverate          c_reserverate%ROWTYPE;
      ACCOUNT              c_account%ROWTYPE;
      payment              c_payment%ROWTYPE;
      debitaccid           INTEGER;
      creditaccid          INTEGER;
      tramount             NUMBER;
      reservecontenabled   BOOLEAN;
      trdescription        VARCHAR2 (50);
      resultmaintrid       INTEGER;
      resultprestrid       INTEGER;
      temp                 NUMBER;
      currdat              DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      FOR portinfo IN c_port (currdat)
      LOOP
         OPEN c_shedulerest (portinfo.id, p_opdate);
         FETCH c_shedulerest INTO shedulerest;
         CLOSE c_shedulerest;
        
         OPEN c_account (portinfo.id);
         FETCH c_account INTO ACCOUNT;
         CLOSE c_account;
        
         OPEN c_currencyostat (portinfo.currency);
         FETCH c_currencyostat INTO currencyostat;
         CLOSE c_currencyostat;
        
         OPEN c_reserverate (portinfo.id);
         FETCH c_reserverate INTO reserverate;
         CLOSE c_reserverate;
        
         OPEN c_payment (portinfo.id, p_opdate);
         FETCH c_payment INTO payment;
         CLOSE c_payment;
        
         OPEN c_exp (portinfo.id, p_opdate);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;

         IF EXP.expamount <>
                (  NVL (shedulerest.principal, 0)
                 - NVL (payment.payedamt, 0)
                )
         THEN
            IF NVL (shedulerest.principal, 0) > NVL (payment.payedamt, 0)
            THEN
               debitaccid := ACCOUNT.dueloanaccid;
               creditaccid := ACCOUNT.loanaccid;
               tramount :=   NVL (shedulerest.principal, 0)
                           - NVL (payment.payedamt, 0) /*p_Amount*/;
               trdescription := cm_utils.trdescmaindebtexpire ();
               trdescription := REPLACE (
                                   trdescription,
                                   cm_decls.trdescnumber,
                                   portinfo.numberofcredit
                                );
               trdescription := REPLACE (
                                   trdescription,
                                   cm_decls.trdescdate,
                                   TO_CHAR (p_opdate, 'DD/MM/YYYY')
                                );
               resultmaintrid :=
                     cm_transactionmgr.sbaddtransaction (
                        p_trid=> NULL,
                        p_debitid=> debitaccid,
                        p_creditid=> creditaccid,
                        p_debitamount=> NULL,
                        p_creditamount=> tramount,
                        p_lamount=> NULL,
                        p_trname=> trdescription,
                        p_flags=> sb_decls.atfcommitimmediate,
                        p_transactiondate=> p_opdate,
                        p_operationtype=> cm_decls.cmtransactionoptype,
                        p_inbalancechar=> NULL
                     );
            END IF;

            IF NVL (shedulerest.interest, 0) > NVL (payment.payedintamt, 0)
            THEN
               debitaccid := ACCOUNT.dueinterestaccid;
               creditaccid := ACCOUNT.interestaccid;
               tramount :=   NVL (shedulerest.interest, 0)
                           - NVL (payment.payedintamt, 0) /*p_Amount*/;
               trdescription := cm_utils.trdescmaindebtexpire ();
               trdescription := REPLACE (
                                   trdescription,
                                   cm_decls.trdescnumber,
                                   portinfo.numberofcredit
                                );
               trdescription := REPLACE (
                                   trdescription,
                                   cm_decls.trdescdate,
                                   TO_CHAR (p_opdate, 'DD/MM/YYYY')
                                );
               resultmaintrid :=
                     cm_transactionmgr.sbaddtransaction (
                        p_trid=> NULL,
                        p_debitid=> debitaccid,
                        p_creditid=> creditaccid,
                        p_debitamount=> NULL,
                        p_creditamount=> tramount,
                        p_lamount=> NULL,
                        p_trname=> trdescription,
                        p_flags=> sb_decls.atfcommitimmediate,
                        p_transactiondate=> p_opdate,
                        p_operationtype=> cm_decls.cmtransactionoptype,
                        p_inbalancechar=> NULL
                     );
            END IF;

            UPDATE    cm_curr_state
                  SET rest =   rest
                             - (  NVL (shedulerest.principal, 0)
                                - NVL (payment.payedamt, 0)
                               ),
                      duerest =   duerest
                                + NVL (shedulerest.principal, 0)
                                - NVL (payment.payedamt, 0),
                      interestrest =   interestrest
                                     - (  NVL (shedulerest.interest, 0)
                                        - NVL (payment.payedintamt, 0)
                                       )
                WHERE creditid = portinfo.id
            RETURNING rest
                 INTO temp;

            IF temp = 0
            THEN
               UPDATE cm_accounts
                  SET contractaccid = dueloanaccid
                WHERE creditid = portinfo.id;
            END IF;

            INSERT INTO cm_expires
                        (creditid, expdate,
                         expamount /*, oldduereserveid*/,
                         exptrid, prestrid /*, srestrid*/)
                 VALUES (portinfo.id, p_opdate,
                           NVL (shedulerest.principal, 0)
                         - NVL (
                              payment.payedamt,
                              0
                           ) /*, HistInfoRec.DUERESERVEID*/,
                         resultmaintrid, resultprestrid /*, ResultSResTrID*/);
         END IF;

         COMMIT WORK;
      END LOOP;
   END;

   PROCEDURE autores (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT id, numberofcredit, currency, branchid, customertype
           FROM cm_active_credits;

      -- Yadda saxla !!! where id in (select creditid from cm_expires where expdate = p_date) ;

      CURSOR c_exp (p_id IN INTEGER /*,p_date in date*/)
      IS
         SELECT expdate
           FROM cm_expires
          WHERE creditid = p_id /*and expdate = p_date*/;

      CURSOR c_rests (p_id IN INTEGER)
      IS
         SELECT rest, reserveid
           FROM cm_curr_state
          WHERE creditid = p_id;

      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_res
      IS
         SELECT id, PERCENT, bdcount, edcount
           FROM cm_reserve_types;

      CURSOR c_ostat (p_id IN INTEGER)
      IS
         SELECT ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      port            c_port%ROWTYPE;
      EXP             c_exp%ROWTYPE;
      rests           c_rests%ROWTYPE;
      accounts        c_accounts%ROWTYPE;
      ostat           c_ostat%ROWTYPE;
      currdate        DATE;
      countdat        NUMBER;
      crdpercent      NUMBER;
      crdoldpercent   NUMBER;
      currencyostat   NUMBER;
      tramount        NUMBER;
      creditaccid     INTEGER;
      debitaccid      INTEGER;
      firsttrid       NUMBER;
      secondtrid      NUMBER;
   BEGIN
      SELECT tek_dat
        INTO currdate
        FROM sb_sysdat;

      FOR port IN c_port (currdate)
      LOOP
         OPEN c_exp (port.id /*,currdate*/);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;
       
         OPEN c_accounts (port.id);
         FETCH c_accounts INTO accounts;
         CLOSE c_accounts;
       
         OPEN c_rests (port.id);
         FETCH c_rests INTO rests;
         CLOSE c_rests;
       
         OPEN c_ostat (accounts.primaryreserveaccid);
         FETCH c_ostat INTO ostat;
         CLOSE c_ostat;

         IF EXP.expdate is not null then
         countdat :=   currdate
                     - EXP.expdate;
        
         FOR res IN c_res
         LOOP
            IF  (countdat >= res.bdcount) AND (countdat <= res.edcount)
            THEN
               crdpercent := res.PERCENT;
               EXIT;
            END IF;
         END LOOP;

         SELECT ostat
           INTO currencyostat
           FROM sb_temprate
          WHERE val_kod = port.currency;

         SELECT PERCENT
           INTO crdoldpercent
           FROM cm_reserve_types
          WHERE id = rests.reserveid;

         tramount :=   cm_utils.calcpercent (
                          p_sum => rests.rest,
                          p_rate=> (  crdpercent
                                    - crdoldpercent
                                   ),
                          p_coefficient=> 1,
                          p_delimmer=> 1
                       )
                     * currencyostat;
         tramount := ROUND (tramount, 2);
         /*-----------------First Transaction-----------------*/
         debitaccid :=
               cm_utils.lnkreserveaccount (
                  p_custcategory=> port.customertype,
                  p_crdcurrency=> port.currency,
                  p_bankid=> port.branchid
               );
         creditaccid := accounts.primaryreserveaccid;

         IF  (tramount IS NOT NULL) AND (tramount <> 0)
         THEN
            firsttrid :=
                  cm_transactionmgr.sbaddtransaction (
                     p_trid=> NULL,
                     p_debitid=> debitaccid,
                     p_creditid=> creditaccid,
                     p_debitamount=> tramount,
                     p_creditamount=> NULL,
                     p_lamount=> NULL,
                     p_trname=>    'Ещтийатын йенилянмяси-MY '
                                || port.numberofcredit,
                     p_flags=> sb_decls.atfcommitimmediate,
                     p_transactiondate=> currdate,
                     p_operationtype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL
                  );

            UPDATE cm_curr_state
               SET reserveid = (SELECT id
                                  FROM cm_reserve_types
                                 WHERE PERCENT = crdpercent);
         END IF;
         END IF;
         COMMIT;
      END LOOP;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AUTOEXP

-- Start of DDL Script for Package CREDITSMGR.CM_CALCINOUTBALANCE
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_calcinoutbalance
IS
   PROCEDURE acceptcalcedprecentinob (p_creditid IN INTEGER);

   PROCEDURE calcprecents (
      p_creditid     IN   INTEGER,
      p_date         IN   DATE,
      p_endofmonth   IN   BOOLEAN
   );

   PROCEDURE cancelcalculation (p_creditid IN INTEGER);
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_calcinoutbalance
IS
   PROCEDURE calcprecents (
      p_creditid     IN   INTEGER,
      p_date         IN   DATE,
      p_endofmonth   IN   BOOLEAN
   )
   IS
      CURSOR c_crdcurrstate (crdid IN INTEGER)
      IS
         SELECT rest, duerest, interestrest, dueinterestrest, stopcalcdate,
                lastcalcdate
           FROM cm_curr_state
          WHERE creditid = crdid;

      CURSOR c_crdprevstate (crdid IN INTEGER)
      IS
         SELECT rest, duerest, interestrest, dueinterestrest
           FROM cm_prev_state
          WHERE creditid = crdid;

      CURSOR c_crdinfo (crdid IN INTEGER)
      IS
         SELECT annualyinterestrate, annualyoverduerate, annualypenaltyrate,
                duedatefirstcontract
           FROM cm_active_credits
          WHERE id = crdid;

      CURSOR c_interest_cache (crdid IN INTEGER)
      IS
         SELECT trprocessed, intprecision, dueintprecision
           FROM cm_int_currstate
          WHERE creditid = crdid;

      CURSOR c_prolong (crdid IN INTEGER)
      IS
         SELECT newclosedate
           FROM cm_prolongations
          WHERE creditid = crdid;

      crdcurrstate          c_crdcurrstate%ROWTYPE;
      crdprevstate          c_crdprevstate%ROWTYPE;
      portfinfo             c_crdinfo%ROWTYPE;
      intcache              c_interest_cache%ROWTYPE;
      prolonginfo           c_prolong%ROWTYPE;
      crdcurrrest           NUMBER;
      crdcurrduerest        NUMBER;
      crdcurrstopcalcdate   DATE;
      crdprevrest           NUMBER;
      crdprevduerest        NUMBER;
      calcedinterest        NUMBER;
      calceddueinterest     NUMBER;
      debitaccid            INTEGER;
      creditaccid           INTEGER;
      bankcurrdate          DATE;
      bankprevdate          DATE;
      duedateofcont         DATE;
      dateinterval          INTEGER;
      calcdisabled          BOOLEAN;
      trsprocessed          BOOLEAN;
      annintrate            NUMBER;
      annointrate           NUMBER;
      annpenrate            NUMBER;
      countdate             NUMBER;
      intprec               NUMBER;
      dueintprec            NUMBER;
   BEGIN
      OPEN c_interest_cache (p_creditid);
      FETCH c_interest_cache INTO intcache;
      trsprocessed := intcache.trprocessed = cm_decls.csaccepted;
      intprec := intcache.intprecision;
      dueintprec := intcache.dueintprecision;
      CLOSE c_interest_cache;

      IF trsprocessed
      THEN
         cm_utils.processerror (0); ---TODO   
      END IF;

      -- Current State  
      OPEN c_crdcurrstate (p_creditid);
      FETCH c_crdcurrstate INTO crdcurrstate;
      crdcurrrest := crdcurrstate.rest;
      crdcurrduerest := crdcurrstate.duerest;
      crdcurrstopcalcdate := crdcurrstate.stopcalcdate;
      CLOSE c_crdcurrstate;
      calcdisabled := crdcurrstopcalcdate IS NOT NULL;

      /*IF calcdisabled
      THEN
         cm_utils.processerror (0); ---TODO
      END IF;

      IF crdcurrstate.lastcalcdate >= p_date
      THEN
         cm_utils.processerror (1); ---TODO  NEW
      END IF;*/

      -- Previus State
      OPEN c_crdprevstate (p_creditid);
      FETCH c_crdprevstate INTO crdprevstate;
      crdprevrest := crdprevstate.rest;
      crdprevduerest := crdprevstate.duerest;
      CLOSE c_crdprevstate;
      OPEN c_crdinfo (p_creditid);
      FETCH c_crdinfo INTO portfinfo;
      annintrate := portfinfo.annualyinterestrate;
      annointrate := portfinfo.annualyoverduerate;
      annpenrate := portfinfo.annualypenaltyrate;
      duedateofcont := portfinfo.duedatefirstcontract;
      CLOSE c_crdinfo;

      SELECT tek_dat, pred_dat
        INTO bankcurrdate, bankprevdate
        FROM sb_sysdat;

     /* OPEN c_prolong (p_creditid);
      FETCH c_prolong INTO prolonginfo;
      CLOSE c_prolong;

      IF prolonginfo.newclosedate IS NULL
      THEN
         countdate :=   bankcurrdate
                      - duedateofcont;
      ELSE
         countdate :=   bankcurrdate
                      - prolonginfo.newclosedate;
      END IF;

      IF countdate >= 90
      THEN
         raise_application_error (-20007, 'Dedimmi Ceyran xanim');
      END IF;*/

      dateinterval := cm_utils.bankdaysbetween (
                         firstdate=> bankprevdate,
                         lastdate=>   bankcurrdate
                                    - 1
                      );
      calcedinterest :=
              cm_utils.calcpercent (
                 p_sum => crdprevrest,
                 p_rate=> annintrate,
                 p_coefficient=> dateinterval
              )
            + cm_utils.calcpercent (
                 p_sum => crdcurrrest,
                 p_rate=> annintrate,
                 p_coefficient=> cm_utils.bankdaysbetween (
                             firstdate=>   bankcurrdate
                                         - 1,
                             lastdate=> p_date
                          )
              )
            + intprec;

      UPDATE cm_int_currstate
         SET interest = calcedinterest,
             dueinterest = 0,
             trprocessed = cm_decls.cscalculated
       WHERE creditid = p_creditid;

      UPDATE cm_curr_state
         SET lastcalcdate = p_date
       WHERE creditid = p_creditid;

     /* COMMIT WORK;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;*/
   END;

   PROCEDURE acceptcalcedprecentinob (p_creditid IN INTEGER)
   IS
      CURSOR c_accounts (crdid IN INTEGER)
      IS
         SELECT outinterestaccid
           FROM cm_accounts
          WHERE creditid = crdid;

      CURSOR c_port (crdid IN INTEGER)
      IS
         SELECT numberofcredit, currency, customertype, branchid
           FROM cm_active_credits
          WHERE id = crdid;

      CURSOR c_calcedpercent (crdid IN INTEGER)
      IS
         SELECT interest, trprocessed
           FROM cm_int_currstate
          WHERE creditid = crdid;

      accountsinfo        c_accounts%ROWTYPE;
      portinfo            c_port%ROWTYPE;
      calcedpercentinfo   c_calcedpercent%ROWTYPE;
      intaccid            INTEGER;
      dueintaccid         INTEGER;
      invaccid            INTEGER;
      trdescription       VARCHAR2 (255);
      crdcurrency         INTEGER;
      crdcusttype         INTEGER;
      crdbranchid         INTEGER;
      crdno               VARCHAR2 (255);
      bankcurrdate        DATE;
      interestamt         NUMBER;
      dueinterestamt      NUMBER;
      trprocessed         INTEGER;
      tempinttrid         INTEGER;
      tempdueinttrid      INTEGER;
      commitflag          INTEGER;
      inttramt            NUMBER (18, 2);
      dueinttramt         NUMBER (18, 2);
   BEGIN
      OPEN c_calcedpercent (p_creditid);
      FETCH c_calcedpercent INTO calcedpercentinfo;
      interestamt := calcedpercentinfo.interest;
      trprocessed := calcedpercentinfo.trprocessed;
      CLOSE c_calcedpercent;

      IF trprocessed <> cm_decls.cscalculated
      THEN
         cm_utils.processerror (0); -- TODO
      END IF;

      IF   interestamt
         + dueinterestamt <= 0
      THEN
         cm_utils.processerror (0); -- TODO
      END IF;

      OPEN c_port (p_creditid);
      FETCH c_port INTO portinfo;
      crdcurrency := portinfo.currency;
      crdcusttype := portinfo.customertype;
      crdbranchid := portinfo.branchid;
      crdno := portinfo.numberofcredit;
      CLOSE c_port;
      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accountsinfo;
      intaccid := accountsinfo.outinterestaccid;
      CLOSE c_accounts;
      invaccid :=
            cm_utils.inkoutinvinterestaccount (
               p_custcategory=> crdcusttype,
               p_crdcurrency=> crdcurrency,
               p_bankid=> crdbranchid
            );

      SELECT tek_dat
        INTO bankcurrdate
        FROM sb_sysdat;

      trdescription := cm_utils.trdescinterestrecalc;
      trdescription := REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (bankcurrdate, 'DD/MM/YYYY')
                       );
      inttramt := cm_utils.precision2 (interestamt);
      dueinttramt := cm_utils.precision2 (dueinterestamt);

      IF inttramt > 0
      THEN
         tempinttrid :=
               cm_transactionmgr.sboutaddtransaction (
                  p_trid=> NULL,
                  p_debitid=> intaccid,
                  p_creditid=> invaccid,
                  p_debitamount=> inttramt,
                  p_creditamount=> NULL,
                  p_lamount=> NULL,
                  p_trname=> trdescription,
                  p_flags=> sb_decls.atfcommitimmediate,
                  p_transactiondate=> bankcurrdate,
                  p_operationtype=> cm_decls.cmtransactionoptype,
                  p_inbalancechar=> NULL
               );
      END IF;

      UPDATE cm_int_currstate
         SET trprocessed = cm_decls.csaccepted,
             intprecision = cm_utils.precision7 (interestamt),
             inttrid = tempinttrid
       WHERE creditid = p_creditid;

      UPDATE cm_curr_state
         SET interestrest =   interestrest
                            + inttramt
       WHERE creditid = p_creditid;

      COMMIT WORK;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;

   PROCEDURE cancelcalculation (p_creditid IN INTEGER)
   IS
      CURSOR c_intcurrinfo (crdid IN INTEGER)
      IS
         SELECT trprocessed, inttrid, interest
           FROM cm_int_currstate
          WHERE creditid = crdid;

      CURSOR c_intprevinfo (crdid IN INTEGER)
      IS
         SELECT intprecision
           FROM cm_int_prevstate
          WHERE creditid = crdid;

      CURSOR c_crdprevinfo (crdid IN INTEGER)
      IS
         SELECT lastcalcdate
           FROM cm_prev_state
          WHERE creditid = crdid;

      intcurrinforec   c_intcurrinfo%ROWTYPE;
      intprevinforec   c_intprevinfo%ROWTYPE;
      crdprevinfo      c_crdprevinfo%ROWTYPE;
      inttrid          INTEGER;
      dueinttrid       INTEGER;
      trprocessed      INTEGER;
      intdec           NUMBER;
      dueintdec        NUMBER;
      intprec          NUMBER;
      dueintprec       NUMBER;
      result           INTEGER;
   BEGIN
      OPEN c_intcurrinfo (p_creditid);
      FETCH c_intcurrinfo INTO intcurrinforec;
      inttrid := intcurrinforec.inttrid;
      trprocessed := intcurrinforec.trprocessed;
      intdec := intcurrinforec.interest;
      CLOSE c_intcurrinfo;
      OPEN c_intprevinfo (p_creditid);
      FETCH c_intprevinfo INTO intprevinforec;
      intprec := intprevinforec.intprecision;
      CLOSE c_intprevinfo;
      OPEN c_crdprevinfo (p_creditid);
      FETCH c_crdprevinfo INTO crdprevinfo;
      CLOSE c_crdprevinfo;

      IF trprocessed = cm_decls.csaccepted
      THEN
         IF      (inttrid IS NOT NULL)
             AND cm_transactionmgr.transactionexist (inttrid, FALSE)
         THEN
            result := cm_transactionmgr.sboutdeletetransaction (inttrid);
         END IF;

         UPDATE cm_curr_state
            SET interestrest =   interestrest
                               - intdec
          WHERE creditid = p_creditid;
      END IF;

      UPDATE cm_int_currstate
         SET inttrid = NULL,
             dueinttrid = NULL,
             interest = 0,
             dueinterest = 0,
             trprocessed = cm_decls.csnotcalculated,
             intprecision = intprec,
             dueintprecision = dueintprec
       WHERE creditid = p_creditid;

      UPDATE cm_curr_state
         SET lastcalcdate = crdprevinfo.lastcalcdate
       WHERE creditid = p_creditid; -- // New

      COMMIT WORK;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CALCINOUTBALANCE

-- Start of DDL Script for Package CREDITSMGR.CM_CALCSETTINGS
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_calcsettings
IS
   FUNCTION checkcardfixedday (p_creditid IN INTEGER)
      RETURN BOOLEAN;

   FUNCTION checkothercredits (p_creditid IN INTEGER)
      RETURN BOOLEAN;

   PROCEDURE calcothercredits (
      p_creditid     IN       INTEGER,
      p_date         IN       DATE,
      p_calcedint    OUT      NUMBER,
      p_calcpenint   OUT      NUMBER
   );

   FUNCTION checkcardcredits (p_creditid IN INTEGER)
      RETURN BOOLEAN;

   FUNCTION get_periodint (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_lasttranchedate (p_creditid IN INTEGER, p_tramt OUT NUMBER)
      RETURN DATE;
  function CalcAllCardCredits(p_creditid in integer,p_date in date)
    return number;
  FUNCTION getcardID (p_creditid IN INTEGER)
      RETURN integer;
  function Get_CartCalcMethod(p_Creditid in integer)
    return varchar2;
  function Get_FirstTrancheDate(p_creditid in integer)
   return date;
  function IsFixedDayCard(P_CardID in integer)
   return boolean;
  function Get_FixedDay(p_creditid in integer)
   return date;
  FUNCTION calcgonextperiod (p_creditid IN INTEGER)
      RETURN NUMBER;
  FUNCTION calccardcredits (p_creditid IN INTEGER)
      RETURN NUMBER;
  FUNCTION calcforgrantdateandlastint (p_creditid IN INTEGER)
      RETURN NUMBER;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_calcsettings
IS
   FUNCTION checkplancredits (p_creditid IN INTEGER)
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;
   BEGIN
      RESULT :=
             cm_utils.get_crdcalcmethod (p_creditid) =
                                                      'CalcMethodForPlanRest';
      RETURN RESULT;
   END;

   FUNCTION checkcardcredits (p_creditid IN INTEGER)
      RETURN BOOLEAN
   IS
      CURSOR c_cardcredits
      IS
         SELECT categoryid
           FROM cm_calc_cardcustsettings
          WHERE categoryid = (SELECT customertype
                                FROM cm_portfolio
                               WHERE ID = p_creditid);

      cardcredits   c_cardcredits%ROWTYPE;
      RESULT        BOOLEAN;
   BEGIN
      OPEN c_cardcredits;
      FETCH c_cardcredits INTO cardcredits;
      RESULT := c_cardcredits%FOUND;
      CLOSE c_cardcredits;
      RETURN RESULT;
   END;

   FUNCTION getcardid (p_creditid IN INTEGER)
      RETURN INTEGER
   IS
      CURSOR c_cardcredits
      IS
         SELECT cardid
           FROM cm_calc_cardcustsettings
          WHERE categoryid = (SELECT customertype
                                FROM cm_portfolio
                               WHERE ID = p_creditid);

      cardcredits   c_cardcredits%ROWTYPE;
      RESULT        INTEGER;
   BEGIN
      OPEN c_cardcredits;
      FETCH c_cardcredits INTO cardcredits;
      RESULT := cardcredits.cardid;
      CLOSE c_cardcredits;
      RETURN RESULT;
   END;

   FUNCTION checkothercredits (p_creditid IN INTEGER)
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;
   BEGIN
      RESULT := checkplancredits (p_creditid)
                OR checkcardcredits (p_creditid);
      RETURN RESULT;
   END;

   FUNCTION calccardcredits (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT          NUMBER                    := 0;

      CURSOR c_cardtranches
      IS
         SELECT tranchedate, trancheamount
           FROM cm_tranches
          WHERE creditid = p_creditid;

      CURSOR c_cardtrmaxdat
      IS
         SELECT MAX (tranchedate) AS c_maxtrdat,
                MIN (tranchedate) AS c_mintrdat
           FROM cm_tranches
          WHERE creditid = p_creditid;

      CURSOR c_cardspayments
      IS
         SELECT SUM (payedamt) AS payamt
           FROM cm_payments
          WHERE creditid = p_creditid;

      CURSOR c_cardsetting
      IS
         SELECT beginperiod, endperiod, annualintrate, fixedday
           FROM cm_calc_cardsettings
          WHERE cardid = (SELECT cardid
                            FROM cm_calc_cardcustsettings
                           WHERE categoryid = (SELECT customertype
                                                 FROM cm_portfolio
                                                WHERE ID = p_creditid));

      cardsetting     c_cardsetting%ROWTYPE;
      cardspayments   c_cardspayments%ROWTYPE;
      cardtrmaxdat    c_cardtrmaxdat%ROWTYPE;
      calcfamt        NUMBER                    := 0;
      calcsamt        NUMBER                    := 0;
      sumpay          NUMBER                    := 0;
      tranchamt       NUMBER;
      annint          NUMBER;
      temp            NUMBER                    := 0;
      temppay         NUMBER                    := 0;
      tempcalc        NUMBER                    := 0;
      maxtrdat        DATE;
      mintrdat        DATE;
      tekdat          DATE;
      preddat         DATE;
      coefficient     NUMBER;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO tekdat, preddat
        FROM sb_sysdat;

      OPEN c_cardspayments;
      FETCH c_cardspayments INTO sumpay;
      CLOSE c_cardspayments;
      OPEN c_cardtrmaxdat;
      FETCH c_cardtrmaxdat INTO cardtrmaxdat;
      CLOSE c_cardtrmaxdat;
      maxtrdat := cardtrmaxdat.c_maxtrdat;
      mintrdat := cardtrmaxdat.c_mintrdat;
      coefficient := 1;
      temppay := NVL (sumpay, 0);

      IF NOT checkcardfixedday (p_creditid)
      THEN --Main
      raise_application_error(-20007,'Salam1');
         FOR cardtranches IN c_cardtranches
         LOOP
            IF cardtranches.tranchedate = maxtrdat
            THEN
               coefficient :=
                  cm_utils.bankdaysbetween (firstdate      => preddat,
                                            lastdate       => tekdat
                                           );
            END IF;

            tranchamt := cardtranches.trancheamount;
            temp := tranchamt - temppay;

            IF temp > 0
            THEN --M
               calcfamt := calcfamt + temp;
               RESULT :=
                  cm_utils.calcpercent (p_sum              => calcfamt,
                                        p_rate             => get_periodint (p_creditid,
                                                                             cardtranches.tranchedate
                                                                            ),
                                        p_coefficient      => coefficient
                                       );
               temppay := 0;
            ELSE
               temppay := ABS (temp);
            END IF; --M   
         END LOOP;
      END IF; --Main

      RETURN RESULT;
   END;

/*---------------------------->> CalcForGrantDateAndLastPeriodInt>>--------------------------*/
   FUNCTION calcgonextperiod (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT             NUMBER;

      CURSOR c_credittranches (p_dat IN DATE)
      IS
         SELECT   tranchedate, trancheamount
             FROM cm_tranches
            WHERE creditid = p_creditid AND tranchedate >= p_dat
         ORDER BY tranchedate;

      CURSOR c_creditmaxtranches
      IS
         SELECT MAX (tranchedate) AS maxtrdat
           FROM cm_tranches
          WHERE creditid = p_creditid;

      CURSOR c_crdlastmintrdat (p_dat IN DATE)
      IS
         SELECT MIN (tranchedate) AS lasttrdat
           FROM cm_tranches
          WHERE creditid = p_creditid AND tranchedate > p_dat;

      crdlastmintrdat    c_crdlastmintrdat%ROWTYPE;
      currdate           DATE;
      lasttranchedate    DATE;
      lasttramt          NUMBER;
      prevdate           DATE;
      calcdate           DATE;
      maxtrdat           DATE;
      dateinterval       INTEGER;
      calcamt            NUMBER                      := 0;
      currentannualint   NUMBER;
      crdintrest         NUMBER;
      sumtr              NUMBER;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO currdate, prevdate
        FROM sb_sysdat;

      SELECT interestrest
        INTO crdintrest
        FROM cm_curr_state
       WHERE creditid = p_creditid;

      OPEN c_creditmaxtranches;
      FETCH c_creditmaxtranches INTO maxtrdat;
      CLOSE c_creditmaxtranches;
      calcdate := cm_calcsettings.get_lasttranchedate (p_creditid, sumtr);
      currentannualint := cm_calcsettings.get_periodint (p_creditid, currdate);

      FOR credittranches IN c_credittranches (calcdate)
      LOOP
         IF credittranches.tranchedate <> maxtrdat
         THEN
            OPEN c_crdlastmintrdat (calcdate);
            FETCH c_crdlastmintrdat INTO crdlastmintrdat;
            lasttranchedate := crdlastmintrdat.lasttrdat;

            IF lasttranchedate IS NOT NULL
            THEN
               SELECT trancheamount
                 INTO lasttramt
                 FROM cm_tranches
                WHERE creditid = p_creditid AND tranchedate = lasttranchedate;
            END IF;

            CLOSE c_crdlastmintrdat;
            dateinterval :=
                          cm_utils.bankdaysbetween (calcdate, lasttranchedate);
            calcamt :=
                  calcamt
                + cm_utils.calcpercent (p_sum              => sumtr,
                                        p_rate             => currentannualint,
                                        p_coefficient      => dateinterval
                                       );
         ELSE
            dateinterval := cm_utils.bankdaysbetween (maxtrdat, currdate);
            calcamt :=
                  calcamt
                + cm_utils.calcpercent (p_sum              => sumtr,
                                        p_rate             => currentannualint,
                                        p_coefficient      => dateinterval
                                       );
            DBMS_OUTPUT.put_line (' sumtr =  ' || sumtr);
         END IF;

         sumtr := sumtr + lasttramt;
         calcdate := lasttranchedate;
      END LOOP;

      -- if calcamt is null
      RETURN ABS (calcamt - crdintrest);
   END;

   FUNCTION get_periodint (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT                NUMBER;

      CURSOR c_cardsetting (p_period IN INTEGER)
      IS
         SELECT annualintrate
           FROM cm_calc_cardsettings
          WHERE cardid = (SELECT cardid
                            FROM cm_calc_cardcustsettings
                           WHERE categoryid = (SELECT customertype
                                                 FROM cm_portfolio
                                                WHERE ID = p_creditid))
            AND p_period BETWEEN beginperiod AND endperiod;

      CURSOR c_fixedcardsetting (p_period IN INTEGER)
      IS
         SELECT annualintrate
           FROM cm_calc_cardsettings
          WHERE cardid = 10
            AND ID > (SELECT MIN (ID)
                        FROM cm_calc_cardsettings
                       WHERE NVL (fixedday, 0) = 0)
            AND p_period BETWEEN beginperiod AND endperiod;

      CURSOR c_fixednextperiod
      IS
         SELECT annualintrate, endperiod
           FROM cm_calc_cardsettings
          WHERE cardid = getcardid (p_creditid)
            AND ID = (SELECT MIN (ID)
                        FROM cm_calc_cardsettings
                       WHERE NVL (fixedday, 0) <= 0);

      lasttrdate            DATE;
      lasttramt             NUMBER;
      period                INTEGER;
      endfixedfirstperiod   NUMBER;
      endfixedsecperiod     NUMBER;
      fixednextperiod       c_fixednextperiod%ROWTYPE;
   BEGIN
      lasttrdate := get_lasttranchedate (p_creditid, lasttramt);
      period := cm_utils.bankdaysbetween (lasttrdate, p_date);
      endfixedfirstperiod := get_fixedday (p_creditid) - lasttrdate;
      OPEN c_cardsetting (period);
      FETCH c_cardsetting INTO RESULT;
      CLOSE c_cardsetting;

      IF isfixeddaycard (getcardid (p_creditid))
      THEN --Main
         IF endfixedfirstperiod > 0
         THEN --1
            OPEN c_fixednextperiod;
            FETCH c_fixednextperiod INTO fixednextperiod;
            CLOSE c_fixednextperiod;
            endfixedsecperiod := fixednextperiod.endperiod;

            IF period BETWEEN endfixedfirstperiod AND endfixedsecperiod
            THEN
               RESULT := fixednextperiod.annualintrate;
            END IF;
         ELSE
            OPEN c_fixedcardsetting (period);
            FETCH c_fixedcardsetting INTO RESULT;
            CLOSE c_fixedcardsetting;
         END IF; --1   
      END IF; --Main

      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_firsttranchedate (p_creditid IN INTEGER)
      RETURN DATE
   IS
      RESULT   DATE;

      CURSOR c_tr
      IS
         SELECT MIN (tranchedate) AS trdate
           FROM cm_tranches
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN RESULT;
   END;

   FUNCTION get_fixedday (p_creditid IN INTEGER)
      RETURN DATE
   IS
      RESULT   DATE;

      CURSOR c_cardsetting
      IS
         SELECT fixedday
           FROM cm_calc_cardsettings
          WHERE cardid = (SELECT cardid
                            FROM cm_calc_cardcustsettings
                           WHERE categoryid = (SELECT customertype
                                                 FROM cm_portfolio
                                                WHERE ID = p_creditid))
            AND fixedday IS NOT NULL;

      trdat    DATE;
      YEAR     VARCHAR2 (5);
      mon      VARCHAR2 (5);
      DAY      VARCHAR2 (5);
      fday     INTEGER;
   BEGIN
      OPEN c_cardsetting;
      FETCH c_cardsetting INTO fday;
      CLOSE c_cardsetting;
      DAY := TO_CHAR (fday);
      trdat := ADD_MONTHS (get_firsttranchedate (p_creditid), 1);
      YEAR := TO_CHAR (trdat, 'YYYY');
      mon := TO_CHAR (trdat, 'MON');
      RESULT := TO_DATE (DAY || '-' || mon || '-' || YEAR);
      RETURN RESULT;
   END;

   FUNCTION get_endfixedcardfirstperiod (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      RESULT := get_fixedday (p_creditid) - get_firsttranchedate (p_creditid);
      RETURN RESULT;
   END;

   FUNCTION get_lasttranchedate (p_creditid IN INTEGER, p_tramt OUT NUMBER)
      RETURN DATE
   IS
      RESULT          DATE;

      CURSOR c_cardtranches
      IS
         SELECT   tranchedate, trancheamount
             FROM cm_tranches
            WHERE creditid = p_creditid
         ORDER BY tranchedate;

      CURSOR c_cardspayments
      IS
         SELECT SUM (payedamt) AS payamt
           FROM cm_payments
          WHERE creditid = p_creditid;

      cardspayments   c_cardspayments%ROWTYPE;
      sumpay          NUMBER                    := 0;
      tranchamt       NUMBER;
      annint          NUMBER;
      temp            NUMBER                    := 0;
      temppay         NUMBER                    := 0;
      tempcalc        NUMBER                    := 0;
      tekdat          DATE;
      preddat         DATE;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO tekdat, preddat
        FROM sb_sysdat;

      OPEN c_cardspayments;
      FETCH c_cardspayments INTO sumpay;
      CLOSE c_cardspayments;
      temppay := NVL (sumpay, 0);

      FOR cardtranches IN c_cardtranches
      LOOP
         tranchamt := cardtranches.trancheamount;
         temp := tranchamt - temppay;

         IF temp > 0
         THEN
            temppay := 0;
            RESULT := cardtranches.tranchedate;
            p_tramt := temp;
            EXIT;
         ELSE
            temppay := ABS (temp);
         END IF;
      END LOOP;

      RETURN RESULT;
   END;

   FUNCTION calcforgrantdateandlastint (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT    NUMBER := 0;
      currdat   DATE;
      prevdat   DATE;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO currdat, prevdat
        FROM sb_sysdat;

      IF get_periodint (p_creditid, currdat) <>
                                           get_periodint (p_creditid, prevdat)
                                           
      THEN
          
         RESULT := calcgonextperiod (p_creditid);
      ELSE
      
         RESULT := calccardcredits (p_creditid);
      END IF;

      RETURN RESULT;
   END;

/*---------------------------->> CalcForGrantDateAndLastPeriodInt>>--------------------------*/
   FUNCTION get_nextfixedday (firsttrancheday IN DATE, fixedday IN NUMBER)
      RETURN BOOLEAN
   IS
      RESULT    BOOLEAN;
      realday   NUMBER;
   BEGIN
      realday := TO_NUMBER (TO_CHAR (ADD_MONTHS (firsttrancheday, 1), 'DD'));
      RESULT := fixedday >= NVL (realday, 0);
      RETURN RESULT;
   END;

   FUNCTION checkcardfixedday (p_creditid IN INTEGER)
      RETURN BOOLEAN
   IS
      RESULT        BOOLEAN                 := TRUE;

      CURSOR c_cardsetting
      IS
         SELECT fixedday
           FROM cm_calc_cardsettings
          WHERE cardid = (SELECT cardid
                            FROM cm_calc_cardcustsettings
                           WHERE categoryid = (SELECT customertype
                                                 FROM cm_portfolio
                                                WHERE ID = p_creditid))
            AND fixedday IS NOT NULL;

      CURSOR c_tr
      IS
         SELECT MIN (tranchedate)
           FROM cm_tranches
          WHERE creditid = p_creditid;

      cardsetting   c_cardsetting%ROWTYPE;
      trdat         DATE;
      checkfday     BOOLEAN;
   BEGIN
      OPEN c_cardsetting;
      FETCH c_cardsetting INTO cardsetting;
      checkfday := c_cardsetting%FOUND;
      CLOSE c_cardsetting;

      IF checkfday
      THEN
         OPEN c_tr;
         FETCH c_tr INTO trdat;
         CLOSE c_tr;
         RESULT := get_nextfixedday (trdat, cardsetting.fixedday);
      END IF;

      RETURN RESULT;
   END;

   FUNCTION isfixeddaycard (p_cardid IN INTEGER)
      RETURN BOOLEAN
   IS
      CURSOR c_cardsetting
      IS
         SELECT fixedday
           FROM cm_calc_cardsettings
          WHERE cardid = p_cardid AND fixedday IS NOT NULL;

      RESULT        BOOLEAN;
      cardsetting   c_cardsetting%ROWTYPE;
   BEGIN
      OPEN c_cardsetting;
      FETCH c_cardsetting INTO cardsetting;
      RESULT := c_cardsetting%FOUND;
      CLOSE c_cardsetting;
      RETURN RESULT;
   END;

   PROCEDURE calcplancredits (
      p_creditid     IN       INTEGER,
      p_date         IN       DATE,
      p_calcedint    OUT      NUMBER,
      p_calcpenint   OUT      NUMBER
   )
   IS
      CURSOR c_port
      IS
         SELECT annualyinterestrate, annualypenaltyrate
           FROM cm_portfolio
          WHERE ID = p_creditid;

      CURSOR c_crdcurrstate
      IS
         SELECT rest, lastcalcdate
           FROM cm_curr_state
          WHERE creditid = p_creditid;

      CURSOR c_interest_cache (crdid IN INTEGER)
      IS
         SELECT trprocessed, intprecision, dueintprecision, penaltyprecision
           FROM cm_int_currstate
          WHERE creditid = p_creditid;

      port               c_port%ROWTYPE;
      crdcurrstate       c_crdcurrstate%ROWTYPE;
      intcache           c_interest_cache%ROWTYPE;
      crdcurrrest        NUMBER;
      annintrate         NUMBER;
      bankcurrdate       DATE;
      bankprevdate       DATE;
      dateinterval       NUMBER;
      facticalcalcrate   NUMBER;
      cper2n             NUMBER;
      intprec            NUMBER;
      penintprec         NUMBER;
      ceofpen            NUMBER;
      cper1n             NUMBER;
      annpenrate         NUMBER;
      trsprocessed       BOOLEAN;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO bankcurrdate, bankprevdate
        FROM sb_sysdat;

      dateinterval :=
         cm_utils.bankdaysbetween (firstdate      => bankprevdate,
                                   lastdate       => bankcurrdate - 1
                                  );
      OPEN c_interest_cache (p_creditid);
      FETCH c_interest_cache INTO intcache;
      trsprocessed := intcache.trprocessed = cm_decls.csaccepted;
      intprec := intcache.intprecision;
      penintprec := intcache.penaltyprecision;
      CLOSE c_interest_cache;

      IF trsprocessed
      THEN
         cm_utils.processerror (0); ---TODO   
      END IF;

      OPEN c_port;
      FETCH c_port INTO port;
      CLOSE c_port;
      annintrate := port.annualyinterestrate;
      annpenrate := port.annualypenaltyrate;
      OPEN c_crdcurrstate;
      FETCH c_crdcurrstate INTO crdcurrstate;
      CLOSE c_crdcurrstate;
      crdcurrrest := crdcurrstate.rest;

      IF crdcurrstate.lastcalcdate >= p_date
      THEN
         cm_utils.processerror (1); ---TODO  NEW
      END IF;

      IF crdcurrrest = 0
      THEN
         cm_utils.processerror (1); ---TODO  NEW
      END IF;

      facticalcalcrate := cm_utils.get_facticalcalcrate1 (p_creditid, p_date);
      cper2n :=
            cm_utils.calcpercent (p_sum              => facticalcalcrate,
                                  p_rate             => annintrate,
                                  p_coefficient      => dateinterval
                                 )
          + cm_utils.calcpercent (p_sum              => facticalcalcrate,
                                  p_rate             => annintrate,
                                  p_coefficient      => cm_utils.bankdaysbetween (firstdate      =>   bankcurrdate
                                                                                                    - 1,
                                                                                  lastdate       => p_date --BankCurrDate // New
                                                                                 )
                                 )
          + intprec;

      IF     ABS (facticalcalcrate - crdcurrrest) >= 2
         AND (cm_utils.get_creditplandate (p_creditid, p_date) >= 1)
      THEN
         IF dateinterval = 0
         THEN
            ceofpen := 1;
         ELSE
            ceofpen := dateinterval;
         END IF;

         cper1n :=
            cm_utils.calcpercent (p_sum              => cm_utils.get_fullpayment (p_creditid,
                                                                                  p_date
                                                                                 ),
                                  p_rate             => annpenrate,
                                  p_coefficient      => ceofpen,
                                  p_delimmer         => 1
                                 );
      END IF;

      p_calcedint := cper2n + intprec;
      p_calcpenint := cper1n + penintprec;
   END;

   PROCEDURE calcothercredits (
      p_creditid     IN       INTEGER,
      p_date         IN       DATE,
      p_calcedint    OUT      NUMBER,
      p_calcpenint   OUT      NUMBER
   )
   IS
   BEGIN
      IF checkcardcredits (p_creditid)
      THEN
         p_calcedint := calcallcardcredits (p_creditid, p_date);
      ELSE
         IF checkplancredits (p_creditid)
         THEN
            calcplancredits (p_creditid, p_date, p_calcedint, p_calcpenint);
         END IF;
      END IF;
   END;

   /*----------------------------->> Common Operations >>------------------------*/
   FUNCTION calcallcardcredits (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      IF get_cartcalcmethod (p_creditid) = 'CalcForGrantDateAndLastPeriodInt'
      THEN
         RESULT := calcforgrantdateandlastint (p_creditid);
      ELSE
         IF get_cartcalcmethod (p_creditid) = 'CalcForPeriodRestAndPeriodInt'
         THEN
            RESULT := calccardcredits (p_creditid);
         END IF;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_cartcalcmethod (p_creditid IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (50);
   BEGIN
      SELECT NAME
        INTO RESULT
        FROM cm_calc_cardmethods
       WHERE ID = (SELECT calcmethod
                     FROM cm_calc_cardsorts
                    WHERE ID = getcardid (p_creditid));

      RETURN RESULT;
   END;
/*----------------------------->> Common Operations >>------------------------*/
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CALCSETTINGS

-- Start of DDL Script for Package CREDITSMGR.CM_CALCULATOR
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_calculator
  IS

  procedure AcceptCalcedPercents(
             p_CreditID in integer
            );
  procedure CancelCalculation(
             p_CreditID in Integer
            );
  procedure CalcPercents(
             p_CreditID in Integer ,
             p_Date in Date ,
             p_EndOfMonth in Boolean default FALSE
            );
  procedure UpdateInterests(
            p_CreditID in Integer ,
            p_IntAmt in Number ,
            p_DueIntAmt in Number 
            );
  function defploutb_date(p_creditid in integer)
  return number;
  function CalcCreditCards(P_CreditID in integer)
  return number;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_calculator
IS
  procedure UpdateInterests(
            p_CreditID in Integer ,
            p_IntAmt in Number ,
            p_DueIntAmt in Number 
            )
  is
  begin
    update CM_CURR_STATE
       set
           INTERESTREST = INTERESTREST + p_IntAmt,
           DUEINTERESTREST = DUEINTERESTREST + p_DueIntAmt
     where CreditID = p_CreditID;       
  end;           
  
  procedure CalcPercents(
             p_CreditID in Integer ,
             p_Date in Date ,
             p_EndOfMonth in Boolean default FALSE
            )
  is
  
    cursor c_CrdCurrState(CrdID in Integer) is
    select REST ,
           DUEREST ,
           INTERESTREST ,
           DUEINTERESTREST ,
           STOPCALCDATE ,
           LASTCALCDATE 
      from CM_CURR_STATE
     where CreditID = CrdID;       
     
    cursor c_CrdPrevState(CrdID in Integer) is
    select REST ,
           DUEREST ,
           INTERESTREST ,
           DUEINTERESTREST 
      from CM_PREV_STATE
     where CreditID = CrdID;            
     
     cursor c_CrdInfo(CrdID in Integer) is
     select ANNUALYINTERESTRATE ,
            ANNUALYOVERDUERATE ,
            ANNUALYPENALTYRATE,
            credittype
       from CM_ACTIVE_CREDITS
      where ID = CrdID;
          
     cursor c_INTEREST_CACHE(CrdID in Integer) is
     select TRPROCESSED ,
            INTPRECISION ,
            DUEINTPRECISION     
       from CM_INT_CURRSTATE
      where CREDITID = CrdID;   
                 
                    
   CrdCurrState c_CrdCurrState%rowtype;
   CrdPrevState c_CrdPrevState%rowtype;
   PortfInfo c_CrdInfo%rowtype;
   IntCache c_INTEREST_CACHE%rowtype;
   
   CrdCurrRest Number;
   CrdCurrDueRest Number;
   CrdCurrStopCalcDate Date;
   
   CrdPrevRest Number;
   CrdPrevDueRest Number;
       
   CalcedInterest Number;
   CalcedDueInterest Number;
   CalcedPenaltyInterest number;
  
   DebitAccID Integer;
   CreditAccID Integer;
  
   BankCurrDate  Date;
   BankPrevDate  Date;
   DueDateOfCont Date;
   
   DateInterval Integer;
   
   CalcDisabled Boolean;
   TrsProcessed Boolean;
   
   AnnIntRate Number;
   AnnOIntRate Number;
   AnnPenRate Number;
   CountDate Number;
   
   IntPrec Number;
   DueIntPrec Number;
   
   CalcedInt number;
   CalcedPenInt number;
   
  begin

  
      select TEK_DAT,PRED_DAT 
      into BankCurrDate,BankPrevDate
      from SB_SYSDAT;

  
   open c_INTEREST_CACHE(p_CreditID);
   fetch c_INTEREST_CACHE into IntCache;
     TrsProcessed := IntCache.TRPROCESSED = CM_DECLS.csAccepted;
     IntPrec := IntCache.INTPRECISION;
     DueIntPrec := IntCache.DUEINTPRECISION;
   close c_INTEREST_CACHE; 
   
   if TrsProcessed then
      CM_UTILS.ProcessError(0);---TODO   
   end if; 

    open c_CrdCurrState(p_CreditID);
    fetch c_CrdCurrState into CrdCurrState;
        
      CrdCurrRest := CrdCurrState.Rest; 
      CrdCurrDueRest := CrdCurrState.DueRest;
      CrdCurrStopCalcDate := CrdCurrState.STOPCALCDATE;
              
    close c_CrdCurrState;
                  
    CalcDisabled := CrdCurrStopCalcDate is not null;
      
    if CalcDisabled then
      CM_UTILS.ProcessError(0);---TODO
    end if;                

    if CrdCurrState.LASTCALCDATE >= p_Date then
      CM_UTILS.ProcessError(1);---TODO  NEW
    end if;
               
    -- Previus State
    open c_CrdPrevState(p_CreditID);
    fetch c_CrdPrevState into CrdPrevState;
        
      CrdPrevRest := CrdPrevState.Rest; 
      CrdPrevDueRest := CrdPrevState.DueRest;
              
    close c_CrdPrevState;
    
    open c_CrdInfo(p_CreditID);
    fetch c_CrdInfo into PortfInfo;
      AnnIntRate := PortfInfo.ANNUALYINTERESTRATE;
      AnnOIntRate := PortfInfo.ANNUALYOVERDUERATE;
      AnnPenRate := PortfInfo.ANNUALYPENALTYRATE;  
    close c_CrdInfo;
    
    DateInterval := CM_UTILS.BankDaysBetween(
                              FirstDate => BankPrevDate,
                              LastDate => BankCurrDate - 1
                             );
    
    CalcedInterest :=CM_UTILS.CalcPercent(
                          p_Sum => CrdPrevRest,
                          p_Rate => AnnIntRate,
                          p_Coefficient => DateInterval
                         )
                   +
                   CM_UTILS.CalcPercent(
                          p_Sum => CrdCurrRest,
                          p_Rate => AnnIntRate,
                          p_Coefficient => 
                          CM_UTILS.BankDaysBetween(
                                   FirstDate => BankCurrDate - 1,
                                   LastDate => p_Date--BankCurrDate // New
                             )
                         )
                   +
                   IntPrec 
                   ;
                         
    CalcedDueInterest :=CM_UTILS.CalcPercent(
                              p_Sum => CrdPrevDueRest,
                              p_Rate => AnnOIntRate,
                              p_Coefficient => DateInterval
                             )
                       +
                       CM_UTILS.CalcPercent(
                              p_Sum => CrdCurrDueRest,
                              p_Rate => AnnOIntRate,
                              p_Coefficient =>   CM_UTILS.BankDaysBetween(
                              FirstDate => BankCurrDate - 1,
                              LastDate => p_Date --BankCurrDate //New
                             )
                             )
                       +
                       DueIntPrec       
                       ;

            
     if cm_calcsettings.checkothercredits(p_CreditID) then
        cm_calcsettings.calcothercredits(p_CreditID,p_date,CalcedInterest,CalcedPenaltyInterest);
         if CalcedInterest = 0 then
             Raise_application_error(-20007,'Error during Calculation CreditCards or PlanCredits ');
         end if;
     end if;        
                
                           
     update CM_INT_CURRSTATE
        set
            INTEREST = CalcedInterest ,
            DUEINTEREST = CalcedDueInterest ,
            PENALTYINTEREST = nvl(CalcedPenaltyInterest,0),
            TRPROCESSED = CM_DECLS.csCalculated
      where CreditID = p_CreditID;
    
    update CM_CURR_STATE -- // New
       set LASTCALCDATE = p_Date
     where CreditID = p_CreditID;  
    
     commit work;
                      
    /*exception when OTHERS then
    
    rollback work;
    
    raise;*/

  end;          
  
  procedure CancelCalculation(
             p_CreditID in Integer
            )
  is
  
    cursor c_IntCurrInfo(CrdID in Integer) is
    select TRPROCESSED ,
           INTTRID ,
           DUEINTTRID ,
           INTEREST ,
           DUEINTEREST
      from CM_INT_CURRSTATE
     where CreditID = CrdID;

    cursor c_IntPrevInfo(CrdID in Integer) is
    select INTPRECISION ,
           DUEINTPRECISION 
      from CM_INT_PREVSTATE
     where CreditID = CrdID;
    
    cursor c_CrdPrevInfo(CrdID in integer) is
    select LASTCALCDATE
      from CM_PREV_STATE
     where CreditID = CrdID; 
                
    IntCurrInfoRec c_IntCurrInfo%rowtype;
    IntPrevInfoRec c_IntPrevInfo%rowtype;
    CrdPrevInfo c_CrdPrevInfo%rowtype;
    
    IntTrID Integer;
    DueIntTrID Integer;
    TrProcessed Integer;
    IntDec Number;
    DueIntDec Number;
    
    IntPrec Number;   
    DueIntPrec Number;
    
    
         
    Result Integer;         
  begin
  
    open c_IntCurrInfo(p_CreditID);
    fetch c_IntCurrInfo into IntCurrInfoRec;
      IntTrID := IntCurrInfoRec.INTTRID;
      DueIntTrID := IntCurrInfoRec.DUEINTTRID;
      TrProcessed := IntCurrInfoRec.TRPROCESSED;
      IntDec := IntCurrInfoRec.INTEREST;
      DueIntDec := IntCurrInfoRec.DUEINTEREST;             
    close c_IntCurrInfo;

    open c_IntPrevInfo(p_CreditID);
    fetch c_IntPrevInfo into IntPrevInfoRec;
      IntPrec := IntPrevInfoRec.INTPRECISION;
      DueIntPrec := IntPrevInfoRec.DUEINTPRECISION;
    close c_IntPrevInfo;
    
    open c_CrdPrevInfo(p_CreditID);
    fetch c_CrdPrevInfo into CrdPrevInfo;
    close c_CrdPrevInfo;
    
    if TrProcessed = CM_DECLS.csAccepted then
    
      if (IntTrID is not null) 
      and CM_TRANSACTIONMGR.TransactionExist(IntTrID) then
        Result := CM_TRANSACTIONMGR.SBDeleteTransaction(IntTrID);        
      end if;
      
      if (DueIntTrID is not null) 
      and CM_TRANSACTIONMGR.TransactionExist(DueIntTrID) then
        Result := CM_TRANSACTIONMGR.SBDeleteTransaction(DueIntTrID);        
      end if;

      UpdateInterests(
         p_CreditID => p_CreditID , --- My Be QLYUKKKKK
         p_IntAmt => - IntDec ,
         p_DueIntAmt => - DueIntDec
        );
      
    end if;
     
    update CM_INT_CURRSTATE
       set 
           INTTRID = null ,
           DUEINTTRID = null ,           
           INTEREST = 0 ,
           DUEINTEREST = 0 ,
           TRPROCESSED = CM_DECLS.csNotCalculated ,
           INTPRECISION = IntPrec ,
           DUEINTPRECISION = DueIntPrec 
     where CreditID = p_CreditID; 
     
     update CM_CURR_STATE 
        set LASTCALCDATE = CrdPrevInfo.LASTCALCDATE
      where CreditID = p_CreditID;  -- // New
          
     commit work;
     
     exception when OTHERS then
    
     rollback work;
     
     raise;
          
  end;          
  
  procedure AcceptCalcedPercents(
             p_CreditID in integer
            )
  is
    cursor c_CrdAccounts(CrdID in Integer) is
    select INTERESTACCID ,
           DUEINTERESTACCID
      from CM_ACCOUNTS
     where CreditID = CrdID;
     
    cursor c_CrdInfo(CrdID in Integer) is
    select NUMBEROFCREDIT ,
           CURRENCY ,
           CUSTOMERTYPE ,
           BRANCHID 
      from CM_ACTIVE_CREDITS
     where ID = CrdID;
    
    cursor c_CalcedPercent(CrdID in Integer) is
    select INTEREST ,
           DUEINTEREST , 
           TRPROCESSED
      from CM_INT_CURRSTATE
     where CreditID = CrdID;      
     
     cursor c_DefCommitFlag
     is
     select 
       integervalue
     from cm_references
     where iname = 'TrCtrlShowDelayedTransactions';
             
      
    PortfInfo c_CrdInfo%rowtype;
    CrdAccs c_CrdAccounts%rowtype;
    CalcedPercent c_CalcedPercent%rowtype;
    DefCommitFlag c_DefCommitFlag%rowtype;
    
    IntAccID Integer;
    DueIntAccID Integer;
    
    InvAccID Integer;
    DueInvAccID integer;
    TrDescription Varchar2(255);
    
    crdCurrency Integer;
    crdCustType Integer;
    crdBranchID Integer;
    crdNo Varchar2(255); 

    BankCurrDate Date;
    
    InterestAmt Number;
    DueInterestAmt Number;
    TrProcessed Integer;
    
    TempIntTrID Integer;
    TempDueIntTrID Integer;
    CommitFlag integer;
    
    IntTrAmt Number(18,2);
    DueIntTrAmt Number(18,2);
     
  begin
  
     open c_DefCommitFlag;
     fetch c_DefCommitFlag into DefCommitFlag;
     close c_DefCommitFlag;
     
     if DefCommitFlag.integervalue = 1 then
        CommitFlag := CM_DECLS.atfCommitImmediate;
        else CommitFlag := CM_DECLS.atfTemporary;
     end if;
  
  
    open c_CalcedPercent(p_CreditID);
    fetch c_CalcedPercent into CalcedPercent;
      InterestAmt := CalcedPercent.INTEREST;
      DueInterestAmt := CalcedPercent.DUEINTEREST;
      TrProcessed := CalcedPercent.TRPROCESSED;    
    close c_CalcedPercent;
    
    if TrProcessed <> CM_DECLS.csCalculated then
      CM_UTILS.ProcessError(0); -- TODO
    end if; 

    if InterestAmt + DueInterestAmt <= 0 then
      CM_UTILS.ProcessError(0); -- TODO
    end if;     
         
    open c_CrdInfo(p_CreditID);
    fetch c_CrdInfo into PortfInfo;
      crdCurrency := PortfInfo.CURRENCY;
      crdCustType := PortfInfo.CUSTOMERTYPE;
      crdBranchID := PortfInfo.BRANCHID;
      crdNo := PortfInfo.NUMBEROFCREDIT;
    close c_CrdInfo;
    
    open c_CrdAccounts(p_CreditID);
    fetch c_CrdAccounts into CrdAccs;
      IntAccID := CrdAccs.INTERESTACCID;
      DueIntAccID := CrdAccs.DUEINTERESTACCID;
    close c_CrdAccounts;

    InvAccID := CM_UTILS.lnkInterestAccount(
                  p_custcategory => crdCustType ,
                  p_crdcurrency => crdCurrency ,
                  p_bankid => crdBranchID 
                  );
                  
    DueInvAccID := CM_UTILS.lnkDueInterestAccount(
                  p_custcategory => crdCustType ,
                  p_crdcurrency => crdCurrency ,
                  p_bankid => crdBranchID 
                  );
    
    select TEK_DAT
      into BankCurrDate
      from SB_SYSDAT;
    
    TrDescription := CM_UTILS.trDescInterestRecalc;                 
    TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,crdNo); -- TODO
    TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(BankCurrDate,'DD/MM/YYYY'));
    
    IntTrAmt := CM_UTILS.Precision2(InterestAmt);
    
    DueIntTrAmt := CM_UTILS.Precision2(DueInterestAmt);

    if IntTrAmt > 0 then
      TempIntTrID := 
          CM_TRANSACTIONMGR.SBAddTransaction(
                p_TrID => null ,
                p_DebitID => IntAccID ,
                p_CreditID => InvAccID ,
                p_DebitAmount => IntTrAmt , 
                p_CreditAmount => null ,
                p_LAmount => null ,
                p_TrName => TrDescription ,
                p_Flags =>CommitFlag/*SB_DECLS.atfCommitImmediate*/ ,
                p_TransactionDate => BankCurrDate ,
                p_OperationType => CM_DECLS.cmTransactionOpType,
                p_InBalanceChar => null
              );
                  
    end if;
    
    if DueIntTrAmt > 0 then
      TempDueIntTrID := 
          CM_TRANSACTIONMGR.SBAddTransaction(
                p_TrID => null ,
                p_DebitID => IntAccID ,
                p_CreditID => DueInvAccID ,
                p_DebitAmount => DueIntTrAmt , 
                p_CreditAmount => null ,
                p_LAmount => null ,
                p_TrName => TrDescription ,
                p_Flags => CommitFlag/*SB_DECLS.atfCommitImmediate*/ ,
                p_TransactionDate => BankCurrDate ,
                p_OperationType => CM_DECLS.cmTransactionOpType,
                p_InBalanceChar => null
              );
    end if;            
  
    update CM_INT_CURRSTATE
       set 
           TRPROCESSED = CM_DECLS.csAccepted ,
           INTPRECISION = CM_UTILS.Precision7(InterestAmt) , 
           DUEINTPRECISION = CM_UTILS.Precision7(DueInterestAmt) ,
           INTTRID = TempIntTrID ,
           DUEINTTRID = TempDueIntTrID
     where CreditID = p_CreditID;
    
    UpdateInterests(
       p_CreditID => p_CreditID , --- My Be QLYUKKKKK
       p_IntAmt => IntTrAmt ,
       p_DueIntAmt => DueIntTrAmt
      );
      
     
    commit work;
    
    exception when OTHERS then
    
    rollback work;
    
    raise;
                        
  end;    
  
     /*PROCEDURE int_placeoutbalance (
      p_creditid           IN   INTEGER,
      p_date               IN   DATE
   )
   IS
      CURSOR c_accounts (crdid IN INTEGER)
      IS
         SELECT loanaccid, 
                interestaccid, 
                dueinterestaccid, 
                outinterestaccid
           FROM cm_accounts
          WHERE creditid = crdid;

      CURSOR c_portfolio (crdid IN INTEGER)
      IS
         SELECT currency, branchid, customertype, numberofcredit
           FROM cm_active_credits
          WHERE id = crdid;


      CURSOR c_history (crdid IN INTEGER)
      IS
         SELECT rest, interestrest
           FROM cm_curr_state
          WHERE creditid = crdid;

      accountsinfo              c_accounts%ROWTYPE;
      portinfo                  c_portfolio%ROWTYPE;
      histinfo                  c_history%ROWTYPE;
      debitacc                  INTEGER;
      creditacc                 INTEGER;
      loanacc_id                INTEGER;
      interestacc_id            INTEGER;
      outinterestacc_id         INTEGER;
      custtype                  INTEGER;
      currid                    INTEGER;
      br_id                     INTEGER;
      resultintbalancetrid      INTEGER;
      resultintoutbalancetrid   INTEGER;
      trdescription             VARCHAR2 (255);
      amount                    NUMBER;
      reserveamt                NUMBER;
      definoutbalance           BOOLEAN;
      defcrdid                  INTEGER;
   BEGIN

      if defploutb_date(p_creditid)>=91 then 
    --  raise_application_error(-20007,'dedimmi');
      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accountsinfo;
      CLOSE c_accounts;
      
      loanacc_id := accountsinfo.loanaccid;
      interestacc_id := accountsinfo.interestaccid;
      outinterestacc_id := accountsinfo.outinterestaccid;
      
      OPEN c_history (p_creditid);
      FETCH c_history INTO histinfo;
      CLOSE c_history;
      
      amount :=   histinfo.rest;

      IF (amount <= 0)
      THEN
         cm_utils.processerror (cm_decls.ezerotranchenotsupported);
      END IF;
      
      OPEN c_portfolio (p_creditid);
      FETCH c_portfolio INTO portinfo;
      CLOSE c_portfolio;
      
      custtype := portinfo.customertype;
      currid := portinfo.currency;
      br_id := portinfo.branchid;

      creditacc := interestacc_id;
      debitacc := cm_utils.lnkinterestaccount (
                     p_custcategory=> custtype,
                     p_crdcurrency=> currid,
                     p_bankid=> br_id
                  );

      IF debitacc IS NULL
      THEN
         cm_utils.processerror (cm_decls.einvokeaccountnotfound); -- Change  
      END IF;

      trdescription := cm_utils.trdescreserveincrease ();
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescnumber,
                          portinfo.numberofcredit
                       ); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (p_date, 'DD/MM/YYYY')
                       );

      resultintbalancetrid :=
           CM_TRANSACTIONMGR.SBAddTransaction(
                p_TrID => null ,
                p_DebitID => debitacc ,
                p_CreditID => creditacc,
                p_DebitAmount =>amount,
                p_CreditAmount =>null,
                p_LAmount =>NULL,
                p_TrName => trdescription,
                p_Flags => 8cm_decls.cmtrflaginbalance,
                p_TransactionDate => p_date,
                p_OperationType => cm_decls.cmtransactionoptype ,
                p_InBalanceChar  =>null 
                );            
      --Now  Amount placed in Outbalance.

      debitacc := outinterestacc_id;
      creditacc :=
            cm_utils.inkoutinvinterestaccount (
               p_custcategory=> portinfo.customertype,
               p_crdcurrency=> portinfo.currency,
               p_bankid=> portinfo.branchid
            );

      IF creditacc IS NULL
      THEN
         cm_utils.processerror (cm_decls.einvokeaccountnotfound); -- Change  
      END IF;

      trdescription := cm_utils.trdescobligationreduce ();
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescnumber,
                          portinfo.numberofcredit
                       ); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (p_date, 'DD/MM/YYYY')
                       );

      resultintoutbalancetrid :=
                CM_TRANSACTIONMGR.SBoutAddTransaction(
                p_TrID => null ,
                p_DebitID => debitacc ,
                p_CreditID => creditacc,
                p_DebitAmount =>amount,
                p_CreditAmount=>  NULL,
                p_LAmount=> NULL,
                p_TrName => trdescription,
                p_Flags => 8,
                p_TransactionDate => '19-oct-2005',
                p_OperationType => cm_decls.cmtransactionoptype ,
                p_InBalanceChar  =>null
                );            
 

      --Now inserted to table CM_INT_OUTBALANCE.

      INSERT INTO cm_int_outbalance
                  (tramount, trinbalance, trinoutbalance,
                   creditid, trdate)
           VALUES (amount, resultintbalancetrid, resultintoutbalancetrid,
                   p_creditid, p_date);
                   
    end if;
     
     commit work;
     
     exception when OTHERS then
    
     rollback work;
     
     raise;
                   
                   
   END;*/
     
  function defploutb_date(p_creditid in integer)
  return number
 
  is
  
   cursor c_prdat(crdid in integer) is
   select newclosedate
   from cm_prolongations
   where creditid = CrdID;
   
   cursor c_portdat(crdid in integer) is
   select duedatefirstcontract
   from cm_active_credits
   where id = crdid;
   
   prdatinfo c_prdat%rowtype;
   portdatinfo c_portdat%rowtype;
   
   CurrDate Date; 
   result number;
   
  begin
    
    Select tek_dat into CurrDate 
    from sb_sysdat;
    
    open c_prdat(p_creditid);
    fetch c_prdat into prdatinfo;
    close c_prdat;
    
    open c_portdat(p_creditid);
    fetch c_portdat into portdatinfo;
    close c_portdat;
    
    if prdatinfo.newclosedate is not null then
       Result := (CurrDate - prdatinfo.newclosedate);
    else   
       Result := (CurrDate- portdatinfo.duedatefirstcontract);
    end if;
    
    return result;
  end;    
  
  function CalcCreditCards(P_CreditID in integer)
  return number
  is
    Result number :=0;
  
    cursor c_CardTranches is
    select tranchedate, 
           trancheamount
     from cm_tranches
      where creditid =  P_CreditID;   
      
    cursor c_CardsPayments is
    select sum(payedamt) as payamt
     from cm_payments
    where creditid = P_CreditID;
   
   CalcFAmt number :=0;
   CalcSAmt number :=0;
   SumPay number :=0;
   TranchAmt number;
   AnnInt number;
   Temp number := 0;
   TempPay number := 0;     
   TempCalc number := 0;
     
  begin
   
    open c_CardsPayments;
    fetch c_CardsPayments into SumPay;
    close c_CardsPayments;
    
    TempPay := nvl(SumPay,0);
    for CardTranches in c_CardTranches
    loop
      
      TranchAmt := CardTranches.trancheamount;
      Temp := TranchAmt - TempPay;
      
      if Temp > 0 then --M
      if (sbop.get_date - CardTranches.tranchedate) between --1
          cm_decls.CreditCardsFirstCalcDate and
          cm_decls.CreditCardsSecondCalcDate then
      
          CalcFAmt := CalcFAmt+ CM_UTILS.CalcPercent(
                          p_Sum => Temp,
                          p_Rate => cm_decls.CreditCardsSecondAnnInt,
                          p_Coefficient => 1
                         );             
      
      else 
      if (sbop.get_date - CardTranches.tranchedate) > --2
              cm_decls.CreditCardsSecondCalcDate then
     
          CalcSAmt := CalcSAmt+CM_UTILS.CalcPercent(
                          p_Sum => Temp,
                          p_Rate => cm_decls.CreditCardsThreedAnnInt,
                          p_Coefficient => 1
                         );           

      end if; --2          
      end if; --1  
         TempPay := 0;
      else 
         TempPay := abs(Temp);    
      end if; --M   
      
    end loop;
    
    return CalcFAmt+CalcSAmt;
    
  end;                             
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CALCULATOR

-- Start of DDL Script for Package CREDITSMGR.CM_CARDS
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_cards
IS
   FUNCTION checkusedcard (p_cardid IN INTEGER)
      RETURN BOOLEAN;

   PROCEDURE del_cards (p_id IN INTEGER);

   FUNCTION get_creditcards (p_brid IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_custostat (p_id IN INTEGER)
      RETURN NUMBER;

   PROCEDURE tranche_creditcards (p_creditid IN INTEGER, trdate IN DATE);

   FUNCTION iscreditcards (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION control_creditcards (p_brid IN INTEGER)
      RETURN VARCHAR2;

   PROCEDURE committranche (docommit IN BOOLEAN DEFAULT TRUE);

   PROCEDURE edit_cardsorts (
      p_id           IN   INTEGER,
      p_name         IN   VARCHAR2 DEFAULT NULL,
      p_desc         IN   VARCHAR2,
      p_calcmethod   IN   INTEGER
   );

   PROCEDURE add_cardsorts (
      p_name         IN   VARCHAR2,
      p_desc         IN   VARCHAR2,
      p_calcmethod   IN   INTEGER
   );
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_cards
IS
   ---------------------------->> Credit Card Settings <<----------------------------

   PROCEDURE add_cardsorts (
      p_name         IN   VARCHAR2,
      p_desc         IN   VARCHAR2,
      p_calcmethod   IN   INTEGER
   )
   IS
   BEGIN
      INSERT INTO cm_calc_cardsorts
                  (NAME, description, calcmethod
                  )
           VALUES (p_name, p_desc, p_calcmethod
                  );

      COMMIT;
   END;

   PROCEDURE edit_cardsorts (
      p_id           IN   INTEGER,
      p_name         IN   VARCHAR2 DEFAULT NULL,
      p_desc         IN   VARCHAR2,
      p_calcmethod   IN   INTEGER
   )
   IS
   BEGIN
      UPDATE cm_calc_cardsorts
         SET --NAME = p_name,
              description = p_desc,
              calcmethod = p_calcmethod
       WHERE ID = p_id;

      COMMIT;
   END;

   FUNCTION checkusedcard (p_cardid IN INTEGER)
      RETURN BOOLEAN
   IS
      CURSOR c_usecredit
      IS
         SELECT ID
           FROM cm_portfolio
          WHERE customertype IN (SELECT categoryid
                                   FROM cm_calc_cardcustsettings
                                  WHERE cardid = p_cardid);

      usecredit   c_usecredit%ROWTYPE;
      RESULT      BOOLEAN;
   BEGIN
      OPEN c_usecredit;
      FETCH c_usecredit INTO usecredit;
      RESULT := c_usecredit%FOUND;
      CLOSE c_usecredit;
      RETURN RESULT;
   END;

   PROCEDURE del_cards (p_id IN INTEGER)
   IS
   BEGIN
      IF NOT checkusedcard (p_id)
      THEN
         DELETE      cm_calc_cardsorts
               WHERE ID = p_id;
      ELSE
         raise_application_error (-20007,
                                  'This Card is used because can not delete'
                                 );
      END IF;
   END;

   ---------------------------->> Credit Card Settings <<----------------------------


   FUNCTION get_custostat (p_id IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_checkostat
      IS
         SELECT ostat
           FROM sb_tenostat
          WHERE acc_id = (SELECT booroweraccid
                            FROM cm_accounts
                           WHERE creditid = p_id);
   BEGIN
      OPEN c_checkostat;
      FETCH c_checkostat INTO RESULT;
      CLOSE c_checkostat;
      RETURN RESULT;
   END;

   FUNCTION get_creditcards (p_brid IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (2048);
   BEGIN
      RESULT :=
             'select id from cm_active_credits 
             where cm_cards.iscreditcards(id)=1 and CM_CARDS.Get_CustOstat(id)<0 
               and branchid = '
          || p_brid;
      RETURN RESULT;
   END;

   PROCEDURE tranche_creditcards (p_creditid IN INTEGER, trdate IN DATE)
   IS
      CURSOR c_port (p_id IN INTEGER)
      IS
         SELECT numberofcredit, currency, credittype, customertype, branchid,
                initialamount
           FROM cm_active_credits
          WHERE ID = p_id;

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT booroweraccid, loanaccid, primaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_rate (p_id IN INTEGER)
      IS
         SELECT ostat
           FROM sb_temprate
          WHERE val_kod = p_id;

      CURSOR c_history (crdid IN INTEGER)
      IS
         SELECT lastcalcdate, rest, reserveid, givenamount, obligation
           FROM cm_curr_state
          WHERE creditid = crdid;

      CURSOR c_reserverate (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserves
          WHERE ID = p_id;

      CURSOR c_credittype (p_id IN INTEGER)
      IS
         SELECT description
           FROM cm_credittypes
          WHERE ID = p_id;

      port                c_port%ROWTYPE;
      accounts            c_account%ROWTYPE;
      rates               c_rate%ROWTYPE;
      history             c_history%ROWTYPE;
      reserverate         c_reserverate%ROWTYPE;
      crdtype             c_credittype%ROWTYPE;
      tramt               NUMBER;
      debitaccid          INTEGER;
      creditaccid         INTEGER;
      firsttranche        BOOLEAN;
      trdescription       VARCHAR2 (256);
      temp                NUMBER;
      resulttranchetrid   INTEGER;
      resultreservetrid   INTEGER;
   BEGIN
      OPEN c_port (p_creditid);
      FETCH c_port INTO port;
      CLOSE c_port;
      OPEN c_account (p_creditid);
      FETCH c_account INTO accounts;
      CLOSE c_account;
      OPEN c_history (p_creditid);
      FETCH c_history INTO history;
      CLOSE c_history;
      OPEN c_rate (port.currency);
      FETCH c_rate INTO rates;
      CLOSE c_rate;
      OPEN c_reserverate (history.reserveid);
      FETCH c_reserverate INTO reserverate;
      CLOSE c_reserverate;
      OPEN c_credittype (port.credittype);
      FETCH c_credittype INTO crdtype;
      CLOSE c_credittype;
      tramt := ABS (cm_common.accountrest_get (accounts.booroweraccid));
      firsttranche := port.initialamount = 0;

      IF firsttranche
      THEN
         UPDATE cm_active_credits
            SET initialamount = tramt,
                dateofgrant = trdate
          WHERE ID = p_creditid;

         UPDATE cm_curr_state
            SET rest = rest + tramt,
                obligation = obligation - tramt,
                givenamount = givenamount + tramt
          WHERE creditid = p_creditid;
      ELSE
         UPDATE cm_curr_state
            SET rest = rest + tramt,
                obligation = obligation - tramt,
                givenamount = givenamount + tramt
          WHERE creditid = p_creditid;
      END IF;

      debitaccid := accounts.loanaccid;
      creditaccid := accounts.booroweraccid;
      trdescription := cm_utils.trdesctranche ();
      trdescription :=
           REPLACE (trdescription, cm_decls.trdescnumber, port.numberofcredit); -- TODO
      trdescription :=
         REPLACE (trdescription,
                  cm_decls.trdescdate,
                  TO_CHAR (trdate, 'DD/MM/YYYY')
                 );

      IF tramt > 0 AND (debitaccid IS NOT NULL) AND (creditaccid IS NOT NULL)
      THEN
         resulttranchetrid :=
            cm_transactionmgr.cm_transactionadd (p_trid               => NULL,
                                                 p_debitaccid         => debitaccid,
                                                 p_creditaccid        => creditaccid,
                                                 p_debitamount        => tramt,
                                                 p_creditamount       => NULL,
                                                 p_natamount          => NULL,
                                                 p_flags              => cm_decls.cmtrflaginbalance,
                                                 p_optype             => cm_decls.cmtransactionoptype,
                                                 p_inbalancechar      => NULL,
                                                 p_trdate             => trdate,
                                                 p_trdescription      => trdescription
                                                );
      END IF;

      IF cm_utils.creditreservecontenabled (p_credittypeid      => port.credittype) =
                                                                             1
      THEN
         IF reserverate.PERCENT > 0
         THEN
            temp :=
               cm_utils.calcpercent (p_sum              => tramt,
                                     p_rate             => reserverate.PERCENT,
                                     p_coefficient      => 1,
                                     p_delimmer         => 1
                                    );
            debitaccid :=
               cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                           p_crdcurrency       => port.currency,
                                           p_bankid            => port.branchid
                                          );
            creditaccid := accounts.primaryreserveaccid;
            tramt := ROUND (rates.ostat * temp, 2);
            trdescription := cm_utils.trdescreserveincrease ();
            trdescription :=
               REPLACE (trdescription,
                        cm_decls.trdescnumber,
                        port.numberofcredit
                       ); -- TODO
            trdescription :=
               REPLACE (trdescription,
                        cm_decls.trdescdate,
                        TO_CHAR (trdate, 'DD/MM/YYYY')
                       );

            IF     tramt > 0
               AND (debitaccid IS NOT NULL)
               AND (creditaccid IS NOT NULL)
            THEN
               resultreservetrid :=
                  cm_transactionmgr.cm_transactionadd (p_trid               => NULL,
                                                       p_debitaccid         => debitaccid,
                                                       p_creditaccid        => creditaccid,
                                                       p_debitamount        => tramt,
                                                       p_creditamount       => NULL,
                                                       p_natamount          => NULL,
                                                       p_flags              => cm_decls.cmtrflaginbalance,
                                                       p_optype             => cm_decls.cmtransactionoptype,
                                                       p_inbalancechar      => NULL,
                                                       p_trdate             => trdate,
                                                       p_trdescription      => trdescription
                                                      );
            END IF;
         END IF;

         INSERT INTO cm_tranches
                     (creditid, tranchedate,
                      trancheamount,
                      tranchetrid, reservetrid
                     )
              VALUES (p_creditid, trdate,
                      ABS (cm_common.accountrest_get (accounts.booroweraccid)),
                      resulttranchetrid, resultreservetrid
                     );
      END IF;
   END;

   FUNCTION control_creditcards (p_brid IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (2048);
   BEGIN
      RESULT :=
             'select p.numberofcredit,
       cm_common.accountnumber_get(a.contractaccid) as contractno,
       cm_common.accountrest_get(a.booroweraccid) as CustRest,
       h.rest 
       from cm_active_credits p,
       cm_accounts a,
       cm_curr_state h
      where p.id = a.creditid
        and   p.id=h.creditid 
       and   cm_common.accountrest_get(a.booroweraccid)<0
       and CM_CARDS.IsCreditCards(p.id) = 1
        and p.BranchID = '
          || p_brid;
      RETURN RESULT;
   END;

   FUNCTION iscreditcards (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   INTEGER := 0;
   BEGIN
      IF cm_calcsettings.checkcardcredits (p_creditid)
      THEN
         RESULT := 1;
      END IF;

      RETURN RESULT;
   END;

   PROCEDURE committranche (docommit IN BOOLEAN DEFAULT TRUE)
   IS
   BEGIN
      IF docommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions (1);
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CARDS

-- Start of DDL Script for Package CREDITSMGR.CM_COMMON
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_common
IS
   FUNCTION accountnumber_get (p_id IN INTEGER)
      RETURN VARCHAR2;

   PROCEDURE securitylog (p_creditid IN INTEGER, p_event IN VARCHAR2);

   FUNCTION accountrest_get (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_accid (
      p_custid       IN   INTEGER,
      p_typeid       IN   INTEGER,
      p_defbalance   IN   INTEGER DEFAULT 0 /*=sb*/
   )
      RETURN INTEGER;

   FUNCTION get_creditmumber (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_lastmainpaydate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION get_lastintpaydate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION ge_interestproqnoz (
      p_id        IN   INTEGER,
      p_dat       IN   DATE,
      p_datproq   IN   DATE,
      p_proq      IN   NUMBER
   )
      RETURN NUMBER;

   FUNCTION get_credittranches (
      p_id     IN   INTEGER,
      p_bdat   IN   DATE,
      p_edat   IN   DATE
   )
      RETURN NUMBER;

   FUNCTION get_creditpayments (
      p_id     IN   INTEGER,
      p_bdat   IN   DATE,
      p_edat   IN   DATE
   )
      RETURN NUMBER;

   FUNCTION get_creditintpayments (
      p_id     IN   INTEGER,
      p_bdat   IN   DATE,
      p_edat   IN   DATE
   )
      RETURN NUMBER;

   FUNCTION get_prolongdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION get_expdate (p_id IN INTEGER)
      RETURN DATE;

   FUNCTION get_lastannint (p_id IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditcalcstatus (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_countprolong (p_id IN INTEGER)
      RETURN INTEGER;

   FUNCTION get_restproqnoz (p_id IN INTEGER, p_dat IN DATE, p_d IN DATE)
      RETURN NUMBER;

   FUNCTION get_accrest (p_accid IN INTEGER, p_dat IN DATE)
      RETURN NUMBER;

   FUNCTION getperiod (bdat IN DATE, edat IN DATE)
      RETURN INTEGER;

   FUNCTION get_creditcurrency (p_currency IN INTEGER)
      RETURN VARCHAR2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_common
IS
   FUNCTION accountnumber_get (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      CURSOR c_account (accid IN INTEGER)
      IS
         SELECT acc_no
           FROM sb_account
          WHERE ID = accid;

      RESULT   sb_account.acc_no%TYPE;
   BEGIN
      OPEN c_account (p_id);
      FETCH c_account INTO RESULT;
      CLOSE c_account;
      RETURN RESULT;
   END;

   FUNCTION accountrest_get (p_id IN INTEGER)
      RETURN NUMBER
   IS
      CURSOR c_accrest (accid IN INTEGER)
      IS
         SELECT ostat
           FROM sb_tenostat
          WHERE acc_id = accid;

      RESULT   NUMBER := 0;
   BEGIN
      OPEN c_accrest (p_id);
      FETCH c_accrest INTO RESULT;
      CLOSE c_accrest;
      RETURN RESULT;
   END;

   PROCEDURE securitylog (p_creditid IN INTEGER, p_event IN VARCHAR2)
   IS
   BEGIN
      INSERT INTO cm_securitylog
                  (creditid, event
                  )
           VALUES (p_creditid, p_event
                  );
   END;

   FUNCTION get_accid (
      p_custid       IN   INTEGER,
      p_typeid       IN   INTEGER,
      p_defbalance   IN   INTEGER DEFAULT 0 /*=sb*/
   )
      RETURN INTEGER
   IS
      CURSOR c_accid (cid IN INTEGER, ptid IN INTEGER)
      IS
         SELECT ac.ID AS ID
           FROM sb_account ac
          WHERE ac.kli_id = cid
            AND (ac.bal_cn1 IN (SELECT accountnumber
                                  FROM cm_aginfo
                                 WHERE groupid = (SELECT g.ID
                                                    FROM cm_accountgroups g
                                                   WHERE g.ID = ptid)));

      CURSOR c_outaccid (cid IN INTEGER, ptid IN INTEGER)
      IS
         SELECT ac.ID AS ID
           FROM sbout_account ac
          WHERE ac.kli_id = cid
            AND (ac.bal_cn1 IN (SELECT accountnumber
                                  FROM cm_aginfo
                                 WHERE groupid = (SELECT g.ID
                                                    FROM cm_accountgroups g
                                                   WHERE g.ID = ptid)));

      RESULT   INTEGER;
   BEGIN
      IF p_defbalance = 0
      THEN
         OPEN c_accid (p_custid, p_typeid);
         FETCH c_accid INTO RESULT;
         CLOSE c_accid;
      END IF;

      IF p_defbalance <> 0
      THEN
         OPEN c_outaccid (p_custid, p_typeid);
         FETCH c_outaccid INTO RESULT;
         CLOSE c_outaccid;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_creditmumber (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (35);
   BEGIN
      SELECT numberofcredit
        INTO RESULT
        FROM cm_portfolio
       WHERE ID = p_id;

      RETURN RESULT;
   END;

   FUNCTION get_lastmainpaydate (p_id IN INTEGER)
      RETURN DATE
   IS
      CURSOR c_p
      IS
         SELECT MAX (paydate)
           FROM cm_payments
          WHERE payedamt <> 0 AND creditid = p_id;

      RESULT   DATE;
   BEGIN
      OPEN c_p;
      FETCH c_p INTO RESULT;
      RETURN RESULT;
   END;

   FUNCTION get_lastintpaydate (p_id IN INTEGER)
      RETURN DATE
   IS
      CURSOR c_p
      IS
         SELECT MAX (paydate)
           FROM cm_payments
          WHERE payedintamt <> 0 AND creditid = p_id;

      RESULT   DATE;
   BEGIN
      OPEN c_p;
      FETCH c_p INTO RESULT;
      RETURN RESULT;
   END;

   FUNCTION ge_interestproqnoz (
      p_id        IN   INTEGER,
      p_dat       IN   DATE,
      p_datproq   IN   DATE,
      p_proq      IN   NUMBER
   )
      RETURN NUMBER
   IS
      RESULT     NUMBER;
      mainrest   NUMBER;
      annint     NUMBER;
      temp       NUMBER;
   BEGIN
      SELECT rest
        INTO mainrest
        FROM cm_history
       WHERE creditid = p_id AND hdate = p_dat;

      SELECT annualyinterestrate
        INTO annint
        FROM cm_portfolio
       WHERE ID = p_id;

      temp := p_datproq - get_lastintpaydate (p_id) + p_proq;

      IF p_datproq - get_lastintpaydate (p_id) <= 30
      THEN
         temp := 30;
      END IF;

      RESULT := mainrest * annint / 360 * temp;
      RETURN RESULT;
   END;

   FUNCTION get_restproqnoz (p_id IN INTEGER, p_dat IN DATE, p_d IN DATE)
      RETURN NUMBER
   IS
      RESULT     NUMBER;
      mainrest   NUMBER;
      annint     NUMBER;
      temp       NUMBER;
   BEGIN
      SELECT rest
        INTO mainrest
        FROM cm_history
       WHERE creditid = p_id AND hdate = p_dat;

      SELECT (duedatefirstcontract - dateofconclusion) / 30
        INTO annint
        FROM cm_portfolio
       WHERE ID = p_id;

      RESULT := mainrest / (annint + 1);
      RETURN RESULT;
   END;

   FUNCTION get_credittranches (p_id IN INTEGER, p_bdat IN DATE, p_edat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_tr
      IS
         SELECT SUM (trancheamount)
           FROM cm_tranches
          WHERE creditid = p_id AND tranchedate BETWEEN p_bdat AND p_edat;
   BEGIN
      OPEN c_tr;
      FETCH c_tr INTO RESULT;
      CLOSE c_tr;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditpayments (p_id IN INTEGER, p_bdat IN DATE, p_edat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_pay
      IS
         SELECT SUM (payedamt)
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN p_bdat AND p_edat;
   BEGIN
      OPEN c_pay;
      FETCH c_pay INTO RESULT;
      CLOSE c_pay;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditintpayments (
      p_id     IN   INTEGER,
      p_bdat   IN   DATE,
      p_edat   IN   DATE
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_pay
      IS
         SELECT SUM (payedintamt)
           FROM cm_payments
          WHERE creditid = p_id AND paydate BETWEEN p_bdat AND p_edat;
   BEGIN
      OPEN c_pay;
      FETCH c_pay INTO RESULT;
      CLOSE c_pay;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_prolongdate (p_id IN INTEGER)
      RETURN DATE
   IS
      RESULT   DATE;

      CURSOR c_exp
      IS
         SELECT MAX (newclosedate)
           FROM cm_prolongations
          WHERE creditid = p_id;
   BEGIN
      OPEN c_exp;
      FETCH c_exp INTO RESULT;
      CLOSE c_exp;
      RETURN RESULT;
   END;

   FUNCTION get_expdate (p_id IN INTEGER)
      RETURN DATE
   IS
      RESULT   DATE;

      CURSOR c_exp
      IS
         SELECT MAX (expdate)
           FROM cm_expires
          WHERE creditid = p_id;
   BEGIN
      OPEN c_exp;
      FETCH c_exp INTO RESULT;
      CLOSE c_exp;
      RETURN RESULT;
   END;

   FUNCTION get_lastannint (p_id IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_porta
      IS
         SELECT annualyinterestrate
           FROM cm_portfolio_archive
          WHERE ID = p_id AND sysdat = (SELECT MIN (sysdat)
                                          FROM cm_portfolio_archive);
   BEGIN
      OPEN c_porta;
      FETCH c_porta INTO RESULT;
      CLOSE c_porta;
      RETURN RESULT;
   END;

   FUNCTION get_creditcalcstatus (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT      VARCHAR2 (7);
      stcalcdat   DATE;

      CURSOR c_curr
      IS
         SELECT stopcalcdate
           FROM cm_curr_state
          WHERE creditid = p_id;
   BEGIN
      OPEN c_curr;
      FETCH c_curr INTO stcalcdat;
      CLOSE c_curr;

      IF stcalcdat IS NULL
      THEN
         RESULT := 'Щя';
      ELSE
         RESULT := 'Йох';
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_countprolong (p_id IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;

      CURSOR c_exp
      IS
         SELECT COUNT (*)
           FROM cm_prolongations
          WHERE creditid = p_id;
   BEGIN
      OPEN c_exp;
      FETCH c_exp INTO RESULT;
      CLOSE c_exp;
      RETURN RESULT;
   END;

   FUNCTION get_accrest (p_accid IN INTEGER, p_dat IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT ABS (pok_ostat)
        INTO RESULT
        FROM smart.archost
       WHERE datdate = p_dat AND acc_id = p_accid;

      RETURN RESULT;
   END;

   FUNCTION getperiod (bdat IN DATE, edat IN DATE)
      RETURN INTEGER
   IS
   BEGIN
      RETURN MONTHS_BETWEEN (edat, bdat);
   END;

   FUNCTION get_creditcurrency (p_currency IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (5) := '';
   BEGIN
      SELECT val_name
        INTO RESULT
        FROM sb_avalute
       WHERE valute = p_currency;

      RETURN RESULT;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_COMMON

-- Start of DDL Script for Package CREDITSMGR.CM_COMMON_UTILS
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_common_utils AUTHID CURRENT_USER
IS
   FUNCTION cm_branchid_get (user_id INTEGER DEFAULT UID)
      RETURN NUMBER;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_common_utils
IS
   FUNCTION cm_branchid_get (user_id INTEGER DEFAULT UID)
      RETURN NUMBER
   IS
      brchid   smart.sba_objinf.filialid%TYPE;
   BEGIN
      SELECT filialid
        INTO brchid
        FROM smart.sba_objinf
       WHERE TYPE = 'U' AND obj = (SELECT NAME
                                     FROM smart.user$
                                    WHERE ID = user_id);

      RETURN brchid;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN -1;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_COMMON_UTILS

-- Start of DDL Script for Package CREDITSMGR.CM_CONSTS
-- Generated 30-Apr-2007 11:01:27 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_consts
  IS
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_consts
IS
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CONSTS

-- Start of DDL Script for Package CREDITSMGR.CM_CONTROL
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_control
IS
   TYPE cursor_type IS REF CURSOR;

   PROCEDURE open_cursor (cur OUT cursor_type, pstr IN VARCHAR2);
  PROCEDURE control(p_id in integer,p_dat in date);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_control
IS
   PROCEDURE control(p_id in integer,p_dat in date)
   IS
      CURSOR c_acc
      IS
         SELECT   loanaccid, interestaccid, dueloanaccid, dueinterestaccid,
                  COUNT (*) AS cnt
             FROM cm_accounts
            WHERE creditid IN (SELECT id
                                 FROM cm_active_credits /*where branchid = p_id*/ )
         GROUP BY loanaccid, interestaccid, dueloanaccid, dueinterestaccid;

      CURSOR c_crd (p_id IN INTEGER)
      IS
         SELECT id, numberofcredit, boorowerid
           FROM cm_active_credits
          WHERE id IN
                    (SELECT creditid
                       FROM cm_accounts
                      WHERE loanaccid = p_id);

      CURSOR c_crd_rest (p_crd IN INTEGER)
      IS
         SELECT rest, interestrest, duerest, dueinterestrest
           FROM cm_history where hdate=p_dat
          and creditid = p_crd;

      CURSOR c_sm_rest (p_id IN INTEGER)
      IS
         SELECT ABS (ostat) AS ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      crd_rest             c_crd_rest%ROWTYPE;
      sm_rest              c_sm_rest%ROWTYPE;
      sumrest              NUMBER;
      suminterestrest      NUMBER;
      sumduerest           NUMBER;
      sumdueinterestrest   NUMBER;
      smrest               NUMBER;
      sminterestrest       NUMBER;
      smduerest            NUMBER;
      smdueinterestrest    NUMBER;
      accid                NUMBER;
      custid               NUMBER;
      crdnum               VARCHAR2 (25);
      custname             VARCHAR2 (80);
   BEGIN
      sumrest := 0;
      suminterestrest := 0;
      sumduerest := 0;
      sumdueinterestrest := 0;

      FOR acc IN c_acc
      LOOP
         FOR crd IN c_crd (acc.loanaccid)
         LOOP
            OPEN c_crd_rest (crd.id);
            FETCH c_crd_rest INTO crd_rest;
            CLOSE c_crd_rest;
            sumrest :=   sumrest
                       + crd_rest.rest;
            suminterestrest :=   suminterestrest
                               + crd_rest.interestrest;
            sumduerest :=   sumduerest
                          + crd_rest.duerest;
            sumdueinterestrest :=
                                sumdueinterestrest
                              + crd_rest.dueinterestrest;
            accid := acc.loanaccid;
            crdnum := crd.numberofcredit;
            custid := crd.boorowerid;
         END LOOP; --crd

         OPEN c_sm_rest (acc.loanaccid);
         FETCH c_sm_rest INTO sm_rest;
         CLOSE c_sm_rest;
         smrest := sm_rest.ostat;
         OPEN c_sm_rest (acc.interestaccid);
         FETCH c_sm_rest INTO sm_rest;
         CLOSE c_sm_rest;
         sminterestrest := sm_rest.ostat;

         IF      (sumduerest <> 0)
             AND (    (acc.dueloanaccid IS NOT NULL)
                  AND (acc.dueloanaccid NOT IN (-1, 0))
                 )
         THEN
            OPEN c_sm_rest (acc.dueloanaccid);
            FETCH c_sm_rest INTO sm_rest;
            CLOSE c_sm_rest;
            smduerest := sm_rest.ostat;
            DBMS_OUTPUT.put_line (
                  ' smduerest = '
               || smduerest
               || ',sumduerest '
               || sumduerest
            );
         END IF;

         IF      (sumdueinterestrest <> 0)
             AND (    (acc.dueinterestaccid IS NOT NULL)
                  AND (acc.dueinterestaccid NOT IN (-1, 0))
                 )
         THEN
            OPEN c_sm_rest (acc.dueinterestaccid);
            FETCH c_sm_rest INTO sm_rest;
            CLOSE c_sm_rest;
            smdueinterestrest := sm_rest.ostat;
            DBMS_OUTPUT.put_line (
                  'smdueinterestrest= '
               || smdueinterestrest
               || ' ,sumdueinterestrest= '
               || sumdueinterestrest
            );
         END IF;

/*         SELECT NAME
           INTO custname
           FROM cm_sb_customers
          WHERE id = custid;*/

         IF    (smrest <> sumrest) --1
            /*OR ((sumduerest <> 0) AND --2
                                     (smduerest <> sumduerest)
               ) --2*/
            OR (sminterestrest <> suminterestrest)
         /*OR (    (sumdueinterestrest <> 0)
             AND (smdueinterestrest <> sumdueinterestrest)
            )*/
         THEN
            INSERT INTO cm_controls
                        (numberofcredit, custname, drest,
                         dinterestrest, dduerest, ddueinterestrest)
                 VALUES (crdnum, 'custname', ABS (  smrest
                                                - sumrest),
                         ABS (  sminterestrest
                              - suminterestrest), /*NVL (ABS (  smduerest
                                                            - sumduerest), 0)*/
                                                  0/*NVL (
                                                      ABS (  smdueinterestrest
                                                           - sumdueinterestrest),*/
                                                   , 0);

            IF      (sumdueinterestrest <> 0)
                AND (smdueinterestrest <> sumdueinterestrest)
            THEN
               UPDATE cm_controls
                  SET ddueinterestrest =
                               ABS (  smdueinterestrest
                                    - sumdueinterestrest)
                WHERE numberofcredit = crdnum;
            END IF;

            IF  (sumduerest <> 0) AND (smduerest <> sumduerest)
            THEN
               UPDATE cm_controls
                  SET dduerest = ABS (  smduerest
                                      - sumduerest)
                WHERE numberofcredit = crdnum;
            END IF;
         END IF; --1

         sumrest := 0;
         suminterestrest := 0;
         sumduerest := 0;
         sumdueinterestrest := 0;
      END LOOP; --acc
   END;

   PROCEDURE open_cursor (cur OUT cursor_type, pstr IN VARCHAR2)
   IS
   BEGIN
      IF cur%ISOPEN
      THEN
         CLOSE cur;
      END IF;

      OPEN cur FOR pstr;
   END;
   
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CONTROL

-- Start of DDL Script for Package CREDITSMGR.CM_CORR_TRCH_PAY
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_corr_trch_pay
IS
   PROCEDURE add_payments (
      p_creditid         IN   INTEGER,
      p_paydate          IN   DATE,
      p_payedamt         IN   NUMBER,
      p_payedintamt      IN   NUMBER,
      p_payeddueamt      IN   NUMBER,
      p_payeddueintamt   IN   NUMBER
   );

   PROCEDURE add_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE,
      p_trancheamount   IN   NUMBER
   );

   PROCEDURE del_payments (p_creditid IN INTEGER, p_paydate IN DATE);

   PROCEDURE edit_payments (
      p_creditid         IN   INTEGER,
      p_paydate          IN   DATE,
      p_payedamt         IN   NUMBER,
      p_payedintamt      IN   NUMBER,
      p_payeddueamt      IN   NUMBER,
      p_payeddueintamt   IN   NUMBER
   );

   PROCEDURE edit_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE,
      p_trancheamount   IN   NUMBER
   );
  PROCEDURE del_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE
       );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_corr_trch_pay
IS
   PROCEDURE add_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE,
      p_trancheamount   IN   NUMBER
   )
   IS
   cursor c_pay is
   select sum(payedamt) as pay
   from cm_payments
   where creditid = p_creditid;
     
   cursor c_tr is
   select sum(trancheamount) as tr
   from cm_tranches;
      
     payamt number;
     tramt number;


   BEGIN
      INSERT INTO cm_tranches
                  (creditid, tranchedate, trancheamount)
           VALUES (p_creditid, p_tranchedate, p_trancheamount);

      open c_pay;
      fetch c_pay into payamt;
      close c_pay;
      
      open c_tr;
      fetch c_tr into tramt;
      close c_tr;
      
    
        

      COMMIT;
   END;

   PROCEDURE edit_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE,
      p_trancheamount   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_tranches
         SET trancheamount = p_trancheamount
       WHERE creditid = p_creditid AND tranchedate = p_tranchedate;

      COMMIT;
   END;

   PROCEDURE del_tranches (
      p_creditid        IN   INTEGER,
      p_tranchedate     IN   DATE
       )
   IS
   BEGIN
      DELETE FROM cm_tranches
            WHERE creditid = p_creditid AND tranchedate = p_tranchedate;

      COMMIT;
   END;

   PROCEDURE add_payments (
      p_creditid         IN   INTEGER,
      p_paydate          IN   DATE,
      p_payedamt         IN   NUMBER,
      p_payedintamt      IN   NUMBER,
      p_payeddueamt      IN   NUMBER,
      p_payeddueintamt   IN   NUMBER
   )
   IS
   
   cursor c_pay is
   select sum(payedamt) as pay
   from cm_payments
   where creditid = p_creditid;
     
   cursor c_tr is
   select sum(trancheamount) as tr
   from cm_tranches;
      
     payamt number;
     tramt number;
          
   BEGIN
      INSERT INTO cm_payments
                  (creditid, paydate, payedamt, payedintamt,
                   payeddueamt, payeddueintamt, payedpenaltyamt)
           VALUES (p_creditid, p_paydate, p_payedamt, p_payedintamt,
                   p_payeddueamt, p_payeddueintamt, 0);

      open c_pay;
      fetch c_pay into payamt;
      close c_pay;
      
      open c_tr;
      fetch c_tr into tramt;
      close c_tr;

      COMMIT;
   END;

   PROCEDURE edit_payments (
      p_creditid         IN   INTEGER,
      p_paydate          IN   DATE,
      p_payedamt         IN   NUMBER,
      p_payedintamt      IN   NUMBER,
      p_payeddueamt      IN   NUMBER,
      p_payeddueintamt   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_payments
         SET payedamt = p_payedamt,
             payedintamt = p_payedintamt,
             payeddueamt = p_payeddueamt,
             payeddueintamt = p_payeddueintamt
       WHERE creditid = p_creditid AND paydate = p_paydate;

      COMMIT;
   END;

   PROCEDURE del_payments (p_creditid IN INTEGER, p_paydate IN DATE)
   IS
   BEGIN
      DELETE FROM cm_payments
            WHERE creditid = p_creditid AND paydate = p_paydate;

      COMMIT;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CORR_TRCH_PAY

-- Start of DDL Script for Package CREDITSMGR.CM_CORRECT
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_correct
  IS

  function CrdBorrName_Get(p_ID in integer)
  return varchar2;
  function CrdNumber_Get(p_ID in integer)
  return varchar2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_correct
IS

  function CrdNumber_Get(p_ID in integer)
  return varchar2
  
  is
    Result varchar2(256);
  begin
  
    select NumberOfCredit 
      into Result
      from CM_ACTIVE_CREDITS
     where ID=p_ID;
     
    return Result;
      
  end;
  
  function CrdBorrName_Get(p_ID in integer)
  return varchar2
  
  is
    Result varchar2(256);
  begin
  
    select Name
      into Result
      from CM_BOOROWERINFO
     where CreditID=p_ID;
     
    return Result;
      
  end;
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CORRECT

-- Start of DDL Script for Package CREDITSMGR.CM_CREDIT
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_credit
IS
   PROCEDURE contract_close (p_creditid IN INTEGER);

   PROCEDURE disableinterestcalc (c_id IN INTEGER);

   PROCEDURE enabledinterestcalc (c_id IN INTEGER);

   PROCEDURE intprevstate_add (p_creditid IN INTEGER, p_date IN DATE);

   PROCEDURE intcurrstate_add (p_creditid IN INTEGER, p_date IN DATE);

   PROCEDURE history_edit (
      p_creditid           IN   INTEGER,
      p_reserveid          IN   NUMBER,
      p_duereserveid       IN   NUMBER,
      p_pledgeprice        IN   NUMBER,
      p_creditlineamount   IN   NUMBER
   );

   PROCEDURE history_edit1 (
      p_creditid           IN   INTEGER,
      p_reserveid          IN   NUMBER,
      p_duereserveid       IN   NUMBER,
      p_pledgeprice        IN   NUMBER,
      p_creditlineamount   IN   NUMBER
   );

   PROCEDURE businessplan_add (p_id INTEGER);

   PROCEDURE history_add (
      p_creditid            IN   INTEGER,
      p_hdate               IN   DATE,
      p_reserveid           IN   NUMBER,
      p_duereserveid        IN   NUMBER,
      p_obligation          IN   NUMBER,
      p_pledgeprice         IN   NUMBER,
      p_givenamount         IN   NUMBER,
      p_pledgepricetorpaq   IN   NUMBER DEFAULT 0,
      p_pledgepriceev       IN   NUMBER DEFAULT 0
   );

   PROCEDURE guarantee_add (
      p_creditid              IN   INTEGER,
      p_pledgeid              IN   INTEGER,
      p_pledgepriceevkv       IN   NUMBER DEFAULT 0,
      p_pledgepricetorpaqha   IN   NUMBER DEFAULT 0,
      p_pledgename            IN   VARCHAR2 DEFAULT NULL,
      p_holdername            IN   VARCHAR2 DEFAULT NULL,
      p_holderaddress         IN   VARCHAR2 DEFAULT NULL,
      p_anyinfotodisting      IN   VARCHAR2 DEFAULT NULL,
      p_registryno            IN   VARCHAR2 DEFAULT NULL,
      p_registryagency        IN   VARCHAR2 DEFAULT NULL,
      p_registrydate          IN   DATE DEFAULT NULL,
      p_pledgeinuse           IN   INTEGER DEFAULT NULL,
      p_pledgeinsurant        IN   INTEGER DEFAULT NULL,
      p_insuranceagency       IN   VARCHAR2 DEFAULT NULL,
      p_insuranceamount       IN   NUMBER DEFAULT NULL,
      p_insurancedate         IN   DATE DEFAULT NULL
   );

   PROCEDURE addcreditaccounts (
      p_cust              IN       INTEGER,
      p_val               IN       INTEGER,
      p_checkloan         IN       BOOLEAN,
      p_loanaccno         IN       VARCHAR2,
      p_checkboor         IN       BOOLEAN,
      p_booroweraccno     IN       VARCHAR2,
      p_checkprres        IN       BOOLEAN,
      p_prresaccno        IN       VARCHAR2,
      p_checkpurres       IN       BOOLEAN,
      p_prpurresaccno     IN       VARCHAR2,
      p_checkint          IN       BOOLEAN,
      p_intaccno          IN       VARCHAR2,
      p_checkdueloan      IN       BOOLEAN,
      p_dueloanaccno      IN       VARCHAR2,
      p_checksecres       IN       BOOLEAN,
      p_secresaccno       IN       VARCHAR2,
      p_checksecpurres    IN       BOOLEAN,
      p_secpurresaccno    IN       VARCHAR2,
      p_checkdueint       IN       BOOLEAN,
      p_dueintaccno       IN       VARCHAR2,
      p_checkoutpledg     IN       BOOLEAN,
      p_outpledgaccno     IN       VARCHAR2,
      p_checkobl          IN       BOOLEAN,
      p_outoblaccno       IN       VARCHAR2,
      p_checkoutloan      IN       BOOLEAN,
      p_outloanaccno      IN       VARCHAR2,
      p_checkoutint       IN       BOOLEAN,
      p_outintaccno       IN       VARCHAR2,
      p_checkcrdlineobl   IN       BOOLEAN,
      p_crdlineoblaccno   IN       VARCHAR2,
      p_loanaccid         OUT      INTEGER,
      p_booroweraccid     OUT      INTEGER,
      p_prresaccid        OUT      INTEGER,
      p_prpurresaccid     OUT      INTEGER,
      p_intaccid          OUT      INTEGER,
      p_dueloanaccid      OUT      INTEGER,
      p_secresaccid       OUT      INTEGER,
      p_secpurresaccid    OUT      INTEGER,
      p_dueintaccid       OUT      INTEGER,
      p_outpledgaccid     OUT      INTEGER,
      p_outoblaccid       OUT      INTEGER,
      p_outloanaccid      OUT      INTEGER,
      p_outintaccid       OUT      INTEGER,
      p_crdlineoblaccid   OUT      INTEGER
   );

   PROCEDURE generatecreditaccnumber (
      p_bal_cn            IN       INTEGER,
      p_filial            IN       INTEGER,
      p_custid            IN       INTEGER,
      p_val               IN       INTEGER,
      p_mcrdfil           IN       INTEGER,
      p_loanaccno         OUT      VARCHAR2,
      p_booroweraccno     OUT      VARCHAR2,
      p_prresaccno        OUT      VARCHAR2,
      p_prpurresaccno     OUT      VARCHAR2,
      p_intaccno          OUT      VARCHAR2,
      p_dueloanaccno      OUT      VARCHAR2,
      p_secresaccno       OUT      VARCHAR2,
      p_secpurresaccno    OUT      VARCHAR2,
      p_dueintaccno       OUT      VARCHAR2,
      p_outpledgaccno     OUT      VARCHAR2,
      p_outoblaccno       OUT      VARCHAR2,
      p_outloanaccno      OUT      VARCHAR2,
      p_outintaccno       OUT      VARCHAR2,
      p_crdlineoblaccno   OUT      VARCHAR2
   );

   FUNCTION get_accountcount (p_cnt IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION generateoneaccno (
      p_bal_cn    IN   INTEGER,
      p_cust      IN   INTEGER,
      p_val       IN   INTEGER,
      p_fil       IN   INTEGER,
      p_const     IN   VARCHAR2,
      p_mcrdfil   IN   INTEGER
   )
      RETURN VARCHAR2;

   FUNCTION get_balansbyacc (accno IN VARCHAR2)
      RETURN INTEGER;

   FUNCTION get_accdescription (
      mainbalance    IN   INTEGER,
      childbalance   IN   INTEGER
   )
      RETURN VARCHAR2;

   PROCEDURE contractaddinfo (
      p_creditid              IN   INTEGER,
      p_boorowerid            IN   VARCHAR2,
      p_name                  IN   VARCHAR2,
      p_countrycode           IN   VARCHAR2,
      p_bankrupteystatus      IN   VARCHAR2,
      p_phonenumber           IN   VARCHAR2,
      p_address               IN   VARCHAR2,
      p_firstownerid          IN   VARCHAR2,
      p_firstownername        IN   VARCHAR2,
      p_secondownerid         IN   VARCHAR2,
      p_secondownername       IN   VARCHAR2,
      p_thirdownerid          IN   VARCHAR2,
      p_thirdownername        IN   VARCHAR2,
      p_salary                IN   NUMBER DEFAULT NULL,
      p_guarantorname         IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid           IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary       IN   NUMBER DEFAULT NULL,
      p_pledgename            IN   VARCHAR2,
      p_pledgeid              IN   INTEGER,
      p_holdername            IN   VARCHAR2,
      p_holderaddress         IN   VARCHAR2,
      p_anyinfotodisting      IN   VARCHAR2,
      p_registryno            IN   VARCHAR2,
      p_registryagency        IN   VARCHAR2,
      p_registrydate          IN   DATE,
      p_pledgeinuse           IN   INTEGER,
      p_pledgeinsurant        IN   INTEGER,
      p_insuranceagency       IN   VARCHAR2,
      p_insuranceamount       IN   NUMBER,
      p_insurancedate         IN   DATE,
      p_pledgepriceevkv       IN   NUMBER DEFAULT 0,
      p_pledgepricetorpaqha   IN   NUMBER DEFAULT 0
   );

   PROCEDURE contractaddinfo_edit (
      p_creditid            IN   INTEGER,
      p_boorowerid          IN   VARCHAR2,
      p_name                IN   VARCHAR2,
      p_countrycode         IN   VARCHAR2,
      p_bankrupteystatus    IN   VARCHAR2,
      p_phonenumber         IN   VARCHAR2,
      p_address             IN   VARCHAR2,
      p_firstownerid        IN   VARCHAR2,
      p_firstownername      IN   VARCHAR2,
      p_secondownerid       IN   VARCHAR2,
      p_secondownername     IN   VARCHAR2,
      p_thirdownerid        IN   VARCHAR2,
      p_thirdownername      IN   VARCHAR2,
      p_salary              IN   NUMBER DEFAULT NULL,
      p_guarantorname       IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid         IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary     IN   NUMBER DEFAULT NULL,
      p_pledgename          IN   VARCHAR2,
      p_holdername          IN   VARCHAR2,
      p_holderaddress       IN   VARCHAR2,
      p_anyinfotodisting    IN   VARCHAR2,
      p_registryno          IN   VARCHAR2,
      p_registryagency      IN   VARCHAR2,
      p_registrydate        IN   DATE,
      p_pledgeinuse         IN   INTEGER,
      p_pledgeinsurant      IN   INTEGER,
      p_insuranceagency     IN   VARCHAR2,
      p_insuranceamount     IN   NUMBER,
      p_insurancedate       IN   DATE,
      pledgepriceevkv       IN   NUMBER DEFAULT 0,
      pledgepricetorpaqha   IN   NUMBER DEFAULT 0
   );

   PROCEDURE boorowerinfo_add (
      p_creditid           IN   INTEGER,
      p_boorowerid         IN   VARCHAR2,
      p_name               IN   VARCHAR2,
      p_countrycode        IN   VARCHAR2 DEFAULT NULL,
      p_bankrupteystatus   IN   VARCHAR2 DEFAULT 0,
      p_phonenumber        IN   VARCHAR2 DEFAULT NULL,
      p_address            IN   VARCHAR2 DEFAULT NULL,
      p_firstownerid       IN   VARCHAR2 DEFAULT NULL,
      p_firstownername     IN   VARCHAR2 DEFAULT NULL,
      p_secondownerid      IN   VARCHAR2 DEFAULT NULL,
      p_secondownername    IN   VARCHAR2 DEFAULT NULL,
      p_thirdownerid       IN   VARCHAR2 DEFAULT NULL,
      p_thirdownername     IN   VARCHAR2 DEFAULT NULL,
      p_salary             IN   NUMBER DEFAULT NULL,
      p_guarantorname      IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid        IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary    IN   NUMBER DEFAULT NULL
   );

   FUNCTION portfolio_add (
      p_currency               IN   INTEGER,
      p_boorowerid             IN   INTEGER,
      p_initialamount          IN   NUMBER DEFAULT 0,
      p_creditlineamount       IN   NUMBER,
      p_annualyinterestrate    IN   NUMBER,
      p_annualyoverduerate     IN   NUMBER,
      p_annualypenaltyrate     IN   NUMBER,
      p_dateofconclusion       IN   DATE,
      p_dateofgrant            IN   DATE,
      p_duedatefirstcontract   IN   DATE,
      p_duedatelastcontract    IN   DATE DEFAULT NULL,
      p_closedate              IN   DATE,
      p_numberofcredit         IN   VARCHAR2,
      p_purposeofcredit        IN   VARCHAR2,
      p_customertype           IN   INTEGER,
      p_credittype             IN   INTEGER,
      p_personaltype           IN   INTEGER,
      p_autopayment            IN   INTEGER,
      p_autoexpire             IN   INTEGER,
      p_usrgroup               IN   VARCHAR2,
      p_branchid               IN   INTEGER,
      p_annualbankrate         IN   INTEGER,
      p_newfinanceamount       IN   INTEGER,
      p_numberofbankcredit     IN   VARCHAR2,
      p_intcalcmethod          IN   INTEGER,
      p_pledgsorts             IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION portfolio_edit (
      p_creditid               IN   INTEGER,
      p_currency               IN   INTEGER,
      p_boorowerid             IN   INTEGER,
      p_creditlineamount       IN   NUMBER,
      p_annualyinterestrate    IN   NUMBER,
      p_annualyoverduerate     IN   NUMBER,
      p_annualypenaltyrate     IN   NUMBER,
      p_dateofconclusion       IN   DATE,
      p_duedatefirstcontract   IN   DATE,
      p_numberofcredit         IN   VARCHAR2,
      p_purposeofcredit        IN   VARCHAR2,
      p_customertype           IN   INTEGER,
      p_credittype             IN   INTEGER,
      p_personaltype           IN   INTEGER,
      p_autopayment            IN   INTEGER,
      p_autoexpire             IN   INTEGER,
      p_usrgroup               IN   VARCHAR2,
      p_branchid               IN   INTEGER,
      p_annualbankrate              INTEGER,
      p_newfinanceamount       IN   INTEGER,
      p_numberofbankcredit     IN   VARCHAR2,
      p_intcalcmethod          IN   INTEGER,
      p_pledgsorts             IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION contract_add (
      currency                   IN   INTEGER,
      boorowerid                 IN   INTEGER,
      initialamount              IN   NUMBER DEFAULT 0,
      creditlineamount           IN   NUMBER,
      annualyinterestrate        IN   NUMBER,
      annualyoverduerate         IN   NUMBER,
      annualypenaltyrate         IN   NUMBER,
      dateofconclusion           IN   DATE,
      duedatefirstcontract       IN   DATE,
      numberofcredit             IN   VARCHAR2,
      purposeofcredit            IN   VARCHAR2,
      customertype               IN   INTEGER,
      credittype                 IN   INTEGER,
      personaltype               IN   INTEGER,
      autopayment                IN   INTEGER,
      autoexpire                 IN   INTEGER,
      usrgroup                   IN   VARCHAR2,
      branchid                   IN   INTEGER,
      annualbankrate             IN   INTEGER,
      newfinanceamount           IN   INTEGER,
      numberofbankcredit         IN   VARCHAR2,
      intcalcmethod              IN   INTEGER,
      pledgsorts                 IN   INTEGER,
      booroweraccid              IN   INTEGER,
      loanaccid                  IN   INTEGER,
      dueloanaccid               IN   INTEGER,
      interestaccid              IN   INTEGER,
      dueinterestaccid           IN   INTEGER,
      primaryreserveaccid        IN   INTEGER,
      secondaryreserveaccid      IN   INTEGER,
      outcollateralaccid         IN   INTEGER,
      outguaranteeaccid          IN   INTEGER,
      outinterestaccid           IN   INTEGER,
      crdlineoblaccid            IN   INTEGER,
      outloanaccid               IN   INTEGER,
      primarypurreserveaccid     IN   INTEGER,
      secondarypurreserveaccid   IN   INTEGER,
      reserveid                  IN   NUMBER,
      duereserveid               IN   NUMBER,
      pledgeprice                IN   NUMBER,
      pledgeid                   IN   INTEGER,
      pledgepriceevkv            IN   NUMBER,
      pledgepricetorpaqha        IN   NUMBER,
      pledgepricetorpaq          IN   NUMBER DEFAULT 0,
      pledgepriceev              IN   NUMBER DEFAULT 0,
      boorid                     IN   VARCHAR2,
      --Name in VarChar2,
      countrycode                IN   VARCHAR2,
      bankrupteystatus           IN   VARCHAR2 DEFAULT '0',
      phonenumber                IN   VARCHAR2,
      address                    IN   VARCHAR2,
      firstownerid               IN   VARCHAR2,
      firstownername             IN   VARCHAR2,
      secondownerid              IN   VARCHAR2,
      secondownername            IN   VARCHAR2,
      thirdownerid               IN   VARCHAR2,
      thirdownername             IN   VARCHAR2,
      salary                     IN   NUMBER DEFAULT NULL,
      guarantorname              IN   VARCHAR2 DEFAULT NULL,
      guarantorid                IN   VARCHAR2 DEFAULT NULL,
      guarantorsalary            IN   NUMBER DEFAULT NULL,
      pledgename                 IN   VARCHAR2,
      holdername                 IN   VARCHAR2,
      holderaddress              IN   VARCHAR2,
      anyinfotodisting           IN   VARCHAR2,
      registryno                 IN   VARCHAR2,
      registryagency             IN   VARCHAR2,
      registrydate               IN   DATE,
      pledgeinuse                IN   INTEGER,
      pledgeinsurant             IN   INTEGER,
      insuranceagency            IN   VARCHAR2,
      insuranceamount            IN   NUMBER,
      insurancedate              IN   DATE
   )
      RETURN INTEGER;

   FUNCTION contract_edit (
      creditid                   IN   INTEGER,
      currency                   IN   INTEGER,
      boorowerid                 IN   INTEGER,
      creditlineamount           IN   NUMBER,
      annualyinterestrate        IN   NUMBER,
      annualyoverduerate         IN   NUMBER,
      annualypenaltyrate         IN   NUMBER,
      dateofconclusion           IN   DATE,
      duedatefirstcontract       IN   DATE,
      numberofcredit             IN   VARCHAR2,
      purposeofcredit            IN   VARCHAR2,
      customertype               IN   INTEGER,
      credittype                 IN   INTEGER,
      personaltype               IN   INTEGER,
      autopayment                IN   INTEGER,
      autoexpire                 IN   INTEGER,
      usrgroup                   IN   VARCHAR2,
      branchid                   IN   INTEGER,
      annualbankrate             IN   INTEGER,
      newfinanceamount           IN   INTEGER,
      numberofbankcredit         IN   VARCHAR2,
      intcalcmethod              IN   INTEGER,
      pledgsorts                 IN   INTEGER,
      booroweraccid              IN   INTEGER,
      loanaccid                  IN   INTEGER,
      dueloanaccid               IN   INTEGER,
      interestaccid              IN   INTEGER,
      dueinterestaccid           IN   INTEGER,
      primaryreserveaccid        IN   INTEGER,
      secondaryreserveaccid      IN   INTEGER,
      outcollateralaccid         IN   INTEGER,
      outguaranteeaccid          IN   INTEGER,
      outinterestaccid           IN   INTEGER,
      crdlineoblaccid            IN   INTEGER,
      outloanaccid               IN   INTEGER,
      primarypurreserveaccid     IN   INTEGER,
      secondarypurreserveaccid   IN   INTEGER,
      reserveid                  IN   NUMBER,
      duereserveid               IN   NUMBER,
      pledgeprice                IN   NUMBER,
      pledgeid                   IN   INTEGER,
      pledgepriceevkv            IN   NUMBER,
      pledgepricetorpaqha        IN   NUMBER,
      pledgepricetorpaq          IN   NUMBER DEFAULT 0,
      pledgepriceev              IN   NUMBER DEFAULT 0,
      boorid                     IN   VARCHAR2,
      --Name in VarChar2,
      countrycode                IN   VARCHAR2,
      bankrupteystatus           IN   VARCHAR2,
      phonenumber                IN   VARCHAR2,
      address                    IN   VARCHAR2,
      firstownerid               IN   VARCHAR2,
      firstownername             IN   VARCHAR2,
      secondownerid              IN   VARCHAR2,
      secondownername            IN   VARCHAR2,
      thirdownerid               IN   VARCHAR2,
      thirdownername             IN   VARCHAR2,
      salary                     IN   NUMBER DEFAULT NULL,
      guarantorname              IN   VARCHAR2 DEFAULT NULL,
      guarantorid                IN   VARCHAR2 DEFAULT NULL,
      guarantorsalary            IN   NUMBER DEFAULT NULL,
      pledgename                 IN   VARCHAR2,
      holdername                 IN   VARCHAR2,
      holderaddress              IN   VARCHAR2,
      anyinfotodisting           IN   VARCHAR2,
      registryno                 IN   VARCHAR2,
      registryagency             IN   VARCHAR2,
      registrydate               IN   DATE,
      pledgeinuse                IN   INTEGER,
      pledgeinsurant             IN   INTEGER,
      insuranceagency            IN   VARCHAR2,
      insuranceamount            IN   NUMBER,
      insurancedate              IN   DATE
   )
      RETURN INTEGER;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_credit
IS
/*****************************************************/
/*  Company : Smart Systems Technology ltdї          */
/*  Author  : Asif N. Nazarov                        */
/*  Date : 2003-2004                                 */
/*****************************************************/
   FUNCTION portfolio_add (
      p_currency               IN   INTEGER,
      p_boorowerid             IN   INTEGER,
      p_initialamount          IN   NUMBER DEFAULT 0,
      p_creditlineamount       IN   NUMBER,
      p_annualyinterestrate    IN   NUMBER,
      p_annualyoverduerate     IN   NUMBER,
      p_annualypenaltyrate     IN   NUMBER,
      p_dateofconclusion       IN   DATE,
      p_dateofgrant            IN   DATE,
      p_duedatefirstcontract   IN   DATE,
      p_duedatelastcontract    IN   DATE DEFAULT NULL,
      p_closedate              IN   DATE,
      p_numberofcredit         IN   VARCHAR2,
      p_purposeofcredit        IN   VARCHAR2,
      p_customertype           IN   INTEGER,
      p_credittype             IN   INTEGER,
      p_personaltype           IN   INTEGER,
      p_autopayment            IN   INTEGER,
      p_autoexpire             IN   INTEGER,
      p_usrgroup               IN   VARCHAR2,
      p_branchid               IN   INTEGER,
      p_annualbankrate         IN   INTEGER,
      p_newfinanceamount       IN   INTEGER,
      p_numberofbankcredit     IN   VARCHAR2,
      p_intcalcmethod          IN   INTEGER,
      p_pledgsorts             IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      INSERT INTO cm_active_credits
                  (currency, boorowerid, initialamount,
                   creditlineamount, annualyinterestrate,
                   annualyoverduerate, annualypenaltyrate,
                   dateofconclusion, dateofgrant,
                   duedatefirstcontract, duedatelastcontract,
                   closedate, numberofcredit, purposeofcredit,
                   customertype, credittype, personaltype,
                   autopayment, autoexpire, usrgroup, branchid,
                   partitionkey, annualbankrate, newfinanceamount,
                   numberofbankcredit, intcalcmethod, pledgsorts
                  )
           VALUES (p_currency, p_boorowerid, p_initialamount,
                   p_creditlineamount, p_annualyinterestrate,
                   p_annualyoverduerate, p_annualypenaltyrate,
                   p_dateofconclusion, p_dateofgrant,
                   p_duedatefirstcontract, p_duedatelastcontract,
                   p_closedate, p_numberofcredit, p_purposeofcredit,
                   p_customertype, p_credittype, p_personaltype,
                   p_autopayment, p_autoexpire, p_usrgroup, p_branchid,
                   0, p_annualbankrate, p_newfinanceamount,
                   p_numberofbankcredit, p_intcalcmethod, p_pledgsorts
                  )
        RETURNING ID
             INTO RESULT;

      RETURN RESULT;
   END;

   FUNCTION portfolio_edit (
      p_creditid               IN   INTEGER,
      p_currency               IN   INTEGER,
      p_boorowerid             IN   INTEGER,
      p_creditlineamount       IN   NUMBER,
      p_annualyinterestrate    IN   NUMBER,
      p_annualyoverduerate     IN   NUMBER,
      p_annualypenaltyrate     IN   NUMBER,
      p_dateofconclusion       IN   DATE,
      p_duedatefirstcontract   IN   DATE,
      p_numberofcredit         IN   VARCHAR2,
      p_purposeofcredit        IN   VARCHAR2,
      p_customertype           IN   INTEGER,
      p_credittype             IN   INTEGER,
      p_personaltype           IN   INTEGER,
      p_autopayment            IN   INTEGER,
      p_autoexpire             IN   INTEGER,
      p_usrgroup               IN   VARCHAR2,
      p_branchid               IN   INTEGER,
      p_annualbankrate              INTEGER,
      p_newfinanceamount       IN   INTEGER,
      p_numberofbankcredit     IN   VARCHAR2,
      p_intcalcmethod          IN   INTEGER,
      p_pledgsorts             IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      UPDATE cm_active_credits
         SET currency = p_currency,
             boorowerid = p_boorowerid,
             creditlineamount = p_creditlineamount,
             annualyinterestrate = p_annualyinterestrate,
             annualyoverduerate = p_annualyoverduerate,
             annualypenaltyrate = p_annualypenaltyrate,
             dateofconclusion = p_dateofconclusion,
             duedatefirstcontract = p_duedatefirstcontract,
             numberofcredit = p_numberofcredit,
             purposeofcredit = p_purposeofcredit,
             customertype = p_customertype,
             credittype = p_credittype,
             personaltype = p_personaltype,
             autopayment = p_autopayment,
             autoexpire = p_autoexpire,
             usrgroup = p_usrgroup,
             branchid = p_branchid,
             annualbankrate = p_annualbankrate,
             newfinanceamount = p_newfinanceamount,
             numberofbankcredit = p_numberofbankcredit,
             intcalcmethod = p_intcalcmethod,
             pledgsorts = p_pledgsorts
       WHERE ID = p_creditid;

      RETURN p_creditid;
   END;

   PROCEDURE guarantee_add (
      p_creditid              IN   INTEGER,
      p_pledgeid              IN   INTEGER,
      p_pledgepriceevkv       IN   NUMBER DEFAULT 0,
      p_pledgepricetorpaqha   IN   NUMBER DEFAULT 0,
      p_pledgename            IN   VARCHAR2 DEFAULT NULL,
      p_holdername            IN   VARCHAR2 DEFAULT NULL,
      p_holderaddress         IN   VARCHAR2 DEFAULT NULL,
      p_anyinfotodisting      IN   VARCHAR2 DEFAULT NULL,
      p_registryno            IN   VARCHAR2 DEFAULT NULL,
      p_registryagency        IN   VARCHAR2 DEFAULT NULL,
      p_registrydate          IN   DATE DEFAULT NULL,
      p_pledgeinuse           IN   INTEGER DEFAULT NULL,
      p_pledgeinsurant        IN   INTEGER DEFAULT NULL,
      p_insuranceagency       IN   VARCHAR2 DEFAULT NULL,
      p_insuranceamount       IN   NUMBER DEFAULT NULL,
      p_insurancedate         IN   DATE DEFAULT NULL
   )
   IS
   BEGIN
      INSERT INTO cm_guarantee
                  (creditid, pledgeid, pledgename, holdername,
                   holderaddress, anyinfotodisting, registryno,
                   registryagency, registrydate, pledgeinuse,
                   pledgeinsurant, insuranceagency, insuranceamount,
                   insurancedate, pledgepricetorpaqha, pledgepriceevkv
                  )
           VALUES (p_creditid, p_pledgeid, p_pledgename, p_holdername,
                   p_holderaddress, p_anyinfotodisting, p_registryno,
                   p_registryagency, p_registrydate, p_pledgeinuse,
                   p_pledgeinsurant, p_insuranceagency, p_insuranceamount,
                   p_insurancedate, p_pledgepricetorpaqha, p_pledgepriceevkv
                  );
   END;

   PROCEDURE guarantee_edit (
      p_creditid              IN   INTEGER,
      p_pledgename            IN   VARCHAR2,
      p_holdername            IN   VARCHAR2,
      p_holderaddress         IN   VARCHAR2,
      p_anyinfotodisting      IN   VARCHAR2,
      p_registryno            IN   VARCHAR2,
      p_registryagency        IN   VARCHAR2,
      p_registrydate          IN   DATE,
      p_pledgeinuse           IN   INTEGER,
      p_pledgeinsurant        IN   INTEGER,
      p_insuranceagency       IN   VARCHAR2,
      p_insuranceamount       IN   NUMBER,
      p_insurancedate         IN   DATE,
      p_pledgepriceevkv       IN   NUMBER,
      p_pledgepricetorpaqha   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_guarantee
         SET pledgename = p_pledgename,
             holdername = p_holdername,
             holderaddress = p_holderaddress,
             anyinfotodisting = p_anyinfotodisting,
             registryno = p_registryno,
             registryagency = p_registryagency,
             registrydate = p_registrydate,
             pledgeinuse = p_pledgeinuse,
             pledgeinsurant = p_pledgeinsurant,
             insuranceagency = p_insuranceagency,
             insuranceamount = p_insuranceamount,
             insurancedate = p_insurancedate,
             pledgepriceevkv = p_pledgepriceevkv,
             pledgepricetorpaqha = p_pledgepricetorpaqha
       WHERE creditid = p_creditid;
   END;

   PROCEDURE intcurrstate_add (p_creditid IN INTEGER, p_date IN DATE)
   IS
   BEGIN
      INSERT INTO cm_interests
                  (partitionkey, creditid, hdate, interest, dueinterest,
                   inttrid, dueinttrid, trprocessed
                  )
           VALUES (0, p_creditid, p_date, 0, 0,
                   NULL, NULL, 0
                  );
   END;

   PROCEDURE intprevstate_add (p_creditid IN INTEGER, p_date IN DATE)
   IS
   BEGIN
      INSERT INTO cm_interests
                  (partitionkey, creditid, hdate, interest, dueinterest,
                   inttrid, dueinttrid, trprocessed
                  )
           VALUES (1, p_creditid, p_date, 0, 0,
                   NULL, NULL, 0
                  );
   END;

   PROCEDURE guarantee_edit (
      p_creditid              IN   INTEGER,
      p_pledgeid              IN   INTEGER,
      p_pledgepriceevkv       IN   NUMBER,
      p_pledgepricetorpaqha   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_guarantee
         SET pledgeid = p_pledgeid
       WHERE creditid = p_creditid;
   END;

   PROCEDURE boorowerinfo_add (
      p_creditid           IN   INTEGER,
      p_boorowerid         IN   VARCHAR2,
      p_name               IN   VARCHAR2,
      p_countrycode        IN   VARCHAR2 DEFAULT NULL,
      p_bankrupteystatus   IN   VARCHAR2 DEFAULT 0,
      p_phonenumber        IN   VARCHAR2 DEFAULT NULL,
      p_address            IN   VARCHAR2 DEFAULT NULL,
      p_firstownerid       IN   VARCHAR2 DEFAULT NULL,
      p_firstownername     IN   VARCHAR2 DEFAULT NULL,
      p_secondownerid      IN   VARCHAR2 DEFAULT NULL,
      p_secondownername    IN   VARCHAR2 DEFAULT NULL,
      p_thirdownerid       IN   VARCHAR2 DEFAULT NULL,
      p_thirdownername     IN   VARCHAR2 DEFAULT NULL,
      p_salary             IN   NUMBER DEFAULT NULL,
      p_guarantorname      IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid        IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary    IN   NUMBER DEFAULT NULL
   )
   IS
   BEGIN
      INSERT INTO cm_boorowerinfo
                  (creditid, boorowerid, NAME, countrycode,
                   bankrupteystatus, phonenumber, address,
                   firstownerid, firstownername, secondownerid,
                   secondownername, thirdownerid, thirdownername,
                   salary, guarantorname, guarantorid,
                   guarantorsalary
                  )
           VALUES (p_creditid, p_boorowerid, p_name, p_countrycode,
                   p_bankrupteystatus, p_phonenumber, p_address,
                   p_firstownerid, p_firstownername, p_secondownerid,
                   p_secondownername, p_thirdownerid, p_thirdownername,
                   p_salary, p_guarantorname, p_guarantorid,
                   p_guarantorsalary
                  );
   END;

   PROCEDURE boorowerinfo_edit (
      p_creditid           IN   INTEGER,
      p_boorowerid         IN   VARCHAR2,
      p_name               IN   VARCHAR2,
      p_countrycode        IN   VARCHAR2,
      p_bankrupteystatus   IN   VARCHAR2,
      p_phonenumber        IN   VARCHAR2,
      p_address            IN   VARCHAR2,
      p_firstownerid       IN   VARCHAR2,
      p_firstownername     IN   VARCHAR2,
      p_secondownerid      IN   VARCHAR2,
      p_secondownername    IN   VARCHAR2,
      p_thirdownerid       IN   VARCHAR2,
      p_thirdownername     IN   VARCHAR2,
      p_salary             IN   NUMBER DEFAULT NULL,
      p_guarantorname      IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid        IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary    IN   NUMBER DEFAULT NULL
   )
   IS
   BEGIN
      UPDATE cm_boorowerinfo
         SET creditid = p_creditid,
             boorowerid = p_boorowerid,
             NAME = p_name,
             countrycode = p_countrycode,
             bankrupteystatus = p_bankrupteystatus,
             phonenumber = p_phonenumber,
             address = p_address,
             firstownerid = p_firstownerid,
             firstownername = p_firstownername,
             secondownerid = p_secondownerid,
             secondownername = p_secondownername,
             thirdownerid = p_thirdownerid,
             thirdownername = p_thirdownername,
             salary = p_salary,
             guarantorname = p_guarantorname,
             guarantorid = p_guarantorid,
             guarantorsalary = p_guarantorsalary
       WHERE creditid = p_creditid;
   END;

   PROCEDURE boorowerinfo_edit (p_creditid IN INTEGER, p_name IN VARCHAR2)
   IS
   BEGIN
      UPDATE cm_boorowerinfo
         SET creditid = p_creditid,
             NAME = p_name
       WHERE creditid = p_creditid;
   END;

   PROCEDURE accounts_add (
      p_creditid                   IN   INTEGER,
      p_booroweraccid              IN   INTEGER,
      p_loanaccid                  IN   INTEGER,
      p_dueloanaccid               IN   INTEGER,
      p_interestaccid              IN   INTEGER,
      p_dueinterestaccid           IN   INTEGER,
      p_primaryreserveaccid        IN   INTEGER,
      p_secondaryreserveaccid      IN   INTEGER,
      p_outcollateralaccid         IN   INTEGER,
      p_outguaranteeaccid          IN   INTEGER,
      p_outinterestaccid           IN   INTEGER,
      p_crdlineoblaccid            IN   INTEGER,
      p_outloanaccid               IN   INTEGER,
      p_primarypurreserveaccid     IN   INTEGER,
      p_secondarypurreserveaccid   IN   INTEGER
   )
   IS
   BEGIN
      INSERT INTO cm_accounts
                  (creditid, booroweraccid, contractaccid, loanaccid,
                   dueloanaccid, interestaccid, dueinterestaccid,
                   primaryreserveaccid, secondaryreserveaccid,
                   outcollateralaccid, outguaranteeaccid,
                   outinterestaccid, crdlineoblaccid, outloanaccid,
                   primarypurreserveaccid, secondarypurreserveaccid
                  )
           VALUES (p_creditid, p_booroweraccid, p_loanaccid, p_loanaccid,
                   p_dueloanaccid, p_interestaccid, p_dueinterestaccid,
                   p_primaryreserveaccid, p_secondaryreserveaccid,
                   p_outcollateralaccid, p_outguaranteeaccid,
                   p_outinterestaccid, p_crdlineoblaccid, p_outloanaccid,
                   p_primarypurreserveaccid, p_secondarypurreserveaccid
                  );
   END;

   PROCEDURE accounts_edit (
      p_creditid                   IN   INTEGER,
      p_booroweraccid              IN   INTEGER,
      p_loanaccid                  IN   INTEGER,
      p_dueloanaccid               IN   INTEGER,
      p_interestaccid              IN   INTEGER,
      p_dueinterestaccid           IN   INTEGER,
      p_primaryreserveaccid        IN   INTEGER,
      p_secondaryreserveaccid      IN   INTEGER,
      p_outcollateralaccid         IN   INTEGER,
      p_outguaranteeaccid          IN   INTEGER,
      p_outinterestaccid           IN   INTEGER,
      p_crdlineoblaccid            IN   INTEGER,
      p_outloanaccid               IN   INTEGER,
      p_primarypurreserveaccid     IN   INTEGER,
      p_secondarypurreserveaccid   IN   INTEGER
   )
   IS
   BEGIN
      UPDATE cm_accounts
         SET booroweraccid = p_booroweraccid,
             loanaccid = p_loanaccid,
             contractaccid = p_loanaccid,
             dueloanaccid = p_dueloanaccid,
             interestaccid = p_interestaccid,
             dueinterestaccid = p_dueinterestaccid,
             primaryreserveaccid = p_primaryreserveaccid,
             secondaryreserveaccid = p_secondaryreserveaccid,
             outcollateralaccid = p_outcollateralaccid,
             outguaranteeaccid = p_outguaranteeaccid,
             outinterestaccid = p_outinterestaccid,
             crdlineoblaccid = p_crdlineoblaccid,
             outloanaccid = p_outloanaccid,
             primarypurreserveaccid = p_primarypurreserveaccid,
             secondarypurreserveaccid = p_secondarypurreserveaccid
       WHERE creditid = p_creditid;
   END;

   PROCEDURE history_add (
      p_creditid            IN   INTEGER,
      p_hdate               IN   DATE,
      p_reserveid           IN   NUMBER,
      p_duereserveid        IN   NUMBER,
      p_obligation          IN   NUMBER,
      p_pledgeprice         IN   NUMBER,
      p_givenamount         IN   NUMBER,
      p_pledgepricetorpaq   IN   NUMBER DEFAULT 0,
      p_pledgepriceev       IN   NUMBER DEFAULT 0
   )
   IS
      prevdate   DATE;
   BEGIN
      SELECT pred_dat
        INTO prevdate
        FROM sb_sysdat;

      INSERT INTO cm_curr_state
                  (creditid, hdate, lastcalcdate, stopcalcdate, rest,
                   interestrest, duerest, dueinterestrest, reserveid,
                   duereserveid, givenamount, obligation,
                   pledgeprice, partitionkey, pledgepricetorpaq, pledgepriceev
                  )
           VALUES (p_creditid, p_hdate, p_hdate - 1, NULL, 0,
                   0, 0, 0, p_reserveid,
                   p_duereserveid, p_givenamount, p_obligation,
                   p_pledgeprice, 0, p_pledgepricetorpaq, p_pledgepriceev
                  );

      INSERT INTO cm_prev_state
                  (creditid, hdate, lastcalcdate, stopcalcdate, rest,
                   interestrest, duerest, dueinterestrest, reserveid,
                   duereserveid, obligation, pledgeprice, partitionkey,
                   pledgepricetorpaq, pledgepriceev
                  )
           VALUES (p_creditid, prevdate, p_hdate - 1, NULL, 0,
                   0, 0, 0, p_reserveid,
                   p_duereserveid, p_obligation, p_pledgeprice, 1,
                   p_pledgepricetorpaq, p_pledgepriceev
                  );
   END;

   PROCEDURE history_edit (
      p_creditid           IN   INTEGER,
      p_reserveid          IN   NUMBER,
      p_duereserveid       IN   NUMBER,
      p_pledgeprice        IN   NUMBER,
      p_creditlineamount   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_curr_state
         SET reserveid = p_reserveid,
             duereserveid = p_duereserveid,
             obligation = p_creditlineamount - givenamount,
             pledgeprice = p_pledgeprice
       WHERE creditid = p_creditid;
   END;

   PROCEDURE history_edit1 (
      p_creditid           IN   INTEGER,
      p_reserveid          IN   NUMBER,
      p_duereserveid       IN   NUMBER,
      p_pledgeprice        IN   NUMBER,
      p_creditlineamount   IN   NUMBER
   )
   IS
   BEGIN
      UPDATE cm_curr_state
         SET reserveid = p_reserveid,
             duereserveid = p_duereserveid,
             pledgeprice = p_pledgeprice
       WHERE creditid = p_creditid;
   END;

   FUNCTION contract_add (
      currency                   IN   INTEGER,
      boorowerid                 IN   INTEGER,
      initialamount              IN   NUMBER DEFAULT 0,
      creditlineamount           IN   NUMBER,
      annualyinterestrate        IN   NUMBER,
      annualyoverduerate         IN   NUMBER,
      annualypenaltyrate         IN   NUMBER,
      dateofconclusion           IN   DATE,
      duedatefirstcontract       IN   DATE,
      numberofcredit             IN   VARCHAR2,
      purposeofcredit            IN   VARCHAR2,
      customertype               IN   INTEGER,
      credittype                 IN   INTEGER,
      personaltype               IN   INTEGER,
      autopayment                IN   INTEGER,
      autoexpire                 IN   INTEGER,
      usrgroup                   IN   VARCHAR2,
      branchid                   IN   INTEGER,
      annualbankrate             IN   INTEGER,
      newfinanceamount           IN   INTEGER,
      numberofbankcredit         IN   VARCHAR2,
      intcalcmethod              IN   INTEGER,
      pledgsorts                 IN   INTEGER,
      booroweraccid              IN   INTEGER,
      loanaccid                  IN   INTEGER,
      dueloanaccid               IN   INTEGER,
      interestaccid              IN   INTEGER,
      dueinterestaccid           IN   INTEGER,
      primaryreserveaccid        IN   INTEGER,
      secondaryreserveaccid      IN   INTEGER,
      outcollateralaccid         IN   INTEGER,
      outguaranteeaccid          IN   INTEGER,
      outinterestaccid           IN   INTEGER,
      crdlineoblaccid            IN   INTEGER,
      outloanaccid               IN   INTEGER,
      primarypurreserveaccid     IN   INTEGER,
      secondarypurreserveaccid   IN   INTEGER,
      reserveid                  IN   NUMBER,
      duereserveid               IN   NUMBER,
      pledgeprice                IN   NUMBER,
      pledgeid                   IN   INTEGER,
      pledgepriceevkv            IN   NUMBER,
      pledgepricetorpaqha        IN   NUMBER,
      pledgepricetorpaq          IN   NUMBER DEFAULT 0,
      pledgepriceev              IN   NUMBER DEFAULT 0,
      boorid                     IN   VARCHAR2,
      --Name in VarChar2,
      countrycode                IN   VARCHAR2,
      bankrupteystatus           IN   VARCHAR2 DEFAULT '0',
      phonenumber                IN   VARCHAR2,
      address                    IN   VARCHAR2,
      firstownerid               IN   VARCHAR2,
      firstownername             IN   VARCHAR2,
      secondownerid              IN   VARCHAR2,
      secondownername            IN   VARCHAR2,
      thirdownerid               IN   VARCHAR2,
      thirdownername             IN   VARCHAR2,
      salary                     IN   NUMBER DEFAULT NULL,
      guarantorname              IN   VARCHAR2 DEFAULT NULL,
      guarantorid                IN   VARCHAR2 DEFAULT NULL,
      guarantorsalary            IN   NUMBER DEFAULT NULL,
      pledgename                 IN   VARCHAR2,
      holdername                 IN   VARCHAR2,
      holderaddress              IN   VARCHAR2,
      anyinfotodisting           IN   VARCHAR2,
      registryno                 IN   VARCHAR2,
      registryagency             IN   VARCHAR2,
      registrydate               IN   DATE,
      pledgeinuse                IN   INTEGER,
      pledgeinsurant             IN   INTEGER,
      insuranceagency            IN   VARCHAR2,
      insuranceamount            IN   NUMBER,
      insurancedate              IN   DATE
   )
      RETURN INTEGER
   IS
      NAME        VARCHAR2 (255);
      RESULT      INTEGER;
      today       DATE;
      yesterday   DATE;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO today, yesterday
        FROM sb_sysdat;

      RESULT :=
         portfolio_add (p_currency                  => currency,
                        p_boorowerid                => boorowerid,
                        p_initialamount             => 0, --Initial Amount not defined
                        p_creditlineamount          => creditlineamount,
                        p_annualyinterestrate       => annualyinterestrate,
                        p_annualyoverduerate        => annualyoverduerate,
                        p_annualypenaltyrate        => annualypenaltyrate,
                        p_dateofconclusion          => dateofconclusion,
                        p_dateofgrant               => NULL,
                        p_duedatefirstcontract      => duedatefirstcontract,
                        ---   --    p_DueDateLastContract=> NULL,
                        p_closedate                 => NULL,
                        p_numberofcredit            => numberofcredit,
                        p_purposeofcredit           => purposeofcredit,
                        p_customertype              => customertype,
                        p_credittype                => credittype,
                        p_personaltype              => personaltype,
                        p_autopayment               => autopayment,
                        p_autoexpire                => autoexpire,
                        p_usrgroup                  => usrgroup,
                        p_branchid                  => branchid,
                        p_annualbankrate            => annualbankrate,
                        p_newfinanceamount          => newfinanceamount,
                        p_numberofbankcredit        => numberofbankcredit,
                        p_intcalcmethod             => intcalcmethod,
                        p_pledgsorts                => pledgsorts
                       );
      accounts_add (p_creditid                      => RESULT,
                    p_booroweraccid                 => booroweraccid,
                    p_loanaccid                     => loanaccid,
                    p_dueloanaccid                  => dueloanaccid,
                    p_interestaccid                 => interestaccid,
                    p_dueinterestaccid              => dueinterestaccid,
                    p_primaryreserveaccid           => primaryreserveaccid,
                    p_secondaryreserveaccid         => secondaryreserveaccid,
                    p_outcollateralaccid            => outcollateralaccid,
                    p_outguaranteeaccid             => outguaranteeaccid,
                    p_outinterestaccid              => outinterestaccid,
                    p_crdlineoblaccid               => crdlineoblaccid,
                    p_outloanaccid                  => outloanaccid,
                    p_primarypurreserveaccid        => primarypurreserveaccid,
                    p_secondarypurreserveaccid      => secondarypurreserveaccid
                   );
      history_add (p_creditid               => RESULT,
                   p_hdate                  => today,
                   p_reserveid              => reserveid,
                   p_duereserveid           => duereserveid,
                   p_obligation             => creditlineamount, --obligation
                   p_pledgeprice            => pledgeprice,
                   p_givenamount            => 0,
                   p_pledgepricetorpaq      => pledgepricetorpaq,
                   p_pledgepriceev          => pledgepriceev
                  );

      SELECT NAME
        INTO NAME
        FROM cm_sb_customers
       WHERE ID = boorowerid;

      intcurrstate_add (p_creditid => RESULT, p_date => today);
      intprevstate_add (p_creditid => RESULT, p_date => yesterday);
      /*   BoorowerInfo_Add(
           p_CreditID=> Result,
           p_BoorowerID=> null,
           p_Name=> Name
         );

         Guarantee_Add(
           p_CreditID=>Result,
           p_PLEDGEID=> PLEDGEID,
           p_pledgepriceevkv=> pledgepriceevkv,
           p_pledgepricetorpaqha=> pledgepricetorpaqha
         );*/
      contractaddinfo (p_creditid                 => RESULT,
                       p_boorowerid               => boorid,
                       p_name                     => NAME,
                       p_countrycode              => countrycode,
                       p_bankrupteystatus         => NVL (bankrupteystatus,
                                                          '0'
                                                         ),
                       p_phonenumber              => phonenumber,
                       p_address                  => address,
                       p_firstownerid             => firstownerid,
                       p_firstownername           => firstownername,
                       p_secondownerid            => secondownerid,
                       p_secondownername          => secondownername,
                       p_thirdownerid             => thirdownerid,
                       p_thirdownername           => thirdownername,
                       p_salary                   => salary,
                       p_guarantorname            => guarantorname,
                       p_guarantorid              => guarantorid,
                       p_guarantorsalary          => guarantorsalary,
                       p_pledgename               => pledgename,
                       p_pledgeid                 => pledgeid,
                       p_holdername               => holdername,
                       p_holderaddress            => holderaddress,
                       p_anyinfotodisting         => anyinfotodisting,
                       p_registryno               => registryno,
                       p_registryagency           => registryagency,
                       p_registrydate             => registrydate,
                       p_pledgeinuse              => pledgeinuse,
                       p_pledgeinsurant           => pledgeinsurant,
                       p_insuranceagency          => insuranceagency,
                       p_insuranceamount          => insuranceamount,
                       p_insurancedate            => insurancedate,
                       p_pledgepriceevkv          => pledgepriceevkv,
                       p_pledgepricetorpaqha      => pledgepricetorpaqha
                      );
      COMMIT WORK;
      RETURN RESULT;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;

   FUNCTION contract_edit (
      creditid                   IN   INTEGER,
      currency                   IN   INTEGER,
      boorowerid                 IN   INTEGER,
      creditlineamount           IN   NUMBER,
      annualyinterestrate        IN   NUMBER,
      annualyoverduerate         IN   NUMBER,
      annualypenaltyrate         IN   NUMBER,
      dateofconclusion           IN   DATE,
      duedatefirstcontract       IN   DATE,
      numberofcredit             IN   VARCHAR2,
      purposeofcredit            IN   VARCHAR2,
      customertype               IN   INTEGER,
      credittype                 IN   INTEGER,
      personaltype               IN   INTEGER,
      autopayment                IN   INTEGER,
      autoexpire                 IN   INTEGER,
      usrgroup                   IN   VARCHAR2,
      branchid                   IN   INTEGER,
      annualbankrate             IN   INTEGER,
      newfinanceamount           IN   INTEGER,
      numberofbankcredit         IN   VARCHAR2,
      intcalcmethod              IN   INTEGER,
      pledgsorts                 IN   INTEGER,
      booroweraccid              IN   INTEGER,
      loanaccid                  IN   INTEGER,
      dueloanaccid               IN   INTEGER,
      interestaccid              IN   INTEGER,
      dueinterestaccid           IN   INTEGER,
      primaryreserveaccid        IN   INTEGER,
      secondaryreserveaccid      IN   INTEGER,
      outcollateralaccid         IN   INTEGER,
      outguaranteeaccid          IN   INTEGER,
      outinterestaccid           IN   INTEGER,
      crdlineoblaccid            IN   INTEGER,
      outloanaccid               IN   INTEGER,
      primarypurreserveaccid     IN   INTEGER,
      secondarypurreserveaccid   IN   INTEGER,
      reserveid                  IN   NUMBER,
      duereserveid               IN   NUMBER,
      pledgeprice                IN   NUMBER,
      pledgeid                   IN   INTEGER,
      pledgepriceevkv            IN   NUMBER,
      pledgepricetorpaqha        IN   NUMBER,
      pledgepricetorpaq          IN   NUMBER DEFAULT 0,
      pledgepriceev              IN   NUMBER DEFAULT 0,
      boorid                     IN   VARCHAR2,
      --Name in VarChar2,
      countrycode                IN   VARCHAR2,
      bankrupteystatus           IN   VARCHAR2,
      phonenumber                IN   VARCHAR2,
      address                    IN   VARCHAR2,
      firstownerid               IN   VARCHAR2,
      firstownername             IN   VARCHAR2,
      secondownerid              IN   VARCHAR2,
      secondownername            IN   VARCHAR2,
      thirdownerid               IN   VARCHAR2,
      thirdownername             IN   VARCHAR2,
      salary                     IN   NUMBER DEFAULT NULL,
      guarantorname              IN   VARCHAR2 DEFAULT NULL,
      guarantorid                IN   VARCHAR2 DEFAULT NULL,
      guarantorsalary            IN   NUMBER DEFAULT NULL,
      pledgename                 IN   VARCHAR2,
      holdername                 IN   VARCHAR2,
      holderaddress              IN   VARCHAR2,
      anyinfotodisting           IN   VARCHAR2,
      registryno                 IN   VARCHAR2,
      registryagency             IN   VARCHAR2,
      registrydate               IN   DATE,
      pledgeinuse                IN   INTEGER,
      pledgeinsurant             IN   INTEGER,
      insuranceagency            IN   VARCHAR2,
      insuranceamount            IN   NUMBER,
      insurancedate              IN   DATE
   )
      RETURN INTEGER
   IS
      NAME     VARCHAR2 (255);
      RESULT   INTEGER;
      today    DATE;
   BEGIN
      SELECT tek_dat
        INTO today
        FROM sb_sysdat;

      RESULT :=
         portfolio_edit (p_creditid                  => creditid,
                         p_currency                  => currency,
                         p_boorowerid                => boorowerid,
                         p_creditlineamount          => creditlineamount,
                         p_annualyinterestrate       => annualyinterestrate,
                         p_annualyoverduerate        => annualyoverduerate,
                         p_annualypenaltyrate        => annualypenaltyrate,
                         p_dateofconclusion          => dateofconclusion,
                         p_duedatefirstcontract      => duedatefirstcontract,
                         p_numberofcredit            => numberofcredit,
                         p_purposeofcredit           => purposeofcredit,
                         p_customertype              => customertype,
                         p_credittype                => credittype,
                         p_personaltype              => personaltype,
                         p_autopayment               => autopayment,
                         p_autoexpire                => autoexpire,
                         p_usrgroup                  => usrgroup,
                         p_branchid                  => branchid,
                         p_annualbankrate            => annualbankrate,
                         p_newfinanceamount          => newfinanceamount,
                         p_numberofbankcredit        => numberofbankcredit,
                         p_intcalcmethod             => intcalcmethod,
                         p_pledgsorts                => pledgsorts
                        );
      accounts_edit (p_creditid                      => RESULT,
                     p_booroweraccid                 => booroweraccid,
                     p_loanaccid                     => loanaccid,
                     p_dueloanaccid                  => dueloanaccid,
                     p_interestaccid                 => interestaccid,
                     p_dueinterestaccid              => dueinterestaccid,
                     p_primaryreserveaccid           => primaryreserveaccid,
                     p_secondaryreserveaccid         => secondaryreserveaccid,
                     p_outcollateralaccid            => outcollateralaccid,
                     p_outguaranteeaccid             => outguaranteeaccid,
                     p_outinterestaccid              => outinterestaccid,
                     p_crdlineoblaccid               => crdlineoblaccid,
                     p_outloanaccid                  => outloanaccid,
                     p_primarypurreserveaccid        => primarypurreserveaccid,
                     p_secondarypurreserveaccid      => secondarypurreserveaccid
                    );

      SELECT NAME
        INTO NAME
        FROM cm_sb_customers
       WHERE ID = boorowerid;

      contractaddinfo_edit (p_creditid               => creditid,
                            p_boorowerid             => boorid,
                            p_name                   => NAME,
                            p_countrycode            => countrycode,
                            p_bankrupteystatus       => bankrupteystatus,
                            p_phonenumber            => phonenumber,
                            p_address                => address,
                            p_firstownerid           => firstownerid,
                            p_firstownername         => firstownername,
                            p_secondownerid          => secondownerid,
                            p_secondownername        => secondownername,
                            p_thirdownerid           => thirdownerid,
                            p_thirdownername         => thirdownername,
                            p_salary                 => salary,
                            p_guarantorname          => guarantorname,
                            p_guarantorid            => guarantorid,
                            p_guarantorsalary        => guarantorsalary,
                            p_pledgename             => pledgename,
                            p_holdername             => holdername,
                            p_holderaddress          => holderaddress,
                            p_anyinfotodisting       => anyinfotodisting,
                            p_registryno             => registryno,
                            p_registryagency         => registryagency,
                            p_registrydate           => registrydate,
                            p_pledgeinuse            => pledgeinuse,
                            p_pledgeinsurant         => pledgeinsurant,
                            p_insuranceagency        => insuranceagency,
                            p_insuranceamount        => insuranceamount,
                            p_insurancedate          => insurancedate,
                            pledgepriceevkv          => pledgepriceevkv,
                            pledgepricetorpaqha      => pledgepricetorpaqha
                           );

      UPDATE cm_curr_state
         SET reserveid = reserveid,
             duereserveid = duereserveid,
             pledgeprice = pledgeprice
       WHERE creditid = creditid;

      history_edit1 (p_creditid              => creditid,
                     p_reserveid             => reserveid,
                     p_duereserveid          => duereserveid,
                     p_pledgeprice           => pledgeprice,
                     p_creditlineamount      => creditlineamount
                    );
      COMMIT WORK;
      RETURN RESULT;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;

   PROCEDURE contractaddinfo_edit (
      p_creditid            IN   INTEGER,
      p_boorowerid          IN   VARCHAR2,
      p_name                IN   VARCHAR2,
      p_countrycode         IN   VARCHAR2,
      p_bankrupteystatus    IN   VARCHAR2,
      p_phonenumber         IN   VARCHAR2,
      p_address             IN   VARCHAR2,
      p_firstownerid        IN   VARCHAR2,
      p_firstownername      IN   VARCHAR2,
      p_secondownerid       IN   VARCHAR2,
      p_secondownername     IN   VARCHAR2,
      p_thirdownerid        IN   VARCHAR2,
      p_thirdownername      IN   VARCHAR2,
      p_salary              IN   NUMBER DEFAULT NULL,
      p_guarantorname       IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid         IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary     IN   NUMBER DEFAULT NULL,
      p_pledgename          IN   VARCHAR2,
      p_holdername          IN   VARCHAR2,
      p_holderaddress       IN   VARCHAR2,
      p_anyinfotodisting    IN   VARCHAR2,
      p_registryno          IN   VARCHAR2,
      p_registryagency      IN   VARCHAR2,
      p_registrydate        IN   DATE,
      p_pledgeinuse         IN   INTEGER,
      p_pledgeinsurant      IN   INTEGER,
      p_insuranceagency     IN   VARCHAR2,
      p_insuranceamount     IN   NUMBER,
      p_insurancedate       IN   DATE,
      pledgepriceevkv       IN   NUMBER DEFAULT 0,
      pledgepricetorpaqha   IN   NUMBER DEFAULT 0
   )
   IS
   BEGIN
      boorowerinfo_edit (p_creditid              => p_creditid,
                         p_boorowerid            => p_boorowerid,
                         p_name                  => p_name,
                         p_countrycode           => p_countrycode,
                         p_bankrupteystatus      => p_bankrupteystatus,
                         p_phonenumber           => p_phonenumber,
                         p_address               => p_address,
                         p_firstownerid          => p_firstownerid,
                         p_firstownername        => p_firstownername,
                         p_secondownerid         => p_secondownerid,
                         p_secondownername       => p_secondownername,
                         p_thirdownerid          => p_thirdownerid,
                         p_thirdownername        => p_thirdownername,
                         p_salary                => p_salary,
                         p_guarantorname         => p_guarantorname,
                         p_guarantorid           => p_guarantorid,
                         p_guarantorsalary       => p_guarantorsalary
                        );
      guarantee_edit (p_creditid                 => p_creditid,
                      p_pledgename               => p_pledgename,
                      p_holdername               => p_holdername,
                      p_holderaddress            => p_holderaddress,
                      p_anyinfotodisting         => p_anyinfotodisting,
                      p_registryno               => p_registryno,
                      p_registryagency           => p_registryagency,
                      p_registrydate             => p_registrydate,
                      p_pledgeinuse              => p_pledgeinuse,
                      p_pledgeinsurant           => p_pledgeinsurant,
                      p_insuranceagency          => p_insuranceagency,
                      p_insuranceamount          => p_insuranceamount,
                      p_insurancedate            => p_insurancedate,
                      p_pledgepriceevkv          => pledgepriceevkv,
                      p_pledgepricetorpaqha      => pledgepricetorpaqha
                     );
      COMMIT WORK;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;

   PROCEDURE contractaddinfo (
      p_creditid              IN   INTEGER,
      p_boorowerid            IN   VARCHAR2,
      p_name                  IN   VARCHAR2,
      p_countrycode           IN   VARCHAR2,
      p_bankrupteystatus      IN   VARCHAR2,
      p_phonenumber           IN   VARCHAR2,
      p_address               IN   VARCHAR2,
      p_firstownerid          IN   VARCHAR2,
      p_firstownername        IN   VARCHAR2,
      p_secondownerid         IN   VARCHAR2,
      p_secondownername       IN   VARCHAR2,
      p_thirdownerid          IN   VARCHAR2,
      p_thirdownername        IN   VARCHAR2,
      p_salary                IN   NUMBER DEFAULT NULL,
      p_guarantorname         IN   VARCHAR2 DEFAULT NULL,
      p_guarantorid           IN   VARCHAR2 DEFAULT NULL,
      p_guarantorsalary       IN   NUMBER DEFAULT NULL,
      p_pledgename            IN   VARCHAR2,
      p_pledgeid              IN   INTEGER,
      p_holdername            IN   VARCHAR2,
      p_holderaddress         IN   VARCHAR2,
      p_anyinfotodisting      IN   VARCHAR2,
      p_registryno            IN   VARCHAR2,
      p_registryagency        IN   VARCHAR2,
      p_registrydate          IN   DATE,
      p_pledgeinuse           IN   INTEGER,
      p_pledgeinsurant        IN   INTEGER,
      p_insuranceagency       IN   VARCHAR2,
      p_insuranceamount       IN   NUMBER,
      p_insurancedate         IN   DATE,
      p_pledgepriceevkv       IN   NUMBER DEFAULT 0,
      p_pledgepricetorpaqha   IN   NUMBER DEFAULT 0
   )
   IS
   BEGIN
      boorowerinfo_add (p_creditid              => p_creditid,
                        p_boorowerid            => p_boorowerid,
                        p_name                  => p_name,
                        p_countrycode           => p_countrycode,
                        p_bankrupteystatus      => p_bankrupteystatus,
                        p_phonenumber           => p_phonenumber,
                        p_address               => p_address,
                        p_firstownerid          => p_firstownerid,
                        p_firstownername        => p_firstownername,
                        p_secondownerid         => p_secondownerid,
                        p_secondownername       => p_secondownername,
                        p_thirdownerid          => p_thirdownerid,
                        p_thirdownername        => p_thirdownername,
                        p_salary                => p_salary,
                        p_guarantorname         => p_guarantorname,
                        p_guarantorid           => p_guarantorid,
                        p_guarantorsalary       => p_guarantorsalary
                       );
      guarantee_add (p_creditid                 => p_creditid,
                     p_pledgeid                 => p_pledgeid,
                     p_pledgepriceevkv          => p_pledgepriceevkv,
                     p_pledgepricetorpaqha      => p_pledgepricetorpaqha,
                     p_pledgename               => p_pledgename,
                     p_holdername               => p_holdername,
                     p_holderaddress            => p_holderaddress,
                     p_anyinfotodisting         => p_anyinfotodisting,
                     p_registryno               => p_registryno,
                     p_registryagency           => p_registryagency,
                     p_registrydate             => p_registrydate,
                     p_pledgeinuse              => p_pledgeinuse,
                     p_pledgeinsurant           => p_pledgeinsurant,
                     p_insuranceagency          => p_insuranceagency,
                     p_insuranceamount          => p_insuranceamount,
                     p_insurancedate            => p_insurancedate
                    );
      COMMIT WORK;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK WORK;
         RAISE;
   END;

   PROCEDURE contract_close (p_creditid IN INTEGER)
   IS
   --cursor c_CreditRest  --TODO!!!!!!!!!!!!
   BEGIN
      UPDATE cm_active_credits
         SET closedate = (SELECT tek_dat
                            FROM sb_sysdat),
             partitionkey = 1
       WHERE ID = p_creditid;

      COMMIT WORK;
   END;

   PROCEDURE enabledinterestcalc (c_id IN INTEGER)
   IS
      currentdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currentdat
        FROM sb_sysdat;

      UPDATE cm_history
         SET stopcalcdate = currentdat
       WHERE (creditid = c_id) AND (partitionkey = 0);

      COMMIT;
   END;

   PROCEDURE disableinterestcalc (c_id IN INTEGER)
   IS
   BEGIN
      UPDATE cm_history
         SET stopcalcdate = NULL
       WHERE (creditid = c_id) AND (partitionkey = 0);

      COMMIT;
   END;

   FUNCTION addonecreditaccount (
      p_accno      IN   VARCHAR2,
      p_cust       IN   INTEGER,
      p_val        IN   INTEGER,
      p_balance    IN   INTEGER,
      p_check      IN   BOOLEAN,
      p_acc_name   IN   VARCHAR2
   )
      RETURN INTEGER
   IS
      bal_cn    NUMBER;
      accname   VARCHAR2 (90);
      opendat   DATE;
      RESULT    INTEGER;
   BEGIN
      IF p_check
      THEN
         SELECT tek_dat
           INTO opendat
           FROM sb_sysdat;

         SELECT NAME || ' ' || LOWER (p_acc_name)
           INTO accname
           FROM cm_sb_customers
          WHERE ID = p_cust;

         IF p_balance = 1
         THEN
            bal_cn := TO_NUMBER (SUBSTR (p_accno, 0, 4));
            RESULT :=
               sbop.add_account /*_temp*/ (customerid      => p_cust,
                                           op_id           => UID,
                                           accno           => p_accno,
                                           currencyid      => p_val,
                                           NAME            => accname,
                                           open_dat        => opendat,
                                           balcn           => bal_cn,
                                           filial          => smart.sb_aca.getuserfilial
                                          );
         ELSE
            bal_cn := TO_NUMBER (SUBSTR (p_accno, 0, 5));
            RESULT :=
               sbopout.add_account_temp (customerid      => p_cust,
                                         op_id           => UID,
                                         accno           => p_accno,
                                         currencyid      => p_val,
                                         NAME            => accname,
                                         open_dat        => opendat,
                                         balcn           => bal_cn,
                                         filial          => smart.sb_aca.getuserfilial
                                        );
         END IF;
      END IF;

      RETURN NVL (RESULT, 0);
   END;

   PROCEDURE addcreditaccounts (
      p_cust              IN       INTEGER,
      p_val               IN       INTEGER,
      p_checkloan         IN       BOOLEAN,
      p_loanaccno         IN       VARCHAR2,
      p_checkboor         IN       BOOLEAN,
      p_booroweraccno     IN       VARCHAR2,
      p_checkprres        IN       BOOLEAN,
      p_prresaccno        IN       VARCHAR2,
      p_checkpurres       IN       BOOLEAN,
      p_prpurresaccno     IN       VARCHAR2,
      p_checkint          IN       BOOLEAN,
      p_intaccno          IN       VARCHAR2,
      p_checkdueloan      IN       BOOLEAN,
      p_dueloanaccno      IN       VARCHAR2,
      p_checksecres       IN       BOOLEAN,
      p_secresaccno       IN       VARCHAR2,
      p_checksecpurres    IN       BOOLEAN,
      p_secpurresaccno    IN       VARCHAR2,
      p_checkdueint       IN       BOOLEAN,
      p_dueintaccno       IN       VARCHAR2,
      p_checkoutpledg     IN       BOOLEAN,
      p_outpledgaccno     IN       VARCHAR2,
      p_checkobl          IN       BOOLEAN,
      p_outoblaccno       IN       VARCHAR2,
      p_checkoutloan      IN       BOOLEAN,
      p_outloanaccno      IN       VARCHAR2,
      p_checkoutint       IN       BOOLEAN,
      p_outintaccno       IN       VARCHAR2,
      p_checkcrdlineobl   IN       BOOLEAN,
      p_crdlineoblaccno   IN       VARCHAR2,
      p_loanaccid         OUT      INTEGER,
      p_booroweraccid     OUT      INTEGER,
      p_prresaccid        OUT      INTEGER,
      p_prpurresaccid     OUT      INTEGER,
      p_intaccid          OUT      INTEGER,
      p_dueloanaccid      OUT      INTEGER,
      p_secresaccid       OUT      INTEGER,
      p_secpurresaccid    OUT      INTEGER,
      p_dueintaccid       OUT      INTEGER,
      p_outpledgaccid     OUT      INTEGER,
      p_outoblaccid       OUT      INTEGER,
      p_outloanaccid      OUT      INTEGER,
      p_outintaccid       OUT      INTEGER,
      p_crdlineoblaccid   OUT      INTEGER
   )
   IS
      signalmsgaccount   VARCHAR2 (50)
                                    := '   Ачылмыш щесаблары тясдиг един!   ';
      mainbalans         NUMBER;
   BEGIN
      mainbalans := get_balansbyacc (p_loanaccno);
      p_loanaccid :=
         addonecreditaccount (p_loanaccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkloan,
                              cm_decls.acgloantype
                             );
      p_booroweraccid :=
         addonecreditaccount (p_booroweraccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkboor,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_booroweraccno
                                                                  )
                                                 )
                             );
      p_prresaccid :=
         addonecreditaccount (p_prresaccno,
                              p_cust,
                              0,
                              1,
                              p_checkprres,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_prresaccno
                                                                  )
                                                 )
                             );
      p_prpurresaccid :=
         addonecreditaccount (p_prpurresaccno,
                              p_cust,
                              0,
                              1,
                              p_checkpurres,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_prpurresaccno
                                                                  )
                                                 )
                             );
      p_intaccid :=
         addonecreditaccount (p_intaccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkint,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_intaccno)
                                                 )
                             );
      p_dueloanaccid :=
         addonecreditaccount (p_dueloanaccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkdueloan,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_dueloanaccno
                                                                  )
                                                 )
                             );
      p_secresaccid :=
         addonecreditaccount (p_secresaccno,
                              p_cust,
                              0,
                              1,
                              p_checksecres,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_secresaccno
                                                                  )
                                                 )
                             );
      p_secpurresaccid :=
         addonecreditaccount (p_secpurresaccno,
                              p_cust,
                              0,
                              1,
                              p_checksecpurres,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_secpurresaccno
                                                                  )
                                                 )
                             );
      p_dueintaccid :=
         addonecreditaccount (p_dueintaccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkdueint,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_dueintaccno
                                                                  )
                                                 )
                             );
      p_outpledgaccid :=
         addonecreditaccount (p_outpledgaccno,
                              p_cust,
                              p_val,
                              0,
                              p_checkoutpledg,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_outpledgaccno
                                                                  )
                                                 )
                             );
      p_outoblaccid :=
         addonecreditaccount (p_outoblaccno,
                              p_cust,
                              p_val,
                              0,
                              p_checkobl,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_outoblaccno
                                                                  )
                                                 )
                             );
      p_outloanaccid :=
         addonecreditaccount (p_outloanaccno,
                              p_cust,
                              p_val,
                              0,
                              p_checkoutloan,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_outloanaccno
                                                                  )
                                                 )
                             );
      p_outintaccid :=
         addonecreditaccount (p_outintaccno,
                              p_cust,
                              p_val,
                              0,
                              p_checkoutint,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_outintaccno
                                                                  )
                                                 )
                             );
      p_crdlineoblaccid :=
         addonecreditaccount (p_crdlineoblaccno,
                              p_cust,
                              p_val,
                              1,
                              p_checkcrdlineobl,
                              get_accdescription (mainbalans,
                                                  get_balansbyacc (p_crdlineoblaccno
                                                                  )
                                                 )
                             );

      IF    (p_loanaccid <> 0)
         OR (p_booroweraccid <> 0)
         OR (p_prresaccid <> 0)
         OR (p_prpurresaccid <> 0)
         OR (p_intaccid <> 0)
         OR (p_dueloanaccid <> 0)
         OR (p_secresaccid <> 0)
         OR (p_secpurresaccid <> 0)
         OR (p_dueintaccid <> 0)
         OR (p_outpledgaccid <> 0)
         OR (p_outoblaccid <> 0)
         OR (p_outloanaccid <> 0)
         OR (p_outintaccid <> 0)
         OR (p_crdlineoblaccid <> 0)
      THEN
         cm_utils.sendmsg (cm_utils.getuser_accesstempaccount,
                           signalmsgaccount
                          );
      END IF;

      COMMIT;
   END;

   PROCEDURE businessplan_add (p_id INTEGER)
   IS
   BEGIN
      INSERT INTO cm_business_plan
                  (creditid, projectcost, givencredit, concessionperiod,
                   purpose, SOURCE, TYPE, untmeansofproduction,
                   numberofproduction, untproduction, production,
                   productivity, productioncost, sumprofit, boughtmaterial,
                   operationexpense, taxexpense, otherexpence, sumexpense,
                   villageid, akpurpose
                  )
           VALUES (p_id, 0, 0, 0,
                   0, 1, 1, 'Yox',
                   0, 'Yox', 0,
                   0, 0, 0, 0,
                   0, 0, 0, 0,
                   -1, -1
                  );
   END;

   PROCEDURE generatecreditaccnumber (
      p_bal_cn            IN       INTEGER,
      p_filial            IN       INTEGER,
      p_custid            IN       INTEGER,
      p_val               IN       INTEGER,
      p_mcrdfil           IN       INTEGER,
      p_loanaccno         OUT      VARCHAR2,
      p_booroweraccno     OUT      VARCHAR2,
      p_prresaccno        OUT      VARCHAR2,
      p_prpurresaccno     OUT      VARCHAR2,
      p_intaccno          OUT      VARCHAR2,
      p_dueloanaccno      OUT      VARCHAR2,
      p_secresaccno       OUT      VARCHAR2,
      p_secpurresaccno    OUT      VARCHAR2,
      p_dueintaccno       OUT      VARCHAR2,
      p_outpledgaccno     OUT      VARCHAR2,
      p_outoblaccno       OUT      VARCHAR2,
      p_outloanaccno      OUT      VARCHAR2,
      p_outintaccno       OUT      VARCHAR2,
      p_crdlineoblaccno   OUT      VARCHAR2
   )
   IS
      CURSOR c_concession
      IS
         SELECT soccategory
           FROM smart.custipinfo
          WHERE custid = p_custid;

      CURSOR c_acccount (p_br IN INTEGER, p_bal IN INTEGER)
      IS
         SELECT MAX (ID)
           FROM sb_account
          WHERE acc_no LIKE p_bal || p_br || '%';

      CURSOR c_acc (p_id IN INTEGER)
      IS
         SELECT acc_no
           FROM sb_account
          WHERE ID = p_id;

      CURSOR c_kod_mfilial (p_mfid IN INTEGER)
      IS
         SELECT bank_kod
           FROM cm_usergroups
          WHERE ID = p_mfid;

      CURSOR c_kod_filial (p_fid IN INTEGER)
      IS
         SELECT kod_filial
           FROM sb_filial
          WHERE ID = p_fid;

      concession   c_concession%ROWTYPE;
      accncount    INTEGER;
      mcrdfil      c_kod_mfilial%ROWTYPE;
      fil          c_kod_filial%ROWTYPE;
   BEGIN
      OPEN c_concession;
      FETCH c_concession INTO concession;
      CLOSE c_concession;
      OPEN c_kod_mfilial (p_mcrdfil);
      FETCH c_kod_mfilial INTO mcrdfil;
      CLOSE c_kod_mfilial;
      OPEN c_acccount (mcrdfil.bank_kod, p_bal_cn);
      FETCH c_acccount INTO accncount;
      CLOSE c_acccount;
      OPEN c_kod_filial (p_filial);
      FETCH c_kod_filial INTO fil;
      CLOSE c_kod_filial;

      SELECT MAX (ID)
        INTO accncount
        FROM sb_account
       WHERE acc_no LIKE p_bal_cn || mcrdfil.bank_kod || '%';

      p_loanaccno :=
             p_bal_cn
          || mcrdfil.bank_kod
          || fil.kod_filial
          || p_val
          || NVL (concession.soccategory, 0)
          || get_accountcount (accncount);
      p_booroweraccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'CustAccno',
                           p_mcrdfil
                          );
      p_prresaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'ReserveAccno',
                           p_mcrdfil
                          );
      p_prpurresaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'PurReserveAccno',
                           p_mcrdfil
                          );
      p_intaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'IntAccno',
                           p_mcrdfil
                          );
      p_dueloanaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'DueLoanAccno',
                           p_mcrdfil
                          );
      p_secresaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'DuereserveAccno',
                           p_mcrdfil
                          );
      p_secpurresaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'DuePurReserveAccno',
                           p_mcrdfil
                          );
      p_dueintaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'DueIntAccno',
                           p_mcrdfil
                          );
      p_outpledgaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'OutGuaranteeAccno',
                           p_mcrdfil
                          );
      p_outoblaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'OutCollateralAccno',
                           p_mcrdfil
                          );
      p_outloanaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'OutLoanAccno',
                           p_mcrdfil
                          );
      p_outintaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'OutIntAccno',
                           p_mcrdfil
                          );
      p_crdlineoblaccno :=
         generateoneaccno (p_bal_cn,
                           p_custid,
                           p_val,
                           p_filial,
                           'CrdlineoblAccno',
                           p_mcrdfil
                          );
   END;

   FUNCTION generateoneaccno (
      p_bal_cn    IN   INTEGER,
      p_cust      IN   INTEGER,
      p_val       IN   INTEGER,
      p_fil       IN   INTEGER,
      p_const     IN   VARCHAR2,
      p_mcrdfil   IN   INTEGER
   )
      RETURN VARCHAR2
   IS
      RESULT       VARCHAR2 (25);

      CURSOR c_ball_cn (p_ball IN INTEGER, constval IN VARCHAR2)
      IS
         SELECT ID, bal_acc, accdescription
           FROM cm_generatechildaccounts
          WHERE genid = (SELECT ID
                           FROM cm_generatemainaccounts
                          WHERE bal_acc = p_ball AND iname = constval);

      CURSOR c_concession
      IS
         SELECT soccategory
           FROM smart.custipinfo
          WHERE custid = p_cust;

      CURSOR c_acccount (p_br IN VARCHAR2, p_bal IN INTEGER)
      IS
         SELECT MAX (ID)
           FROM sb_account
          WHERE acc_no LIKE p_bal || p_br || '%';

      CURSOR c_acc (p_id IN INTEGER)
      IS
         SELECT acc_no
           FROM sb_account
          WHERE ID = p_id;

      CURSOR c_kod_mfilial (p_mfid IN INTEGER)
      IS
         SELECT bank_kod
           FROM cm_usergroups
          WHERE ID = p_mfid;

      CURSOR c_kod_filial (p_fid IN INTEGER)
      IS
         SELECT kod_filial
           FROM sb_filial
          WHERE ID = p_fid;

      ball_cn      c_ball_cn%ROWTYPE;
      concession   c_concession%ROWTYPE;
      acccount     INTEGER;
      lastaccno    VARCHAR2 (20);
      mcrdfil      c_kod_mfilial%ROWTYPE;
      fil          c_kod_filial%ROWTYPE;
   BEGIN
      OPEN c_ball_cn (p_bal_cn, p_const);
      FETCH c_ball_cn INTO ball_cn;
      CLOSE c_ball_cn;
      OPEN c_concession;
      FETCH c_concession INTO concession;
      CLOSE c_concession;
      OPEN c_kod_mfilial (p_mcrdfil);
      FETCH c_kod_mfilial INTO mcrdfil;
      CLOSE c_kod_mfilial;
      OPEN c_kod_filial (p_fil);
      FETCH c_kod_filial INTO fil;
      CLOSE c_kod_filial;
      OPEN c_acccount (mcrdfil.bank_kod, ball_cn.bal_acc);
      FETCH c_acccount INTO acccount;
      CLOSE c_acccount;
      RESULT :=
             ball_cn.bal_acc
          || mcrdfil.bank_kod
          || fil.kod_filial
          || p_val
          || NVL (concession.soccategory, 0)
          || get_accountcount (acccount);
      RETURN RESULT;
   END;

   FUNCTION get_accountcount (p_cnt IN INTEGER)
      RETURN VARCHAR2
   IS
      x       VARCHAR2 (20);
      y       VARCHAR2 (20) := '';
      i       INTEGER;
      j       INTEGER;
      z       VARCHAR2 (10);
      p_str   VARCHAR2 (20);
      res     VARCHAR2 (20);
   BEGIN
      IF p_cnt IS NOT NULL
      THEN
         SELECT acc_no
           INTO p_str
           FROM sb_account
          WHERE ID = p_cnt;
      ELSE
         p_str := '00000000000000';
      END IF;

      p_str := SUBSTR (p_str, 11, 14);

      FOR i IN 1 .. 4
      LOOP
         z := SUBSTR (p_str, i, 1);

         IF z = '0'
         THEN
            y := y || z;
         ELSE
            BEGIN
               j := SUBSTR (p_str, i, LENGTH (p_str));
               EXIT;
            END;
         END IF;
      END LOOP;

      IF j IS NULL
      THEN
         y := '0001';
      END IF;

      RETURN y || (TO_CHAR (j + 1));
   END;

   FUNCTION get_accdescription (mainbalance IN INTEGER, childbalance IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (30);

      CURSOR c_desc
      IS
         SELECT accdescription
           FROM cm_generatechildaccounts
          WHERE bal_acc = childbalance
            AND genid = (SELECT ID
                           FROM cm_generatemainaccounts
                          WHERE bal_acc = mainbalance);
   BEGIN
      OPEN c_desc;
      FETCH c_desc INTO RESULT;
      CLOSE c_desc;
      RETURN RESULT;
   END;

   FUNCTION get_balansbyacc (accno IN VARCHAR2)
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT := TO_NUMBER (SUBSTR (accno, 0, 4));
      RETURN RESULT;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CREDIT

-- Start of DDL Script for Package CREDITSMGR.CM_DECA
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_deca
  IS
  function NeqativeAsZero(p_Value in Number)
  return Number;
  function DueDaysCount(
      p_Date1 in date,
      p_Date2 in Date
  ) return Integer;
  function OiaForLastThreeMonths(p_Date1 in Date,
              p_Date2 in Date,
              p_DueIntrst in Number)
  return Number;
  function Get_CreditStatus(p_CrdID in integer,p_dat in date)
 return varchar2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_deca
IS
  function NeqativeAsZero(p_Value in Number)
  return Number
  is
  begin
    if p_Value < 0 then
      return 0;
    else
      return p_Value;  
    end if;
  end;
  
  function DueDaysCount(
      p_Date1 in date,
      p_Date2 in Date
  ) return Integer
  is
    Result Integer;
  begin
    Result := Trunc(p_Date1 - p_Date2); 
    Result := NeqativeAsZero(Result); 
    return Result;
  end;
  
  function OiaForLastThreeMonths(p_Date1 in Date,
              p_Date2 in Date,
              p_DueIntrst in Number)
  return Number
  is
    Result Number;
  begin
    if DueDaysCount(p_Date1,p_Date2) > 60 then
      Result := p_DueIntrst;
    else
      Result := 0;   
    end if;
    return Result;
  end; 
  
 function Get_CreditStatus(p_CrdID in integer,p_dat in date)
 return varchar2
 is
  Result varchar2(10);
  
  Cursor c_rest is
  select rest,
         interestrest,
         duerest,
         dueinterestrest 
  from cm_history
  where hdate=p_dat and creditid=p_crdid;
  
  restinfo c_rest%rowtype;
  
 begin
    
    open c_rest;
    fetch c_rest into restinfo;
    close c_rest;
    
    if (restinfo.rest =0) and(restinfo.interestrest =0)
    and (restinfo.duerest =0)and(restinfo.dueinterestrest =0) then Result:='001'; 
    else Result:='006'; 
    end if;
   return result;
 end;
    
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_DECA

-- Start of DDL Script for Package CREDITSMGR.CM_DECLS
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_decls
  IS
  
   -- CM Common Declarations 
   lnkInterestAccount   constant varchar2(32) := 'lnkInterestAccount';
   lnkDueInterestAccount constant varchar2(32) := 'lnkDueInterestAccount';
   lnkReserveAccount    constant varchar2(32) := 'lnkReserveAccount';
   lnkDueReserveAccount constant varchar2(32) := 'lnkDueReserveAccount';
   
   lnkOutInvObligationAccount constant varchar2(32) := 'lnkOutInvoiceObligationAccount';
   lnkOutInvPledgeAccount     constant varchar2(32) := 'lnkOutInvoicePledgeAccount';
   InkCrdLineOblAccont        constant varchar2(32) := 'InkCrdLineOblAccs'; 
   InkOutIntAccount           constant varchar2(32) := 'InkOutIntAccount'; 
   
   lnkInterestAccountTrans   constant varchar2(255) := 'Кредитляр цзря фаиз эялирляри ';
   lnkReserveAccountTrans    constant varchar2(255) := 'Кредитляр цзря ещтимал олунан зяряр цчцн ади ещтийатлар йардылмасына айырмалар';
   lnkDueReserveAccountTrans constant varchar2(255) := 'Кредитляр цзря ещтимал олунан зяряр цчцн мягсядли ещтийатлар йардылмасына айырмалар';
   
   lnkOutInvObligationAccTrans constant varchar2(255) := 'Балансданкянар ющдяликляр цчцн контур щесаб';
   lnkOutInvPledgeAccTrans     constant varchar2(255) := 'Балансданкянар эирову сахламаг цчцн контур щесаб';
   
   AcgCust constant integer := 2; 
   Acgres constant integer := 3;
   AcgInt constant integer := 5;
   AcgDueLoan constant integer := 6;
   AcgDueRes constant integer := 4;
   AcgDueInt constant integer := 5;
   AcgPlg constant integer := 7;
   AcgObl constant integer := 8;
   AcgOutInt constant integer :=12;
   AcgCrdLine constant integer := 11;
   
   AcgLoanType constant varchar2(29) := 'Ссуда щесабы'; 
   AcgCustType constant varchar2(29) := 'Жари  щесабы'; 
   AcgresType constant varchar2(29) := 'Ади ещтийат щесабы';
   AcgPurresType constant varchar2(29) := 'Мягсядли ещтийат щесабы';
   AcgIntType constant varchar2(29) := 'Фаиз щесабы';
   AcgDueLoanType constant varchar2(29) := 'Эежикмиш ссуда щесабы';
   AcgDueResType constant varchar2(29) := 'Эеж. Ади ещтийат щесабы';
   AcgDuePurResType constant varchar2(29) := 'Эеж.Мяг.ещтийат щесабы';
   AcgDueIntType constant varchar2(29) := 'Эежикмиш фаиз щесабы';
   AcgPlgType constant varchar2(29) := 'Б.К. Эиров Щесабы';
   AcgOblType constant varchar2(29) := 'Б.К. Ющдялик Щесабы';
   AcgOutLoanType constant varchar2(29) :='Б.К. Ссуда щесабы';
   AcgOutIntType constant varchar2(29) :='Б.К. Фаиз щесабы';
   AcgCrdLineType constant varchar2(29) := 'К.Х.Ю.М Ещтийат';

   	atfCommitImmediate	constant integer := 8;
	atfTemporary constant integer := 0;
    
   -- Calculation Condition For CreditCards
  
   CreditCardsFirstAnnInt constant integer := 0;
   CreditCardsSecondAnnInt constant integer := 18;
   CreditCardsThreedAnnInt constant integer := 24;

   CreditCardsFirstCalcDate constant integer :=30;
   CreditCardsSecondCalcDate constant integer :=120;

   -- VID_OP   
   cmTransactionOpType constant integer := 86;
   
   cmPaymentMainTransactionOpType integer := 10;
   cmPaymentIntTransactionOpType integer := 11;
   cmTrancheTransactionOpType integer := 20;
   -- TrFlags   
   cmTrFlagInBalance  constant integer := 0;
   cmTrFlagOutBalance constant integer := 16; 
   
   -- Calculation Status
   csNotCalculated constant integer := 0;
   csCalculated constant integer := 1;
   csAccepted constant integer := 2;  
   
   -- User defined Transaction Descriptions
   TrDescNumber constant varchar2(2) := '%N';
   TrDescDate constant varchar2(2) := '%D';
   
   -- CM Custom Error Messages 
   EInvalidFirstPayDate constant integer := -20900;
   EOutofObligation constant integer := -20901;
   EZeroTrancheNotSupported constant integer := - 20902;
   EInvokeAccountNotFound constant integer := - 20903;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY                       creditsmgr.cm_decls
IS
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_DECLS

-- Start of DDL Script for Package CREDITSMGR.CM_DIFFERENCE_TRANSACTIONS
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_difference_transactions
IS
   FUNCTION check_accounts (p_value IN INTEGER, p_varconst IN VARCHAR2)
      RETURN BOOLEAN;

   FUNCTION check_credittransaction (
      p_variable   IN   INTEGER,
      debitaccid   IN   INTEGER,
      debitamt     IN   NUMBER,
      creditamt    IN   NUMBER,
      lamt         IN   NUMBER,
      trdate       IN   DATE
   )
      RETURN BOOLEAN;

  FUNCTION cm_add_difference_transactions (
      p_creditid         IN   INTEGER,
      p_creditoperation   IN   INTEGER,
      p_trid              IN   INTEGER DEFAULT NULL,
      p_debitaccid        IN   INTEGER,
      p_creditaccid       IN   INTEGER,
      p_debitamount       IN   INTEGER,
      p_creditamount      IN   INTEGER,
      p_natamount         IN   INTEGER DEFAULT NULL,
      p_flags             IN   INTEGER DEFAULT NULL,
      p_optype            IN   INTEGER DEFAULT NULL,
      p_inbalancechar     IN   INTEGER DEFAULT NULL,
      p_trdate            IN   DATE,
      p_trdescription     IN   VARCHAR2
   )
      RETURN INTEGER;
  procedure Delete_Transactions (TransactionID in integer);
  procedure Commit_Transaction(TransactionID in integer,
                                DefUpdPlane in boolean);
  PROCEDURE paymentadd (
      p_creditid              IN   INTEGER,
      p_date                  IN   DATE,
      p_custaccid             IN   INTEGER,
      p_maindebt              IN   NUMBER DEFAULT 0,
      p_maininterest          IN   NUMBER DEFAULT 0,
      p_duedebt               IN   NUMBER DEFAULT 0,
      p_dueinterest           IN   NUMBER DEFAULT 0,
      p_crdoperation          IN   INTEGER,
      p_processtransactions   IN   BOOLEAN DEFAULT False
   );
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_difference_transactions
IS
   FUNCTION cm_add_difference_transactions (
      p_creditid         IN   INTEGER,
      p_creditoperation   IN   INTEGER,
      p_trid              IN   INTEGER DEFAULT NULL,
      p_debitaccid        IN   INTEGER,
      p_creditaccid       IN   INTEGER,
      p_debitamount       IN   INTEGER,
      p_creditamount      IN   INTEGER,
      p_natamount         IN   INTEGER DEFAULT NULL,
      p_flags             IN   INTEGER DEFAULT NULL,
      p_optype            IN   INTEGER DEFAULT NULL,
      p_inbalancechar     IN   INTEGER DEFAULT NULL,
      p_trdate            IN   DATE,
      p_trdescription     IN   VARCHAR2
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      INSERT INTO cm_lazytransactions
                  (creditid, creditoperation, trid, debitaccid,
                   creditaccid, debitamount, creditamount,
                   natamount, flags, optype, inbalancechar,
                   trdate, trdescription
                  )
           VALUES (p_creditid, p_creditoperation, p_trid, p_debitaccid,
                   p_creditaccid, p_debitamount, p_creditamount,
                   p_natamount, p_flags, p_optype, p_inbalancechar,
                   p_trdate, p_trdescription
                  )
        RETURNING ID
             INTO RESULT;

      RETURN RESULT;
   END;

   PROCEDURE paymentadd (
      p_creditid              IN   INTEGER,
      p_date                  IN   DATE,
      p_custaccid             IN   INTEGER,
      p_maindebt              IN   NUMBER DEFAULT 0,
      p_maininterest          IN   NUMBER DEFAULT 0,
      p_duedebt               IN   NUMBER DEFAULT 0,
      p_dueinterest           IN   NUMBER DEFAULT 0,
      p_crdoperation          IN   INTEGER,
      p_processtransactions   IN   BOOLEAN DEFAULT False
   )
   IS
      CURSOR c_portfolioinfo (crdid IN INTEGER)
      IS
         SELECT currency, numberofcredit, customertype, credittype, branchid,
                annualyinterestrate, annualbankrate, duedatefirstcontract
           FROM cm_active_credits
          WHERE ID = crdid;

      CURSOR c_historyinfo (crdid IN INTEGER)
      IS
         SELECT rest, duerest, interestrest, dueinterestrest, reserveid,
                duereserveid
           FROM cm_curr_state
          WHERE creditid = crdid;

      CURSOR c_rates (currencyid IN INTEGER)
      IS
         SELECT ostat
           FROM sb_temprate
          WHERE val_kod = currencyid;

      CURSOR c_reserverate (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserve_types
          WHERE ID = p_id;

      CURSOR c_accounts (crdid IN INTEGER)
      IS
         SELECT loanaccid, dueloanaccid, interestaccid, dueinterestaccid,
                primaryreserveaccid, secondaryreserveaccid,
                outguaranteeaccid
           FROM cm_accounts
          WHERE creditid = crdid;

      CURSOR c_payment_schedule (crdid IN INTEGER, p_dat IN DATE)
      IS
         SELECT principal, interest
           FROM cm_payment_schedule
          WHERE creditid = crdid AND paymentdate = p_dat;

      portfinfo                  c_portfolioinfo%ROWTYPE;
      histinfo                   c_historyinfo%ROWTYPE;
      rates                      c_rates%ROWTYPE;
      crdaccs                    c_accounts%ROWTYPE;
      reserverate                c_reserverate%ROWTYPE;
      payment_schedule           c_payment_schedule%ROWTYPE;
      debitaccid                 INTEGER;
      creditaccid                INTEGER;
      crdrest                    NUMBER;
      crdinterestrest            NUMBER;
      crdduerest                 NUMBER;
      crddueinterest             NUMBER;
      crdpreserveid              INTEGER;
      crdsreserveid              INTEGER;
      crdpreserverate            NUMBER;
      crdsreserverate            NUMBER;
      loanaccid                  INTEGER;
      interestaccid              INTEGER;
      dueloanaccid               INTEGER;
      dueinterestaccid           INTEGER;
      primaryreserveaccid        INTEGER;
      secondaryreserveaccid      INTEGER;
      outoblaccid                INTEGER;
      crdcurrency                INTEGER;
      crdbranchid                INTEGER;
      crdno                      VARCHAR2 (255);
      crdcusttype                INTEGER;
      crditype                   INTEGER;
      renewablestatus            BOOLEAN;
      reservecontenabled         BOOLEAN;
      crcyrate                   NUMBER;
      trdescription              VARCHAR2 (255);
      tramt                      NUMBER;
      oblincreaseamt             NUMBER                       := 0;
      creditrest                 NUMBER;
      resultmaindebttrid         INTEGER;
      resultpreservetrid         INTEGER;
      resultsreservetrid         INTEGER;
      resultoutoblincreasetrid   INTEGER;
      resultintdebttrid          INTEGER;
      resultduedebttrid          INTEGER;
      resultdueintdebttrid       INTEGER;
      bclosedat                  DATE;
   BEGIN
      OPEN c_portfolioinfo (p_creditid);
      FETCH c_portfolioinfo INTO portfinfo;
      crdcurrency := portfinfo.currency;
      crdbranchid := portfinfo.branchid;
      crdno := portfinfo.numberofcredit;
      crdcusttype := portfinfo.customertype;
      crditype := portfinfo.credittype;
      CLOSE c_portfolioinfo;
      renewablestatus := cm_utils.creditrenewable (crditype) = 1;
      reservecontenabled := cm_utils.creditreservecontenabled (crditype) = 1;
      OPEN c_historyinfo (p_creditid);
      FETCH c_historyinfo INTO histinfo;
      crdrest := histinfo.rest;
      crdinterestrest := histinfo.interestrest;
      crdduerest := histinfo.duerest;
      crddueinterest := histinfo.dueinterestrest;
      crdpreserveid := histinfo.reserveid;
      crdsreserveid := histinfo.duereserveid;
      CLOSE c_historyinfo;
      OPEN c_rates (crdcurrency);
      FETCH c_rates INTO rates;
      crcyrate := rates.ostat;
      CLOSE c_rates;
      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO crdaccs;
      loanaccid := crdaccs.loanaccid;
      interestaccid := crdaccs.interestaccid;
      dueloanaccid := crdaccs.dueloanaccid;
      dueinterestaccid := crdaccs.dueinterestaccid;
      primaryreserveaccid := crdaccs.primaryreserveaccid;
      secondaryreserveaccid := crdaccs.secondaryreserveaccid;
      outoblaccid := crdaccs.outguaranteeaccid;
      CLOSE c_accounts;
      OPEN c_reserverate (crdpreserveid);
      FETCH c_reserverate INTO reserverate;
      crdpreserverate := reserverate.PERCENT;
      CLOSE c_reserverate;
      OPEN c_reserverate (crdsreserveid);
      FETCH c_reserverate INTO reserverate;
      crdsreserverate := reserverate.PERCENT;
      CLOSE c_reserverate;
      OPEN c_payment_schedule (p_creditid, p_date);
      FETCH c_payment_schedule INTO payment_schedule;
      CLOSE c_payment_schedule;

      -- Main Debt

      IF p_maindebt > 0
      THEN
         IF p_maindebt > crdrest
         THEN
            cm_utils.processerror (0);
         END IF; --p_MainDebt > CrdRest

         debitaccid := p_custaccid;
         creditaccid := loanaccid;
         tramt := ROUND (p_maindebt, 2);
         trdescription := cm_utils.trdescmaindebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (p_date, 'DD/MM/YYYY')
                    );
         resultmaindebttrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => NULL,
                                                p_creditamount         => tramt,
                                                p_lamount              => NULL,
                                                p_trname               => trdescription,
                                                p_flags                => sbdecls.atfcommitimmediate,
                                                p_transactiondate      => p_date,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL
                                               );

         IF reservecontenabled
         THEN --- ReserveContEnabled
            creditaccid :=
               cm_utils.lnkreserveaccount (p_custcategory      => crdcusttype,
                                           p_crdcurrency       => crdcurrency,
                                           p_bankid            => crdbranchid
                                          );
            debitaccid := primaryreserveaccid;
            tramt :=
               cm_utils.calcpercent (p_sum              => p_maindebt,
                                     p_rate             => crdpreserverate,
                                     p_coefficient      => 1,
                                     p_delimmer         => 1
                                    );
            tramt := ROUND (tramt * crcyrate, 2);
            trdescription := cm_utils.trdescreservereduce ();
            trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
            trdescription :=
               REPLACE (trdescription,
                        cm_decls.trdescdate,
                        TO_CHAR (p_date, 'DD/MM/YYYY')
                       );
            resultpreservetrid :=
               cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                   p_debitid              => debitaccid,
                                                   p_creditid             => creditaccid,
                                                   p_debitamount          => NULL,
                                                   p_creditamount         => tramt,
                                                   p_lamount              => NULL,
                                                   p_trname               => trdescription,
                                                   p_flags                => sbdecls.atfcommitimmediate,
                                                   p_transactiondate      => p_date,
                                                   p_operationtype        => cm_decls.cmtransactionoptype,
                                                   p_inbalancechar        => NULL
                                                  );
         END IF; 

         IF renewablestatus
         THEN 
            oblincreaseamt := p_maindebt;

            IF cm_utils.processoutbalancetransactions = 1
            THEN
               debitaccid :=
                  cm_utils.lnkoutinvobligationaccount (p_custcategory      => crdcusttype,
                                                       p_crdcurrency       => crdcurrency,
                                                       p_bankid            => crdbranchid
                                                      );
               creditaccid := outoblaccid;
               tramt := ROUND (p_maindebt, 2);
               trdescription := cm_utils.trdescobligationincrease ();
               trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); 
               trdescription :=
                  REPLACE (trdescription,
                           cm_decls.trdescdate,
                           TO_CHAR (p_date, 'DD/MM/YYYY')
                          );
               resultoutoblincreasetrid :=
                  cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                      p_debitid              => debitaccid,
                                                      p_creditid             => creditaccid,
                                                      p_debitamount          => NULL,
                                                      p_creditamount         => tramt,
                                                      p_lamount              => NULL,
                                                      p_trname               => trdescription,
                                                      p_flags                => sbdecls.atfcommitimmediate,
                                                      p_transactiondate      => p_date,
                                                      p_operationtype        => cm_decls.cmtransactionoptype,
                                                      p_inbalancechar        => NULL
                                                     );
            END IF; -- reduce     
         END IF; --RenewableStatus 
      END IF; -- p_Maindebt > 0  


              -- Interset Debt

      IF p_maininterest > 0
      THEN --Main Interest
         IF p_maininterest > crdinterestrest
         THEN
            cm_utils.processerror (0); --ToDo
         END IF; --p_MainInterest > CrdInterestRest

         debitaccid := p_custaccid;
         creditaccid := interestaccid;
         tramt := ROUND (p_maininterest, 2);
         trdescription := cm_utils.trdescmainintdebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (p_date, 'DD/MM/YYYY')
                    );
         resultintdebttrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => NULL,
                                                p_creditamount         => tramt,
                                                p_lamount              => NULL,
                                                p_trname               => trdescription,
                                                p_flags                => sbdecls.atfcommitimmediate,
                                                p_transactiondate      => p_date,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL
                                               );
      END IF; --p_MainInterest > 0

              -- Due Debt

      IF p_duedebt > 0
      THEN -- Due Debt
         IF p_duedebt > crdduerest
         THEN
            cm_utils.processerror (0);
         END IF; --p_DueDebt > CrdRest

         debitaccid := p_custaccid;
         creditaccid := dueloanaccid;
         tramt := ROUND (p_duedebt, 2);
         trdescription := cm_utils.trdescduedebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (p_date, 'DD/MM/YYYY')
                    );
         resultduedebttrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => NULL,
                                                p_creditamount         => tramt,
                                                p_lamount              => NULL,
                                                p_trname               => trdescription,
                                                p_flags                => sbdecls.atfcommitimmediate,
                                                p_transactiondate      => p_date,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL
                                               );

         IF reservecontenabled
         THEN --- ReserveContEnabled
            creditaccid :=
               cm_utils.lnkduereserveaccount (p_custcategory      => crdcusttype,
                                              p_crdcurrency       => crdcurrency,
                                              p_bankid            => crdbranchid
                                             );
            debitaccid := secondaryreserveaccid;
            tramt :=
               cm_utils.calcpercent (p_sum              => p_duedebt,
                                     p_rate             => crdsreserverate,
                                     p_coefficient      => 1,
                                     p_delimmer         => 1
                                    );
            tramt := ROUND (tramt * crcyrate, 2);
            trdescription := cm_utils.trdescreservereduce ();
            trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
            trdescription :=
               REPLACE (trdescription,
                        cm_decls.trdescdate,
                        TO_CHAR (p_date, 'DD/MM/YYYY')
                       );
            resultsreservetrid :=
               cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                   p_debitid              => debitaccid,
                                                   p_creditid             => creditaccid,
                                                   p_debitamount          => NULL,
                                                   p_creditamount         => tramt,
                                                   p_lamount              => NULL,
                                                   p_trname               => trdescription,
                                                   p_flags                => sbdecls.atfcommitimmediate,
                                                   p_transactiondate      => p_date,
                                                   p_operationtype        => cm_decls.cmtransactionoptype,
                                                   p_inbalancechar        => NULL
                                                  );
         END IF; --ReserveContEnabled
      END IF; --p_DueDebt > 0      

      IF p_dueinterest > 0
      THEN --p_DueInterest
         IF p_dueinterest > crddueinterest
         THEN
            cm_utils.processerror (0); --ToDo
         END IF; --p_DueInterest > CrdInterestRest

         debitaccid := p_custaccid;
         creditaccid := dueinterestaccid;
         tramt := ROUND (p_dueinterest, 2);
         trdescription := cm_utils.trdescdueintdebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (p_date, 'DD/MM/YYYY')
                    );
         resultdueintdebttrid :=
            cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                p_debitid              => debitaccid,
                                                p_creditid             => creditaccid,
                                                p_debitamount          => NULL,
                                                p_creditamount         => tramt,
                                                p_lamount              => NULL,
                                                p_trname               => trdescription,
                                                p_flags                => sbdecls.atfcommitimmediate,
                                                p_transactiondate      => p_date,
                                                p_operationtype        => cm_decls.cmtransactionoptype,
                                                p_inbalancechar        => NULL
                                               );
      END IF; --p_DueInterest > 0

      UPDATE cm_curr_state
         SET rest = rest - p_maindebt,
             interestrest = interestrest - p_maininterest,
             duerest = duerest - p_duedebt,
             dueinterestrest = dueinterestrest - p_dueinterest,
             obligation = obligation + oblincreaseamt
       WHERE creditid = p_creditid;

      INSERT INTO cm_payments
                  (creditid, paydate, payedamt, payedintamt, payeddueamt,
                   payeddueintamt, payedpenaltyamt, tridamt, tridintamt,
                   triddueamt, triddueintamt, tridpenaltyamt,
                   tridprimreserve, tridsecreserve,
                   outtridobligation
                  )
           VALUES (p_creditid, p_date, p_maindebt, p_maininterest, p_duedebt,
                   p_dueinterest, 0, resultmaindebttrid, resultintdebttrid,
                   resultduedebttrid, resultdueintdebttrid, NULL,
                   resultpreservetrid, resultsreservetrid,
                   resultoutoblincreasetrid
                  );

      if p_processtransactions then            
      IF payment_schedule.principal < p_maindebt
      THEN
         UPDATE cm_curr_state
            SET factcalcamt =
                          factcalcamt
                        - (p_maindebt - payment_schedule.principal)
          WHERE creditid = p_creditid;

         SELECT rest
           INTO creditrest
           FROM cm_curr_state
          WHERE creditid = p_creditid;

         SELECT bankclosedate
           INTO bclosedat
           FROM cm_ip_info
          WHERE creditid = p_creditid;

         DELETE      cm_payment_schedule
               WHERE creditid = p_creditid AND paymentdate > p_date;

         cm_schedule.insertannutyschedule (p_creditid          => p_creditid,
                                           p_amount            => creditrest,
                                           p_rate              => portfinfo.annualyinterestrate,
                                           p_iprate            => portfinfo.annualbankrate,
                                           p_firstpaydate      => ADD_MONTHS (p_date,
                                                                              1
                                                                             ),
                                           p_startdate         => ADD_MONTHS (p_date,
                                                                              1
                                                                             ),
                                           p_periods           => TRUNC (MONTHS_BETWEEN (bclosedat,
                                                                                         p_date
                                                                                        )
                                                                        ),
                                           p_periodrate        => 1 -- In Months 
                                          );
      END IF;
      End if;
   END;

   FUNCTION check_credittransaction (
      p_variable   IN   INTEGER,
      debitaccid   IN   INTEGER,
      debitamt     IN   NUMBER,
      creditamt    IN   NUMBER,
      lamt         IN   NUMBER,
      trdate       IN   DATE
   )
      RETURN BOOLEAN
   IS
      RESULT          BOOLEAN       := FALSE;
      crdid           INTEGER;
      crdno           VARCHAR2 (53);
      temptrid        INTEGER;
      trdescription   VARCHAR2 (80);
   BEGIN
      IF check_accounts (p_variable, 'LoanAccID')
      THEN
       RESULT := True;
         SELECT creditid
           INTO crdid
           FROM cm_accounts
          WHERE loanaccid = p_variable;

         SELECT numberofcredit
           INTO crdno
           FROM cm_active_credits
          WHERE ID = crdid;

         trdescription := cm_utils.trdescmaindebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno);
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (trdate, 'DD/MM/YYYY')
                    );
         temptrid :=
            cm_add_difference_transactions (p_creditid            => crdid,
                                            p_creditoperation      => cm_decls.cmpaymentmaintransactionoptype,
                                            p_debitaccid           => debitaccid,
                                            p_creditaccid          => p_variable,
                                            p_debitamount          => debitamt,
                                            p_creditamount         => creditamt,
                                            p_natamount            => lamt,
                                            p_optype               => 86,
                                            p_trdate               => trdate,
                                            p_trdescription        => trdescription
                                           );
      END IF;

      IF check_accounts (p_variable, 'InterestAccID')
      THEN
        RESULT := True;
         SELECT creditid
           INTO crdid
           FROM cm_accounts
          WHERE interestaccid = p_variable;

         SELECT numberofcredit
           INTO crdno
           FROM cm_active_credits
          WHERE ID = crdid;

         trdescription := cm_utils.trdescmainintdebtpay ();
         trdescription :=
                         REPLACE (trdescription, cm_decls.trdescnumber, crdno);
         trdescription :=
            REPLACE (trdescription,
                     cm_decls.trdescdate,
                     TO_CHAR (trdate, 'DD/MM/YYYY')
                    );
         temptrid :=
            cm_add_difference_transactions (p_creditid            => crdid,
                                            p_creditoperation      => cm_decls.cmPaymentIntTransactionOpType,
                                            p_debitaccid           => debitaccid,
                                            p_creditaccid          => p_variable,
                                            p_debitamount          => debitamt,
                                            p_creditamount         => creditamt,
                                            p_natamount            => lamt,
                                            p_optype               => 86,
                                            p_trdate               => trdate,
                                            p_trdescription        => trdescription
                                           );
      
      END IF;
      return RESULT;
   END;

   FUNCTION check_accounts (p_value IN INTEGER, p_varconst IN VARCHAR2)
      RETURN BOOLEAN
   IS
      RESULT      BOOLEAN;
      curconst    VARCHAR2 (512)
         := 'select creditid
                               from 
                               cm_accounts where 
                               creditid in (select ID from 
                               cm_active_credits)
                               and  ';
      crsr        BINARY_INTEGER := DBMS_SQL.open_cursor;
      crsrpoint   BINARY_INTEGER;
   BEGIN
      DBMS_SQL.parse (crsr,
                       curconst || p_varconst || ' = ' || p_value,
                      DBMS_SQL.native
                     );
      crsrpoint := DBMS_SQL.EXECUTE (crsr);
      RESULT := (DBMS_SQL.fetch_rows (crsr) > 0);
      DBMS_SQL.close_cursor (crsr);
      RETURN RESULT;
      
   END;
   
   procedure Commit_Transaction(TransactionID in integer,
                                DefUpdPlane in boolean)
   is
    
    Result integer;
    
    Transaction cm_lazytransactions%RowType;
     
   begin
      
       select * 
          into Transaction
        from cm_lazytransactions
        where ID = TransactionID;

     if not Transaction.Status = 1 then --1
       if Transaction.creditoperation = --2
              cm_decls.cmPaymentMainTransactionOpType then
   
            paymentadd (
               p_creditid => Transaction.CreditID,
               p_date => Transaction.trdate,
               p_custaccid => Transaction.debitaccid,
               p_maindebt => Transaction.debitamount,
               p_maininterest => 0,
               p_duedebt => 0,
               p_dueinterest => 0,
               p_crdoperation => null,
               p_processtransactions => DefUpdPlane
             );              
              
       else if Transaction.creditoperation = --3
              cm_decls.cmPaymentMainTransactionOpType then

            paymentadd (
               p_creditid => Transaction.CreditID,
               p_date => Transaction.trdate,
               p_custaccid => Transaction.debitaccid,
               p_maindebt => 0,
               p_maininterest => Transaction.debitamount,
               p_duedebt => 0,
               p_dueinterest => 0,
               p_crdoperation => null,
               p_processtransactions => DefUpdPlane
             );              
      
       end if;--3
       end if;  --2      
        
     end if;--1
    
    update cm_lazytransactions 
    set Status = 1
    where ID = TransactionID;
    
    commit;            
   end;
   
  procedure Delete_Transactions (TransactionID in integer) is
  TransactionStatus integer;
  begin
    select Status into
           TransactionStatus
    from   cm_lazytransactions
    where id = TransactionID;
    
    if not TransactionStatus = 1 then     
     delete cm_lazytransactions
     where ID = TransactionID;
     commit;     
    end if;
  
  end;
    
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_DIFFERENCE_TRANSACTIONS

-- Start of DDL Script for Package CREDITSMGR.CM_EXCEL_IMPORTER
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_excel_importer
  IS
  Procedure Excel_import(
   LoanAccno in varchar2 ,
   DueLoanAccno in varchar2 ,
   InterestsAccno in varchar2 ,
   FilialName in varchar2 ,
   DistrictName in varchar2 ,
   CustName in varchar2 ,
   StatusOfCredit in varchar2 ,
   ResultOfOffice in varchar2 ,
   OpenDate in Date ,
   CloseDate in Date ,
   CreditPurpose in varchar2 ,
   NumOfCredit in varchar2 ,
   AnnualyInterestRate in number ,
   GivAmount in number ,
   PaydAmt in number ,
   PaydIntAmt in number ,
   RestOfDate in number
   );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_excel_importer
IS
 Procedure Excel_import(
   LoanAccno in varchar2 ,
   DueLoanAccno in varchar2 ,
   InterestsAccno in varchar2 ,
   FilialName in varchar2 ,
   DistrictName in varchar2 ,
   CustName in varchar2 ,
   StatusOfCredit in varchar2 ,
   ResultOfOffice in varchar2 ,
   OpenDate in Date ,
   CloseDate in Date ,
   CreditPurpose in varchar2 ,
   NumOfCredit in varchar2 ,
   AnnualyInterestRate in number ,
   GivAmount in number ,
   PaydAmt in number ,
   PaydIntAmt in number ,
   RestOfDate in number
   )
                                                                                                                                      
   is
   
     LoanAccID  integer;
     DueLoanAccID integer;
     InterestsAccID  integer;
     FilialID  integer;
     CustID  integer;
     Currency integer;
     Result integer;
     TekDate Date;
     PredDate Date;
     DefDistrictName boolean;
     DistrictID integer;
     

    procedure Add_Payments(
                           P_CreditID in integer ,
                           P_paydate in date ,
                           P_PAYEDAMT in number ,
                           P_PAYEDINTAMT in number )
                           
    is
    
    begin
      insert into CM_PAYMENTS(
                  creditid, paydate, payedamt, payedintamt, payeddueamt,
                  payeddueintamt, payedpenaltyamt, tridamt, tridintamt, triddueamt,
                  triddueintamt, tridpenaltyamt, tridprimreserve, tridsecreserve,
                  outtridobligation
                  )
       values (P_CreditID,P_paydate,P_PAYEDAMT,P_PAYEDINTAMT,
               0,0,0,null,null,null,null,null,null,null,null);
       commit;                   

    end;    

    procedure Add_Tranches(
                           P_CreditID in integer ,
                           P_TrDate in Date ,
                           P_TrAmount in number )
    is
    begin
       insert into CM_TRANCHES(
                   CreditID,TRANCHEDATE,TRANCHEAMOUNT,
                   TRANCHETRID,RESERVETRID,OBLIGATIONOUTTRID
                   )
       values (P_CreditID,P_TrDate,P_TrAmount,0,null,null,null);
       commit;       
    end;                                              
                              
      
   begin
      
     select id, KLI_ID into LoanAccID, CustID from sb_account where Acc_no=LoanAccno;
     if LoanaccId = null then 
       Loanaccid :=0;
     end if;
     
     if  DueLoanAccno <> '' then
        select id into DueLoanAccID from sb_account where Acc_no=DueLoanAccno;
        if DueLoanaccId = null then 
          DueLoanaccid :=0;
        end if;
     end if;   
      
      select id into InterestsAccID from sb_account where Acc_no=InterestsAccno;
      if InterestsAccID = null then 
        InterestsAccID := 0;
      end if;
      
      --select id into CustID from cm_sb_customers where name=CustName;
      select id into FilialID from sb_filial where name=FilialName;
      select TEK_DAT,PRED_DAT into TekDate,PredDate from sb_sysdat;
     /* select creditid into Result from cm_accounts where Loanaccid=Loan_accid
                                       and DueLoanaccid=DueLoan_accid
                                       and InterestAccID=Interests_AccID;*/
      
       Result :=CM_CREDIT.contract_add(
                Currency=>0,
                boorowerid=>CustID,
                initialamount=>0,
                creditlineamount =>GivAmount,
                annualyinterestrate=>AnnualyInterestRate,
                annualyoverduerate=>0,
                annualypenaltyrate=>0,
                dateofconclusion=>OpenDate,
                duedatefirstcontract=>CloseDate,
                numberofcredit=>NumOfCredit,
                purposeofcredit=>CreditPurpose,
                customertype=>1,
                credittype=>4,
                personaltype=>1,
                autopayment=>0,
                autoexpire=>0,
                usrgroup=>0,
                branchid=>FilialID,
                booroweraccid=>null,
                loanaccid=>LoanAccID,
                dueloanaccid=>DueLoanAccID,
                interestaccid=>InterestsAccID,
                dueinterestaccid=>null,
                primaryreserveaccid=>null,
                secondaryreserveaccid=>null,
                outcollateralaccid=>null,
                outguaranteeaccid=>null,
                reserveid=>1,
                duereserveid=>null,
                pledgeprice=>0,
                pledgeid=>1);
      
                update cm_curr_state
                set hdate=TekDate,
                    LastCalcDate=TekDate,
                    StopCalcDate=TekDate,
                    Rest=RestOfDate,
                    DueRest=0 ,
                    DueInterestRest=0 ,
                    ReserveID=2 ,
                    DueReserveID=0 ,
                    GivenAmount=GivAmount ,
                    Obligation=GivAmount - RestOfDate ,
                    PledgePrice=0
                where creditid=Result;    

            update cm_prev_state
            set     Hdate=PredDate,
                    LastCalcDate=PredDate ,
                    StopCalcDate=PredDate ,
                    Rest=RestOfDate,
                    DueRest=0 ,
                    DueInterestRest=0 ,
                    ReserveID=2 ,
                    DueReserveID=0 ,
                    GivenAmount=GivenAmount ,
                    Obligation=RestOfDate ,
                    PledgePrice=0
             where creditid=Result;       
                    
           Add_Payments(
                           P_CreditID=>Result ,
                           P_paydate=>Tekdate ,
                           P_PAYEDAMT=>PaydAmt,
                           P_PAYEDINTAMT=>PaydIntAmt);   
                           
           Add_Tranches(
                           P_CreditID=>Result ,
                           P_TrDate =>Tekdate ,
                           P_TrAmount=>PaydAmt);                           
                           
                   
         select min(Agro_village.id) into DistrictID from Agro_village,agro_region 
                   where   Agro_village.dependid=agro_region.id
                   and   agro_region.regname=DistrictName;
                                   
         insert into cm_bisnens_plan(creditid,sourse,village_id)
         values(Result,'',DistrictID);                                   
       
       /* nou  added to cm_usergroups*/
       
--     select id into IDDistrict from 
       --where name=DistrictName;
       --DefDistrictName:=(IDDistrict is null);
       
       --if DefDistrictName then                   
       --   Add_Districts(DistrictName,Filialid);                 
       --end if; 
       
      --Commit Work;
                    
   end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_EXCEL_IMPORTER

-- Start of DDL Script for Package CREDITSMGR.CM_EXPIRE
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_expire
  IS
  procedure Expire_Add(
            p_CreditID in Integer ,
            p_Date in Date ,
            p_Amount in Number ,
            p_SReserveID in Integer ,
            p_UseTransactions in Boolean default True  
            );
  procedure CommitExpire(
             DoCommit in Boolean default True
   );
  procedure Expire_Delete(p_ExpID in Integer);
  function ExpireDaysCount(
          p_CreditID in integer           
          )
  return integer;
  function Get_PayedInterestAmt(
   p_CreditID in Integer
   )
   return Number;
  function Get_PayedPrincipialAmt(
   p_CreditID in Integer
   )
   return Number;
  function Get_ScheduleInterestAmt(
   p_CreditID in Integer
   )
   return Number;
  function Get_SchedulePrincipialAmt(
   p_CreditID in Integer
   )
   return Number;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_expire
IS

  procedure Expire_Add(
            p_CreditID in Integer ,
            p_Date in Date ,
            p_Amount in Number ,
            p_SReserveID in Integer ,
            p_UseTransactions in Boolean default True  
            )
  is
    cursor c_PortfInfo(CrdID in Integer) is
    select CURRENCY ,  
           NUMBEROFCREDIT ,
           CUSTOMERTYPE ,
           CREDITTYPE ,
           BRANCHID
      from CM_ACTIVE_CREDITS     
     where ID = CrdID;    
     
     cursor c_HistInfo(CrdID in Integer) is
     select REST ,
            DUEREST ,
            RESERVEID ,
            DUERESERVEID             
       from CM_CURR_STATE
      where CREDITID = CrdID;     

      cursor c_Rates(CurrencyID in Integer) is
      select OSTAT
        from SB_TEMPRATE
       where VAL_KOD=CurrencyID;
       
      cursor c_ReserveRate(p_ID in Integer) is
      select PERCENT
        from CM_RESERVE_TYPES
       where ID = p_ID;
      
      cursor c_Account(CrdID in Integer) is
      select LOANACCID ,
             DUELOANACCID ,
             PRIMARYRESERVEACCID ,
             SECONDARYRESERVEACCID 
        from CM_ACCOUNTS
       where CreditID = CrdID;                  
     
     cursor c_archost(p_id in integer) is
     select pok_ostat
       from sb_tenostat
     where acc_id = p_id;
       
     PortfInfoRec c_PortfInfo%rowtype;
     HistInfoRec  c_HistInfo%rowtype;
     CurrRateRec  c_Rates%rowtype;
     ResrvRateRec c_ReserveRate%rowtype;
     AccInfoRec c_Account%rowtype;
     SReserveRateRec c_ReserveRate%rowtype;
     
     DebitAccID Integer;
     CreditAccID Integer;
     
     Temp Number := 0;
     TrAmount Number;
     TrDescription Varchar2(255); 
     
     ReserveContEnabled Boolean;
     
     ResultMainTrID Integer;
     ResultPResTrID Integer;
     ResultSResTrID Integer;
     
  begin
    open c_HistInfo(p_CreditID);
    fetch c_HistInfo into HistInfoRec;
    close c_HistInfo;
    
    if ( p_Amount <= 0 ) or ( p_Amount > HistInfoRec.REST ) then
      CM_UTILS.ProcessError(0); -- ToDo
    end if;

    open c_PortfInfo(p_CreditID);
    fetch c_PortfInfo into PortfInfoRec;
    close c_PortfInfo;
    
    open c_Account(p_CreditID);
    fetch c_Account into AccInfoRec;
    close c_Account;
        
    -- Processing Transactions
    
    -- Procesing Main Transaction
     
      DebitAccID := AccInfoRec.DUELOANACCID;
      CreditAccID := AccInfoRec.LOANACCID;
      TrAmount := p_Amount;
      
      TrDescription := CM_UTILS.trDescMainDebtExpire();
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfoRec.NUMBEROFCREDIT);
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
      
      ResultMainTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => null ,
           p_creditamount => TrAmount ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagInBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription
          );         
      
    -- End Processing Main Transaction
    
    -- Processing Reserve Control
    
    ReserveContEnabled := CM_UTILS.CreditReserveContEnabled(PortfInfoRec.CreditType) = 1;
    
    if ReserveContEnabled then
    
        open c_Rates(PortfInfoRec.CURRENCY);
        fetch c_Rates into CurrRateRec;  
        close c_Rates; 

      -- Processing PRIMARY Reserve Reduce
      
         CreditAccID := CM_UTILS.lnkReserveAccount(
           p_custcategory =>  PortfInfoRec.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfoRec.CURRENCY ,
           p_bankid => PortfInfoRec.BRANCHID
         );
         
         DebitAccID := AccInfoRec.PRIMARYRESERVEACCID;
         
         open c_ReserveRate(HistInfoRec.RESERVEID);
         fetch c_ReserveRate into ResrvRateRec;
         close c_ReserveRate;
         
         TrAmount := CM_UTILS.CalcPercent(
           p_sum => p_Amount ,
           p_rate => ResrvRateRec.PERCENT ,
           p_coefficient => 1 ,
           p_delimmer => 1
         );
           
        TrAmount := Round(TrAmount * CurrRateRec.OSTAT, 2);

        TrDescription := CM_UTILS.trDescReserveReduce();
        TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfoRec.NUMBEROFCREDIT);
        TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
        
        ResultPResTrID := 
          CM_TRANSACTIONMGR.CM_TransactionAdd(
             p_trid => null ,
             p_debitaccid => DebitAccID ,
             p_creditaccid => CreditAccID ,
             p_debitamount => null ,
             p_creditamount => TrAmount ,
             p_natamount => null ,
             p_flags => CM_DECLS.cmTrFlagInBalance ,
             p_optype => CM_DECLS.cmTransactionOpType ,
             p_inbalancechar => null ,
             p_trdate => p_Date ,
             p_trdescription => TrDescription
            );
                     
      -- Processing SECONDARY Reserve Reduce
      
        open c_ReserveRate(HistInfoRec.DUERESERVEID);
        fetch c_ReserveRate into ResrvRateRec;
        close c_ReserveRate;

        open c_ReserveRate(p_SReserveID);
        fetch c_ReserveRate into SReserveRateRec;
        close c_ReserveRate;
                
        
        if HistInfoRec.DUEREST > 0 then
        
           if ResrvRateRec.PERCENT is null then
             CM_UTILS.ProcessError(1); -- TODO
           end if;
                         
           Temp := CM_UTILS.CalcPercent(
             p_sum => HistInfoRec.DUEREST ,
             p_rate => SReserveRateRec.PERCENT - ResrvRateRec.PERCENT ,
             p_coefficient => 1 ,
             p_delimmer => 1
           );
             
           Temp := Temp * CurrRateRec.OSTAT;
           
        end if;
      
        TrAmount := CM_UTILS.CalcPercent(
             p_sum => p_Amount ,
             p_rate => SReserveRateRec.PERCENT ,
             p_coefficient => 1 ,
             p_delimmer => 1
           );
             
        TrAmount := TrAmount * CurrRateRec.OSTAT;

        TrAmount := TrAmount + Temp;
        
        if TrAmount > 0 then
        
          TrDescription := CM_UTILS.trDescReserveIncrease();
        
          CreditAccID := AccInfoRec.SECONDARYRESERVEACCID;

          DebitAccID := CM_UTILS.lnkDueReserveAccount(
            p_custcategory =>  PortfInfoRec.CUSTOMERTYPE ,
            p_crdcurrency => PortfInfoRec.CURRENCY ,
            p_bankid => PortfInfoRec.BRANCHID
          );
                  
        else
         
          TrDescription := CM_UTILS.trDescReserveReduce();
        
          CreditAccID := CM_UTILS.lnkDueReserveAccount(
            p_custcategory =>  PortfInfoRec.CUSTOMERTYPE ,
            p_crdcurrency => PortfInfoRec.CURRENCY ,
            p_bankid => PortfInfoRec.BRANCHID
          );
         
         DebitAccID := AccInfoRec.SECONDARYRESERVEACCID;
  
        end if;
        
        TrAmount := Round(Abs(TrAmount),2);
        
        TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfoRec.NUMBEROFCREDIT);
        TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));

        ResultSResTrID := 
          CM_TRANSACTIONMGR.CM_TransactionAdd(
             p_trid => null ,
             p_debitaccid => DebitAccID ,
             p_creditaccid => CreditAccID ,
             p_debitamount => null ,
             p_creditamount => TrAmount ,
             p_natamount => null ,
             p_flags => CM_DECLS.cmTrFlagInBalance ,
             p_optype => CM_DECLS.cmTransactionOpType ,
             p_inbalancechar => null ,
             p_trdate => p_Date ,
             p_trdescription => TrDescription
            );
                     
    end if; -- ReserveContEnabled
    
    update CM_CURR_STATE
       set
         DUERESERVEID = p_SReserveID,
         REST = REST - p_Amount,
         DUEREST = DUEREST + p_Amount
     where CreditID = p_CreditID
     
    returning REST into Temp; 
     
    
    if Temp = 0 then
    
      update CM_ACCOUNTS
         set
           CONTRACTACCID = DUELOANACCID
       where CreditID = p_CreditID;
           
    end if;      
    
    insert into CM_EXPIRES(
      creditid, expdate, expamount, oldduereserveid, exptrid,
      prestrid, srestrid
    )
    values(
      p_CreditID, p_Date, p_Amount, HistInfoRec.DUERESERVEID, ResultMainTrID, 
      ResultPResTrID, ResultSResTrID
    );
    
  end;

   procedure CommitExpire(
             DoCommit in Boolean default True
   )
   is
   begin
   
     if  DoCommit  then
       CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(1);
       commit work;
     else
       rollback work;
     end if;
     
   end;
   
   procedure Expire_Delete(p_ExpID in Integer)
   is

     cursor c_ExpireInfo(ExpID in Integer) is
     select CREDITID, 
            EXPDATE, 
            EXPAMOUNT, 
            OLDDUERESERVEID, 
            EXPTRID,
            PRESTRID, 
            SRESTRID
       from CM_EXPIRES
      where ID = ExpID;
    
    cursor c_SYSDAT is
    select TEK_DAT
      from SB_SYSDAT;    
          
    ExpInfoRec c_ExpireInfo%rowtype;
    DAT c_SYSDAT%rowtype;
    
    Temp Integer;
    RestAfterDrop Number;
            
   begin
    
    open c_ExpireInfo(p_ExpID);
    fetch c_ExpireInfo into ExpInfoRec;
    close c_ExpireInfo; 
    
    open c_SYSDAT;
    fetch c_SYSDAT into DAT;
    close c_SYSDAT; 
    
    if DAT.TEK_DAT <> ExpInfoRec.EXPDATE then
      CM_UTILS.ProcessError(0);
    end if;
    
    -- Dropping Transactions if they exists
     
    if ExpInfoRec.EXPTRID is not null then
    if CM_TRANSACTIONMGR.TransactionExist(ExpInfoRec.EXPTRID) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(ExpInfoRec.EXPTRID);
    end if;
    end if;

    if ExpInfoRec.PRESTRID is not null then
    if CM_TRANSACTIONMGR.TransactionExist(ExpInfoRec.PRESTRID) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(ExpInfoRec.PRESTRID);
    end if;    
    end if;
    
    if ExpInfoRec.SRESTRID is not null then
    if CM_TRANSACTIONMGR.TransactionExist(ExpInfoRec.SRESTRID) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(ExpInfoRec.SRESTRID);
    end if;
    end if;
    
    update CM_CURR_STATE
       set REST = REST + ExpInfoRec.EXPAMOUNT ,
           DUEREST = DUEREST - ExpInfoRec.EXPAMOUNT ,
           DUERESERVEID = ExpInfoRec.OLDDUERESERVEID 
     where CreditID = ExpInfoRec.CREDITID
    returning REST into RestAfterDrop;  
    
    if RestAfterDrop > 0 then
    
      update CM_ACCOUNTS
         set ContractAccID = LoanAccID
       where CreditID = ExpInfoRec.CREDITID; 
          
    end if;
    
    delete from CM_EXPIRES where ID = p_ExpID;        
           
    commit work;
    
   end;   

   -- Auto expire
  
   function Get_SchedulePrincipialAmt(
   p_CreditID in Integer
   )
   return Number
   is
     cursor c_ShceduleSum(ACrdID in Integer ,ADate in Date) is
     select SUM(PRINCIPAL) as Total
       from CM_PAYMENT_SCHEDULE
      where PAYMENTDATE <= ADate and      
            CreditID = ACrdID;  
     
     ScheduleRec c_ShceduleSum%rowtype;       

     Result Number := 0;
     p_Date  Date;
  begin
  
    select TEK_DAT
      into p_Date
      from SB_SYSDAT;
      
     open c_ShceduleSum(p_CreditID ,p_Date);
     fetch c_ShceduleSum into ScheduleRec; 
     if c_ShceduleSum%found then
       Result := ScheduleRec.Total;
     end if;
     
     close c_ShceduleSum;
     
     if Result is null then
       Result := 0;
     end if;
     
     return Result; 
   end; 

   function Get_ScheduleInterestAmt(
   p_CreditID in Integer
   )
   return Number
   is
     cursor c_ShceduleSum(ACrdID in Integer ,ADate in Date) is
     select SUM(INTEREST) as Total
       from CM_PAYMENT_SCHEDULE
      where PAYMENTDATE <= ADate and      
            CreditID = ACrdID;
              
     ScheduleRec c_ShceduleSum%rowtype;
       
     Result Number := 0;
     p_Date  Date;
     
  begin
    select TEK_DAT
      into p_Date
      from SB_SYSDAT;
      
     open c_ShceduleSum(p_CreditID ,p_Date);
     fetch c_ShceduleSum into ScheduleRec;
      
     if c_ShceduleSum%found then
       Result := ScheduleRec.Total;
     end if;
     
     close c_ShceduleSum;

     if Result is null then
       Result := 0;
     end if;
     
     return Result; 
   end; 

   -- Getting Payed Amts
   
   function Get_PayedPrincipialAmt(
   p_CreditID in Integer
   )
   return Number
   is
     cursor c_ShceduleSum(ACrdID in Integer ,ADate in Date) is
     select SUM(PAYEDAMT)+SUM(PAYEDDUEAMT) as Total
       from CM_PAYMENTS
      where PAYDATE <= ADate and      
            CreditID = ACrdID;
              
     ScheduleRec c_ShceduleSum%rowtype;
              
     Result Number :=0;
     p_Date  Date;
  begin
    select TEK_DAT
      into p_Date
      from SB_SYSDAT;
      
     open c_ShceduleSum(p_CreditID ,p_Date);
     fetch c_ShceduleSum into ScheduleRec; 
     if c_ShceduleSum%found then
       Result := ScheduleRec.Total;
     end if;
     close c_ShceduleSum;
     
     if Result is null then
       Result := 0;
     end if;
     
     return Result; 
   end; 

   function Get_PayedInterestAmt(
   p_CreditID in Integer
   )
   return Number
   is
     cursor c_ShceduleSum(ACrdID in Integer ,ADate in Date) is
     select SUM(PAYEDINTAMT)+SUM(PAYEDDUEINTAMT) as Total
       from CM_PAYMENTS
      where PAYDATE <= ADate and      
            CreditID = ACrdID;  
     
     ScheduleRec c_ShceduleSum%rowtype;       
     Result Number := 0;
     p_Date  Date;
     
   begin
    select TEK_DAT
      into p_Date
      from SB_SYSDAT;
      
     open c_ShceduleSum(p_CreditID ,p_Date);
     fetch c_ShceduleSum into ScheduleRec; 
     if c_ShceduleSum%found then
       Result := ScheduleRec.Total;
     end if;
     close c_ShceduleSum;
     
     if Result is null then
       Result := 0;
     end if;
     
     return Result; 
   end; 
  
  function ExpireDaysCount(
          p_CreditID in integer           
          )
  return integer
  is
   
   cursor c_PaymentSchedule(CrdID in integer, ADate in Date) is
   select MAX(PAYMENTDATE) as MaxDate 
     from CM_PAYMENT_SCHEDULE
    where CreditID = CrdID and PAYMENTDATE <= ADate;  
   
   Schedule c_PaymentSchedule%rowtype;
   
   Result Integer :=0;
   p_Date  Date;
  begin
    select TEK_DAT
      into p_Date
      from SB_SYSDAT;
      
    open c_PaymentSchedule(p_CreditID,p_Date);
    fetch c_PaymentSchedule into Schedule;
    if c_PaymentSchedule%found then
      Result := p_Date - Schedule.MaxDate; 
    end if;
    close c_PaymentSchedule;
    
    return 0;
  end;
  
             
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_EXPIRE

-- Start of DDL Script for Package CREDITSMGR.CM_INT_PLACEOUTBALANCE
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_int_placeoutbalance
IS
   PROCEDURE int_placeoutbalance (
      p_creditid           IN   INTEGER,
      p_cust_intoutaccid   IN   INTEGER,
      p_date               IN   DATE
   );

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_int_placeoutbalance
IS
   PROCEDURE int_placeoutbalance (
      p_creditid           IN   INTEGER,
      p_cust_intoutaccid   IN   INTEGER,
      p_date               IN   DATE
   )
   IS
      CURSOR c_accounts (crdid IN INTEGER)
      IS
         SELECT loanaccid, interestaccid, dueinterestaccid, outinterestaccid
           FROM cm_accounts
          WHERE creditid = crdid;

      CURSOR c_portfolio (crdid IN INTEGER)
      IS
         SELECT currency, branchid, customertype, numberofcredit
           FROM cm_active_credits
          WHERE id = crdid;

      CURSOR c_reserverate (crdid IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserves
          WHERE id = crdid;

      CURSOR c_history (crdid IN INTEGER)
      IS
         SELECT reserveid, interestrest, dueinterestrest
           FROM cm_curr_state
          WHERE creditid = crdid;

      accountsinfo              c_accounts%ROWTYPE;
      portinfo                  c_portfolio%ROWTYPE;
      reserverate               c_reserverate%ROWTYPE;
      histinfo                  c_history%ROWTYPE;
      debitacc                  INTEGER;
      creditacc                 INTEGER;
      loanacc_id                INTEGER;
      interestacc_id            INTEGER;
      dueinterestacc_id         INTEGER;
      outinterestacc_id         INTEGER;
      custtype                  INTEGER;
      currid                    INTEGER;
      br_id                     INTEGER;
      resultintbalancetrid      INTEGER;
      resultintoutbalancetrid   INTEGER;
      trdescription             VARCHAR2 (255);
      amount                    NUMBER;
      reserveamt                NUMBER;
      definoutbalance           BOOLEAN;
      defcrdid                  INTEGER;
   BEGIN
      IF (amount <= 0)
      THEN
         cm_utils.processerror (cm_decls.ezerotranchenotsupported);
      END IF;

      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accountsinfo;
      CLOSE c_accounts;
      
      loanacc_id := accountsinfo.loanaccid;
      interestacc_id := accountsinfo.interestaccid;
      dueinterestacc_id := accountsinfo.dueinterestaccid;
      outinterestacc_id := accountsinfo.outinterestaccid;
      
      OPEN c_history (p_creditid);
      FETCH c_history INTO histinfo;
      CLOSE c_history;
      
      amount :=   histinfo.interestrest
                + histinfo.dueinterestrest;
      
      OPEN c_portfolio (p_creditid);
      FETCH c_portfolio INTO portinfo;
      CLOSE c_portfolio;
      
      custtype := portinfo.customertype;
      currid := portinfo.currency;
      br_id := portinfo.branchid;

      creditacc := interestacc_id;
      debitacc := cm_utils.lnkinterestaccount (
                     p_custcategory=> custtype,
                     p_crdcurrency=> currid,
                     p_bankid=> br_id
                  );

      IF debitacc IS NULL
      THEN
         cm_utils.processerror (cm_decls.einvokeaccountnotfound); -- Change  
      END IF;

      trdescription := cm_utils.trdescreserveincrease ();
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescnumber,
                          portinfo.numberofcredit
                       ); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (p_date, 'DD/MM/YYYY')
                       );
      resultintbalancetrid :=
            cm_transactionmgr.cm_transactionadd (
               p_trid=> NULL,
               p_debitaccid=> debitacc,
               p_creditaccid=> creditacc,
               p_debitamount=> amount,
               p_creditamount=> NULL,
               p_natamount=> NULL,
               p_flags=> cm_decls.cmtrflaginbalance,
               p_optype=> cm_decls.cmtransactionoptype,
               p_inbalancechar=> NULL,
               p_trdate=> p_date,
               p_trdescription=> trdescription
            );
      --Now  Amount placed in Outbalance.

      debitacc := outinterestacc_id;
      creditacc :=
            cm_utils.inkoutinvinterestaccount (
               p_custcategory=> portinfo.customertype,
               p_crdcurrency=> portinfo.currency,
               p_bankid=> portinfo.branchid
            );

    --  raise_application_error(-20007,'creditacc ='||creditacc);      
      IF creditacc IS NULL
      THEN
         cm_utils.processerror (cm_decls.einvokeaccountnotfound); -- Change  
      END IF;

      trdescription := cm_utils.trdescobligationreduce ();
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescnumber,
                          portinfo.numberofcredit
                       ); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (p_date, 'DD/MM/YYYY')
                       );
      resultintoutbalancetrid :=
            cm_transactionmgr.cm_transactionadd (
               p_trid=> NULL,
               p_debitaccid=> debitacc,
               p_creditaccid=> creditacc,
               p_debitamount=> amount,
               p_creditamount=> NULL,
               p_natamount=> NULL,
               p_flags=> cm_decls.cmtrflagoutbalance,
               p_optype=> cm_decls.cmtransactionoptype,
               p_inbalancechar=> NULL,
               p_trdate=> p_date,
               p_trdescription=> trdescription
            );

      --Now inserted to table CM_INT_OUTBALANCE.

      INSERT INTO cm_int_outbalance
                  (tramount, trinbalance, trinoutbalance,
                   creditid, trdate)
           VALUES (amount, resultintbalancetrid, resultintoutbalancetrid,
                   p_creditid, p_date);
   END;

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE)
   IS
   BEGIN
      IF defcommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions(1) ;
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_INT_PLACEOUTBALANCE

-- Start of DDL Script for Package CREDITSMGR.CM_IP
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ip
  IS
  
--------------------Type Manipulating----------------------------
  procedure ipAddType(typedesc varchar2);
  procedure ipDelType(typeid number);
  procedure ipUpdType(typeid number, typedesc varchar2);
--------------------Type Manipulating----------------------------

--------------------Insurance Manipulating-----------------------
  procedure ipAddIns(insdesc varchar2);
  procedure ipDelIns(insid number);
  procedure ipUpdIns(insid number, insdesc varchar2);
--------------------Insurance Manipulating-----------------------

--------------------Info Manipulating----------------------------
  function crdGetTrchDate(c_id number)
  return date;
  
  procedure tmaddnewticket (credid number, kbank number default 1532);
  procedure ipAddEditInfo (
       i_creditid           number,
       i_predaddress        varchar2,
       i_predtype           number,
       i_predplatz          number,
       i_ownername          varchar2,
       i_predcost           number,
       i_proplawno          varchar2,
       i_proplawregno       varchar2,
       i_contractno         varchar2,
       i_contractdate       date,
       i_contractnot        varchar2,
       i_paperno            varchar2,
       i_paperdate          date,
       i_evaluater          varchar2,
       i_insurancecompany   number,
       i_insuranceamount    number,
       i_insuranceno        varchar2,
       i_insurancedate      date,
       i_bankopendate       date, 
       i_bankclosedate      date,
       i_givenflatamt       number, 
       i_handingactdate     date, 
       i_handingactno       varchar2, 
       i_resortdate         date  
    );
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_ip
IS
--------------------Type Manipulating----------------------------
  procedure ipAddType(typedesc varchar2)
  is
  begin
    insert into cm_ip_types (description) values (typedesc);
    commit;
  end;
  
  procedure ipUpdType(typeid number, typedesc varchar2)
  is
  begin
    update cm_ip_types set description=typedesc where id=typeid;
    commit;
  end;
  
  procedure ipDelType(typeid number)
  is
  begin
    delete from cm_ip_types where id=typeid;
    commit;
  end;
--------------------Type Manipulating----------------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

--------------------Insurance Manipulating-----------------------
  procedure ipAddIns(insdesc varchar2)
  is
  begin
    insert into cm_ip_insurances (description) values (insdesc);
    commit;
  end;
  
  procedure ipUpdIns(insid number, insdesc varchar2)
  is
  begin
    update cm_ip_insurances set description=insdesc where id=insid;
    commit;
  end;
  
  procedure ipDelIns(insid number)
  is
  begin
    delete from cm_ip_insurances where id=insid;
    commit;
  end;
--------------------Insurance Manipulating-----------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

--------------------Info Manipulating----------------------------
    procedure ipAddEditInfo (
       i_creditid           number,
       i_predaddress        varchar2,
       i_predtype           number,
       i_predplatz          number,
       i_ownername          varchar2,
       i_predcost           number,
       i_proplawno          varchar2,
       i_proplawregno       varchar2,
       i_contractno         varchar2,
       i_contractdate       date,
       i_contractnot        varchar2,
       i_paperno            varchar2,
       i_paperdate          date,
       i_evaluater          varchar2,
       i_insurancecompany   number,
       i_insuranceamount    number,
       i_insuranceno        varchar2,
       i_insurancedate      date,
       i_bankopendate       date, 
       i_bankclosedate      date,
       i_givenflatamt       number, 
       i_handingactdate     date, 
       i_handingactno       varchar2, 
       i_resortdate         date  
    )
    is
    begin
       update cm_ip_info
          set  predaddress= i_predaddress,                                      
               predtype= i_predtype,                                            
               predplatz= i_predplatz,                                          
               ownername= i_ownername,                                          
               predcost= i_predcost,                                            
               proplawno= i_proplawno,                                          
               proplawregno= i_proplawregno,                                    
               contractno= i_contractno,                                        
               contractdate= i_contractdate,                                    
               contractnot= i_contractnot,                                      
               paperno= i_paperno,                                              
               paperdate= i_paperdate,                                          
               evaluater= i_evaluater,                                          
               insurancecompany= i_insurancecompany,                            
               insuranceamount= i_insuranceamount,                              
               insuranceno= i_insuranceno,                                      
               insurancedate= i_insurancedate,
               bankopendate= i_bankopendate,
               bankclosedate= i_bankclosedate,
               givenflatamt= i_givenflatamt, 
               handingactdate= i_handingactdate, 
               handingactno= i_handingactno, 
               resortdate= i_resortdate  
        where creditid = i_creditid;
    
       if sql%rowcount = 0
       then
          insert into cm_ip_info
                      (creditid,                      
                       predaddress,                   
                       predtype,                      
                       predplatz,                     
                       ownername,                     
                       predcost,                      
                       proplawno,                     
                       proplawregno,                  
                       contractno,                    
                       contractdate,                  
                       contractnot,                   
                       paperno,                       
                       paperdate,                     
                       evaluater,                     
                       insurancecompany,              
                       insuranceamount,               
                       insuranceno,                   
                       insurancedate,
                       bankopendate,
                       bankclosedate,
                       givenflatamt, 
                       handingactdate, 
                       handingactno, 
                       resortdate
                      )
               values (i_creditid,                      
                       i_predaddress,                   
                       i_predtype,                      
                       i_predplatz,                     
                       i_ownername,                     
                       i_predcost,                      
                       i_proplawno,                     
                       i_proplawregno,                  
                       i_contractno,                    
                       i_contractdate,                  
                       i_contractnot,                   
                       i_paperno,                       
                       i_paperdate,                     
                       i_evaluater,                     
                       i_insurancecompany,              
                       i_insuranceamount,               
                       i_insuranceno,                   
                       i_insurancedate,
                       i_bankopendate,
                       i_bankclosedate,
                       i_givenflatamt, 
                       i_handingactdate, 
                       i_handingactno, 
                       i_resortdate
                      );
       end if;
    
       commit;
    end;
--------------------Info Manipulating----------------------------

-- >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< >< --

---------------------Other Functions-----------------------------
function crdGetTrchDate(c_id number)
  return date
  is
  res date; 
begin
  select nvl(max(tranchedate),sysdate)
    into res
    from cm_tranches
   where creditid=c_id;
   return res;  
end;

procedure tmaddnewticket (credid number, kbank number default 1532)
is
  cursor c_crd 
  is
    select creditlineamount amnt, usrgroup kbank from cm_portfolio where id=credid;
  crd c_crd%rowtype;
begin
    open c_crd;
    fetch c_crd into crd;
    close c_crd;
    insert into smart.tm_archive
                (pdate, dbankfilial, ammount, userid, status, kbankfilial)
       select tek_dat, smart.sb_aca.getuserfilialid (user), crd.amnt, UID, 1,
              crd.kbank
         from sb_sysdat;
    commit;
end;
---------------------Other Functions-----------------------------
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_IP

-- Start of DDL Script for Package CREDITSMGR.CM_IP_REPORTS
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ip_reports
is

  function getboorowername(crdid number) return varchar2;
  function getage(birthdate date) return number;

  procedure insonerowmkt(crdid number);
  procedure insonerowboorower(crdid number);
  procedure insonerowmkts (crdid number);
  procedure insonerowinsurance (crdid number);
  procedure insonerowdate(crdid number);
  
end;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_ip_reports
is
   function getboorowername (crdid number)
      return varchar2
   is
      res   varchar2 (150);
   begin
      select name
        into res
        from cm_boorowerinfo
       where creditid = crdid;

      return res;
   exception
      when NO_DATA_FOUND
      then
         return 'Unnamed';
   end;

   function getage (birthdate date)
      return number
   is
   begin
      return NVL (TRUNC ((to_date (SYSDATE) - (birthdate)) / 365), 0);
   end;

   procedure insonerowmkt (crdid number)
   is
      cursor c_crdinfo
      is
         select annualyinterestrate rate1, annualyoverduerate rate2, name,
                dateofconclusion contdate, numberofcredit contractno,
                duedatefirstcontract - dateofconclusion credperiod
           from cm_portfolio, cm_boorowerinfo
          where id = crdid and creditid = crdid;

      cursor c_trchinfo
      is
         select sum (trancheamount) tramt
           from cm_tranches
          where creditid = crdid;

      cursor c_payinfo
      is
         select sum (payedamt) tramt
           from cm_payments
          where creditid = crdid;

      cursor c_histinfo
      is
         select rest + duerest tramt
           from cm_curr_state
          where creditid = crdid;

      crdinfo   c_crdinfo%rowtype;
      trcinfo   c_trchinfo%rowtype;
      payinfo   c_payinfo%rowtype;
      hstinfo   c_histinfo%rowtype;
   begin
      open c_crdinfo;
      fetch c_crdinfo into crdinfo;
      close c_crdinfo;
      open c_trchinfo;
      fetch c_trchinfo into trcinfo;
      close c_trchinfo;
      open c_payinfo;
      fetch c_payinfo into payinfo;
      close c_payinfo;
      open c_histinfo;
      fetch c_histinfo into hstinfo;
      close c_histinfo;

      insert into cm_ip_mktinfo
           values (crdid, '$' || crdid, crdinfo.name, trcinfo.tramt,
                   trcinfo.tramt, payinfo.tramt, hstinfo.tramt,
                   crdinfo.rate1, crdinfo.rate2, crdinfo.credperiod, crdid,
                   0, crdinfo.contdate, crdinfo.contractno, SYSDATE,
                   '$' || crdid);
   end;

   procedure insonerowboorower (crdid number)
   is
      cursor c_boor
      is
         select   p.id, cardid, c.name, s.bdate, i.address, i.work,
                  i.workplace
             from cm_portfolio p,
                  sb_customers c,
                  smart.custipinfo s,
                  smart.custinfo i
            where boorowerid = c.id
              and boorowerid = s.custid(+)
              and p.id = crdid
              and i.id(+) = s.cardid
         order by cardid;

      cursor c_crdinf
      is
         select annualyinterestrate rate1, annualyoverduerate rate2,
                duedatefirstcontract - dateofconclusion period1,
                duedatefirstcontract lastdat, creditlineamount cramount
           from cm_portfolio
          where id = crdid;

      cursor c_trinf
      is
         select min (tranchedate) trdat, sum (trancheamount) tramt
           from cm_tranches
          where creditid = crdid;

      boor     c_boor%rowtype;
      crdinf   c_crdinf%rowtype;
      trnf     c_trinf%rowtype;
   begin
      open c_boor;
      fetch c_boor into boor;
      close c_boor;
      open c_crdinf;
      fetch c_crdinf into crdinf;
      close c_crdinf;
      open c_trinf;
      fetch c_trinf into trnf;
      close c_trinf;

      insert into cm_ip_boorowerinfo
           values (crdid, boor.name, getage (boor.bdate), (boor.bdate),
                   boor.address, boor.work, boor.workplace, trnf.tramt,
                   crdinf.cramount, crdinf.period1,
                   crdinf.lastdat - trnf.trdat, crdinf.rate1, crdinf.rate2);
   end;

   procedure insonerowmkts (crdid number)
   is
      cursor c_crdinf
      is
         select p.id, u.description name, creditlineamount
           from cm_portfolio p, cm_usergroups u
          where p.usrgroup = u.id and p.id = crdid;

      cursor c_trinf
      is
         select min (tranchedate) trdat, NVL (sum (trancheamount), 0) tramt
           from cm_tranches
          where creditid = crdid;

      cursor c_payinf
      is
         select NVL (sum (payedamt), 0) pamt
           from cm_payments
          where creditid = crdid;

      crdinf   c_crdinf%rowtype;
      trnf     c_trinf%rowtype;
      payinf   c_payinf%rowtype;
   begin
      open c_crdinf;
      fetch c_crdinf into crdinf;
      close c_crdinf;
      open c_trinf;
      fetch c_trinf into trnf;
      close c_trinf;
      open c_payinf;
      fetch c_payinf into payinf;
      close c_payinf;

      insert into cm_ip_mktsinfo
           values (crdid, crdinf.name, DECODE (trnf.tramt, 0, 0, 1),
                   trnf.tramt, DECODE (trnf.tramt, 0, 0, 1), trnf.tramt, 1,
                   payinf.pamt);
   end;

   procedure insonerowinsurance (crdid number)
   is
      cursor c_crdinf
      is
         select p.id, u.description name, creditlineamount, b.name boorower,
                numberofcredit crdnum
           from cm_portfolio p, cm_usergroups u, cm_boorowerinfo b
          where p.usrgroup = u.id and creditid = p.id and p.id = crdid;

      cursor c_trinf
      is
         select min (tranchedate) trdat, NVL (sum (trancheamount), 0) tramt
           from cm_tranches
          where creditid = crdid;

      cursor c_boorinf
      is
         select inscontractdate, inscontractpreiod
           from smart.custipinfo
          where custid = 1;

      crdinf   c_crdinf%rowtype;
      trnf     c_trinf%rowtype;
      boor     c_boorinf%rowtype;
   begin
      open c_crdinf;
      fetch c_crdinf into crdinf;
      close c_crdinf;
      open c_trinf;
      fetch c_trinf into trnf;
      close c_trinf;

      insert into cm_ip_insuranceinfo
           values (crdid, crdinf.name, crdinf.boorower, trnf.tramt, 0,
                   crdinf.crdnum, trnf.trdat, 0, 0, SYSDATE, 0, 0, SYSDATE);
   end;

   procedure insonerowdate (crdid number)
   is
      cursor c_boor
      is
         select name
           from cm_boorowerinfo
          where creditid = crdid;

      boor   c_boor%rowtype;
   begin
      open c_boor;
      fetch c_boor into boor;
      close c_boor;

      insert into cm_ip_dateinfo
           values (crdid, boor.name, 0, 0, 0, 0, '***', 0, 0, '***', 0,
                   '***', '***', '***', '***', '***', '***', '***');
   end;
end;
/


-- End of DDL Script for Package CREDITSMGR.CM_IP_REPORTS

-- Start of DDL Script for Package CREDITSMGR.CM_LOGIN
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_login
  IS
  
  AlertUserConst constant varchar2(10) := 'MSGTOUSER_';
  AlertConst     constant varchar2(16) := 'MessageBroadcast';
  function Get_SessionID
  return integer;
  function Get_UserAlert
  return varchar2;
  function Get_UserMessage
 return varchar2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_login
IS

  function Get_SessionID
  return integer
  is
    Result integer;
  begin
     select SID into Result
       from v$session
     where AudSID = UserEnv('SESSIONID');
     return result;  
  end;
  
  function Get_UserAlert
  return varchar2
  is
  begin
     return AlertUserConst||Get_SessionID;
  end;
  
 function Get_UserMessage
 return varchar2 is
 begin
   return sbmsg.get_usermessage;
 end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_LOGIN

-- Start of DDL Script for Package CREDITSMGR.CM_N3_SD
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_n3_sd
  IS


  procedure pn3_sdf(
               p_creditid in integer,
               p_bdate in date,
               p_edate in date);
  procedure pn2_sdf(
               p_creditid in integer,
               p_bdate in date,
               p_edate in date);
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_n3_sd
IS

 procedure pn3_sdf(
               p_creditid in integer,
               p_bdate in date,
               p_edate in date
              )
 is

  cursor c_reg(p_id in integer)
  is 
  select  
  name, depend_id ,id
  from agro_village
  where id = p_id;

  cursor c_cat(p_id in integer)
  is
  select
  id,description from cm_categories
  where id = p_id;

  cursor c_rest(crdid in integer,bdate in date ,edate in date)
  is
  select sum(rest) as arest
  from cm_history
  where creditid = crdid
  and hdate between bdate and edate;

 restinfo c_rest%rowtype;
 catinfo c_cat%rowtype;
 reginfo c_reg%rowtype;
 
 vid integer;
 catid integer;
 
 begin
 
   select villageid into vid
   from cm_business_plan
   where creditid = p_creditid;
   
   select customertype into catid
   from cm_portfolio
   where id = p_creditid;
   
   
   open c_reg(vid);
   fetch c_reg into reginfo;
   close c_reg;
   
   open c_cat(catid);
   fetch c_cat into catinfo;
   close c_cat;
   
   open c_rest(p_creditid,p_bdate,p_edate);
   fetch c_rest into restinfo;
   close c_rest;
   
   insert into cm_n3_sdt(vidsop, region_name, category_name, amt, branchid)
   values(null,reginfo.name,catinfo.description,restinfo.arest,0);
   
 end;  
 
 procedure pn2_sdf(
               p_creditid in integer,
               p_bdate in date,
               p_edate in date)
 is
 
  cursor c_rest(
                crdid in integer,
                bdate in date,
                edate in date
               )
  is
  select sum(rest) as arest
  from cm_history
  where creditid = crdid
  and hdate between bdate and edate;
  
  cursor c_reg(p_id in integer)
  is 
  select  
  name, depend_id ,id
  from agro_village
  where id = p_id;

  cursor c_port(p_id in integer)
  is
  select 
       currency,
       annualyinterestrate,
       branchid
  from cm_portfolio
  where id = p_id;
  
  cursor c_expires(crdid in integer,bdate in date,edate in date)
  is
  select sum(expamount) as aexpamt
  from cm_expires
  where creditid = crdid
  and expdate between bdate and edate; 
  
  restinfo c_rest%rowtype;
  reginfo c_reg%rowtype;
  portinfo c_port%rowtype;
  expinfo c_expires%rowtype;
  
  vid integer;
  BrName varchar2(34);
                 
 begin
 
   select villageid into vid
   from cm_business_plan
   where creditid = p_creditid;

   open c_rest(p_creditid,p_bdate,p_edate);
   fetch c_rest into restinfo;
   close c_rest;
   
   open c_reg(vid);
   fetch c_reg into reginfo;
   close c_reg;
   
   open c_port(p_creditid);
   fetch c_port into portinfo;
   close c_port;
   
   open c_expires(p_creditid,p_bdate,p_edate);
   fetch c_expires into expinfo;
   close c_expires;
   
   if portinfo.currency = 0 then
   
      insert into cm_n2_sdt(region_name, generalamt, avgamt, natvalamt, avgnatvalamt,
       freevalamt, avgfreevalamt, expiresamt, branch)
       values(reginfo.name,nvl(restinfo.arest,0),
              nvl(restinfo.arest*portinfo.annualyinterestrate,0),
              nvl(restinfo.arest,0),
              nvl(restinfo.arest*portinfo.annualyinterestrate,0),
              0,0,
              nvl(expinfo.aexpamt,0),
              getbranchname(portinfo.branchid));
   end if;

   if portinfo.currency = 1 then
   
      insert into cm_n2_sdt(region_name, generalamt, avgamt, natvalamt, avgnatvalamt,
       freevalamt, avgfreevalamt, expiresamt, branch)
       values(reginfo.name,nvl(restinfo.arest,0),
              nvl(restinfo.arest*portinfo.annualyinterestrate,0),
              0,0,
              nvl(restinfo.arest,0),
              nvl(restinfo.arest*portinfo.annualyinterestrate,0),
              nvl(expinfo.aexpamt,0),
              getbranchname(portinfo.branchid));
   end if;
   
 end;
                            

END;
/


-- End of DDL Script for Package CREDITSMGR.CM_N3_SD

-- Start of DDL Script for Package CREDITSMGR.CM_PAYMENT
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_payment
  IS

  procedure CommitPayment(
             DoCommit in Boolean default True
   );
  procedure Payment_Delete( 
            p_PaymentID in Integer
            );
  procedure PaymentAdd(
    p_CreditID in Integer , 
    p_Date in Date ,
    p_CustAccID in Integer ,
    p_MainDebt in Number default 0 ,
    p_MainInterest in Number default 0 ,
    p_DueDebt in Number default 0 ,
    p_DueInterest in Number default 0,
    p_ProcessTransactions in Boolean default True
   );
  procedure PayAuto(
            p_CreditID in Integer ,
            p_Date in Date ,            
            p_ShowTransactions in Boolean default False
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_payment
IS
     
   procedure PaymentAdd(
    p_CreditID in Integer , 
    p_Date in Date ,
    p_CustAccID in Integer ,
    p_MainDebt in Number default 0 ,
    p_MainInterest in Number default 0 ,
    p_DueDebt in Number default 0 ,
    p_DueInterest in Number default 0,
    p_ProcessTransactions in Boolean default True
   )
   is
     
    cursor c_PortfolioInfo(CrdID in Integer) is
    select CURRENCY ,  
           NUMBEROFCREDIT ,
           CUSTOMERTYPE ,
           CREDITTYPE ,
           BRANCHID,
           ANNUALYINTERESTRATE,
           ANNUALBANKRATE,
           DUEDATEFIRSTCONTRACT
      from CM_ACTIVE_CREDITS     
     where ID = CrdID;
     
     cursor c_HistoryInfo(CrdID in Integer) is
     select REST ,
            DUEREST ,
            INTERESTREST ,
            DUEINTERESTREST ,
            RESERVEID ,
            DUERESERVEID             
       from CM_CURR_STATE
      where CREDITID = CrdID;    
      
      cursor c_Rates(CurrencyID in Integer) is
      select OSTAT
        from SB_TEMPRATE
       where VAL_KOD=CurrencyID;
       
      cursor c_ReserveRate(p_ID in Integer) is
      select PERCENT
        from CM_RESERVE_TYPES
       where ID = p_ID;                
      
      cursor c_Accounts(CrdID in Integer) is
      select LOANACCID ,
             DUELOANACCID , 
             INTERESTACCID ,
             DUEINTERESTACCID ,
             PRIMARYRESERVEACCID ,
             SECONDARYRESERVEACCID ,
             OUTGUARANTEEACCID 
        from CM_ACCOUNTS
       where CreditID = CrdID;
       
       cursor c_payment_schedule(CrdID in integer,p_Dat in date) is
       select principal, 
              interest
       from  cm_payment_schedule
       where creditid = CrdID and paymentdate = p_Dat;      
      
      PortfInfo c_PortfolioInfo%rowtype;
      HistInfo c_HistoryInfo%rowtype;
      Rates c_Rates%rowtype; 
      CrdAccs c_Accounts%rowtype;
      ReserveRate c_ReserveRate%rowtype;      
      payment_schedule c_payment_schedule%rowtype; 
      
      DebitAccID   Integer; 
      CreditAccID  Integer;
      
      CrdRest Number;
      CrdInterestRest Number;
      CrdDueRest Number;
      CrdDueInterest Number;
      CrdPReserveID Integer;
      CrdSReserveID Integer;
      
      CrdPReserveRate Number;
      CrdSReserveRate Number;
      
      LoanAccID  Integer;
      InterestAccID  Integer;
      DueLoanAccID  Integer;
      DueInterestAccID  Integer;
      PrimaryReserveAccID  Integer;
      SecondaryReserveAccID  Integer;
      OUTOblAccID Integer;
      
      CrdCurrency Integer;
      CrdBranchID Integer;
      CrdNo Varchar2(255);
      CrdCustType Integer;
      CrdIType Integer;
      
      RenewableStatus Boolean;
      ReserveContEnabled Boolean;
      
      CrcyRate Number;
      
      TrDescription Varchar2(255);
      TrAmt Number;
      OblIncreaseAmt Number := 0;
      CreditRest number;
      ResultMainDebtTrID Integer;
      ResultPReserveTrID Integer;
      ResultSReserveTrID Integer;
      ResultOUTOblIncreaseTrID Integer;
      ResultIntDebtTrID Integer;
      ResultDueDebtTrID Integer;
      ResultDueIntDebtTrID Integer;
      BCloseDat  Date;
       
   begin
   
     open c_PortfolioInfo(p_CreditID);
     fetch c_PortfolioInfo into PortfInfo;
       CrdCurrency := PortfInfo.CURRENCY; 
       CrdBranchID := PortfInfo.BRANCHID; 
       CrdNo := PortfInfo.NUMBEROFCREDIT; 
       CrdCustType := PortfInfo.CUSTOMERTYPE; 
       CrdIType := PortfInfo.CREDITTYPE;      
     close c_PortfolioInfo;
     
     RenewableStatus := CM_UTILS.CreditRenewable(CrdIType) = 1;
     ReserveContEnabled := CM_UTILS.CreditReserveContEnabled(CrdIType) = 1;
     
     open c_HistoryInfo(p_CreditID);
     fetch c_HistoryInfo into HistInfo;
       CrdRest := HistInfo.REST;
       CrdInterestRest := HistInfo.INTERESTREST;
       CrdDueRest := HistInfo.DUEREST;
       CrdDueInterest := HistInfo.DUEINTERESTREST;
       CrdPReserveID := HistInfo.RESERVEID;
       CrdSReserveID := HistInfo.DUERESERVEID;     
     close c_HistoryInfo; 
     
     open c_Rates(CrdCurrency);
     fetch c_Rates into Rates;
       CrcyRate := Rates.OSTAT;
     close c_Rates;          
     
     open c_Accounts(p_CreditID);
     fetch c_Accounts into CrdAccs;
       LoanAccID  := CrdAccs.LOANACCID;
       InterestAccID  := CrdAccs.INTERESTACCID;
       DueLoanAccID  := CrdAccs.DUELOANACCID;
       DueInterestAccID  := CrdAccs.DUEINTERESTACCID;
       PrimaryReserveAccID  := CrdAccs.PRIMARYRESERVEACCID;
       SecondaryReserveAccID  := CrdAccs.SECONDARYRESERVEACCID;
       OUTOblAccID := CrdAccs.OUTGUARANTEEACCID;
     close c_Accounts;
     
     open c_ReserveRate(CrdPReserveID);
     fetch c_ReserveRate into ReserveRate;
       CrdPReserveRate := ReserveRate.PERCENT;
     close c_ReserveRate;

     open c_ReserveRate(CrdSReserveID);
     fetch c_ReserveRate into ReserveRate;
       CrdSReserveRate := ReserveRate.PERCENT;
     close c_ReserveRate;  
    
     open c_payment_schedule(p_CreditID,p_Date);
     fetch c_payment_schedule into payment_schedule;
     close c_payment_schedule;
     
     
     
     -- Main Debt
       
     if p_Maindebt > 0 then
     
       if p_MainDebt > CrdRest then
         CM_UTILS.ProcessError(0);
       end if; --p_MainDebt > CrdRest
       
       DebitAccID := p_CustAccID;
       CreditAccID := LoanAccID;
       TrAmt := Round(p_MainDebt, 2);
       
       TrDescription := CM_UTILS.trDescMainDebtPay();
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
              
       ResultMainDebtTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => null ,
           p_creditamount => TrAmt ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagInBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription
          );
       
       if ReserveContEnabled then --- ReserveContEnabled
       
          CreditAccID := CM_UTILS.lnkReserveAccount(
           p_custcategory =>  CrdCustType ,
           p_crdcurrency => CrdCurrency ,
           p_bankid => CrdBranchID
         );
         
         DebitAccID := PrimaryReserveAccID;
         
         TrAmt := CM_UTILS.CalcPercent(
           p_sum => p_MainDebt ,
           p_rate => CrdPReserveRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         );
         
         TrAmt := Round(TrAmt * CrcyRate ,2);
          
         TrDescription := CM_UTILS.trDescReserveReduce();
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
                
         ResultPReserveTrID := 
          CM_TRANSACTIONMGR.CM_TransactionAdd(
             p_trid => null ,
             p_debitaccid => DebitAccID ,
             p_creditaccid => CreditAccID ,
             p_debitamount => null ,
             p_creditamount => TrAmt ,
             p_natamount => null ,
             p_flags => CM_DECLS.cmTrFlagInBalance ,
             p_optype => CM_DECLS.cmTransactionOpType ,
             p_inbalancechar => null ,
             p_trdate => p_Date ,
             p_trdescription => TrDescription
            );
                     
       end if; --ReserveContEnabled
       
       if RenewableStatus then  --- Renewable Enabled
       
         OblIncreaseAmt := p_MainDebt;
       
       if CM_UTILS.ProcessOutBalanceTransactions = 1 then
                  
         DebitAccID := CM_UTILS.lnkOutInvObligationAccount(
           p_custcategory =>  CrdCustType ,
           p_crdcurrency => CrdCurrency ,
           p_bankid => CrdBranchID
         );
         
         CreditAccID := OUTOblAccID;
         
         TrAmt := Round(p_MainDebt, 2);
          
         TrDescription := CM_UTILS.trDescObligationIncrease();
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
                
         ResultOUTOblIncreaseTrID := 
          CM_TRANSACTIONMGR.CM_TransactionAdd(
             p_trid => null ,
             p_debitaccid => DebitAccID ,
             p_creditaccid => CreditAccID ,
             p_debitamount => null ,
             p_creditamount => TrAmt ,
             p_natamount => null ,
             p_flags => CM_DECLS.cmTrFlagOutBalance ,
             p_optype => CM_DECLS.cmTransactionOpType ,
             p_inbalancechar => null ,
             p_trdate => p_Date ,
             p_trdescription => TrDescription
            );
       end if; -- reduce     

       end if; --RenewableStatus 
            
     end if; -- p_Maindebt > 0  
     
     
     -- Interset Debt
     
     if p_MainInterest > 0 then  --Main Interest
     
       if p_MainInterest > CrdInterestRest then
         CM_UTILS.ProcessError(0); --ToDo
       end if; --p_MainInterest > CrdInterestRest
       
       DebitAccID := p_CustAccID;
       CreditAccID := InterestAccID;
       TrAmt := Round(p_MainInterest, 2);
       
       TrDescription := CM_UTILS.trDescMainIntDebtPay();
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
              
       ResultIntDebtTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => null ,
           p_creditamount => TrAmt ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagInBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription
          );
     end if; --p_MainInterest > 0
     
     -- Due Debt
     
     if p_DueDebt > 0 then -- Due Debt
     
       if p_DueDebt > CrdDueRest then
         CM_UTILS.ProcessError(0);
       end if; --p_DueDebt > CrdRest
       
       DebitAccID := p_CustAccID;
       CreditAccID := DueLoanAccID;
       TrAmt := Round(p_DueDebt, 2);
       
       TrDescription := CM_UTILS.trDescDueDebtPay();
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
              
       ResultDueDebtTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => null ,
           p_creditamount => TrAmt ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagInBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription
          );
       
       if ReserveContEnabled then --- ReserveContEnabled
       
         CreditAccID := CM_UTILS.lnkDueReserveAccount(
           p_custcategory =>  CrdCustType ,
           p_crdcurrency => CrdCurrency ,
           p_bankid => CrdBranchID
         );
         
         DebitAccID := SecondaryReserveAccID;
         
         TrAmt := CM_UTILS.CalcPercent(
           p_sum => p_DueDebt ,
           p_rate => CrdSReserveRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         );
         
         TrAmt := Round(TrAmt * CrcyRate ,2);
          
         TrDescription := CM_UTILS.trDescReserveReduce();
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
         TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
                
         ResultSReserveTrID := 
          CM_TRANSACTIONMGR.CM_TransactionAdd(
             p_trid => null ,
             p_debitaccid => DebitAccID ,
             p_creditaccid => CreditAccID ,
             p_debitamount => null ,
             p_creditamount => TrAmt ,
             p_natamount => null ,
             p_flags => CM_DECLS.cmTrFlagInBalance ,
             p_optype => CM_DECLS.cmTransactionOpType ,
             p_inbalancechar => null ,
             p_trdate => p_Date ,
             p_trdescription => TrDescription
            );
                     
       end if; --ReserveContEnabled
       
     end if; --p_DueDebt > 0      
     
     if p_DueInterest > 0 then  --p_DueInterest
     
       if p_DueInterest > CrdDueInterest then
         CM_UTILS.ProcessError(0); --ToDo
       end if; --p_DueInterest > CrdInterestRest
       
       DebitAccID := p_CustAccID;
       CreditAccID := DueInterestAccID;
       TrAmt := Round(p_DueInterest, 2);
       
       TrDescription := CM_UTILS.trDescDueIntDebtPay();
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,CrdNo); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
              
       ResultDueIntDebtTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => null ,
           p_creditamount => TrAmt ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagInBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription
          );
     end if; --p_DueInterest > 0
     
     
     update CM_CURR_STATE
        set REST = REST - p_MainDebt ,
            INTERESTREST = INTERESTREST - p_MainInterest ,
            DUEREST = DUEREST - p_DueDebt ,
            DUEINTERESTREST = DUEINTERESTREST - p_DueInterest ,
            OBLIGATION = OBLIGATION + OblIncreaseAmt
      where CREDITID = p_CreditID;    
      
      insert into CM_PAYMENTS(
        creditid, paydate, payedamt, payedintamt, payeddueamt,
        payeddueintamt, payedpenaltyamt, tridamt, tridintamt, triddueamt,
        triddueintamt, tridpenaltyamt, tridprimreserve, tridsecreserve,
        outtridobligation
        )
      values(
        p_CreditID, p_Date, p_MainDebt, p_MainInterest, p_DueDebt,
        p_DueInterest, 0, ResultMainDebtTrID, ResultIntDebtTrID, ResultDueDebtTrID,
        ResultDueIntDebtTrID, null, ResultPReserveTrID, ResultSReserveTrID,
        ResultOUTOblIncreaseTrID 
      );   
      
    if payment_schedule.principal < p_Maindebt then
         
          update cm_curr_state 
          set factcalcamt = factcalcamt - (p_Maindebt-payment_schedule.principal)
          where creditid = p_CreditID;
     
       select rest into CreditRest 
         from cm_curr_state where creditid = p_CreditID;
     
       SELECT bankclosedate into BCloseDat
         FROM cm_ip_info  where creditid = p_CreditID;
         
       delete cm_payment_schedule
       where creditid = p_CreditID
       and paymentdate > p_Date;
            
       CM_SCHEDULE.InsertAnnutySchedule(
             p_CreditID => p_CreditID,
             p_Amount => CreditRest ,
             p_Rate => PortfInfo.ANNUALYINTERESTRATE ,
             p_IpRate => PortfInfo.ANNUALBANKRATE,
             p_FirstPayDate =>  ADD_MONTHS(p_Date,1) ,
             p_StartDate =>ADD_MONTHS(p_Date,1) , 
             p_Periods => TRUNC(MONTHS_BETWEEN (BCloseDat,p_Date)),
             p_PeriodRate =>1 -- In Months 
            );
            
     end if;
              
   end;
   
   procedure CommitPayment(
             DoCommit in Boolean default True
   )
   is
   begin
     if  DoCommit  then
       CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);
       commit work;
     else
       rollback work;
     end if;
    end;
  
  procedure Payment_Delete( 
            p_PaymentID in Integer
            )
  is
  
    cursor c_Payment(PaymentID in Integer) is
    select CREDITID,
           PAYDATE,
           PAYEDAMT,
           PAYEDINTAMT,
           PAYEDDUEAMT,
           PAYEDDUEINTAMT,
           PAYEDPENALTYAMT,
           TRIDAMT,
           TRIDINTAMT,
           TRIDDUEAMT,
           TRIDDUEINTAMT,
           TRIDPENALTYAMT,
           TRIDPRIMRESERVE,
           TRIDSECRESERVE,
           OUTTRIDOBLIGATION     
      from CM_PAYMENTS
     where ID = PaymentID;
     
    Payment c_Payment%rowtype;
    Temp Integer;
    
    OblDecriseAmt Number := 0;
    CurrBankDate Date; 
      
  begin
  
    select TEK_DAT
      into CurrBankDate
      from SB_SYSDAT;
    
    open c_Payment(p_PaymentID);
    fetch c_Payment into Payment;
    if c_Payment%notfound then
      CM_UTILS.ProcessError(0); --ToDo
    end if;    
    close c_Payment;
    
    -- Checking Payment Processed today
    
    if Payment.PAYDATE <> CurrBankDate then
      CM_UTILS.ProcessError(0); --ToDo    
    end if;
     
    -- Drop ing Payment Transactions if they exist    
    
    if Payment.TRIDAMT is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDAMT) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDAMT);
    end if;
    end if;

    if Payment.TRIDINTAMT is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDINTAMT) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDINTAMT);
    end if;
    end if;
    
    if Payment.TRIDDUEAMT is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDDUEAMT) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDDUEAMT);
    end if;
    end if;
    
    if Payment.TRIDDUEINTAMT is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDDUEINTAMT) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDDUEINTAMT);
    end if;
    end if;

    if Payment.TRIDPRIMRESERVE is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDPRIMRESERVE) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDPRIMRESERVE);
    end if;
    end if;

    if Payment.TRIDSECRESERVE is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TRIDSECRESERVE) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TRIDSECRESERVE);
    end if;
    end if;
    
    /*if Payment.OUTTRIDOBLIGATION is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.OUTTRIDOBLIGATION, False) then
      Temp := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(Payment.OUTTRIDOBLIGATION);
    end if;
      OblDecriseAmt := Payment.PAYEDAMT; 
    end if */

    -- Rolling Back Payment
    
     update CM_CURR_STATE
        set REST = REST + Payment.PAYEDAMT ,
            INTERESTREST = INTERESTREST + Payment.PAYEDINTAMT ,
            DUEREST = DUEREST + Payment.PAYEDDUEAMT ,
            DUEINTERESTREST = DUEINTERESTREST + Payment.PAYEDDUEINTAMT ,
            OBLIGATION = OBLIGATION - OblDecriseAmt
      where CREDITID = Payment.CreditID;    
    
    delete from CM_PAYMENTS where ID = p_PaymentID;
    
    commit work;
    
  end;          
  
  procedure PayAuto(
            p_CreditID in Integer ,
            p_Date in Date ,            
            p_ShowTransactions in Boolean default False
            )
  is
  
     cursor c_HistoryInfo(CrdID in Integer) is
     select REST ,
            DUEREST ,
            INTERESTREST ,
            DUEINTERESTREST 
       from CM_CURR_STATE
      where CREDITID = CrdID;

      cursor c_Accounts(CrdID in Integer) is
      select BOOROWERACCID
        from CM_ACCOUNTS
       where CreditID = CrdID;
       
      cursor c_CurrAccRest(AcID in Integer) is
      select OSTAT
        from SB_TENOSTAT
       where Acc_ID = AcID;  
  
  HistInfoRec c_HistoryInfo%rowtype;         
  AccRec c_Accounts%rowtype;
  CurrAccRestRec c_CurrAccRest%rowtype; 
  
  LoanPaymentAmt Number := 0;
  DueLoanPaymentAmt Number := 0;
  InterestPaymentAmt Number := 0;
  DueInterestPaymentAmt Number := 0;
  
  CurrAccAmt Number;
  
  CurrAccFound Boolean;
  
  Temp Number;
    
  begin
    
    open c_Accounts(p_CreditID);
    fetch c_Accounts into AccRec;
    CurrAccFound := c_Accounts%found and (AccRec.BOOROWERACCID is not null); 
    close c_Accounts;
    
    if not CurrAccFound then
      CM_UTILS.ProcessError(0); -- ToDo
    end if;

    open c_CurrAccRest(AccRec.BOOROWERACCID);
    fetch c_CurrAccRest into CurrAccRestRec; 
    close c_CurrAccRest;
    
    CurrAccAmt := CurrAccRestRec.OSTAT;
    
    if (CurrAccAmt is null) or (CurrAccAmt <= 0) then
      CM_UTILS.ProcessError(0); --ToDo
    end if; 
    
    open c_HistoryInfo(p_CreditID);
    fetch c_HistoryInfo into HistInfoRec;
    close c_HistoryInfo;
    
    if HistInfoRec.REST + 
       HistInfoRec.INTERESTREST + 
       HistInfoRec.DUEINTERESTREST +
       HistInfoRec.DUEREST = 0 then   -- Nothing To Pay
       
    CM_UTILS.ProcessError(0); --ToDo
       
    end if;    
    
    Temp := HistInfoRec.DUEREST;
    if  Temp > 0 then
      if Temp > CurrAccAmt then
        DueLoanPaymentAmt := CurrAccAmt;
      else
        DueLoanPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.DUEINTERESTREST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        DueInterestPaymentAmt := CurrAccAmt;
      else
        DueInterestPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.INTERESTREST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        InterestPaymentAmt := CurrAccAmt;
      else
        InterestPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        

    Temp := HistInfoRec.REST;
    if  (Temp > 0) and (CurrAccAmt > 0) then
      if Temp > CurrAccAmt then
        LoanPaymentAmt := CurrAccAmt;
      else
        LoanPaymentAmt := Temp;   
      end if;  
      CurrAccAmt := CurrAccAmt - Temp;   
    end if;        
    
    PaymentAdd(
        p_CreditID => p_CreditID , 
        p_Date => p_Date ,
        p_CustAccID => AccRec.BOOROWERACCID ,
        p_MainDebt => LoanPaymentAmt ,
        p_MainInterest => InterestPaymentAmt ,
        p_DueDebt => DueLoanPaymentAmt ,
        p_DueInterest => DueInterestPaymentAmt ,
        p_ProcessTransactions => True    
    );
    
    CommitPayment(True);
    
    EXCEPTION WHEN OTHERS THEN
    
    CommitPayment(FALSE);
    RAISE;
    
                
  end;          
            
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_PAYMENT

-- Start of DDL Script for Package CREDITSMGR.CM_PAYMENTGRANT
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_paymentgrant
IS
   PROCEDURE commitpaymentgrant (docommit IN BOOLEAN DEFAULT TRUE);

   PROCEDURE paymentgrant (
      p_creditid      IN   INTEGER,
      p_account       IN   INTEGER,
      p_grantamount   IN   NUMBER
   );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_paymentgrant
IS
   PROCEDURE paymentgrant (
      p_creditid      IN   INTEGER,
      p_account       IN   INTEGER,
      p_grantamount   IN   NUMBER
   )
   IS
      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT contractaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_portfolio (p_id IN INTEGER)
      IS
         SELECT numberofcredit
           FROM cm_active_credits
          WHERE id = p_id;

      portinfo        c_portfolio%ROWTYPE;
      accinfo         c_accounts%ROWTYPE;
      creditaccid     INTEGER;
      debitaccid      INTEGER;
      trid            INTEGER;
      trdescription   VARCHAR2 (25);
      currdate        DATE;
      crdno           VARCHAR2 (25);
   BEGIN
      SELECT tek_dat
        INTO currdate
        FROM sb_sysdat;

      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accinfo;
      CLOSE c_accounts;
      
      OPEN c_portfolio (p_creditid);
      FETCH c_portfolio INTO portinfo;
      CLOSE c_portfolio;
      
      crdno := portinfo.numberofcredit;
      creditaccid := accinfo.contractaccid;
      debitaccid := p_account;

      IF creditaccid IS NULL
      THEN
         cm_utils.processerror (0);
      END IF;

      trdescription := 'Ялавя юдяниш';
      trdescription := REPLACE (trdescription, cm_decls.trdescnumber, crdno); -- TODO
      trdescription := REPLACE (
                          trdescription,
                          cm_decls.trdescdate,
                          TO_CHAR (currdate, 'DD/MM/YYYY')
                       );
      trid :=
            cm_transactionmgr.cm_transactionadd (
               p_trid=> NULL,
               p_debitaccid=> debitaccid,
               p_creditaccid=> creditaccid,
               p_debitamount=> NULL,
               p_creditamount=> p_grantamount,
               p_natamount=> NULL,
               p_flags=> cm_decls.cmtrflaginbalance,
               p_optype=> cm_decls.cmtransactionoptype,
               p_inbalancechar=> NULL,
               p_trdate=> currdate,
               p_trdescription=> trdescription
            );

      INSERT INTO cm_payments
                  (creditid, paydate, payedamt, payedintamt, payeddueamt,
                   payeddueintamt, payedpenaltyamt, tridamt)
           VALUES (p_creditid, currdate, p_account, 0, 0,
                   0, 0, trid);
   END;

   PROCEDURE commitpaymentgrant (docommit IN BOOLEAN DEFAULT TRUE)
   IS
   BEGIN
      IF docommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions (
            sb_decls.atfcommitimmediate
         );
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_PAYMENTGRANT

-- Start of DDL Script for Package CREDITSMGR.CM_PROLONGATION
-- Generated 30-Apr-2007 11:01:28 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_prolongation
  IS

  procedure Prolongation_Add(
              p_CreditID in Integer ,
              p_ProlongDate in Date ,
              p_NewDate in Date
            );
  procedure DelLastProlongation(
              p_CreditID in Integer
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_prolongation
IS

  procedure Prolongation_Add(
              p_CreditID in Integer ,
              p_ProlongDate in Date ,
              p_NewDate in Date
            )
  is
  
    cursor c_PortfInfo(CrdID in Integer) is
    select NVL(DUEDATELASTCONTRACT,DUEDATEFIRSTCONTRACT) as DueDate
      from CM_ACTIVE_CREDITS
     where ID = CrdID;
    
    PortfRec c_PortfInfo%rowtype;
        
  begin
  
    open c_PortfInfo(p_CreditID);
    fetch c_PortfInfo into PortfRec;
    close c_PortfInfo;
    
    insert into CM_PROLONGATIONS
      (CreditID, ProlongDate, NewCloseDate, OldCloseDate)
    values 
      (p_CreditID, p_ProlongDate, p_NewDate, PortfRec.DUEDATE);
    
    update CM_PORTFOLIO
       set DueDateLastContract = p_NewDate
     where ID = p_CreditID;   
      
    commit work;
         
  end;
  
  procedure DelLastProlongation(
              p_CreditID in Integer
            )
  is
  
    cursor c_LastProlong(CrdID in Integer) is
    select OldCloseDate 
      from CM_PROLONGATIONS
     where ID = (select Max(ID) from CM_PROLONGATIONS where CreditID = CrdID); 
    
    cursor c_ProlongCount(CrdID in Integer) is
    select count(*) as ProlongCnt 
      from CM_PROLONGATIONS
     where CreditID = CrdID; 
    
    ProlongRec c_LastProlong%rowtype;
    PrlgCountRec c_ProlongCount%rowtype;
    RecFound Boolean; 
      
  begin
  
    open c_LastProlong(p_CreditID);
    fetch c_LastProlong into ProlongRec;
    RecFound := c_LastProlong%found;
    close c_LastProlong;
    
    if not RecFound then
    
      return;
      
    else
             
       delete 
         from CM_PROLONGATIONS 
       where 
        ID = 
          (select Max(ID) from CM_PROLONGATIONS where CreditID = p_CreditID);
       
       open c_ProlongCount(p_CreditID);
       fetch c_ProlongCount into PrlgCountRec;
       close c_ProlongCount;
       
       if PrlgCountRec.ProlongCnt  = 0 then
       
         update CM_PORTFOLIO
            set DueDateLastContract = null
          where ID = p_CreditID;
          
       else
       
         update CM_PORTFOLIO
            set DueDateLastContract = ProlongRec.OldCloseDate
          where ID = p_CreditID;
          
       end if;           
        
    end if;
    
  end;          
            
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_PROLONGATION

-- Start of DDL Script for Package CREDITSMGR.CM_RESERVE_CONTR
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_reserve_contr
IS
   PROCEDURE correctreserve (p_creditid IN INTEGER);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_reserve_contr
IS
   PROCEDURE correctreserve (p_creditid IN INTEGER)
   IS
      CURSOR c_credithist (crdid IN INTEGER)
      IS
         SELECT rest, duerest, reserveid, duereserveid
           FROM cm_curr_state
          WHERE creditid = crdid;

      CURSOR c_reserve (resid IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserves
          WHERE id = resid;

      CURSOR c_portfinfo (crdid IN INTEGER)
      IS
         SELECT numberofcredit, credittype, currency, customertype, branchid
           FROM cm_active_credits
          WHERE id = crdid;

      CURSOR c_accounts (crdid IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = crdid;

      CURSOR c_sysdat
      IS
         SELECT tek_dat, pred_dat
           FROM sb_sysdat;

      CURSOR c_currrate (p_date IN DATE, p_currid IN INTEGER)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE dat = p_date AND val_kod = p_currid;

      /*CURSOR c_res_contr (crdid IN INTEGER)
      IS
         SELECT resprecision, dueresprecision, restrid, duerestrid
           FROM cm_reserves_contr
          WHERE creditid = crdid;*/

      histinfo             c_credithist%ROWTYPE;
      reserve              c_reserve%ROWTYPE;
      portfinfo            c_portfinfo%ROWTYPE;
      currcurrrate         c_currrate%ROWTYPE;
      prevcurrrate         c_currrate%ROWTYPE;
      bankdate             c_sysdat%ROWTYPE;
      accinforec           c_accounts%ROWTYPE;
     -- res_contr            c_res_contr%ROWTYPE;
      
      debitaccid           INTEGER;
      creditaccid          INTEGER;
      trpramt              NUMBER;
      trsecamt             NUMBER;
      trdescription        VARCHAR2 (255);
      tempprtrid           INTEGER;
      tempsectrid          INTEGER;
      deltacurrrate        NUMBER;
      reserveprdeltaamt    NUMBER (18,2)                /*:= 0*/;
      reservesecdeltaamt   NUMBER                 /*:= 0*/;
      resprec              NUMBER;
      dueresprec           NUMBER;
  
   BEGIN
    
    /*  OPEN c_res_contr (p_creditid);
      FETCH c_res_contr INTO res_contr;
      CLOSE c_res_contr;*/
     
      --resprec := res_contr.resprecision;
      --dueresprec := res_contr.dueresprecision;
     
      OPEN c_portfinfo (p_creditid);
      FETCH c_portfinfo INTO portfinfo;
      CLOSE c_portfinfo;

      IF portfinfo.currency = 0
      THEN -- National Currency
         RETURN;
      END IF;

      IF cm_utils.creditreservecontenabled (portfinfo.credittype) <> 1
      THEN
         RETURN;
      END IF;

      OPEN c_credithist (p_creditid);
      FETCH c_credithist INTO histinfo;
      CLOSE c_credithist;
      -- Correct Primary Reserve

      OPEN c_sysdat;
      FETCH c_sysdat INTO bankdate;
      CLOSE c_sysdat;

      OPEN c_currrate (bankdate.tek_dat, portfinfo.currency);
      FETCH c_currrate INTO currcurrrate;
      CLOSE c_currrate;

      OPEN c_currrate (bankdate.pred_dat, portfinfo.currency);
      FETCH c_currrate INTO prevcurrrate;
      CLOSE c_currrate;

      deltacurrrate :=   currcurrrate.ostat
                       - prevcurrrate.ostat;

      IF deltacurrrate = 0
      THEN
         RETURN;
      END IF;

      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accinforec;
      CLOSE c_accounts;

      IF histinfo.rest > 0
      THEN -- Correcting Primary Reserves

         OPEN c_reserve (histinfo.reserveid);
         FETCH c_reserve INTO reserve;
         CLOSE c_reserve;

         reserveprdeltaamt :=
                 cm_utils.calcpercent (
                    p_sum => histinfo.rest,
                    p_rate=> reserve.PERCENT * deltacurrrate,
                    p_coefficient=> 1,
                    p_delimmer=> 1
                 )
               + resprec;

  --raise_application_error(-20007,' reserveprdeltaamt = '||reserveprdeltaamt);

         IF reserveprdeltaamt <> 0
         THEN -- Transaction Means (Menasi Var) 
            IF reserveprdeltaamt > 0
            THEN -- Rate Incrised
               debitaccid :=
                     cm_utils.lnkreserveaccount (
                        p_custcategory=> portfinfo.customertype,
                        p_crdcurrency=> portfinfo.currency,
                        p_bankid=> portfinfo.branchid
                     );
               creditaccid := accinforec.primaryreserveaccid;
            ELSE
               debitaccid := accinforec.primaryreserveaccid;
               creditaccid :=
                     cm_utils.lnkreserveaccount (
                        p_custcategory=> portfinfo.customertype,
                        p_crdcurrency=> portfinfo.currency,
                        p_bankid=> portfinfo.branchid
                     );
            END IF;

            trpramt := cm_utils.precision2 (ABS (reserveprdeltaamt));
            trdescription := cm_utils.trdescreservereduce ();
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescnumber,
                                portfinfo.numberofcredit
                             );
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescdate,
                                TO_CHAR (bankdate.tek_dat, 'DD/MM/YYYY')
                             );
            tempprtrid :=
                  cm_transactionmgr.sbaddtransaction (
                     p_trid=> NULL,
                     p_debitid=> debitaccid,
                     p_creditid=> creditaccid,
                     p_debitamount=> trpramt,
                     p_creditamount=> trpramt,
                     p_lamount=> trpramt,
                     p_flags=> sb_decls.atfcommitimmediate,
                     p_operationtype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL,
                     p_transactiondate=> bankdate.tek_dat,
                     p_trname=> trdescription
                  );
         END IF; -- ReserveDeltaAmt <> 0
      END IF; --Rest > 0

      /*IF histinfo.duerest > 0
      THEN -- Correcting Primary Reserves
         OPEN c_reserve (histinfo.duereserveid);
         FETCH c_reserve INTO reserve;
         CLOSE c_reserve;
         reservesecdeltaamt := cm_utils.calcpercent (
                                  p_sum => histinfo.duerest,
                                  p_rate=> reserve.PERCENT * deltacurrrate,
                                  p_coefficient=> 1,
                                  p_delimmer=> 1
                               );

         IF reservesecdeltaamt <> 0
         THEN -- Transaction Means (Menasi Var) 
            IF reservesecdeltaamt > 0
            THEN -- Rate Incrised
               debitaccid :=
                     cm_utils.lnkduereserveaccount (
                        p_custcategory=> portfinfo.customertype,
                        p_crdcurrency=> portfinfo.currency,
                        p_bankid=> portfinfo.branchid
                     );
               creditaccid := accinforec.secondaryreserveaccid;
            ELSE
               debitaccid := accinforec.secondaryreserveaccid;
               creditaccid :=
                     cm_utils.lnkduereserveaccount (
                        p_custcategory=> portfinfo.customertype,
                        p_crdcurrency=> portfinfo.currency,
                        p_bankid=> portfinfo.branchid
                     );
            END IF;

            trsecamt := cm_utils.precision2 (ABS (reservesecdeltaamt));
            trdescription := cm_utils.trdescreservereduce ();
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescnumber,
                                portfinfo.numberofcredit
                             );
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescdate,
                                TO_CHAR (bankdate.tek_dat, 'DD/MM/YYYY')
                             );
            tempsectrid :=
                  cm_transactionmgr.sbaddtransaction (
                     p_trid=> NULL,
                     p_debitid=> debitaccid,
                     p_creditid=> creditaccid,
                     p_debitamount=> trsecamt,
                     p_creditamount=> trsecamt,
                     p_lamount=> trsecamt,
                     p_flags=> sb_decls.atfcommitimmediate,
                     p_operationtype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL,
                     p_transactiondate=> bankdate.tek_dat,
                     p_trname=> trdescription
                  );
         END IF; -- ReserveDeltaAmt <> 0
      END IF; --DueRest > 0*/    

     /* UPDATE cm_reserves_contr
         SET resprecision = NVL (cm_utils.precision7 (trpramt), 0),
             dueresprecision = NVL (cm_utils.precision7 (trpramt), 0),
             restrid = tempprtrid,
             duerestrid = tempsectrid
       WHERE creditid = p_creditid;*/

      COMMIT WORK;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESERVE_CONTR

-- Start of DDL Script for Package CREDITSMGR.CM_RESERVE_COUNT_NEW
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_reserve_count_new
IS
   PROCEDURE reserve_contr_new (p_creditid IN INTEGER);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_reserve_count_new
IS
   PROCEDURE reserve_contr_new (p_creditid IN INTEGER)
   IS
      CURSOR c_port (p_id IN INTEGER)
      IS
         SELECT numberofcredit, currency, customertype, credittype, branchid,
                annualyinterestrate
           FROM cm_active_credits
          WHERE id = p_id;

      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid,crdlineoblaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_history (p_id IN INTEGER)
      IS
         SELECT rest, duerest, reserveid, duereserveid,obligation
           FROM cm_curr_state
          WHERE creditid = p_id;

      CURSOR c_reserves (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserves
          WHERE id = p_id;

      CURSOR c_archost (p_id IN INTEGER)
      IS
         SELECT pok_ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      CURSOR c_ostat (valkod IN INTEGER, hdate IN DATE)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE val_kod = valkod AND dat = hdate;

      portinfo        c_port%ROWTYPE;
      accinfo         c_accounts%ROWTYPE;
      histinfo        c_history%ROWTYPE;
      reservinfo      c_reserves%ROWTYPE;
      archostinfo     c_archost%ROWTYPE;
      ostatinfo       c_ostat%ROWTYPE;
      creditid        INTEGER;
      debitid         INTEGER;
      custtype        INTEGER;
      filialid        INTEGER;
      valute          INTEGER;
      crdnum          VARCHAR2 (20);
      currrate        NUMBER;
      prevprrate      NUMBER;
      prevsecrate     NUMBER;
      primaryaccid    INTEGER;
      secondaccid     INTEGER;
      deltacurrrate   NUMBER(18,2);
      currate         NUMBER;
      tramt           NUMBER(18,2);
      currdate        DATE;
      prevdate        DATE;
      temptrid        INTEGER;
      PERCENT         INTEGER;
      duepercent      INTEGER;
      trdescription   VARCHAR2 (100);
      tempoblamt      NUMBER;
      tempobltrid     integer;
      tempaccdebt     number;
      tempacckred     number;
   BEGIN
      SELECT tek_dat, pred_dat
        INTO currdate, prevdate
        FROM sb_sysdat;

      OPEN c_port (p_creditid);
      FETCH c_port INTO portinfo;
      CLOSE c_port;
      
      custtype := portinfo.customertype;
      filialid := portinfo.branchid;
      valute := portinfo.currency;
      crdnum := portinfo.numberofcredit;
     
      if valute = 0 then 
         return;
      end if;
         
      OPEN c_ostat (valute, currdate);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;
      currate := ostatinfo.ostat;
      
      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accinfo;
      CLOSE c_accounts;
      
      primaryaccid := accinfo.primaryreserveaccid;
      secondaccid := accinfo.secondaryreserveaccid;
      
      OPEN c_archost (primaryaccid);
      FETCH c_archost INTO archostinfo;
      CLOSE c_archost;
      
    
      prevprrate := archostinfo.pok_ostat;
      
      OPEN c_archost (secondaccid);
      FETCH c_archost INTO archostinfo;
      CLOSE c_archost;
      
      OPEN c_history (p_creditid);
      FETCH c_history INTO histinfo;
      CLOSE c_history;
      
      OPEN c_reserves (histinfo.reserveid);
      FETCH c_reserves INTO reservinfo;
      CLOSE c_reserves;
       
      PERCENT := reservinfo.PERCENT;
      
      OPEN c_reserves (histinfo.duereserveid);
      FETCH c_reserves INTO reservinfo;
      CLOSE c_reserves;
    
      duepercent := reservinfo.PERCENT;
      prevsecrate := archostinfo.pok_ostat;
        
      /* First transaction added  */
      
      deltacurrrate :=   (histinfo.rest) * (PERCENT) * currate/100
                       - prevprrate;
--raise_application_error(-20003,'Error----'||deltacurrrate);
      
      IF deltacurrrate<>0 
      THEN
      IF histinfo.rest > 0
      THEN 
        
         IF deltacurrrate > 0
         THEN
            debitid :=
                  cm_utils.lnkreserveaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
            creditid := accinfo.primaryreserveaccid;
         ELSE
            debitid := accinfo.primaryreserveaccid;
            creditid :=
                  cm_utils.lnkreserveaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
         END IF;
   
         TrAmt := Round(Abs(deltacurrrate),2);
         tempaccdebt := debitid;
         tempacckred := creditid;
         -- raise_application_error(-20003,'Error----'||debitid);
         trdescription :=    'Кредит цзря ещтиййатын дяйишилмяси  №'
                          || portinfo.numberofcredit; --CM_UTILS.trDescReserveReduce();
         trdescription := REPLACE (
                             trdescription,
                             cm_decls.trdescnumber,
                             portinfo.numberofcredit
                          );
         trdescription := REPLACE (
                             trdescription,
                             cm_decls.trdescdate,
                             TO_CHAR (currdate, 'DD/MM/YYYY')
                          );--raise_application_error(-20003,'Error  --'||TrAmt); 
         temptrid :=
               cm_transactionmgr.sbaddtransaction (
                  p_trid=> NULL,
                  p_debitid=> debitid,
                  p_creditid=> creditid,
                  p_debitamount=> TrAmt,
                  p_creditamount=> TrAmt,
                  p_lamount=> TrAmt,
                  p_flags=> sb_decls.atfcommitimmediate,
                  p_operationtype=> cm_decls.cmtransactionoptype,
                  p_inbalancechar=> NULL,
                  p_transactiondate=> currdate,
                  p_trname=> trdescription
               );
       --  raise_application_error(-20003,'Error----Emetiyyatbitdi');      
      END IF;
      END IF;
      /* Second transaction added*/

      IF histinfo.duerest > 0
      THEN
         deltacurrrate :=
                   (histinfo.duerest) * (duepercent) * currate/100
                 - prevsecrate;
         IF deltacurrrate<>0 then                 

         IF deltacurrrate > 0
         THEN
            debitid :=
                  cm_utils.lnkDueReserveAccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
            creditid := accinfo.secondaryreserveaccid;
         ELSE
            debitid := accinfo.secondaryreserveaccid;
            creditid :=
                  cm_utils.lnkDueReserveAccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
         END IF;

         tramt := ROUND (ABS (deltacurrrate), 2);
         trdescription :=    'Кредит цзря ещтиййатын дяйишилмяси №'
                          || portinfo.numberofcredit; --CM_UTILS.trDescReserveReduce();
         trdescription := REPLACE (
                             trdescription,
                             cm_decls.trdescnumber,
                             portinfo.numberofcredit
                          );
         trdescription := REPLACE (
                             trdescription,
                             cm_decls.trdescdate,
                             TO_CHAR (currdate, 'DD/MM/YYYY')
                          );
         temptrid :=
               cm_transactionmgr.sbaddtransaction (
                  p_trid=> NULL,
                  p_debitid=> debitid,
                  p_creditid=> creditid,
                  p_debitamount=> tramt,
                  p_creditamount=> tramt,
                  p_lamount=> tramt,
                  p_flags=> sb_decls.atfcommitimmediate,
                  p_operationtype=> cm_decls.cmtransactionoptype,
                  p_inbalancechar=> NULL,
                  p_transactiondate=> currdate,
                  p_trname=> trdescription
               );
      END IF;         
      END IF;
      
      /* THREAD TRANSACTION ADDED */
      IF histinfo.obligation > 0
      THEN
      
         open c_archost(accinfo.crdlineoblaccid);
         fetch c_archost into archostinfo;
         close c_archost;
         
         tempoblamt := (histinfo.obligation) * (PERCENT) * currate / 100-archostinfo.pok_ostat;
         
         --raise_application_error(-20007,'Error chinarrrrrr'||tempoblamt);  
         if   tempoblamt<>0 then
         IF tempoblamt > 0
         THEN
            debitid :=
                  cm_utils.inkcrdlineoblaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
            creditid := accinfo.crdlineoblaccid;
            else 
            creditid := cm_utils.inkcrdlineoblaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
                debitid := accinfo.crdlineoblaccid;
            end if;      
                  
            trdescription :=
                    'Ющтялийин гиймятляндирилмяси № '
                 || portinfo.numberofcredit;
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescnumber,
                                portinfo.numberofcredit
                             ); -- TODO
            trdescription := REPLACE (
                                trdescription,
                                cm_decls.trdescdate,
                                TO_CHAR (currdate, 'DD/MM/YYYY')
                             );
            --  raise_application_error(-20003,debitid);
            if (tempoblamt>0) then
              /*creditid := tempaccdebt;
              debitid := tempacckred;
              tempoblamt := -tempoblamt;*/
            tempobltrid :=
                  cm_transactionmgr.sbaddtransaction (
                     p_trid=> NULL,
                     p_debitid=> debitid,
                     p_creditid=> creditid,
                     p_debitamount=> tempoblamt,
                     p_creditamount=> tempoblamt,
                     p_lamount=> tempoblamt,
                     p_flags=> sb_decls.atfcommitimmediate,
                     p_operationtype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL,
                     p_transactiondate=> currdate,
                     p_trname=> trdescription
                  );
            end if;
      end if;  
      END IF;
      
      commit work;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESERVE_COUNT_NEW

-- Start of DDL Script for Package CREDITSMGR.CM_RESERVE_REFRESH
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_reserve_refresh
IS
   PROCEDURE refreshreserve (p_creditid IN INTEGER);

   PROCEDURE finish_resfresh (p_id IN INTEGER);
  PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE,p_id in integer);
END;
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_reserve_refresh
IS
   PROCEDURE refreshreserve (p_creditid IN INTEGER)
   IS
      CURSOR c_port (p_id IN INTEGER)
      IS
         SELECT currency, numberofcredit, customertype, branchid
           FROM cm_portfolio
          WHERE id = p_id;

      CURSOR c_rest (p_id IN INTEGER)
      IS
         SELECT rest, duerest, reserveid, duereserveid, oldreseveid,
                oldduereseveid
           FROM cm_history
          WHERE creditid = p_id AND hdate = (SELECT tek_dat
                                               FROM sb_sysdat);

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid,
                oldprimaryreserveaccid, oldsecondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_currostat (p_id IN INTEGER)
      IS
         SELECT ostat
           FROM sb_temprate
          WHERE val_kod = p_id;

      CURSOR c_res (p_id IN INTEGER)
      IS
         SELECT PERCENT
           FROM cm_reserves
          WHERE id = p_id;

     /* CURSOR c_resid (p_id IN INTEGER)
      IS
         SELECT oldpraccid, newpraccid, oldsecaccid, newsecaccid, oldprresid,
                newprresid, oldsecresid, newsecresid
           FROM cm_reservid
          WHERE creditid = p_id;*/

      portinfo          c_port%ROWTYPE;
      accountinfo       c_account%ROWTYPE;
      restinfo          c_rest%ROWTYPE;
      currostat         c_currostat%ROWTYPE;
    --  resid             c_resid%ROWTYPE;
      resinfo           c_res%ROWTYPE;
      creditaccid       INTEGER;
      debitaccid        INTEGER;
      oldprrespersent   NUMBER;
      newprrespersent   NUMBER;
      reservedeltaamt   NUMBER;
      tramt             NUMBER;
      trdescription     VARCHAR2 (50);
      temptrid          NUMBER;
      currdat           DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      OPEN c_port (p_creditid);
      FETCH c_port INTO portinfo;
      CLOSE c_port;
      OPEN c_currostat (portinfo.currency);
      FETCH c_currostat INTO currostat;
      CLOSE c_currostat;
      OPEN c_rest (p_creditid);
      FETCH c_rest INTO restinfo;
      CLOSE c_rest;
      OPEN c_account (p_creditid);
      FETCH c_account INTO accountinfo;
      CLOSE c_account;

      IF restinfo.rest <> 0
      THEN --1
         /*OPEN c_resid (p_creditid);
         FETCH c_resid INTO resid;
         CLOSE c_resid;*/
         OPEN c_res (restinfo.oldreseveid);
         FETCH c_res INTO resinfo;
         CLOSE c_res;
         oldprrespersent := resinfo.PERCENT;
         OPEN c_res (restinfo.reserveid);
         FETCH c_res INTO resinfo;
         CLOSE c_res;
         newprrespersent := resinfo.PERCENT;

         IF      (accountinfo.primaryreserveaccid <>
                                           accountinfo.oldprimaryreserveaccid
                 )
             AND (accountinfo.oldprimaryreserveaccid IS NOT NULL)
             AND (restinfo.reserveid <> restinfo.oldreseveid)
         THEN --2
            /*---------First---------*/
            reservedeltaamt :=
                    cm_utils.calcpercent (
                       p_sum => restinfo.rest,
                       p_rate=> oldprrespersent,
                       p_coefficient=> 1,
                       p_delimmer=> 1
                    )
                  * currostat.ostat;
            creditaccid :=
                  cm_utils.lnkreserveaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
            debitaccid := accountinfo.oldprimaryreserveaccid;
            tramt := ROUND (ABS (reservedeltaamt), 2);
            trdescription :=
                          'Ещтийатын дяйишилмяси -'
                       || portinfo.numberofcredit;
            temptrid :=
                  cm_transactionmgr.cm_transactionadd (
                     p_trid=> NULL,
                     p_debitaccid=> debitaccid,
                     p_creditaccid=> creditaccid,
                     p_debitamount=> tramt,
                     p_creditamount=> tramt,
                     p_natamount=> tramt,
                     p_flags=> cm_decls.cmtrflaginbalance,
                     p_optype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL,
                     p_trdate=> currdat,
                     p_trdescription=> trdescription
                  );
            reservedeltaamt :=
                    cm_utils.calcpercent (
                       p_sum => restinfo.rest,
                       p_rate=> newprrespersent,
                       p_coefficient=> 1,
                       p_delimmer=> 1
                    )
                  * currostat.ostat;
            debitaccid :=
                  cm_utils.lnkreserveaccount (
                     p_custcategory=> portinfo.customertype,
                     p_crdcurrency=> portinfo.currency,
                     p_bankid=> portinfo.branchid
                  );
            creditaccid := accountinfo.primaryreserveaccid;
            tramt := ROUND (ABS (reservedeltaamt), 2);
            temptrid :=
                  cm_transactionmgr.cm_transactionadd (
                     p_trid=> NULL,
                     p_debitaccid=> debitaccid,
                     p_creditaccid=> creditaccid,
                     p_debitamount=> tramt,
                     p_creditamount=> tramt,
                     p_natamount=> tramt,
                     p_flags=> cm_decls.cmtrflaginbalance,
                     p_optype=> cm_decls.cmtransactionoptype,
                     p_inbalancechar=> NULL,
                     p_trdate=> currdat,
                     p_trdescription=> trdescription
                  );
         /*---------End First-----*/

         END IF; --2

         IF      (accountinfo.primaryreserveaccid =
                                            accountinfo.oldprimaryreserveaccid or
                                            accountinfo.oldprimaryreserveaccid is null )
             AND (restinfo.reserveid <> restinfo.oldreseveid)
         THEN --3
            reservedeltaamt :=
                    cm_utils.calcpercent (
                       p_sum => restinfo.rest,
                       p_rate=> (  oldprrespersent
                                 - newprrespersent
                                ),
                       p_coefficient=> 1,
                       p_delimmer=> 1
                    )
                  * currostat.ostat;

            IF reservedeltaamt <> 0
            THEN
               DBMS_OUTPUT.put_line ('d1 ');

               IF reservedeltaamt > 0
               THEN -- Rate Incrised
                  debitaccid :=
                        cm_utils.lnkreserveaccount (
                           p_custcategory=> portinfo.customertype,
                           p_crdcurrency=> portinfo.currency,
                           p_bankid=> portinfo.branchid
                        );
                  creditaccid := accountinfo.primaryreserveaccid;
               ELSE
                  debitaccid := accountinfo.primaryreserveaccid;
                  creditaccid :=
                        cm_utils.lnkreserveaccount (
                           p_custcategory=> portinfo.customertype,
                           p_crdcurrency=> portinfo.currency,
                           p_bankid=> portinfo.branchid
                        );
               END IF;

               tramt := ROUND (ABS (reservedeltaamt), 2);
               trdescription :=
                          'Ещтиййатын дяйишилмяси -'
                       || portinfo.numberofcredit;
               temptrid :=
                     cm_transactionmgr.cm_transactionadd (
                        p_trid=> NULL,
                        p_debitaccid=> debitaccid,
                        p_creditaccid=> creditaccid,
                        p_debitamount=> tramt,
                        p_creditamount=> tramt,
                        p_natamount=> tramt,
                        p_flags=> cm_decls.cmtrflaginbalance,
                        p_optype=> cm_decls.cmtransactionoptype,
                        p_inbalancechar=> NULL,
                        p_trdate=> currdat,
                        p_trdescription=> trdescription
                     );
            END IF;
         END IF; --3
      END IF; -- 1
   END;

   PROCEDURE finish_resfresh (p_id IN INTEGER)
   IS
   BEGIN
      UPDATE cm_accounts
         SET oldprimaryreserveaccid = primaryreserveaccid,
             oldsecondaryreserveaccid = secondaryreserveaccid
       WHERE creditid = p_id;

      UPDATE cm_history
         SET oldreseveid = reserveid,
             oldduereseveid = duereserveid
       WHERE creditid = p_id AND hdate = (SELECT tek_dat
                                            FROM sb_sysdat);
   END;

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE,p_id in integer)
   IS
   BEGIN
      IF defcommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions (0);
         finish_resfresh(p_id);
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESERVE_REFRESH

-- Start of DDL Script for Package CREDITSMGR.CM_RETURN_INT_OB
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_return_int_ob
IS
   PROCEDURE return_int (p_creditid IN INTEGER, p_tramount IN NUMBER);

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_return_int_ob
IS
   PROCEDURE return_int (p_creditid IN INTEGER, p_tramount IN NUMBER)
   IS
      CURSOR c_portfolio (p_id IN INTEGER)
      IS
         SELECT numberofcredit, currency, customertype, branchid
           FROM cm_active_credits
          WHERE id = p_id;

      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT interestaccid, outinterestaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_history (p_id IN INTEGER)
      IS
         SELECT rest, duerest, interestrest, dueinterestrest
           FROM cm_curr_state
          WHERE creditid = p_id;

      portinfo              c_portfolio%ROWTYPE;
      accountsinfo          c_accounts%ROWTYPE;
      histinfo              c_history%ROWTYPE;
      debitacc              INTEGER;
      creditacc             INTEGER;
      currinterestrest      NUMBER;
      curroutinterestrest   NUMBER;
      currencyid            INTEGER;
      custtype              INTEGER;
      filialid              INTEGER;
      crdno                 VARCHAR (25);
      trdescription         VARCHAR2 (255);
      trsamount             NUMBER;
      trinbid               INTEGER;
      trinoutbid            INTEGER;
      bankcurrdate          DATE;
   BEGIN
     
      OPEN c_portfolio (p_creditid);
      FETCH c_portfolio INTO portinfo;
      CLOSE c_portfolio;
     
      currencyid := portinfo.currency;
      custtype := portinfo.customertype;
      filialid := portinfo.branchid;
      crdno := portinfo.numberofcredit;
     
      OPEN c_accounts (p_creditid);
      FETCH c_accounts INTO accountsinfo;
      CLOSE c_accounts;
     
      OPEN c_history (p_creditid);
      FETCH c_history INTO histinfo;
      CLOSE c_history;

      SELECT tek_dat
        INTO bankcurrdate
        FROM sb_sysdat;

      trsamount :=   histinfo.interestrest
                   + histinfo.dueinterestrest;

      IF (p_tramount > trsamount)
      THEN
         cm_utils.processerror (0);
      END IF;

      debitacc :=
            cm_utils.inkoutinvinterestaccount (
               p_custcategory=> custtype,
               p_crdcurrency=> currencyid,
               p_bankid=> filialid
            );
      creditacc := accountsinfo.outinterestaccid;
      trdescription :=    crdno
                       || ' №-ли Б.К.Ф';
      trinoutbid :=
            cm_transactionmgr.cm_transactionadd (
               p_trid=> NULL,
               p_debitaccid=> debitacc,
               p_creditaccid=> creditacc,
               p_debitamount=> NULL,
               p_creditamount=> p_tramount,
               p_natamount=> NULL,
               p_flags=> cm_decls.cmtrflagoutbalance,
               p_optype=> cm_decls.cmtransactionoptype,
               p_inbalancechar=> NULL,
               p_trdate=> bankcurrdate,
               p_trdescription=> trdescription
            );
      --Now running transaction in balance.     

      debitacc := accountsinfo.interestaccid;
      creditacc := cm_utils.lnkinterestaccount (
                      p_custcategory=> custtype,
                      p_crdcurrency=> currencyid,
                      p_bankid=> filialid
                   );
      trdescription :=    crdno
                       || ' №-ли Б.Ф';
      trinbid :=
            cm_transactionmgr.cm_transactionadd (
               p_trid=> NULL,
               p_debitaccid=> debitacc,
               p_creditaccid=> creditacc,
               p_debitamount=> NULL,
               p_creditamount=> p_tramount,
               p_natamount=> NULL,
               p_flags=> cm_decls.cmtrflaginbalance,
               p_optype=> cm_decls.cmtransactionoptype,
               p_inbalancechar=> NULL,
               p_trdate=> bankcurrdate,
               p_trdescription=> trdescription
            );

      IF p_tramount = trsamount
      THEN
         INSERT INTO cm_return_int_outb
                     (creditid, trdate, trinbalanceid, trinoutbalanceid,
                      tramount)
              VALUES (p_creditid, bankcurrdate, trinbid, trinoutbid,
                      p_tramount);

         DELETE FROM cm_int_outbalance
               WHERE creditid = p_creditid;
      ELSE
         INSERT INTO cm_return_int_outb
                     (creditid, trdate, trinbalanceid, trinoutbalanceid,
                      tramount)
              VALUES (p_creditid, bankcurrdate, trinbid, trinoutbid,
                      p_tramount);
      END IF;

      UPDATE cm_curr_state
         SET interestrest =   interestrest
                            - p_tramount
       WHERE creditid = p_creditid;
   END;

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE)
   IS
   BEGIN
      IF defcommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions(1) ;
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RETURN_INT_OB

-- Start of DDL Script for Package CREDITSMGR.CM_SCHEDULE
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_schedule
  IS
  procedure PaymentSchedule_Delete(p_ID in Integer);
  function AnnutyPayment_Get(
             p_Amount in Number ,
             p_Rate in Number ,
             p_Periods in Integer ,
             p_PeriodRate in Integer
             )
  return Number;
  function EqualPartsPayment_Get(
             p_Amount in Number ,
             p_Rate in Number ,
             p_Periods in Integer ,
             p_PeriodRate in Integer
             )
  return Number;
  procedure TrSchedule_Add(p_id integer, p_date date, p_ammount integer);
  procedure TrSchedule_Edit(t_id integer, p_date date, p_ammount integer);
  procedure TrSchedule_Del(t_id integer);
  function  PaymentSchedule_AddEdit(
              p_ID in Integer ,  
              p_CreditID in Integer ,
              p_PayDate in Date ,
              p_Principial in Number ,
              p_Interest in Number,
              p_IpInterest in Number 
             )
  return Integer;
  procedure InsertEqualSchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_IpRate in Number,
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            );
  procedure InsertAnnutySchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_IpRate in Number,
             p_FirstPayDate in Date default null ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_schedule
IS

  
  
  function AnnutyPayment_Get(
             p_Amount in Number ,
             p_Rate in Number ,
             p_Periods in Integer ,
             p_PeriodRate in Integer
             )
  return Number           
  is
    
    Result Number(18,2);
    
  begin
  
    Result := p_Amount * 
              Power((1 + p_Rate/12/100),p_Periods)*
              p_Rate/12/100/(Power((1 + p_Rate/12/100), p_Periods)-1);
    
    return Result;
                  
  end;
  
  function EqualPartsPayment_Get(
             p_Amount in Number ,
             p_Rate in Number ,
             p_Periods in Integer ,
             p_PeriodRate in Integer
             )
  return Number           
  is
    Result Number(18,2);    
  begin
  
    Result := p_Amount / p_Periods;
    
    return Result;
                  
  end;
  
  procedure InsertAnnutySchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_IpRate in Number,
             p_FirstPayDate in Date default null ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            )
  is
    AnnutyPayment Number;
    IntrAmt Number;
    IpIntrAmt Number;
    PrincipialAmt Number;
    FullPayment Number := p_Amount;
    PayDate Date := p_FirstPayDate;
    DayCnt integer; 
    Temp Integer;
    SumPrincipalAmt number;
  begin
    
    AnnutyPayment := AnnutyPayment_Get(FullPayment,p_Rate,p_Periods,p_PeriodRate);
    
    if p_FirstPayDate is not null then
    DayCnt := CM_UTILS.BankDaysBetween(p_StartDate,p_FirstPayDate);
    
    IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,DayCnt);
    IpIntrAmt := CM_UTILS.CalcPercent(FullPayment,p_iprate,DayCnt);
   
    PrincipialAmt := AnnutyPayment - IntrAmt;
    Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt,IpIntrAmt);
    FullPayment := p_Amount - PrincipialAmt; 
    end if;
    
    for i in 2..p_Periods 
    loop
      IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,p_PeriodRate * 30);
      IpIntrAmt := CM_UTILS.CalcPercent(FullPayment,p_iprate,p_PeriodRate * 30);
      --IpIntrAmt := IntrAmt*p_iprate /p_rate;
      PrincipialAmt := AnnutyPayment - IntrAmt;
      PayDate := ADD_MONTHS(PayDate,1);
      Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt,IpIntrAmt);
      if FullPayment >= PrincipialAmt then 
        FullPayment := FullPayment - PrincipialAmt;
      else
        FullPayment := 0;
      end if;
             
    end loop;
      
    select sum(principal) into SumPrincipalAmt
       from cm_payment_schedule
       where  creditid = p_CreditID
       and paymentdate <(
       select max(paymentdate) 
         from cm_payment_schedule where creditid = p_CreditID);
         
    update cm_payment_schedule
    set principal = p_Amount - SumPrincipalAmt
    where  creditid = p_CreditID
    and paymentdate = (select max(paymentdate) 
         from cm_payment_schedule where creditid = p_CreditID);
                   
  end;          

  procedure InsertEqualSchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_IpRate in Number,
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            )
  is
    EqualPayment Number;
    IntrAmt Number;
    IpIntrAmt Number;
    PrincipialAmt Number;
    FullPayment Number := p_Amount;
    PayDate Date := p_FirstPayDate;
    DayCnt Integer; 
    Temp Integer;
    
  begin
    
    EqualPayment := EqualPartsPayment_Get(FullPayment,p_Rate,p_Periods,p_PeriodRate);
    
    DayCnt := CM_UTILS.BankDaysBetween(p_StartDate,p_FirstPayDate);
    
    IntrAmt := CM_UTILS.CalcPercent(p_Amount,p_Rate,DayCnt);
    IpIntrAmt := IntrAmt*p_iprate /p_rate;
    
    PrincipialAmt := EqualPayment;
    Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt,IpIntrAmt);
    FullPayment := p_Amount - EqualPayment; 
    
    for i in 2..p_Periods 
    loop
      IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,p_PeriodRate * 30);
      IpIntrAmt := IntrAmt*p_iprate /p_rate;
      
      PrincipialAmt := EqualPayment;
      PayDate := ADD_MONTHS(PayDate,1);
      Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt,IpIntrAmt);
      if FullPayment >= EqualPayment then 
        FullPayment := FullPayment - EqualPayment;
      else
        FullPayment := 0;
      end if;
             
    end loop;
         
  end;          
  
  function  PaymentSchedule_AddEdit(
              p_ID in Integer ,  
              p_CreditID in Integer ,
              p_PayDate in Date ,
              p_Principial in Number ,
              p_Interest in Number,
              p_IpInterest in Number 
             )
  return Integer              
  is
  
    Result Integer;
    
  begin
  
    update CM_PAYMENT_SCHEDULE
       set PAYMENTDATE = p_PayDate ,
           PRINCIPAL = p_Principial ,
           INTEREST = p_Interest ,
           IpInterest = p_IpInterest
     where ID = p_ID;
    
    if SQL%ROWCOUNT = 0 then
    
    insert into CM_PAYMENT_SCHEDULE(
      CREDITID , PAYMENTDATE , PRINCIPAL , INTEREST,IpInterest
    )
    values (
    p_CreditID ,p_PayDate ,p_Principial ,p_Interest,p_IpInterest
    ) returning ID into Result; 
    
    end if;
    
    --commit work;
           
    return Result;
    
  end;              
  
  procedure PaymentSchedule_Delete(p_ID in Integer)
  is
  begin
    delete from CM_PAYMENT_SCHEDULE where ID = p_ID;
    --commit work;
  end;
  
  
  procedure TrSchedule_Add(p_id integer, p_date date, p_ammount integer)
  is
  begin
    insert into cm_tranche_schedule (creditid, trchdate, trchamount)
         values (p_id, p_date, p_ammount);
  end;
  
  procedure TrSchedule_Edit(t_id integer, p_date date, p_ammount integer)
  is
  begin
    update cm_tranche_schedule
       set trchdate = p_date,
           trchamount = p_ammount
     where id = t_id;
  end;
  
  
  procedure TrSchedule_Del(t_id integer)
  is
  begin
    delete from cm_tranche_schedule
          where id = t_id;
  end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SCHEDULE

-- Start of DDL Script for Package CREDITSMGR.CM_SD
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_sd
IS
   PROCEDURE get_duerest (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_obligation (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_payments (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_rest (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   PROCEDURE get_tranches (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   );

   FUNCTION get_annint (crdid IN INTEGER)
      RETURN NUMBER;

   PROCEDURE results_sd (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      persontype   IN   INTEGER
   );

   PROCEDURE run_result (
      bdate    IN   DATE,
      edate    IN   DATE,
      n_val    IN   BOOLEAN DEFAULT FALSE,
      f_val    IN   BOOLEAN DEFAULT FALSE,
      fn_val   IN   BOOLEAN DEFAULT FALSE,
      natper   IN   BOOLEAN DEFAULT FALSE,
      legper   IN   BOOLEAN DEFAULT FALSE
   );

   FUNCTION get_ostat (p_id IN INTEGER, p_dat IN DATE)
      RETURN NUMBER;
  FUNCTION get_divzero (p IN NUMBER)
      RETURN NUMBER;
  function get_creditTranche(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditRest(p_creditid in integer,p_dat in date)
  return number;
  function get_creditPayment(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditBalance(p_Creditid in integer)
   return integer;
  FUNCTION get_period (p_id IN INTEGER,p_dat in date)
      RETURN VARCHAR2;
  function get_CreditCurrency(p_currency in integer)
 return varchar2;
  function get_creditprlngdat(p_creditid in integer)
return date;
  function get_creditExpires(p_creditid in integer,bdat in date,edat in date)
  return number;
  function Get_CreditDueRest(p_creditid in integer,p_dat in date)
  return number;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_sd
IS
   PROCEDURE get_rest (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_rest (
         p_dat          IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (rest) AS csrest,
                SUM (rest * get_annint (creditid)) AS carest
           FROM cm_history
          WHERE hdate = p_dat
            AND creditid IN (SELECT id
                               FROM cm_portfolio
                              WHERE currency = p_val_kod
                                AND personaltype = p_persontype
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) >= p_bper
                                    )
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) <= p_eper
                                    ));

      CURSOR c_ostat (v IN INTEGER, p_d IN DATE)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE val_kod = v AND dat = p_d;

      restinfo    c_rest%ROWTYPE;
      ostatinfo   c_ostat%ROWTYPE;
      srest       NUMBER;
      arest       NUMBER;
      prid        NUMBER;
      currostat   NUMBER;
   BEGIN
      OPEN c_ostat (val_kod, dat);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;
      OPEN c_rest (dat, val_kod, bper, eper, pername, persontype);
      FETCH c_rest INTO restinfo;
      CLOSE c_rest;
      srest := NVL (restinfo.csrest, 0) /** ostatinfo.ostat*/;
      arest := NVL (restinfo.carest, 0) /** ostatinfo.ostat*/;

      /* IF srest <> 0
       THEN
          arest := arest / srest;
       END IF;*/

      IF val_kod = 0
      THEN
         INSERT INTO cm_rests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, srest, arest, 0,
                      0, 0, 0);
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_rests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, srest,
                      arest, 0, 0);
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_rests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, 0,
                      0, srest, arest);
      END IF;
   END;

   PROCEDURE get_tranches (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_tr (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (
                   trancheamount * get_ostat (creditid, tranchedate)
                )
                      AS ctramt,
                SUM (
                     trancheamount
                   * get_annint (creditid)
                   * get_ostat (creditid, tranchedate)
                ) AS catr
           FROM cm_tranches
          WHERE tranchedate BETWEEN p_bdat AND p_edat
            AND creditid IN (SELECT id
                               FROM cm_portfolio
                              WHERE currency = p_val_kod
                                AND personaltype = p_persontype
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) >= p_bper
                                    )
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) <= p_eper
                                    ));

      trinfo   c_tr%ROWTYPE;
      tramt    NUMBER;
      atr      NUMBER;
      prid     NUMBER;
   BEGIN
      OPEN c_tr (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_tr INTO trinfo;
      CLOSE c_tr;
      tramt := NVL (trinfo.ctramt, 0);
      atr := NVL (trinfo.catr, 0);

      IF tramt <> 0
      THEN
         atr := atr / tramt;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_tranches_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, tramt, atr, 0,
                      0, 0, 0);
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_tranches_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, tramt,
                      atr, 0, 0);
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_tranches_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, 0,
                      0, tramt, atr);
      END IF;
   END;

   PROCEDURE get_payments (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_pay (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (
                   payedamt * get_ostat (creditid, paydate)
                ) AS cspay,
                SUM (
                     payedamt
                   * get_annint (creditid)
                   * get_ostat (creditid, paydate)
                ) AS capay
           FROM cm_payments
          WHERE paydate BETWEEN p_bdat AND p_edat
            AND creditid IN (SELECT id
                               FROM cm_portfolio
                              WHERE currency = p_val_kod
                                AND personaltype = p_persontype
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) >= p_bper
                                    )
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) <= p_eper
                                    ));

      payinfo   c_pay%ROWTYPE;
      spay      NUMBER;
      apay      NUMBER;
      prid      NUMBER;
   BEGIN
      OPEN c_pay (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_pay INTO payinfo;
      CLOSE c_pay;
      spay := NVL (payinfo.cspay, 0);
      apay := NVL (payinfo.capay, 0);

      IF spay <> 0
      THEN
         apay := apay / spay;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_payments_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, spay, apay, 0,
                      0, 0, 0);
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_payments_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, spay,
                      apay, 0, 0);
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_payments_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, 0,
                      0, spay, apay);
      END IF;
   END;

   PROCEDURE get_obligation (
      dat          IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_obl (
         p_dat          IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (obligation) AS csobl,
                SUM (
                   obligation * get_annint (creditid)
                ) AS caobl
           FROM cm_history
          WHERE hdate = p_dat
            AND creditid IN (SELECT id
                               FROM cm_portfolio
                              WHERE currency = p_val_kod
                                AND personaltype = p_persontype
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) >= p_bper
                                    )
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) <= p_eper
                                    ));

      CURSOR c_ostat (v IN INTEGER, p_d IN DATE)
      IS
         SELECT ostat
           FROM sb_operkurs
          WHERE val_kod = v AND dat = p_d;

      oblinfo     c_obl%ROWTYPE;
      ostatinfo   c_ostat%ROWTYPE;
      sobl        NUMBER;
      aobl        NUMBER;
      prid        NUMBER;
   BEGIN
      OPEN c_ostat (val_kod, dat);
      FETCH c_ostat INTO ostatinfo;
      CLOSE c_ostat;
      OPEN c_obl (dat, val_kod, bper, eper, pername, persontype);
      FETCH c_obl INTO oblinfo;
      CLOSE c_obl;
      sobl := NVL (oblinfo.csobl, 0) * ostatinfo.ostat;
      aobl := NVL (oblinfo.caobl, 0) * ostatinfo.ostat;

      IF sobl <> 0
      THEN
         aobl := aobl / sobl;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_obligations_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, sobl, aobl, 0,
                      0, 0, 0);
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_obligations_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, sobl,
                      aobl, 0, 0);
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_obligations_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, 0,
                      0, sobl, aobl);
      END IF;
   END;

   PROCEDURE get_duerest (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      bper         IN   NUMBER,
      eper         IN   NUMBER,
      pername      IN   VARCHAR2,
      perid        IN   NUMBER,
      persontype   IN   NUMBER
   )
   IS
      CURSOR c_duerest (
         p_bdat         IN   DATE,
         p_edat         IN   DATE,
         p_val_kod      IN   INTEGER,
         p_bper         IN   NUMBER,
         p_eper         IN   NUMBER,
         p_pername      IN   VARCHAR2,
         p_persontype   IN   NUMBER
      )
      IS
         SELECT SUM (
                   duerest * get_ostat (creditid, hdate)
                ) AS csduerest,
                SUM (
                   duerest * get_annint (creditid) * get_ostat (
                                                        creditid,
                                                        hdate
                                                     )
                ) AS caduerest
           FROM cm_history
          WHERE hdate BETWEEN p_bdat AND p_edat
            AND creditid IN (SELECT id
                               FROM cm_portfolio
                              WHERE currency = p_val_kod
                                AND personaltype = p_persontype
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) >= p_bper
                                    )
                                AND ((  duedatefirstcontract
                                      - dateofconclusion
                                     ) <= p_eper
                                    ));

      duerestinfo   c_duerest%ROWTYPE;
      sduerest      NUMBER;
      aduerest      NUMBER;
      prid          NUMBER;
   BEGIN
      OPEN c_duerest (bdat, edat, val_kod, bper, eper, pername, persontype);
      FETCH c_duerest INTO duerestinfo;
      CLOSE c_duerest;
      sduerest := NVL (duerestinfo.csduerest, 0);
      aduerest := NVL (duerestinfo.caduerest, 0);

      IF sduerest <> 0
      THEN
         aduerest := aduerest / sduerest;
      END IF;

      IF val_kod = 0
      THEN
         INSERT INTO cm_duerests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, sduerest, aduerest, 0,
                      0, 0, 0);
      END IF;

      IF val_kod = 1
      THEN
         INSERT INTO cm_duerests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, sduerest,
                      aduerest, 0, 0);
      END IF;

      IF val_kod = 48
      THEN
         INSERT INTO cm_duerests_sd
                     (id, dateofcredit, namount, navgintamount, famount,
                      favgintamount, fnamount, fnavgintamount)
              VALUES (perid, pername, 0, 0, 0,
                      0, sduerest, aduerest);
      END IF;
   END;

   PROCEDURE results_sd (
      bdat         IN   DATE,
      edat         IN   DATE,
      val_kod      IN   INTEGER,
      persontype   IN   INTEGER
   )
   IS
      CURSOR c_per
      IS
         SELECT id, NAME, bperiod, eperiod
           FROM cm_periods;
   BEGIN
      FOR per IN c_per
      LOOP
         get_rest (
            bdat,
            val_kod,
            per.bperiod,
            per.eperiod,
            per.NAME,
            per.id,
            persontype
         );
         get_tranches (
            bdat,
            edat,
            val_kod,
            per.bperiod,
            per.eperiod,
            per.NAME,
            per.id,
            persontype
         );
         get_payments (
            bdat,
            edat,
            val_kod,
            per.bperiod,
            per.eperiod,
            per.NAME,
            per.id,
            persontype
         );
         get_obligation (
            edat,
            val_kod,
            per.bperiod,
            per.eperiod,
            per.NAME,
            per.id,
            persontype
         );
         get_duerest (
            bdat,
            edat,
            val_kod,
            per.bperiod,
            per.eperiod,
            per.NAME,
            per.id,
            persontype
         );
      END LOOP;
   END;

   FUNCTION get_period (p_id IN INTEGER,p_dat in date)
      RETURN VARCHAR2
   IS
      cm       NUMBER;
      result   VARCHAR2 (56);

      CURSOR c_p
      IS
         SELECT bperiod, eperiod, NAME
           FROM cm_periods;
           
     Lastdat date;
           
   BEGIN
   
      SELECT (  nvl(get_creditprlngdat(id),duedatefirstcontract)
              - dateofconclusion
             )
        INTO cm
        FROM cm_portfolio
       WHERE id = p_id;

      FOR pr IN c_p
      LOOP
         IF  (cm >= pr.bperiod) AND (cm <= pr.eperiod)
         THEN
            result := pr.NAME;
            EXIT;
         END IF;
      END LOOP;

      RETURN result;
   END;

   FUNCTION get_annint (crdid IN INTEGER)
      RETURN NUMBER
   IS
      result   NUMBER;
   BEGIN
      SELECT annualyinterestrate
        INTO result
        FROM cm_portfolio
       WHERE id = crdid;

      RETURN result;
   END;

   PROCEDURE run_result (
      bdate    IN   DATE,
      edate    IN   DATE,
      n_val    IN   BOOLEAN DEFAULT FALSE,
      f_val    IN   BOOLEAN DEFAULT FALSE,
      fn_val   IN   BOOLEAN DEFAULT FALSE,
      natper   IN   BOOLEAN DEFAULT FALSE,
      legper   IN   BOOLEAN DEFAULT FALSE
   )
   IS
   BEGIN
      IF  n_val AND natper
      THEN
         results_sd (bdate, edate, 0, 1);
      END IF;

      IF  n_val AND legper
      THEN
         results_sd (bdate, edate, 0, 2);
      END IF;

      IF  f_val AND natper
      THEN
         results_sd (bdate, edate, 1, 1);
      END IF;

      IF  f_val AND legper
      THEN
         results_sd (bdate, edate, 1, 2);
      END IF;

      IF  fn_val AND natper
      THEN
         results_sd (bdate, edate, 48, 1);
      END IF;

      IF  fn_val AND legper
      THEN
         results_sd (bdate, edate, 48, 2);
      END IF;
   END;

   FUNCTION get_ostat (p_id IN INTEGER, p_dat IN DATE)
      RETURN NUMBER
   IS
      result   NUMBER;
   BEGIN
      SELECT ostat
        INTO result
        FROM sb_operkurs
       WHERE dat = (select max(dat) from sb_operkurs where dat <= p_dat)
         AND val_kod = (SELECT currency
                          FROM cm_portfolio
                         WHERE id = p_id);

      RETURN result;
   END;

   FUNCTION get_divzero (p IN NUMBER)
      RETURN NUMBER
   IS
      result   NUMBER;
   BEGIN
      IF p = 0
      THEN
         result := 1;
      END IF;

      IF p <> 0
      THEN
         result := p;
      END IF;

      RETURN result;
   END;
   
   function Get_CreditBalance(p_Creditid in integer)
   return integer
   is
   result integer;
   begin
     select bal_cn1 into result 
     from sb_account
     where id = (select contractaccid from cm_accounts
     where creditid = p_Creditid);
     return result;
   end;
   
  function Get_CreditRest(p_creditid in integer,p_dat in date)
  return number
  is
  result number;
  begin
    select rest*get_ostat(p_creditid,p_dat) into result
    from cm_history
    where creditid =p_creditid
    and hdate =(select max(hdate) from cm_history where hdate <= p_dat);
    return nvl(result,0);
  end;
  
  function Get_CreditDueRest(p_creditid in integer,p_dat in date)
  return number
  is
  result number;
  begin
    select duerest*get_ostat(p_creditid,p_dat) into result
    from cm_history
    where creditid =p_creditid
    and hdate =(select max(hdate) from cm_history where hdate <= p_dat);
    return nvl(result,0);
  end;


  function get_creditTranche(p_creditid in integer,bdat in date,edat in date)
  return number
  is
  result number;
    cursor c_tr is
    select sum(TRANCHEAMOUNT*get_ostat(p_creditid,TRANCHEDATE)) as Tramt
    from cm_tranches
    where creditid = p_creditid and
    TRANCHEDATE between bdat and edat;
    
  begin
     open c_tr;
     fetch c_tr into result;
     close c_tr;
     return nvl(result,0);
  end;
  
  
  function get_creditExpires(p_creditid in integer,bdat in date,edat in date)
  return number
  is
  result number;
    cursor c_tr is
    select sum(expamount*get_ostat(p_creditid,expdate)) as Tramt
    from cm_expires
    where creditid = p_creditid and
    expdate between bdat and edat;
    
  begin
     open c_tr;
     fetch c_tr into result;
     close c_tr;
     return nvl(result,0);
  end;

function get_creditprlngdat(p_creditid in integer)
return date
is
 result date;
 
 cursor c_pr is
 select max(newclosedate) as prdat
 from cm_prolongations
 where creditid = p_creditid;
  
begin
   open c_pr;
   fetch c_pr into result;
   close c_pr;
   return result;
   
end;
  
  
  function get_creditPayment(p_creditid in integer,bdat in date,edat in date)
  return number
  is
  result number;
    cursor c_tr is
    select sum(PAYEDAMT*get_ostat(p_creditid,PAYDATE)) as Tramt
    from cm_payments
    where creditid = p_creditid and
    PAYDATE between bdat and edat;
    
  begin
     open c_tr;
     fetch c_tr into result;
     close c_tr;
     return nvl(result,0);
  end;
 
 function get_CreditCurrency(p_currency in integer)
 return varchar2
 is
  result varchar2(5);
 begin
   select VAL_NAME into result
   from sb_avalute where valute = p_currency;
   return result;
 end;
   
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SD

-- Start of DDL Script for Package CREDITSMGR.CM_SETUP
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_setup
  IS
  procedure SetSetupIntValue(
    p_ID in Integer,
    p_NewValue in Integer
  );
  procedure SetVFList(
    p_ID in Integer,
    p_Visible in Integer,
    p_SeqNo in Integer,
    p_Frozen in Integer  
  );
  procedure CategoryLinks_Add(
     p_CategoryID in Integer      
     );
  procedure CreditType_Delete(
             p_ID in Integer 
            );
  procedure CategoriesAdd(v_person in integer, v_code in varchar2, v_description in varchar2);
  procedure CategoriesDelete(v_id in integer);
  procedure CategoriesEdit(v_id in integer,
                           v_person in integer, 
                           v_code in varchar2, 
                           v_description in varchar2);
  procedure UsrGroupAdd(v_description in varchar2);
  procedure UsrGroupDelete(v_id integer);
  procedure UsrGroupEdit(v_id in integer,v_description in varchar2);
  procedure CreditType_Edit(
             p_ID in Integer ,
             p_renewablestatus in Integer ,
             p_itype in Integer , 
             p_iclass in Integer ,
             p_CARDTYPE in integer, 
             p_description in Varchar2
            );
  procedure CreditType_Add(
             p_renewablestatus in Integer ,
             p_itype in Integer, 
             p_iclass in Integer, 
             p_CARDTYPE in integer,
             p_description in Varchar2
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_setup
IS

  procedure SetSetupIntValue(
    p_ID in Integer,
    p_NewValue in Integer
  )
  is
  begin
  
    update CM_REFERENCES
       set INTEGERVALUE = p_NewValue
     where ID = p_ID;
     
     commit work;
       
  end;
  
  procedure SetVFList(
    p_ID in Integer,
    p_Visible in Integer,
    p_SeqNo in Integer,
    p_Frozen in Integer  
  )
  is
  begin
    
    update CM_FIELDS_LIST
       set
           SeqNo = p_SeqNo ,
           Visible = p_Visible ,
           Frozen = p_Frozen
     where ID = p_ID;     
    
    commit work;
    
  end;
  
  
  procedure CategoryLinks_Add(
     p_CategoryID in Integer      
     )
  is
  begin
    insert into CM_Links(
    categoryid, link, description  
    ) 
    values(
    p_CategoryID,CM_DECLS.lnkInterestAccount,CM_DECLS.lnkInterestAccountTrans
    );
    
    insert into CM_Links(
    categoryid, link, description  
    ) 
    values(
    p_CategoryID,CM_DECLS.lnkReserveAccount,CM_DECLS.lnkReserveAccountTrans
    );
    
    insert into CM_Links(
    categoryid, link, description  
    ) 
    values(
    p_CategoryID,CM_DECLS.lnkDueReserveAccount,CM_DECLS.lnkDueReserveAccountTrans
    );

    insert into CM_Links(
    categoryid, link, description  
    ) 
    values(
    p_CategoryID,CM_DECLS.lnkOutInvObligationAccount,CM_DECLS.lnkOutInvObligationAccTrans
    );
    
    insert into CM_Links(
    categoryid, link, description  
    ) 
    values(
    p_CategoryID,CM_DECLS.lnkOutInvPledgeAccount,CM_DECLS.lnkOutInvPledgeAccTrans
    );
    
  end;  
  
  procedure CreditType_Add(
             p_renewablestatus in Integer ,
             p_itype in Integer, 
             p_iclass in Integer, 
             p_CARDTYPE in integer,
             p_description in Varchar2
            )
  is
  begin
  
    insert into CM_CREDITTYPES(
    renewablestatus, itype, iclass, description,CARDTYPE
    ) 
    values(
    p_renewablestatus, p_itype, p_iclass, p_description,p_CARDTYPE
    );
    
    commit work;
    
  end;           

  procedure CreditType_Edit(
             p_ID in Integer ,
             p_renewablestatus in Integer ,
             p_itype in Integer , 
             p_iclass in Integer ,
             p_CARDTYPE in integer, 
             p_description in Varchar2
            )
  is
  begin
  
    update CM_CREDITTYPES
       set
           renewablestatus = p_renewablestatus ,
           itype = p_itype , 
           iclass = p_iclass , 
           CARDTYPE = p_CARDTYPE,
           description = p_description
     where 
           ID = p_ID;     
    
    commit work;
    
  end;           

  procedure CreditType_Delete(
             p_ID in Integer 
            )
  is
  begin
  
    delete from CM_CREDITTYPES 
    where ID = p_ID;     
    
    commit work;
    
  end;           
   procedure UsrGroupAdd(v_description in varchar2) 
   is
   begin
      insert into CM_USERGROUPS(DESCRIPTION)
           values (v_description);
      commit;
   end; 
   
  procedure CategoriesAdd(v_person in integer, v_code in varchar2, v_description in varchar2)           
  is
  begin
    insert into CM_CATEGORIES(person,code,description)
         values (v_person, v_code, v_description);
    commit;
  end;   
       
  procedure UsrGroupEdit(v_id in integer,v_description in varchar2)
  is
  begin
    update CM_USERGROUPS 
    set description = v_description 
    where id = v_id;
    commit;
  end;    

  procedure UsrGroupDelete(v_id integer)   
  is
  begin
    delete from cm_UserGroups
    where id = v_id;
    commit;
  end;   
       
  procedure CategoriesEdit(v_id in integer,
                           v_person in integer, 
                           v_code in varchar2, 
                           v_description in varchar2)
  is
  begin
     update Cm_categories 
     set    person = v_person,
            code = v_code,
            description = v_description
     where id = v_id;
     commit;       
  end; 
  
  procedure CategoriesDelete(v_id in integer) 
  is
  begin
     delete from cm_categories 
     where id = v_id;
     commit;
  end;                        
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SETUP

-- Start of DDL Script for Package CREDITSMGR.CM_SYSTEM
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_system
  IS
  procedure MarkStateHistory(CurrentBankDate in Date);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_system
IS

  procedure MarkStateHistory(CurrentBankDate in Date)
  is    
  begin
   --  Marking Rest History
   
    update CM_HISTORY
       set
           PartitionKey = 2
     where
           PartitionKey = 1;
     
    update CM_HISTORY
       set
           PartitionKey = 1
     where
           PartitionKey = 0;
      
   insert into CM_HISTORY
   (creditid, hdate, lastcalcdate, stopcalcdate, rest, interestrest,
    duerest, dueinterestrest, reserveid, givenamount, obligation,
    pledgeprice, partitionkey
   )
   select creditid, CurrentBankDate , lastcalcdate, stopcalcdate, rest, interestrest,
       duerest, dueinterestrest, reserveid, givenamount, obligation,
       pledgeprice, 0 from CM_PREV_STATE;  
   
   -- Marking Interest History
   
    update CM_INTERESTS
       set
           PartitionKey = 2
     where
           PartitionKey = 1;
     
    update CM_INTERESTS
       set
           PartitionKey = 1
     where
           PartitionKey = 0;
    
    insert into CM_INTERESTS(partitionkey, creditid, hdate, interest, dueinterest, inttrid,
       dueinttrid, trprocessed, intprecision, dueintprecision
    ) 
    SELECT 0, creditid, CurrentBankDate, 0, 0, null,
       null, 0, intprecision, dueintprecision
    FROM CM_INT_PREVSTATE;       
           
  end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SYSTEM

-- Start of DDL Script for Package CREDITSMGR.CM_TRANCHE
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_tranche
 IS


  procedure Tranche_Add(
             p_CreditID  in Integer ,
             p_TrchDate  in DATE ,
             p_CustAccID in Integer ,
             p_TrchAmount in NUMBER ,
             p_ProcessTransactions Boolean default True            
            );
  procedure CommitTranche(
            DoCommit in Boolean default True
  );
  procedure Tranche_Delete(
            p_TrancheID in Integer 
            );
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_tranche
IS

  procedure Tranche_Add(
             p_CreditID  in Integer ,
             p_TrchDate  in DATE ,
             p_CustAccID in Integer ,
             p_TrchAmount in NUMBER ,
             p_ProcessTransactions Boolean default True            
            )
  is
    
  cursor c_PortfolioInfo(CrdID in Integer) is
  select CURRENCY , 
         INITIALAMOUNT , 
         CREDITLINEAMOUNT , 
         DATEOFCONCLUSION ,
         DATEOFGRANT ,
         NUMBEROFCREDIT ,
         CUSTOMERTYPE ,
         CREDITTYPE ,
         BRANCHID
    from CM_ACTIVE_CREDITS     
   where ID = CrdID;       
  
  cursor c_archost(p_id in integer)
  is
  select pok_ostat from sb_tenostat where acc_id = p_id;
   
  
  cursor c_HistoryInfo(CrdID in Integer) is
  select LASTCALCDATE ,
         REST ,
         RESERVEID ,
         GIVENAMOUNT ,
         OBLIGATION 
    from CM_CURR_STATE
   where CREDITID = CrdID;
  
  cursor c_Rates(CurrencyID in Integer) is
  select OSTAT
    from SB_TEMPRATE
   where VAL_KOD=CurrencyID;        
  
  cursor c_ReserveRate(p_ID in Integer) is
  select PERCENT
    from CM_RESERVES
   where ID = p_ID; 
  
  cursor c_Accounts(CrdID in Integer) is
  select LOANACCID ,
         PRIMARYRESERVEACCID ,
         OUTGUARANTEEACCID ,
         CrdLineOblaccID
    from CM_ACCOUNTS
   where CreditID = CrdID;    
   
   cursor c_CreditType(P_ID in integer)
   is
   select DESCRIPTION from cm_credittypes
   where id = P_ID;   
  
  PortfInfo c_PortfolioInfo%rowtype;
  HistInfo c_HistoryInfo%rowtype;
  Rates c_Rates%rowtype; 
  CrdAccs c_Accounts%rowtype;
  ReserveRate c_ReserveRate%rowtype;
  archostinfo c_archost%rowtype;
  CrdInfo c_CreditType%rowtype;
  
   
  DebitAcc Integer;
  CreditAcc Integer;
  crd integer;
  
  FirstTranche Boolean;
  Dummy Integer := CM_UTILS.UseLeft;
  TrAmount Number(18,2) := 0;
  Temp Number;
  
  ResultTrancheTrID Integer;
  ResultReserveTrID Integer;
  ResultObligationOutTrID Integer;
  TempObl number;
  ResultCrdLineOblTrID integer;
  
  TrDescription Varchar2(255);  
  begin
  
    if ( p_TrchAmount <= 0 ) then 
      CM_UTILS.ProcessError(CM_DECLS.EZeroTrancheNotSupported);
    end if;      
  
    open c_PortfolioInfo(p_CreditID);
    fetch c_PortfolioInfo into PortfInfo;
    close c_PortfolioInfo;
    
    open c_HistoryInfo(p_CreditID);
    fetch c_HistoryInfo into HistInfo;
    close c_HistoryInfo;
    
    FirstTranche := PortfInfo.INITIALAMOUNT = 0;    
    
    if ( p_TrchAmount > HistInfo.OBLIGATION )  then 
      CM_UTILS.ProcessError(CM_DECLS.EOutOfObligation);
    end if;
   
    if FirstTranche then
    
      update CM_ACTIVE_CREDITS 
         set 
             INITIALAMOUNT = p_TrchAmount ,
             DATEOFGRANT = p_TrchDate
       where ID = p_CreditID;
              
      update CM_CURR_STATE
         set
             Rest = Rest + p_TrchAmount ,
             OBLIGATION = OBLIGATION - p_TrchAmount ,
             GIVENAMOUNT = GIVENAMOUNT + p_TrchAmount 
       where CreditID = p_CreditID;
             
    else             
              
      update CM_CURR_STATE
         set
             Rest = Rest + p_TrchAmount ,
             OBLIGATION = OBLIGATION - p_TrchAmount ,
             GIVENAMOUNT = GIVENAMOUNT + p_TrchAmount 
       where CreditID = p_CreditID;
               
    end if;
    
    if p_ProcessTransactions then -- Processing Tranche Transactions
      
     open c_Accounts(p_CreditID);
     fetch c_Accounts into CrdAccs; 
     close c_Accounts;
      
      -- Adding Main Tranche Transaction to temporary table
      
     DebitAcc := CrdAccs.LOANACCID;
     CreditAcc := p_CustAccID;
      
     TrAmount := p_TrchAmount;
     TrDescription := CM_UTILS.trDescTranche();
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_TrchDate,'DD/MM/YYYY'));
     
     
      
     ResultTrancheTrID := 
      CM_TRANSACTIONMGR.CM_TransactionAdd(
         p_trid => null ,
         p_debitaccid => DebitAcc ,
         p_creditaccid => CreditAcc ,
         p_debitamount => TrAmount ,
         p_creditamount => null ,
         p_natamount => null ,
         p_flags => CM_DECLS.cmTrFlagInBalance ,
         p_optype => CM_DECLS.cmTransactionOpType ,
         p_inbalancechar => null ,
         p_trdate => p_TrchDate ,
         p_trdescription => TrDescription
         );
         
     -- Now main transaction added
     
     -- Calculating reserve and adding reserve transaction  
      
     if CM_UTILS.CreditReservecontEnabled(
          p_CreditTypeID => PortfInfo.CREDITTYPE
          ) = 1 then
          
     open c_ReserveRate(HistInfo.ReserveID);
     fetch c_ReserveRate into ReserveRate;
     close c_ReserveRate;
     
     if ReserveRate.PERCENT > 0 then
     
     Temp := 
      CM_UTILS.CalcPercent(
         p_sum => p_TrchAmount ,
         p_rate => ReserveRate.PERCENT ,
         p_coefficient => 1 ,
         p_delimmer => 1
         );

     open c_Rates(PortfInfo.CURRENCY);
     fetch c_Rates into Rates;
     close c_Rates;
     
     DebitAcc := 
      CM_UTILS.lnkreserveaccount(
         p_custcategory => PortfInfo.CUSTOMERTYPE ,
         p_crdcurrency => PortfInfo.CURRENCY ,
         p_bankid => PortfInfo.BRANCHID
         );
     
    
     if DebitAcc is null then
       CM_UTILS.ProcessError(CM_DECLS.EInvokeAccountNotFound); 
     end if;

     open c_archost(CrdAccs.PRIMARYRESERVEACCID);
     fetch c_archost into archostinfo;
     close c_archost;
         
     CreditAcc := CrdAccs.PRIMARYRESERVEACCID;
     TrAmount := /*archostinfo.pok_ostat
                - */Round(Rates.OSTAT * Temp , 2);
     
     TrDescription := CM_UTILS.trDescReserveIncrease();
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_TrchDate,'DD/MM/YYYY'));
     
     
     if TrAmount <>0  then  
     ResultReserveTrID := 
      CM_TRANSACTIONMGR.CM_TransactionAdd(
         p_trid => null ,
         p_debitaccid => DebitAcc ,
         p_creditaccid => CreditAcc ,
         p_debitamount => TrAmount ,
         p_creditamount => null ,
         p_natamount => null ,
         p_flags => CM_DECLS.cmTrFlagInBalance ,
         p_optype => CM_DECLS.cmTransactionOpType ,
         p_inbalancechar => null ,
         p_trdate => p_TrchDate ,
         p_trdescription => TrDescription
         );
     end if;
     end if;
         
     end if;    
     -- Now Reserve transaction processed
     
     -- Processing Out Balance Transaction for reduce obligation
     
     if CM_UTILS.ReduceObligationOnTranch = 1 then
       CreditAcc := 
        CM_UTILS.lnkOutInvObligationAccount(
           p_custcategory => PortfInfo.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfo.CURRENCY ,
           p_bankid => PortfInfo.BRANCHID
          );
          
       if DebitAcc is null then
         CM_UTILS.ProcessError(CM_DECLS.EInvokeAccountNotFound);-- Change  
       end if;
                
       DebitAcc := CrdAccs.OUTGUARANTEEACCID;
       TrAmount := p_TrchAmount;
       
       TrDescription := CM_UTILS.trDescObligationReduce();
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_TrchDate,'DD/MM/YYYY'));
           
       ResultObligationOutTrID := 
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAcc ,
           p_creditaccid => CreditAcc ,
           p_debitamount => TrAmount ,
           p_creditamount => null ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlagOutBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_TrchDate ,
           p_trdescription => TrDescription 
          );
          
    end if; -- // Reduce Obligation  
     
    -- At last this shit processed too ........
       
    end if; -- Process Transactions
    
     -- Processing  Balance Transaction for reduce obligation
     
        open c_HistoryInfo(p_CreditID);
        fetch c_HistoryInfo into HistInfo;
        close c_HistoryInfo;
        
        open c_archost(CrdAccs.CrdLineOblAccID);
        fetch c_archost into archostinfo;
        close c_archost;
        
        open c_creditType(portfinfo.credittype);
        fetch c_creditType into Crdinfo;
        close c_creditType;
        
      if Crdinfo.description = 'Кредит хятти бярпаолунан' then  
     TempObl := 
         /*archostinfo.pok_ostat- */
         CM_UTILS.CalcPercent(
         p_sum => p_TrchAmount ,
         p_rate => ReserveRate.PERCENT ,
         p_coefficient => 1 ,
         p_delimmer => 1
         )*rates.ostat ;
        
     if   TempObl>0 then  
       creditacc := 
        CM_UTILS.InkCrdlineOblAccount(
           p_custcategory => PortfInfo.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfo.CURRENCY ,
           p_bankid => PortfInfo.BRANCHID
          );
              
        debitacc := CrdAccs.CrdLineOblAccID;
        
       TrDescription := 'Ющтялийин гиймятляндирилмяси № '|| PortfInfo.numberofcredit/*CM_UTILS.trDescObligationReduce()*/;
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_TrchDate,'DD/MM/YYYY'));
        
        ResultCrdLineOblTrID :=
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAcc ,
           p_creditaccid => CreditAcc ,
           p_debitamount => TempObl ,
           p_creditamount => null ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlaginBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_TrchDate ,
           p_trdescription => TrDescription 
          );
       end if;
      end if;
    -- At last this shit processed too ........
    
       
    -- Now Saving Tranche..... 
    
    insert into CM_TRANCHES(
      creditid , tranchedate , trancheamount ,  
      tranchetrid , reservetrid , obligationouttrid,CrdLineOblTrID
    )  
    values(
      p_CreditID , p_TrchDate , p_TrchAmount , 
      ResultTrancheTrID , ResultReserveTrID , ResultObligationOutTrID,ResultCrdLineOblTrID
    );    
    
  end;          
  
  
  procedure CommitTranche(
            DoCommit in Boolean default True
  )
  is
  begin
    if  DoCommit  then
      CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(1);
      commit work;
    else
      rollback work;
    end if;
  end;
  
  procedure Tranche_Delete(
            p_TrancheID in Integer 
            )
  is
  
    cursor c_Tranche(TrnchID in Integer) is
    select CREDITID ,
           TRANCHEDATE ,
           TRANCHEAMOUNT ,
           TRANCHETRID ,
           RESERVETRID ,
           OBLIGATIONOUTTRID,
           CRDLINEOBLTRID
      from CM_TRANCHES
     where ID = TrnchID;
     
     cursor c_CreditState(CrdID in Integer)
     is
     select GIVENAMOUNT
       from CM_CURR_STATE
      where CreditID = CrdID; 
     
     Tranche c_Tranche%rowtype;
     
     ACreditID Integer;
     TrchDate Date;
     TrchAmt Number;
     TrchTrID Integer;
     ResTrID Integer;
     OblTrID Integer;
     
     CreditState c_CreditState%rowtype;
     GivenAmt Number;
     
     CurrentBankDate Date; 
  begin
    open c_Tranche(p_TrancheID);
    fetch c_Tranche into Tranche;
    ACreditID := Tranche.CREDITID;
    TrchDate := Tranche.TRANCHEDATE;
    TrchAmt := Tranche.TRANCHEAMOUNT;
    TrchTrID := Tranche.TRANCHETRID;
    ResTrID := Tranche.RESERVETRID;
    OblTrID := Tranche.OBLIGATIONOUTTRID;
    close c_Tranche;
    
    select TEK_DAT 
      into CurrentBankDate
      from SB_SYSDAT;
    
    if CurrentBankDate <> TrchDate then
      CM_UTILS.ProcessError(0); --TODO
    end if;
    
    if (TrchTrID is not null) then
    if CM_TRANSACTIONMGR.TransactionExist(TrchTrID) then
      TrchTrID := CM_TRANSACTIONMGR.SBDeleteTransaction(TrchTrID);
    end if;
    end if;
    
    if (ResTrID is not null) then
    if CM_TRANSACTIONMGR.TransactionExist(ResTrID) then
      ResTrID := CM_TRANSACTIONMGR.SBDeleteTransaction(ResTrID);
    end if;
    end if;
        
    if (OblTrID is not null) then
    if CM_TRANSACTIONMGR.TransactionExist(OblTrID,False) then
      OblTrID := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(OblTrID);
    end if;
    end if;    
    
    if (Tranche.CrdLineOblTrID is not null) then
    if CM_TRANSACTIONMGR.TransactionExist(Tranche.CrdLineOblTrID,true) then
      OblTrID := CM_TRANSACTIONMGR.SBDeleteTransaction(Tranche.CrdLineOblTrID);
    end if;
    end if;    

    open c_CreditState(ACreditID);
    fetch c_CreditState into CreditState;
    GivenAmt := CreditState.GIVENAMOUNT;
    close c_CreditState; 
    
    if TrchAmt = GivenAmt then --if deleted tranche is first tranche
    
      update CM_ACTIVE_CREDITS
         set INITIALAMOUNT = 0 ,
             DATEOFGRANT = null
       where ID = ACreditID;
       
    end if;
    
   update CM_CURR_STATE
     set GIVENAMOUNT = GIVENAMOUNT - TrchAmt ,
         OBLIGATION = OBLIGATION + TrchAmt ,
         REST = REST - TrchAmt
   where CreditID = ACreditID;
  
   delete from CM_TRANCHES where ID = p_TrancheID;
   
   commit work;
        
  end;          
  
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_TRANCHE

-- Start of DDL Script for Package CREDITSMGR.CM_TRANSACTIONMGR
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_transactionmgr
  IS
  function SBDeleteTransaction(
           p_TrID in Integer 
           )
  return Integer;
  function SBAddTransaction(
            p_TrID            IN INTEGER DEFAULT NULL ,
            p_DebitID         IN INTEGER ,
            p_CreditID        IN INTEGER ,
            p_DebitAmount     IN NUMBER ,
            p_CreditAmount    IN NUMBER ,
            p_LAmount         IN NUMBER ,
            p_TrName          IN VARCHAR2 ,
            p_Flags           IN INTEGER ,
            p_TransactionDate IN DATE ,
            p_OperationType   IN INTEGER ,
            p_InBalanceChar   IN INTEGER 
            )
   return Integer;
  function TransactionExist(
              p_TrID in Integer,
              p_SBLink in Boolean default True
              )
   return Boolean;
  procedure CM_CommitDelayedTransactions(p_id in integer);
  function CM_TransactionAdd(
            p_TRID          IN INTEGER DEFAULT NULL,
            p_DEBITACCID    IN INTEGER ,
            p_CREDITACCID   IN INTEGER ,
            p_DEBITAMOUNT   IN NUMBER ,
            p_CREDITAMOUNT  IN NUMBER ,
            p_NATAMOUNT     IN NUMBER DEFAULT NULL ,
            p_FLAGS         IN INTEGER , -- No SBTransacion Flags  !!!!!
            p_OPTYPE        IN INTEGER DEFAULT NULL ,
            p_INBALANCECHAR IN INTEGER ,
            p_TRDATE        IN DATE ,
            p_TRDESCRIPTION IN VARCHAR2, 
            p_out_TransactionType in boolean default False /* True - Is OutTransactions*/)
   return INTEGER;
  function SBOUTAddTransaction(
            p_TrID            IN INTEGER DEFAULT NULL ,
            p_DebitID         IN INTEGER ,
            p_CreditID        IN INTEGER ,
            p_DebitAmount     IN NUMBER ,
            p_CreditAmount    IN NUMBER ,
            p_LAmount         IN NUMBER ,
            p_TrName          IN VARCHAR2 ,
            p_Flags           IN INTEGER ,
            p_TransactionDate IN DATE ,
            p_OperationType   IN INTEGER ,
            p_InBalanceChar   IN INTEGER 
            )
   return Integer;
  function SBOUTDeleteTransaction(
            p_TrID in Integer 
            )
   return Integer;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_transactionmgr
 IS
 
   function CM_TransactionAdd(
            p_TRID          IN INTEGER DEFAULT NULL,
            p_DEBITACCID    IN INTEGER ,
            p_CREDITACCID   IN INTEGER ,
            p_DEBITAMOUNT   IN NUMBER ,
            p_CREDITAMOUNT  IN NUMBER ,
            p_NATAMOUNT     IN NUMBER DEFAULT NULL ,
            p_FLAGS         IN INTEGER , -- No SBTransacion Flags  !!!!!
            p_OPTYPE        IN INTEGER DEFAULT NULL ,
            p_INBALANCECHAR IN INTEGER ,
            p_TRDATE        IN DATE ,
            p_TRDESCRIPTION IN VARCHAR2, 
            p_out_TransactionType in boolean default False /* True - Is OutTransactions*/)
   return INTEGER
   is 
   Result Integer;
   Temp Integer;
   begin
   
    
     if p_TRID is NULL then
     
     if p_Flags = CM_DECLS.cmTrFlagInBalance then
     
       select SB_TR_SEG_PROVARCH.nextval
   			into Temp
   			from dual;
        
    else
     
       select SBOUT_TR_SEG_PROVARCH.nextval
   			into Temp
   			from dual; 
            
     end if;
        
     else
     
       Temp := p_TrID;
       
     end if;      
     
     insert into CM_TRANSACTIONS(
     TRID , DEBITACCID , CREDITACCID , DEBITAMOUNT , CREDITAMOUNT , NATAMOUNT ,
     FLAGS , OPTYPE , INBALANCECHAR , TRDATE , TRDESCRIPTION     
     )
     values(
     Temp , p_DEBITACCID , p_CREDITACCID , p_DEBITAMOUNT , p_CREDITAMOUNT , 
     p_NATAMOUNT ,p_FLAGS , p_OPTYPE , p_INBALANCECHAR , p_TRDATE , p_TRDESCRIPTION     
     ) returning TRID into Result;
     

       
     return Result; 
   end;
   
   function SBAddTransaction(
            p_TrID            IN INTEGER DEFAULT NULL ,
            p_DebitID         IN INTEGER ,
            p_CreditID        IN INTEGER ,
            p_DebitAmount     IN NUMBER ,
            p_CreditAmount    IN NUMBER ,
            p_LAmount         IN NUMBER ,
            p_TrName          IN VARCHAR2 ,
            p_Flags           IN INTEGER ,
            p_TransactionDate IN DATE ,
            p_OperationType   IN INTEGER ,
            p_InBalanceChar   IN INTEGER 
            )
   return Integer
   is
   Result Integer;
   begin
     Result :=
     SB_TRANSACTION.Transaction_Add(
                     TransactionID  => p_TrID ,
                     DebitID        => p_DebitID , 
                     CreditID       => p_CreditID ,
                     DebitAmount    => p_DebitAmount , 
                     CreditAmount   => p_CreditAmount ,
                     LAmount        => p_LAmount ,
                     DebitRate      => 0 ,
                     CreditRate     => 0 ,
                     TrName         => p_TrName , 
                     Flags          => p_Flags ,
                     TransactionDate => p_TransactionDate , 
                     InBalanceChar  => p_InBalanceChar ,
                     OperationType  => p_OperationType 
                    );
     return Result;
   end;
              
  function SBOUTAddTransaction(
            p_TrID            IN INTEGER DEFAULT NULL ,
            p_DebitID         IN INTEGER ,
            p_CreditID        IN INTEGER ,
            p_DebitAmount     IN NUMBER ,
            p_CreditAmount    IN NUMBER ,
            p_LAmount         IN NUMBER ,
            p_TrName          IN VARCHAR2 ,
            p_Flags           IN INTEGER ,
            p_TransactionDate IN DATE ,
            p_OperationType   IN INTEGER ,
            p_InBalanceChar   IN INTEGER 
            )
   return Integer
   is
   Result Integer;
   begin
     Result :=
     SBOUT_TRANSACTION.Transaction_Add(
                       TransactionID  => p_TrID ,
                       DebitID        => p_DebitID , 
                       CreditID       => p_CreditID ,
                       DebitAmount    => p_DebitAmount , 
                       CreditAmount   => p_CreditAmount ,
                       LAmount        => p_LAmount ,
                       DebitRate      => 0 ,
                       CreditRate     => 0 ,
                       TrName         => p_TrName , 
                       Flags          => p_Flags ,
                       TransactionDate => p_TransactionDate , 
                       InBalanceChar  => p_InBalanceChar ,
                       OperationType  => p_OperationType 
                      );
     return Result;
   end;           
   
   function SBDeleteTransaction(
            p_TrID in Integer 
            )
   return Integer
   is
   begin
     SB_TRANSACTION.Transaction_Delete(p_TrID);
     return p_TrID;
   end;         
 
  function SBOUTDeleteTransaction(
            p_TrID in Integer 
            )
   return Integer
   is
   begin
     SBOUT_TRANSACTION.Transaction_Delete(p_TrID , 0);
     return p_TrID;
   end;         
   
   procedure CM_CommitDelayedTransactions(p_id in integer default null)
   is
     
     cursor c_DelayedTransactions is
     select trid, debitaccid, creditaccid, debitamount, creditamount,
        natamount, flags, optype, inbalancechar, trdate, trdescription
       from CM_TRANSACTIONS;
     
     cursor c_DefCommitFlag
     is
     select 
       integervalue
     from cm_references
     where iname = 'TrCtrlShowDelayedTransactions';
     
       
       
     Transaction c_DelayedTransactions%rowtype;
    DefCommitFlag c_DefCommitFlag%rowtype;
     
     CommitFlag integer;
     Result Integer;    
   begin
   
     open c_DefCommitFlag;
     fetch c_DefCommitFlag into DefCommitFlag;
     close c_DefCommitFlag;
     
     if DefCommitFlag.integervalue = 1 then
        CommitFlag := CM_DECLS.atfCommitImmediate;
        else CommitFlag := CM_DECLS.atfTemporary;
     end if;
        
     for Transaction in c_DelayedTransactions
     loop
     
       if Transaction.Flags = CM_DECLS.cmTrFlagInBalance then
       Result :=
          SBAddTransaction(
            p_TrID => Transaction.TrID ,
            p_DebitID => Transaction.DebitAccID ,
            p_CreditID => Transaction.CreditAccID ,
            p_DebitAmount => Transaction.DebitAmount ,
            p_CreditAmount => Transaction.CreditAmount ,
            p_LAmount => Transaction.NatAmount ,
            p_TrName => Transaction.TrDescription ,
            p_Flags => 8/*CommitFlag*/ ,
            p_TransactionDate => Transaction.TrDate ,
            p_OperationType => Transaction.OpType ,
            p_InBalanceChar => Transaction.Inbalancechar 
       );
       else
       Result :=
          SBOUTAddTransaction(
            p_TrID => Transaction.TrID ,
            p_DebitID => Transaction.DebitAccID ,
            p_CreditID => Transaction.CreditAccID ,
            p_DebitAmount => Transaction.DebitAmount ,
            p_CreditAmount => Transaction.CreditAmount ,
            p_LAmount => Transaction.NatAmount ,
            p_TrName => Transaction.TrDescription ,
            p_Flags => 8/*CommitFlag */,
            p_TransactionDate => Transaction.TrDate ,
            p_OperationType => Transaction.OpType ,
            p_InBalanceChar => Transaction.Inbalancechar 
       );
       end if;
       
     end loop;
   end;
   
   function TransactionExist(
              p_TrID in Integer,
              p_SBLink in Boolean default True
              )
   return Boolean               
   is
     cursor c_SB_Transactions(TrID in Integer) is
     select ID
       from SB_PROVARCH
      where ID = TrID;

     cursor c_sb_LazyTransactions(TrID in integer) is
     select ID
       from sb_lazytransaction
     where ID = TrID; 
        
     cursor c_SBOUT_Transactions(TrID in Integer) is
     select ID
       from SBOUT_PROVARCH
      where ID = TrID;

     cursor c_sbout_LazyTransactions(TrID in integer) is
     select ID
       from sbout_lazytransaction
     where ID = TrID; 
     
     TempRec c_SB_Transactions%rowtype;
     OpRec c_sb_LazyTransactions%rowtype;
     
     Result Boolean ;      
   begin
     if p_SBLink then
     
       open c_sb_LazyTransactions(p_TrID);
       fetch c_sb_LazyTransactions into OpRec;
             
       open c_SB_Transactions(p_TrID);
       fetch c_SB_Transactions into TempRec;
         Result := (c_SB_Transactions%found)or(c_sb_LazyTransactions%found);
       close c_SB_Transactions; 
       close c_sb_LazyTransactions;
        
     else

       open c_sbout_LazyTransactions(p_TrID);
       fetch c_sbout_LazyTransactions into OpRec;
     
       open c_SBOUT_Transactions(p_TrID);
       fetch c_SBOUT_Transactions into TempRec;
         Result := (c_SBOUT_Transactions%found)or(c_sbout_LazyTransactions%found);
       close c_SBOUT_Transactions; 
       close c_sbout_LazyTransactions;     
     end if;
     
     return Result;
      
   end;            
              
 END;
/


-- End of DDL Script for Package CREDITSMGR.CM_TRANSACTIONMGR

-- Start of DDL Script for Package CREDITSMGR.CM_UTILS
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_utils
IS
   FUNCTION useleft
      RETURN INTEGER;

   FUNCTION reduceobligationontranch
      RETURN INTEGER;

   FUNCTION bankyeardays
      RETURN INTEGER;

   FUNCTION trdescinterestrecalc
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescobligationreduce
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescreserveincrease
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescreservereduce
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdesctranche
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION lnkduereserveaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION lnkinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION lnkoutinvobligationaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION lnkoutinvpledgeaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION lnkreserveaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION processoutbalancetransactions
      RETURN INTEGER;

   FUNCTION trdescsavepledgeprice
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescobligationincrease
      RETURN cm_trdescriptions.trdescription%TYPE;

   RETURN   INTEGER;

   FUNCTION calcpercent (
      p_sum           IN   NUMBER,
      p_rate          IN   NUMBER,
      p_coefficient   IN   NUMBER,
      p_delimmer      IN   NUMBER DEFAULT bankyeardays
   )
      RETURN NUMBER;

   PROCEDURE processerror (errcode IN INTEGER);

   FUNCTION bankdaysbetween (firstdate IN DATE, lastdate IN DATE)
      RETURN INTEGER;

   FUNCTION bankmonthdays (adate IN DATE)
      RETURN INTEGER;

   FUNCTION precision2 (p_value IN NUMBER)
      RETURN NUMBER;

   FUNCTION precision7 (p_value IN NUMBER)
      RETURN NUMBER;

   FUNCTION creditline (p_credittypeid IN INTEGER)
      RETURN INTEGER;

   FUNCTION creditrenewable (p_credittypeid IN INTEGER)
      RETURN INTEGER;

   FUNCTION creditreservecontenabled (p_credittypeid IN INTEGER)
      RETURN INTEGER;

   FUNCTION trdescduedebtpay
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescdueintdebtpay
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescmaindebtpay
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trdescmainintdebtpay
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION trctrlshowdelayedtransactions
      RETURN INTEGER;

   FUNCTION trdescmaindebtexpire
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION inkcrdlineoblaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION inkoutinvinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION creditcards (p_credittype IN INTEGER)
      RETURN INTEGER;

   FUNCTION isfirstbankbate
      RETURN BOOLEAN;

   PROCEDURE updfactcalcrest (p_id IN INTEGER);

   FUNCTION getuser_accesstempaccount
      RETURN VARCHAR2;

   PROCEDURE sendmsg (usrname IN VARCHAR2, msg IN VARCHAR2);

   FUNCTION lnkdueinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER;

   FUNCTION get_firstmonth (p_date IN DATE)
      RETURN DATE;

   FUNCTION get_crdcalcmethod (p_creditid IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_crdcurrentpaymentdat (p_creditid IN INTEGER)
      RETURN DATE;

   FUNCTION get_creditdateduerest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_creditdaterest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_creditfirstplanerest (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditfirstplanerest1 (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditno (p_id IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_creditpenalty (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditpenaltyaccid (p_creditid IN INTEGER)
      RETURN INTEGER;

   FUNCTION get_creditpenaltyaccount (p_creditid IN INTEGER)
      RETURN VARCHAR2;

   FUNCTION get_creditplandate (p_creditid IN INTEGER, p_date IN DATE)
      RETURN INTEGER;

   FUNCTION get_creditplaninterest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_creditplanostat (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditplanpayment (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditplanpaymentint (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_creditplanprincipal (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_creditplanrest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_date (p_date IN DATE)
      RETURN DATE;

   FUNCTION get_facticalcalcintrate (p_creditid IN INTEGER)
      RETURN NUMBER;

   FUNCTION get_facticalcalcrate (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_facticalcalcrate1 (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_fullpayment (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER;

   FUNCTION get_intreference (p_refname IN VARCHAR2)
      RETURN INTEGER;

   FUNCTION get_lastmonth (p_date IN DATE)
      RETURN DATE;

   FUNCTION get_oppositeaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER,
      p_linkname       IN   cm_links.LINK%TYPE
   )
      RETURN sb_account.ID%TYPE;

   FUNCTION get_trdescriptions (p_trname IN cm_trdescriptions.iname%TYPE)
      RETURN cm_trdescriptions.trdescription%TYPE;

   FUNCTION check_endweek (p_date IN DATE)
      RETURN BOOLEAN;

   FUNCTION check_seldate (p_date IN DATE)
      RETURN BOOLEAN;

   FUNCTION checkdates (oldv IN DATE, newv IN DATE)
      RETURN DATE;

   FUNCTION checknumbers (oldv IN NUMBER, newv IN NUMBER)
      RETURN NUMBER;

   FUNCTION checkpaymentdate (p_crdid IN INTEGER, p_dat IN DATE)
      RETURN BOOLEAN;

   FUNCTION checkpaymentplane (
      p_amt     OUT      NUMBER,
      p_crdid   IN       INTEGER,
      p_dat     IN       DATE
   )
      RETURN BOOLEAN;

   FUNCTION checkplane (p_creditid IN INTEGER)
      RETURN BOOLEAN;

   FUNCTION checkvarchars (oldv IN VARCHAR2, newv IN VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION get_charreference (p_refname IN VARCHAR2)
      RETURN VARCHAR2;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_utils
IS
   FUNCTION get_intreference (p_refname IN VARCHAR2)
      RETURN INTEGER
   IS
      CURSOR c_reference (refname IN VARCHAR2)
      IS
         SELECT integervalue
           FROM cm_references
          WHERE iname = refname;

      RESULT   cm_references.integervalue%TYPE;
   BEGIN
      OPEN c_reference (p_refname);
      FETCH c_reference INTO RESULT;
      CLOSE c_reference;
      RETURN RESULT;
   END;

   FUNCTION get_charreference (p_refname IN VARCHAR2)
      RETURN VARCHAR2
   IS
      CURSOR c_reference (refname IN VARCHAR2)
      IS
         SELECT charvalue
           FROM cm_references
          WHERE iname = refname;

      RESULT   cm_references.charvalue%TYPE;
   BEGIN
      OPEN c_reference (p_refname);
      FETCH c_reference INTO RESULT;
      CLOSE c_reference;
      RETURN RESULT;
   END;

   FUNCTION useleft
      RETURN INTEGER
   IS
      strrefname   CONSTANT VARCHAR2 (32) := 'UseLeft';
      RESULT                INTEGER;
   BEGIN
      RESULT := get_intreference (strrefname);
      RETURN RESULT;
   END;

   FUNCTION reduceobligationontranch
      RETURN INTEGER
   IS
      strrefname   CONSTANT VARCHAR2 (32) := 'ReduceObligationOnTranch';
      RESULT                INTEGER;
   BEGIN
      RESULT := get_intreference (strrefname);
      RETURN RESULT;
   END;

   FUNCTION processoutbalancetransactions
      RETURN INTEGER
   IS
      strrefname   CONSTANT VARCHAR2 (32) := 'ProcessOutBalanceTransactions';
      RESULT                INTEGER;
   BEGIN
      RESULT := get_intreference (strrefname);
      RETURN RESULT;
   END;

   FUNCTION trctrlshowdelayedtransactions
      RETURN INTEGER
   IS
      strrefname   CONSTANT VARCHAR2 (32) := 'TrCtrlShowDelayedTransactions';
      RESULT                INTEGER;
   BEGIN
      RESULT := get_intreference (strrefname);
      RETURN RESULT;
   END;

   FUNCTION bankyeardays
      RETURN INTEGER
   IS
      strrefname   CONSTANT VARCHAR2 (32) := 'BankYearDays';
      RESULT                INTEGER;
   BEGIN
      RESULT := get_intreference (strrefname);
      RETURN RESULT;
   END;

   FUNCTION bankmonthdays (adate IN DATE)
      RETURN INTEGER
   IS
   BEGIN
      IF bankyeardays () > 360
      THEN
         RETURN TO_NUMBER (TO_CHAR (LAST_DAY (adate), 'DD'));
      ELSE
         RETURN 30;
      END IF;
   END;

   FUNCTION get_trdescriptions (p_trname IN cm_trdescriptions.iname%TYPE)
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      CURSOR c_trdescriptions (trname IN cm_trdescriptions.iname%TYPE)
      IS
         SELECT trdescription
           FROM cm_trdescriptions
          WHERE iname = trname;

      RESULT   cm_trdescriptions.trdescription%TYPE;
   BEGIN
      OPEN c_trdescriptions (p_trname);
      FETCH c_trdescriptions INTO RESULT;
      CLOSE c_trdescriptions;
      RETURN RESULT;
   END;

   FUNCTION trdescinterestrecalc
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                    := 'trDescInterestRecalc';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdesctranche
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE    := 'trDescTranche';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescreserveincrease
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                   := 'trDescReserveIncrease';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescreservereduce
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                     := 'trDescReserveReduce';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescobligationreduce
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                  := 'trDescObligationReduce';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescobligationincrease
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                := 'trDescObligationIncrease';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescsavepledgeprice
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                   := 'trDescSavePledgePrice';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescmaindebtpay
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                       := 'trDescMainDebtPay';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescmainintdebtpay
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                    := 'trDescMainIntDebtPay';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescduedebtpay
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE := 'trDescDueDebtPay';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescmaindebtexpire
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                    := 'trDescMainDebtExpire';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION trdescdueintdebtpay
      RETURN cm_trdescriptions.trdescription%TYPE
   IS
      strtrname   CONSTANT cm_trdescriptions.iname%TYPE
                                                     := 'trDescDueIntDebtPay';
      RESULT               cm_trdescriptions.trdescription%TYPE;
   BEGIN
      RESULT := get_trdescriptions (strtrname);
      RETURN RESULT;
   END;

   FUNCTION get_oppositeaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER,
      p_linkname       IN   cm_links.LINK%TYPE
   )
      RETURN sb_account.ID%TYPE
   IS
      CURSOR c_linkvalues (
         abranchid      IN   INTEGER,
         linkname       IN   cm_links.LINK%TYPE,
         custcategory   IN   INTEGER,
         crdcurrency    IN   INTEGER
      )
      IS
         SELECT accountid
           FROM cm_link_values
          WHERE branchid = abranchid
            AND currencyid = crdcurrency
            AND linkid =
                        (SELECT ID
                           FROM cm_links
                          WHERE categoryid = custcategory AND LINK = linkname);

      RESULT   sb_account.ID%TYPE;
   BEGIN
      OPEN c_linkvalues (p_bankid, p_linkname, p_custcategory, p_crdcurrency);
      FETCH c_linkvalues INTO RESULT;

      IF c_linkvalues%NOTFOUND
      THEN
         RESULT := NULL;
      END IF;

      CLOSE c_linkvalues;
      RETURN RESULT;
   END;

   FUNCTION lnkinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkinterestaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION lnkdueinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkdueinterestaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION inkcrdlineoblaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.inkcrdlineoblaccont
                             );
      RETURN RESULT;
   END;

   FUNCTION lnkreserveaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkreserveaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION lnkduereserveaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkduereserveaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION inkoutinvinterestaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.inkoutintaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION lnkoutinvobligationaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkoutinvobligationaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION lnkoutinvpledgeaccount (
      p_custcategory   IN   INTEGER,
      p_crdcurrency    IN   INTEGER,
      p_bankid         IN   INTEGER
   )
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      RESULT :=
         get_oppositeaccount (p_custcategory      => p_custcategory,
                              p_crdcurrency       => p_crdcurrency,
                              p_bankid            => p_bankid,
                              p_linkname          => cm_decls.lnkoutinvpledgeaccount
                             );
      RETURN RESULT;
   END;

   FUNCTION bankdaysbetween (firstdate IN DATE, lastdate IN DATE)
      RETURN INTEGER
   IS
      RESULT          INTEGER;
      currentmonth    DATE;
      MONTH           DATE    := firstdate;
      monthinterval   INTEGER;
      mounthindex     INTEGER;
      lastmonthday    INTEGER;
   BEGIN
      IF firstdate >= lastdate
      THEN
         RESULT := 0;
      ELSE
         RESULT := (lastdate - firstdate);

         IF bankyeardays > 360
         THEN
            RETURN RESULT;
         END IF;

         monthinterval := (lastdate - firstdate) / 30;

         FOR monthindex IN 0 .. monthinterval
         LOOP
            currentmonth := LAST_DAY (MONTH);
            lastmonthday := TO_NUMBER (TO_CHAR (currentmonth, 'DD'));

            IF (currentmonth <= lastdate) AND (currentmonth > firstdate)
            THEN
               IF lastmonthday = 31
               THEN
                  RESULT := RESULT - 1;
               END IF;

               IF lastmonthday = 28
               THEN
                  RESULT := RESULT + 2;
               END IF;

               IF lastmonthday = 29
               THEN
                  RESULT := RESULT + 1;
               END IF;
            END IF;

            MONTH := ADD_MONTHS (MONTH, 1);
         END LOOP;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION calcpercent (
      p_sum           IN   NUMBER,
      p_rate          IN   NUMBER,
      p_coefficient   IN   NUMBER,
      p_delimmer      IN   NUMBER DEFAULT bankyeardays
   )
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      RESULT := (p_sum * p_rate * p_coefficient) / (p_delimmer * 100);
      RETURN RESULT;
   END;

   PROCEDURE processerror (errcode IN INTEGER)
   IS
   BEGIN
      raise_application_error (errcode, 'Error');
   END;

   FUNCTION precision7 (p_value IN NUMBER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
      temp     NUMBER := p_value;
   BEGIN
      temp := temp * 100 - TRUNC (temp * 100);
      RESULT := temp / 100;
      RETURN RESULT;
   END;

   FUNCTION precision2 (p_value IN NUMBER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
      temp     NUMBER := p_value;
   BEGIN
      temp := temp * 100 - TRUNC (temp * 100);
      RESULT := p_value - temp / 100;
      RETURN RESULT;
   END;

   FUNCTION creditline (p_credittypeid IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      SELECT itype
        INTO RESULT
        FROM cm_credittypes
       WHERE ID = p_credittypeid;

      RETURN RESULT;
   END;

   FUNCTION creditrenewable (p_credittypeid IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      SELECT renewablestatus
        INTO RESULT
        FROM cm_credittypes
       WHERE ID = p_credittypeid;

      RETURN RESULT;
   END;

   FUNCTION creditreservecontenabled (p_credittypeid IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;
   BEGIN
      SELECT iclass
        INTO RESULT
        FROM cm_credittypes
       WHERE ID = p_credittypeid;

      RETURN RESULT;
   END;

   FUNCTION creditcards (p_credittype IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;

      CURSOR c_cards
      IS
         SELECT cardtype
           FROM cm_credittypes
          WHERE ID = p_credittype;

      cards    c_cards%ROWTYPE;
   BEGIN
      OPEN c_cards;
      FETCH c_cards INTO cards;
      CLOSE c_cards;
      RESULT := NVL (cards.cardtype, 0);
      RETURN RESULT;
   END;

   FUNCTION isfirstbankbate
      RETURN BOOLEAN
   IS
      RESULT     BOOLEAN;
      currdate   DATE;
   BEGIN
      RESULT := FALSE;

      SELECT tek_dat
        INTO currdate
        FROM sb_sysdat;

      IF TO_CHAR (currdate, 'DD') = '01'
      THEN
         RESULT := TRUE;
      END IF;

      RETURN RESULT;
   END;

   PROCEDURE updfactcalcrest (p_id IN INTEGER)
   IS
      CURSOR c_pay_plan
      IS
         SELECT principal
           FROM cm_payment_schedule
          WHERE paymentdate = (SELECT tek_dat
                                 FROM sb_sysdat) AND creditid = p_id;

      pay   c_pay_plan%ROWTYPE;
   BEGIN
      IF NOT isfirstbankbate
      THEN
         OPEN c_pay_plan;
         FETCH c_pay_plan INTO pay;
         CLOSE c_pay_plan;

         UPDATE cm_curr_state
            SET factcalcamt = rest - NVL (pay.principal, 0)
          WHERE creditid = p_id;

         COMMIT;
      END IF;
   END;

   FUNCTION getuser_accesstempaccount
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (30) := '';

      CURSOR c_user_accesstempaccount
      IS
         SELECT cur_user
           FROM smart.sba_usergrants
          WHERE cur_module = 'TEMPACCOUNTS';
   BEGIN
      OPEN c_user_accesstempaccount;
      FETCH c_user_accesstempaccount INTO RESULT;
      CLOSE c_user_accesstempaccount;
      RETURN RESULT;
   END;

   PROCEDURE sendmsg (usrname IN VARCHAR2, msg IN VARCHAR2)
   IS
      CURSOR c_usrsession
      IS
         SELECT SID, username
           FROM v$session
          WHERE username = usrname AND status <> 'KILLED';

      usrsession     c_usrsession%ROWTYPE;
      alrtname       VARCHAR2 (30);
      alrtconstmsg   VARCHAR2 (30)          := 'MSGTOUSER_';
      defsession     BOOLEAN;
   BEGIN
      OPEN c_usrsession;
      FETCH c_usrsession INTO usrsession;
      defsession := c_usrsession%FOUND;
      CLOSE c_usrsession;

      IF defsession
      THEN
         alrtname := alrtconstmsg || usrsession.SID;
         DBMS_ALERT.REGISTER (alrtname);
         DBMS_ALERT.signal (alrtname, msg);
      ELSE
         IF usrname IS NOT NULL
         THEN
            INSERT INTO messagetouser
                        (username, MESSAGE
                        )
                 VALUES (usrname, msg
                        );
         END IF;
      END IF;
   END;

   FUNCTION get_crdcalcmethod (p_creditid IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT     VARCHAR2 (32);

      CURSOR c_methid
      IS
         SELECT intcalcmethod
           FROM cm_portfolio
          WHERE ID = p_creditid;

      methid     INTEGER;

      CURSOR c_methname (p_id IN INTEGER)
      IS
         SELECT NAME
           FROM cm_intcalcmethod
          WHERE ID = p_id;

      methname   VARCHAR2 (32);
   BEGIN
      OPEN c_methid;
      FETCH c_methid INTO methid;
      CLOSE c_methid;
      OPEN c_methname (methid);
      FETCH c_methname INTO methname;
      CLOSE c_methname;
      RETURN NVL (methname, '');
   END;

   FUNCTION get_creditfirstplanerest (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT rest
        INTO RESULT
        FROM cm_payment_schedule
       WHERE paymentdate = (SELECT MIN (paymentdate)
                              FROM cm_payment_schedule
                             WHERE creditid = p_creditid)
         AND creditid = p_creditid;

      RETURN RESULT;
   END;

   FUNCTION get_creditfirstplanerest1 (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;
   BEGIN
      SELECT SUM (trancheamount)
        INTO RESULT
        FROM cm_tranches
       WHERE creditid = p_creditid
         AND tranchedate = (SELECT MIN (tranchedate)
                              FROM cm_tranches
                             WHERE creditid = p_creditid) /*
from cm_payment_schedule
where paymentdate = (
select min (paymentdate) from cm_payment_schedule
where CreditID = P_CreditID)
and CreditID = P_CreditID*/;

      RETURN RESULT;
   END;

   FUNCTION get_facticalcalcrate (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      checkopdate   BOOLEAN;
      checkop       BOOLEAN;

      CURSOR c_payplane
      IS
         SELECT rest, paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate = p_date;

      CURSOR c_plane (bdat IN DATE, edat IN DATE)
      IS
         SELECT rest, paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate BETWEEN bdat AND edat /*(
           select max (paymentdate) from cm_payment_schedule
           where CreditID = P_CreditID and paymentdate < P_Date)*/;

      plane         c_plane%ROWTYPE;
      factrest      NUMBER;
      fdat          DATE;
      ldat          DATE;
      currdat       DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      fdat := get_firstmonth (currdat);
      ldat := LAST_DAY (currdat);
      OPEN c_payplane;
      FETCH c_payplane INTO plane;
      checkopdate := c_payplane%FOUND;
      CLOSE c_payplane;

      IF checkopdate
      THEN
         factrest := plane.rest;
      ELSE
         OPEN c_plane (fdat, ldat);
         FETCH c_plane INTO plane;
         checkop := c_plane%FOUND;
         CLOSE c_plane;

         IF checkop
         THEN
            factrest := plane.rest;
         ELSE
            factrest := get_creditfirstplanerest (p_creditid);
         END IF;
      END IF;

      RETURN NVL (factrest, 0);
   END;

   FUNCTION get_facticalcalcintrate (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      checkopdate   BOOLEAN;
      checkop       BOOLEAN;

      CURSOR c_plane (bdat IN DATE, edat IN DATE)
      IS
         SELECT interest, paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      plane         c_plane%ROWTYPE;
      factrest      NUMBER;
      fdat          DATE;
      ldat          DATE;
      currdat       DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      fdat := get_firstmonth (currdat);
      ldat := LAST_DAY (currdat);
      OPEN c_plane (fdat, ldat);
      FETCH c_plane INTO plane;
      factrest := plane.interest;
      CLOSE c_plane;
      RETURN NVL (factrest, 0);
   END;

   FUNCTION get_facticalcalcrate1 (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      checkopdate   BOOLEAN;
      checkop       BOOLEAN;

      CURSOR c_payplane
      IS
         SELECT rest, paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate = p_date;

      CURSOR c_plane
      IS
         SELECT rest, paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate =
                       (SELECT MAX (paymentdate)
                          FROM cm_payment_schedule
                         WHERE creditid = p_creditid AND paymentdate < p_date);

      plane         c_plane%ROWTYPE;
      factrest      NUMBER;
   BEGIN
      OPEN c_payplane;
      FETCH c_payplane INTO plane;
      checkopdate := c_payplane%FOUND;
      CLOSE c_payplane;

      IF checkopdate
      THEN
         factrest := plane.rest;
      ELSE
         OPEN c_plane;
         FETCH c_plane INTO plane;
         checkop := c_plane%FOUND;
         CLOSE c_plane;

         IF checkop
         THEN
            factrest := plane.rest;
         ELSE
            factrest := get_creditfirstplanerest1 (p_creditid);
         END IF;
      END IF;

      RETURN NVL (factrest, 0);
   END;

   FUNCTION checkpaymentplane (
      p_amt     OUT      NUMBER,
      p_crdid   IN       INTEGER,
      p_dat     IN       DATE
   )
      RETURN BOOLEAN
   IS
      amt        NUMBER;

      CURSOR c_payplane
      IS
         SELECT principal
           FROM cm_payment_schedule
          WHERE creditid = p_crdid AND paymentdate = p_dat;

      CURSOR c_pay
      IS
         SELECT *
           FROM cm_payments
          WHERE paydate = p_dat AND creditid = p_crdid;

      payplane   c_payplane%ROWTYPE;
      pay        c_pay%ROWTYPE;
      amount     NUMBER               := 0;
      RESULT     BOOLEAN              := FALSE;
   BEGIN
      OPEN c_payplane;
      FETCH c_payplane INTO payplane;

      IF c_payplane%FOUND
      THEN
         OPEN c_pay;
         FETCH c_pay INTO pay;
         RESULT := c_pay%FOUND;
         CLOSE c_pay;
         amount := payplane.principal;
      END IF;

      CLOSE c_payplane;
      p_amt := amount;
      RETURN RESULT;
   END;

   FUNCTION get_creditdaterest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_rest
      IS
         SELECT rest
           FROM cm_history
          WHERE creditid = p_creditid AND hdate = (SELECT MAX (hdate)
                                                     FROM cm_history
                                                    WHERE hdate <= p_date);
   BEGIN
      OPEN c_rest;
      FETCH c_rest INTO RESULT;
      CLOSE c_rest;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_creditdateduerest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_rest
      IS
         SELECT duerest
           FROM cm_history
          WHERE creditid = p_creditid AND hdate = (SELECT MAX (hdate)
                                                     FROM cm_history
                                                    WHERE hdate <= p_date);
   BEGIN
      OPEN c_rest;
      FETCH c_rest INTO RESULT;
      CLOSE c_rest;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION check_endweek (p_date IN DATE)
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;
      ew       VARCHAR2 (2);
   BEGIN
      RESULT := FALSE;
      ew := TO_CHAR (p_date, 'D');

      IF ew = '1'
      THEN
         RESULT := TRUE;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION check_seldate (p_date IN DATE)
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;

      CURSOR c_seldate
      IS
         SELECT seldate
           FROM cm_seldates
          WHERE seldate = p_date;

      sel      c_seldate%ROWTYPE;
   BEGIN
      OPEN c_seldate;
      FETCH c_seldate INTO sel;
      RESULT := c_seldate%FOUND;
      CLOSE c_seldate;
      RETURN RESULT;
   END;

   FUNCTION get_creditplanrest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_palane
      IS
         SELECT rest
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate =
                      (SELECT MAX (paymentdate)
                         FROM cm_payment_schedule
                        WHERE creditid = p_creditid AND paymentdate <= p_date);
   BEGIN
      OPEN c_palane;
      FETCH c_palane INTO RESULT;
      CLOSE c_palane;
      RETURN RESULT;
   END;

   FUNCTION get_creditplanprincipal (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_palane
      IS
         SELECT principal
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate =
                      (SELECT MAX (paymentdate)
                         FROM cm_payment_schedule
                        WHERE creditid = p_creditid AND paymentdate <= p_date);
   BEGIN
      OPEN c_palane;
      FETCH c_palane INTO RESULT;
      CLOSE c_palane;
      RETURN RESULT;
   END;

   FUNCTION get_creditplaninterest (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_palane
      IS
         SELECT interest
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate =
                      (SELECT MAX (paymentdate)
                         FROM cm_payment_schedule
                        WHERE creditid = p_creditid AND paymentdate <= p_date);
   BEGIN
      OPEN c_palane;
      FETCH c_palane INTO RESULT;
      CLOSE c_palane;
      RETURN RESULT;
   END;

   FUNCTION get_creditplandate (p_creditid IN INTEGER, p_date IN DATE)
      RETURN INTEGER
   IS
      resultd   DATE;
      RESULT    INTEGER;

      CURSOR c_date
      IS
         SELECT MAX (paymentdate)
           FROM cm_payment_schedule
          WHERE creditid = p_creditid
            AND paymentdate =
                      (SELECT MAX (paymentdate)
                         FROM cm_payment_schedule
                        WHERE creditid = p_creditid AND paymentdate <= p_date);

      pldate    c_date%ROWTYPE;
   BEGIN
      OPEN c_date;
      FETCH c_date INTO resultd;
      CLOSE c_date;
      RESULT := bankdaysbetween (resultd, p_date);
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_date (p_date IN DATE)
      RETURN DATE
   IS
   BEGIN
      RETURN p_date;
   END;

   FUNCTION checkpaymentdate (p_crdid IN INTEGER, p_dat IN DATE)
      RETURN BOOLEAN
   IS
      amt        NUMBER;

      CURSOR c_payplane
      IS
         SELECT principal
           FROM cm_payment_schedule
          WHERE creditid = p_crdid AND paymentdate = p_dat;

      CURSOR c_payplanedat (dat DATE)
      IS
         SELECT paymentdate
           FROM cm_payment_schedule
          WHERE creditid = p_crdid
            AND paymentdate BETWEEN get_firstmonth (dat) AND dat;

      payplane   c_payplane%ROWTYPE;
      RESULT     BOOLEAN              := FALSE;
      planrest   NUMBER;
      realrest   NUMBER;
      pdat       DATE;
      r          BOOLEAN;
      currdat    DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      planrest := get_creditplanostat (p_crdid);

      SELECT rest
        INTO realrest
        FROM cm_curr_state
       WHERE creditid = p_crdid;

      RESULT := planrest <> realrest;
      OPEN c_payplane;
      FETCH c_payplane INTO payplane;
      r := c_payplane%FOUND;
      CLOSE c_payplane;
      OPEN c_payplanedat (LAST_DAY (currdat));
      FETCH c_payplanedat INTO pdat;
      CLOSE c_payplanedat;

      IF NOT RESULT
      THEN
         RESULT := pdat > currdat;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION checknumbers (oldv IN NUMBER, newv IN NUMBER)
      RETURN NUMBER
   IS
      RESULT   NUMBER := NULL;
   BEGIN
      IF oldv <> newv
      THEN
         RESULT := oldv;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION checkvarchars (oldv IN VARCHAR2, newv IN VARCHAR2)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (30) := NULL;
   BEGIN
      IF oldv <> newv
      THEN
         RESULT := oldv;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION checkdates (oldv IN DATE, newv IN DATE)
      RETURN DATE
   IS
      RESULT   DATE := NULL;
   BEGIN
      IF oldv <> newv
      THEN
         RESULT := oldv;
      END IF;

      RETURN RESULT;
   END;

   FUNCTION get_firstmonth (p_date IN DATE)
      RETURN DATE
   IS
      RESULT   DATE;
      mon      VARCHAR2 (4);
      YEAR     VARCHAR2 (4);
   BEGIN
      mon := TO_CHAR (p_date, 'MON');
      YEAR := TO_CHAR (p_date, 'YYYY');
      RETURN TO_DATE ('01' || '-' || mon || '-' || YEAR);
   END;

   FUNCTION get_lastmonth (p_date IN DATE)
      RETURN DATE
   IS
      RESULT   DATE;
      mon      VARCHAR2 (4);
      YEAR     VARCHAR2 (4);
      fdat     DATE;
   BEGIN
      mon := TO_CHAR (p_date, 'MON');
      YEAR := TO_CHAR (p_date, 'YYYY');
      fdat := TO_DATE ('01' || '-' || mon || '-' || YEAR);
      RETURN LAST_DAY (fdat);
   END;

   FUNCTION get_creditplanpayment (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT    NUMBER;

      CURSOR c_payplane (bdat IN DATE, edat IN DATE)
      IS
         SELECT principal
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      fdat      DATE;
      ldat      DATE;
      currdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      fdat := get_firstmonth (currdat);
      ldat := LAST_DAY (currdat);
      OPEN c_payplane (fdat, ldat);
      FETCH c_payplane INTO RESULT;
      CLOSE c_payplane;
      RETURN RESULT;
   END;

   FUNCTION get_creditplanostat (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT    NUMBER;

      CURSOR c_payplane (bdat IN DATE, edat IN DATE)
      IS
         SELECT rest
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      fdat      DATE;
      ldat      DATE;
      currdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      fdat := get_firstmonth (currdat);
      ldat := LAST_DAY (currdat);
      OPEN c_payplane (fdat, ldat);
      FETCH c_payplane INTO RESULT;
      CLOSE c_payplane;
      RETURN RESULT;
   END;

   FUNCTION get_creditplanpaymentint (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT    NUMBER;

      CURSOR c_payplane (bdat IN DATE, edat IN DATE)
      IS
         SELECT interest
           FROM cm_payment_schedule
          WHERE creditid = p_creditid AND paymentdate BETWEEN bdat AND edat;

      fdat      DATE;
      ldat      DATE;
      currdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      fdat := get_firstmonth (currdat);
      ldat := LAST_DAY (currdat);
      OPEN c_payplane (fdat, ldat);
      FETCH c_payplane INTO RESULT;
      CLOSE c_payplane;
      RETURN RESULT;
   END;

   FUNCTION get_creditpenalty (p_creditid IN INTEGER)
      RETURN NUMBER
   IS
      RESULT   NUMBER;

      CURSOR c_pen
      IS
         SELECT penaltyrest
           FROM cm_curr_state
          WHERE creditid = p_creditid;
   BEGIN
      OPEN c_pen;
      FETCH c_pen INTO RESULT;
      CLOSE c_pen;
      RETURN NVL (RESULT, 0);
   END;

   FUNCTION get_crdcurrentpaymentdat (p_creditid IN INTEGER)
      RETURN DATE
   IS
      RESULT    DATE;
      currdat   DATE;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      SELECT paymentdate
        INTO RESULT
        FROM cm_payment_schedule
       WHERE creditid = p_creditid
         AND paymentdate BETWEEN get_firstmonth (currdat)
                             AND get_lastmonth (currdat);

      RETURN RESULT;
   END;

   FUNCTION get_creditpenaltyaccount (p_creditid IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (25);

      CURSOR c_sett
      IS
         SELECT acc_no
           FROM sb_account
          WHERE ID =
                   (SELECT accid
                      FROM cm_penaltysettings
                     WHERE branchid = (SELECT branchid
                                         FROM cm_portfolio
                                        WHERE ID = p_creditid)
                       AND currencyid = (SELECT currency
                                           FROM cm_portfolio
                                          WHERE ID = p_creditid));
   BEGIN
      OPEN c_sett;
      FETCH c_sett INTO RESULT;
      CLOSE c_sett;
      RETURN RESULT;
   END;

   FUNCTION get_creditpenaltyaccid (p_creditid IN INTEGER)
      RETURN INTEGER
   IS
      RESULT   INTEGER;

      CURSOR c_sett
      IS
         SELECT ID
           FROM sb_account
          WHERE ID =
                   (SELECT accid
                      FROM cm_penaltysettings
                     WHERE branchid = (SELECT branchid
                                         FROM cm_portfolio
                                        WHERE ID = p_creditid)
                       AND currencyid = (SELECT currency
                                           FROM cm_portfolio
                                          WHERE ID = p_creditid));
   BEGIN
      OPEN c_sett;
      FETCH c_sett INTO RESULT;
      CLOSE c_sett;
      RETURN RESULT;
   END;

   FUNCTION checkplane (p_creditid IN INTEGER)
      RETURN BOOLEAN
   IS
      RESULT   BOOLEAN;

      CURSOR c_plan
      IS
         SELECT *
           FROM cm_payment_schedule
          WHERE creditid = p_creditid;

      PLAN     c_plan%ROWTYPE;
   BEGIN
      OPEN c_plan;
      FETCH c_plan INTO PLAN;
      RESULT := (c_plan%FOUND);
      CLOSE c_plan;
      RETURN RESULT;
   END;

   FUNCTION get_creditno (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      RESULT   VARCHAR2 (20);
   BEGIN
      SELECT numberofcredit
        INTO RESULT
        FROM cm_portfolio
       WHERE ID = p_id;

      RETURN RESULT;
   END;

   FUNCTION get_fullpayment (p_creditid IN INTEGER, p_date IN DATE)
      RETURN NUMBER
   IS
   BEGIN
      RETURN   cm_utils.get_creditplanprincipal (p_creditid, p_date)
             + cm_utils.get_creditplaninterest (p_creditid, p_date);
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_UTILS

-- Start of DDL Script for Package CREDITSMGR.CM_WR_TOOLS
-- Generated 30-Apr-2007 11:01:29 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_wr_tools 
  IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE 
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------       
   -- Enter package declarations as shown below


  procedure AddTemplate(TemplName in Varchar2, TemplPath in VarChar2);
  procedure DeleteBookmark(BookID in integer);
  procedure updateBookmark(BookID in integer,BookName in Varchar2, TemplID in integer, FieldID in Integer);
  procedure AddBookmark(TemplID in integer,FieldID in integer,BookName varchar2);
  procedure DeleteTemplate(tempid in integer);
  procedure UpdateTemplates(tempid in integer,tempname in varchar2,temppath in varchar2);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY            creditsmgr.cm_wr_tools 
IS
procedure AddTemplate(TemplName in Varchar2, TemplPath in VarChar2)
is
begin
  INSERT INTO CM_WR_TEMPLATES (name, path)
       VALUES (TemplName, TemplPath);
  commit;
end;

procedure DeleteTemplate(tempid in integer)
is
begin
  delete from CM_WR_TEMPLATES where id=tempid;
  commit;
end;
procedure UpdateTemplates(tempid in integer,tempname in varchar2,temppath in varchar2)
is
begin
  update CM_WR_TEMPLATES set 
         name=tempname,
         path=temppath
  where ID=tempid;
  commit;
end;
procedure AddBookmark(TemplID in integer,FieldID in integer,BookName varchar2)
is
begin
  INSERT INTO CM_WR_BOOKMARKS (Templateid, Fieldid,Bookmarkname)
values (TemplID ,FieldID,BookName );
  commit;
end;
procedure DeleteBookmark(BookID in integer)
is
begin
  DELETE FROM CM_WR_BOOKMARKS WHERE ID = BookID;
  commit;
end;
procedure updateBookmark(BookID in integer,BookName in Varchar2, TemplID in integer, FieldID in Integer)
is
begin
  update CM_WR_BOOKMARKS set 
  BookMarkName=BookName, 
  Templateid=TemplID, 
  FieldID=FieldID
  where ID=BookID;
  commit;
end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_WR_TOOLS


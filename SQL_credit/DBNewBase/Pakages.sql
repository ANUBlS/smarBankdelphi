-- Start of DDL Script for Package CREDITSMGR.CM_ACTIVATION
-- Generated 30-May-2006 16:40:13 from CREDITSMGR@SB

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
      CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(cm_decls.atfCommitImmediate);
      commit work;
    else
      rollback work;
    end if;
  end;
          
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_ACTIVATION

-- Start of DDL Script for Package CREDITSMGR.CM_ADMINISTRATION
-- Generated 30-May-2006 16:40:13 from CREDITSMGR@SB

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

   FUNCTION pluginaccess (c_pluginid INTEGER, c_userid INTEGER DEFAULT UID)
      RETURN BOOLEAN;

   FUNCTION getpluginid (p_plugin VARCHAR2, p_param VARCHAR2)
      RETURN INTEGER;

   PROCEDURE checkuserexists (c_username VARCHAR2);

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

   PROCEDURE addcredituser (u_username VARCHAR2);

   PROCEDURE addusergrant (a_pluginid INTEGER, a_userid INTEGER);

   PROCEDURE delusergrant (a_pluginid INTEGER, a_userid INTEGER);

   PROCEDURE grantsysplugins (g_userid INTEGER);
   
   PROCEDURE grantsysplugin (g_pluginid INTEGER);
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

      grantsysplugin (getpluginid (p_pluginname, p_paramname));
      COMMIT WORK;
   END;

   PROCEDURE updateplugin (
      p_id            IN   INTEGER,
      p_description   IN   VARCHAR2,
      p_typeid             INTEGER
   )
   IS
   BEGIN
      DELETE FROM cm_adm_usergrants
            WHERE pluginid = p_id AND pluginid IN (SELECT ID
                                                     FROM cm_adm_plugins
                                                    WHERE typeid = 1);

      UPDATE cm_adm_plugins
         SET description = p_description,
             typeid = p_typeid
       WHERE ID = p_id;

      grantsysplugin (p_id);
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

   PROCEDURE addcredituser (u_username VARCHAR2)
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

      grantsysplugins (getuserid (u_username));
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

   FUNCTION is_adminnum (i_username VARCHAR2)
      RETURN NUMBER
   IS
      CURSOR c_admusers
      IS
         SELECT NAME
           FROM cm_adm_users
          WHERE NAME = i_username AND typeid = 1;

      usrfound   BOOLEAN;
   BEGIN
      OPEN c_admusers;
      usrfound := c_admusers%FOUND;
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

   PROCEDURE addusergrant (a_pluginid INTEGER, a_userid INTEGER)
   IS
   BEGIN
      INSERT INTO cm_adm_usergrants
                  (pluginid, userid
                  )
           VALUES (a_pluginid, a_userid
                  );
   --COMMIT WORK;
   END;

   PROCEDURE delusergrant (a_pluginid INTEGER, a_userid INTEGER)
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

END;
/


-- End of DDL Script for Package CREDITSMGR.CM_ADMINISTRATION

-- Start of DDL Script for Package CREDITSMGR.CM_AK_REPORTS
-- Generated 30-May-2006 16:40:13 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_ak_reports 
    IS 
    PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE); 
    PROCEDURE insinfof1 (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE); 
    Function get_currency_ostat(p_creditid in integer,p_dat in date)  
  return number; 
    procedure Portfel_Filials(p_filialid in integer, 
                             p_per integer, 
                             p_bdate in date,p_edate in date); 
    function Get_Balcn(p_no in varchar2) 
  return number; 
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
   
        begininfo        c_begininfo%ROWTYPE; 
        endinfo          c_endinfo%ROWTYPE; 
        paymentinfo      c_paymentinfo%ROWTYPE; 
        trchinfo         c_trchinfo%ROWTYPE; 
        portfoliotrunc   c_portfoliotrunc%ROWTYPE; 
        montrunc         INTEGER; 
        AccName          Varchar2(30); 
     BEGIN 
   
        select acc_no into AccName 
        from sb_account 
        where id = (select Contractaccid from cm_accounts where creditid=p_id 
  ); 
         
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
  ---raise_application_error(-20005, crdinfo.crdnum); 
        INSERT INTO cm_report_f1 
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
                   , NVL (histinfo.dueinterestrest, 0)); 
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
   
  END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AK_REPORTS

-- Start of DDL Script for Package CREDITSMGR.CM_AKF
-- Generated 30-May-2006 16:40:13 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_akf
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

  /* FUNCTION getgirovtorpaqha (p_id IN INTEGER)
      RETURN NUMBER
   IS
      res   NUMBER;
   BEGIN
      SELECT pledgepricetorpaqha
        INTO res
        FROM cm_guarantee
       WHERE creditid = p_id;

      RETURN ROUND (res, 1);
   END;*/

  /* FUNCTION getgirovtorpaqcost (p_id IN INTEGER)
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
   END;*/

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
-- Generated 30-May-2006 16:40:13 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_akf_1
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_auto_expire
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE);

   PROCEDURE autores (p_opdate IN DATE);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_autoexp
IS
   PROCEDURE autoexp (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT ID, numberofcredit, currency, customertype, branchid,
                credittype
           FROM cm_active_credits
          WHERE ID IN (SELECT creditid
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
          WHERE ID = (SELECT reserveid
                        FROM cm_curr_state
                       WHERE creditid = p_id);

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT booroweraccid, contractaccid, loanaccid, dueloanaccid,
                interestaccid, dueinterestaccid, primaryreserveaccid,
                secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_sm_ostat (p_id IN INTEGER)
      IS
         SELECT ABS (ostat) AS ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

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

      CURSOR c_a_exp (p_id IN INTEGER, p_date IN DATE)
      IS
         SELECT creditid, expamt
           FROM cm_auto_exp
          WHERE creditid = p_id AND expdate = p_date;

      sm_ostat             c_sm_ostat%ROWTYPE;
      EXP                  c_exp%ROWTYPE;
      shedulerest          c_shedulerest%ROWTYPE;
      currencyostat        c_currencyostat%ROWTYPE;
      reserverate          c_reserverate%ROWTYPE;
      ACCOUNT              c_account%ROWTYPE;
      payment              c_payment%ROWTYPE;
      a_exp                c_a_exp%ROWTYPE;
      debitaccid           INTEGER;
      creditaccid          INTEGER;
      tramount             NUMBER;
      reservecontenabled   BOOLEAN;
      trdescription        VARCHAR2 (50);
      resultmaintrid       INTEGER;
      resultprestrid       INTEGER;
      temp                 NUMBER;
      currdat              DATE;
      crdrest              NUMBER;
      crdinterestrest      NUMBER;
      crdduerest           NUMBER;
      crddueinterestrest   NUMBER;
      stopcalcdat          DATE;
      payrest              NUMBER;
      payinterstrest       NUMBER;
      payduerest           NUMBER;
      paydueinterstrest    NUMBER;
      customercanpay       NUMBER;
      canpay               NUMBER;
   BEGIN
      SELECT tek_dat
        INTO currdat
        FROM sb_sysdat;

      FOR portinfo IN c_port (currdat)
      LOOP
         payrest := 0;
         payinterstrest := 0;
         payduerest := 0;
         paydueinterstrest := 0;
         customercanpay := 0;

         SELECT rest, interestrest, duerest, dueinterestrest,
                stopcalcdate
           INTO crdrest, crdinterestrest, crdduerest, crddueinterestrest,
                stopcalcdat
           FROM cm_curr_state
          WHERE creditid = portinfo.ID;

         OPEN c_shedulerest (portinfo.ID, currdat);
         FETCH c_shedulerest INTO shedulerest;
         CLOSE c_shedulerest;
         OPEN c_account (portinfo.ID);
         FETCH c_account INTO ACCOUNT;
         CLOSE c_account;
         OPEN c_currencyostat (portinfo.currency);
         FETCH c_currencyostat INTO currencyostat;
         CLOSE c_currencyostat;
         OPEN c_reserverate (portinfo.ID);
         FETCH c_reserverate INTO reserverate;
         CLOSE c_reserverate;
         OPEN c_payment (portinfo.ID, p_opdate);
         FETCH c_payment INTO payment;
         CLOSE c_payment;
         OPEN c_exp (portinfo.ID, p_opdate);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;
         OPEN c_sm_ostat (ACCOUNT.booroweraccid);
         FETCH c_sm_ostat INTO sm_ostat;
         CLOSE c_sm_ostat;
         OPEN c_a_exp (portinfo.ID, p_opdate);
         FETCH c_a_exp INTO a_exp;
         customercanpay := sm_ostat.ostat;

         IF c_a_exp%NOTFOUND
         THEN
         CLOSE c_a_exp;

            /*Temp := crdduerest;
            if (Temp > 0) and (CustomerCanPay > 0) then
              if Temp > CustomerCanPay then
                payDuerest := CustomerCanPay;
              else
                payDuerest := Temp;

              CustomerCanPay := CustomerCanPay - Temp;
            end if;
            end if;

            Temp := crddueinterestrest;
            if (Temp > 0) and (CustomerCanPay > 0) then
              if Temp > CustomerCanPay then
                paydueinterstrest := CustomerCanPay;
              else
                paydueinterstrest := Temp;

              CustomerCanPay := CustomerCanPay - Temp;
            end if;
            end if;*/
            IF stopcalcdat IS NULL
            THEN
               temp := shedulerest.interest /*crdinterestrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payinterstrest := customercanpay;
                  ELSE
                     payinterstrest := temp;
                     customercanpay := customercanpay - temp;
                  END IF;
               END IF;

               temp := shedulerest.principal /*crdrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payrest := customercanpay;
                  ELSE
                     payrest := temp;
                  END IF;
               END IF;
            END IF;

            IF stopcalcdat IS NOT NULL
            THEN
               temp := shedulerest.principal /*crdrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payrest := customercanpay;
                  ELSE
                     payrest := temp;
                     customercanpay := customercanpay - temp;
                  END IF;
               END IF;

               temp := shedulerest.interest /*crdinterestrest*/;

               IF (temp > 0) AND (customercanpay > 0)
               THEN
                  IF temp > customercanpay
                  THEN
                     payinterstrest := customercanpay;
                  ELSE
                     payinterstrest := temp;
                  END IF;
               END IF;
            END IF;

            IF payrest + payinterstrest > 0
            THEN
            dbms_output.put_line('payinterstrest= '||payinterstrest);
               DBMS_OUTPUT.put_line ('payment begin ');
               cm_payment.paymentadd (p_creditid                 => portinfo.ID,
                                      p_date                     => p_opdate,
                                      p_custaccid                => ACCOUNT.booroweraccid,
                                      p_maindebt                 => payrest,
                                      p_maininterest             => payinterstrest,
                                      p_duedebt                  => 0,
                                      p_dueinterest              => 0,
                                      p_processtransactions      => FALSE
                                     );
               DBMS_OUTPUT.put_line ('payment end ');
            END IF;

                  debitaccid := ACCOUNT.dueloanaccid;
                  creditaccid := ACCOUNT.loanaccid;
                  tramount :=
                        shedulerest.principal - payrest /*p_Amount*/;
                  trdescription := cm_utils.trdescmaindebtexpire ();
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescnumber,
                              portinfo.numberofcredit
                             );
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescdate,
                              TO_CHAR (p_opdate, 'DD/MM/YYYY')
                             );

                  IF (debitaccid IS NOT NULL) AND (creditaccid IS NOT NULL)and(tramount<>0)
                  THEN
                     DBMS_OUTPUT.put_line ('tr begin ');
                     resultmaintrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => NULL,
                                                            p_creditamount         => tramount,
                                                            p_lamount              => NULL,
                                                            p_trname               => trdescription,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => p_opdate,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                     DBMS_OUTPUT.put_line ('tr end ');
              CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);       

               UPDATE    cm_curr_state
                     SET rest =
                               rest
                             - ( shedulerest.principal - payrest
                               ),
                         duerest =
                               duerest
                             + shedulerest.principal - payrest
                   WHERE creditid = portinfo.ID
               RETURNING rest
                    INTO temp;

               IF temp = 0
               THEN
                  UPDATE cm_accounts
                     SET contractaccid = dueloanaccid
                   WHERE creditid = portinfo.ID;
               END IF;

               INSERT INTO cm_expires
                           (creditid, expdate,
                            expamount /*, oldduereserveid*/,
                            exptrid, prestrid                    /*, srestrid*/
                           )
                    VALUES (portinfo.ID, p_opdate,
                               NVL (shedulerest.principal, 0)
                             - NVL (payment.payedamt, 0) /*, HistInfoRec.DUERESERVEID*/,
                            resultmaintrid, resultprestrid /*, ResultSResTrID*/
                           );

               UPDATE cm_auto_exp
                  SET expamt = tramount
                WHERE creditid = portinfo.ID AND expdate = p_opdate;

               IF SQL%NOTFOUND
               THEN
                  INSERT INTO cm_auto_exp
                              (creditid, expamt, expdate
                              )
                       VALUES (portinfo.ID, tramount, p_opdate
                              );
               END IF;
            END IF;
         END IF;
      --     COMMIT WORK;
      END LOOP;
   END;

   PROCEDURE autores (p_opdate IN DATE)
   IS
      CURSOR c_port (p_date IN DATE)
      IS
         SELECT ID, numberofcredit, currency, branchid, customertype
           FROM cm_active_credits
          WHERE ID IN (SELECT creditid
                         FROM cm_expires);

      CURSOR c_exp (p_id IN INTEGER /*,p_date in date*/)
      IS
         SELECT MIN (expdate) AS expdate
           FROM cm_expires
          WHERE creditid = p_id /*and expdate = p_date*/;

      CURSOR c_rests (p_id IN INTEGER)
      IS
         SELECT rest, reserveid, duerest, dueinterestrest
           FROM cm_curr_state
          WHERE creditid = p_id;

      CURSOR c_accounts (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid
           FROM cm_accounts
          WHERE creditid = p_id;

      CURSOR c_res
      IS
         SELECT ID, PERCENT, bdcount, edcount
           FROM cm_reserve_types;

      CURSOR c_ostat (p_id IN INTEGER)
      IS
         SELECT ostat
           FROM sb_tenostat
          WHERE acc_id = p_id;

      CURSOR c_avto_e (p_id IN INTEGER)
      IS
         SELECT resdate
           FROM cm_auto_res
          WHERE creditid = p_id;

      avto_e          c_avto_e%ROWTYPE;
      port            c_port%ROWTYPE;
      EXP             c_exp%ROWTYPE;
      rests           c_rests%ROWTYPE;
      accounts        c_accounts%ROWTYPE;
      ostatinfo       c_ostat%ROWTYPE;
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
      oldamt          NUMBER;
   BEGIN
      SELECT tek_dat
        INTO currdate
        FROM sb_sysdat;

      FOR port IN c_port (currdate)
      LOOP
         OPEN c_exp (port.ID /*,currdate*/);
         FETCH c_exp INTO EXP;
         CLOSE c_exp;
         OPEN c_accounts (port.ID);
         FETCH c_accounts INTO accounts;
         CLOSE c_accounts;
         OPEN c_rests (port.ID);
         FETCH c_rests INTO rests;
         CLOSE c_rests;
         OPEN c_ostat (accounts.primaryreserveaccid);
         FETCH c_ostat INTO ostatinfo;
         CLOSE c_ostat;
         OPEN c_avto_e (port.ID);
         FETCH c_avto_e INTO avto_e;
         CLOSE c_avto_e;

         IF avto_e.resdate <> currdate
         THEN
            IF EXP.expdate IS NOT NULL
            THEN
               countdat := currdate - EXP.expdate;

               FOR res IN c_res
               LOOP
                  IF (countdat >= res.bdcount) AND (countdat <= res.edcount)
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
                WHERE ID = rests.reserveid;

               IF crdpercent IN (6, 25)
               THEN
                  creditaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  debitaccid := accounts.primaryreserveaccid;
                  tramount := ostatinfo.ostat;
/*-----------------------------------F---------------------------------------------------------*/
                  firsttrid :=
                     cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                         p_debitid              => debitaccid,
                                                         p_creditid             => creditaccid,
                                                         p_debitamount          => tramount,
                                                         p_creditamount         => NULL,
                                                         p_lamount              => NULL,
                                                         p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                   || port.numberofcredit,
                                                         p_flags                => sb_decls.atfcommitimmediate,
                                                         p_transactiondate      => currdate,
                                                         p_operationtype        => cm_decls.cmtransactionoptype,
                                                         p_inbalancechar        => NULL
                                                        );
/*-------------------------------------------------S-------------------------------------------*/
                  OPEN c_ostat (accounts.secondaryreserveaccid);
                  FETCH c_ostat INTO ostatinfo;
                  CLOSE c_ostat;
                  oldamt :=
                        cm_utils.calcpercent (p_sum              => rests.rest,
                                              p_rate             => crdpercent,
                                              p_coefficient      => 1,
                                              p_delimmer         => 1
                                             )
                      * currencyostat;
                  debitaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  creditaccid := accounts.primaryreserveaccid;
                  tramount := ROUND (oldamt, 2);

                  IF    debitaccid IS NOT NULL
                     OR (creditaccid NOT IN (-1, 0, NULL))
                  THEN
                     firsttrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => tramount,
                                                            p_creditamount         => NULL,
                                                            p_lamount              => NULL,
                                                            p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                      || port.numberofcredit,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => currdate,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                  END IF;
               END IF;

               IF crdpercent NOT IN (6, 25)
               THEN
                  tramount :=
                        cm_utils.calcpercent (p_sum              => rests.rest,
                                              p_rate             => (  crdpercent
                                                                     - crdoldpercent
                                                                    ),
                                              p_coefficient      => 1,
                                              p_delimmer         => 1
                                             )
                      * currencyostat;
                  tramount := ROUND (tramount, 2);
                  /*-----------------First Transaction-----------------*/
                  debitaccid :=
                     cm_utils.lnkreserveaccount (p_custcategory      => port.customertype,
                                                 p_crdcurrency       => port.currency,
                                                 p_bankid            => port.branchid
                                                );
                  creditaccid := accounts.primaryreserveaccid;

                  IF     (tramount IS NOT NULL)
                     AND (tramount > 0)
                     AND (   (rests.duerest <> 0)
                          OR (rests.dueinterestrest <> 0)
                         )
                  THEN
                     firsttrid :=
                        cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                            p_debitid              => debitaccid,
                                                            p_creditid             => creditaccid,
                                                            p_debitamount          => tramount,
                                                            p_creditamount         => NULL,
                                                            p_lamount              => NULL,
                                                            p_trname               =>    'Ещтийатын йенилянмяси-MY '
                                                                                      || port.numberofcredit,
                                                            p_flags                => sb_decls.atfcommitimmediate,
                                                            p_transactiondate      => currdate,
                                                            p_operationtype        => cm_decls.cmtransactionoptype,
                                                            p_inbalancechar        => NULL
                                                           );
                  END IF;

                  UPDATE cm_curr_state
                     SET reserveid = (SELECT ID
                                        FROM cm_reserve_types
                                       WHERE PERCENT = crdpercent);

                  UPDATE cm_auto_res
                     SET resamt = tramount
                   WHERE creditid = port.ID AND resdate = currdate;

                  IF SQL%NOTFOUND
                  THEN
                     INSERT INTO cm_auto_res
                                 (creditid, resamt, resdate
                                 )
                          VALUES (port.ID, tramount, currdate
                                 );
                  END IF;
               END IF;
            END IF;
         END IF;

         COMMIT;
      END LOOP;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_AUTOEXP

-- Start of DDL Script for Package CREDITSMGR.CM_CALCINOUTBALANCE
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_calcinoutbalance
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

-- Start of DDL Script for Package CREDITSMGR.CM_CALCULATOR
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
            ANNUALYPENALTYRATE
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
                              p_Coefficient =>DateInterval
                             )
                       +
                       CM_UTILS.CalcPercent(
                              p_Sum => CrdCurrDueRest,
                              p_Rate => AnnOIntRate,
                              p_Coefficient =>CM_UTILS.BankDaysBetween(
                              FirstDate => BankCurrDate - 1,
                              LastDate => p_Date --BankCurrDate //New
                             )
                             )
                       +
                       DueIntPrec       
                       ;

                           
     update CM_INT_CURRSTATE
        set
            INTEREST = CalcedInterest ,
            DUEINTEREST = CalcedDueInterest ,
            TRPROCESSED = CM_DECLS.csCalculated
      where CreditID = p_CreditID;
    
    update CM_CURR_STATE -- // New
       set LASTCALCDATE = p_Date
     where CreditID = p_CreditID;  
    
    commit work;
                      
    exception when OTHERS then
    
    rollback work;
    
    raise;

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
                p_DebitID => DueIntAccID ,
                p_CreditID => InvAccID ,
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
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CALCULATOR

-- Start of DDL Script for Package CREDITSMGR.CM_COMMON
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_common
  IS 
  function AccountNumber_Get(p_ID in Integer)
  return varchar2;
  procedure SecurityLog(
            p_CreditID in Integer ,
            p_Event in VarChar2
            );
  function AccountRest_Get(p_ID in Integer)
  return
  
      Number;
      
 
  function Get_AccID(
              p_custid in integer,
              p_typeid in integer,
              p_defbalance in integer default 0/*=sb*/)
 return integer;
  function Get_LastIntPaydate(p_id in integer)
 return date;
  function Get_LastMainPaydate(p_id in integer)
 return date;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_common
IS

  function AccountNumber_Get(p_ID in Integer)
  return
  
      varchar2
      
  is
  
    cursor C_ACCOUNT(AccID in Integer) is
    select ACC_NO 
      from SB_Account 
     where ID=AccID;
  
  Result SB_ACCOUNT.ACC_NO%type;   
     
  begin
    
    open C_ACCOUNT(p_ID);
    fetch C_ACCOUNT into Result;
    close C_ACCOUNT;
    
    return Result;   
    
  end;     

  function AccountRest_Get(p_ID in Integer)
  return
  
      Number
       
  is
  
    cursor C_ACCREST(AccID in Integer) is
    select OSTAT
      from SB_TENOSTAT 
     where ACC_ID=AccID;
     
  Result Number := 0;  
     
  begin
    
    open C_ACCREST(p_ID);
    fetch C_ACCREST into Result;
    close C_ACCREST;
    
    return Result;   
    
  end;     
  
  
  procedure SecurityLog(
            p_CreditID in Integer ,
            p_Event in VarChar2
            )
  is
  begin
    
    insert into CM_SECURITYLOG(
    CreditID , Event
    ) 
    values(
    p_CreditID , p_Event
    );
    
  end;
    
 function Get_AccID(
              p_custid in integer,
              p_typeid in integer,
              p_defbalance in integer default 0/*=sb*/)
 return integer
 is
 
 cursor c_accid(cid in integer,ptid in integer)is
 SELECT   ac.id AS id
    FROM sb_account ac
   WHERE ac.kli_id = cid
   and
  (ac.bal_cn1 IN (SELECT accountnumber
                           FROM cm_aginfo
                          WHERE groupid = (SELECT g.id
                                             FROM cm_accountgroups g
                                            WHERE g.id = ptid)));
 
 cursor c_outaccid(cid in integer,ptid in integer)is
 SELECT  ac.id AS id
    FROM SBOUT_ACCOUNT ac
   WHERE ac.kli_id = cid
   and 
  (ac.bal_cn1 IN (SELECT accountnumber
                           FROM cm_aginfo
                          WHERE groupid = (SELECT g.id
                                             FROM cm_accountgroups g
                                            WHERE g.id = ptid)));
 Result integer;
  
 begin
   
   if p_defbalance = 0 then
      open c_accid(p_custid,p_typeid);
      fetch c_accid into Result;
      close c_accid;
   end if;

  if p_defbalance <> 0 then
      open c_outaccid(p_custid,p_typeid);
      fetch c_outaccid into Result;
      close c_outaccid;
   end if;
   
   return Result;
    
 end;
 
 function Get_LastIntPaydate(p_id in integer)
 return date
 is
 result date;
 begin
   select max(paydate) into result
   from cm_payments
   where creditid = p_id
   and payedamt = 0;
   return result;
 end;
  
 function Get_LastMainPaydate(p_id in integer)
 return date
 is
 result date;
 begin
   select max(paydate) into result
   from cm_payments
   where creditid = p_id
   and payedintamt = 0;
   return result;
 end;
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_COMMON

-- Start of DDL Script for Package CREDITSMGR.CM_COMMON_UTILS
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_common_utils AUTHID CURRENT_USER
IS
   FUNCTION cm_branchid_get (user_id INTEGER DEFAULT UID)
      RETURN NUMBER;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_common_utils
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_consts
  IS
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_consts
IS
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CONSTS

-- Start of DDL Script for Package CREDITSMGR.CM_CONTROL
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_control
IS
   TYPE cursor_type IS REF CURSOR;

   PROCEDURE open_cursor (cur OUT cursor_type, pstr IN VARCHAR2);
  PROCEDURE control(p_BrID in integer,p_dat in date);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_control
IS
   PROCEDURE control(p_BrID in integer,p_dat in date)
   IS
      CURSOR c_acc
      IS
         SELECT   loanaccid, interestaccid, dueloanaccid, dueinterestaccid,
                  COUNT (*) AS cnt
             FROM cm_accounts
            WHERE creditid IN (SELECT id
                                 FROM cm_active_credits where branchid=p_BrID)
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
           FROM cm_history
          WHERE creditid = p_crd
          and hdate=p_dat;

      CURSOR c_sm_rest (p_id IN INTEGER)
      IS
         SELECT ABS (ostat) AS ostat
           FROM smart.archost
          WHERE acc_id = p_id
          and datdate=p_dat;

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

         SELECT NAME
           INTO custname
           FROM cm_sb_customers
          WHERE id = custid;

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
                 VALUES (crdnum, custname, ABS (  smrest
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
   BEGIN
      INSERT INTO cm_tranches
                  (creditid, tranchedate, trancheamount)
           VALUES (p_creditid, p_tranchedate, p_trancheamount);

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
   BEGIN
      INSERT INTO cm_payments
                  (creditid, paydate, payedamt, payedintamt,
                   payeddueamt, payeddueintamt, payedpenaltyamt)
           VALUES (p_creditid, p_paydate, p_payedamt, p_payedintamt,
                   p_payeddueamt, p_payeddueintamt, 0);

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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_correct
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_credit
  IS
  
  procedure ContractAddInfo_Edit(
    p_CreditID in Integer,
    p_BoorowerID in VarChar2,
    p_Name in VarChar2,
    p_CountryCode in VarChar2,
    p_BankrupteyStatus in VarChar2,
    p_PhoneNumber in VarChar2,
    p_Address in VarChar2,
    p_FirstOwnerID in VarChar2,
    p_FirstOwnerName in VarChar2,
    p_SecondOwnerID in VarChar2,
    p_SecondOwnerName in VarChar2,
    p_ThirdOwnerID in VarChar2,
    p_ThirdOwnerName in VarChar2,
    
    p_Pledgename in VarChar2 ,                   
    p_Holdername in VarChar2 ,                   
    p_Holderaddress in VarChar2 ,                
    p_AnyInfoToDisting in VarChar2 ,             
    p_Registryno in VarChar2 ,                   
    p_RegistryAgency in VarChar2 ,               
    p_RegistryDate in Date ,                 
    p_PledgeInUse in Integer ,                   
    p_Pledgeinsurant in Integer ,                
    p_InsuranceAgency in VarChar2 ,               
    p_InsuranceAmount in Number ,               
    p_InsuranceDate in Date    
  );
  procedure Contract_Close(p_CreditID in Integer);
  procedure DisableInterestCalc(c_id in integer);
  procedure EnabledInterestCalc(c_id in integer);
  function  Portfolio_Add(
     p_Currency in Integer,
     p_BoorowerID in Integer,
     p_InitialAmount in Number default 0,
     p_CreditLineAmount in Number,
     p_AnnualyInterestRate in Number,
     p_AnnualyOverdueRate in Number,
     p_AnnualyPenaltyRate in Number,
     p_DateOfConclusion in Date,
     p_DateOfGrant in Date,
     p_DueDateFirstContract in Date,
     p_DueDateLastContract  in Date DEFAULT NULL,
     p_CloseDate  in Date,
     p_NumberOfCredit in VarChar2,
     p_PurposeOfCredit in VarChar2,
     p_CustomerType in Integer, 
     p_CreditType in Integer,
     p_PersonalType in Integer,
     p_AutoPayment in Integer,
     p_AutoExpire in Integer,
     p_UsrGroup in VarChar2,
     p_BranchID in Integer     
    ) return Integer;
  function  Portfolio_Edit(
     p_CreditID in integer,  
     p_Currency in Integer,
     p_BoorowerID in Integer,
     p_CreditLineAmount in Number,
     p_AnnualyInterestRate in Number,
     p_AnnualyOverdueRate in Number,
     p_AnnualyPenaltyRate in Number,
     p_DateOfConclusion in Date,
     p_DueDateFirstContract in Date,
     p_NumberOfCredit in VarChar2,
     p_PurposeOfCredit in VarChar2,
     p_CustomerType in Integer, 
     p_CreditType in Integer,
     p_PersonalType in Integer,
     p_AutoPayment in Integer,
     p_AutoExpire in Integer,
     p_UsrGroup in VarChar2,
     p_BranchID in Integer     
    ) return Integer;
  procedure IntPrevState_Add(
             p_CreditID in Integer ,
             p_Date in Date
            );
  procedure IntCurrState_Add(
             p_CreditID in Integer ,
             p_Date in Date
            );
  procedure History_Edit(
    p_CreditID in Integer,
    p_ReserveID in Number,
    p_DueReserveID in Number,    
    p_PledgePrice in Number,
    p_CreditLineAmount in Number        
  );
  procedure History_Add(
    p_CreditID in Integer,
    p_HDate in Date,
    p_ReserveID in Number,
    p_DueReserveID in Number,
    p_Obligation in Number,
    p_PledgePrice in Number,
    p_GivenAmount in Number
    
  );
  procedure Guarantee_Edit(
    p_CreditID in Integer ,
    p_PLEDGEID in Integer
  );
  procedure Guarantee_Add(
    p_CreditID in Integer ,
    p_PLEDGEID in Integer,
    p_Pledgename in VarChar2 default null,                   
    p_Holdername in VarChar2 default null,                   
    p_Holderaddress in VarChar2 default null,                
    p_AnyInfoToDisting in VarChar2 default null,             
    p_Registryno in VarChar2 default null,                   
    p_RegistryAgency in VarChar2 default null,               
    p_RegistryDate in Date default null,                 
    p_PledgeInUse in Integer default null,                   
    p_Pledgeinsurant in Integer default null,                
    p_InsuranceAgency in VarChar2 default null,               
    p_InsuranceAmount in Number default null,               
    p_InsuranceDate in Date default null                     
  );
  procedure BoorowerInfo_Edit(
    p_CreditID in Integer,
    p_Name in VarChar2
  );
  procedure BoorowerInfo_Add(
    p_CreditID in Integer,
    p_BoorowerID in VarChar2,
    p_Name in VarChar2,
    p_CountryCode in VarChar2 default null,
    p_BankrupteyStatus in VarChar2 default 0,
    p_PhoneNumber in VarChar2 default null,
    p_Address in VarChar2 default null,
    p_FirstOwnerID in VarChar2 default null,
    p_FirstOwnerName in VarChar2 default null,
    p_SecondOwnerID in VarChar2 default null,
    p_SecondOwnerName in VarChar2 default null,
    p_ThirdOwnerID in VarChar2 default null,
    p_ThirdOwnerName in VarChar2 default null   
  );
  procedure History_Edit1(
    p_CreditID in Integer,
    p_ReserveID in Number,
    p_DueReserveID in Number,    
    p_PledgePrice in Number,
    p_CreditLineAmount in Number        
  );
  procedure Accounts_Add(
    p_CreditID in Integer,
    p_BoorowerAccID in Integer,
    p_LoanAccID in Integer,
    p_DueLoanAccID in Integer,
    p_InterestAccID in Integer,
    p_DueInterestAccID in Integer,
    p_PrimaryReserveAccID in Integer,
    p_SecondaryReserveAccID in Integer,
    p_OutCollateralAccID in Integer,
    p_OutGuaranteeAccID in Integer,
    p_OutinterestAccID  in integer,
    p_CrdlineOblAccid   in integer
  );
  procedure Accounts_Edit(
    p_CreditID in Integer,
    p_BoorowerAccID in Integer,
    p_LoanAccID in Integer,
    p_DueLoanAccID in Integer,
    p_InterestAccID in Integer,
    p_DueInterestAccID in Integer,
    p_PrimaryReserveAccID in Integer,
    p_SecondaryReserveAccID in Integer,
    p_OutCollateralAccID in Integer,
    p_OutGuaranteeAccID in Integer,
    P_outinterestaccid  in integer,
    P_crdlineoblaccid      in integer
  );
  function Contract_Add(  
      Currency in Integer,
      BoorowerID in Integer,
      InitialAmount in Number default 0,
      CreditLineAmount in Number,
      AnnualyInterestRate in Number,
      AnnualyOverdueRate in Number,
      AnnualyPenaltyRate in Number,
      DateOfConclusion in Date,
      DueDateFirstContract in Date,
      NumberOfCredit in VarChar2,
      PurposeOfCredit in VarChar2,
      CustomerType in Integer, 
      CreditType in Integer,
      PersonalType in Integer,
      AutoPayment in Integer,
      AutoExpire in Integer,
      UsrGroup in VarChar2,
      BranchID in Integer,
            
      BoorowerAccID in Integer,
      LoanAccID in Integer,
      DueLoanAccID in Integer,
      InterestAccID in Integer,
      DueInterestAccID in Integer,
      PrimaryReserveAccID in Integer,
      SecondaryReserveAccID in Integer,
      OutCollateralAccID in Integer,
      OutGuaranteeAccID in Integer,
      outinterestaccid in integer,
      crdlineoblaccid in integer,
      
      ReserveID in Number,
      DueReserveID in Number,
      PledgePrice in Number,       
      
      PledgeID in Integer
      
        
  ) return
   
        Integer;
  function Contract_Edit(
      CreditID in Integer,  
      Currency in Integer,
      BoorowerID in Integer,
      CreditLineAmount in Number,
      AnnualyInterestRate in Number,
      AnnualyOverdueRate in Number,
      AnnualyPenaltyRate in Number,
      DateOfConclusion in Date,
      DueDateFirstContract in Date,
      NumberOfCredit in VarChar2,
      PurposeOfCredit in VarChar2,
      CustomerType in Integer, 
      CreditType in Integer,
      PersonalType in Integer,
      AutoPayment in Integer,
      AutoExpire in Integer,
      UsrGroup in VarChar2,
      BranchID in Integer,
            
      BoorowerAccID in Integer,
      LoanAccID in Integer,
      DueLoanAccID in Integer,
      InterestAccID in Integer,
      DueInterestAccID in Integer,
      PrimaryReserveAccID in Integer,
      SecondaryReserveAccID in Integer,
      OutCollateralAccID in Integer,
      OutGuaranteeAccID in Integer,
      outinterestaccid in integer,
      crdlineoblaccid in integer,
      
      ReserveID in Number,
      DueReserveID in Number,      
      PledgePrice in Number,       
      
      PledgeID in Integer
      
        
  ) return
   
        Integer;
  function GenerateAccountNumber(MainAccountNumber in varchar2,ConstVal in varchar2)                                 
 return varchar2;
  function Add_Account(  p_mainContr in boolean,
                         p_main_acc_no in varchar,
                         p_acc_no in varchar,
                         p_defReserve in integer default 0/*Ehtiyyat hesabini teyin etmek*/,
                         p_FlagBalance in integer default 0/*Balans ve ya VneBalans*/)
  return integer;
  procedure CloseCont_Account(p_id in integer,defCA in boolean);
  procedure CloseCont_Customers(p_id in integer,defCA in boolean);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_credit
IS  

            /*****************************************************/
            /*  Company : Smart Systems Technology ltd™          */
            /*  Author  : Asif N. Nazarov                        */
            /*  Date : 2003-2004                                 */
            /*****************************************************/
            
  function  Portfolio_Add(
     p_Currency in Integer,
     p_BoorowerID in Integer,
     p_InitialAmount in Number default 0,
     p_CreditLineAmount in Number,
     p_AnnualyInterestRate in Number,
     p_AnnualyOverdueRate in Number,
     p_AnnualyPenaltyRate in Number,
     p_DateOfConclusion in Date,
     p_DateOfGrant in Date,
     p_DueDateFirstContract in Date,
     p_DueDateLastContract  in Date DEFAULT NULL,
     p_CloseDate  in Date,
     p_NumberOfCredit in VarChar2,
     p_PurposeOfCredit in VarChar2,
     p_CustomerType in Integer, 
     p_CreditType in Integer,
     p_PersonalType in Integer,
     p_AutoPayment in Integer,
     p_AutoExpire in Integer,
     p_UsrGroup in VarChar2,
     p_BranchID in Integer     
    ) return Integer
  is
    Result Integer;
    
  begin
  
    insert into CM_ACTIVE_CREDITS(
      Currency,
      BoorowerID,
      InitialAmount,
      CreditLineAmount,
      AnnualyInterestRate,
      AnnualyOverdueRate,
      AnnualyPenaltyRate,
      DateOfConclusion,
      DateOfGrant,
      DueDateFirstContract,
      DueDateLastContract,
      CloseDate,
      NumberOfCredit,
      PurposeOfCredit,
      CustomerType, 
      CreditType,
      PersonalType,
      AutoPayment,
      AutoExpire,
      UsrGroup,
      BranchID,
      PartitionKey         
    )
    values (    
      p_Currency,
      p_BoorowerID,
      p_InitialAmount,
      p_CreditLineAmount,
      p_AnnualyInterestRate,
      p_AnnualyOverdueRate,
      p_AnnualyPenaltyRate,
      p_DateOfConclusion,
      p_DateOfGrant,
      p_DueDateFirstContract,
      p_DueDateLastContract,
      p_CloseDate,
      p_NumberOfCredit,
      p_PurposeOfCredit,
      p_CustomerType, 
      p_CreditType,
      p_PersonalType,
      p_AutoPayment,
      p_AutoExpire,
      p_UsrGroup,
      p_BranchID,
      0         
    ) returning ID into Result;
  
    return Result;
    
  end;

  function  Portfolio_Edit(
     p_CreditID in integer,  
     p_Currency in Integer,
     p_BoorowerID in Integer,
     p_CreditLineAmount in Number,
     p_AnnualyInterestRate in Number,
     p_AnnualyOverdueRate in Number,
     p_AnnualyPenaltyRate in Number,
     p_DateOfConclusion in Date,
     p_DueDateFirstContract in Date,
     p_NumberOfCredit in VarChar2,
     p_PurposeOfCredit in VarChar2,
     p_CustomerType in Integer, 
     p_CreditType in Integer,
     p_PersonalType in Integer,
     p_AutoPayment in Integer,
     p_AutoExpire in Integer,
     p_UsrGroup in VarChar2,
     p_BranchID in Integer     
    ) return Integer
  is
    Result Integer;
    
  begin
  
    update CM_ACTIVE_CREDITS
       set
          Currency = p_Currency,
          BoorowerID = p_BoorowerID,
          CreditLineAmount = p_CreditLineAmount,
          AnnualyInterestRate = p_AnnualyInterestRate,
          AnnualyOverdueRate = p_AnnualyOverdueRate,
          AnnualyPenaltyRate = p_AnnualyPenaltyRate,
          DateOfConclusion = p_DateOfConclusion,
          DueDateFirstContract = p_DueDateFirstContract,
          NumberOfCredit = p_NumberOfCredit,
          PurposeOfCredit = p_PurposeOfCredit,
          CustomerType = p_CustomerType, 
          CreditType = p_CreditType,
          PersonalType = p_PersonalType,
          AutoPayment = p_AutoPayment,
          AutoExpire = p_AutoExpire,
          UsrGroup = p_UsrGroup,
          BranchID = p_BranchID
   where ID = p_CreditID;       
   
   return p_CreditID;
    
  end;
  
  
  procedure Guarantee_Add(
    p_CreditID in Integer ,
    p_PLEDGEID in Integer,
    p_Pledgename in VarChar2 default null,                   
    p_Holdername in VarChar2 default null,                   
    p_Holderaddress in VarChar2 default null,                
    p_AnyInfoToDisting in VarChar2 default null,             
    p_Registryno in VarChar2 default null,                   
    p_RegistryAgency in VarChar2 default null,               
    p_RegistryDate in Date default null,                 
    p_PledgeInUse in Integer default null,                   
    p_Pledgeinsurant in Integer default null,                
    p_InsuranceAgency in VarChar2 default null,               
    p_InsuranceAmount in Number default null,               
    p_InsuranceDate in Date default null                     
  )
  is
  begin
    insert into CM_GUARANTEE(
      CreditID,
      PLEDGEID,
      PledgeName,                   
      HolderName,                   
      HolderAddress,                
      AnyInfoToDisting,             
      RegistryNo,                   
      RegistryAgency,               
      RegistryDate,                 
      PledgeInUse,                   
      Pledgeinsurant,                
      InsuranceAgency,               
      InsuranceAmount,               
      InsuranceDate                         
    )    
    values(
      p_CreditID,
      p_PLEDGEID,
      p_PledgeName,                   
      p_HolderName,                   
      p_HolderAddress,                
      p_AnyInfoToDisting,             
      p_RegistryNo,                   
      p_RegistryAgency,               
      p_RegistryDate,                 
      p_PledgeInUse,                   
      p_Pledgeinsurant,                
      p_InsuranceAgency,               
      p_InsuranceAmount,               
      p_InsuranceDate                         
    );
    
  end;

  procedure Guarantee_Edit(
    p_CreditID in Integer ,
    p_Pledgename in VarChar2 ,                   
    p_Holdername in VarChar2 ,                   
    p_Holderaddress in VarChar2 ,                
    p_AnyInfoToDisting in VarChar2 ,             
    p_Registryno in VarChar2 ,                   
    p_RegistryAgency in VarChar2 ,               
    p_RegistryDate in Date ,                 
    p_PledgeInUse in Integer ,                   
    p_Pledgeinsurant in Integer ,                
    p_InsuranceAgency in VarChar2 ,               
    p_InsuranceAmount in Number ,               
    p_InsuranceDate in Date 
  )
  is
  begin
    update CM_GUARANTEE
       set
          PledgeName = p_PledgeName,                   
          HolderName = p_HolderName,                   
          HolderAddress = p_HolderAddress,                
          AnyInfoToDisting = p_AnyInfoToDisting,             
          RegistryNo = p_RegistryNo,                   
          RegistryAgency = p_RegistryAgency,               
          RegistryDate = p_RegistryDate,                 
          PledgeInUse = p_PledgeInUse,                   
          Pledgeinsurant = p_Pledgeinsurant,                
          InsuranceAgency = p_InsuranceAgency,               
          InsuranceAmount = p_InsuranceAmount,               
          InsuranceDate = p_InsuranceDate
    where CreditID = p_CreditID;                                
    
  end;
  
  procedure IntCurrState_Add(
             p_CreditID in Integer ,
             p_Date in Date
            ) 
  is
  begin
    insert into cm_interests(partitionkey, creditid, hdate, interest, dueinterest, inttrid,
       dueinttrid, trprocessed)
    values (0,p_CreditID,p_Date,0,0,null,null,0);   
  end;
  
  procedure IntPrevState_Add(
             p_CreditID in Integer ,
             p_Date in Date
            ) 
  is
  begin
    insert into cm_interests(partitionkey, creditid, hdate, interest, dueinterest, inttrid,
       dueinttrid, trprocessed)
    values (1,p_CreditID,p_Date,0,0,null,null,0);   
  end;

  
  procedure Guarantee_Edit(
    p_CreditID in Integer ,
    p_PLEDGEID in Integer
  )
  is
  begin
  
    update CM_GUARANTEE
       set
          PLEDGEID = p_PLEDGEID
    where CreditID = p_CreditID;                                
    
  end;
  
  procedure BoorowerInfo_Add(
    p_CreditID in Integer,
    p_BoorowerID in VarChar2,
    p_Name in VarChar2,
    p_CountryCode in VarChar2 default null,
    p_BankrupteyStatus in VarChar2 default 0,
    p_PhoneNumber in VarChar2 default null,
    p_Address in VarChar2 default null,
    p_FirstOwnerID in VarChar2 default null,
    p_FirstOwnerName in VarChar2 default null,
    p_SecondOwnerID in VarChar2 default null,
    p_SecondOwnerName in VarChar2 default null,
    p_ThirdOwnerID in VarChar2 default null,
    p_ThirdOwnerName in VarChar2 default null   
  )
  is
  begin
    insert into CM_BOOROWERINFO(
      CreditID,
      BoorowerID,
      Name,
      CountryCode,
      BankrupteyStatus,
      PhoneNumber,
      Address,
      FirstOwnerID,
      FirstOwnerName,
      SecondOwnerID,
      SecondOwnerName,
      ThirdOwnerID,
      ThirdOwnerName       
    )
    values(
      p_CreditID,
      p_BoorowerID,
      p_Name,
      p_CountryCode,
      p_BankrupteyStatus,
      p_PhoneNumber,
      p_Address,
      p_FirstOwnerID,
      p_FirstOwnerName,
      p_SecondOwnerID,
      p_SecondOwnerName,
      p_ThirdOwnerID,
      p_ThirdOwnerName           
    ); 
    
  end;

  procedure BoorowerInfo_Edit(
    p_CreditID in Integer,
    p_BoorowerID in VarChar2,
    p_Name in VarChar2,
    p_CountryCode in VarChar2,
    p_BankrupteyStatus in VarChar2,
    p_PhoneNumber in VarChar2,
    p_Address in VarChar2,
    p_FirstOwnerID in VarChar2,
    p_FirstOwnerName in VarChar2,
    p_SecondOwnerID in VarChar2,
    p_SecondOwnerName in VarChar2,
    p_ThirdOwnerID in VarChar2,
    p_ThirdOwnerName in VarChar2   
  )
  is
  begin
    update CM_BOOROWERINFO
       set
          CreditID = p_CreditID,
          BoorowerID = p_BoorowerID,
          Name = p_Name,
          CountryCode = p_CountryCode,
          BankrupteyStatus = p_BankrupteyStatus,
          PhoneNumber = p_PhoneNumber,
          Address = p_Address,
          FirstOwnerID = p_FirstOwnerID,
          FirstOwnerName = p_FirstOwnerName,
          SecondOwnerID = p_SecondOwnerID,
          SecondOwnerName = p_SecondOwnerName,
          ThirdOwnerID = p_ThirdOwnerID,
          ThirdOwnerName = p_ThirdOwnerName
          
    where CreditID = p_CreditID;             
    
  end;

  procedure BoorowerInfo_Edit(
    p_CreditID in Integer,
    p_Name in VarChar2
  )
  is
  begin
    update CM_BOOROWERINFO
       set
          CreditID = p_CreditID,
          Name = p_Name
          
    where CreditID = p_CreditID;             
    
  end;

  
  procedure Accounts_Add(
    p_CreditID in Integer,
    p_BoorowerAccID in Integer,
    p_LoanAccID in Integer,
    p_DueLoanAccID in Integer,
    p_InterestAccID in Integer,
    p_DueInterestAccID in Integer,
    p_PrimaryReserveAccID in Integer,
    p_SecondaryReserveAccID in Integer,
    p_OutCollateralAccID in Integer,
    p_OutGuaranteeAccID in Integer,
    p_OutinterestAccID  in integer,
    p_CrdlineOblAccid   in integer
  )
  is
  begin
    insert into CM_ACCOUNTS(
      CreditID,
      BoorowerAccID,
      ContractAccID,
      LoanAccID,
      DueLoanAccID,
      InterestAccID,
      DueInterestAccID,
      PrimaryReserveAccID,
      SecondaryReserveAccID,
      OutCollateralAccID,
      OutGuaranteeAccID ,
      OutInterestAccID ,
      CrdlineOblAccID     
    )
    values (
      p_CreditID,
      p_BoorowerAccID,
      p_LoanAccID,
      p_LoanAccID,
      p_DueLoanAccID,
      p_InterestAccID,
      p_DueInterestAccID,
      p_PrimaryReserveAccID,
      p_SecondaryReserveAccID,
      p_OutCollateralAccID,
      p_OutGuaranteeAccID ,
      p_OutinterestAccID,
      P_CrdlineoblAccid     
    );
        
  end;

  procedure Accounts_Edit(
    p_CreditID in Integer,
    p_BoorowerAccID in Integer,
    p_LoanAccID in Integer,
    p_DueLoanAccID in Integer,
    p_InterestAccID in Integer,
    p_DueInterestAccID in Integer,
    p_PrimaryReserveAccID in Integer,
    p_SecondaryReserveAccID in Integer,
    p_OutCollateralAccID in Integer,
    p_OutGuaranteeAccID in Integer,
    P_outinterestaccid  in integer,
    P_crdlineoblaccid      in integer
  )
  is
  begin
    update CM_ACCOUNTS
       set
          BoorowerAccID = p_BoorowerAccID,
          LoanAccID = p_LoanAccID,
          ContractAccID = p_LoanAccID,
          DueLoanAccID = p_DueLoanAccID,
          InterestAccID = p_InterestAccID,
          DueInterestAccID = p_DueInterestAccID,
          PrimaryReserveAccID = p_PrimaryReserveAccID,
          SecondaryReserveAccID = p_SecondaryReserveAccID,
          OutCollateralAccID = p_OutCollateralAccID,
          OutGuaranteeAccID = p_OutGuaranteeAccID  ,
          outinterestaccid = p_outinterestaccid ,
          crdlineoblaccid = p_crdlineoblaccid   
    where CreditID = p_CreditID;
        
  end;
  
  procedure History_Add(
    p_CreditID in Integer,
    p_HDate in Date,
    p_ReserveID in Number,
    p_DueReserveID in Number,
    p_Obligation in Number,
    p_PledgePrice in Number,
    p_GivenAmount in Number
    
  )
  is
    PrevDate Date;
  begin
    
    select PRED_DAT
      into PrevDate
      from SB_SYSDAT;
    
    insert into CM_CURR_STATE(
      CreditID,
      HDate,
      LastCalcDate,
      StopCalcDate,
      Rest,
      InterestRest,
      DueRest,
      DueInterestRest,
      ReserveID,
      DueReserveID,
      GivenAmount,      
      Obligation,
      PledgePrice, 
      PartitionKey       
    )
    values(
      p_CreditID,
      p_HDate,
      p_HDate,
      null,
      0,
      0,
      0,
      0,
      p_ReserveID,
      p_DueReserveID,
      p_GivenAmount,      
      p_Obligation,
      p_PledgePrice,      
      0            
    );
    
    insert into CM_PREV_STATE(
      CreditID,
      HDate,
      LastCalcDate,
      StopCalcDate,
      Rest,
      InterestRest,
      DueRest,
      DueInterestRest,
      ReserveID,
      DueReserveID,
      Obligation,
      PledgePrice,
      PartitionKey              
    )
    values(
      p_CreditID,
      PrevDate,
      p_HDate,
      null,
      0,
      0,
      0,
      0,
      p_ReserveID,
      p_DueReserveID,
      p_Obligation,
      p_PledgePrice,
      1            
    );
    
  end;

  procedure History_Edit(
    p_CreditID in Integer,
    p_ReserveID in Number,
    p_DueReserveID in Number,    
    p_PledgePrice in Number,
    p_CreditLineAmount in Number        
  )
  is
  begin
    update CM_CURR_STATE
       set
          ReserveID = p_ReserveID,
          DueReserveID = p_DueReserveID,
          Obligation = p_CreditLineAmount - GivenAmount,
          PledgePrice = p_PledgePrice
    where CreditID = p_CreditID;      
        
  end;
  
  
   procedure History_Edit1(
    p_CreditID in Integer,
    p_ReserveID in Number,
    p_DueReserveID in Number,    
    p_PledgePrice in Number,
    p_CreditLineAmount in Number        
  )
  is
  begin
    update CM_CURR_STATE
       set
          ReserveID = p_ReserveID,
          DueReserveID = p_DueReserveID,
          PledgePrice = p_PledgePrice
    where CreditID = p_CreditID;      
        
  end;
  
   
  function Contract_Add(  
      Currency in Integer,
      BoorowerID in Integer,
      InitialAmount in Number default 0,
      CreditLineAmount in Number,
      AnnualyInterestRate in Number,
      AnnualyOverdueRate in Number,
      AnnualyPenaltyRate in Number,
      DateOfConclusion in Date,
      DueDateFirstContract in Date,
      NumberOfCredit in VarChar2,
      PurposeOfCredit in VarChar2,
      CustomerType in Integer, 
      CreditType in Integer,
      PersonalType in Integer,
      AutoPayment in Integer,
      AutoExpire in Integer,
      UsrGroup in VarChar2,
      BranchID in Integer,
            
      BoorowerAccID in Integer,
      LoanAccID in Integer,
      DueLoanAccID in Integer,
      InterestAccID in Integer,
      DueInterestAccID in Integer,
      PrimaryReserveAccID in Integer,
      SecondaryReserveAccID in Integer,
      OutCollateralAccID in Integer,
      OutGuaranteeAccID in Integer,
      outinterestaccid in integer,
      crdlineoblaccid in integer,
      
      ReserveID in Number,
      DueReserveID in Number,
      PledgePrice in Number,       
      
      PledgeID in Integer
      
        
  ) return
   
        Integer  
  is
    Name Varchar2(255);  
    Result Integer;
    ToDay  Date;
    Yesterday Date;
  begin
  
  select TEK_DAT , Pred_Dat 
    into Today ,Yesterday
    from SB_SYSDAT;
     
  Result 
    := Portfolio_Add(
        p_Currency=> Currency,
        p_BoorowerID=> BoorowerID,
        p_InitialAmount=> 0,--Initial Amount not defined
        p_CreditLineAmount=> CreditLineAmount,
        p_AnnualyInterestRate=> AnnualyInterestRate,
        p_AnnualyOverdueRate=> AnnualyOverdueRate,
        p_AnnualyPenaltyRate=> AnnualyPenaltyRate,
        p_DateOfConclusion=> DateOfConclusion,
        p_DateOfGrant=> null,
        p_DueDateFirstContract=> DueDateFirstContract,
 ---   --    p_DueDateLastContract=> NULL,
        p_CloseDate=> null,
        p_NumberOfCredit=> NumberOfCredit,
        p_PurposeOfCredit=> PurposeOfCredit,
        p_CustomerType=> CustomerType, 
        p_CreditType=> CreditType,
        p_PersonalType=> PersonalType,
        p_AutoPayment=> AutoPayment,
        p_AutoExpire=> AutoExpire,
        p_UsrGroup=> UsrGroup,
        p_BranchID=> BranchID    
      );

    Accounts_Add(
      p_CreditID=> Result,
      p_BoorowerAccID=> BoorowerAccID,
      p_LoanAccID=> LoanAccID,
      p_DueLoanAccID=> DueLoanAccID,
      p_InterestAccID=> InterestAccID,
      p_DueInterestAccID=> DueInterestAccID,
      p_PrimaryReserveAccID=> PrimaryReserveAccID,
      p_SecondaryReserveAccID=> SecondaryReserveAccID,
      p_OutCollateralAccID=> OutCollateralAccID,
      p_OutGuaranteeAccID=> OutGuaranteeAccID ,
      P_outinterestaccid =>outinterestaccid,
      P_crdlineoblaccid =>crdlineoblaccid   
    );

    History_Add(
      p_CreditID=> Result,
      p_HDate=> ToDay,
      p_ReserveID=> ReserveID,
      p_DueReserveID=>DueReserveID,
      p_Obligation=> CreditLineAmount,  --obligation
      p_PledgePrice=> PledgePrice,
      p_GivenAmount=> 0          
    );

    Guarantee_Add(
      p_CreditID=>Result,
      p_PLEDGEID=> PLEDGEID
    );

    select NAME
      into Name
      from CM_SB_CUSTOMERS
     where ID = BoorowerID;
    
    IntCurrState_Add(
      p_CreditID => Result ,
      p_Date => ToDay
    );
    
    IntPrevState_Add(
      p_CreditID => Result ,
      p_Date => Yesterday
    );
    
    BoorowerInfo_Add(
      p_CreditID=> Result,
      p_BoorowerID=> null,
      p_Name=> Name 
    );
   
    commit   work;
        
    return
     
      Result;
            
    exception  when others then
    
    rollback  work;
    
    raise;
    
  end;
  

  function Contract_Edit(
      CreditID in Integer,  
      Currency in Integer,
      BoorowerID in Integer,
      CreditLineAmount in Number,
      AnnualyInterestRate in Number,
      AnnualyOverdueRate in Number,
      AnnualyPenaltyRate in Number,
      DateOfConclusion in Date,
      DueDateFirstContract in Date,
      NumberOfCredit in VarChar2,
      PurposeOfCredit in VarChar2,
      CustomerType in Integer, 
      CreditType in Integer,
      PersonalType in Integer,
      AutoPayment in Integer,
      AutoExpire in Integer,
      UsrGroup in VarChar2,
      BranchID in Integer,
            
      BoorowerAccID in Integer,
      LoanAccID in Integer,
      DueLoanAccID in Integer,
      InterestAccID in Integer,
      DueInterestAccID in Integer,
      PrimaryReserveAccID in Integer,
      SecondaryReserveAccID in Integer,
      OutCollateralAccID in Integer,
      OutGuaranteeAccID in Integer,
      outinterestaccid in integer,
      crdlineoblaccid in integer,
      
      ReserveID in Number,
      DueReserveID in Number,      
      PledgePrice in Number,       
      
      PledgeID in Integer
      
        
  ) return
   
        Integer  
  is
    Name Varchar2(255);  
    Result Integer;
    ToDay  Date;
     
  begin
  
  select TEK_DAT 
    into Today
    from SB_SYSDAT;
    
  Result 
    := Portfolio_Edit(
        p_CreditID=> CreditID,
        p_Currency=> Currency,
        p_BoorowerID=> BoorowerID,
        p_CreditLineAmount=> CreditLineAmount,
        p_AnnualyInterestRate=> AnnualyInterestRate,
        p_AnnualyOverdueRate=> AnnualyOverdueRate,
        p_AnnualyPenaltyRate=> AnnualyPenaltyRate,
        p_DateOfConclusion=> DateOfConclusion,
        p_DueDateFirstContract=> DueDateFirstContract,
        p_NumberOfCredit=> NumberOfCredit,
        p_PurposeOfCredit=> PurposeOfCredit,
        p_CustomerType=> CustomerType, 
        p_CreditType=> CreditType,
        p_PersonalType=> PersonalType,
        p_AutoPayment=> AutoPayment,
        p_AutoExpire=> AutoExpire,
        p_UsrGroup=> UsrGroup,
        p_BranchID=> BranchID    
      );

    Accounts_Edit(
      p_CreditID=> Result,
      p_BoorowerAccID=> BoorowerAccID,
      p_LoanAccID=> LoanAccID,
      p_DueLoanAccID=> DueLoanAccID,
      p_InterestAccID=> InterestAccID,
      p_DueInterestAccID=> DueInterestAccID,
      p_PrimaryReserveAccID=> PrimaryReserveAccID,
      p_SecondaryReserveAccID=> SecondaryReserveAccID,
      p_OutCollateralAccID=> OutCollateralAccID,
      p_OutGuaranteeAccID=> OutGuaranteeAccID ,
      p_outinterestaccid => outinterestaccid,
      p_crdlineoblaccid =>crdlineoblaccid  
    );

    Guarantee_Edit(
      p_CreditID=> CreditID ,
      p_PLEDGEID=> PledgeID
      );

    select NAME
      into Name
      from CM_SB_CUSTOMERS
     where ID = BoorowerID;
     
    BoorowerInfo_Edit(
       p_CreditID=> CreditID ,
       p_Name=> Name
      );
       
      update CM_CURR_STATE
       set
          ReserveID = ReserveID,
          DueReserveID = DueReserveID,
          PledgePrice = PledgePrice
       where CreditID = CreditID;      
  
   History_Edit1(
        p_CreditID=> CreditID,
        p_ReserveID=> ReserveID,
        p_DueReserveID=> DueReserveID,
        p_PledgePrice=> PledgePrice,
        p_CreditLineAmount=> CreditLineAmount      
      );
   
    commit   work;
        
    return
     
      Result;
            
    exception  when others then
    
    rollback  work;
    
    raise;
    
  end;
  
  procedure ContractAddInfo_Edit(
    p_CreditID in Integer,
    p_BoorowerID in VarChar2,
    p_Name in VarChar2,
    p_CountryCode in VarChar2,
    p_BankrupteyStatus in VarChar2,
    p_PhoneNumber in VarChar2,
    p_Address in VarChar2,
    p_FirstOwnerID in VarChar2,
    p_FirstOwnerName in VarChar2,
    p_SecondOwnerID in VarChar2,
    p_SecondOwnerName in VarChar2,
    p_ThirdOwnerID in VarChar2,
    p_ThirdOwnerName in VarChar2,
    
    p_Pledgename in VarChar2 ,                   
    p_Holdername in VarChar2 ,                   
    p_Holderaddress in VarChar2 ,                
    p_AnyInfoToDisting in VarChar2 ,             
    p_Registryno in VarChar2 ,                   
    p_RegistryAgency in VarChar2 ,               
    p_RegistryDate in Date ,                 
    p_PledgeInUse in Integer ,                   
    p_Pledgeinsurant in Integer ,                
    p_InsuranceAgency in VarChar2 ,               
    p_InsuranceAmount in Number ,               
    p_InsuranceDate in Date    
  ) 
  is
  begin
  
    BoorowerInfo_Edit(
        p_CreditID => p_CreditID,
        p_BoorowerID => p_BoorowerID,
        p_Name => p_Name,
        p_CountryCode => p_CountryCode,
        p_BankrupteyStatus => p_BankrupteyStatus,
        p_PhoneNumber => p_PhoneNumber,
        p_Address => p_Address,
        p_FirstOwnerID => p_FirstOwnerID,
        p_FirstOwnerName => p_FirstOwnerName,
        p_SecondOwnerID => p_SecondOwnerID,
        p_SecondOwnerName => p_SecondOwnerName,
        p_ThirdOwnerID => p_ThirdOwnerID,
        p_ThirdOwnerName => p_ThirdOwnerName    
    );
    
    Guarantee_Edit(
        p_CreditID => p_CreditID,
        p_Pledgename => p_Pledgename,                   
        p_Holdername => p_Holdername,                   
        p_Holderaddress => p_Holderaddress,                
        p_AnyInfoToDisting => p_AnyInfoToDisting,             
        p_Registryno => p_Registryno,                   
        p_RegistryAgency => p_RegistryAgency,               
        p_RegistryDate => p_RegistryDate,                 
        p_PledgeInUse => p_PledgeInUse,                   
        p_Pledgeinsurant => p_Pledgeinsurant,                
        p_InsuranceAgency => p_InsuranceAgency,               
        p_InsuranceAmount => p_InsuranceAmount,               
        p_InsuranceDate => p_InsuranceDate       
    );
    
    commit work;
    
    exception when OTHERS then
    
    rollback work;
    
    raise;
    
  end;
  
  procedure Contract_Close(p_CreditID in Integer)
  is
   
   cursor c_CreditRest(p_id in integer) is
   select rest,duerest,interestrest,dueinterestrest
   from cm_curr_state
   where creditid = p_id;
     
   CreditRest c_CreditRest%rowtype;  
  begin
  
  open c_CreditRest(p_CreditID);
  fetch c_CreditRest into CreditRest;
  close c_CreditRest;
  
  if (CreditRest.rest <> 0)or(CreditRest.interestrest <> 0)or
     (CreditRest.duerest <> 0)or(CreditRest.dueinterestrest<>0) then
     raise_application_error(-20007,'Contract has rest!,because can not close');
  end if;
    update CM_ACTIVE_CREDITS
       set CLOSEDATE = (select TEK_DAT from SB_SYSDAT) ,
           PartitionKey = 1 
     where ID = p_CreditID;
     
     commit work;
           
  end;
  
  procedure EnabledInterestCalc(c_id in integer)
  is
   CurrentDat Date;
  begin
     select tek_dat into CurrentDat from sb_sysdat;
     update cm_history
     set  stopcalcdate = CurrentDat
     where (creditid = c_id) and (partitionkey = 0);
     commit;
  end;
  
  procedure DisableInterestCalc(c_id in integer)
  is
  begin
     update cm_history
     set stopcalcdate = null
     where (creditid = c_id) and (partitionkey = 0);
     commit;
  end;
  
 function GenerateAccountNumber(MainAccountNumber in varchar2,ConstVal in varchar2)                                 
 return varchar2
  
  is
  
   cursor c_acc(p_accno in varchar2) is
   select 
     kli_id,
     val_acc,
     name,
     bal_cn1,
     filial
   from sb_account
   where acc_no = p_accno;    
  
   cursor c_ball_acc(p_ball in integer) is
   select id, bal_acc from cm_generatechildaccounts
   where genid = (select id from cm_generatemainaccounts 
   where bal_acc = p_ball and name = ConstVal);
   
   cursor c_AccCount(p_kli_id in integer) is
   select count(*) as cnt
   from sb_account 
   where kli_id = p_kli_id;
   
   accinfo c_acc%rowtype;
   ball_accinfo c_ball_acc%rowtype; 
   AccCountInfo c_AccCount%rowtype;
   
   AccCount integer; 
   Result varchar2(60);
   CountL integer;
   Ch     varchar2(15);
    
  begin
     CountL := LENGTH(MainAccountNumber)-4;
     ch := SubStr(MainAccountNumber,5,CountL);
     open c_acc(MainAccountNumber);
     fetch c_acc into accinfo;
     close c_acc;
     
     open c_AccCount(accinfo.kli_id);
     fetch c_AccCount into AccCountInfo;
     close c_AccCount;
     
     open c_ball_acc(accinfo.bal_cn1);
     fetch c_ball_acc into ball_accinfo;
     close c_ball_acc;
    
     Result := ball_accinfo.bal_acc||ch;
               --accinfo.val_acc||
               --accinfo.kli_id||
              -- (nvl(AccCountInfo.cnt,0)+1)||
              -- accinfo.filial;
     return result;          
  end;                              
   
  function Add_Account(  p_mainContr in boolean,
                         p_main_acc_no in varchar,
                         p_acc_no in varchar,
                         p_defReserve in integer default 0/*Ehtiyyat hesabini teyin etmek*/,
                         p_FlagBalance in integer default 0/*Balans ve ya VneBalans*/)
  return integer
  is
  
   cursor c_Eaccount_Sb(CustID in integer,Balcn in integer)is
   select acc_no from sb_account
   where Kli_ID = CustID and bal_cn1 = Balcn;
   
   cursor c_Eaccount_SbOut(CustID in integer,Balcn in integer)is
   select acc_no from sbOut_account
   where Kli_ID = CustID and bal_cn1 = Balcn;
   
   cursor c_usid_outB(p_name in varchar)is
   select id from sbout_user$
   where name = p_name;
   
   op_id integer;
   Kli_ID integer;
   Curr_ID integer;
   name varchar2(80);
   open_dat date;
   balcn integer;
   defOpAcc boolean;
   UsrName varchar2(25);
   Result integer;
   
   tempAcc c_Eaccount_SbOut%Rowtype;
   usid_outB c_usid_outB%Rowtype;  
  
  begin

    if p_mainContr then

     select name into UsrName from sb_user$ 
     where id = uid;

     if p_FlagBalance = 0 then
       
     select kli_id,name into Kli_id,name from sb_account
     where acc_no = p_main_acc_no;
     
     select val_acc into Curr_ID from sb_account
     where acc_no = p_main_acc_no;
     
     select uid into op_id from dual;   
     
     select name into UsrName from sb_user$ 
     where id = uid;
     
     balcn := to_number(SubStr(p_acc_no,0,4));

     select Tek_Dat into Open_dat from sb_sysdat;
        
        open c_Eaccount_Sb(Kli_id,balcn);
        fetch c_Eaccount_Sb into tempAcc;
        DefOpAcc := (c_Eaccount_Sb%found);
        close c_Eaccount_Sb;
        
        if p_defReserve <> 0 then
           Curr_ID := 0;/*AZM*/
        end if; 
        
        if not DefOpAcc then
          Result:= sbop.add_account(
                customerid =>kli_id,
                op_id => op_id,
                accno => p_acc_no,
                currencyid =>Curr_ID,
                name =>name,
                open_dat =>Open_dat,
                balcn =>balcn,
                filial=>smart.sb_aca.getuserfilial());
        end if;
         
     end if;
          
     if p_FlagBalance <> 0 then
  
     open c_usid_outB(UsrName);
     fetch c_usid_outB into usid_outB;
     close c_usid_outB;
     
     if usid_outB.ID is null then
        select id into op_id from sb_user$
        where name = 'CREDITSMGR';
        else
          op_id := usid_outB.ID;
          
     end if; 
     
     select kli_id,name into Kli_id,name from sb_account
     where acc_no = p_main_acc_no;
     
     select val_acc into Curr_ID from sb_account
     where acc_no = p_main_acc_no;
     
     select Tek_Dat into Open_dat from sbout_sysdat;
     
     balcn := to_number(SubStr(p_acc_no,0,5));
        open c_Eaccount_SbOut(Kli_id,balcn);
        fetch c_Eaccount_SbOut into tempAcc;
        DefOpAcc := (c_Eaccount_SbOut%found);
        close c_Eaccount_SbOut;
        
        if p_defReserve <> 0 then
           Curr_ID := 0;/*AZM*/
        end if; 
        
        if not DefOpAcc then
          Result:= sbopout.add_account(
                customerid =>kli_id,
                op_id => op_id,
                accno => p_acc_no,
                currencyid =>Curr_ID,
                name =>name,
                open_dat =>Open_dat,
                balcn =>balcn,
                filial =>0/*smart.sb_aca.getuserfilial@sbout*/);
        end if;
         
     end if;
     end if;

      Commit work;
     
     return nvl(result,0);     
  end;
     
  procedure CloseCont_Account(p_id in integer,defCA in boolean)
  is
  begin
     if defCA then
     smart.sbop.close_account(p_id,1);
     end if;
  end;   
  
  procedure CloseCont_Customers(p_id in integer,defCA in boolean)
  is

   cursor c_CustAcc(p_CId in integer) is
   select count(*)
   from sb_account
   where kli_id = p_id and close_dat is null;
   
   Cnt number;
   result number;
   currdat date;
   
  begin
    
    if defCA then
    select tek_dat into currdat from sb_sysdat;
    open c_CustAcc(p_id);
    fetch  c_CustAcc into Cnt;
    close c_CustAcc;
    if Cnt <>0 then raise_application_error(-20007,'Cannot close Customer because');
    end if;
    smart.sbop.close_customer(p_id,currdat,result);
    end if;
  end;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_CREDIT

-- Start of DDL Script for Package CREDITSMGR.CM_DECA
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_deca
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
    
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_DECA

-- Start of DDL Script for Package CREDITSMGR.CM_DECLS
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_decls
  IS
  
   -- CM Common Declarations 
   lnkInterestAccount   constant varchar2(32) := 'lnkInterestAccount';
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
   
   AcgCustType constant varchar2(29) := 'Жари  щесаб'; 
   AcgresType constant varchar2(29) := 'Ади ещтийат щесабы';
   AcgIntType constant varchar2(29) := 'Фаиз щесабы';
   AcgDueLoanType constant varchar2(29) := 'Эежикмиш ссуда щесабы';
   AcgDueResType constant varchar2(29) := 'Мягсядли ещтийат щесабы';
   AcgDueIntType constant varchar2(29) := 'Эежикмиш фаиз щесабы';
   AcgPlgType constant varchar2(29) := 'Б.К. Эиров Щесабы';
   AcgOblType constant varchar2(29) := 'Б.К. Ющдялик Щесабы';
   AcgOutIntType constant varchar2(29) :='Б.К. Фаиз щесабы';
   AcgCrdLineType constant varchar2(29) := 'К.Х.Ю.М Ещтийат';

   	atfCommitImmediate	constant integer := 8;
	atfTemporary constant integer := 0;

   -- VID_OP   
   cmTransactionOpType constant integer := 86;

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
PACKAGE BODY            creditsmgr.cm_decls
IS
  
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_DECLS

-- Start of DDL Script for Package CREDITSMGR.CM_EXCEL_IMPORTER
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_excel_importer
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_expire
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
         cm_transactionmgr.cm_commitdelayedtransactions ;
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_INT_PLACEOUTBALANCE

-- Start of DDL Script for Package CREDITSMGR.CM_N3_SD
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_n3_sd
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
           BRANCHID
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
      
      ResultMainDebtTrID Integer;
      ResultPReserveTrID Integer;
      ResultSReserveTrID Integer;
      ResultOUTOblIncreaseTrID Integer;
      ResultIntDebtTrID Integer;
      ResultDueDebtTrID Integer;
      ResultDueIntDebtTrID Integer;
       
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
    
    if Payment.OUTTRIDOBLIGATION is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.OUTTRIDOBLIGATION, False) then
      Temp := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(Payment.OUTTRIDOBLIGATION);
    end if;
      OblDecriseAmt := Payment.PAYEDAMT; 
    end if;

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

-- Start of DDL Script for Package CREDITSMGR.CM_PAYMENT_
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_payment_
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
PACKAGE BODY creditsmgr.cm_payment_
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
           CREDITLINEAMOUNT,
           BRANCHID
      from CM_ACTIVE_CREDITS     
     where ID = CrdID;
     
     cursor c_HistoryInfo(CrdID in Integer) is
     select REST ,
            DUEREST ,
            INTERESTREST ,
            DUEINTERESTREST ,
            Obligation ,
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
             OUTGUARANTEEACCID,
             CRDLINEOBLACCID 
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
      Crdinfo c_CreditType%rowtype;   
         
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
      OblAccID integer;
      
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
      TempObl number;
      
      ResultMainDebtTrID Integer;
      ResultPReserveTrID Integer;
      ResultSReserveTrID Integer;
      ResultOUTOblIncreaseTrID Integer;
      ResultIntDebtTrID Integer;
      ResultDueDebtTrID Integer;
      ResultDueIntDebtTrID Integer;
      ResultOblTrID integer;
       
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
       OblAccID := CrdAccs.CRDLINEOBLACCID;
     close c_Accounts;
     
     open c_ReserveRate(CrdPReserveID);
     fetch c_ReserveRate into ReserveRate;
       CrdPReserveRate := ReserveRate.PERCENT;
     close c_ReserveRate;

     open c_ReserveRate(CrdSReserveID);
     fetch c_ReserveRate into ReserveRate;
       CrdSReserveRate := ReserveRate.PERCENT;
     close c_ReserveRate;  
     
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
           p_sum =>  HistInfo.REST - p_MainDebt,
           p_rate => CrdPReserveRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         );
         
         
         TrAmt := /*archostinfo.pok_ostat -*/ 
                  Round(TrAmt * CrcyRate ,2);
          
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
           p_sum => histinfo.DUEREST - p_DueDebt ,
           p_rate => CrdSReserveRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         );

         TrAmt := /*archostinfo.pok_ostat-*/ Round(TrAmt * CrcyRate ,2);
          
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
     
     
  /*------------    Transaction Oblications  --------*/   

        if p_MainDebt <> 0 then
        /*open c_archost(CrdAccs.CrdLineOblAccID);
        fetch c_archost into archostinfo;
        close c_archost;*/
  
        open c_creditType(portfinfo.credittype);
        fetch c_creditType into Crdinfo;
        close c_creditType;

        if Crdinfo.description = 'Кредит хятти бярпаолунан' then
        TempObl := 
         CM_UTILS.CalcPercent(
         p_sum => (PortfInfo.CREDITLINEAMOUNT - (HistInfo.Rest -p_MainDebt)),
         p_rate => CrdPReserveRate ,
         p_coefficient => 1 ,
         p_delimmer => 1
         )*rates.ostat /*- archostinfo.pok_ostat*/;
        
   --  raise_application_error(-20007,'ewfwe=='||(PortfInfo.CREDITLINEAMOUNT - (HistInfo.Rest -p_MainDebt)));
       DebitAccID := 
        CM_UTILS.InkCrdlineOblAccount(
           p_custcategory => PortfInfo.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfo.CURRENCY ,
           p_bankid => PortfInfo.BRANCHID
          );
              
        CreditAccID := CrdAccs.CrdLineOblAccID;
        
       TrDescription := 'Ющтялийин гиймятляндирилмяси № '|| PortfInfo.numberofcredit/*CM_UTILS.trDescObligationReduce()*/;
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
       TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_Date,'DD/MM/YYYY'));
        
        ResultOblTrID :=
        CM_TRANSACTIONMGR.CM_TransactionAdd(
           p_trid => null ,
           p_debitaccid => DebitAccID ,
           p_creditaccid => CreditAccID ,
           p_debitamount => TempObl ,
           p_creditamount => null ,
           p_natamount => null ,
           p_flags => CM_DECLS.cmTrFlaginBalance ,
           p_optype => CM_DECLS.cmTransactionOpType ,
           p_inbalancechar => null ,
           p_trdate => p_Date ,
           p_trdescription => TrDescription 
          );

     end if;
     end if;
          
     update CM_CURR_STATE
        set REST = REST - p_MainDebt ,
            INTERESTREST = INTERESTREST - p_MainInterest ,
            DUEREST = DUEREST - p_DueDebt ,
            DUEINTERESTREST = DUEINTERESTREST - p_DueInterest ,
            OBLIGATION = OBLIGATION + OblIncreaseAmt
      where CREDITID = p_CreditID;    
      
      insert into cm_paymentS(
        creditid, paydate, payedamt, payedintamt, payeddueamt,
        payeddueintamt, payedpenaltyamt, tridamt, tridintamt, triddueamt,
        triddueintamt, tridpenaltyamt, tridprimreserve, tridsecreserve,
        outtridobligation,TrObligation
        )
      values(
        p_CreditID, p_Date, p_MainDebt, p_MainInterest, p_DueDebt,
        p_DueInterest, 0, ResultMainDebtTrID, ResultIntDebtTrID, ResultDueDebtTrID,
        ResultDueIntDebtTrID, null, ResultPReserveTrID, ResultSReserveTrID,
        ResultOUTOblIncreaseTrID,ResultOblTrID 
      );
          
   end;
   
   procedure CommitPayment(
             DoCommit in Boolean default True
   )
   is
   begin
     if  DoCommit  then
       CM_TRANSACTIONMGR.CM_CommitDelayedTransactions;
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
           OUTTRIDOBLIGATION ,
           TROBLIGATION    
      from cm_paymentS
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
    
    if Payment.OUTTRIDOBLIGATION is not null then
    if CM_TRANSACTIONMGR.TransactionExist(Payment.OUTTRIDOBLIGATION, False) then
      Temp := CM_TRANSACTIONMGR.SBOUTDeleteTransaction(Payment.OUTTRIDOBLIGATION);
    end if;
      OblDecriseAmt := Payment.PAYEDAMT; 
    end if;

    if Payment.TROBLIGATION is not null then 
    if CM_TRANSACTIONMGR.TransactionExist(Payment.TROBLIGATION, true) then
      Temp := CM_TRANSACTIONMGR.SBDeleteTransaction(Payment.TROBLIGATION);
    end if;
--      OblDecriseAmt := Payment.PAYEDAMT; 
    end if;

    -- Rolling Back Payment
    
     update CM_CURR_STATE
        set REST = REST + Payment.PAYEDAMT ,
            INTERESTREST = INTERESTREST + Payment.PAYEDINTAMT ,
            DUEREST = DUEREST + Payment.PAYEDDUEAMT ,
            DUEINTERESTREST = DUEINTERESTREST + Payment.PAYEDDUEINTAMT ,
            OBLIGATION = OBLIGATION - OblDecriseAmt
      where CREDITID = Payment.CreditID;    
    
    delete from cm_paymentS where ID = p_PaymentID;
    
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


-- End of DDL Script for Package CREDITSMGR.CM_PAYMENT_

-- Start of DDL Script for Package CREDITSMGR.CM_PROLONGATION
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_prolongation
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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

      CURSOR c_res_contr (crdid IN INTEGER)
      IS
         SELECT resprecision, dueresprecision, restrid, duerestrid
           FROM cm_reserves_contr
          WHERE creditid = crdid;

      histinfo             c_credithist%ROWTYPE;
      reserve              c_reserve%ROWTYPE;
      portfinfo            c_portfinfo%ROWTYPE;
      currcurrrate         c_currrate%ROWTYPE;
      prevcurrrate         c_currrate%ROWTYPE;
      bankdate             c_sysdat%ROWTYPE;
      accinforec           c_accounts%ROWTYPE;
      res_contr            c_res_contr%ROWTYPE;
      
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
    
      OPEN c_res_contr (p_creditid);
      FETCH c_res_contr INTO res_contr;
      CLOSE c_res_contr;
     
      resprec := res_contr.resprecision;
      dueresprec := res_contr.dueresprecision;
     
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

      UPDATE cm_reserves_contr
         SET resprecision = NVL (cm_utils.precision7 (trpramt), 0),
             dueresprecision = NVL (cm_utils.precision7 (trpramt), 0),
             restrid = tempprtrid,
             duerestrid = tempsectrid
       WHERE creditid = p_creditid;

      COMMIT WORK;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESERVE_CONTR

-- Start of DDL Script for Package CREDITSMGR.CM_RESERVE_COUNT_NEW
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_reserve_count_new
IS
   PROCEDURE reserve_contr_new (p_creditid IN INTEGER);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_reserve_count_new
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_reserve_refresh
IS
   PROCEDURE refreshreserve (p_creditid IN INTEGER);

   PROCEDURE finish_resfresh (p_id IN INTEGER);

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE, p_id IN INTEGER);
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_reserve_refresh
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
         SELECT rest, duerest, reserveid, duereserveid, oldreserveid,
                oldduereserveid
           FROM cm_history
          WHERE creditid = p_id AND hdate = (SELECT tek_dat
                                               FROM sb_sysdat);

      CURSOR c_account (p_id IN INTEGER)
      IS
         SELECT primaryreserveaccid, secondaryreserveaccid,
                oldprimaryreserveaccid, oldsecondaryreseveaccid
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

      portinfo          c_port%ROWTYPE;
      accountinfo       c_account%ROWTYPE;
      restinfo          c_rest%ROWTYPE;
      currostat         c_currostat%ROWTYPE;
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
         OPEN c_res (restinfo.oldreserveid);
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
             AND (restinfo.reserveid <> restinfo.oldreserveid)
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

         IF      (   accountinfo.primaryreserveaccid =
                                            accountinfo.oldprimaryreserveaccid
                  OR accountinfo.oldprimaryreserveaccid IS NULL
                 )
             AND (restinfo.reserveid <> restinfo.oldreserveid)
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
             oldsecondaryreseveaccid = secondaryreserveaccid
       WHERE creditid = p_id;

      UPDATE cm_history
         SET oldreserveid = reserveid,
             oldduereserveid = duereserveid
       WHERE creditid = p_id AND hdate = (SELECT tek_dat
                                            FROM sb_sysdat);
   END;

   PROCEDURE committr (defcommit BOOLEAN DEFAULT TRUE, p_id IN INTEGER)
   IS
   BEGIN
      IF defcommit
      THEN
         cm_transactionmgr.cm_commitdelayedtransactions (1);
         finish_resfresh (p_id);
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESERVE_REFRESH

-- Start of DDL Script for Package CREDITSMGR.CM_RESREVE_CONTROL
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_resreve_control
IS
   PROCEDURE reserve_contr;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_resreve_control
IS
   PROCEDURE reserve_contr
   IS
   BEGIN
      DECLARE
         CURSOR c_acc
         IS
            SELECT   loanaccid, dueloanaccid, primaryreserveaccid,
                     secondaryreserveaccid
                FROM cm_accounts
               WHERE creditid IN (SELECT ID
                                    FROM cm_active_credits
                                   WHERE branchid=0)
            GROUP BY loanaccid,
                     dueloanaccid,
                     primaryreserveaccid,
                     secondaryreserveaccid;

         CURSOR c_port (p_id IN INTEGER)
         IS
            SELECT ID, numberofcredit, currency, customertype, branchid
              FROM cm_portfolio
             WHERE ID IN (SELECT creditid
                            FROM cm_accounts
                           WHERE loanaccid = p_id);

         CURSOR c_rest (p_id IN INTEGER)
         IS
            SELECT rest, duerest, reserveid, duereserveid
              FROM cm_curr_state
             WHERE creditid = p_id;

         CURSOR c_ostat (val IN INTEGER)
         IS
            SELECT ostat
              FROM sb_temprate
             WHERE val_kod = val;

         CURSOR c_sm_ostat (p_id IN INTEGER)
         IS
            SELECT ostat
              FROM sb_tenostat
             WHERE acc_id = p_id;

         CURSOR c_res (p_id IN INTEGER)
         IS
            SELECT PERCENT
              FROM cm_reserve_types
             WHERE ID = p_id;

         sm_ostat        c_sm_ostat%ROWTYPE;
         restinfo        c_rest%ROWTYPE;
         ostatinfo       c_ostat%ROWTYPE;
         resinfo         c_res%ROWTYPE;
         srest           NUMBER;
         sduerest        NUMBER;
         custtype        NUMBER;
         filial          NUMBER;
         currencytype    NUMBER;
         numcredit       VARCHAR2 (50);
         factresamt      NUMBER;
         duefactresamt   NUMBER;
         tramt           NUMBER;
         debitaccid      NUMBER;
         creditaccid     NUMBER;
         trdescription   VARCHAR2 (80);
         currdate        DATE;
         temptrid        NUMBER;
      BEGIN
         SELECT tek_dat
           INTO currdate
           FROM sb_sysdat;

         FOR acc IN c_acc
         LOOP
            srest := 0;
            sduerest := 0;

            FOR port IN c_port (acc.loanaccid)
            LOOP
               custtype := port.customertype;
               filial := port.branchid;
               currencytype := port.currency;
               numcredit := port.numberofcredit;
               OPEN c_rest (port.ID);
               FETCH c_rest INTO restinfo;
               CLOSE c_rest;
               OPEN c_res (restinfo.reserveid);
               FETCH c_res INTO resinfo;
               CLOSE c_res;
               srest := srest + restinfo.rest * resinfo.PERCENT / 100;
               OPEN c_res (restinfo.duereserveid);
               FETCH c_res INTO resinfo;
               CLOSE c_res;
               sduerest :=
                           sduerest
                           + restinfo.duerest * resinfo.PERCENT / 100;
            END LOOP;

            OPEN c_ostat (currencytype);
            FETCH c_ostat INTO ostatinfo;
            CLOSE c_ostat;
            OPEN c_sm_ostat (acc.primaryreserveaccid);
            FETCH c_sm_ostat INTO sm_ostat;
            CLOSE c_sm_ostat;
            factresamt := srest * ostatinfo.ostat;

            IF factresamt > 0
            THEN
               tramt := factresamt - sm_ostat.ostat;

               IF tramt <> 0
               THEN --1
                  IF tramt > 0
                  THEN --2
                     debitaccid :=
                        cm_utils.lnkreserveaccount (p_custcategory      => custtype,
                                                    p_crdcurrency       => currencytype,
                                                    p_bankid            => filial
                                                   );
                     creditaccid := acc.primaryreserveaccid;
                  ELSE
                     debitaccid := acc.primaryreserveaccid;
                     creditaccid :=
                        cm_utils.lnkreserveaccount (p_custcategory      => custtype,
                                                    p_crdcurrency       => currencytype,
                                                    p_bankid            => filial
                                                   );
                  END IF;

                  tramt := ROUND (ABS (tramt), 2);
                  trdescription :=
                           'Кредит цзря ещтиййатын дяйишилмяси  №'
                           || numcredit;
                  trdescription :=
                     REPLACE (trdescription, cm_decls.trdescnumber, numcredit);
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescdate,
                              TO_CHAR (currdate, 'DD/MM/YYYY')
                             );
                  DBMS_OUTPUT.put_line (   'CreditID = '
                                        || creditaccid
                                        || 'debitid = '
                                        || debitaccid
                                       );
                 if (debitaccid is not null) and(debitaccid not in(-1,0)) and 
                     (creditaccid is not null) and (creditaccid not in(-1,0)) then                     
                  temptrid :=
                     cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                         p_debitid              => debitaccid,
                                                         p_creditid             => creditaccid,
                                                         p_debitamount          => tramt,
                                                         p_creditamount         => tramt,
                                                         p_lamount              => tramt,
                                                         p_flags                => 8/*sb_decls.atfcommitimmediate*/,
                                                         p_operationtype        => cm_decls.cmtransactionoptype,
                                                         p_inbalancechar        => NULL,
                                                         p_transactiondate      => currdate,
                                                         p_trname               => trdescription
                                                        );
               end if;                                         
               END IF;
            END IF; --2

/*----------------------------------------------------------*/
            OPEN c_sm_ostat (acc.secondaryreserveaccid);
            FETCH c_sm_ostat INTO sm_ostat;
            CLOSE c_sm_ostat;
            factresamt := sduerest * ostatinfo.ostat;

            IF factresamt <> 0
            THEN
               tramt := factresamt - sm_ostat.ostat;

               IF tramt <> 0
               THEN --1
                  IF tramt > 0
                  THEN --2
                     debitaccid :=
                        cm_utils.lnkduereserveaccount (p_custcategory      => custtype,
                                                       p_crdcurrency       => currencytype,
                                                       p_bankid            => filial
                                                      );
                     creditaccid := acc.secondaryreserveaccid;
                  ELSE
                     debitaccid := acc.secondaryreserveaccid;
                     creditaccid :=
                        cm_utils.lnkduereserveaccount (p_custcategory      => custtype,
                                                       p_crdcurrency       => currencytype,
                                                       p_bankid            => filial
                                                      );
                  END IF;

                  tramt := ROUND (ABS (tramt), 2);
                  trdescription :=
                           'Кредит цзря ещтиййатын дяйишилмяси  №'
                           || numcredit;
                  trdescription :=
                     REPLACE (trdescription, cm_decls.trdescnumber, numcredit);
                  trdescription :=
                     REPLACE (trdescription,
                              cm_decls.trdescdate,
                              TO_CHAR (currdate, 'DD/MM/YYYY')
                             );
                  DBMS_OUTPUT.put_line (   'CreditID = '
                                        || creditaccid
                                        || 'debitid = '
                                        || debitaccid
                                       );
                  if (debitaccid is not null) and(debitaccid not in(-1,0)) and 
                     (creditaccid is not null) and (creditaccid not in(-1,0)) then                          
                  temptrid :=
                     cm_transactionmgr.sbaddtransaction (p_trid                 => NULL,
                                                         p_debitid              => debitaccid,
                                                         p_creditid             => creditaccid,
                                                         p_debitamount          => tramt,
                                                         p_creditamount         => tramt,
                                                         p_lamount              => tramt,
                                                         p_flags                => 8/*sb_decls.atfcommitimmediate*/,
                                                         p_operationtype        => cm_decls.cmtransactionoptype,
                                                         p_inbalancechar        => NULL,
                                                         p_transactiondate      => currdate,
                                                         p_trname               => trdescription
                                                        );
               END IF; --2
               end if;
            END IF;
         END LOOP;
      END;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RESREVE_CONTROL

-- Start of DDL Script for Package CREDITSMGR.CM_RETURN_INT_OB
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
         cm_transactionmgr.cm_commitdelayedtransactions ;
         COMMIT WORK;
      ELSE
         ROLLBACK WORK;
      END IF;
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_RETURN_INT_OB

-- Start of DDL Script for Package CREDITSMGR.CM_SCHEDULE
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_schedule
  IS
  function  PaymentSchedule_AddEdit(
              p_ID in Integer ,  
              p_CreditID in Integer ,
              p_PayDate in Date ,
              p_Principial in Number ,
              p_Interest in Number 
             )
  return Integer;
  procedure PaymentSchedule_Delete(p_ID in Integer);
  procedure InsertAnnutySchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            );
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
  procedure InsertEqualSchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            );
  procedure TrSchedule_Add(p_id integer, p_date date, p_ammount integer);
  procedure TrSchedule_Edit(t_id integer, p_date date, p_ammount integer);
  procedure TrSchedule_Del(t_id integer);
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
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            )
  is
    AnnutyPayment Number;
    IntrAmt Number;
    PrincipialAmt Number;
    FullPayment Number := p_Amount;
    PayDate Date := p_FirstPayDate;
    DayCnt Integer; 
    Temp Integer;
    
  begin
    
    AnnutyPayment := AnnutyPayment_Get(FullPayment,p_Rate,p_Periods,p_PeriodRate);
    
    DayCnt := CM_UTILS.BankDaysBetween(p_StartDate,p_FirstPayDate);
    
    IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,DayCnt);
    PrincipialAmt := AnnutyPayment - IntrAmt;
    Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt);
    FullPayment := p_Amount - PrincipialAmt; 
    
    for i in 2..p_Periods 
    loop
      IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,p_PeriodRate * 30);
      PrincipialAmt := AnnutyPayment - IntrAmt;
      PayDate := ADD_MONTHS(PayDate,1);
      Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt);
      if FullPayment >= PrincipialAmt then 
        FullPayment := FullPayment - PrincipialAmt;
      else
        FullPayment := 0;
      end if;
             
    end loop;
         
  end;          

  procedure InsertEqualSchedule(
             p_CreditID in Integer ,
             p_Amount in Number ,
             p_Rate in Number ,
             p_FirstPayDate in Date ,
             p_StartDate in Date , 
             p_Periods in Integer ,
             p_PeriodRate in Integer -- In Months 
            )
  is
    EqualPayment Number;
    IntrAmt Number;
    PrincipialAmt Number;
    FullPayment Number := p_Amount;
    PayDate Date := p_FirstPayDate;
    DayCnt Integer; 
    Temp Integer;
    
  begin
    
    EqualPayment := EqualPartsPayment_Get(FullPayment,p_Rate,p_Periods,p_PeriodRate);
    
    DayCnt := CM_UTILS.BankDaysBetween(p_StartDate,p_FirstPayDate);
    
    IntrAmt := CM_UTILS.CalcPercent(p_Amount,p_Rate,DayCnt);
    PrincipialAmt := EqualPayment;
    Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt);
    FullPayment := p_Amount - EqualPayment; 
    
    for i in 2..p_Periods 
    loop
      IntrAmt := CM_UTILS.CalcPercent(FullPayment,p_Rate,p_PeriodRate * 30);
      PrincipialAmt := EqualPayment;
      PayDate := ADD_MONTHS(PayDate,1);
      Temp := PaymentSchedule_AddEdit(0,p_CreditID,PayDate,PrincipialAmt,IntrAmt);
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
              p_Interest in Number 
             )
  return Integer              
  is
  
    Result Integer;
    
  begin
  
    update CM_PAYMENT_SCHEDULE
       set PAYMENTDATE = p_PayDate ,
           PRINCIPAL = p_Principial ,
           INTEREST = p_Interest 
     where ID = p_ID;
    
    if SQL%ROWCOUNT = 0 then
    
    insert into CM_PAYMENT_SCHEDULE(
      CREDITID , PAYMENTDATE , PRINCIPAL , INTEREST
    )
    values (
    p_CreditID ,p_PayDate ,p_Principial ,p_Interest
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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

   FUNCTION get_period (p_id IN INTEGER)
      RETURN VARCHAR2;

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

   FUNCTION get_period (p_id IN INTEGER)
      RETURN VARCHAR2
   IS
      cm       NUMBER;
      result   VARCHAR2 (56);

      CURSOR c_p
      IS
         SELECT bperiod, eperiod, NAME
           FROM cm_periods;
   BEGIN
      SELECT (  duedatefirstcontract
              - dateofconclusion
             )
        INTO cm
        FROM cm_active_credits
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
       WHERE dat = p_dat
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
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SD

-- Start of DDL Script for Package CREDITSMGR.CM_SD_OLD
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_sd_old
  IS
  
  
  function FilterPerson(Cs in varchar2,person in integer,b in boolean)
  return varchar2;
  
  
  function FilterVal(Cs in varchar2,Val in integer,b in boolean)
  return varchar2;
  
  procedure Get_Obligation(
                CrdID in Integer,
                Dat in Date,
                Delimer in number);
  procedure Get_Payments(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  procedure Get_Rest(
                CrdID in Integer,
                Dat in Date,
                Delimer in number);
  procedure Get_Tranches(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  procedure Get_DueRest(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number);
  function get_fil(Oparam in varchar2,Iparam in varchar2)
  return varchar2;
  function FilterString(
                 NatVal in boolean default false,
                 FreeVal in boolean default false,
                 FreeNotVal in boolean default false,
                 LegalPerson in boolean default false,
                 NaturalPerson in boolean default false,
                 chfil  boolean default false,
                 FID in integer default null
                 )
  return varchar2;
END;
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_sd_old
IS
  procedure Get_Rest(
                CrdID in Integer,
                Dat in Date,
                Delimer in number)
  is
  
  cursor c_rest(
          P_ID in integer,
          P_Dat in Date)
   is
    select Rest,Rest*Get_AnnInt(CreditID) as avgrest
     from cm_history
     where hdate = P_Dat and creditID = P_ID;
         

  RestInfo c_rest%rowtype;
      
  Srest number;
  Arest number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_rest(CrdID,Dat);
     fetch c_rest into restinfo;
     close c_rest;
     
     Srest := nvl(restinfo.rest,0);
     Arest := nvl(restinfo.avgrest,0);
     
   -- raise_application_error(-20007,'Dedimmi?--'||GET_PERIOD(CrdID));
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select Rest,Rest*Get_AnnInt(CreditID)/Delimer
     into Srest,Arest from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),Srest,Arest,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,Srest,Arest,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_rests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,Srest,Arest);                          
     end if;
  end;
  
  function FilterVal(Cs in varchar2,Val in integer,b in boolean)
  return varchar2  
  is
  result varchar2(59);
  begin
   
   if b then 
   if cs = ' ' then
    result := 'Currency = '||to_char(val);
   end if; 
    if cs <> ' ' then
     result := '('||cs||')'||' or '||
                                  '('||
                         'Currency = '||
                         to_char(val)||')';
   end if;
   else result :=cs;
   end if;
   
    return result; 
  end;
  
  function FilterPerson(Cs in varchar2,person in integer,b in boolean)
  return varchar2
  is
  result varchar2(60);
  begin

     if b then 
     if Cs = ' ' then
      result := 'PersonalType = '||to_char(person);
     end if; 
     if cs <> ' ' then
       result := '('||Cs||')'||' or '||'('||
                                'PersonalType = '||
                                to_char(person)||')';
     end if;
     else result :=Cs;
     end if;
     
     return result;
     
  end;
  
/*  function FilterDc(Cs in varchar2,bcm in integer,ecm in integer,b in boolean)
  return varchar2
  is
  result varchar2(1024);
  begin
     if b then 
     if Cs = ' ' then
      result := '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)<='||
                 to_char(ecm)||
                 ' and  '||
                 '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)>='||
                 to_char(bcm);
     end if;
     if cs <> ' ' then 
      result := '('||Cs||')'||' or '||'('||
                               '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)<='||
                              to_char(ecm)||
                              ' or '||
                              '(DUEDATEFIRSTCONTRACT - DATEOFCONCLUSION)>='||
                             to_char(bcm)||')';
     end if;
     else result :=Cs;
     end if;
     return result;
  end;*/
  
  function FilterString(
                 NatVal in boolean default false,
                 FreeVal in boolean default false,
                 FreeNotVal in boolean default false,
                 LegalPerson in boolean default false,
                 NaturalPerson in boolean default false,
                 chfil  boolean default false,
                 FID in integer default null
                 )
  return varchar2
  is
  
  Result varchar2(2048);
  CurrencyStr varchar2(250);
  PersonStr varchar2(250);
  DCStr  varchar2(1024);
   
  begin
    
    Result := '';
    CurrencyStr := ' ';
    PersonStr := ' ';
    DCStr := ' ';
    
    CurrencyStr := FilterVal(CurrencyStr,0,NatVal);
    CurrencyStr := FilterVal(CurrencyStr,1,FreeVal);
    CurrencyStr := FilterVal(CurrencyStr,48,FreeNotVal);
                   
    PersonStr := FilterPerson(PersonStr,2,LegalPerson);
    PersonStr := FilterPerson(PersonStr,1,NaturalPerson);
                  

    Result := 'select id from cm_active_credits where  '||
              '('||CurrencyStr||')' ||
              ' and '|| 
              '('||PersonStr||')';
     if  chfil then
     if  FID is not null then
        Result := Result||' and branchid = '||FID; 
     end if;    
     end if;    
 
    return result;
                                               
  end;    
  
  function get_fil(Oparam in varchar2,Iparam in varchar2)
  return varchar2
  is
   result varchar2(56);
  begin
     Result := Oparam;
     
     if Oparam = '' and Iparam <> '' then
        Result := Iparam;
     end if;
     
     if Oparam <> '' and Iparam <> '' then 
        Result := Oparam||' and '||Iparam;
     end if;
         
     return result; 
  end;
  
  
  procedure Get_Tranches(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is

  cursor c_tr(
           P_ID in integer,
           FDate in Date,
           LDate in Date)
  is
  select sum(TRANCHEAMOUNT) as tramt,sum(TRANCHEAMOUNT*Get_AnnInt(CreditID)) as avgtr
  from cm_tranches
  where TRANCHEDATE between FDate and LDate
  and creditID = P_ID;

  trinfo c_tr%rowtype;
           
  STramt number;
  ATramt number;
  Pval integer;
  PrID varchar2(56);

  begin
    
     open c_tr(CrdID,FirstDate,LastDate);
     fetch c_tr into trinfo;
     close c_tr;
    -- raise_application_error(-20007,'Dedimmi?--'||trinfo.tramt); 

     STramt := nvl(trinfo.tramt,0);  
     ATramt := nvl(trinfo.avgtr,0);

     
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select TRANCHEAMOUNT,TRANCHEAMOUNT*Get_AnnInt(CreditID)/Delimer
     into STramt,ATramt from cm_tranches
     where TRANCHEDATE between FirstDate and LastDate
     and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),STramt,ATramt,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,STramt,ATramt,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_tranches_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,STramt,ATramt);                          
     end if;
  end;
  
  procedure Get_Payments(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is

  cursor c_pay(
          P_ID in integer,
          FDate in Date,
          LDate in Date)
  is
  select sum(PAYEDAMT) as payamt,sum(PAYEDAMT*Get_AnnInt(CreditID)) as avgpay
  from cm_payments
  where PAYDATE between FDate and LDate
  and creditID = P_ID;
  
  payinfo c_pay%rowtype;
         
  SPayAmt number;
  APayAmt number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_pay(CrdID,FirstDate,LastDate);
     fetch c_pay into payinfo;
     close c_pay;
     SPayAmt := nvl(payinfo.payamt,0);
     APayAmt := nvl(payinfo.avgpay,0);
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select nvl(sum(PAYEDAMT),0),nvl(sum(PAYEDAMT*Get_AnnInt(CreditID)/Delimer),0)
     into SPayAmt,APayAmt from cm_payments
     where PAYDATE between FirstDate and LastDate
     and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),SPayAmt,APayAmt,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,SPayAmt,APayAmt,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_payments_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,SPayAmt,APayAmt);                          
     end if;
  end;
  
    procedure Get_Obligation(
                CrdID in Integer,
                Dat in Date,
                Delimer in number)
  is
   
  cursor c_obl(
           P_ID in integer,
           P_DAt in Date)
  is
  select Obligation,Obligation*Get_AnnInt(CreditID) as avgobl 
  from cm_history
  where hdate = P_DAt and creditID = P_ID;
  
  oblinfo c_obl%rowtype;
            
  SObl number;
  Aobl number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_obl(CrdID,Dat);
     fetch c_obl into oblinfo;
     close c_obl;
     
     SObl := nvl(oblinfo.Obligation,0);
     Aobl := nvl(oblinfo.avgobl,0);
     
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
/*     select Obligation,Obligation*Get_AnnInt(CreditID)/Delimer
     into SObl,Aobl from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),SObl,Aobl,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,SObl,Aobl,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_obligations_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,SObl,Aobl);                          
     end if;
  end;
  

   procedure Get_DueRest(
                CrdID in Integer,
                FirstDate in Date,
                LastDate in Date,
                Delimer in number)
  is
  
  cursor c_duerest(
          P_ID in integer,
          P_FDate in Date,
          P_LDate in Date)
   is
    select sum(DueRest) as DueAmt ,sum(DueRest*Get_AnnInt(CreditID)) as avgduerest
     from cm_history
     where hdate between  P_FDate and P_LDate 
     and creditID = P_ID;
         

  DueRestInfo c_duerest%rowtype;
      
  Sduerest number;
  Aduerest number;
  Pval integer;
  PrID varchar2(56);

  begin
     
     open c_duerest(CrdID,FirstDate,LastDate);
     fetch c_duerest into DueRestInfo;
     close c_duerest;
     
     Sduerest := nvl(DueRestInfo.DueAmt,0);
     Aduerest := nvl(DueRestInfo.avgduerest,0);
     
   --  raise_application_error(-20007,'Dedimmi?--'||restinfo.rest);
     select id into PrID
     from cm_periods 
     where name = GET_PERIOD(CrdID);
     
     /*select Rest,Rest*Get_AnnInt(CreditID)/Delimer
     into Srest,Arest from cm_history
     where hdate = Dat and creditID = CrdID;*/
     
     select Currency 
     into Pval from cm_portfolio
     where id = CrdID;
     
   if Pval = 0 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),Sduerest,Aduerest,0,0,0,0);
   end if;

    if Pval =1 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,Sduerest,Aduerest,0,0);                          
     end if;
     
     if Pval = 48 then
     insert into cm_duerests_sd(id,dateofcredit,namount,navgintamount, 
                             famount,favgintamount,fnamount,fnavgintamount)
     values (PrID,GET_PERIOD(CrdID),0,0,0,0,Sduerest,Aduerest);                          
     end if;
  end;
  
 

                            
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SD_OLD

-- Start of DDL Script for Package CREDITSMGR.CM_SETUP
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
  procedure CreditType_Edit(
             p_ID in Integer ,
             p_renewablestatus in Integer ,
             p_itype in Integer , 
             p_iclass in Integer , 
             p_description in Varchar2
            );
  procedure CreditType_Delete(
             p_ID in Integer 
            );
  procedure CreditType_Add(
             p_renewablestatus in Integer ,
             p_itype in Integer, 
             p_iclass in Integer, 
             p_description in Varchar2
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
             p_description in Varchar2
            )
  is
  begin
  
    insert into CM_CREDITTYPES(
    renewablestatus, itype, iclass, description
    ) 
    values(
    p_renewablestatus, p_itype, p_iclass, p_description
    );
    
    commit work;
    
  end;           

  procedure CreditType_Edit(
             p_ID in Integer ,
             p_renewablestatus in Integer ,
             p_itype in Integer , 
             p_iclass in Integer , 
             p_description in Varchar2
            )
  is
  begin
  
    update CM_CREDITTYPES
       set
           renewablestatus = p_renewablestatus ,
           itype = p_itype , 
           iclass = p_iclass , 
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_system
 IS
  procedure MarkStateHistory(CurrentBankDate in Date);
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_system
IS
   PROCEDURE markstatehistory (currentbankdate IN DATE)
   IS
   BEGIN
      --  Marking Rest History


      UPDATE cm_history PARTITION (prev_state)
         SET partitionkey = 2;

      UPDATE cm_history PARTITION (curr_state)
         SET partitionkey = 1;

      INSERT INTO cm_history PARTITION (curr_state)
         SELECT creditid, currentbankdate, lastcalcdate, stopcalcdate, rest,
                interestrest, duerest, dueinterestrest, reserveid,
                givenamount, obligation, pledgeprice, 0, duereserveid,
                oldreserveid, oldduereserveid
           FROM cm_history PARTITION (prev_state);

      -- Marking Interest History

      UPDATE cm_interests PARTITION (prev_state)
         SET partitionkey = 2;

      UPDATE cm_interests PARTITION (curr_state)
         SET partitionkey = 1;

      INSERT INTO cm_interests PARTITION (curr_state)
         SELECT 0, creditid, currentbankdate, 0, 0, NULL, NULL, 0,
                intprecision, dueintprecision
           FROM cm_interests PARTITION (prev_state);
   END;
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_SYSTEM

-- Start of DDL Script for Package CREDITSMGR.CM_TRANCHE
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
     /*Temp :=
      CM_UTILS.CalcPercent(
         p_sum => (p_TrchAmount+HistInfo.REST) ,
         p_rate => ReserveRate.PERCENT ,
         p_coefficient => 1 ,
         p_delimmer => 1
         );*/

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
     
    /*if TrAmount < 0 then
     crd := CreditAcc;
     CreditAcc := DebitAcc;
     DebitAcc := Crd;
     else      
      if   TrAmount > 0 then
       crd := DebitAcc;
       DebitAcc := CreditAcc;
       CreditAcc := Crd;
       end if;
       end if;*/
     
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
       
       DebitAcc := 
        CM_UTILS.lnkOutInvObligationAccount(
           p_custcategory => PortfInfo.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfo.CURRENCY ,
           p_bankid => PortfInfo.BRANCHID
          );
          
       if DebitAcc is null then
         CM_UTILS.ProcessError(CM_DECLS.EInvokeAccountNotFound);-- Change  
       end if;
                
       CreditAcc := CrdAccs.OUTGUARANTEEACCID;
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
        
    /* if   TempObl>0 then  
       creditacc := 
        CM_UTILS.InkCrdlineOblAccount(
           p_custcategory => PortfInfo.CUSTOMERTYPE ,
           p_crdcurrency => PortfInfo.CURRENCY ,
           p_bankid => PortfInfo.BRANCHID
          );
              
        debitacc := CrdAccs.CrdLineOblAccID;
        
       TrDescription := 'Ющтялийин гиймятляндирилмяси № '|| PortfInfo.numberofcredit/*CM_UTILS.trDescObligationReduce();
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
       end if;*/
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
      CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(0);
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
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_transactionmgr 
    IS 
    function CM_TransactionAdd( 
             p_TRID          IN INTEGER DEFAULT NULL, 
             p_DEBITACCID    IN INTEGER , 
             p_CREDITACCID   IN INTEGER , 
             p_DEBITAMOUNT   IN NUMBER , 
             p_CREDITAMOUNT  IN NUMBER , 
             p_NATAMOUNT     IN NUMBER DEFAULT NULL , 
             p_FLAGS         IN INTEGER , -- No SBTransacion Flags  !!!!! 
             p_OPTYPE        IN INTEGER DEFAULT CM_DECLS.cmTransactionOpType , 
             p_INBALANCECHAR IN INTEGER , 
             p_TRDATE        IN DATE , 
             p_TRDESCRIPTION IN VARCHAR2  
             ) 
    return INTEGER; 
    function SBOUTDeleteTransaction( 
             p_TrID in Integer  
             ) 
    return Integer; 
    function SBDeleteTransaction( 
             p_TrID in Integer  
             ) 
    return Integer; 
    procedure CM_CommitDelayedTransactions(CommitFlag in Integer); 
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
    function TransactionExist( 
                p_TrID in Integer, 
                p_SBLink in Boolean default True 
                ) 
     return Boolean; 
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
              p_TRDESCRIPTION IN VARCHAR2  
              ) 
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
           
       /*else 
        
         select SBOUT_TR_SEG_PROVARCH.nextval 
     			into Temp 
     			from dual;*/  
               
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
       Result := 1/*
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
                        )*/; 
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
       /*SBOUT_TRANSACTION.Transaction_Delete(p_TrID , 0);*/ 
       return p_TrID; 
     end;          
      
     procedure CM_CommitDelayedTransactions(CommitFlag in Integer) 
     is 
       cursor c_DelayedTransactions is 
       select trid, debitaccid, creditaccid, debitamount, creditamount, 
          natamount, flags, optype, inbalancechar, trdate, trdescription 
         from CM_TRANSACTIONS; 
          
       Transaction c_DelayedTransactions%rowtype; 
       Result Integer;     
     begin 
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
              p_Flags => CommitFlag , 
              p_TransactionDate => Transaction.TrDate , 
              p_OperationType => Transaction.OpType , 
              p_InBalanceChar => Transaction.Inbalancechar  
         ); 
         else 
         Result :=1/* 
            SBOUTAddTransaction( 
              p_TrID => Transaction.TrID , 
              p_DebitID => Transaction.DebitAccID , 
              p_CreditID => Transaction.CreditAccID , 
              p_DebitAmount => Transaction.DebitAmount , 
              p_CreditAmount => Transaction.CreditAmount , 
              p_LAmount => Transaction.NatAmount , 
              p_TrName => Transaction.TrDescription , 
              p_Flags => CommitFlag , 
              p_TransactionDate => Transaction.TrDate , 
              p_OperationType => Transaction.OpType , 
              p_InBalanceChar => Transaction.Inbalancechar  
         ); */;
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
   
       /*cursor c_SBOUT_Transactions(TrID in Integer) is 
       select ID 
         from SBOUT_PROVARCH 
        where ID = TrID; */
         
        cursor c_sb_LazyTransactions(TrID in integer) is 
        select id 
          from SB_LAZYTRANSACTION 
        where ID =TrID;   
        
       TempRec c_SB_Transactions%rowtype; 
       TempLazyRec c_sb_LazyTransactions%rowtype; 
        
       Result Boolean ;       
     begin 
       if p_SBLink then 
        
         open c_SB_Transactions(p_TrID); 
         fetch c_SB_Transactions into TempRec; 
   
         open c_sb_LazyTransactions(p_TrID); 
         fetch c_sb_LazyTransactions into TempLazyRec; 
          
           Result := (c_SB_Transactions%found)or(c_sb_LazyTransactions%found) 
  ; 
         close c_SB_Transactions;  
         close c_sb_LazyTransactions; 
          
       /*else 
        
         open c_SBOUT_Transactions(p_TrID); 
         fetch c_SBOUT_Transactions into TempRec; 
           Result := c_SBOUT_Transactions%found; 
         close c_SBOUT_Transactions;  */
          
       end if; 
        
       return Result; 
         
     end;             
                 
   END;
/


-- End of DDL Script for Package CREDITSMGR.CM_TRANSACTIONMGR

-- Start of DDL Script for Package CREDITSMGR.CM_UTILS
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

CREATE OR REPLACE 
PACKAGE creditsmgr.cm_utils
  IS

  function UseLeft
  return Integer;
  function ReduceObligationOnTranch
  return Integer;
  function BankYearDays
  return Integer;
  function trDescInterestRecalc
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescObligationReduce
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescReserveIncrease
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescReserveReduce
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescTranche
  return CM_TRDESCRIPTIONS.trdescription%type;
  function lnkDueReserveAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer;
  function lnkInterestAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer   
           )
  return Integer;
  function lnkOutInvObligationAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer;
  function lnkOutInvPledgeAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer;
  function lnkReserveAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer;
  function ProcessOutBalanceTransactions
  return Integer;
  function trDescSavePledgePrice
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescObligationIncrease
  return CM_TRDESCRIPTIONS.trdescription%type;
 
      RETURN INTEGER;
  function CalcPercent(
            p_Sum in Number ,
            p_Rate in Number ,
            p_Coefficient in Number ,
            p_Delimmer in Number default BankYearDays
            )
   return Number;
  procedure ProcessError(ErrCode in Integer);
  FUNCTION BankDaysBetween(firstdate IN DATE, lastdate IN DATE)
      RETURN INTEGER;
  function BankMonthDays(ADate in Date)
  return Integer;
  function Precision2(p_Value in Number)
   return Number;
  function Precision7(p_Value in Number)
   return Number;
  function CreditLine(p_CreditTypeID in Integer)
   return Integer;
  function CreditRenewable(p_CreditTypeID in Integer)
   return Integer;
  function CreditReserveContEnabled(p_CreditTypeID in Integer)
   return Integer;
  function trDescDueDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescDueIntDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescMainDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type;
  function trDescMainIntDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type;
  function TrCtrlShowDelayedTransactions
  return Integer;
  function trDescMainDebtExpire
  return CM_TRDESCRIPTIONS.trdescription%type;
  function InkCrdlineOblAccount(
              p_CustCategory in integer, 
              p_CrdCurrency in integer , 
              p_BankID in integer  
              )
  return integer;
  function inkoutinvinterestaccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
 return Integer;
END; -- Package spec
/


CREATE OR REPLACE 
PACKAGE BODY creditsmgr.cm_utils
IS

  function Get_IntReference(
            p_RefName in Varchar2 
            )
  return Integer          
  is
    cursor c_Reference(RefName in varchar2) is
    select INTEGERVALUE
      from CM_REFERENCES
     where INAME = RefName;
     
  Result CM_REFERENCES.integervalue%type;
         
  begin
  
    open c_Reference(p_RefName);
    fetch c_Reference into Result;
    close c_Reference;
    
    return Result;
    
  end;
  
            
  function Get_CharReference(
            p_RefName in Varchar2 
            )
  return Varchar2
  is
    cursor c_Reference(RefName in varchar2) is
    select CHARVALUE
      from CM_REFERENCES
     where INAME = RefName;
     
  Result CM_REFERENCES.charvalue%type;
         
  begin
  
    open c_Reference(p_RefName);
    fetch c_Reference into Result;
    close c_Reference;
    
    return Result;
    
  end;
  
  function UseLeft
  return Integer
  is
    StrRefName constant varchar2(32) := 'UseLeft';
    Result Integer;
  begin
    Result := Get_IntReference(StrRefName);
    return Result;
  end;
               
  function ReduceObligationOnTranch
  return Integer
  is
    StrRefName constant varchar2(32) := 'ReduceObligationOnTranch';
    Result Integer;
  begin
    Result := Get_IntReference(StrRefName);
    return Result;
  end;  
  
  function ProcessOutBalanceTransactions
  return Integer
  is
    StrRefName constant varchar2(32) := 'ProcessOutBalanceTransactions';
    Result Integer;
  begin
    Result := Get_IntReference(StrRefName);
    return Result;
  end;
  
  function TrCtrlShowDelayedTransactions
  return Integer
  is
    StrRefName constant varchar2(32) := 'TrCtrlShowDelayedTransactions';
    Result Integer;
  begin
    Result := Get_IntReference(StrRefName);
    return Result;
  end;
  
  function BankYearDays
  return Integer
  is
    StrRefName constant varchar2(32) := 'BankYearDays';
    Result Integer;
  begin
    Result := Get_IntReference(StrRefName);
    return Result;
  end;
  
  function BankMonthDays(ADate in Date)
  return Integer
  is
  begin
    if BankYearDays() > 360 then
      return TO_NUMBER (TO_CHAR (LAST_DAY(ADate), 'DD'));
    else
      return 30;
    end if;    
  end;
  
  function Get_TrDescriptions(
           p_TrName in CM_TRDESCRIPTIONS.iname%type
           )
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  
  cursor c_TrDescriptions (TrName in CM_TRDESCRIPTIONS.iname%type) is
  select TrDescription 
    from CM_TRDESCRIPTIONS
   where INAME = TrName; 
  
  Result CM_TRDESCRIPTIONS.trdescription%type;
           
  begin
  
    open c_TrDescriptions (p_TrName);
    fetch c_TrDescriptions into Result;
    close c_TrDescriptions;
     
    return Result;
    
  end;
  
  function trDescInterestRecalc
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescInterestRecalc'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end; 

  function trDescTranche
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescTranche'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end; 

  function trDescReserveIncrease
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescReserveIncrease'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;

  function trDescReserveReduce
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescReserveReduce'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
  
  function trDescObligationReduce
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescObligationReduce'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
  
  function trDescObligationIncrease
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescObligationIncrease'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;

  function trDescSavePledgePrice
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescSavePledgePrice'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
  
  function trDescMainDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescMainDebtPay'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;

  function trDescMainIntDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescMainIntDebtPay'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
  
  function trDescDueDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescDueDebtPay'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;

  function trDescMainDebtExpire
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescMainDebtExpire'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
  
  function trDescDueIntDebtPay
  return CM_TRDESCRIPTIONS.trdescription%type
  is
  StrTrName constant CM_TRDESCRIPTIONS.INAME%type := 'trDescDueIntDebtPay'; 
  Result CM_TRDESCRIPTIONS.trdescription%type;
  begin
    Result := Get_TrDescriptions(StrTrName);
    return Result;
  end;
     
  function Get_OppositeAccount(
            p_CustCategory in Integer ,
            p_CrdCurrency in Integer ,
            p_BankID in Integer ,
            p_LinkName in CM_LINKS.link%type
           ) 
  return SB_ACCOUNT.ID%type
  is
  
  cursor c_LinkValues(
                      ABranchID in Integer
                    , LinkName in CM_LINKS.link%type 
                    , CustCategory in Integer 
                    , CrdCurrency in Integer
  ) 
  is
  select ACCOUNTID
    from CM_LINK_VALUES
   where BRANCHID = ABranchID
     and CURRENCYID = CrdCurrency
     and LINKID = (select ID
                     from CM_LINKS
                    where CATEGORYID = CustCategory
                      and LINK = LinkName  
  );     
  
  Result SB_ACCOUNT.ID%type;
  
  
  begin
  
    open c_LinkValues(p_BankID , p_LinkName , p_CustCategory , p_CrdCurrency);
    fetch c_LinkValues into Result;
    
    if c_LinkValues%notfound then
      Result := null;
    end if;
     
    close c_LinkValues;
           
    return Result;
    
  end;         
  
  function lnkInterestAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer   
           )
  return Integer
  is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency ,
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.lnkInterestAccount
              );
    return Result;
  end;
  
    function InkCrdlineOblAccount(
              p_CustCategory in integer, 
              p_CrdCurrency in integer , 
              p_BankID in integer  
              )
  return integer            
  is
  Result integer;
  begin
     Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.InkCrdLineOblAccont
              ); 
    return Result;          
  end;                                            

  
  function lnkReserveAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer
  is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.lnkReserveAccount
              );
    return Result;
  end;                           

  function lnkDueReserveAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer
  is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.lnkDueReserveAccount
              );
    return Result;
  end;                           

 function inkoutinvinterestaccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
 return Integer
 is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.InkOutIntAccount
              );
    return Result;
  end;                           

  function lnkOutInvObligationAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer
  is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.lnkOutInvObligationAccount
              );
    return Result;
  end;                           

  function lnkOutInvPledgeAccount(
           p_CustCategory in Integer ,
           p_CrdCurrency in Integer ,
           p_BankID in Integer              
           )
  return Integer
  is
    Result Integer;
  begin
    Result := Get_OppositeAccount(
              p_CustCategory => p_CustCategory , 
              p_CrdCurrency => p_CrdCurrency , 
              p_BankID => p_BankID , 
              p_LinkName => CM_DECLS.lnkOutInvPledgeAccount
              );
    return Result;
  end;
                             
  FUNCTION BankDaysBetween(firstdate IN DATE, lastdate IN DATE)
      RETURN INTEGER      
   IS
      result          INTEGER;
      currentmonth    DATE;
      MONTH           DATE    := firstdate;
      monthinterval   INTEGER;
      mounthindex     INTEGER;
      lastmonthday    INTEGER;
   BEGIN
      IF firstdate >= lastdate
      THEN
         result := 0;
      ELSE
         result := (  lastdate
                    - firstdate
                   );
                   
         if BankYearDays > 360 then
           return Result;
         end if;
                   
         monthinterval := (  lastdate
                           - firstdate
                          ) / 30;

         FOR monthindex IN 0 .. monthinterval
         LOOP
            currentmonth := LAST_DAY (MONTH);
            lastmonthday := TO_NUMBER (TO_CHAR (currentmonth, 'DD'));

            IF  (currentmonth <= lastdate) AND (currentmonth > firstdate)
            THEN
               IF lastmonthday = 31
               THEN
                  result :=   result
                            - 1;
               END IF;

               IF lastmonthday = 28
               THEN
                  result :=   result
                            + 2;
               END IF;

               IF lastmonthday = 29
               THEN
                  result :=   result
                            + 1;
               END IF;
            END IF;

            MONTH := ADD_MONTHS (MONTH, 1);
         END LOOP;
      END IF;

      RETURN result;
   END;

   function CalcPercent(
            p_Sum in Number ,
            p_Rate in Number ,
            p_Coefficient in Number ,
            p_Delimmer in Number default BankYearDays
            )
   return Number         
   is
     Result Number;
   begin
     Result := ( p_Sum * p_Rate * p_Coefficient ) / ( p_Delimmer * 100 );
     return Result;
   end;         
   
   procedure ProcessError(ErrCode in Integer)
   is
   begin
     raise_application_error(ErrCode , 'Error' );
   end;
    
   function Precision7(p_Value in Number)
   return Number             
   is
     Result Number;
     Temp Number := p_Value;  
   begin
     Temp := Temp * 100 - Trunc(Temp * 100);
     Result := Temp / 100;
     return Result;
   end;
   
   function Precision2(p_Value in Number)
   return Number             
   is
     Result Number;
     Temp Number := p_Value;  
   begin
     Temp := Temp * 100 - Trunc(Temp * 100);
     Result := p_Value - Temp / 100;
     return Result;
   end;
   
   function CreditLine(p_CreditTypeID in Integer)
   return Integer
   is
     Result Integer;
   begin
   
     select ITYPE 
       into Result
       from CM_CREDITTYPES
      where ID = p_CreditTypeID;
        
     return Result;
     
   end;

   function CreditRenewable(p_CreditTypeID in Integer)
   return Integer
   is
     Result Integer;
   begin
   
     select RENEWABLESTATUS 
       into Result
       from CM_CREDITTYPES
      where ID = p_CreditTypeID;
        
     return Result;
     
   end;

   function CreditReserveContEnabled(p_CreditTypeID in Integer)
   return Integer
   is
     Result Integer;
   begin
   
     select ICLASS 
       into Result
       from CM_CREDITTYPES
      where ID = p_CreditTypeID;
        
     return Result;
     
   end;
   
                             
END;
/


-- End of DDL Script for Package CREDITSMGR.CM_UTILS

-- Start of DDL Script for Package CREDITSMGR.CM_WR_TOOLS
-- Generated 30-May-2006 16:40:14 from CREDITSMGR@SB

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
PACKAGE BODY creditsmgr.cm_wr_tools 
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



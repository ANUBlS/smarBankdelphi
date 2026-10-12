CREATE OR REPLACE 
PACKAGE cm_activation
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
PACKAGE BODY cm_activation
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
      CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);
      commit work;
    else
      rollback work;
    end if;
  end;
          
END;
/

CREATE OR REPLACE 
PACKAGE cm_administration
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
PACKAGE BODY cm_administration
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

CREATE OR REPLACE 
PACKAGE cm_ak_reports
  IS
  PROCEDURE insinfod (p_id IN INTEGER, p_bdate IN DATE, p_edate IN DATE);
END;
/

CREATE OR REPLACE 
PACKAGE BODY cm_ak_reports
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
         SELECT NVL (SUM (i.payedamt), 0) amtmain,
                NVL (SUM (i.payedintamt), 0) amtint,
                NVL (SUM (i.payeddueamt), 0) amtduemain,
                NVL (SUM (i.payeddueintamt), 0) amtdueint
           FROM cm_payments i
          WHERE creditid = p_id
            AND paydate BETWEEN p_bdate AND p_edate;

      CURSOR c_trchinfo
      IS
         SELECT NVL (SUM (trancheamount), 0) trchamt
           FROM cm_tranches
          WHERE creditid = p_id
            AND tranchedate BETWEEN p_bdate AND p_edate;

      begininfo      c_begininfo%ROWTYPE;
      endinfo        c_endinfo%ROWTYPE;
      paymentinfo    c_paymentinfo%ROWTYPE;
      trchinfo       c_trchinfo%ROWTYPE;
      portfoliotrunc c_portfoliotrunc%rowtype;
      montrunc       integer;
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
      open c_portfoliotrunc;
      fetch c_portfoliotrunc into portfoliotrunc;
      close c_portfoliotrunc;

      montrunc := Trunc(Months_Between(portfoliotrunc.d2, portfoliotrunc.d1));
      
      INSERT INTO cm_report_sd1
           VALUES (p_id, NVL (begininfo.rest, 0),
                   NVL (begininfo.interestrest, 0),
                   NVL (begininfo.duerest, 0),
                   NVL (begininfo.dueinterestrest, 0),
                   NVL (paymentinfo.amtmain, 0), NVL (paymentinfo.amtint, 0),
                   NVL (paymentinfo.amtduemain, 0),
                   NVL (paymentinfo.amtdueint, 0), NVL (trchinfo.trchamt, 0),
                   NVL (endinfo.rest, 0), NVL (endinfo.interestrest, 0),
                   NVL (endinfo.duerest, 0),
                   NVL (endinfo.dueinterestrest, 0),
                   montrunc);
   END;
END;
/

CREATE OR REPLACE 
PACKAGE cm_auto_expire
  IS

  procedure ClearExpireMarks;
  procedure PastDueLoan(
            p_CreditID in Integer ,
            p_Date in Date
            );
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_auto_expire
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

CREATE OR REPLACE 
PACKAGE cm_calculator
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
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_calculator
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
           STOPCALCDATE 
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
  
   BankCurrDate Date;
   BankPrevDate Date;
   
   DateInterval Integer;
   
   CalcDisabled Boolean;
   TrsProcessed Boolean;
   
   AnnIntRate Number;
   AnnOIntRate Number;
   AnnPenRate Number;
   
   IntPrec Number;
   DueIntPrec Number;
   
  begin

   open c_INTEREST_CACHE(p_CreditID);
   fetch c_INTEREST_CACHE into IntCache;
     TrsProcessed := IntCache.TRPROCESSED = CM_DECLS.csAccepted;
     IntPrec := IntCache.INTPRECISION;
     DueIntPrec := IntCache.DUEINTPRECISION;
   close c_INTEREST_CACHE; 
   
   if TrsProcessed then
      CM_UTILS.ProcessError(0);---TODO   
   end if; 
                  
    -- Current State  
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
     
    select TEK_DAT,PRED_DAT 
      into BankCurrDate,BankPrevDate
      from SB_SYSDAT;
    
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
                          p_Coefficient => CM_UTILS.BankDaysBetween(
                              FirstDate => BankCurrDate - 1,
                              LastDate => BankCurrDate
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
                              p_Coefficient => CM_UTILS.BankDaysBetween(
                              FirstDate => BankCurrDate - 1,
                              LastDate => BankCurrDate
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
     
    
    IntCurrInfoRec c_IntCurrInfo%rowtype;
    IntPrevInfoRec c_IntPrevInfo%rowtype;
    
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
             
      
    PortfInfo c_CrdInfo%rowtype;
    CrdAccs c_CrdAccounts%rowtype;
    CalcedPercent c_CalcedPercent%rowtype;
    
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
    
    IntTrAmt Number(18,2);
    DueIntTrAmt Number(18,2);
     
  begin
  
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
                p_Flags => SB_DECLS.atfCommitImmediate ,
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
                p_Flags => SB_DECLS.atfCommitImmediate ,
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

CREATE OR REPLACE 
PACKAGE cm_common
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
      
 
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_common
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
  

  
  
  
END;
/

CREATE OR REPLACE 
PACKAGE cm_common_utils AUTHID CURRENT_USER
IS
   FUNCTION cm_branchid_get (user_id INTEGER DEFAULT UID)
      RETURN NUMBER;
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_common_utils
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

CREATE OR REPLACE 
PACKAGE cm_consts
  IS
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_consts
IS
END;
/

CREATE OR REPLACE 
PACKAGE cm_correct
  IS

  function CrdBorrName_Get(p_ID in integer)
  return varchar2;
  function CrdNumber_Get(p_ID in integer)
  return varchar2;
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_correct
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

CREATE OR REPLACE 
PACKAGE cm_credit
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
      
      ReserveID in Number,
      DueReserveID in Number,      
      PledgePrice in Number,       
      
      PledgeID in Integer
      
        
  ) return
   
        Integer;
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
    p_OutGuaranteeAccID in Integer
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
    p_OutGuaranteeAccID in Integer
  );
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_credit
IS  

            /*****************************************************/
            /*  Company : Smart Systems Technology ltdЩ          */
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
    p_OutGuaranteeAccID in Integer
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
      OutGuaranteeAccID      
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
      p_OutGuaranteeAccID      
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
    p_OutGuaranteeAccID in Integer
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
          OutGuaranteeAccID = p_OutGuaranteeAccID     
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
    --    p_DueDateLastContract=> NULL,
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
      p_OutGuaranteeAccID=> OutGuaranteeAccID    
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
      p_OutGuaranteeAccID=> OutGuaranteeAccID    
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
       
    History_Edit(
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
    --cursor c_CreditRest  --TODO!!!!!!!!!!!!
  begin
  
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
  
  
END;
/

CREATE OR REPLACE 
PACKAGE cm_deca
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
PACKAGE BODY cm_deca
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

CREATE OR REPLACE 
PACKAGE cm_decls
  IS
  
   -- CM Common Declarations 
  
   lnkInterestAccount   constant varchar2(32) := 'lnkInterestAccount';
   lnkReserveAccount    constant varchar2(32) := 'lnkReserveAccount';
   lnkDueReserveAccount constant varchar2(32) := 'lnkDueReserveAccount';
   
   lnkOutInvObligationAccount constant varchar2(32) := 'lnkOutInvoiceObligationAccount';
   lnkOutInvPledgeAccount     constant varchar2(32) := 'lnkOutInvoicePledgeAccount';
   
   
   
   lnkInterestAccountTrans   constant varchar2(255) := ' редитл€р цзр€ фаиз э€лирл€ри ';
   lnkReserveAccountTrans    constant varchar2(255) := ' редитл€р цзр€ ещтимал олунан з€р€р цчцн ади ещтийатлар йардылмасына айырмалар';
   lnkDueReserveAccountTrans constant varchar2(255) := ' редитл€р цзр€ ещтимал олунан з€р€р цчцн м€гс€дли ещтийатлар йардылмасына айырмалар';
   
   lnkOutInvObligationAccTrans constant varchar2(255) := 'Ѕалансданк€нар ющд€ликл€р цчцн контур щесаб';
   lnkOutInvPledgeAccTrans     constant varchar2(255) := 'Ѕалансданк€нар эирову сахламаг цчцн контур щесаб';

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
PACKAGE BODY            cm_decls
IS
  
END;
/

CREATE OR REPLACE 
PACKAGE cm_excel_importer
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
PACKAGE BODY cm_excel_importer
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

CREATE OR REPLACE 
PACKAGE cm_expire
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
PACKAGE BODY cm_expire
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
     
     PortfInfoRec c_PortfInfo%rowtype;
     HistInfoRec  c_HistInfo%rowtype;
     CurrRateRec  c_Rates%rowtype;
     ResrvRateRec c_ReserveRate%rowtype;
     AccInfoRec c_Account%rowtype;
     
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
        
        if HistInfoRec.DUEREST > 0 then
        
           if ResrvRateRec.PERCENT is null then
             CM_UTILS.ProcessError(1); -- TODO
           end if;
                         
           Temp := CM_UTILS.CalcPercent(
             p_sum => HistInfoRec.DUEREST ,
             p_rate => p_SReserveID - ResrvRateRec.PERCENT ,
             p_coefficient => 1 ,
             p_delimmer => 1
           );
             
           Temp := Temp * CurrRateRec.OSTAT;
           
        end if;
      
        TrAmount := CM_UTILS.CalcPercent(
             p_sum => p_Amount ,
             p_rate => p_SReserveID ,
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
       CM_TRANSACTIONMGR.CM_CommitDelayedTransactions(SB_DECLS.atfCommitImmediate);
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

CREATE OR REPLACE 
PACKAGE cm_payment
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
PACKAGE BODY cm_payment
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
      
      PortfInfo c_PortfolioInfo%rowtype;
      HistInfo c_HistoryInfo%rowtype;
      Rates c_Rates%rowtype; 
      CrdAccs c_Accounts%rowtype;
      ReserveRate c_ReserveRate%rowtype;      
       
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

CREATE OR REPLACE 
PACKAGE cm_prolongation
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
PACKAGE BODY cm_prolongation
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

CREATE OR REPLACE 
PACKAGE cm_reserve_contr
  IS

  procedure CorrectReserve(
     p_CreditID in Integer 
    );
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_reserve_contr
IS

  procedure CorrectReserve(
     p_CreditID in Integer 
    )
  is
  
    cursor c_CreditHist(CrdID in Integer) is
    select
       REST ,
       DUEREST ,
       RESERVEID ,
       DUERESERVEID
      from CM_CURR_STATE
     where CreditID = CrdID;
    
    cursor c_Reserve(ResID in Integer) is
    select PERCENT
      from CM_RESERVES
     where ID = ResID;
     
    cursor c_PortfInfo(CrdID in Integer) is
    select NUMBEROFCREDIT ,
           CREDITTYPE ,
           CURRENCY ,
           CUSTOMERTYPE ,
           BRANCHID 
      from CM_ACTIVE_CREDITS
     where ID = CrdID;
    
    cursor c_Accounts(CrdID in Integer) is
    select PRIMARYRESERVEACCID ,
           SECONDARYRESERVEACCID
      from CM_ACCOUNTS
     where CreditID = p_CreditID;      
     
    cursor c_Sysdat is
    select TEK_DAT ,
           PRED_DAT
      from SB_SYSDAT;  
     
    cursor c_CurrRate(p_Date in Date ,p_CurrID in Integer) is
    select OSTAT
      from SB_OPERKURS
     where DAT = p_Date and
           VAL_KOD = p_CurrID;  
             
      
    HistInfo c_CreditHist%rowtype;
    Reserve c_Reserve%rowtype;
    PortfInfo c_PortfInfo%rowtype;
    CurrCurrRate c_CurrRate%rowtype;
    PrevCurrRate c_CurrRate%rowtype;
    BankDate c_Sysdat%rowtype;
    AccInfoRec c_Accounts%rowtype;
    
    DebitAccID Integer;
    CreditAccID Integer;
    TrAmt Integer;
    TrDescription Varchar2(255);
    TempTrID Integer;
    DeltaCurrRate Number;
    ReserveDeltaAmt Number := 0;
              
  begin
  
    open c_PortfInfo(p_CreditID);
    fetch c_PortfInfo into PortfInfo;
    close c_PortfInfo;
    
    if PortfInfo.CURRENCY = 0 then -- National Currency
      return;
    end if;
    
    if CM_UTILS.CreditReserveContEnabled(PortfInfo.CREDITTYPE) <> 1 then
      return;
    end if;
    
    open c_CreditHist(p_CreditID);
    fetch c_CreditHist into HistInfo;
    close c_CreditHist;
    
    -- Correct Primary Reserve

    open c_Sysdat;
    fetch c_Sysdat into BankDate;
    close c_Sysdat;
    
    open c_CurrRate(BankDate.TEK_DAT,PortfInfo.CURRENCY);
    fetch c_CurrRate into CurrCurrRate; 
    close c_CurrRate;

    open c_CurrRate(BankDate.PRED_DAT,PortfInfo.CURRENCY);
    fetch c_CurrRate into PrevCurrRate; 
    close c_CurrRate;
    
    DeltaCurrRate := CurrCurrRate.OSTAT - PrevCurrRate.OSTAT;
    
    if DeltaCurrRate = 0 then
      return; 
    end if;   
    
    open c_Accounts(p_CreditID);
    fetch c_Accounts into AccInfoRec;
    close c_Accounts;
    
    if HistInfo.REST > 0 then -- Correcting Primary Reserves
      
      open c_Reserve(HistInfo.RESERVEID);
      fetch c_Reserve into Reserve;
      close c_Reserve;

      ReserveDeltaAmt := CM_UTILS.CalcPercent(
           p_sum => HistInfo.REST ,
           p_rate => Reserve.PERCENT * DeltaCurrRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         ); 
      
      if ReserveDeltaAmt <> 0 then -- Transaction Means (Menasi Var) 
       
      if ReserveDeltaAmt > 0 then -- Rate Incrised
       
        DebitAccID := CM_UTILS.lnkReserveAccount(
          p_custcategory =>  PortfInfo.CUSTOMERTYPE ,
          p_crdcurrency => PortfInfo.CURRENCY ,
          p_bankid => PortfInfo.BRANCHID
        );
           
        CreditAccID := AccInfoRec.PrimaryReserveAccID;
        
      else

        DebitAccID := AccInforec.PrimaryReserveAccID;
      
        CreditAccID := CM_UTILS.lnkReserveAccount(
          p_custcategory =>  PortfInfo.CUSTOMERTYPE ,
          p_crdcurrency => PortfInfo.CURRENCY ,
          p_bankid => PortfInfo.BRANCHID
        );
        
      end if;     

      TrAmt := Round(Abs(ReserveDeltaAmt),2);
            
      TrDescription := CM_UTILS.trDescReserveReduce();
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT);
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(BankDate.TEK_DAT,'DD/MM/YYYY'));
      
      TempTrID := 
      CM_TRANSACTIONMGR.SBAddTransaction(
               p_trid => null ,
               p_debitid => DebitAccID ,
               p_creditid => CreditAccID ,
               p_debitamount => TrAmt ,
               p_creditamount => TrAmt ,
               p_LAmount => TrAmt ,
               p_flags => SB_DECLS.atfCommitImmediate ,
               p_OperationType => CM_DECLS.cmTransactionOpType ,
               p_inbalancechar => null ,
               p_TransactionDate => BankDate.TEK_DAT ,
               p_TrName => TrDescription
            );
        
      end if; -- ReserveDeltaAmt <> 0
      
    end if; --Rest > 0
    

    if HistInfo.DUEREST > 0 then -- Correcting Primary Reserves
      
      open c_Reserve(HistInfo.DUERESERVEID);
      fetch c_Reserve into Reserve;
      close c_Reserve;

      ReserveDeltaAmt := CM_UTILS.CalcPercent(
           p_sum => HistInfo.DUEREST ,
           p_rate => Reserve.PERCENT * DeltaCurrRate ,
           p_coefficient => 1 ,
           p_delimmer => 1
         ); 
      
      if ReserveDeltaAmt <> 0 then -- Transaction Means (Menasi Var) 
       
      if ReserveDeltaAmt > 0 then -- Rate Incrised
       
        DebitAccID := CM_UTILS.lnkDueReserveAccount(
          p_custcategory =>  PortfInfo.CUSTOMERTYPE ,
          p_crdcurrency => PortfInfo.CURRENCY ,
          p_bankid => PortfInfo.BRANCHID
        );
           
        CreditAccID := AccInfoRec.SecondaryReserveAccID;
        
      else

        DebitAccID := AccInforec.SecondaryReserveAccID;
      
        CreditAccID := CM_UTILS.lnkDueReserveAccount(
          p_custcategory =>  PortfInfo.CUSTOMERTYPE ,
          p_crdcurrency => PortfInfo.CURRENCY ,
          p_bankid => PortfInfo.BRANCHID
        );
        
      end if;     

      TrAmt := Round(Abs(ReserveDeltaAmt),2);
            
      TrDescription := CM_UTILS.trDescReserveReduce();
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT);
      TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(BankDate.TEK_DAT,'DD/MM/YYYY'));
      
      TempTrID := 
      CM_TRANSACTIONMGR.SBAddTransaction(
               p_trid => null ,
               p_debitid => DebitAccID ,
               p_creditid => CreditAccID ,
               p_debitamount => TrAmt ,
               p_creditamount => TrAmt ,
               p_LAmount => TrAmt ,
               p_flags => SB_DECLS.atfCommitImmediate ,
               p_OperationType => CM_DECLS.cmTransactionOpType ,
               p_inbalancechar => null ,
               p_TransactionDate => BankDate.TEK_DAT ,
               p_TrName => TrDescription
            );
        
      end if; -- ReserveDeltaAmt <> 0
      
    end if; --DueRest > 0    
   
   commit work;
    
  end;  
END;
/

CREATE OR REPLACE 
PACKAGE cm_schedule
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
PACKAGE BODY cm_schedule
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

CREATE OR REPLACE 
PACKAGE cm_setup
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
PACKAGE BODY cm_setup
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

CREATE OR REPLACE 
PACKAGE cm_system
  IS
  procedure MarkStateHistory(CurrentBankDate in Date);
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_system
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

CREATE OR REPLACE 
PACKAGE cm_tranche
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
PACKAGE BODY cm_tranche
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
         OUTGUARANTEEACCID 
    from CM_ACCOUNTS
   where CreditID = CrdID;       
  
  PortfInfo c_PortfolioInfo%rowtype;
  HistInfo c_HistoryInfo%rowtype;
  Rates c_Rates%rowtype; 
  CrdAccs c_Accounts%rowtype;
  ReserveRate c_ReserveRate%rowtype;
   
  DebitAcc Integer;
  CreditAcc Integer;
  
  FirstTranche Boolean;
  Dummy Integer := CM_UTILS.UseLeft;
  TrAmount Number(18,2) := 0;
  Temp Number;
  
  ResultTrancheTrID Integer;
  ResultReserveTrID Integer;
  ResultObligationOutTrID Integer;
  
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
         
     CreditAcc := CrdAccs.PRIMARYRESERVEACCID;
     TrAmount := Round(Rates.OSTAT * Temp , 2);
     
     TrDescription := CM_UTILS.trDescReserveIncrease();
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescNumber,PortfInfo.NUMBEROFCREDIT); -- TODO
     TrDescription := Replace(TrDescription,CM_DECLS.TrDescDate,TO_CHAR(p_TrchDate,'DD/MM/YYYY'));
             
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
       
    -- Now Saving Tranche..... 
    
    insert into CM_TRANCHES(
      creditid , tranchedate , trancheamount ,  
      tranchetrid , reservetrid , obligationouttrid
    )  
    values(
      p_CreditID , p_TrchDate , p_TrchAmount , 
      ResultTrancheTrID , ResultReserveTrID , ResultObligationOutTrID
    );    
    
  end;          
  
  
  procedure CommitTranche(
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
           OBLIGATIONOUTTRID
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

CREATE OR REPLACE 
PACKAGE cm_transactionmgr
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
PACKAGE BODY cm_transactionmgr
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
       Result :=
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

     cursor c_SBOUT_Transactions(TrID in Integer) is
     select ID
       from SBOUT_PROVARCH
      where ID = TrID;
     
     TempRec c_SBOUT_Transactions%rowtype;
     
     Result Boolean ;      
   begin
     if p_SBLink then
     
       open c_SB_Transactions(p_TrID);
       fetch c_SB_Transactions into TempRec;
         Result := c_SB_Transactions%found;
       close c_SB_Transactions; 
       
     else
     
       open c_SBOUT_Transactions(p_TrID);
       fetch c_SBOUT_Transactions into TempRec;
         Result := c_SBOUT_Transactions%found;
       close c_SBOUT_Transactions; 
       
     end if;
     
     return Result;
      
   end;            
              
 END;
/

CREATE OR REPLACE 
PACKAGE cm_utils
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
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY cm_utils
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

CREATE OR REPLACE 
PACKAGE cm_wr_tools 
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
PACKAGE BODY cm_wr_tools 
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



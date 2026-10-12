-- Start of DDL Script for Package SMART.XS_CONTROL
-- Generated 1-Apr-2006 17:34:16 from SMART@SB

-- Drop the old instance of XS_CONTROL
DROP PACKAGE xs_control
/

CREATE OR REPLACE 
PACKAGE xs_control
  IS
  PROCEDURE XS_Beneficiary_delete(v_id INTEGER);
  PROCEDURE XS_Incoming_delete(v_id INTEGER);
  PROCEDURE XS_BATCHS_delete (v_id INTEGER);
  PROCEDURE XS_TRANSTYPE_CODE_delete (v_code INTEGER);
  PROCEDURE XS_TRANSTYPE_NAME_change (v_id INTEGER, v_name VARCHAR2, ins INTEGER);
  PROCEDURE XS_TRANSTYPE_CODE_change (v_id INTEGER, v_name VARCHAR2, v_code INTEGER);
  PROCEDURE xs_BatchAmount_update (v_id INTEGER);
  PROCEDURE xs_Config_Commision_Change (v_id INTEGER);
  FUNCTION xs_Batchs_ChangeStatus(v_id NUMBER, v_status NUMBER)
      RETURN INTEGER;
  PROCEDURE xs_beneficiary_ChangeStatus (v_id INTEGER, v_status INTEGER);
  PROCEDURE xs_incoming_ChangeStatus (v_id NUMBER, v_status NUMBER);
  PROCEDURE xs_config_change (oper INTEGER, v_value VARCHAR2);
  PROCEDURE xs_beneficiary_insert (
      v_BatchId            IN   xs_beneficiary.BatchID%TYPE,
      v_rec_bank_id        IN   xs_beneficiary.rec_bank_id%TYPE,
      v_rec_bank_sub_acc   IN   xs_beneficiary.rec_bank_sub_acc%TYPE,
      v_client_acc_no      IN   xs_beneficiary.client_acc_no%TYPE,
      v_client_name        IN   xs_beneficiary.client_name%TYPE,
      v_client_code        IN   xs_beneficiary.client_code%TYPE,
      v_client_inn         IN   xs_beneficiary.client_inn%TYPE,
      v_remit_inf          IN   xs_beneficiary.remit_inf%TYPE,
      v_trans_cod          IN   xs_beneficiary.trans_cod%TYPE,
      v_add_inf            IN   xs_beneficiary.add_inf%TYPE,
      v_val_cod            IN   xs_beneficiary.val_cod%TYPE,
      v_mess_ref           IN   xs_beneficiary.mess_reference%TYPE,
      v_amount             IN   xs_beneficiary.amount%TYPE,
      v_bnfcount           IN   xs_beneficiary.bnfcount%TYPE
   );
  PROCEDURE xs_Beneficiary_update (
      v_id                 IN   xs_beneficiary.id%TYPE,
      v_rec_bank_id        IN   xs_beneficiary.rec_bank_id%TYPE,
      v_rec_bank_sub_acc   IN   xs_beneficiary.rec_bank_sub_acc%TYPE,
      v_client_acc_no      IN   xs_beneficiary.client_acc_no%TYPE,
      v_client_name        IN   xs_beneficiary.client_name%TYPE,
      v_client_code        IN   xs_beneficiary.client_code%TYPE,
      v_client_inn         IN   xs_beneficiary.client_inn%TYPE,
      v_remit_inf          IN   xs_beneficiary.remit_inf%TYPE,
      v_trans_cod          IN   xs_beneficiary.trans_cod%TYPE,
      v_add_inf            IN   xs_beneficiary.add_inf%TYPE,
      v_val_cod            IN   xs_beneficiary.val_cod%TYPE,
      v_mess_ref           IN   xs_beneficiary.mess_reference%TYPE,
      v_amount             IN   xs_beneficiary.amount%TYPE,
      v_bnfcount           IN   xs_beneficiary.bnfcount%TYPE
   );
  FUNCTION xs_batchs_insert (
      v_opercode      IN   xs_batchs.opercode%TYPE,
      v_acc_id        IN   xs_batchs.acc_id%TYPE,
      v_client_name   IN   xs_batchs.client_name%TYPE,
      v_client_code   IN   xs_batchs.client_code%TYPE,
      v_trans_ref     IN   xs_batchs.trans_ref%TYPE,
      v_amount        IN   xs_batchs.amount%TYPE,
      v_val_acc       IN   xs_batchs.val_acc%TYPE,
      v_status        IN   xs_batchs.status%TYPE
   )
      RETURN INTEGER;
  PROCEDURE xs_Batchs_update (
      v_id            IN   xs_batchs.id%TYPE,
      v_opercode      IN   xs_batchs.opercode%TYPE,
      v_acc_id        IN   xs_batchs.acc_id%TYPE,
      v_client_name   IN   xs_batchs.client_name%TYPE,
      v_client_code   IN   xs_batchs.client_code%TYPE,
      v_trans_ref     IN   xs_batchs.trans_ref%TYPE,
      v_amount        IN   xs_batchs.amount%TYPE,
      v_val_acc       IN   xs_batchs.val_acc%TYPE,
      v_filial        IN   xs_batchs.filial%TYPE,
      v_client_inn    IN   xs_batchs.client_inn%TYPE
   );
  PROCEDURE xs_SentInfo_insert (
      v_format           IN   xs_sentinfo.format%TYPE,
      v_sender           IN   xs_sentinfo.sender%TYPE,
      v_receiver         IN   xs_sentinfo.receiver%TYPE,
      v_type             IN   xs_sentinfo.TYPE%TYPE,
      v_priority         IN   xs_sentinfo.priority%TYPE,
      v_notif_rq         IN   xs_sentinfo.notif_rq%TYPE,
      v_user_priority    IN   xs_sentinfo.user_priority%TYPE,
      v_create_date      IN   xs_sentinfo.create_date%TYPE,
      v_user_reference   IN   xs_sentinfo.user_reference%TYPE,
      v_batch            IN   xs_sentinfo.batchfile%TYPE
   );
  FUNCTION CheckReadingBatch (v_id INTEGER, v_status INTEGER)
      RETURN INTEGER;
  FUNCTION GetBatchAmount
      RETURN NUMBER;
  FUNCTION GetDefaultDate
      RETURN DATE;
  FUNCTION GetNewBatchRefrence (v_valute INTEGER)
      RETURN VARCHAR2;
  FUNCTION GetNewBeneficiaryReference
      RETURN VARCHAR2;
  FUNCTION GetNewFileReference
      RETURN VARCHAR2;
  PROCEDURE SetBatchsTransaction (v_id NUMBER);
  PROCEDURE SetIncomingTransaction (v_id NUMBER);
  PROCEDURE xs_Incoming_upate (
      v_id       IN   xs_incoming.id%TYPE,
      v_acc_id   IN   xs_incoming.rec_client_acc_id%TYPE,
      v_acc_no   IN   xs_incoming.rec_client_acc%TYPE
   );
  PROCEDURE BatchToReadyBatchs (v_id INTEGER default null, SendAll INTEGER);
  PROCEDURE BatchToSendingBatchs (v_id INTEGER DEFAULT NULL, SendAll INTEGER);
  PROCEDURE xs_accounts_add (v_valute INTEGER, v_id INTEGER, v_branchID INTEGER);
  PROCEDURE XS_BranchAccount_add (v_Valute INTEGER, v_ID INTEGER, v_BranchID INTEGER);
  PROCEDURE BANKM_ADDINFO;
  PROCEDURE UpdateBatchReference (
      v_id           INTEGER,
      newreference   xs_batchs.trans_ref%TYPE
   );
  procedure SendToArchive;
  PROCEDURE xs_Beneficiary_shablon_insert (
    P_mebleg                         VARCHAR2,
    P_odenish_kod                    VARCHAR2,
    P_bankin_kodu                    VARCHAR2,
    P_hesab_no                       VARCHAR2,
    P_adi                            VARCHAR2,
    P_kodu                           VARCHAR2,
    P_voen                           VARCHAR2,
    P_od_tey1                        VARCHAR2,
    P_od_tey2                        VARCHAR2,
    P_od_tey3                        VARCHAR2,
    P_od_tey4                        VARCHAR2,
    P_elave_mel1                     VARCHAR2,
    P_elave_mel2                     VARCHAR2,
    P_elave_mel3                     VARCHAR2,
    P_shablonun_adi                  VARCHAR2,
    P_bankin_adi                     VARCHAR2
   ); 
   PROCEDURE xs_Beneficiary_shablon_delete (P_shablonun_adi       VARCHAR2);
END;
/


CREATE OR REPLACE 
PACKAGE BODY xs_control
IS
   
--------------------------------------------------------------------------------
PROCEDURE SetIncomingTransaction (v_id NUMBER)
IS
  transactionid    NUMBER;
  accountval_kod   NUMBER;
  v_commisionid    NUMBER;
  v_debitid        NUMBER;
  v_creditid       NUMBER;
  v_amount         NUMBER;
  v_valute         NUMBER;
  v_trname         VARCHAR2 (255);
  Credit_ID        Number;
  accountclosed    NUMBER;
  v_Filial         Number;
  v_CorAccount     Number;
BEGIN
  v_valute :=0; /*** LVPCSS works only with AZM ***/
  
  select 
   Rec_Client_Acc_ID,Amount,Sen_Name,  Filial
    into
   v_CreditID,     v_Amount,v_TrName,v_Filial
    from XS_Incoming
     where ID = v_ID; 
     
  select  CommisionID,  CorAccount
   into v_CommisionID,v_CorAccount 
   from XS_Config;
   
  select Acc_ID
    into v_DebitID
    from XS_Accounts
     where (valute = v_valute) and (BranchID = v_Filial);

  /***if account belongs to branch, then 1052--->2801***/
  if v_CorAccount <> v_DebitID then
  select AccID 
    into Credit_ID
    from XS_BranchAccount
   where (valute = v_valute) and (BranchID = v_Filial);
  TransactionID :=
   SB_Transaction.Transaction_Add (
      DebitID         => v_CorAccount,
      CreditID        => Credit_ID,
      DebitAmount     => v_Amount,
      CreditAmount    => null,
      LAmount         => null,
      DebitRate       => null,
      CreditRate      => null,
      TrName          => 'Щесаба дахилолма - ' || v_TrName,
      Flags           => 0,
      ParentID        => null,
      OperationType   => 15,
      TransactionDate => GetDefaultDate);
  end if;/***if account belongs to branch***/
     
      --Check for closed account 
      SELECT id
        INTO accountclosed
        FROM ACCOUNT
       WHERE (id = v_creditid) AND (close_dat IS NULL);

      --check credit account 
  IF  (v_creditid > 0) AND (accountclosed > 0)
   THEN        
         
         transactionid :=
               sb_transaction.transaction_add (
                  debitid=> v_debitid,
                  creditid=> v_creditid,
                  debitamount=> v_amount,
                  creditamount=> NULL,
                  lamount=> NULL,
                  debitrate=> NULL,
                  creditrate=> NULL,
                  trname=>    'Щесаба дахилолма - '
                           || v_trname,
                  flags => 0,
                  parentid=> NULL,
                  
--                               inbalancechar => 0,
--                               outbalancechar => 0,
--                               transactionid => null,
--                               parentid => null,
--                               tempid => null,
                  operationtype=> 15,
                  transactiondate=> getdefaultdate
               );
         -- CHANGE ICON to accept                     
         xs_incoming_ChangeStatus (v_id, 1);
      ELSE
         -- CHANGE ICON to reject                                             
         xs_incoming_ChangeStatus (v_id, 2);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         xs_incoming_ChangeStatus (v_id, 2);
         DBMS_OUTPUT.put_line (
            SUBSTR (   'Error '
                    || TO_CHAR (SQLCODE)
                    || ': '
                    || SQLERRM, 1, 255)
         );
         COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE SetBatchsTransaction (v_id NUMBER)
   IS
      CURSOR creditmessages
      IS
         SELECT *
           FROM xs_beneficiary
          WHERE BatchID = v_id;

      messages           creditmessages%ROWTYPE;
      transactionid      NUMBER;
      v_debitid          NUMBER;
      v_creditid         NUMBER;
      v_commisionid      NUMBER;
      accountval_kod     NUMBER;
      debit_id           NUMBER;
      curs               NUMBER (22, 2);
      iconresult         NUMBER;
      customersid        INTEGER;
      reject_commision   INTEGER;
      bal_cn             INTEGER;
      TransactionsDate   DATE;
      ClientAccount      INTEGER;
      TransName          VARCHAR (250);
   BEGIN
      OPEN creditmessages;

      LOOP
         FETCH creditmessages INTO messages;
         EXIT WHEN creditmessages%NOTFOUND;

         SELECT Acc_ID
           INTO v_DebitID
           FROM XS_BATCHS
          WHERE ID = v_ID;

         SELECT Acc_ID
           INTO v_CreditID
           FROM XS_ACCOUNTS
          WHERE (Valute = Messages.Val_Cod)
            AND (BranchID IN (SELECT FILIAL
                                FROM XS_BATCHS
                               WHERE ID = V_ID)
                );

         SELECT CommisionID
           INTO v_CommisionID
           FROM XS_CONFIG;

         SELECT acc_id
           INTO debit_id
           FROM XS_BATCHS
          WHERE (id = messages.BatchID);

         SELECT val_acc
           INTO accountval_kod
           FROM ACCOUNT
          WHERE (id = debit_id);

         SELECT ostat
           INTO curs
           FROM operkurs
          WHERE (val_kod = accountval_kod) AND (dat = sbop.get_date);

         --Bank daxili hesablardan commisiya 
         SELECT bal_cn1
           INTO bal_cn
           FROM ACCOUNT
          WHERE (id = debit_id) AND (close_dat IS NULL);

         IF ((bal_cn >= 3300) AND (bal_cn <= 3999))
         THEN
            CLIENTACCOUNT := 1;
            TransName :=    'Кючцрмя - '
                         || TO_CHAR (messages.amount);
         ELSE
            CLIENTACCOUNT := 0;
            TransName :=    'Кючцрмя - '
                         || messages.client_name;
         END IF;

         TransactionsDate := GetDefaultDate;
         Transactionid :=
               sb_transaction.transaction_add (
                  debitid=> v_debitid,
                  creditid=> v_creditid,
                  debitamount=> NULL,
                  creditamount=> messages.amount,
                  lamount=> NULL,
                  debitrate=> NULL,
                  creditrate=> NULL,
                  trname=> TransName,
                  flags => 0,
                  -- inbalancechar => 0,
                  -- outbalancechar => 0,
                  -- transactionid => null,
                  -- parentid => null,
                  -- tempid => null
                  parentid=> NULL,
                  operationtype=> 15,
                  transactiondate=> TransactionsDate
               );

         --Set Transaction ID
         UPDATE XS_BENEFICIARY
            SET transaction_id = transactionid
          WHERE (BatchID = v_id) AND (id = messages.id);

         --CHILD TRANSACTION
		/*		 IF CLIENTACCOUNT = 1
         THEN
            sb_complex_transactions.settransactions (
               v_commisionid,
               v_debitid,
               v_creditid,
               messages.amount,
               messages.amount,
               TransactionsDate
            );
         END IF;  */
         
        --  2801--->1052  --
        select AccID into v_DebitID from XS_BranchAccount
         where (Valute = Messages.Val_Cod)
           and (BranchID in (select Filial
                               from XS_BATCHS
                              where ID = v_ID));
        select CorAccount into v_CreditID from XS_Config;                      
        
        if v_DebitID > 0 then   
        TransName :=    'Кючцрмя - '
                         || messages.client_name;
                            
         TransactionID :=
               SB_Transaction.Transaction_Add (
                  DebitID=> v_DebitID,
                  CreditID=> v_CreditID,
                  DebitAmount=> NULL,
                  CreditAmount=> Messages.Amount,
                  Lamount=> NULL,
                  DebitRate=> NULL,
                  CreditRate=> NULL,
                  TrName=> TransName,
                  Flags => 0,
                  -- inbalancechar => 0,
                  -- outbalancechar => 0,
                  -- transactionid => null,
                  -- parentid => null,
                  -- tempid => null
                  ParentID=> NULL,
                  OperationType=> 15,
                  TransactionDate=> TransactionsDate
               );
           end if; --if v_DebitID > 0    
      END LOOP;

      CLOSE CreditMessages;

      --APPLY TRANSID                                                  
      UPDATE XS_BATCHS
         SET send = 0
       WHERE id = v_id;
   EXCEPTION
      WHEN OTHERS
      THEN
         BEGIN
            ROLLBACK WORK;
            iconresult := xs_Batchs_ChangeStatus (v_id, 0);
            RAISE_APPLICATION_ERROR (
               -20998,
               SUBSTR (
                     'Error '
                  || TO_CHAR (SQLCODE)
                  || ': '
                  || SQLERRM,
                  1,
                  255
               )
            );
         END;

         COMMIT WORK;
   END;

   PROCEDURE xs_incoming_ChangeStatus (v_id NUMBER, v_status NUMBER)
   IS
   BEGIN
      UPDATE xs_incoming
         SET status = v_status
       WHERE id = v_id;

      COMMIT;
   END;

   PROCEDURE xs_Incoming_upate (
      v_id       IN   xs_incoming.id%TYPE,
      v_acc_id   IN   xs_incoming.rec_client_acc_id%TYPE,
      v_acc_no   IN   xs_incoming.rec_client_acc%TYPE
   )
   IS
      filialid   NUMBER;
   BEGIN
      SELECT filial
        INTO filialid
        FROM ACCOUNT
       WHERE (id = v_acc_id);

      IF    (filialid = 0)
         OR (filialid IS NULL)
      THEN
         filialid := 0;
      END IF;

      UPDATE xs_Incoming
         SET rec_client_acc_id = v_acc_id,
             rec_client_acc = v_acc_no,
             filial = filialid
       WHERE id = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_Batchs_update (
      v_id            IN   xs_batchs.id%TYPE,
      v_opercode      IN   xs_batchs.opercode%TYPE,
      v_acc_id        IN   xs_batchs.acc_id%TYPE,
      v_client_name   IN   xs_batchs.client_name%TYPE,
      v_client_code   IN   xs_batchs.client_code%TYPE,
      v_trans_ref     IN   xs_batchs.trans_ref%TYPE,
      v_amount        IN   xs_batchs.amount%TYPE,
      v_val_acc       IN   xs_batchs.val_acc%TYPE,
      v_filial        IN   xs_batchs.filial%TYPE,
      v_client_inn    IN   xs_batchs.client_inn%TYPE
   )
   IS
   BEGIN
      UPDATE xs_Batchs
         SET opercode = v_opercode,
             acc_id = v_acc_id,
             client_name = v_client_name,
             client_code = v_client_code,
             trans_ref = v_trans_ref,
             amount = v_amount,
             val_acc = v_val_acc,
             filial = v_filial,
             client_inn = v_client_inn,
             transdate = getdefaultdate
       WHERE id = v_id;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_Beneficiary_update (
      v_id                 IN   xs_beneficiary.id%TYPE,
      v_rec_bank_id        IN   xs_beneficiary.rec_bank_id%TYPE,
      v_rec_bank_sub_acc   IN   xs_beneficiary.rec_bank_sub_acc%TYPE,
      v_client_acc_no      IN   xs_beneficiary.client_acc_no%TYPE,
      v_client_name        IN   xs_beneficiary.client_name%TYPE,
      v_client_code        IN   xs_beneficiary.client_code%TYPE,
      v_client_inn         IN   xs_beneficiary.client_inn%TYPE,
      v_remit_inf          IN   xs_beneficiary.remit_inf%TYPE,
      v_trans_cod          IN   xs_beneficiary.trans_cod%TYPE,
      v_add_inf            IN   xs_beneficiary.add_inf%TYPE,
      v_val_cod            IN   xs_beneficiary.val_cod%TYPE,
      v_mess_ref           IN   xs_beneficiary.mess_reference%TYPE,
      v_amount             IN   xs_beneficiary.amount%TYPE,
      v_bnfcount           IN   xs_beneficiary.bnfcount%TYPE
   )
   IS
   BEGIN
      UPDATE xs_Beneficiary
         SET rec_bank_id = v_rec_bank_id,
             rec_bank_sub_acc = v_rec_bank_sub_acc,
             client_acc_no = v_client_acc_no,
             client_name = v_client_name,
             client_code = v_client_code,
             client_inn = v_client_inn,
             remit_inf = v_remit_inf,
             trans_cod = v_trans_cod,
             add_inf = v_add_inf,
             val_date = getdefaultdate,
             val_cod = v_val_cod,
             mess_reference = v_mess_ref,
             amount = v_amount,
             bnfcount = v_bnfcount
       WHERE id = v_id;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_BatchAmount_update (v_id INTEGER)
   IS
      amountsum   NUMBER (22, 2);
   BEGIN
      SELECT SUM (amount)
        INTO amountsum
        FROM XS_BENEFICIARY
       WHERE BatchID = v_id;

      UPDATE XS_BATCHS
         SET amount = amountsum
       WHERE id = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION xs_batchs_insert (
      v_opercode      IN   xs_batchs.opercode%TYPE,
      v_acc_id        IN   xs_batchs.acc_id%TYPE,
      v_client_name   IN   xs_batchs.client_name%TYPE,
      v_client_code   IN   xs_batchs.client_code%TYPE,
      v_trans_ref     IN   xs_batchs.trans_ref%TYPE,
      v_amount        IN   xs_batchs.amount%TYPE,
      v_val_acc       IN   xs_batchs.val_acc%TYPE,
      v_status        IN   xs_batchs.status%TYPE
   )
      RETURN INTEGER
   IS
      result   INTEGER;
   BEGIN
      INSERT INTO xs_batchs
                  (opercode, acc_id, client_name, client_code,
                   trans_ref, amount, val_acc, transdate,
                   status)
           VALUES (v_opercode, v_acc_id, v_client_name, v_client_code,
                   v_trans_ref, v_amount, v_val_acc, getdefaultdate,
                   v_status)
        RETURNING id
             INTO result;

      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_beneficiary_insert (
      v_BatchId            IN   xs_beneficiary.BatchID%TYPE,
      v_rec_bank_id        IN   xs_beneficiary.rec_bank_id%TYPE,
      v_rec_bank_sub_acc   IN   xs_beneficiary.rec_bank_sub_acc%TYPE,
      v_client_acc_no      IN   xs_beneficiary.client_acc_no%TYPE,
      v_client_name        IN   xs_beneficiary.client_name%TYPE,
      v_client_code        IN   xs_beneficiary.client_code%TYPE,
      v_client_inn         IN   xs_beneficiary.client_inn%TYPE,
      v_remit_inf          IN   xs_beneficiary.remit_inf%TYPE,
      v_trans_cod          IN   xs_beneficiary.trans_cod%TYPE,
      v_add_inf            IN   xs_beneficiary.add_inf%TYPE,
      v_val_cod            IN   xs_beneficiary.val_cod%TYPE,
      v_mess_ref           IN   xs_beneficiary.mess_reference%TYPE,
      v_amount             IN   xs_beneficiary.amount%TYPE,
      v_bnfcount           IN   xs_beneficiary.bnfcount%TYPE
   )
   IS
   BEGIN
      INSERT INTO xs_beneficiary
                  (BatchID, rec_bank_id, rec_bank_sub_acc,
                   client_acc_no, client_name, client_code,
                   client_inn, remit_inf, trans_cod, add_inf,
                   val_date, val_cod, amount, mess_reference,
                   bnfcount)
           VALUES (v_BatchId, v_rec_bank_id, v_rec_bank_sub_acc,
                   v_client_acc_no, v_client_name, v_client_code,
                   v_client_inn, v_remit_inf, v_trans_cod, v_add_inf,
                   getdefaultdate, v_val_cod, v_amount, v_mess_ref,
                   v_bnfcount);
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_SentInfo_insert (
      v_format           IN   xs_sentinfo.format%TYPE,
      v_sender           IN   xs_sentinfo.sender%TYPE,
      v_receiver         IN   xs_sentinfo.receiver%TYPE,
      v_type             IN   xs_sentinfo.TYPE%TYPE,
      v_priority         IN   xs_sentinfo.priority%TYPE,
      v_notif_rq         IN   xs_sentinfo.notif_rq%TYPE,
      v_user_priority    IN   xs_sentinfo.user_priority%TYPE,
      v_create_date      IN   xs_sentinfo.create_date%TYPE,
      v_user_reference   IN   xs_sentinfo.user_reference%TYPE,
      v_batch            IN   xs_sentinfo.batchfile%TYPE
   )
   IS
   BEGIN
      INSERT INTO xs_sentinfo
                  (format, sender, receiver, TYPE, priority,
                   notif_rq, user_priority, create_date,
                   user_reference, batchfile)
           VALUES (v_format, v_sender, v_receiver, v_type, v_priority,
                   v_notif_rq, v_user_priority, v_create_date,
                   v_user_reference, v_batch);

      UPDATE xs_batchs
         SET status = 3
       WHERE send = 1;

      UPDATE xs_batchs
         SET send = 0
       WHERE send = 1;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_incoming_delete (v_id INTEGER)
   IS
   BEGIN
      DELETE      xs_incoming
            WHERE id = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_beneficiary_delete (v_id INTEGER)
   IS
   BEGIN
      DELETE      xs_beneficiary
            WHERE id = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_batchs_delete (v_id INTEGER)
   IS
   BEGIN
      DELETE      xs_batchs
            WHERE id = v_id;

      DELETE      xs_beneficiary
            WHERE BatchID = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_transtype_code_delete (v_code INTEGER)
   IS
   BEGIN
      DELETE      xs_transtype_code
            WHERE code = v_code;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION GetNewBatchRefrence (v_valute INTEGER)
      RETURN VARCHAR2
   IS
      nw       INTEGER;
      result   VARCHAR2 (36);
      cur      VARCHAR (3);
   BEGIN
      SELECT XS_BATCHS_REFERENCE_GEN.NEXTVAL
        INTO nw
        FROM DUAL;

      SELECT val_name
        INTO cur
        FROM avalute
       WHERE valute = v_valute;

      result :=    TO_CHAR (nw)
                || cur
                || TO_CHAR (SYSDATE, 'YYMMDD');
      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION GetNewBeneficiaryReference
      RETURN VARCHAR2
   IS
      result   VARCHAR2 (10);
   BEGIN
      SELECT XS_BENEFICIARY_REFERENCE_GEN.NEXTVAL
        INTO result
        FROM DUAL;

      result :=    'MBA'
                || RESULT;
      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION GetNewFileReference
      RETURN VARCHAR2
   IS
      result   VARCHAR2 (20);
   BEGIN
      SELECT XS_FILE_REFERENCE_GEN.NEXTVAL
        INTO result
        FROM DUAL;

      result :=    TO_CHAR (SYSDATE, 'YYMMDD')
                || 'IBI'
                || Result;
      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_beneficiary_ChangeStatus (v_id INTEGER, v_status INTEGER)
   IS
   BEGIN
      UPDATE xs_beneficiary
         SET status = v_status
       WHERE id = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION xs_Batchs_ChangeStatus (v_id NUMBER, v_status NUMBER)
      RETURN INTEGER
   IS
      result         INTEGER;
      v_accept       INTEGER;
      messagecount   INTEGER;
   BEGIN
      --If message no commited
      IF v_status = 0
      THEN
         UPDATE XS_BATCHS
            SET status = v_status
          WHERE id = v_id;

         result := 1;
         COMMIT;
      END IF;

      IF v_status = 1
      THEN
         SELECT COUNT (*)
           INTO v_accept
           FROM XS_BENEFICIARY
          WHERE (status = 1) AND (BatchID = v_id);

         SELECT COUNT (*)
           INTO messagecount
           FROM XS_BENEFICIARY
          WHERE (BatchID = v_id);

         IF (v_accept = messagecount)
         THEN
            UPDATE XS_BATCHS
               SET status = v_status
             WHERE id = v_id;

            result := 1;
            COMMIT;
         ELSE
            result := 0;
         END IF;
      END IF;

      IF v_status = 2
      THEN
         UPDATE XS_BATCHS
            SET status = v_status
          WHERE id = v_id;

         result := 1;
         COMMIT;
      END IF;

      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_transtype_code_change (
      v_id     INTEGER,
      v_name   VARCHAR2,
      v_code   INTEGER
   )
   IS
      fn   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO fn
        FROM xs_transtype_code
       WHERE code = v_code;

      IF fn = 0
      THEN
         INSERT INTO xs_transtype_code
                     (nameid, NAME, code)
              VALUES (v_id, v_name, v_code);
      ELSE
         UPDATE xs_transtype_code
            SET nameid = v_id,
                NAME = v_name,
                code = v_code;
      END IF;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_transtype_name_change (
      v_id     INTEGER,
      v_name   VARCHAR2,
      ins      INTEGER
   )
   IS
   BEGIN
      IF ins = 1
      THEN
         INSERT INTO xs_transtype_name
                     (NAME)
              VALUES (v_name);
      ELSIF ins = 0
      THEN
         BEGIN
            DELETE FROM xs_transtype_code
                  WHERE nameid = v_id;

            DELETE FROM xs_transtype_name
                  WHERE id = v_id;
         END;
      END IF;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_config_change (oper INTEGER, v_value VARCHAR2)
   IS
   BEGIN
      IF oper = 1
      THEN
         UPDATE xs_config
            SET ACCOUNT = v_value;
      END IF;

      IF oper = 2
      THEN
         UPDATE xs_config
            SET amount_limit = TO_NUMBER (v_value);
      END IF;

      IF oper = 3
      THEN
         UPDATE xs_config
            SET in_dir = v_value;
      END IF;

      IF oper = 4
      THEN
         UPDATE xs_config
            SET out_dir = v_value;
      END IF;

      IF oper = 5
      THEN
         UPDATE xs_config
            SET archive_dir = v_value;
      END IF;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE xs_accounts_add (v_valute INTEGER, v_id INTEGER, v_branchID INTEGER)
   IS
      val_exists   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO val_exists
        FROM xs_accounts
       WHERE valute = v_valute AND BRANCHID = v_branchID;

      IF val_exists > 0
      THEN
         UPDATE xs_accounts
            SET acc_id = v_id
          WHERE valute = v_valute AND BRANCHID = v_branchID;
      ELSE
         INSERT INTO xs_accounts
                     (acc_id, valute, BRANCHID)
              VALUES (v_id, v_valute, V_BRANCHID);
      END IF;

      COMMIT WORK;
   END;   
--------------------------------------------------------------------------------
PROCEDURE XS_BranchAccount_Add (v_Valute INTEGER, v_ID INTEGER, v_BranchID INTEGER)
IS
  val_exists   INTEGER;
BEGIN
  select count(*)
    into val_exists
    from XS_BranchAccount
   where valute = v_valute and BranchID = v_BranchID;

  if val_exists > 0
   then update XS_BranchAccount
           set AccID = v_ID
         where Valute = v_Valute and BranchID = v_BranchID;
   else insert into XS_BranchAccount
               (AccID, Valute,  BranchID)
               values 
               (v_ID,v_Valute,v_BranchID);
  end if;

  commit work;
END;
--------------------------------------------------------------------------------
   PROCEDURE xs_Config_Commision_Change (v_id INTEGER)
   IS
   BEGIN
      UPDATE XS_CONFIG
         SET CommisionId = v_id;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION CheckReadingBatch (v_id INTEGER, v_status INTEGER)
      RETURN INTEGER
   IS
      result         INTEGER;
      noaccept       INTEGER;
      messagecount   INTEGER;
      globalaccept   INTEGER;
   BEGIN
      SELECT COUNT (*)
        INTO noaccept
        FROM xs_beneficiary
       WHERE (NOT (status = v_status)) AND (BatchID = v_id);

      SELECT COUNT (*)
        INTO globalaccept
        FROM xs_beneficiary
       WHERE (transaction_id NOT IN
                          (SELECT id
                             FROM provdoc
                            WHERE dat = GetDefaultDate)
             )
         AND (BatchID = v_id);

      IF  (noaccept = 0) AND (globalaccept = 0)
      THEN
         result := 1;
      ELSE
         result := 0;
      END IF;

      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE BatchToReadyBatchs (v_id INTEGER DEFAULT NULL, SendAll INTEGER)
   IS
      maxamount   NUMBER (22, 2);
   BEGIN
      SELECT Amount_limit
        INTO maxamount
        FROM XS_CONFIG;

      IF SendAll = 0
      THEN
         UPDATE XS_SendingBatchs
            SET send = 0
          WHERE id = v_id;
      ELSIF SendAll = 1
      THEN
         UPDATE XS_SendingBatchs
            SET send = 0;
      END IF;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE BatchToSendingBatchs (v_id INTEGER DEFAULT NULL, SendAll INTEGER)
   IS
   BEGIN
      IF SendAll = 0
      THEN
         UPDATE xs_readybatchs
            SET send = 1
          WHERE (id = v_id);
      ELSIF SendAll = 1
      THEN
         UPDATE xs_readybatchs
            SET send = 1;
      END IF;

      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION GetBatchAmount
      RETURN NUMBER
   IS
      result   NUMBER (22, 2);
   BEGIN
      SELECT SUM (amount)
        INTO result
        FROM XS_BATCHS
       WHERE send = 1;

      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   FUNCTION GetDefaultDate
      RETURN DATE
   IS
      v_usebankdate   INTEGER;
      result          DATE;
   BEGIN
      SELECT usebankdate
        INTO v_usebankdate
        FROM xs_config;

      IF v_usebankdate = 1
      THEN
         result := sbop.get_date;
      ELSE
         result := TRUNC (SYSDATE);
      END IF;

      RETURN result;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE BANKM_ADDINFO
   IS
      CURSOR C_BANKM
      IS
         SELECT *
           FROM BANKM;

      R_BANKM    C_BANKM%ROWTYPE;
      TEMPSTR    VARCHAR2 (20);
      TEMPSTR1   VARCHAR2 (20);
   BEGIN
      OPEN C_BANKM;

      LOOP
         FETCH C_BANKM INTO R_BANKM;
         EXIT WHEN C_BANKM%NOTFOUND;
         TEMPSTR1 := R_BANKM.KRNO;
         TEMPSTR := CONCAT (
                          '0'
                       || SUBSTR (TEMPSTR1, 0, 5)
                       || '3',
                       SUBSTR (TEMPSTR1, 7, 7)
                    );

         
--  dbms_output.put_line(TEMPSTR);
         UPDATE BANKM
            SET SUBKRNO = TEMPSTR
          WHERE ID = R_BANKM.ID;
      END LOOP;

      CLOSE C_BANKM;
      COMMIT WORK;
   END;

   
--------------------------------------------------------------------------------
   PROCEDURE UpdateBatchReference (
      v_id           INTEGER,
      newreference   xs_batchs.trans_ref%TYPE
   )
   IS
   BEGIN
      UPDATE XS_BATCHS
         SET TRANS_REF = NEWREFERENCE
       WHERE ID = V_ID;

      COMMIT;
   END;
   
procedure SendToArchive
is
  v_UseBankDate integer;
  GetDate date;
begin
select UseBankDate into v_UseBankDate from XS_Config; 
if v_UseBankDate=0 then GetDate :=to_date(sysdate); end if;
if v_UseBankDate=1 then GetDate :=SBOP.Get_Date; end if;
 
insert into XS_Batchs_Archive
 select * from XS_Batchs 
  where TransDate <> GetDate;
insert into XS_Beneficiary_Archive
 select * from XS_Beneficiary 
  where Val_Date <> GetDate;
  
delete from XS_Batchs
 where TransDate <> GetDate;
delete from XS_Beneficiary
 where Val_Date <> GetDate;
 
commit;
end;   
--------------------------------------------------------------------------------
   PROCEDURE xs_Beneficiary_shablon_insert (
    P_mebleg                         VARCHAR2,
    P_odenish_kod                    VARCHAR2,
    P_bankin_kodu                    VARCHAR2,
    P_hesab_no                       VARCHAR2,
    P_adi                            VARCHAR2,
    P_kodu                           VARCHAR2,
    P_voen                           VARCHAR2,
    P_od_tey1                        VARCHAR2,
    P_od_tey2                        VARCHAR2,
    P_od_tey3                        VARCHAR2,
    P_od_tey4                        VARCHAR2,
    P_elave_mel1                     VARCHAR2,
    P_elave_mel2                     VARCHAR2,
    P_elave_mel3                     VARCHAR2,
    P_shablonun_adi                  VARCHAR2,
    P_bankin_adi                     VARCHAR2
   )
   IS
   BEGIN
      INSERT INTO xs_beneficiary_shablon
                  ( mebleg,
                    odenish_kod,
                    bankin_kodu,
                    hesab_no,
                    adi,
                    kodu,
                    voen,
                    od_tey1,
                    od_tey2,
                    od_tey3,
                    od_tey4,
                    elave_mel1,
                    elave_mel2,
                    elave_mel3,
                    shablonun_adi,
                    bankin_adi)
           VALUES ( P_mebleg,
                    P_odenish_kod,
                    P_bankin_kodu,
                    P_hesab_no,
                    P_adi,
                    P_kodu,
                    P_voen,
                    P_od_tey1,
                    P_od_tey2,
                    P_od_tey3,
                    P_od_tey4,
                    P_elave_mel1,
                    P_elave_mel2,
                    P_elave_mel3,
                    P_shablonun_adi,
                    P_bankin_adi
                   );
      COMMIT;
   END;

   
--------------------------------------------------------------------------------

   PROCEDURE xs_Beneficiary_shablon_delete (P_shablonun_adi       VARCHAR2)
   IS
   BEGIN
      delete from xs_beneficiary_shablon
      where SHABLONUN_ADI=P_shablonun_adi;
      COMMIT;
   END;

   
--------------------------------------------------------------------------------
   
END;
/


-- End of DDL Script for Package SMART.XS_CONTROL


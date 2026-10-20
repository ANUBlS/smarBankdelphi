"""Verbatim SQL of the NewDepositsManager plugin (NewDepositsManager/NewDepositsManager/NewDepositDataModule.dfm).

SQL.Strings lines are joined with CRLF as DOA sends them. :OrderField is a DOA substitution variable (otSubst),
filled only with a whitelisted column name (deposits.ORDER_FIELDS)."""

CRLF = "\r\n"


def text(lines):
    return CRLF.join(lines)


# Valutes (dfm:7-24)
SQL_VALUTES = text(["select valute,valu_name ",
                    "from avalute"])
# Filials (dfm:30-48)
SQL_FILIALS = text(["select id,name from ",
                    "filial",
                    "order by id "])
# dm_types (dfm:54-72)
SQL_DM_TYPES = text(["select id,type",
                     "from dm_types"])
# dm_categories (dfm:78-94)
SQL_DM_CATEGORIES = text(["select id,category from dm_categories"])
# dm_persons (dfm:100-114)
SQL_DM_PERSONS = text(["select id,name from dm_persons"])
# BankDate (dfm:120-132)
SQL_BANKDATE = text(["select tek_dat from sysdat"])
# FilialID (dfm:138-149)
SQL_FILIALID = text(["select kod_fil from bankinfo"])
# users (dfm:163-181) - opened in DataModuleCreate, its combo (LCBUsers) is commented out of the form
SQL_USERS = text(["select id,name from user$",
                  "where id in (select sid# from dm_contracts group by sid#)"])
# DmDataSet (dfm:198-381) - the main grid
SQL_DMDATASET = text([
    "select cont.rowid,",
    "       cont.id,",
    "       cont.contractno,",
    "       av.val_name,",
    "       dm_stored_programs.getcustomername(cont.customerid) as CustomerName,",
    "       cont.opendate,",
    "       cont.closedate,",
    "       cont.amount,",
    "       interest,      ",
    "       (select sum(facticaldebt) from dm_history_currstate where id#=cont.id) as facticaldebt ,",
    "       (select sum(facticalinterestdebt) from dm_history_currstate where id#=cont.id) as facticalinterestdebt,",
    "       (select ostat from tenostat where acc_id=acc.clientaccid) as ostat,",
    "      (select type from dm_types where id=cont.contracttype)as contracttypename,",
    "       cont.currency,",
    "       cont.personaltype,",
    "       cont.clienttype,",
    "       cont.branchid,",
    "       cont.contracttype,",
    "       cont.customerid,",
    "       cont.prolongationdate,",
    "       cont.stopcalcdate,",
    "       cont.sid# as usid,",
    "       cont.agentid,",
    "       (select name from user$ where id=cont.sid#) username,",
    "       (select name from filial where id=cont.branchid) as filial",
    "from dm_active_contracts cont,",
    "     dm_contract_accounts acc,",
    "     avalute av",
    "where acc.id# = cont.id and",
    "      cont.currency = av.valute ",
    "order by :OrderField     "])
# dm_tranches (dfm:382-417) - not linked to any control of the main form (no DataSource uses it)
SQL_DM_TRANCHES = text(["SELECT total,hdate",
                        "  FROM dm_tranches",
                        "  where id# = :ContractID",
                        "order by hdate"])

"""SBDM_Settings_new.bpl SQL, verbatim from the dfm files (unit:line in each comment)."""
from .dep_sql import text


# ---- frmCategoriesImpl_new.dfm
# Categories (dfm:75-79)
CAT_SQL_CATEGORIES = text(['/* Formatted on 2007/08/31 13:02 (Formatter Plus v4.7.0) */',
    'SELECT ROWID, ID, CATEGORY',
    '  FROM sbcm_categories_new'])

# ---- frmAccGroupsImpl_new.dfm
# acc_zone_info (dfm:135-140)
GRP_SQL_ACC_ZONE_INFO = text(['SELECT rowid,zoneid, accgroup',
    '  FROM sbcm_acc_zone_info_new',
    '',
    'where zoneid = :zoneid'])
# acc_zones (dfm:158-162)
GRP_SQL_ACC_ZONES = text(['SELECT zoneid ,description',
    '  FROM sbcm_acc_zones_new',
    '  order by zoneid'])

# ---- frmDepositTypesImpl_new.dfm
# AddTypesForColl (dfm:195-199)
DT_SQL_ADDTYPESFORCOLL = text(['SELECT id, addtypename, addtypedesc, withdrtype, withdrtypedesc',
    "  FROM sbcm_deposit_addtypes_new where withdrtype<>'Inadvance' ",
    'order by id, addtypedesc'])
# AddTypesForWith (dfm:226-231)
DT_SQL_ADDTYPESFORWITH = text(['SELECT id, addtypename, addtypedesc, withdrtype, withdrtypedesc',
    "  FROM sbcm_deposit_addtypes_new where withdrtype<>'Inadvance'  order by id"])
# DepositTypes (dfm:258-264)
DT_SQL_DEPOSITTYPES = text(['SELECT rowid,id, type, additionaltype, withdrawtype, dateinterval,percent_rule,amount_rule',
    '  FROM sbcm_deposit_types_new',
    'order by id '])

# ---- frmAccountTurningImpl_new.dfm
# Categories (dfm:276-278)
AT_SQL_CATEGORIES = text(['select id,category from sbcm_categories_new'])
# Accounts (dfm:301-316)
AT_SQL_ACCOUNTS = text(['select ',
    '       /*+ FIRST_ROWS_200(account) */',
    '       id,',
    '       acc_no,',
    '       name,',
    'val_acc',
    'from account ',
    'where close_dat is null',
    'and  bal_cn1 in ( select accgroup from ',
    'sbcm_acc_zone_info_new where zoneid = (select zoneid from sbcm_acc_zones_new',
    "where name = 'InternalBankAccs'))",
    'order by acc_no'])
# Filials (dfm:351-353)
AT_SQL_FILIALS = text(['select id,name from filial'])
# valute (dfm:376-379)
AT_SQL_VALUTE = text(['select valute,val_name,valu_name from avalute',
    ''])
# movie_names (dfm:406-411)
AT_SQL_MOVIE_NAMES = text(['SELECT id, typeid,  description',
    '  FROM sbcm_movie_names_new',
    '',
    'where typeid = :typeid'])
# settings (dfm:610-615)
AT_SQL_SETTINGS = text(['SELECT rowid,id, parentid, currencyid, accid, branchid',
    '  FROM sbcm_settings_new',
    '',
    'where parentid = :parentid'])

# ---- DMReferences_new.dfm
# TVSubItems (dfm:7-14)
REF_SQL_TVSUBITEMS = text(['Select',
    '   *',
    '  From',
    '     SBCM_References_new',
    '   Where',
    '    ParentID =:ParentID'])
# ReferLink (dfm:47-49)
REF_SQL_REFERLINK = text(['Select * From  SBCM_References_new'])

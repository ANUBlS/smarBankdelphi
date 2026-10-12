object AdministrationData: TAdministrationData
  OldCreateOrder = False
  Left = 354
  Top = 294
  Height = 675
  Width = 894
  object ModulesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id,trvdesc, REPLACE(description,'#39' '#39')description ,name,'
      'can_insert,'
      'can_delete ,'
      'can_update'
      'FROM modules'
      'order by description '
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000070000005452564445534301
      00000000000B0000004445534352495054494F4E010000000000040000004E41
      4D450100000000000A00000043414E5F494E534552540100000000000A000000
      43414E5F44454C4554450100000000000A00000043414E5F5550444154450100
      00000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 64
    object ModulesDataTRVDESC: TStringField
      DisplayLabel = 'Тяйиннаты'
      DisplayWidth = 25
      FieldName = 'TRVDESC'
      Size = 128
    end
    object ModulesDataDESCRIPTION: TStringField
      DisplayLabel = 'Модулун ады'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 150
    end
    object ModulesDataNAME: TStringField
      DisplayLabel = 'Синиф Нюм'
      DisplayWidth = 100
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object ModulesDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object ModulesDataCAN_INSERT: TIntegerField
      FieldName = 'CAN_INSERT'
      Visible = False
    end
    object ModulesDataCAN_DELETE: TIntegerField
      FieldName = 'CAN_DELETE'
      Visible = False
    end
    object ModulesDataCAN_UPDATE: TIntegerField
      FieldName = 'CAN_UPDATE'
      Visible = False
    end
  end
  object Modules: TDataSource
    DataSet = ModulesData
    Left = 24
    Top = 64
  end
  object UsersData: TOracleDataSet
    SQL.Strings = (
      'SELECT   sus.user#, sus.NAME,'
      ' sus.ctime,'
      ' sba.description,'
      ' sba.fullname,'
      ' sba.phone, sba.classid, '
      ' sba.filialid,sb_aca.isadm_num (sus.NAME) AS is_adm'
      ',sb_aca.checkLockUser_num(sus.NAME) as is_locked'
      ',sus.datats#'
      '  FROM sys.user$ sus, sba_objinf sba'
      '  WHERE sus.NAME = sba.obj(+)'
      ''
      ''
      'and datats#>=5'
      'and sb_aca.isadm_num (sus.NAME) <> 1'
      ''
      'ORDER BY NAME'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000000B000000050000005553455223010000000000040000004E414D4501
      0000000000050000004354494D450100000000000B0000004445534352495054
      494F4E0100000000000800000046554C4C4E414D450100000000000500000050
      484F4E4501000000000007000000434C41535349440100000000000800000046
      494C49414C49440100000000000600000049535F41444D010000000000090000
      0049535F4C4F434B454401000000000007000000444154415453230100000000
      00}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 16
    object UsersDataUSER: TFloatField
      FieldName = 'USER#'
      Required = True
      Visible = False
    end
    object UsersDataNAME: TStringField
      DisplayLabel = 'Истифадячинин ады'
      DisplayWidth = 23
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object UsersDataDESCRIPTION: TStringField
      DisplayLabel = 'Тяйиннаты'
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object UsersDataFULLNAME: TStringField
      DisplayLabel = 'Там ады'
      DisplayWidth = 30
      FieldName = 'FULLNAME'
      Size = 96
    end
    object UsersDataCTIME: TDateTimeField
      DisplayLabel = 'Йарадылма тарихи'
      DisplayWidth = 25
      FieldName = 'CTIME'
      Required = True
    end
    object UsersDataPHONE: TStringField
      DisplayLabel = 'Телефон'
      FieldName = 'PHONE'
      Size = 8
    end
    object UsersDataCLASSID: TFloatField
      DisplayLabel = 'СинифНюм'
      FieldName = 'CLASSID'
    end
    object UsersDataFILIALID: TFloatField
      FieldName = 'FILIALID'
      Visible = False
    end
    object UsersDataIS_ADM: TFloatField
      FieldName = 'IS_ADM'
      Visible = False
    end
    object UsersDataIS_LOCKED: TFloatField
      FieldName = 'IS_LOCKED'
    end
    object UsersDataDATATS: TFloatField
      FieldName = 'DATATS#'
      Required = True
    end
  end
  object Users: TDataSource
    DataSet = UsersData
    Left = 24
    Top = 16
  end
  object pcADM: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ADM'
    Left = 160
    Top = 16
  end
  object UsModulesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id,trvdesc, description,'
      'SB_ACA.checkmodaccess_int(description,:USERNAME) as ModAcc,'
      'rowid'
      'FROM modules'
      'order by description')
    Variables.Data = {
      0300000001000000090000003A555345524E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000070000005452564445534301
      00000000000B0000004445534352495054494F4E010000000000060000004D4F
      44414343010000000000}
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 208
    object UsModulesDataTRVDESC: TStringField
      FieldName = 'TRVDESC'
      Size = 256
    end
    object UsModulesDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object UsModulesDataMODACC: TFloatField
      FieldName = 'MODACC'
    end
    object UsModulesDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
  end
  object UsModules: TDataSource
    DataSet = UsModulesData
    Left = 24
    Top = 208
  end
  object UsTablesData: TOracleDataSet
    SQL.Strings = (
      '  select'
      '  md.id'
      '  ,md.trvdesc'
      '  ,Replace(md.Description,'#39' '#39') Description'
      '  ,md.can_insert mod_insert'
      '  ,md.can_delete mod_delete'
      '  ,md.can_update mod_update '
      '  ,md.advanced_grants'
      ' ,sba.cur_user '
      ' ,Decode(sba.can_insert,null,0,sba.can_insert) as can_insert'
      ' ,Decode(sba.can_update,null,0,sba.can_delete) as can_delete'
      ' ,Decode(sba.can_delete,null,0,sba.can_update) as can_update'
      ' ,SB_ACA.checkmodaccess_int(description,:USERNAME) as "Select"'
      ' ,md.rowid'
      ' from modules md ,'
      '  (select *'
      '   from sba_usergrants sba'
      '   where cur_user=UPPER(:USERNAME)) sba '
      '  where'
      '  UPPER(Replace(md.Description,'#39' '#39')) =sba.cur_module(+)'
      '   order by Description')
    Variables.Data = {
      0300000001000000090000003A555345524E414D450500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000020000004944010000000000070000005452564445534301
      00000000000B0000004445534352495054494F4E0100000000000A0000004D4F
      445F494E534552540100000000000A0000004D4F445F44454C45544501000000
      00000A0000004D4F445F5550444154450100000000000F000000414456414E43
      45445F4752414E5453010000000000080000004355525F555345520100000000
      000A00000043414E5F494E534552540100000000000A00000043414E5F44454C
      4554450100000000000A00000043414E5F555044415445010000000000060000
      0053656C656374010000000000}
    OnApplyRecord = UsTablesDataApplyRecord
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Active = True
    AfterScroll = UsTablesDataAfterScroll
    Left = 96
    Top = 160
    object UsTablesDataTRVDESC: TStringField
      FieldName = 'TRVDESC'
      Size = 256
    end
    object UsTablesDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object UsTablesDataMOD_DELETE: TIntegerField
      FieldName = 'MOD_DELETE'
    end
    object UsTablesDataMOD_INSERT: TIntegerField
      FieldName = 'MOD_INSERT'
    end
    object UsTablesDataMOD_UPDATE: TIntegerField
      FieldName = 'MOD_UPDATE'
    end
    object UsTablesDataADVANCED_GRANTS: TIntegerField
      FieldName = 'ADVANCED_GRANTS'
    end
    object UsTablesDataCUR_USER: TStringField
      FieldName = 'CUR_USER'
      Size = 72
    end
    object UsTablesDataCAN_INSERT: TFloatField
      FieldName = 'CAN_INSERT'
    end
    object UsTablesDataCAN_DELETE: TFloatField
      FieldName = 'CAN_DELETE'
    end
    object UsTablesDataCAN_UPDATE: TFloatField
      FieldName = 'CAN_UPDATE'
    end
    object UsTablesDataSelect: TFloatField
      FieldName = 'Select'
    end
    object UsTablesDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
  end
  object UsTables: TDataSource
    DataSet = UsTablesData
    Left = 24
    Top = 160
  end
  object pcAca: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_ACA'
    Left = 160
    Top = 64
  end
  object Classesdata: TOracleDataSet
    SQL.Strings = (
      'select id,obj,description,createdate from'
      'sba_OBJINF'
      'where UPPER(type)='#39'C'#39
      'order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000030000004F424A0100000000
      000B0000004445534352495054494F4E0100000000000A000000435245415445
      44415445010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 112
    object ClassesdataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object ClassesdataOBJ: TStringField
      DisplayLabel = 'Синифин ады'
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object ClassesdataDESCRIPTION: TStringField
      DisplayLabel = 'Тяйиннаты'
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object ClassesdataCREATEDATE: TDateTimeField
      DisplayLabel = 'Йарадылма тарихи'
      FieldName = 'CREATEDATE'
    end
  end
  object Classes: TDataSource
    DataSet = Classesdata
    Left = 24
    Top = 112
  end
  object Modeditdata: TOracleDataSet
    SQL.Strings = (
      
        'SELECT REPLACE (md.ROLE, '#39'SBR_'#39') CLASS, DECODE (sba.OBJECT, NULL' +
        ', 0, 1) acc,'
      
        '       md.ROWID, m.trvdesc, m.id modid, m.can_insert cni, m.can_' +
        'update cnu, m.can_delete cnd, ins, upd, del'
      '  FROM dba_roles md, modules m,'
      '       (SELECT *'
      '          FROM sba_objmanager'
      '         WHERE id = (SELECT id'
      '                       FROM sba_objinf'
      
        '                      WHERE UPPER (TYPE) = '#39'C'#39' AND obj = :CLASSN' +
        'AME) )sba'
      
        ' WHERE (m.description=REPLACE (md.ROLE, '#39'SBR_'#39'))AND(REPLACE (md.' +
        'ROLE, '#39'SBR_'#39') = sba.OBJECT(+) AND ROLE LIKE ('#39'SBR_%'#39'))'
      'order by trvdesc'
      '')
    Variables.Data = {
      03000000010000000A0000003A434C4153534E414D4505000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000005000000434C415353010000000000030000004143430100
      000000000700000054525644455343010000000000050000004D4F4449440100
      0000000003000000434E4901000000000003000000434E550100000000000300
      0000434E4401000000000003000000494E530100000000000300000055504401
      00000000000300000044454C010000000000}
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 256
    object ModeditdataCLASS: TStringField
      DisplayLabel = 'Синиф'
      FieldName = 'CLASS'
      Size = 30
    end
    object ModeditdataACC: TFloatField
      DisplayLabel = 'Дащил'
      FieldName = 'ACC'
    end
    object ModeditdataTRVDESC: TStringField
      FieldName = 'TRVDESC'
      Size = 256
    end
    object ModeditdataMODID: TFloatField
      FieldName = 'MODID'
      Required = True
    end
    object ModeditdataCNI: TIntegerField
      FieldName = 'CNI'
    end
    object ModeditdataCNU: TIntegerField
      FieldName = 'CNU'
    end
    object ModeditdataCND: TIntegerField
      FieldName = 'CND'
    end
    object ModeditdataINS: TIntegerField
      FieldName = 'INS'
    end
    object ModeditdataUPD: TIntegerField
      FieldName = 'UPD'
    end
    object ModeditdataDEL: TIntegerField
      FieldName = 'DEL'
    end
  end
  object Modedit: TDataSource
    DataSet = Modeditdata
    Left = 24
    Top = 256
  end
  object GroupsData: TOracleDataSet
    SQL.Strings = (
      
        'select objinf.id,objinf.obj,objinf.description,objinf.createdate' +
        ',objinf.advtype,grtype.type$,grtype.descr'
      'from sba_objinf objinf,SBA_GROUPTYPES grtype'
      'where type='#39'G'#39' '
      'and objinf.advtype=grtype.id(+)'
      'order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000030000004F424A0100000000
      000B0000004445534352495054494F4E0100000000000A000000435245415445
      4441544501000000000007000000414456545950450100000000000500000054
      59504524010000000000050000004445534352010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 304
    object GroupsDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object GroupsDataOBJ: TStringField
      DisplayLabel = 'Групун ады'
      DisplayWidth = 25
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object GroupsDataDESCRIPTION: TStringField
      DisplayLabel = 'Тяйиннаты'
      DisplayWidth = 56
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object GroupsDataCREATEDATE: TDateTimeField
      DisplayLabel = 'Йарадылма тарихи'
      DisplayWidth = 30
      FieldName = 'CREATEDATE'
    end
    object GroupsDataADVTYPE: TFloatField
      FieldName = 'ADVTYPE'
      Visible = False
    end
    object GroupsDataTYPE: TStringField
      FieldName = 'TYPE$'
      Visible = False
      Size = 24
    end
    object GroupsDataDESCR: TStringField
      DisplayLabel = 'Групун типи'
      FieldName = 'DESCR'
      Size = 60
    end
  end
  object Groups: TDataSource
    DataSet = GroupsData
    Left = 24
    Top = 304
  end
  object GroupUsersData: TOracleDataSet
    SQL.Strings = (
      'SELECT   gmn.userid,sus.name, gmn.groupid, gmn.type'
      '  FROM sba_groupmanager gmn,sys.user$ sus'
      'where gmn.userid=sus.user#'
      'and gmn.groupid=:GROUPID')
    Variables.Data = {
      0300000001000000080000003A47524F55504944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000006000000555345524944010000000000040000004E414D45
      0100000000000700000047524F55504944010000000000040000005459504501
      0000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 16
    object GroupUsersDataUSERID: TFloatField
      FieldName = 'USERID'
      Required = True
    end
    object GroupUsersDataNAME: TStringField
      DisplayLabel = 'Ады'
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object GroupUsersDataGROUPID: TFloatField
      DisplayLabel = 'ГрупунНюм'
      FieldName = 'GROUPID'
      Required = True
    end
    object GroupUsersDataTYPE: TIntegerField
      DisplayLabel = 'Типи'
      FieldName = 'TYPE'
      Required = True
    end
  end
  object GroupUsers: TDataSource
    DataSet = GroupUsersData
    Left = 224
    Top = 16
  end
  object DependencesData: TOracleDataSet
    SQL.Strings = (
      'select'
      'usman.SUSER,usdat.NAME,usdat.ctime,objinf.*'
      'from '
      'sba_userman usman,sys.user$ usdat,'
      
        '(select obj.id,obj.obj,grouptypes.descr as type$ from sba_objinf' +
        ' obj,sba_grouptypes grouptypes'
      'where obj.advtype=grouptypes.id) objinf'
      'where '
      'usman.SUSER=usdat.USER# '
      'and usman.SUSER<>usman.MUSER'
      'and usman.MUSER= :USERID'
      'and usman.ugrup=objinf.id'
      'order by obj')
    Variables.Data = {0300000001000000070000003A555345524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000050000005355534552010000000000040000004E414D4501
      0000000000050000004354494D45010000000000020000004944010000000000
      030000004F424A010000000000050000005459504524010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 64
    object DependencesDataSUSER: TFloatField
      FieldName = 'SUSER'
      Required = True
    end
    object DependencesDataNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object DependencesDataCTIME: TDateTimeField
      FieldName = 'CTIME'
      Required = True
    end
    object DependencesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DependencesDataOBJ: TStringField
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object DependencesDataTYPE: TStringField
      FieldName = 'TYPE$'
      Size = 128
    end
  end
  object SubmissionData: TOracleDataSet
    SQL.Strings = (
      'select'
      'usman.MUSER,usdat.NAME,usdat.ctime,objinf.*'
      'from '
      'sba_userman usman,sys.user$ usdat,'
      
        '(select obj.id,obj.obj,grouptypes.descr as type$ from sba_objinf' +
        ' obj,sba_grouptypes grouptypes'
      'where obj.advtype=grouptypes.id) objinf'
      'where '
      'usman.MUSER=usdat.USER# '
      'and usman.MUSER<>usman.SUSER'
      'and usman.SUSER= :USERID'
      'and usman.ugrup=objinf.id'
      'order by obj')
    Variables.Data = {0300000001000000070000003A555345524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000050000004D55534552010000000000040000004E414D4501
      0000000000050000004354494D45010000000000020000004944010000000000
      030000004F424A010000000000050000005459504524010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 112
    object SubmissionDataMUSER: TFloatField
      FieldName = 'MUSER'
      Required = True
    end
    object SubmissionDataNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object SubmissionDataCTIME: TDateTimeField
      FieldName = 'CTIME'
      Required = True
    end
    object SubmissionDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SubmissionDataOBJ: TStringField
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object SubmissionDataTYPE: TStringField
      FieldName = 'TYPE$'
      Size = 128
    end
  end
  object Dependences: TDataSource
    DataSet = DependencesData
    Left = 224
    Top = 64
  end
  object Submission: TDataSource
    DataSet = SubmissionData
    Left = 224
    Top = 112
  end
  object FilialData: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 168
  end
  object Filial: TDataSource
    DataSet = FilialData
    Left = 224
    Top = 168
  end
  object ObjectsData: TOracleDataSet
    SQL.Strings = (
      'SELECT object_name,object_type'
      'FROM sys.all_objects'
      
        'WHERE owner =:OWNERNAME and(object_type='#39'TABLE'#39' or object_type='#39 +
        'VIEW'#39
      
        'or object_type= '#39'FUNCTION'#39' or object_type= '#39'PROCEDURE'#39'  or objec' +
        't_type='#39'PACKAGE'#39') '
      
        'union select ROLE,DECODE(ROLE,null,null,'#39'ROLE'#39') as Rtype from db' +
        'a_roles'
      'order by object_name')
    Variables.Data = {
      03000000010000000A0000003A4F574E45524E414D4505000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000020000000B0000004F424A4543545F4E414D450100000000000B0000
      004F424A4543545F54595045010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 224
    object ObjectsDataOBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Required = True
      Size = 30
    end
    object ObjectsDataOBJECT_TYPE: TStringField
      FieldName = 'OBJECT_TYPE'
      Size = 18
    end
  end
  object Objects: TDataSource
    DataSet = ObjectsData
    Left = 224
    Top = 224
  end
  object ModPrivsData: TOracleDataSet
    SQL.Strings = (
      'select temptab.rowid,objects.* from '
      'dual temptab,'
      '(select grantee,TABLE_NAME,privilege'
      'from dba_tab_privs dgr'
      ' union'
      
        'select grantee,granted_role as TABLE_NAME,Decode(granted_role,nu' +
        'll,null,'#39'ROLE'#39') as privilege'
      ' from dba_role_privs'
      ' union'
      
        'select grantee,PRIVILEGE as TABLE_NAME,Decode(PRIVILEGE,null,nul' +
        'l,'#39'PRIVILEGE'#39') as privilege'
      ' from dba_sys_privs) objects'
      'where objects.grantee=UPPER(REPLACE(:MODULE,'#39' '#39'))'
      'order by objects.table_name')
    Variables.Data = {0300000001000000070000003A4D4F44554C45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000070000004752414E5445450100000000000A000000544142
      4C455F4E414D450100000000000900000050524956494C454745010000000000}
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    AfterScroll = ModPrivsDataAfterScroll
    Left = 288
    Top = 280
    object ModPrivsDataTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 40
    end
    object ModPrivsDataPRIVILEGE: TStringField
      FieldName = 'PRIVILEGE'
      Size = 40
    end
  end
  object ModPrivs: TDataSource
    DataSet = ModPrivsData
    Left = 224
    Top = 280
  end
  object ModAdvancedGrants: TDataSource
    DataSet = ModAdvancedGrantsData
    Left = 225
    Top = 331
  end
  object ModAdvancedGrantsData: TOracleDataSet
    SQL.Strings = (
      '/*select sec.*,sec.rowid,fir.*,'
      'Decode(fir.username,null,0,1) as UserGranted'
      'from '
      '(select id,grantname,description,errormessage from'
      'sba_advanced_grants'
      'where moduleid=:modid) sec,'
      '(select * from sba_usergrants_advanced'
      'where username=:usernam) fir'
      'where '
      'sec.id=fir.advancedgrantid(+)'
      '*/'
      'select sec.*, sec.rowid, fir.*,'
      '       decode (fir.username, null, 0, 1) as usergranted,'
      '       decode (mbo.advgrantid, null, 0, 1) havvalue,'
      '       nvl (mbo.maxavalue, 0) maxavalue'
      '  from (select id, grantname, description, errormessage'
      '          from sba_advanced_grants'
      '         where moduleid = :modid) sec,'
      '       (select *'
      '          from sba_usergrants_advanced'
      '         where username = :usernam) fir,'
      '       (select *'
      '          from sba_monetaryborder) mbo'
      
        ' where sec.id = fir.advancedgrantid(+) and sec.id = mbo.advgrant' +
        'id(+)'
      '')
    Variables.Data = {
      0300000002000000060000003A4D4F4449440300000000000000000000000800
      00003A555345524E414D050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000020000004944010000000000090000004752414E544E414D
      450100000000000B0000004445534352495054494F4E01000000000008000000
      555345524E414D450100000000000F000000414456414E4345444752414E5449
      440100000000000B000000555345524752414E5445440100000000000C000000
      4552524F524D4553534147450100000000000800000048415656414C55450100
      00000000090000004D41584156414C5545010000000000}
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Left = 289
    Top = 330
    object ModAdvancedGrantsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ModAdvancedGrantsDataGRANTNAME: TStringField
      FieldName = 'GRANTNAME'
      Required = True
      Size = 128
    end
    object ModAdvancedGrantsDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 128
    end
    object ModAdvancedGrantsDataUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 128
    end
    object ModAdvancedGrantsDataADVANCEDGRANTID: TFloatField
      FieldName = 'ADVANCEDGRANTID'
    end
    object ModAdvancedGrantsDataUSERGRANTED: TFloatField
      FieldName = 'USERGRANTED'
    end
    object ModAdvancedGrantsDataERRORMESSAGE: TStringField
      FieldName = 'ERRORMESSAGE'
      Size = 128
    end
    object ModAdvancedGrantsDataHAVVALUE: TFloatField
      FieldName = 'HAVVALUE'
    end
    object ModAdvancedGrantsDataMAXAVALUE: TFloatField
      FieldName = 'MAXAVALUE'
    end
  end
  object GroupTypesData: TOracleDataSet
    SQL.Strings = (
      'SELECT id, type$, descr'
      '  FROM sba_grouptypes'
      '  order by id')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000050000005459504524010000
      000000050000004445534352010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 288
    Top = 376
  end
  object GroupTypes: TDataSource
    DataSet = GroupTypesData
    Left = 224
    Top = 376
  end
  object UserGroupData: TOracleDataSet
    SQL.Strings = (
      
        'select grman.userid,grman.groupid,decode(type,1,'#39'Баш'#39',2,'#39'Табе'#39',3' +
        ','#39'Нейтрал'#39') as UserState,objMan.*'
      'from sba_groupmanager grman,'
      
        '(select obj.id,obj.obj,obj.createdate,obj.description,grouptypes' +
        '.descr as type$ from sba_objinf obj,sba_grouptypes grouptypes'
      'where obj.advtype=grouptypes.id) objMan'
      'where grman.groupid=objMan.id'
      'and userid = :USERID'
      'order by obj')
    Variables.Data = {0300000001000000070000003A555345524944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000060000005553455249440100000000000700000047524F55
      5049440100000000000900000055534552535441544501000000000002000000
      4944010000000000030000004F424A0100000000000A00000043524541544544
      4154450100000000000B0000004445534352495054494F4E0100000000000500
      00005459504524010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 352
    object UserGroupDataUSERID: TFloatField
      FieldName = 'USERID'
      Required = True
      Visible = False
    end
    object UserGroupDataGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
      Visible = False
    end
    object UserGroupDataUSERSTATE: TStringField
      DisplayWidth = 10
      FieldName = 'USERSTATE'
      Size = 10
    end
    object UserGroupDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object UserGroupDataOBJ: TStringField
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object UserGroupDataCREATEDATE: TDateTimeField
      FieldName = 'CREATEDATE'
      Visible = False
    end
    object UserGroupDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object UserGroupDataTYPE: TStringField
      FieldName = 'TYPE$'
      Size = 128
    end
  end
  object UserGroup: TDataSource
    DataSet = UserGroupData
    Left = 24
    Top = 352
  end
  object repGroupsData: TOracleDataSet
    SQL.Strings = (
      
        'select distinct(Groupman.groupid),Usergroups.* from sba_groupman' +
        'ager Groupman,'
      '   (select '
      '   inf.id,inf.obj,inf.createdate,inf.description,inf.advtype,  '
      '   grtype.type$,grtype.descr '
      '   from sba_objInf inf,SBA_GROUPTYPES grtype'
      '   where type='#39'G'#39
      '   and inf.advtype=grtype.id'
      '   order by inf.obj) Usergroups'
      'where Groupman.groupid=Usergroups.id'
      'order by Usergroups.advtype,Usergroups.obj')
    QBEDefinition.QBEFieldDefs = {
      04000000080000000700000047524F5550494401000000000002000000494401
      0000000000030000004F424A0100000000000A00000043524541544544415445
      0100000000000B0000004445534352495054494F4E0100000000000700000041
      4456545950450100000000000500000054595045240100000000000500000044
      45534352010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 16
    object repGroupsDataGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object repGroupsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object repGroupsDataOBJ: TStringField
      FieldName = 'OBJ'
      Required = True
      Size = 56
    end
    object repGroupsDataCREATEDATE: TDateTimeField
      FieldName = 'CREATEDATE'
    end
    object repGroupsDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object repGroupsDataTYPE: TStringField
      FieldName = 'TYPE$'
      Required = True
      Size = 24
    end
    object repGroupsDataDESCR: TStringField
      FieldName = 'DESCR'
      Size = 128
    end
  end
  object repGroupManData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'us.NAME,'
      'decode(grman.type,1,'#39'Баш'#39',2,'#39'Табе'#39',3,'#39'Нейтрал'#39',null)  UserType, '
      'us.ctime UserCreateDate,'
      'grman.groupid'
      'FROM sba_groupmanager grman,user$ us'
      'where  userid=us.ID'
      'and grman.groupid=:groupid'
      'order by grMan.type,us.name')
    Variables.Data = {
      0300000001000000080000003A47524F555049440300000004000000B5000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D4501000000000008000000555345525459
      50450100000000000E0000005553455243524541544544415445010000000000
      0700000047524F55504944010000000000}
    Master = repGroupsData
    MasterFields = 'ID'
    DetailFields = 'groupid'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 64
    object repGroupManDataNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object repGroupManDataUSERTYPE: TStringField
      FieldName = 'USERTYPE'
      Size = 10
    end
    object repGroupManDataUSERCREATEDATE: TDateTimeField
      FieldName = 'USERCREATEDATE'
      Required = True
    end
    object repGroupManDataGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
  end
  object repAboutBankData: TOracleDataSet
    SQL.Strings = (
      'Select bank,'
      '  AZ_NAME as FullBankName ,'
      '  Logo ,'
      '  ManagerTitle ,'
      '  AccountantTitle '
      'From'
      '  BankInfo   '
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000400000042414E4B0100000000000C00000046554C4C4241
      4E4B4E414D45010000000000040000004C4F474F0000000000000C0000004D41
      4E414745525449544C450100000000000F0000004143434F554E54414E545449
      544C45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 112
  end
  object repAboutBank: TDataSource
    DataSet = repAboutBankData
    Left = 384
    Top = 112
  end
  object repGroupMan: TDataSource
    DataSet = repGroupManData
    Left = 384
    Top = 64
  end
  object repGroups: TDataSource
    DataSet = repGroupsData
    Left = 384
    Top = 16
  end
  object repUsersData: TOracleDataSet
    SQL.Strings = (
      'SELECT   '
      ' sus.id user#,'
      ' sus.NAME,'
      ' sus.ctime,'
      ' sba.description,'
      ' sba.fullname,'
      
        ' Decode(sb_aca.isadm_num (sus.NAME)  ,0,'#39' '#39',1,'#39'(Администратор)'#39')' +
        ' as  is_adm'
      '  FROM user$ sus, sba_objinf sba'
      '  WHERE sus.NAME = sba.obj(+)'
      'ORDER BY is_adm,NAME')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000050000005553455223010000000000040000004E414D4501
      0000000000050000004354494D450100000000000B0000004445534352495054
      494F4E0100000000000800000046554C4C4E414D450100000000000600000049
      535F41444D010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 168
    object UsersUSER: TFloatField
      FieldName = 'USER#'
      Required = True
    end
    object UsersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object UsersCTIME: TDateTimeField
      FieldName = 'CTIME'
      Required = True
    end
    object UsersDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 96
    end
    object UsersFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 96
    end
    object UsersIS_ADM: TStringField
      FieldName = 'IS_ADM'
      Size = 15
    end
  end
  object repUsersGrantsData: TOracleDataSet
    SQL.Strings = (
      'select * from'
      '(select'
      '  s.name,'
      '  s.id as modid,'
      '  s.trvdesc, '
      '  decode(s.ModAcc ,1,:GRANTED,:NOTGRANTED) as "Can use",'
      '  decode(sba.can_insert,1,:GRANTED,:NOTGRANTED) as "Can insert",'
      '  decode(sba.can_delete,1,:GRANTED,:NOTGRANTED) as "Can Delete",'
      '  decode(sba.can_update,1,:GRANTED,:NOTGRANTED) as "Can Update"'
      'from'
      
        '  (SELECT u.name,m.id,m.trvdesc,m.description,SB_ACA.checkmodacc' +
        'ess_int(description,u.name) as ModAcc, '
      '  sb_aca.isadm_num (u.NAME) AS is_adm  '
      '  FROM modules m ,user$ u'
      '  order by u.name) s,'
      '  sba_usergrants sba'
      'where'
      '  s.is_adm<>1 and'
      '  s.modacc<>0 '
      '  and  sba.cur_user(+)=UPPER(s.name) '
      '  and  sba.cur_module (+)=s.description '
      ''
      'UNION '
      ''
      '  SELECT grantsadv.username as name, '
      '  grantsMod.moduleid as modid,'
      '  grantsMod.Advdescription as trvdesc,'
      '  :GRANTED as "Can Use",null,null,null'
      '  FROM sba_usergrants_advanced grantsadv,'
      
        '  (select modgrants.id advgrantid, modgrants.description Advdesc' +
        'ription,modgrants.moduleid'
      '   from sba_advanced_grants modgrants) grantsMod'
      '   where grantsadv.advancedgrantid=grantsMod.advgrantid'
      '   and grantsadv.username in '
      '        (select name from user$)'
      ') AllGrants'
      'where name=:name'
      '   order by name,trvdesc')
    Variables.Data = {
      0300000003000000050000003A4E414D450500000009000000414B4152494D4F
      560000000000080000003A4752414E54454405000000020000002B0000000000
      0B0000003A4E4F544752414E54454405000000020000002D0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000040000004E414D45010000000000050000004D4F44494401
      000000000007000000545256444553430100000000000700000043616E207573
      650100000000000A00000043616E20696E736572740100000000000A00000043
      616E2044656C6574650100000000000A00000043616E20557064617465010000
      000000}
    Master = repUsersData
    MasterFields = 'NAME'
    DetailFields = 'NAME'
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 216
    object repUsersGrantsDataNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object repUsersGrantsDataMODID: TFloatField
      FieldName = 'MODID'
    end
    object repUsersGrantsDataTRVDESC: TStringField
      FieldName = 'TRVDESC'
      Size = 256
    end
    object repUsersGrantsDataCanuse: TStringField
      FieldName = 'Can use'
      Size = 11
    end
    object repUsersGrantsDataCaninsert: TStringField
      FieldName = 'Can insert'
      Size = 11
    end
    object repUsersGrantsDataCanDelete: TStringField
      FieldName = 'Can Delete'
      Size = 11
    end
    object repUsersGrantsDataCanUpdate: TStringField
      FieldName = 'Can Update'
      Size = 11
    end
  end
  object repUsers: TDataSource
    DataSet = repUsersData
    Left = 384
    Top = 168
  end
  object repUsersGrants: TDataSource
    DataSet = repUsersGrantsData
    Left = 384
    Top = 216
  end
  object BalAcc: TDataSource
    DataSet = ODSBalAcc
    Left = 384
    Top = 272
  end
  object ODSBalAcc: TOracleDataSet
    SQL.Strings = (
      'select * from sba_rtsas')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000042414C5F41434301000000000003000000484156
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 472
    Top = 272
  end
  object ODSQuery: TOracleDataSet
    SQL.Strings = (
      'select * from sba_rtsas')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000700000042414C5F41434301000000000003000000484156
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 120
  end
  object ODSOpTypes: TOracleDataSet
    SQL.Strings = (
      'select * from sba_optypes')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 472
    Top = 328
    object ODSOpTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSOpTypesNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object opTypes: TDataSource
    DataSet = ODSOpTypes
    Left = 384
    Top = 329
  end
  object repAdvGrantData: TOracleDataSet
    SQL.Strings = (
      
        'select moduleid, m.trvdesc modulename, g.description, b.maxavalu' +
        'e, decode(username, null, '#39'-'#39', '#39'+'#39') hasaccess, username'
      
        '  from modules m, sba_advanced_grants g, sba_monetaryborder b, (' +
        'select * from sba_usergrants_advanced )a'
      'where username='#39'AKARIMOV'#39
      ''
      
        ' and moduleid = m.id and b.advgrantid(+)=g.id and a.advancedgran' +
        'tid (+) = g.id'
      ' order by a.username,'
      '2, 3'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000080000004D4F44554C4549440100000000000A0000004D4F
      44554C454E414D450100000000000B0000004445534352495054494F4E010000
      000000090000004D41584156414C554501000000000009000000484153414343
      45535301000000000008000000555345524E414D45010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 568
    Top = 24
    object repAdvGrantDataMODULEID: TFloatField
      FieldName = 'MODULEID'
      Required = True
    end
    object repAdvGrantDataMODULENAME: TStringField
      FieldName = 'MODULENAME'
      Size = 256
    end
    object repAdvGrantDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 128
    end
    object repAdvGrantDataMAXAVALUE: TFloatField
      FieldName = 'MAXAVALUE'
    end
    object repAdvGrantDataHASACCESS: TStringField
      FieldName = 'HASACCESS'
      Size = 1
    end
    object repAdvGrantDataUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 128
    end
  end
  object ClsBalAcc: TDataSource
    DataSet = odsClsBalAcc
    Left = 48
    Top = 489
  end
  object odsAccFlags: TOracleDataSet
    SQL.Strings = (
      
        'select symbol, description, decode(username,null,0,1) acc from (' +
        'SELECT username, flagsymb'
      
        '  FROM sba_class_flags where username=:ClassName) u, account_fla' +
        'gs a'
      '  where u.flagsymb(+)=a.symbol')
    Variables.Data = {
      03000000010000000A0000003A434C4153534E414D4505000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000053594D424F4C0100000000000B00000044455343
      52495054494F4E01000000000003000000414343010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 441
    object odsAccFlagsSYMBOL: TStringField
      FieldName = 'SYMBOL'
      Required = True
      Size = 1
    end
    object odsAccFlagsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object odsAccFlagsACC: TFloatField
      FieldName = 'ACC'
    end
  end
  object AccFlags: TDataSource
    DataSet = odsAccFlags
    Left = 48
    Top = 441
  end
  object odsClsBalAcc: TOracleDataSet
    SQL.Strings = (
      
        'select bal_cn, decode(username,null,0,1) acc, :op optype from (S' +
        'ELECT username, bal_acc, optype'
      
        '  FROM sba_class_balance_acc where username=:classname and optyp' +
        'e=:op) u, bal_spr1 b'
      '  where u.bal_acc(+)=b.bal_cn'
      '  order by bal_cn')
    Variables.Data = {
      0300000002000000030000003A4F500300000000000000000000000A0000003A
      434C4153534E414D45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000600000042414C5F434E0100000000000300000041434301
      0000000000060000004F5054595045010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 488
    object odsClsBalAccBAL_CN: TFloatField
      FieldName = 'BAL_CN'
      Required = True
    end
    object odsClsBalAccACC: TFloatField
      FieldName = 'ACC'
    end
    object odsClsBalAccOPTYPE: TFloatField
      FieldName = 'OPTYPE'
    end
  end
  object ClsModAdvGrant: TDataSource
    DataSet = odsClsModAdvGrant
    Left = 48
    Top = 537
  end
  object odsClsModAdvGrant: TOracleDataSet
    SQL.Strings = (
      'select a.id, a.description, decode (username, null, 0, 1) acc'
      '  from sba_advanced_grants a, (select *'
      '                                 from sba_classgrants_advanced'
      '                                where username = :classname) c'
      ' where moduleid = :mid and a.id = c.advancedgrantid(+)'
      '')
    Variables.Data = {
      03000000020000000A0000003A434C4153534E414D4505000000000000000000
      0000040000003A4D4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000030000004143430100000000000200000049440100000000
      000B0000004445534352495054494F4E010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 536
    object odsClsModAdvGrantID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsClsModAdvGrantDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 128
    end
    object odsClsModAdvGrantACC: TFloatField
      FieldName = 'ACC'
    end
  end
  object ModeditDataX: TOracleDataSet
    SQL.Strings = (
      
        'select o.rowid, m.id, nvl(ins,0) ins, nvl(upd,0) upd, nvl(del,0)' +
        ' del from modules m, (select * from sba_objmanager where id=:cls' +
        'id)o'
      'where o.object(+)=m.description and m.id=:modid')
    Variables.Data = {
      0300000002000000060000003A434C5349440300000000000000000000000600
      00003A4D4F444944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000400000003000000494E530100000000000300000055504401000000
      00000300000044454C010000000000020000004944010000000000}
    CachedUpdates = True
    Session = sboapiDataModule.SBSession
    Left = 159
    Top = 256
    object ModeditDataXID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ModeditDataXINS: TFloatField
      FieldName = 'INS'
    end
    object ModeditDataXUPD: TFloatField
      FieldName = 'UPD'
    end
    object ModeditDataXDEL: TFloatField
      FieldName = 'DEL'
    end
  end
end

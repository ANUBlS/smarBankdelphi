object DataModBBPayings: TDataModBBPayings
  OldCreateOrder = False
  Left = 189
  Top = 216
  Height = 540
  Width = 783
  object ODS_ABNServices: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.id, b.name abn_name, a.contract_id, c.contract_num, a.r' +
        'eg_time, '
      
        '  a.srv_id, s.name service, a.amount, a.amount_eqv, a.curr_code,' +
        ' '
      '  a.status, a.done_time, a.sys_date, '
      '  paymethod'
      
        '  FROM bb_abn_services a, bb_contracts c, bb_services s, bb_abon' +
        'ents b'
      '  where a.contract_id =c.id and a.srv_id =s.id and c.abn_id=b.id'
      '   and (sys_date>=(:StDate-1) and sys_date<=(:EndDate))')
    Variables.Data = {
      0300000002000000070000003A5354444154450C000000000000000000000008
      0000003A454E44444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E000000020000004944010000000000080000005245475F54494D45
      01000000000006000000414D4F554E540100000000000A000000414D4F554E54
      5F45515601000000000009000000435552525F434F4445010000000000060000
      0053544154555301000000000009000000444F4E455F54494D45010000000000
      0C000000434F4E54524143545F4E554D0100000000000800000041424E5F4E41
      4D4501000000000007000000534552564943450100000000000B000000434F4E
      54524143545F4944010000000000060000005352565F49440100000000000800
      00005359535F44415445010000000000090000005041594D4554484F44010000
      000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 16
    object ODS_ABNServicesID: TFloatField
      DisplayLabel = 'N'
      FieldName = 'ID'
    end
    object ODS_ABNServicesABN_NAME: TStringField
      DisplayLabel = 'Abonent'
      FieldName = 'ABN_NAME'
      Size = 50
    end
    object ODS_ABNServicesCONTRACT_ID: TFloatField
      FieldName = 'CONTRACT_ID'
      Visible = False
    end
    object ODS_ABNServicesCONTRACT_NUM: TStringField
      DisplayLabel = 'Мцгавиля'
      FieldName = 'CONTRACT_NUM'
      Size = 5
    end
    object ODS_ABNServicesREG_TIME: TDateTimeField
      FieldName = 'REG_TIME'
      Visible = False
    end
    object ODS_ABNServicesSRV_ID: TFloatField
      FieldName = 'SRV_ID'
      Visible = False
    end
    object ODS_ABNServicesSERVICE: TStringField
      DisplayLabel = 'Хидмят'
      FieldName = 'SERVICE'
      Size = 30
    end
    object ODS_ABNServicesAMOUNT: TFloatField
      DisplayLabel = 'Мябляь'
      FieldName = 'AMOUNT'
    end
    object ODS_ABNServicesAMOUNT_EQV: TFloatField
      FieldName = 'AMOUNT_EQV'
      Visible = False
    end
    object ODS_ABNServicesCURR_CODE: TFloatField
      FieldName = 'CURR_CODE'
      Visible = False
    end
    object ODS_ABNServicesSTATUS: TFloatField
      FieldName = 'STATUS'
      Visible = False
    end
    object ODS_ABNServicesDONE_TIME: TDateTimeField
      FieldName = 'DONE_TIME'
      Visible = False
    end
    object ODS_ABNServicesSYS_DATE: TDateTimeField
      DisplayLabel = 'Тарих'
      FieldName = 'SYS_DATE'
    end
    object ODS_ABNServicesPAYMETHOD: TFloatField
      FieldName = 'PAYMETHOD'
    end
  end
  object DS_ABNServices: TDataSource
    DataSet = ODS_ABNServices
    Left = 120
    Top = 16
  end
  object ODS_Contracts: TOracleDataSet
    SQL.Strings = (
      'select c.*, a.name '
      'from BB_Contracts c, BB_Abonents a'
      'where c.ABN_ID=a.ID')
    QBEDefinition.QBEFieldDefs = {
      04000000110000000200000049440100000000000C000000434F4E5452414354
      5F4E554D01000000000008000000434152445F4E554D01000000000009000000
      5349474E5F444154450100000000000600000041424E5F494401000000000009
      000000494E53545F444154450100000000000A000000494E53545F504C414345
      01000000000005000000534552494501000000000009000000574F524B535F4E
      554D0100000000000C00000052454345495645525F4E554D0100000000000C00
      00004341424C455F4C454E47544801000000000006000000414D4F554E540100
      000000000A000000414D4F554E545F4551560100000000000900000043555252
      5F434F444501000000000008000000444953434F554E54010000000000060000
      00454E475F4944010000000000080000005041434B5F4E554D010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 72
  end
  object DS_Contracts: TDataSource
    DataSet = ODS_Contracts
    Left = 120
    Top = 72
  end
  object ODS_Services: TOracleDataSet
    SQL.Strings = (
      'select * from BB_Services')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 128
  end
  object DS_Services: TDataSource
    DataSet = ODS_Services
    Left = 120
    Top = 128
  end
  object OrPack_CableManager: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'Cable_Manager'
    Left = 224
    Top = 16
  end
  object OrPack_SBOP: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SBOP'
    Left = 312
    Top = 16
  end
end

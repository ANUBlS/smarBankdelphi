object DataModC: TDataModC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 199
  Top = 9
  Height = 538
  Width = 910
  object odsContracts: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      
        'select c.id, contract_num, card_num, sign_date, abn_id, inst_dat' +
        'e, inst_place,'
      
        '       serie, works_num, c.receiver_num, cable_length, amount, a' +
        'mount_eqv,'
      
        '       curr_code, discount, c.eng_id, pack_num, acc_id, rest, re' +
        'st_eqv,'
      
        '       b.name abonent, a.acc_no, p.name packagename, e.name engi' +
        'neer,'
      
        '       v.val_name, decode (c.inst_place, 0, '#39'Balkon'#39', 1, '#39'Dam'#39', ' +
        #39'Башга'#39') instplc,'
      
        '       round(rest,2) rest_r, lastcalcdate, calcag, decode(calcag' +
        ',0,'#39'Щя'#39',1,'#39'Йох'#39') calcags,'
      
        '       discount_desc, c.usname, c.updusname, c.upddate, exp_date' +
        ', p.price'
      '  from bb_contracts c,'
      '       bb_abonents b,'
      '       account a,'
      '       bb_packages p,'
      '       bb_engineers e,'
      '       avalute v'
      ' where c.abn_id = b.id'
      '   and c.acc_id = a.id(+)'
      '   and c.pack_num = p.id'
      '   and c.eng_id = e.id'
      '   and v.valute = c.curr_code'
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000240000000200000049440100000000000C000000434F4E5452414354
      5F4E554D01000000000008000000434152445F4E554D01000000000009000000
      5349474E5F444154450100000000000600000041424E5F494401000000000009
      000000494E53545F444154450100000000000A000000494E53545F504C414345
      01000000000005000000534552494501000000000009000000574F524B535F4E
      554D0100000000000C00000052454345495645525F4E554D0100000000000C00
      00004341424C455F4C454E47544801000000000006000000414D4F554E540100
      000000000A000000414D4F554E545F4551560100000000000900000043555252
      5F434F444501000000000008000000444953434F554E54010000000000060000
      00454E475F4944010000000000080000005041434B5F4E554D01000000000006
      0000004143435F49440100000000000400000052455354010000000000080000
      00524553545F4551560100000000000700000041424F4E454E54010000000000
      060000004143435F4E4F0100000000000B0000005041434B4147454E414D4501
      000000000008000000454E47494E4545520100000000000800000056414C5F4E
      414D4501000000000007000000494E5354504C43010000000000060000005245
      53545F520100000000000C0000004C41535443414C4344415445010000000000
      0600000043414C4341470100000000000700000043414C434147530100000000
      000D000000444953434F554E545F444553430100000000000600000055534E41
      4D450100000000000900000055504455534E414D450100000000000700000055
      504444415445010000000000080000004558505F444154450100000000000500
      00005052494345010000000000}
    Session = sboapiDataModule.SBSession
    OnCalcFields = odsContractsCalcFields
    Left = 80
    Top = 40
    object odsContractsID: TFloatField
      DisplayLabel = 'Код'
      FieldName = 'ID'
    end
    object odsContractsABONENT: TStringField
      DisplayLabel = 'Aбунячи'
      FieldName = 'ABONENT'
      Size = 50
    end
    object odsContractsCONTRACT_NUM: TStringField
      DisplayLabel = 'Мцгавиля №'
      FieldName = 'CONTRACT_NUM'
      Size = 5
    end
    object odsContractsCARD_NUM: TStringField
      DisplayLabel = 'Карт №'
      FieldName = 'CARD_NUM'
      Size = 5
    end
    object odsContractsSIGN_DATE: TDateTimeField
      DisplayLabel = 'Гошулма тарихи'
      FieldName = 'SIGN_DATE'
    end
    object odsContractsABN_ID: TFloatField
      FieldName = 'ABN_ID'
      Visible = False
    end
    object odsContractsINST_DATE: TDateTimeField
      DisplayLabel = 'Гурашдарма тарихи'
      FieldName = 'INST_DATE'
    end
    object odsContractsINST_PLACE: TFloatField
      FieldName = 'INST_PLACE'
      Visible = False
    end
    object odsContractsSERIE: TStringField
      DisplayLabel = 'Серийасы'
      FieldName = 'SERIE'
      Size = 25
    end
    object odsContractsWORKS_NUM: TStringField
      DisplayLabel = 'Фабрик №'
      FieldName = 'WORKS_NUM'
      Size = 25
    end
    object odsContractsRECEIVER_NUM: TFloatField
      DisplayLabel = 'Гябуледижилярин сайы'
      FieldName = 'RECEIVER_NUM'
    end
    object odsContractsCABLE_LENGTH: TFloatField
      DisplayLabel = 'Кабелин узунлуьу'
      FieldName = 'CABLE_LENGTH'
    end
    object odsContractsAMOUNT: TFloatField
      DisplayLabel = 'Мябляьи'
      FieldName = 'AMOUNT'
    end
    object odsContractsAMOUNT_EQV: TFloatField
      FieldName = 'AMOUNT_EQV'
      Visible = False
    end
    object odsContractsCURR_CODE: TFloatField
      FieldName = 'CURR_CODE'
      Visible = False
    end
    object odsContractsDISCOUNT: TFloatField
      DisplayLabel = 'Dисжоунт'
      FieldName = 'DISCOUNT'
    end
    object odsContractsDISCOUNT_DESC: TStringField
      DisplayLabel = 'Тяйинаты'
      FieldName = 'DISCOUNT_DESC'
      Size = 25
    end
    object odsContractsENG_ID: TFloatField
      FieldName = 'ENG_ID'
      Visible = False
    end
    object odsContractsPACK_NUM: TFloatField
      FieldName = 'PACK_NUM'
      Visible = False
    end
    object odsContractsACC_ID: TFloatField
      FieldName = 'ACC_ID'
      Visible = False
    end
    object odsContractsREST_R: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST_R'
    end
    object odsContractsREST: TFloatField
      DisplayLabel = 'Галыг'
      FieldName = 'REST'
      Visible = False
    end
    object odsContractsREST_EQV: TFloatField
      FieldName = 'REST_EQV'
      Visible = False
    end
    object odsContractsACC_NO: TStringField
      DisplayLabel = 'Hesab'
      FieldName = 'ACC_NO'
    end
    object odsContractsPACKAGENAME: TStringField
      DisplayLabel = 'Paket'
      FieldName = 'PACKAGENAME'
      Size = 10
    end
    object odsContractsENGINEER: TStringField
      DisplayLabel = 'Мцщяндис'
      FieldName = 'ENGINEER'
      Size = 30
    end
    object odsContractsVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Visible = False
      Size = 10
    end
    object odsContractsINSTPLC: TStringField
      DisplayLabel = 'Гурашдырылыб'
      FieldName = 'INSTPLC'
      Size = 6
    end
    object odsContractsLASTCALCDATE: TDateTimeField
      DisplayLabel = 'Сон щес. тарихи'
      FieldName = 'LASTCALCDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object odsContractsCALCAG: TFloatField
      FieldName = 'CALCAG'
      Visible = False
    end
    object odsContractsCALCAGS: TStringField
      DisplayLabel = 'Щесабланыр'
      FieldName = 'CALCAGS'
      Size = 3
    end
    object odsContractsUSNAME: TStringField
      DisplayLabel = 'Дахил едян'
      FieldName = 'USNAME'
      Size = 30
    end
    object odsContractsUPDUSNAME: TStringField
      DisplayLabel = 'Сон дяйишян'
      FieldName = 'UPDUSNAME'
      Size = 30
    end
    object odsContractsUPDDATE: TDateTimeField
      DisplayLabel = 'Сон дяйишмя вахты'
      FieldName = 'UPDDATE'
    end
    object odsContractsEXP_DATE: TDateTimeField
      FieldName = 'EXP_DATE'
    end
    object odsContractsPRICE: TFloatField
      DisplayLabel = 'Гиймяти'
      FieldName = 'PRICE'
    end
    object odsContractsLASTMON: TDateTimeField
      DisplayLabel = 'Сон тарих'
      FieldKind = fkCalculated
      FieldName = 'LASTMON'
      DisplayFormat = 'dd.mm.yyyy'
      Calculated = True
    end
  end
  object dsContracts: TDataSource
    DataSet = odsContracts
    Left = 80
    Top = 104
  end
  object odsValutes: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'select valute id, val_name name from avalute'
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 320
    Top = 48
  end
  object dsValutes: TDataSource
    DataSet = odsValutes
    Left = 320
    Top = 104
  end
  object odsPacks: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, name, inst_price, price, deposit from bb_packages'
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 48
  end
  object dsPacks: TDataSource
    DataSet = odsPacks
    Left = 272
    Top = 104
  end
  object odsServices: TOracleDataSet
    Tag = 2
    SQL.Strings = (
      'select id, name from bb_services'
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 216
    Top = 48
  end
  object dsServices: TDataSource
    DataSet = odsServices
    Left = 216
    Top = 104
  end
  object odsAccs: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, acc_no name from account where close_dat is null'
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 48
  end
  object dsAccs: TDataSource
    DataSet = odsAccs
    Left = 160
    Top = 104
  end
  object odsEngineers: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select * from bb_engineers'
      ''
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 381
    Top = 48
  end
  object dsEngineers: TDataSource
    DataSet = odsEngineers
    Left = 381
    Top = 104
  end
  object CABLE: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CABLE_MANAGER'
    Left = 16
    Top = 16
  end
  object odsAbonents: TOracleDataSet
    Tag = 1
    SQL.Strings = (
      'select id, name from bb_abonents'
      'order by 2')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 437
    Top = 48
  end
  object dsAbonents: TDataSource
    DataSet = odsAbonents
    Left = 437
    Top = 104
  end
  object dsfAbonents: TDataSource
    DataSet = odsAbonents
    Left = 440
    Top = 168
  end
  object dsfPacks: TDataSource
    DataSet = odsPacks
    Left = 272
    Top = 171
  end
  object dsfEngineers: TDataSource
    DataSet = odsEngineers
    Left = 381
    Top = 168
  end
  object dsfAccs: TDataSource
    DataSet = odsAccs
    Left = 160
    Top = 168
  end
  object OrDS_DeletedConts: TOracleDataSet
    SQL.Strings = (
      
        'select c.id, contract_num, card_num, sign_date, abn_id, inst_dat' +
        'e, inst_place,'
      
        '       serie, works_num, c.receiver_num, cable_length, amount, a' +
        'mount_eqv,'
      
        '       curr_code, discount, c.eng_id, pack_num, acc_id, rest, re' +
        'st_eqv,'
      
        '       b.name abonent, a.acc_no, p.name packagename, e.name engi' +
        'neer,'
      
        '       v.val_name, decode (c.inst_place, 0, '#39'Balkon'#39', 1, '#39'Dam'#39', ' +
        #39'Башга'#39') instplc,'
      
        '       round(rest,2) rest_r, lastcalcdate, calcag, decode(calcag' +
        ',0,'#39'Щя'#39',1,'#39'Йох'#39') calcags,'
      
        '       discount_desc, c.usname, c.updusname, c.upddate, exp_date' +
        ', p.price'
      '  from bb_deleted_conts c,'
      '       bb_abonents b,'
      '       account a,'
      '       bb_packages p,'
      '       bb_engineers e,'
      '       avalute v'
      ' where c.abn_id = b.id'
      '   and c.acc_id = a.id(+)'
      '   and c.pack_num = p.id'
      '   and c.eng_id = e.id'
      '   and v.valute = c.curr_code')
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 256
  end
  object DS_DeletedConts: TDataSource
    DataSet = OrDS_DeletedConts
    Left = 56
    Top = 304
  end
end

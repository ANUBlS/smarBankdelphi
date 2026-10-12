object DatModN3SD: TDatModN3SD
  OldCreateOrder = False
  Left = 492
  Top = 351
  Height = 408
  Width = 599
  object N3SDDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT  region_name, sum(rest), sum(dm_hokid_rest),'
      
        '       sum(dm_enrkimteh_rest), sum(dm_neftsan_rest), sum(dm_ticx' +
        'id_rest),'
      
        '       sum(dm_kendtes_rest), sum(dm_belediye_rest), sum(dm_insha' +
        'te_rest),'
      
        '       sum(dm_neqliyatr_rest), sum(dm_digersah_rest), sum(oz_res' +
        't),'
      
        '       sum(oz_kimya_rest), sum(oz_neft_san_rest), sum(oz_ticaret' +
        '_xid_rest),'
      
        '       sum(oz_kentt_emal_rest), sum(oz_inshat_emalk_rest), sum(o' +
        'z_ineqliyat_rab),'
      
        '       sum(oz_diger_sah), sum(fiziki_sexs), sum(fiziki_ipot), su' +
        'm(diger_kredit),'
      '       sum(maliye)'
      '  FROM cm_n3_sdt '
      ''
      'group by region_name')
    QBEDefinition.QBEFieldDefs = {
      04000000170000000B000000524547494F4E5F4E414D45010000000000090000
      0053554D2852455354290100000000001200000053554D28444D5F484F4B4944
      5F52455354290100000000001600000053554D28444D5F454E524B494D544548
      5F52455354290100000000001400000053554D28444D5F4E45465453414E5F52
      455354290100000000001300000053554D28444D5F5449435849445F52455354
      290100000000001400000053554D28444D5F4B454E445445535F524553542901
      00000000001500000053554D28444D5F42454C45444959455F52455354290100
      000000001400000053554D28444D5F494E53484154455F524553542901000000
      00001600000053554D28444D5F4E45514C49594154525F524553542901000000
      00001500000053554D28444D5F44494745525341485F52455354290100000000
      000C00000053554D284F5A5F52455354290100000000001200000053554D284F
      5A5F4B494D59415F52455354290100000000001500000053554D284F5A5F4E45
      46545F53414E5F52455354290100000000001800000053554D284F5A5F544943
      415245545F5849445F52455354290100000000001700000053554D284F5A5F4B
      454E54545F454D414C5F52455354290100000000001900000053554D284F5A5F
      494E534841545F454D414C4B5F52455354290100000000001500000053554D28
      4F5A5F494E45514C495941545F524142290100000000001100000053554D284F
      5A5F44494745525F534148290100000000001000000053554D2846495A494B49
      5F53455853290100000000001000000053554D2846495A494B495F49504F5429
      0100000000001100000053554D2844494745525F4B5245444954290100000000
      000B00000053554D284D414C49594529010000000000}
    Cursor = crSQLWait
    Session = CMDataModule.CMSession
    Left = 24
    Top = 16
    object N3SDDataSetREGION_NAME: TStringField
      DisplayLabel = 'Реэйонун ады'
      FieldName = 'REGION_NAME'
      Size = 50
    end
    object N3SDDataSetSUMREST: TFloatField
      DisplayLabel = 'Д.М жями'
      FieldName = 'SUM(REST)'
    end
    object N3SDDataSetSUMDM_HOKID_REST: TFloatField
      DisplayLabel = 'Д.М щюкмят идаряляри'
      FieldName = 'SUM(DM_HOKID_REST)'
    end
    object N3SDDataSetSUMDM_ENRKIMTEH_REST: TFloatField
      DisplayLabel = 'Д.М Енерэетика Ким вя тяб е'
      FieldName = 'SUM(DM_ENRKIMTEH_REST)'
    end
    object N3SDDataSetSUMDM_NEFTSAN_REST: TFloatField
      DisplayLabel = 'Д.М Нефт сянайеси'
      FieldName = 'SUM(DM_NEFTSAN_REST)'
    end
    object N3SDDataSetSUMDM_TICXID_REST: TFloatField
      DisplayLabel = 'Д.М тижарят вя хидмят'
      FieldName = 'SUM(DM_TICXID_REST)'
    end
    object N3SDDataSetSUMDM_KENDTES_REST: TFloatField
      DisplayLabel = 'Д.М кянт тяс вя емал'
      FieldName = 'SUM(DM_KENDTES_REST)'
    end
    object N3SDDataSetSUMDM_BELEDIYE_REST: TFloatField
      DisplayLabel = 'Д.М бялядиййяляр вя ич тяш'
      FieldName = 'SUM(DM_BELEDIYE_REST)'
    end
    object N3SDDataSetSUMDM_INSHATE_REST: TFloatField
      DisplayLabel = 'Д.М иншаат вя ямлак '
      FieldName = 'SUM(DM_INSHATE_REST)'
    end
    object N3SDDataSetSUMDM_NEQLIYATR_REST: TFloatField
      DisplayLabel = 'Д.М нягилиййат вя рабитя'
      FieldName = 'SUM(DM_NEQLIYATR_REST)'
    end
    object N3SDDataSetSUMDM_DIGERSAH_REST: TFloatField
      DisplayLabel = 'Д.М диэяр сащяляр'
      FieldName = 'SUM(DM_DIGERSAH_REST)'
    end
    object N3SDDataSetSUMOZ_REST: TFloatField
      DisplayLabel = 'Ю.М Жями'
      FieldName = 'SUM(OZ_REST)'
    end
    object N3SDDataSetSUMOZ_KIMYA_REST: TFloatField
      DisplayLabel = 'Ю.М Енерэетика Ким вя тяб е'
      FieldName = 'SUM(OZ_KIMYA_REST)'
    end
    object N3SDDataSetSUMOZ_NEFT_SAN_REST: TFloatField
      DisplayLabel = 'Ю.М Нефт сянайеси'
      FieldName = 'SUM(OZ_NEFT_SAN_REST)'
    end
    object N3SDDataSetSUMOZ_TICARET_XID_REST: TFloatField
      DisplayLabel = 'Ю.М тижарят вя хидмят'
      FieldName = 'SUM(OZ_TICARET_XID_REST)'
    end
    object N3SDDataSetSUMOZ_KENTT_EMAL_REST: TFloatField
      DisplayLabel = 'Ю.М кянт тяс вя емал'
      FieldName = 'SUM(OZ_KENTT_EMAL_REST)'
    end
    object N3SDDataSetSUMOZ_INSHAT_EMALK_REST: TFloatField
      DisplayLabel = 'Ю.М иншаат вя ямлак'
      FieldName = 'SUM(OZ_INSHAT_EMALK_REST)'
    end
    object N3SDDataSetSUMOZ_INEQLIYAT_RAB: TFloatField
      DisplayLabel = 'Ю.М нягилиййат вя рабитя'
      FieldName = 'SUM(OZ_INEQLIYAT_RAB)'
    end
    object N3SDDataSetSUMOZ_DIGER_SAH: TFloatField
      DisplayLabel = 'Ю.М диэяр сащяляр'
      FieldName = 'SUM(OZ_DIGER_SAH)'
    end
    object N3SDDataSetSUMFIZIKI_SEXS: TFloatField
      DisplayLabel = 'Физики шяхсляря (Д.Я.А) кр'
      FieldName = 'SUM(FIZIKI_SEXS)'
    end
    object N3SDDataSetSUMFIZIKI_IPOT: TFloatField
      DisplayLabel = 'Дашынмаз ямлакын(Т.А)Ип кре'
      FieldName = 'SUM(FIZIKI_IPOT)'
    end
    object N3SDDataSetSUMDIGER_KREDIT: TFloatField
      DisplayLabel = 'Диэяр кредитляр'
      FieldName = 'SUM(DIGER_KREDIT)'
    end
    object N3SDDataSetSUMMALIYE: TFloatField
      DisplayLabel = 'Малиййя ижаряси'
      FieldName = 'SUM(MALIYE)'
    end
  end
  object CM_N3_SD: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_N3_SD'
    ParameterMode = pmNamed
    Cursor = crSQLWait
    Left = 24
    Top = 272
  end
  object DatScrRsts: TDataSource
    DataSet = N3SDDataSet
    Left = 104
    Top = 16
  end
  object Crdinfo: TOracleDataSet
    SQL.Strings = (
      'select '
      '  crd.id,'
      '  crd.customertype,'
      '  crd.branchid ,'
      '  bp.villageid,'
      '  cust.vid_sob'
      'from '
      '  cm_portfolio crd,'
      '  cm_business_plan bp,'
      '  cm_sb_customers cust'
      'where '
      '  bp.creditid = crd.id'
      '  and cust.id = crd.boorowerid  ')
    QBEDefinition.QBEFieldDefs = {
      04000000050000000200000049440100000000000C000000435553544F4D4552
      54595045010000000000080000004252414E4348494401000000000009000000
      56494C4C4147454944010000000000070000005649445F534F42010000000000}
    Session = CMDataModule.CMSession
    Left = 192
    Top = 16
    object CrdinfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CrdinfoCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object CrdinfoBRANCHID: TFloatField
      FieldName = 'BRANCHID'
      Required = True
    end
    object CrdinfoVILLAGEID: TFloatField
      FieldName = 'VILLAGEID'
    end
    object CrdinfoVID_SOB: TFloatField
      FieldName = 'VID_SOB'
    end
  end
  object CatDatSet: TOracleDataSet
    SQL.Strings = (
      'select id,description '
      'from cm_categories')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 64
  end
  object RegDatSet: TOracleDataSet
    SQL.Strings = (
      'select id ,name from agro_village')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 112
  end
  object FilialDatSet: TOracleDataSet
    SQL.Strings = (
      'select id,name from sb_filial')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 168
  end
  object CatDatSrc: TDataSource
    DataSet = CatDatSet
    Left = 112
    Top = 72
  end
  object RegDatSrc: TDataSource
    DataSet = RegDatSet
    Left = 112
    Top = 120
  end
  object FilialDatSrc: TDataSource
    DataSet = FilialDatSet
    Left = 112
    Top = 168
  end
  object VidDatSet: TOracleDataSet
    SQL.Strings = (
      'select id,name '
      'from smart.vid_sob'
      'where id in (select vid_sob '
      'from cm_sb_customers where '
      'id in (select boorowerid from cm_portfolio)'
      'and  vid_sob is not null )'
      '')
    Session = CMDataModule.CMSession
    Left = 24
    Top = 216
  end
  object VidDatSrc: TDataSource
    DataSet = VidDatSet
    Left = 112
    Top = 216
  end
  object CrdInfoDatSrc: TDataSource
    Left = 256
    Top = 16
  end
end

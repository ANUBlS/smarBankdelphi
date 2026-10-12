object dmfrmRepOfKindPayOfDep: TdmfrmRepOfKindPayOfDep
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 696
  object FilialMDT: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 24
    object FilialMDTID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialMDTNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object SourceMDT: TOracleDataSet
    SQL.Strings = (
      'SELECT a.id, a.name'
      '  FROM uaod_source a'
      '  order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 72
    object SourceMDTID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object SourceMDTNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 80
    end
  end
  object TypeMDT: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.id, a.type as name  FROM sbcm_deposit_types a order by ' +
        'id   --uaod_type ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 128
    object TypeMDTID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object TypeMDTNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 80
    end
  end
  object ValuteMDT: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name as val_name from avalute'
      'order by valute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 176
    object ValuteMDTVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ValuteMDTVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 25
    end
  end
  object CalcStatusMDT: TOracleDataSet
    SQL.Strings = (
      'select 1 as ID,'#39'Hesablanan'#39' as name  from dual'
      'union'
      'select 0 as ID,'#39'Hesablanmayan'#39' as name from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 32
    Top = 232
    object CalcStatusMDTID: TFloatField
      FieldName = 'ID'
    end
    object CalcStatusMDTNAME: TWideStringField
      FieldName = 'NAME'
      Size = 13
    end
  end
  object FilialMDds: TDataSource
    DataSet = FilialMDT
    Left = 96
    Top = 24
  end
  object SourceMDds: TDataSource
    DataSet = SourceMDT
    Left = 96
    Top = 71
  end
  object TypeMDds: TDataSource
    DataSet = TypeMDT
    Left = 96
    Top = 128
  end
  object ValuteMDds: TDataSource
    DataSet = ValuteMDT
    Left = 96
    Top = 176
  end
  object CalcStatusMDds: TDataSource
    DataSet = CalcStatusMDT
    Left = 115
    Top = 232
  end
  object Queries: TOracleDataSet
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 420
    Top = 8
  end
  object sysdat: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 456
    Top = 8
  end
  object ODSKindPay: TOracleDataSet
    SQL.Strings = (
      'select'
      '  src.name as sourcename,'
      '  nvl(geninf.BcountDep,0) as BcountDep,'
      '  nvl(geninf.beginRest,0) as beginRest,'
      '  nvl(geninf.roundInt,0) as roundInt,'
      '  nvl(geninf.beginIntRest,0) as beginIntRest,'
      '  nvl(geninf.ceofrest,0) as ceofrest,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,-10000000,7,:fstr' +
        ',:fstrB) as g0,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,-10000000,7,:f' +
        'str,:fstrB) as fg0,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,-10000000,7,:fst' +
        'r,:fstrB) as countg0,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,8,30,:fstr,:fstrB' +
        ') as g1,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,8,30,:fstr,:fs' +
        'trB) as fg1,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,8,30,:fstr,:fstr' +
        'B) as countg1,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,31,90,:fstr,:fstr' +
        'B) as g2,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,31,90,:fstr,:f' +
        'strB) as fg2,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,31,90,:fstr,:fst' +
        'rB) as countg2,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,91,180,:fstr,:fst' +
        'rB) as g3,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,91,180,:fstr,:' +
        'fstrB) as fg3,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,91,180,:fstr,:fs' +
        'trB) as countg3,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,181,360,:fstr,:fs' +
        'trB) as g4,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,181,360,:fstr,' +
        ':fstrB) as fg4,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,181,360,:fstr,:f' +
        'strB) as countg4,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,361,720,:fstr,:fs' +
        'trB) as g5,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,361,720,:fstr,' +
        ':fstrB) as fg5,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,361,720,:fstr,:f' +
        'strB) as countg5,'
      ''
      
        '  usaid_report.Get_RestByPerForDat(src.id,:dat,721,7210000,:fstr' +
        ',:fstrB) as g6,'
      
        '  usaid_report.Get_IntRestByPerForDat(src.id,:dat,721,7210000,:f' +
        'str,:fstrB) as fg6,  '
      
        '  usaid_report.Get_CountByPerForDat(src.id,:dat,721,7210000,:fst' +
        'r,:fstrB) as countg6'
      ''
      'from'
      ''
      'uaod_source src,'
      ''
      '(select '
      ' sum(BcountDep) as BcountDep,'
      ' sum(beginRest) as beginRest,'
      ' round(sum(beginRest)/:genrest,4)*100 as CeofRest,'
      ' round(sum(roundInt)/:genrest,4)*100 as roundInt,'
      ' sum(beginIntRest) as beginIntRest,'
      ' SourceID'
      ' from '
      ' (select '
      '   count(p.id) as BcountDep,'
      
        '   sum(round(h.facticaldebt*o.ostat,2)*intr.interest) as roundIn' +
        't,'
      '   round(sum(h.facticaldebt*o.ostat),2) as beginRest,'
      '   round(sum(h.facticalinterestdebt*o.ostat),2) as beginIntRest,'
      '   src.SourceID'
      'from '
      '  sbcm_contracts p,'
      '  sbcm_contract_history h,'
      '  operkurs o,sbcm_interests intr,'
      '  sbcm_accounts ac,uaod_source_bal src'
      'where'
      
        'p.type# in (3,4) and src.bal_cn = ac.bal_cn1 and p.id = intr.id#' +
        ' and'
      'p.id = h.id# and h.hdate = :dat and h.facticaldebt <> 0 and'
      'p.currency = o.val_kod and o.dat = :dat and'
      'ac.id# = p.id'
      ''
      'group by src.SourceID'
      'union all'
      'select'
      '  count(ac.id) as BcountDep,'
      '  0 as roundInt,'
      '  sum(abs(ar.pok_ostat)) as beginRest,'
      '  0 as beginIntRest,'
      '  src.SourceID'
      'from account ac ,archost ar,uaod_source_bal src'
      'where ac.id = ar.acc_id and ac.bal_cn1 = src.bal_cn and'
      'ar.datdate = :dat and ar.ostat <> 0'
      ''
      'group by src.SourceID '
      ')'
      'group by SourceID'
      ') geninf'
      ''
      'where '
      '   src.id = geninf.sourceid(+)'
      '')
    Optimize = False
    Variables.Data = {
      0400000004000000080000003A004400410054000C0000000000000000000000
      0A0000003A0046005300540052000500000000000000000000000C0000003A00
      46005300540052004200050000000000000000000000100000003A0047004500
      4E005200450053005400040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001B0000001400000053004F0055005200430045004E0041004D004500
      01000000000012000000420043004F0055004E00540044004500500001000000
      00001200000042004500470049004E0052004500530054000100000000001000
      000052004F0055004E00440049004E0054000100000000001800000042004500
      470049004E0049004E0054005200450053005400010000000000040000004700
      3100010000000000060000004600470031000100000000000E00000043004F00
      55004E0054004700310001000000000004000000470032000100000000000600
      00004600470032000100000000000E00000043004F0055004E00540047003200
      0100000000000400000047003300010000000000060000004600470033000100
      000000000E00000043004F0055004E0054004700330001000000000004000000
      47003400010000000000060000004600470034000100000000000E0000004300
      4F0055004E005400470034000100000000000400000047003500010000000000
      060000004600470035000100000000000E00000043004F0055004E0054004700
      3500010000000000040000004700360001000000000006000000460047003600
      0100000000000E00000043004F0055004E005400470036000100000000001000
      0000430045004F00460052004500530054000100000000000400000047003000
      010000000000060000004600470030000100000000000E00000043004F005500
      4E00540047003000010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 32
    object ODSKindPaySOURCENAME: TWideStringField
      DisplayLabel = #1052#1103#1085#1073#1103
      FieldName = 'SOURCENAME'
      Required = True
      Size = 80
    end
    object ODSKindPayBCOUNTDEP: TFloatField
      DisplayLabel = #1057#1072#1081
      FieldName = 'BCOUNTDEP'
    end
    object ODSKindPayBEGINREST: TFloatField
      DisplayLabel = #1043#1072#1083#1099#1075' '#1084#1103#1100'.'
      FieldName = 'BEGINREST'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCEOFREST: TFloatField
      DisplayLabel = #1055#1086#1088#1090'.%'
      FieldName = 'CEOFREST'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayBEGININTREST: TFloatField
      DisplayLabel = #1065#1077#1089'.%'
      FieldName = 'BEGININTREST'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayROUNDINT: TFloatField
      DisplayLabel = #1054#1063#1060
      FieldName = 'ROUNDINT'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayG0: TFloatField
      DisplayLabel = '0-7/'#1043#1041
      FieldName = 'G0'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG0: TFloatField
      DisplayLabel = '0-7/'#1060#1041
      FieldName = 'FG0'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG0: TFloatField
      DisplayLabel = '0-7/'#1057#1072#1081
      FieldName = 'COUNTG0'
    end
    object ODSKindPayG1: TFloatField
      DisplayLabel = '0-30/'#1043#1041
      FieldName = 'G1'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG1: TFloatField
      DisplayLabel = '0-30/'#1060#1041
      FieldName = 'FG1'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG1: TFloatField
      DisplayLabel = '0-30/'#1057#1072#1081
      FieldName = 'COUNTG1'
    end
    object ODSKindPayG2: TFloatField
      DisplayLabel = '30-90/'#1043#1041
      FieldName = 'G2'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG2: TFloatField
      DisplayLabel = '30-90/'#1060#1041
      FieldName = 'FG2'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG2: TFloatField
      DisplayLabel = '30-90/'#1057#1072#1081
      FieldName = 'COUNTG2'
    end
    object ODSKindPayG3: TFloatField
      DisplayLabel = '90-180/'#1043#1041
      FieldName = 'G3'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG3: TFloatField
      DisplayLabel = '90-180/'#1060#1041
      FieldName = 'FG3'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG3: TFloatField
      DisplayLabel = '90-180/'#1057#1072#1081
      FieldName = 'COUNTG3'
    end
    object ODSKindPayG4: TFloatField
      DisplayLabel = '180-360/'#1043#1041
      FieldName = 'G4'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG4: TFloatField
      DisplayLabel = '180-360/'#1060#1041
      FieldName = 'FG4'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG4: TFloatField
      DisplayLabel = '180-360/'#1057#1072#1081
      FieldName = 'COUNTG4'
    end
    object ODSKindPayG5: TFloatField
      DisplayLabel = '360-720/'#1043#1041
      FieldName = 'G5'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG5: TFloatField
      DisplayLabel = '360-720/'#1057#1072#1081
      FieldName = 'FG5'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG5: TFloatField
      DisplayLabel = '360-720/'#1057#1072#1081
      FieldName = 'COUNTG5'
    end
    object ODSKindPayG6: TFloatField
      DisplayLabel = '>=720/'#1043#1041
      FieldName = 'G6'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayFG6: TFloatField
      DisplayLabel = '>=720/'#1057#1072#1081
      FieldName = 'FG6'
      DisplayFormat = '#,##0.00'
    end
    object ODSKindPayCOUNTG6: TFloatField
      DisplayLabel = '>=720/'#1057#1072#1081
      FieldName = 'COUNTG6'
    end
  end
  object ODSKindPayds: TDataSource
    DataSet = ODSKindPay
    Left = 312
    Top = 32
  end
end

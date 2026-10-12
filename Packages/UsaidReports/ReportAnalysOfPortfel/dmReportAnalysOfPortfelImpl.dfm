object dmReportAnalysOfPortfel: TdmReportAnalysOfPortfel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 504
  Width = 696
  object sysdat: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 456
    Top = 8
  end
  object filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 16
    Top = 16
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'select id,description from cm_credittypes'
      'order by id')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 96
    Top = 16
  end
  object valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 16
  end
  object valutesds: TDataSource
    DataSet = valutes
    Left = 192
    Top = 72
  end
  object CreditTypesds: TDataSource
    DataSet = CreditTypes
    Left = 96
    Top = 72
  end
  object filialsds: TDataSource
    DataSet = filials
    Left = 16
    Top = 72
  end
  object CategoriesSumds: TDataSource
    DataSet = CategoriesSum
    Left = 32
    Top = 184
  end
  object CategoriesSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   cat.description as sector,'
      
        '   d.*,usaid_report.GetProgForR3(1,cat.id,:ffilter,0) as proqnoz' +
        ',round(usaid_report.GetProgForR3(1,cat.id,:ffilter,0)/decode(d.i' +
        'nitialamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  cm_categories cat,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      
        '   --usaid_report.GetProgForR3(1,p_DepID in integer,fstr in varc' +
        'har2,b integer default 0) as proqnoz,'
      '   --0 as delta,'
      '   p.customertype'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid and h.hdate=:dat and h.res' +
        't+h.duerest>0'
      '   '
      'group by p.customertype) d'
      ''
      'where d.customertype = cat.id'
      'order by :OrderField')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001800000043005500530054004F004D00450052005400590050004500
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 32
    Top = 128
    object CategoriesSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 128
    end
    object CategoriesSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object CategoriesSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object CategoriesSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object CategoriesSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object CategoriesSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object CategoriesSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object CategoriesSumCUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
      Visible = False
    end
    object CategoriesSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object CategoriesSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object CategoriesSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Size = 50
      Calculated = True
    end
  end
  object PersonsSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   cat.DESCRIPION as sector,'
      
        '   d.*,usaid_report.GetProgForR3(2,cat.id,:ffilter,0) as proqnoz' +
        ',round(usaid_report.GetProgForR3(2,cat.id,:ffilter,0)/decode(d.i' +
        'nitialamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  cm_persons cat,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '   0 as proqnoz,'
      '   0 as delta,'
      '   p.personaltype'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid and h.hdate = :dat and h.r' +
        'est+h.duerest>0'
      '    '
      'group by p.personaltype) d'
      ''
      'where d.personaltype = cat.id'
      'order by :OrderField'
      '   ')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001800000050004500520053004F004E0041004C005400590050004500
      010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 128
    Top = 128
    object PersonsSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 64
    end
    object PersonsSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object PersonsSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object PersonsSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object PersonsSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object PersonsSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object PersonsSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object PersonsSumPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
      Visible = False
    end
    object PersonsSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object PersonsSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object PersonsSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Size = 200
      Calculated = True
    end
  end
  object PersonsSumds: TDataSource
    DataSet = PersonsSum
    Left = 120
    Top = 184
  end
  object PledgsPledgsSumds: TDataSource
    DataSet = PledgsSum
    Left = 216
    Top = 184
  end
  object PledgsSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   pl.DESCRIPTION as sector,'
      
        '   d.*,usaid_report.GetProgForR3(3,pl.id,:ffilter,0) as proqnoz,' +
        'round(usaid_report.GetProgForR3(3,pl.id,:ffilter,0)/decode(d.ini' +
        'tialamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  cm_pledges pl ,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '   0 as proqnoz,'
      '   0 as delta,'
      '   gr.pledgeid '
      'from'
      '   cm_portfolio p,'
      '   operkurs o,'
      '   cm_guarantee gr, cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and  p.id = gr.creditid and p.id = h.creditid an' +
        'd h.hdate=:dat and h.rest+h.duerest>0'
      ''
      '   '
      'group by gr.pledgeid) d'
      ''
      'where d.pledgeid = pl.id'
      'order by :OrderField'
      '   ')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001000000050004C00450044004700450049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 208
    Top = 128
    object PledgsSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 64
    end
    object PledgsSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object PledgsSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object PledgsSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object PledgsSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object PledgsSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object PledgsSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object PledgsSumPLEDGEID: TFloatField
      FieldName = 'PLEDGEID'
      Required = True
      Visible = False
    end
    object PledgsSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object PledgsSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object PledgsSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object ValutesSumds: TDataSource
    DataSet = ValutesSum
    Left = 264
    Top = 80
  end
  object ValutesSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   cat.valu_name as sector,'
      
        '   d.*,usaid_report.GetProgForR3(4,cat.valute,:ffilter,0) as pro' +
        'qnoz,round(usaid_report.GetProgForR3(4,cat.valute,:ffilter,0)/de' +
        'code(d.initialamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  avalute cat,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '  -- 0 as proqnoz,'
      '  -- 0 as delta,'
      '   p.currency'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid  and h.hdate=:dat and h.re' +
        'st+h.duerest>0'
      '   '
      'group by p.currency) d'
      ''
      'where d.currency = cat.valute'
      'order by :OrderField'
      '   '
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      0000000010000000430055005200520045004E0043005900010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 264
    Top = 16
    object ValutesSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 25
    end
    object ValutesSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object ValutesSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object ValutesSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ValutesSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object ValutesSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object ValutesSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object ValutesSumCURRENCY: TFloatField
      FieldName = 'CURRENCY'
      Required = True
      Visible = False
    end
    object ValutesSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object ValutesSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object ValutesSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object RegionsSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   ar.name as sector,'
      
        '   d.*,usaid_report.GetProgForR3(5,ar.id,:ffilter,0) as proqnoz,' +
        'round(usaid_report.GetProgForR3(5,ar.id,:ffilter,0)/decode(d.ini' +
        'tialamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  agro_region ar ,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '   --0 as proqnoz,'
      '   --0 as delta,'
      '   agv.depend_id '
      'from'
      '   cm_portfolio p,'
      '   operkurs o,'
      '   cm_business_plan bp,'
      '   agro_village agv,cm_history h'
      '   '
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and  p.id = bp.creditid and bp.villageid = agv.i' +
        'd and p.id = h.creditid  and h.hdate=:dat and h.rest+h.duerest>0'
      '   '
      'group by agv.depend_id) d'
      ''
      'where d.depend_id = ar.id'
      'order by :OrderField'
      '   '
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001200000044004500500045004E0044005F0049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 344
    Top = 16
    object RegionsSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 128
    end
    object RegionsSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object RegionsSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object RegionsSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object RegionsSumCEOFINITAMT: TFloatField
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object RegionsSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object RegionsSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object RegionsSumDEPEND_ID: TFloatField
      FieldName = 'DEPEND_ID'
      Visible = False
    end
    object RegionsSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object RegionsSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object RegionsSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object RegionsSumds: TDataSource
    DataSet = RegionsSum
    Left = 344
    Top = 80
  end
  object CountriesSumds: TDataSource
    DataSet = CountriesSum
    Left = 312
    Top = 184
  end
  object CountriesSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   c.name as sector,'
      
        '   d.*,usaid_report.GetProgForR3(1,c.id,:ffilter,0) as proqnoz,u' +
        'said_report.GetProgForR3(1,c.id,:ffilter,0)/decode(d.initialamou' +
        'nt,0,1,d.initialamount) as delta'
      'from '
      '  cm_countrys c ,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '   0 as proqnoz,'
      '   0 as delta,'
      '   b.countrycode '
      'from'
      '   cm_portfolio p,'
      '   operkurs o,'
      '   cm_boorowerinfo b, cm_history h'
      '   '
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and  p.id = b.creditid  and p.id = h.creditid an' +
        'd h.hdate=:dat and h.rest+h.duerest>0'
      '      '
      'group by b.countrycode ) d'
      ''
      'where d.countrycode = c.code'
      'order by :OrderField'
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001600000043004F0055004E0054005200590043004F00440045000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 280
    Top = 128
    object CountriesSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Required = True
      Size = 255
    end
    object CountriesSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object CountriesSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object CountriesSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object CountriesSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object CountriesSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object CountriesSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object CountriesSumCOUNTRYCODE: TWideStringField
      FieldName = 'COUNTRYCODE'
      Visible = False
      Size = 8
    end
    object CountriesSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object CountriesSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
  end
  object CalcMethodsSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   c.description as sector,'
      '   d.*'
      'from '
      '  cm_intcalcmethod c ,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat),4) as initialamou' +
        'nt,'
      
        '   round(sum(h.rest*o.ostat+h.duerest*o.ostat)/:GenInitAmt,4)*10' +
        '0 as CeofInitAmt,'
      '   0 as proqnoz,'
      '   0 as delta,'
      '   p.INTCALCMETHOD'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      '      '
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid and h.hdate=:dat and h.res' +
        't+h.duerest>0'
      '         '
      'group by p.INTCALCMETHOD ) d'
      ''
      'where d.INTCALCMETHOD = c.id'
      'order by :OrderField'
      '   '
      '')
    Optimize = False
    Variables.Data = {
      0400000004000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      000000001A00000049004E005400430041004C0043004D004500540048004F00
      4400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 384
    Top = 128
    object CalcMethodsSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Required = True
      Size = 32
    end
    object CalcMethodsSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object CalcMethodsSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object CalcMethodsSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object CalcMethodsSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object CalcMethodsSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079'%'
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object CalcMethodsSumDELTA: TFloatField
      DisplayLabel = '%'#1076#1103#1081#1080#1096#1080#1082#1083#1080#1081#1080
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object CalcMethodsSumINTCALCMETHOD: TFloatField
      FieldName = 'INTCALCMETHOD'
      Visible = False
    end
    object CalcMethodsSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object CalcMethodsSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
  end
  object CalcMethodsSumDs: TDataSource
    DataSet = CalcMethodsSum
    Left = 408
    Top = 184
  end
  object ReservesSumds: TDataSource
    DataSet = ReservesSum
    Left = 40
    Top = 296
  end
  object ReservesSum: TOracleDataSet
    SQL.Strings = (
      'select '
      '   c.percent||'#39'%'#39'||'#39'-'#39'||c.description as sector,'
      
        '   d.*,usaid_report.GetProgForR3(6,c.id,:ffilter,0) as proqnoz,r' +
        'ound(usaid_report.GetProgForR3(6,c.id,:ffilter,0)/decode(d.initi' +
        'alamount,0,1,d.initialamount),4)*100 as delta'
      'from '
      '  cm_reserves c ,'
      ''
      '(select'
      '   count(p.id) as CrdCount,'
      '   round(count(p.id)/(:GenCount),4)*100 as CeofCount,'
      
        '   round(sum(cs.rest*o.ostat+cs.duerest*o.ostat),4) as initialam' +
        'ount,'
      
        '   round(sum(cs.rest*o.ostat+cs.duerest*o.ostat)/:GenInitAmt,4)*' +
        '100 as CeofInitAmt,'
      '   --0 as proqnoz,'
      '   --0 as delta,'
      '   cs.reserveid'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,'
      '   cm_history cs'
      '      '
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = cs.creditid and cs.hdate = :dat  and ' +
        'cs.rest+cs.duerest>0'
      '         '
      'group by cs.reserveid ) d'
      ''
      'where d.reserveid = c.id '
      'order by :OrderField'
      '   '
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C00000053004500430054004F0052000100000000001000
      000043005200440043004F0055004E0054000100000000001200000043004500
      4F00460043004F0055004E0054000100000000001A00000049004E0049005400
      490041004C0041004D004F0055004E0054000100000000001600000043004500
      4F00460049004E004900540041004D0054000100000000000E00000050005200
      4F0051004E004F005A000100000000000A000000440045004C00540041000100
      0000000012000000520045005300450052005600450049004400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 40
    Top = 240
    object ReservesSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Required = True
      Size = 64
    end
    object ReservesSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object ReservesSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
    end
    object ReservesSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object ReservesSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object ReservesSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object ReservesSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object ReservesSumRESERVEID: TFloatField
      FieldName = 'RESERVEID'
      Required = True
      Visible = False
    end
    object ReservesSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Visible = False
      Calculated = True
    end
    object ReservesSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Visible = False
      Calculated = True
    end
    object ReservesSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object Queries: TOracleDataSet
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 352
  end
  object AnnualIntSum: TOracleDataSet
    SQL.Strings = (
      'select '
      'd.CrdCount,'
      'd.CeofCount,'
      'd.initialamount,'
      'd.CeofInitAmt,'
      '--d.proqnoz,'
      '--d.delta,'
      
        'sectors.sector,sectors.bper,sectors.eper,usaid_report.GetProgFor' +
        'R3(7,sectors.id,:ffilter,0) as proqnoz,round(usaid_report.GetPro' +
        'gForR3(7,sectors.id,:ffilter,0)/decode(d.initialamount,0,1,d.ini' +
        'tialamount),4)*100 as delta'
      'from'
      ''
      '(select 1 as ID,'#39'<=12'#39' as sector,0 as bper, 12 as eper from dual'
      'union'
      
        'select 2 as ID,'#39'<12<=18'#39' as sector,13 as bper, 18 as eper from d' +
        'ual'
      'union'
      
        'select 3 as ID,'#39'<18<=24'#39' as sector ,19 as bper, 24 as eper from ' +
        'dual'
      'union'
      
        'select 4 as ID,'#39'<24<=30'#39' as sector,25 as bper, 30 as eper from d' +
        'ual'
      'union'
      
        'select 5 as ID,'#39'>30'#39' as sector,31 as bper, 500 as eper from dual' +
        ') sectors,'
      ''
      '(select '
      ' count(CrdCount) as CrdCount,'
      ' round(count(CrdCount)/(:GenCount),4)*100 as CeofCount,'
      ' round(sum(initialamount),4) as initialamount,'
      ' round(sum(CeofInitAmt)/:GenInitAmt,4)*100 as CeofInitAmt,'
      ' 0 as proqnoz,'
      ' 0 as delta,'
      ' sectorID from '
      '  ('
      'select'
      '   p.id as CrdCount,'
      '   round(h.rest*o.ostat+h.duerest*o.ostat,4) as initialamount,'
      '   round((h.rest*o.ostat+h.duerest*o.ostat),4) as CeofInitAmt,'
      '   case '
      '              when p.ANNUALYINTERESTRATE < =12 then 1'
      
        '              when p.ANNUALYINTERESTRATE > 12 and p.ANNUALYINTER' +
        'ESTRATE < =18 then  2'
      
        '              when p.ANNUALYINTERESTRATE > 18 and p.ANNUALYINTER' +
        'ESTRATE < =24 then  3'
      
        '              when p.ANNUALYINTERESTRATE > 24  and p.ANNUALYINTE' +
        'RESTRATE < =30 then 4'
      '              when p.ANNUALYINTERESTRATE > 30 then 5'
      '              end as sectorID'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid and h.hdate=:dat and h.res' +
        't+h.duerest>0'
      '   '
      ')'
      'group by sectorID order by sectorID) d'
      ''
      'where d.sectorID = sectors.id'
      'order by :OrderField'
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000090000001000000043005200440043004F0055004E00540001000000
      000012000000430045004F00460043004F0055004E0054000100000000001A00
      000049004E0049005400490041004C0041004D004F0055004E00540001000000
      000016000000430045004F00460049004E004900540041004D00540001000000
      00000E000000500052004F0051004E004F005A000100000000000A0000004400
      45004C00540041000100000000000C00000053004500430054004F0052000100
      0000000008000000420050004500520001000000000008000000450050004500
      5200010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 144
    Top = 240
    object AnnualIntSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 7
    end
    object AnnualIntSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object AnnualIntSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
      DisplayFormat = '#,##0.00'
    end
    object AnnualIntSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object AnnualIntSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object AnnualIntSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object AnnualIntSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object AnnualIntSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Calculated = True
    end
    object AnnualIntSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Calculated = True
    end
    object AnnualIntSumBPER: TFloatField
      FieldName = 'BPER'
      Visible = False
    end
    object AnnualIntSumEPER: TFloatField
      FieldName = 'EPER'
      Visible = False
    end
    object AnnualIntSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object AnnualIntSumds: TDataSource
    DataSet = AnnualIntSum
    Left = 144
    Top = 296
  end
  object PeriodsSum: TOracleDataSet
    SQL.Strings = (
      'select '
      'd.CrdCount,'
      'd.CeofCount,'
      'd.initialamount,'
      'd.CeofInitAmt,'
      '--d.proqnoz,'
      '--d.delta,'
      
        'sectors.sector,sectors.bper,sectors.eper,usaid_report.GetProgFor' +
        'R3(8,sectors.id,:ffilter,0) as proqnoz,round(usaid_report.GetPro' +
        'gForR3(8,sectors.id,:ffilter,0)/decode(d.initialamount,0,1,d.ini' +
        'tialamount),4)*100  as delta'
      'from'
      ''
      '(select 1 as ID,'#39'<=30'#39' as sector,0 as bper ,30 as eper from dual'
      'union'
      
        'select 2 as ID,'#39'30<=90'#39' as sector,31 as bper ,90 as eper from du' +
        'al'
      'union'
      
        'select 3 as ID,'#39'90<=180'#39' as sector,91 as bper ,180 as eper from ' +
        'dual'
      'union'
      
        'select 4 as ID,'#39'180<=360'#39' as sector,181 as bper ,360 as eper fro' +
        'm dual'
      'union'
      
        'select 5 as ID,'#39'360<=720'#39' as sector,361 as bper ,720 as eper fro' +
        'm dual'
      'union'
      
        'select 6 as ID,'#39'720<=1080'#39' as sector,721 as bper ,1080 as eper f' +
        'rom dual'
      'union'
      
        'select 7 as ID,'#39'1080<'#39' as sector,1081 as bper ,108100 as eper fr' +
        'om dual) sectors,'
      ''
      '(select '
      ' count(CrdCount) as CrdCount,'
      ' round(count(CrdCount)/(:GenCount),4)*100 as CeofCount,'
      ' round(sum(initialamount),4) as initialamount,'
      ' round(sum(CeofInitAmt)/:GenInitAmt,4)*100 as CeofInitAmt,'
      ' 0 as proqnoz,'
      ' 0 as delta,'
      ' sectorID from '
      '  ('
      'select'
      '   p.id as CrdCount,'
      '   round(h.rest*o.ostat+h.duerest*o.ostat,4) as initialamount,'
      '   round((h.rest*o.ostat+h.duerest*o.ostat),4) as CeofInitAmt,'
      '   case '
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT)<=30 then 1'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) > 30 and cm_utils.BankDaysBetween(p.DATEO' +
        'FCONCLUSION,p.DUEDATEFIRSTCONTRACT) < =90 then  2'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) > 90 and cm_utils.BankDaysBetween(p.DATEO' +
        'FCONCLUSION,p.DUEDATEFIRSTCONTRACT) < =180 then  3'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) > 180  and cm_utils.BankDaysBetween(p.DAT' +
        'EOFCONCLUSION,p.DUEDATEFIRSTCONTRACT) < =360 then 4'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) > 360 and cm_utils.BankDaysBetween(p.DATE' +
        'OFCONCLUSION,p.DUEDATEFIRSTCONTRACT)<=720 then 5'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) >720 and cm_utils.BankDaysBetween(p.DATEO' +
        'FCONCLUSION,p.DUEDATEFIRSTCONTRACT) <= 1080 then 6'
      
        '              when cm_utils.BankDaysBetween(p.DATEOFCONCLUSION,p' +
        '.DUEDATEFIRSTCONTRACT) >1080 then 7'
      '              end as sectorID'
      'from'
      '   cm_portfolio p,'
      '   operkurs o,cm_history h'
      'where'
      '   p.currency = o.val_kod and'
      
        '   o.dat = :dat and p.id = h.creditid and h.hdate= :dat and h.re' +
        'st+h.duerest>0'
      '   '
      ')'
      'group by sectorID order by sectorID) d'
      ''
      'where d.sectorID = sectors.id'
      'order by :OrderField'
      '')
    Optimize = False
    Variables.Data = {
      0400000005000000120000003A00470045004E0043004F0055004E0054000300
      00000000000000000000160000003A00470045004E0049004E00490054004100
      4D005400040000000000000000000000080000003A004400410054000C000000
      0000000000000000160000003A004F0052004400450052004600490045004C00
      4400010000000000000000000000100000003A004600460049004C0054004500
      5200050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000090000001000000043005200440043004F0055004E00540001000000
      000012000000430045004F00460043004F0055004E0054000100000000001A00
      000049004E0049005400490041004C0041004D004F0055004E00540001000000
      000016000000430045004F00460049004E004900540041004D00540001000000
      00000E000000500052004F0051004E004F005A000100000000000A0000004400
      45004C00540041000100000000000C00000053004500430054004F0052000100
      0000000008000000420050004500520001000000000008000000450050004500
      5200010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    OnCalcFields = CategoriesSumCalcFields
    Left = 232
    Top = 240
    object PeriodsSumSECTOR: TWideStringField
      DisplayLabel = #1057#1077#1082#1090#1086#1088
      FieldName = 'SECTOR'
      Size = 9
    end
    object PeriodsSumCRDCOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1089#1072#1081#1099
      FieldName = 'CRDCOUNT'
    end
    object PeriodsSumCEOFCOUNT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFCOUNT'
      DisplayFormat = '#,##0.00'
    end
    object PeriodsSumINITIALAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073#1083'.'
      FieldName = 'INITIALAMOUNT'
      DisplayFormat = '#,##0.00'
    end
    object PeriodsSumCEOFINITAMT: TFloatField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldName = 'CEOFINITAMT'
      DisplayFormat = '#,##0.00'
    end
    object PeriodsSumPROQNOZ: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079
      FieldName = 'PROQNOZ'
      DisplayFormat = '#,##0.00'
    end
    object PeriodsSumDELTA: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldName = 'DELTA'
      DisplayFormat = '#,##0.00'
    end
    object PeriodsSumceofCEOFCOUNT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFCOUNT'
      Calculated = True
    end
    object PeriodsSumceofCEOFINITAMT: TWideStringField
      DisplayLabel = #1055#1086#1088#1090'%'
      FieldKind = fkCalculated
      FieldName = 'ceofCEOFINITAMT'
      Calculated = True
    end
    object PeriodsSumBPER: TFloatField
      FieldName = 'BPER'
      Visible = False
    end
    object PeriodsSumEPER: TFloatField
      FieldName = 'EPER'
      Visible = False
    end
    object PeriodsSumceofdelta: TWideStringField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079#1091#1085' '#1080#1078#1088#1072#1089#1099
      FieldKind = fkCalculated
      FieldName = 'ceofdelta'
      Visible = False
      Calculated = True
    end
  end
  object PeriodsSumds: TDataSource
    DataSet = PeriodsSum
    Left = 232
    Top = 296
  end
  object ODSDetailds: TDataSource
    DataSet = ODSDetail
    Left = 317
    Top = 296
  end
  object ODSDetail: TOracleDataSet
    SQL.Strings = (
      'select'
      '   f.name as filialname,'
      '   crdtype.description,'
      '   av.val_name as valu_name,'
      '   p.numberofcredit,'
      '   ac.acc_no,'
      '   b.name as custname,'
      '   p.creditlineamount,'
      '   p.ANNUALYINTERESTRATE,'
      '   r.percent,'
      '   round(h.rest*o.ostat,2)+round(h.duerest*o.ostat,2) as rest,'
      
        '   round(h.interestrest*o.ostat,2)+round(h.dueinterestrest*o.ost' +
        'at,2) as interestrest,'
      '   p.DATEOFCONCLUSION,'
      '   p.DUEDATEFIRSTCONTRACT'
      'from'
      '   cm_portfolio p,'
      '   filial_t f,'
      '   avalute av,'
      '   cm_loanaccounts ac,'
      '   cm_boorowerinfo b,'
      '   cm_history h,'
      '   operkurs o,'
      '   cm_credittypes crdtype,'
      '   cm_reserves r'
      'where '
      '  p.branchid = f.id and'
      '  p.currency = av.valute and'
      '  p.id = ac.creditid and'
      '  p.id = b.creditid and'
      '  p.id = h.creditid and'
      '  h.hdate = :dat and (h.rest + h.duerest)>0 and '
      '  o.val_kod = p.currency and'
      '  o.dat = :dat and'
      '  p.credittype = crdtype.id and'
      '  h.reserveid = r.id '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      '  '
      'order by :OrderField')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A004400410054000C0000000000000000000000
      160000003A004F0052004400450052004600490045004C004400010000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000D00000014000000460049004C00490041004C004E0041004D004500
      010000000000160000004400450053004300520049005000540049004F004E00
      01000000000012000000560041004C0055005F004E0041004D00450001000000
      00001C0000004E0055004D004200450052004F00460043005200450044004900
      54000100000000000C0000004100430043005F004E004F000100000000001000
      000043005500530054004E0041004D0045000100000000002000000043005200
      45004400490054004C0049004E00450041004D004F0055004E00540001000000
      00002600000041004E004E00550041004C00590049004E005400450052004500
      5300540052004100540045000100000000000E00000050004500520043004500
      4E00540001000000000008000000520045005300540001000000000018000000
      49004E0054004500520045005300540052004500530054000100000000002000
      000044004100540045004F00460043004F004E0043004C005500530049004F00
      4E00010000000000280000004400550045004400410054004500460049005200
      5300540043004F004E0054005200410043005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 304
    Top = 240
    object ODSDetailFILIALNAME: TWideStringField
      DisplayLabel = #1060#1080#1083#1080#1072#1083
      FieldName = 'FILIALNAME'
      Size = 90
    end
    object ODSDetailDESCRIPTION: TWideStringField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object ODSDetailVALU_NAME: TWideStringField
      DisplayLabel = #1042#1072#1083#1081#1091#1090#1072
      FieldName = 'VALU_NAME'
      Size = 25
    end
    object ODSDetailNUMBEROFCREDIT: TWideStringField
      DisplayLabel = #1052#1094#1075#1072#1074'.'#8470
      FieldName = 'NUMBEROFCREDIT'
      Required = True
      Size = 32
    end
    object ODSDetailACC_NO: TWideStringField
      DisplayLabel = #1065#1077#1089#1072#1073'.'#8470
      FieldName = 'ACC_NO'
    end
    object ODSDetailCUSTNAME: TWideStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
      FieldName = 'CUSTNAME'
      Size = 64
    end
    object ODSDetailCREDITLINEAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.'#1084#1103#1073'.'
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
    end
    object ODSDetailANNUALYINTERESTRATE: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090'.%'
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
    end
    object ODSDetailPERCENT: TFloatField
      DisplayLabel = #1045#1097#1090'.%'
      FieldName = 'PERCENT'
      Required = True
    end
    object ODSDetailREST: TFloatField
      DisplayLabel = #1071#1041
      FieldName = 'REST'
    end
    object ODSDetailINTERESTREST: TFloatField
      DisplayLabel = #1060#1041
      FieldName = 'INTERESTREST'
    end
    object ODSDetailDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = #1042#1077#1088'.'#1090#1072#1088#1080#1093#1080
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object ODSDetailDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = #1041#1072#1100#1083'.'#1090#1072#1088#1080#1093#1080
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
  end
end

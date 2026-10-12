object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 405
  Width = 764
  object cc_contracts: TOracleDataSet
    SQL.Strings = (
      
        'select rownum,cont.code,cont.id as id,cont.contnum,cont.FIRSTNAM' +
        'E,cont.lastname,cont.MIDDLENAME,cont.acc_no,'
      
        '       av.val_name,cont.contamount as creditamount, cont.bld_nam' +
        'e, cont.FLATNUMBER,cont.rest, cont.comp_name,'
      
        '       cont.entrance, cont.ffloor, cont.area  from  cc_activecon' +
        'tracts cont , avalute av'
      'where av.valute = cont.contcur '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000110000000C00000052004F0057004E0055004D000100000000000800
      000043004F004400450001000000000004000000490044000100000000000E00
      000043004F004E0054004E0055004D0001000000000012000000460049005200
      530054004E0041004D004500010000000000100000004C004100530054004E00
      41004D004500010000000000140000004D004900440044004C0045004E004100
      4D0045000100000000000C0000004100430043005F004E004F00010000000000
      10000000560041004C005F004E0041004D004500010000000000180000004300
      5200450044004900540041004D004F0055004E00540001000000000010000000
      42004C0044005F004E0041004D0045000100000000001400000046004C004100
      54004E0055004D00420045005200010000000000080000005200450053005400
      0100000000001200000043004F004D0050005F004E0041004D00450001000000
      00001000000045004E005400520041004E00430045000100000000000C000000
      460046004C004F004F0052000100000000000800000041005200450041000100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 96
  end
  object CC_contractsSrc: TDataSource
    DataSet = cc_contracts
    Left = 536
    Top = 160
  end
  object sboapi: TOracleLogon
    Session = sboapiDataModule.SBSession
    Options = [ldDatabase]
    Left = 472
    Top = 136
  end
  object main: TOracleDataSet
    SQL.Strings = (
      
        ' select p.id,p.monthpay ,i.suminterest,nvl(cc_general.gecikme(p.' +
        'id),0) gecmeb,cc_general.gecgun(p.id)gun from cc_contracts p,cc_' +
        'int_currstate i'
      ' '
      ' where p.id=i.countid'
      'and  p.id=:cid'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00430049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000100000004D004F004E00
      5400480050004100590001000000000016000000530055004D0049004E005400
      450052004500530054000100000000000C0000004700450043004D0045004200
      01000000000006000000470055004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 128
    object mainID: TFloatField
      FieldName = 'ID'
    end
    object mainMONTHPAY: TFloatField
      FieldName = 'MONTHPAY'
      DisplayFormat = '#,#0.0'
    end
    object mainSUMINTEREST: TFloatField
      FieldName = 'SUMINTEREST'
      Required = True
      DisplayFormat = '#,#0.0'
    end
    object mainGECMEB: TFloatField
      FieldName = 'GECMEB'
      DisplayFormat = '#,#0.0'
    end
    object mainGUN: TFloatField
      FieldName = 'GUN'
    end
  end
  object MainSrc: TDataSource
    DataSet = main
    Left = 208
    Top = 176
  end
end

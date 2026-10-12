object CalendarDataMod: TCalendarDataMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 640
  Width = 870
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 112
    Top = 40
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rownum,rowid,c.*from calendar c order by holiday_date'
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
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000016000000440045005300
      4300520049005000540049004F004E000100000000001800000048004F004C00
      49004400410059005F0044004100540045000100000000000C00000052004F00
      57004E0055004D00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 40
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 4000
    end
    object OracleDataSet1HOLIDAY_DATE: TDateTimeField
      FieldName = 'HOLIDAY_DATE'
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select '
      'to_date(01||'#39'-'#39'||'#39'JAN'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) JAN,'
      'to_date(01||'#39'-'#39'||'#39'FEB'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) FEB,'
      'to_date(01||'#39'-'#39'||'#39'MAR'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) MAR,'
      'to_date(01||'#39'-'#39'||'#39'APR'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) APR,'
      'to_date(01||'#39'-'#39'||'#39'MAY'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) MAY,'
      'to_date(01||'#39'-'#39'||'#39'JUN'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) JUN,'
      'to_date(01||'#39'-'#39'||'#39'JUL'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) JUL,'
      'to_date(01||'#39'-'#39'||'#39'AUG'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) AUG,'
      'to_date(01||'#39'-'#39'||'#39'SEP'#39'||'#39'-'#39'||to_char(sysdate,'#39'yyyy'#39')) SEP,'
      'to_date(01||'#39'-'#39'||'#39'OCT'#39'||'#39'-'#39'||to_char(sysdate,'#39'YYYY'#39')) OCT,'
      'to_date(01||'#39'-'#39'||'#39'NOV'#39'||'#39'-'#39'||to_char(sysdate,'#39'YYYY'#39')) NOV,'
      'to_date(01||'#39'-'#39'||'#39'DEC'#39'||'#39'-'#39'||to_char(sysdate,'#39'YYYY'#39')) DEC'
      ''
      ''
      'from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000C000000060000004A0041004E000100000000000600000046004500
      4200010000000000060000004D00410052000100000000000600000041005000
      5200010000000000060000004D0041005900010000000000060000004A005500
      4E00010000000000060000004A0055004C000100000000000600000041005500
      470001000000000006000000530045005000010000000000060000004F004300
      5400010000000000060000004E004F0056000100000000000600000044004500
      4300010000000000}
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 40
    object OracleDataSet2JAN: TDateTimeField
      FieldName = 'JAN'
    end
    object OracleDataSet2FEB: TDateTimeField
      FieldName = 'FEB'
    end
    object OracleDataSet2MAR: TDateTimeField
      FieldName = 'MAR'
    end
    object OracleDataSet2APR: TDateTimeField
      FieldName = 'APR'
    end
    object OracleDataSet2MAY: TDateTimeField
      FieldName = 'MAY'
    end
    object OracleDataSet2JUN: TDateTimeField
      FieldName = 'JUN'
    end
    object OracleDataSet2JUL: TDateTimeField
      FieldName = 'JUL'
    end
    object OracleDataSet2AUG: TDateTimeField
      FieldName = 'AUG'
    end
    object OracleDataSet2SEP: TDateTimeField
      FieldName = 'SEP'
    end
    object OracleDataSet2OCT: TDateTimeField
      FieldName = 'OCT'
    end
    object OracleDataSet2NOV: TDateTimeField
      FieldName = 'NOV'
    end
    object OracleDataSet2DEC: TDateTimeField
      FieldName = 'DEC'
    end
  end
  object OraclePackage1: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'PG_CALENDAR'
    Left = 112
    Top = 112
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      
        'select  rowid, a.* from calendar_standart a order by holiday_dat' +
        'e')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000001800000048004F004C0049004400410059005F0044004100
      5400450001000000000016000000440045005300430052004900500054004900
      4F004E000100000000000400000049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 176
    Top = 224
    object OracleDataSet3ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet3HOLIDAY_DATE: TDateTimeField
      FieldName = 'HOLIDAY_DATE'
    end
    object OracleDataSet3DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 600
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet3
    Left = 80
    Top = 224
  end
end

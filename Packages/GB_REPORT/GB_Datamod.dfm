object DataMod_GBReport: TDataMod_GBReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object OP_GB_Report: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'P_GB_REPORT'
    Left = 40
    Top = 8
  end
  object OracleDataSet_GB: TOracleDataSet
    SQL.Strings = (
      'select id_, name_, kredit_, debet_sum from'
      '('
      
        'select c.id id_, c.name name_, pr.kredit kredit_, sum(pr.LAMMOUN' +
        'T) Debet_sum'
      'from customers c, account a, provarch pr'
      'where (pr.dat between :BDATE and :EDATE)'
      '      and pr.lammount<>0'
      '      and pr.debt=a.id'
      '      '
      
        '      and pr.kredit=(select id from account where bal_cn1 in 105' +
        '2)'
      '      '
      '      and a.kli_id=c.id'
      'group by c.id, c.name, pr.kredit'
      'order by Debet_Sum'
      ')'
      'where debet_sum>30')
    Optimize = False
    Variables.Data = {
      0400000002000000100000003A0042004500470044004100540045000C000000
      0000000000000000100000003A0045004E00440044004100540045000C000000
      0000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 16
  end
  object DataSource_GB: TDataSource
    DataSet = OracleDataSet_GB
    Left = 240
    Top = 16
  end
  object OracleDataSet_DATE: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 88
  end
  object OracleDataSet_unicode: TOracleDataSet
    SQL.Strings = (
      'select * from report_unicode')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 176
  end
  object OracleDataSet_Setting: TOracleDataSet
    SQL.Strings = (
      'select c.rowid,c.* from REPORT_SETTING c')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 248
  end
  object OracleDataSet_SQL: TOracleDataSet
    SQL.Strings = (
      'select s.rowid, s.*  from REPORT_SQL s'
      ' ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      450001000000000006000000530051004C00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 312
  end
  object OracleDataSet_VID_OP: TOracleDataSet
    SQL.Strings = (
      'select * from vid_op')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 368
    Top = 376
  end
  object DataSourceVid_OP: TDataSource
    DataSet = OracleDataSet_VID_OP
    Left = 256
    Top = 358
  end
  object DataSource_SQL: TDataSource
    DataSet = OracleDataSet_SQL
    Left = 256
    Top = 296
  end
end

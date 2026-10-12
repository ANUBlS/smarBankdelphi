object MasterBook: TMasterBook
  Left = 144
  Top = 112
  Width = 696
  Height = 480
  Caption = 'MasterBook'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 321
    Caption = #1065#1077#1089#1072#1073#1072#1090#1099' '#1072#1083#1084#1072#1075' '#1094#1095#1094#1085' '#1074#1077#1088#1080#1083#1103#1085#1083#1103#1088#1080' '#1076#1072#1093#1080#1083' '#1077#1076#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ProgressBar: TGauge
      Left = 8
      Top = 296
      Width = 289
      Height = 20
      Progress = 0
    end
    object BitExport: TBitBtn
      Left = 8
      Top = 248
      Width = 289
      Height = 41
      Caption = 'Export Excel'
      DoubleBuffered = True
      Glyph.Data = {
        76020000424D7602000000000000760000002800000020000000200000000100
        0400000000000002000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7272727272727272727272FFFFFFFFFF27
        27272727272727272727FFFFFFFFFF72FFFFFFFFFFFFFFFFFF72FFFFFFFFFF27
        FFFFFFFFFFFFFFFFFF27FFFFFFFFFF72FFFFFFFFFFFFFFFFFF72FFFFFFFFFF27
        FFFFFFFFFFF727272F27FFF0FFFFFF72F2727272727F72727F72FFF00FFFFF27
        F727272727F72727FF27FFF000FFFF72FF7272727F72727FFF720000000FFF27
        FFF72727F7272727FF2700000000FF72FFFF727F72727272FF72000000000F27
        FFFFF7F72727FFFFFF2700000000FF72FFFF2F7272727FFFFF720000000FFF27
        FFF2F727272727FFFF27FFF000FFFF72FF2F72727272727FFF72FFF00FFFFF27
        F7F72727F7272727FF27FFF0FFFFFF72F272727FFF727272FF72FFFFFFFFFF27
        FFFFFFFFFFFFFFFFFF27FFFFFFFFFF72FFFFFFFFFFFFFFFFFF72FFFFFFFFFF27
        FFFFFFFFFFFFFFFFFF27FFFFFFFFFF7272727272727272727272FFFFFFFFFF27
        27272727272727272727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitExportClick
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 24
      Width = 289
      Height = 217
      Caption = #1058#1072#1088#1080#1093#1080' '#1089#1077#1095#1080#1085
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 82
        Height = 14
        Caption = #1044#1102#1074#1088#1094#1085' '#1103#1074#1074#1103#1083#1080
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 68
        Height = 14
        Caption = #1044#1102#1074#1088#1094#1085' '#1089#1086#1085#1091
      end
      object Label3: TLabel
        Left = 16
        Top = 168
        Width = 20
        Height = 14
        Caption = 'Filial'
      end
      object DTPMin: TDateTimePicker
        Left = 16
        Top = 40
        Width = 185
        Height = 21
        Date = 38261.688624629600000000
        Time = 38261.688624629600000000
        TabOrder = 0
      end
      object DTPMax: TDateTimePicker
        Left = 16
        Top = 80
        Width = 186
        Height = 21
        Date = 38383.688690810200000000
        Time = 38383.688690810200000000
        TabOrder = 1
      end
      object EdBalance: TEdit
        Left = 16
        Top = 144
        Width = 249
        Height = 22
        TabOrder = 2
      end
      object CeckBoxBal: TCheckBox
        Left = 16
        Top = 120
        Width = 160
        Height = 17
        Caption = #1046#1072#1088#1080' '#1073#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099' '#1094#1079#1088#1103
        TabOrder = 3
      end
      object CBBranch: TComboBox
        Left = 16
        Top = 184
        Width = 249
        Height = 22
        Style = csDropDownList
        TabOrder = 4
      end
    end
  end
  object ImageList1: TImageList
    Left = 464
    Top = 16
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      0000000000000000000000000000000000000000000000000000000000000000
      1F0000001F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F000000
      1F0000000000000000000000000000000000000000000000000000001F001F00
      0000FF7F00001F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F000000FF7F
      00001F00000000000000000000000000000000000000000000001F0000000000
      FF7F0000FF7F00001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F000000FF7FFF7F
      FF7F00001F000000000000000000000000000000000000001F0000000000FF7F
      FF7FFF7F0000FF7F00001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F000000FF7F
      FF7FFF7F00001F000000000000000000000000001F001F000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001F001F001F001F001F000000
      FF7FFF7FFF7F00001F0000000000000000001F0000000000FF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F00001F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010001F001F001F001F001F001F00
      0000FF7FFF7FFF7F00001F0000000000000000000000FF7FFF7FFF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F00001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F0010001F001F001F001F001F00
      1F000000FF7FFF7FFF7F00001F00000000000000FF7FFF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001F0010001F001F0000001F00
      1F001F000000FF7FFF7FFF7F00001F00000000000000FF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F0010001F001F001F00
      00001F001F000000FF7F00001F0000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F0010001F000000
      00001F001F001F00000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F0010001F00
      1F001F001F001F001F00000000000000000000000000000000000000FF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F001000
      1F001F001F001F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      10001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FDFFFE3F00000000
      F8FFF81F00000000F07FF40F00000000E03FE00700000000C01F800300000000
      800F400100000000000700000000000000030000000000008001800100000000
      C003C00300000000E00FE00F00000000F00FF07F00000000F81FF8FF00000000
      FC7FFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object KreditAccDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT   bal_cn_debt, bal_cn_kredit'
      
        '    FROM (SELECT   bal_cn_debt, bal_cn_kredit, prvch.lammount, p' +
        'rvch.dat,'
      '                   TO_CHAR (prvch.dat, '#39'MM'#39') month'
      '                   '
      
        '              FROM (SELECT bal_cn_debt, bal_cn_kredit, lammount,' +
        ' dat'
      
        '                      FROM (SELECT prvch.id, acc.bal_cn bal_cn_k' +
        'redit,'
      '                                   prvch.lammount, prvch.dat'
      '                              FROM provarch prvch,'
      '                                   (SELECT id, acc_no,'
      '                                              bal_cn1'
      '                                           '
      '                                           || tipacc bal_cn'
      '                                      FROM ACCOUNT :wh) acc'
      
        '                             WHERE acc.id = prvch.kredit) provar' +
        'ch_kredit,'
      
        '                           (SELECT prvch.id, acc.bal_cn bal_cn_d' +
        'ebt'
      '                              FROM provarch prvch,'
      '                                   (SELECT id, acc_no,'
      '                                              bal_cn1'
      '                                           '
      '                                           || tipacc bal_cn'
      '                                      FROM ACCOUNT :wh) acc'
      
        '                             WHERE acc.id = prvch.debt) provarch' +
        '_debt'
      
        '                     WHERE provarch_kredit.id = provarch_debt.id' +
        ') prvch'
      '             WHERE prvch.dat between :minDate and :maxDate'
      '          ORDER BY prvch.dat)'
      '         WHERE  bal_cn_debt = :bal_cn'
      'GROUP BY bal_cn_debt, bal_cn_kredit')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A004D0049004E0044004100540045000C000000
      0000000000000000100000003A004D004100580044004100540045000C000000
      00000000000000000E0000003A00420041004C005F0043004E00050000000000
      000000000000060000003A0057004800010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000200000016000000420041004C005F0043004E005F00440045004200
      54000100000000001A000000420041004C005F0043004E005F004B0052004500
      440049005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 16
    object KreditAccDataSetBAL_CN_DEBT: TWideStringField
      FieldName = 'BAL_CN_DEBT'
      Size = 480
    end
    object KreditAccDataSetBAL_CN_KREDIT: TWideStringField
      FieldName = 'BAL_CN_KREDIT'
      Size = 480
    end
  end
  object ObrDebtDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT   bal_cn_debt, bal_cn_kredit, MONTH, SUM (lammount) obr'
      
        '    FROM (SELECT   bal_cn_debt, bal_cn_kredit, prvch.lammount, p' +
        'rvch.dat,'
      '                   TO_CHAR (prvch.dat, '#39'MM'#39') MONTH'
      
        '              FROM (SELECT bal_cn_debt, bal_cn_kredit, lammount,' +
        ' dat'
      
        '                      FROM (SELECT prvch.id, acc.bal_cn bal_cn_k' +
        'redit,'
      '                                   prvch.lammount, prvch.dat'
      '                              FROM provarch prvch,'
      '                                   (SELECT id, acc_no,'
      '                                              bal_cn1'
      '                                           || tipacc bal_cn'
      '                                      FROM ACCOUNT :wh) acc'
      
        '                             WHERE acc.id = prvch.kredit) provar' +
        'ch_kredit,'
      
        '                           (SELECT prvch.id, acc.bal_cn bal_cn_d' +
        'ebt'
      '                              FROM provarch prvch,'
      '                                   (SELECT id, acc_no,'
      '                                              bal_cn1'
      '                                           || tipacc bal_cn'
      '                                      FROM ACCOUNT :wh) acc'
      
        '                             WHERE acc.id = prvch.debt) provarch' +
        '_debt'
      
        '                     WHERE provarch_kredit.id = provarch_debt.id' +
        ') prvch'
      '             WHERE prvch.dat BETWEEN :minDate AND :maxDate'
      '          ORDER BY prvch.dat)'
      '   where bal_cn_debt = :bal_cn     '
      'GROUP BY bal_cn_debt, bal_cn_kredit, MONTH')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A004D004100580044004100540045000C000000
      00000000000000000E0000003A00420041004C005F0043004E00050000000000
      000000000000100000003A004D0049004E0044004100540045000C0000000000
      000000000000060000003A0057004800010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000016000000420041004C005F0043004E005F00440045004200
      54000100000000001A000000420041004C005F0043004E005F004B0052004500
      4400490054000100000000000A0000004D004F004E0054004800010000000000
      060000004F0042005200010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 128
    object ObrDebtDataSetBAL_CN_DEBT: TWideStringField
      FieldName = 'BAL_CN_DEBT'
      Size = 360
    end
    object ObrDebtDataSetBAL_CN_KREDIT: TWideStringField
      FieldName = 'BAL_CN_KREDIT'
      Size = 360
    end
    object ObrDebtDataSetMONTH: TWideStringField
      FieldName = 'MONTH'
      Size = 2
    end
    object ObrDebtDataSetOBR: TFloatField
      FieldName = 'OBR'
    end
  end
  object DataSetSumDebt: TOracleDataSet
    SQL.Strings = (
      'SELECT   bal_debt, MONTH, SUM (lammount) obrdebt'
      
        '    FROM (SELECT   acc.bal_cn bal_debt, prvch.lammount, prvch.da' +
        't,'
      '                   TO_CHAR (prvch.dat, '#39'MM'#39') MONTH'
      '              FROM (SELECT id, acc_no,    bal_cn1'
      '                                       || tipacc bal_cn'
      '                      FROM ACCOUNT :wh) acc,'
      '                   provarch prvch'
      '             WHERE prvch.debt = acc.id'
      '               AND prvch.dat BETWEEN :minDate AND :maxDate'
      '          ORDER BY prvch.dat)'
      ' where  bal_debt = :bal_cn        '
      'GROUP BY bal_debt, MONTH')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A004D0049004E0044004100540045000C000000
      0000000000000000100000003A004D004100580044004100540045000C000000
      00000000000000000E0000003A00420041004C005F0043004E00050000000000
      000000000000060000003A0057004800010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000010000000420041004C005F00440045004200540001000000
      00000A0000004D004F004E00540048000100000000000E0000004F0042005200
      4400450042005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 72
    object DataSetSumDebtBAL_DEBT: TWideStringField
      FieldName = 'BAL_DEBT'
      Size = 360
    end
    object DataSetSumDebtMONTH: TWideStringField
      FieldName = 'MONTH'
      Size = 2
    end
    object DataSetSumDebtOBRDEBT: TFloatField
      FieldName = 'OBRDEBT'
    end
  end
  object DataSetSumKredit: TOracleDataSet
    SQL.Strings = (
      'SELECT   bal_kredit, MONTH, SUM (lammount) obrkredit'
      
        '    FROM (SELECT   acc.bal_cn bal_kredit, prvch.kredit, prvch.la' +
        'mmount,'
      '                   prvch.dat, TO_CHAR (prvch.dat, '#39'MM'#39') MONTH'
      '              FROM (SELECT id, acc_no,    bal_cn1'
      '                                     '
      '                                       || tipacc bal_cn'
      '                      FROM ACCOUNT :wh) acc,'
      '                   provarch prvch'
      '             WHERE prvch.kredit = acc.id'
      '               AND prvch.dat BETWEEN :minDate AND :maxDate'
      '          ORDER BY prvch.dat)'
      'where bal_kredit = :bal_cn           '
      'GROUP BY bal_kredit, MONTH')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A004D0049004E0044004100540045000C000000
      0000000000000000100000003A004D004100580044004100540045000C000000
      00000000000000000E0000003A00420041004C005F0043004E00050000000000
      000000000000060000003A0057004800010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000300000014000000420041004C005F004B0052004500440049005400
      0100000000000A0000004D004F004E0054004800010000000000120000004F00
      420052004B0052004500440049005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 184
    object DataSetSumKreditBAL_KREDIT: TWideStringField
      FieldName = 'BAL_KREDIT'
      Size = 360
    end
    object DataSetSumKreditMONTH: TWideStringField
      FieldName = 'MONTH'
      Size = 2
    end
    object DataSetSumKreditOBRKREDIT: TFloatField
      FieldName = 'OBRKREDIT'
    end
  end
  object DataSetSumSaldo: TOracleDataSet
    SQL.Strings = (
      
        'SELECT   bal_cn, MONTH, SUM (active) active, SUM (passiv) passiv' +
        'e'
      
        '    FROM (SELECT TO_CHAR (arch.datdate, '#39'MM'#39') MONTH, arch.datdat' +
        'e,'
      '                 sb_mtoutview.active ('
      '                    arch.pok_ostat,'
      '                    bal.typeid,'
      '                    bal.additionaltypeid'
      '                 ) active,'
      '                 sb_mtoutview.passiv ('
      '                    arch.pok_ostat,'
      '                    bal.typeid,'
      '                    bal.additionaltypeid'
      '                 ) passiv,'
      '                    bal_cn1'
      '                 || tipacc bal_cn'
      '            FROM archost arch,'
      '                 ACCOUNT acc,'
      '                 bal_spr1 bal,'
      '                 (SELECT   acc_id, MONTH, MAX (datdate) datdate'
      
        '                      FROM (SELECT acc_id, datdate, TO_CHAR (dat' +
        'date, '#39'MM'#39') MONTH'
      '                              FROM archost'
      
        '                             WHERE datdate BETWEEN :minDate AND ' +
        ':maxDate) '
      '                  GROUP BY acc_id, MONTH) dat'
      '           WHERE arch.datdate = dat.datdate'
      '             AND arch.acc_id = dat.acc_id'
      '             AND arch.acc_id = acc.id'
      '             AND bal.bal_cn = acc.bal_cn1'
      '             :fil'
      ' )'
      '   WHERE bal_cn = :bal_cn'
      'GROUP BY bal_cn, MONTH')
    Optimize = False
    Variables.Data = {
      0400000004000000100000003A004D0049004E0044004100540045000C000000
      0000000000000000100000003A004D004100580044004100540045000C000000
      00000000000000000E0000003A00420041004C005F0043004E00050000000000
      000000000000080000003A00460049004C00010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C000000420041004C005F0043004E000100000000000A00
      00004D004F004E00540048000100000000000C00000041004300540049005600
      45000100000000000E0000005000410053005300490056004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 536
    Top = 16
    object DataSetSumSaldoBAL_CN: TWideStringField
      FieldName = 'BAL_CN'
      Size = 360
    end
    object DataSetSumSaldoMONTH: TWideStringField
      FieldName = 'MONTH'
      Size = 2
    end
    object DataSetSumSaldoACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object DataSetSumSaldoPASSIVE: TFloatField
      FieldName = 'PASSIVE'
    end
  end
  object DataSetGetBalName: TOracleDataSet
    SQL.Strings = (
      'SELECT   bal.bal_cn, MAX (balname) balname,'
      
        '         sb_mtoutview.active (sal.pok_ostat, bal.typeid, bal.add' +
        'itionaltypeid) active,'
      
        '         sb_mtoutview.passiv (sal.pok_ostat, bal.typeid, bal.add' +
        'itionaltypeid) passiv'
      '    FROM (SELECT bal.balname,    acc.bal_cn1'
      '                              || acc.tipacc bal_cn, typeid,'
      '                 additionaltypeid'
      '            FROM bal_spr1 bal, ACCOUNT acc'
      '           WHERE acc.bal_cn1 = bal.bal_cn :fil) bal,'
      '         (SELECT   datdate, bal_cn, SUM (pok_ostat) pok_ostat'
      '              FROM (SELECT acc.id, arch.datdate, arch.pok_ostat,'
      '                              bal_cn1'
      '                           || tipacc bal_cn'
      
        '                      FROM archost arch, ACCOUNT acc, bal_spr1 b' +
        'al'
      '                     WHERE datdate = (SELECT MAX (datdate)'
      '                                        FROM archost'
      '                                       WHERE datdate < :minDat)'
      '                       AND arch.acc_id = acc.id'
      '                       AND bal.bal_cn = acc.bal_cn1 :fil)'
      '          GROUP BY datdate, bal_cn) sal'
      '   WHERE sal.bal_cn(+) = bal.bal_cn'
      
        'GROUP BY bal.bal_cn, sal.pok_ostat, bal.typeid, bal.additionalty' +
        'peid'
      'ORDER BY bal.bal_cn')
    Optimize = False
    Variables.Data = {
      04000000020000000E0000003A004D0049004E004400410054000C0000000000
      000000000000080000003A00460049004C00010000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000C000000420041004C005F0043004E000100000000000E00
      0000420041004C004E0041004D0045000100000000000C000000410043005400
      4900560045000100000000000C00000050004100530053004900560001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 64
    object DataSetGetBalNameBALNAME: TWideStringField
      FieldName = 'BALNAME'
      Size = 1600
    end
    object DataSetGetBalNameBAL_CN: TWideStringField
      FieldName = 'BAL_CN'
      Size = 360
    end
    object DataSetGetBalNameACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object DataSetGetBalNamePASSIV: TFloatField
      FieldName = 'PASSIV'
    end
  end
  object DataSetBranch: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    ID'
      '   ,Name'
      '   From  Filial')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 128
  end
end

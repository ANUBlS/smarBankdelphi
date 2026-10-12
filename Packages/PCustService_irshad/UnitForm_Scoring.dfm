object Form_Scoring: TForm_Scoring
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 292
    Width = 866
    Height = 41
    Align = alBottom
    BevelKind = bkFlat
    TabOrder = 0
    object XFButton1: TXFButton
      Left = 484
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 566
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 126
    Align = alTop
    BevelKind = bkFlat
    TabOrder = 1
    object XFLabel1: TXFLabel
      Left = 114
      Top = 50
      Width = 56
      Height = 13
      Caption = 'M'#252#351't'#601'ri riski'
    end
    object XFLabel2: TXFLabel
      Left = 114
      Top = 80
      Width = 54
      Height = 13
      Caption = 'M'#601'hsul riski'
    end
    object XFLabel3: TXFLabel
      Left = 426
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Corafi risk'
    end
    object XFLabel4: TXFLabel
      Left = 426
      Top = 50
      Width = 89
      Height = 13
      Caption = #199'atd'#305'r'#305'lma kanallar'#305
    end
    object XFLabel5: TXFLabel
      Left = 426
      Top = 80
      Width = 69
      Height = 13
      Caption = #399'm'#601'liyyat riski'
    end
    object XFLabel7: TXFLabel
      Left = 114
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Fin '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupComboboxEh_risk: TDBLookupComboboxEh
      Left = 178
      Top = 47
      Width = 195
      Height = 21
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_sc_risk
      TabOrder = 0
      Visible = True
    end
    object DBLookupComboboxEh_mehsul: TDBLookupComboboxEh
      Left = 178
      Top = 78
      Width = 195
      Height = 21
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_mehsul
      TabOrder = 1
      Visible = True
    end
    object DBLookupComboboxEh_corafi: TDBLookupComboboxEh
      Left = 521
      Top = 13
      Width = 195
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_corafi
      TabOrder = 2
      Visible = True
    end
    object DBLookupComboboxEh_catdirilma: TDBLookupComboboxEh
      Left = 521
      Top = 47
      Width = 195
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_catdirilma
      TabOrder = 3
      Visible = True
    end
    object DBLookupComboboxEh_emeliyyat: TDBLookupComboboxEh
      Left = 521
      Top = 78
      Width = 195
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_emeliyat
      TabOrder = 4
      Visible = True
    end
    object Edit_pin: TEdit
      Left = 210
      Top = 13
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 126
    Width = 866
    Height = 166
    Align = alClient
    BevelKind = bkFlat
    TabOrder = 2
    object XDBGrid1: TXDBGrid
      Left = 1
      Top = 1
      Width = 860
      Height = 160
      Align = alClient
      DataSource = DataSource6
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      Columns = <
        item
          Expanded = False
          FieldName = 'PINKOD'
          Title.Caption = 'Pinkod'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESULT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Caption = 'Risk s'#601'viyy'#601'si'
          Visible = True
          Width = 80
        end
        item
          Expanded = False
          FieldName = 'RISK_NAME'
          Title.Caption = 'M'#252#351't'#601'ri riski'
          Visible = True
          Width = 120
        end
        item
          Expanded = False
          FieldName = 'CORAFI_NAME'
          Title.Caption = 'Co'#287'afi risk'
          Visible = True
          Width = 140
        end
        item
          Expanded = False
          FieldName = 'MEHSUL_NAME'
          Title.Caption = 'M'#305'hsul riski'
          Visible = True
          Width = 132
        end
        item
          Expanded = False
          FieldName = 'CATDIRILMA_NAME'
          Title.Caption = #199'atd'#305'r'#305'lma kanallar'#305
          Visible = True
          Width = 120
        end
        item
          Expanded = False
          FieldName = 'EMELIYYAT_NAME'
          Title.Caption = #399'm'#601'lliyat riski'
          Visible = True
          Width = 136
        end>
    end
  end
  object ods_sc_risk: TOracleDataSet
    SQL.Strings = (
      'select*from cust_scoring_risk')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000006000000420041004C00
      010000000000080000004E0041004D0045000100000000000800000052004900
      53004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 151
  end
  object ods_corafi: TOracleDataSet
    SQL.Strings = (
      'select*from cust_cografi_risk')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000006000000420041004C00
      010000000000080000004E0041004D0045000100000000000800000052004900
      53004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 150
  end
  object ods_mehsul: TOracleDataSet
    SQL.Strings = (
      'select*from cust_mehsul_risk')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000006000000420041004C00
      010000000000080000004E0041004D0045000100000000000800000052004900
      53004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 151
  end
  object ods_catdirilma: TOracleDataSet
    SQL.Strings = (
      'select*from cust_catdir_kanal')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000006000000420041004C00
      010000000000080000004E0041004D0045000100000000000800000052004900
      53004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 360
    Top = 151
  end
  object ods_emeliyat: TOracleDataSet
    SQL.Strings = (
      'select*from cust_emeliyat_risk')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000004000000040000004900440001000000000006000000420041004C00
      010000000000080000004E0041004D0045000100000000000800000052004900
      53004B00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 464
    Top = 151
  end
  object OracleDataSet6: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '    c.pinkod,'
      '    c.result,'
      '    c.risk,'
      '    r.name  AS risk_name,'
      '    g.name  AS corafi_name,'
      '    m.name  AS mehsul_name,'
      '    k.name  AS catdirilma_name,'
      '    e.name  AS emeliyyat_name'
      'FROM cust_scoring_chek c'
      ''
      'LEFT JOIN cust_scoring_risk r   ON r.id = TO_CHAR(c.risk)'
      'LEFT JOIN cust_cografi_risk g   ON g.id = c.corafi'
      'LEFT JOIN cust_mehsul_risk m    ON m.id = c.mehsul'
      'LEFT JOIN cust_catdir_kanal k   ON k.id = c.catdirilma'
      'LEFT JOIN cust_emeliyat_risk e  ON e.id = c.emeliiyat'
      'WHERE c.pinkod = :v_pin'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0056005F00500049004E000500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000080000000C000000500049004E004B004F0044000100000000000C00
      000052004500530055004C005400010000000000080000005200490053004B00
      010000000000120000005200490053004B005F004E0041004D00450001000000
      00001600000043004F0052004100460049005F004E0041004D00450001000000
      0000160000004D0045004800530055004C005F004E0041004D00450001000000
      00001E00000043004100540044004900520049004C004D0041005F004E004100
      4D0045000100000000001C00000045004D0045004C0049005900590041005400
      5F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 560
    Top = 151
    object OracleDataSet6PINKOD: TWideStringField
      FieldName = 'PINKOD'
      Size = 12
    end
    object OracleDataSet6RESULT: TWideStringField
      FieldName = 'RESULT'
      Size = 15
    end
    object OracleDataSet6RISK: TFloatField
      FieldName = 'RISK'
    end
    object OracleDataSet6RISK_NAME: TWideStringField
      FieldName = 'RISK_NAME'
      Size = 100
    end
    object OracleDataSet6CORAFI_NAME: TWideStringField
      FieldName = 'CORAFI_NAME'
      Size = 100
    end
    object OracleDataSet6MEHSUL_NAME: TWideStringField
      FieldName = 'MEHSUL_NAME'
      Size = 100
    end
    object OracleDataSet6CATDIRILMA_NAME: TWideStringField
      FieldName = 'CATDIRILMA_NAME'
      Size = 100
    end
    object OracleDataSet6EMELIYYAT_NAME: TWideStringField
      FieldName = 'EMELIYYAT_NAME'
      Size = 100
    end
  end
  object dsrc_sc_risk: TDataSource
    DataSet = ods_sc_risk
    Left = 72
    Top = 223
  end
  object dsrc_corafi: TDataSource
    DataSet = ods_corafi
    Left = 152
    Top = 223
  end
  object dsrc_mehsul: TDataSource
    DataSet = ods_mehsul
    Left = 248
    Top = 223
  end
  object dsrc_catdirilma: TDataSource
    DataSet = ods_catdirilma
    Left = 360
    Top = 223
  end
  object dsrc_emeliyat: TDataSource
    DataSet = ods_emeliyat
    Left = 464
    Top = 223
  end
  object DataSource6: TDataSource
    DataSet = OracleDataSet6
    Left = 560
    Top = 223
  end
end

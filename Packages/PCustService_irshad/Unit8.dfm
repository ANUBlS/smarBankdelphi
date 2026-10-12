object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 146
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 105
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 33
    ExplicitWidth = 270
    ExplicitHeight = 299
    object XFLabel1: TXFLabel
      Left = 13
      Top = 44
      Width = 48
      Height = 13
      Caption = 'Ba'#351'lan'#287#305'c:'
    end
    object XFLabel2: TXFLabel
      Left = 13
      Top = 72
      Width = 22
      Height = 13
      Caption = 'Son:'
    end
    object XFLabel3: TXFLabel
      Left = 13
      Top = 15
      Width = 31
      Height = 13
      Caption = #350'irk'#601't:'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 71
      Top = 43
      Width = 186
      Height = 21
      Date = 43641.476735543980000000
      Time = 43641.476735543980000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 71
      Top = 70
      Width = 186
      Height = 21
      Date = 43641.476735543980000000
      Time = 43641.476735543980000000
      TabOrder = 1
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 71
      Top = 15
      Width = 186
      Height = 21
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dsrc_buspros
      TabOrder = 2
      Visible = True
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 105
    Width = 265
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 1
    ExplicitTop = 110
    ExplicitWidth = 270
    object XFButton1: TXFButton
      Left = 92
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
      Left = 173
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object sb_sysdate: TOracleDataSet
    SQL.Strings = (
      'select tek_dat from sysdat')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000010000000E000000540045004B005F00440041005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 8
    Top = 88
    object sb_sysdateTEK_DAT: TDateTimeField
      FieldName = 'TEK_DAT'
    end
  end
  object ods_tonaj: TOracleDataSet
    SQL.Strings = (
      
        'select i.par6,i.trans_date,i.par11 from sb_business_processes b,' +
        'invoices i where LOWER(i.par6) =LOWER(b.name) '
      'and i.trans_date  between :begindat and :enddat'
      'and i.par6=:v_name')
    Optimize = False
    Variables.Data = {
      04000000030000000E0000003A0056005F004E0041004D004500050000000000
      000000000000120000003A0042004500470049004E004400410054000C000000
      00000000000000000E0000003A0045004E0044004400410054000C0000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000080000005000410052003600010000000000140000005400
      520041004E0053005F0044004100540045000100000000000A00000050004100
      520031003100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 104
    object ods_tonajPAR6: TWideStringField
      DisplayLabel = #350'irk'#601't'
      FieldName = 'PAR6'
      Size = 300
    end
    object ods_tonajTRANS_DATE: TDateTimeField
      DisplayLabel = 'Tarix'
      FieldName = 'TRANS_DATE'
    end
    object ods_tonajPAR11: TFloatField
      DisplayLabel = 'Tonaj'
      FieldName = 'PAR11'
    end
  end
  object ods_buspros: TOracleDataSet
    SQL.Strings = (
      'select id, name from sb_business_processes'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000080000004E0041004D004500010000000000040000004900
      4400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 240
    Top = 80
    object ods_busprosID: TFloatField
      FieldName = 'ID'
    end
    object ods_busprosNAME: TWideStringField
      FieldName = 'NAME'
      Size = 150
    end
  end
  object dsrc_buspros: TDataSource
    DataSet = ods_buspros
    Left = 224
    Top = 40
  end
  object CMExcelExport1: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 48
    Top = 40
  end
end

object FrmTransactions: TFrmTransactions
  Left = 233
  Top = 146
  Width = 754
  Height = 444
  Caption = 'Main Facilities Transactions'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 44
    Width = 746
    Height = 373
    Align = alClient
    TabOrder = 0
    object TransactionViewer: TDBGrid
      Left = 1
      Top = 1
      Width = 744
      Height = 345
      Align = alClient
      Color = clBtnFace
      DataSource = DSTransactions
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Formatteddate'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Caption = 'Тарих'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'DACCOUNT'
          Title.Caption = 'Дебит'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'DEBITCURRENCY'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'CACCOUNT'
          Title.Caption = 'Кредит'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clSilver
          Expanded = False
          FieldName = 'CREDITCURRENCY'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Caption = 'Мябляь(Д)'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT_C'
          Title.Caption = 'Мябляь(К)'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 89
          Visible = True
        end
        item
          Color = clBtnShadow
          Expanded = False
          FieldName = 'LAMMOUNT'
          Title.Caption = 'Мябляь'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 122
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 346
      Width = 744
      Height = 26
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = '  Ямялиййатын тяйинаты:'
      TabOrder = 1
      object AssignmentsEdit: TDBEdit
        Left = 104
        Top = 2
        Width = 640
        Height = 21
        Color = clSilver
        DataField = 'NAME'
        DataSource = DSTransactions
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 44
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 493
      Top = 3
      Width = 71
      Height = 39
      Caption = '     Гябул       '
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000077777000000077777000000077770F0F0F0F0777700000007777
        0F0F0F0F07777000000077770F0F0F0F07777000000077770F0F0F0F07777000
        000077770F0F0F0F07777000000077770F0F0F0F07777000000077770F0F0F0F
        07777000000077770F0F0F0F07777000000077770F0F0F0F0777700000007777
        0F0F0F0F0777700000007770000000000077700000007770FFFFFFFFF0777000
        0000777700000000077770000000777777700077777770000000777777777777
        777770000000}
      Layout = blGlyphTop
      OnClick = SpeedButton1Click
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 163
      Height = 42
      Align = alLeft
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 1
        Top = 1
        Width = 161
        Height = 17
        Align = alTop
        Caption = 'Башланьыж тарих'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object DTPBeginDate: TDateTimePicker
        Left = 141
        Top = 20
        Width = 20
        Height = 21
        CalAlignment = dtaLeft
        Date = 37747.5497829861
        Time = 37747.5497829861
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DTPBeginDateChange
      end
      object EBeginDate: TEdit
        Left = 2
        Top = 20
        Width = 137
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 164
      Top = 1
      Width = 163
      Height = 42
      Align = alLeft
      TabOrder = 1
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 161
        Height = 17
        Align = alTop
        Caption = 'Сон тарих'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object DTPEndDate: TDateTimePicker
        Left = 141
        Top = 20
        Width = 20
        Height = 21
        CalAlignment = dtaLeft
        Date = 37747.5501812384
        Time = 37747.5501812384
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DTPEndDateChange
      end
      object ELastDate: TEdit
        Left = 2
        Top = 20
        Width = 137
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
    object Panel6: TPanel
      Left = 327
      Top = 1
      Width = 163
      Height = 42
      Align = alLeft
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 1
        Top = 1
        Width = 161
        Height = 17
        Align = alTop
        Caption = 'Груп филтери'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object CBGroupFilter: TComboBox
        Left = 1
        Top = 20
        Width = 161
        Height = 19
        Style = csOwnerDrawFixed
        Color = clInfoBk
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBGroupFilterChange
        OnDrawItem = CBGroupFilterDrawItem
      end
    end
  end
  object ODSTransactions: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_Main_Facilities.OpenCursor(:ACursor,:AStrParam);'
      'end;'
      ''
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000002000000080000003A41435552534F52740000000000000000000000
      0A0000003A41535452504152414D050000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    OnCalcFields = ODSTransactionsCalcFields
    Left = 536
    Top = 160
    object ODSTransactionsDACCOUNT: TStringField
      FieldName = 'DACCOUNT'
    end
    object ODSTransactionsDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 10
    end
    object ODSTransactionsCACCOUNT: TStringField
      FieldName = 'CACCOUNT'
    end
    object ODSTransactionsCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 10
    end
    object ODSTransactionsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSTransactionsOP_ID: TFloatField
      FieldName = 'OP_ID'
    end
    object ODSTransactionsNO_PROV: TStringField
      FieldName = 'NO_PROV'
      Size = 8
    end
    object ODSTransactionsDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ODSTransactionsDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object ODSTransactionsKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object ODSTransactionsVAL_ACC: TFloatField
      FieldName = 'VAL_ACC'
    end
    object ODSTransactionsVID_OP: TIntegerField
      FieldName = 'VID_OP'
    end
    object ODSTransactionsAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      DisplayFormat = '#,##.00'
    end
    object ODSTransactionsLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      DisplayFormat = '#,##.00'
    end
    object ODSTransactionsKASSA_B: TIntegerField
      FieldName = 'KASSA_B'
    end
    object ODSTransactionsKASSA_Z: TIntegerField
      FieldName = 'KASSA_Z'
    end
    object ODSTransactionsNO_FILIAL: TIntegerField
      FieldName = 'NO_FILIAL'
    end
    object ODSTransactionsRATE_D: TFloatField
      FieldName = 'RATE_D'
    end
    object ODSTransactionsRATE_C: TFloatField
      FieldName = 'RATE_C'
    end
    object ODSTransactionsCURRENCYID_C: TIntegerField
      FieldName = 'CURRENCYID_C'
    end
    object ODSTransactionsAMMOUNT_C: TFloatField
      FieldName = 'AMMOUNT_C'
      DisplayFormat = '#,##.00'
    end
    object ODSTransactionsNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ODSTransactionsFormatteddate: TStringField
      FieldKind = fkCalculated
      FieldName = 'Formatteddate'
      Calculated = True
    end
  end
  object DSTransactions: TDataSource
    DataSet = ODSTransactions
    Left = 576
    Top = 160
  end
  object ImageList: TImageList
    Left = 240
    Top = 88
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C0008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000808080008080
      8000C0C0C000C0C0C000C0C0C000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000808080008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F9FF000000000000
      F07F000000000000E01F000000000000C0070000000000008001000000000000
      000100000000000000010000000000008001000000000000E001000000000000
      F803000000000000FE07000000000000FF8F000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object OPTransactions: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'SB_MAIN_FACILITIES'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 576
    Top = 208
  end
  object ODSMainGroups: TOracleDataSet
    SQL.Strings = (
      'Select'
      '   *'
      'From'
      '   Groups'
      'Order By  ID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 536
    Top = 208
    object ODSMainGroupsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object ODSMainGroupsNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
    object ODSMainGroupsAMORT: TFloatField
      FieldName = 'AMORT'
    end
    object ODSMainGroupsMAIN_ACCOUNT: TFloatField
      FieldName = 'MAIN_ACCOUNT'
    end
    object ODSMainGroupsEXP_ACCOUNT: TFloatField
      FieldName = 'EXP_ACCOUNT'
    end
    object ODSMainGroupsAMORT_ACCOUNT: TFloatField
      FieldName = 'AMORT_ACCOUNT'
    end
    object ODSMainGroupsSALE_ACCOUNT: TFloatField
      FieldName = 'SALE_ACCOUNT'
    end
    object ODSMainGroupsTAXAMORT: TFloatField
      FieldName = 'TAXAMORT'
    end
  end
end

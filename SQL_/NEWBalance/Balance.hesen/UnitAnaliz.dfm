object FrmAnaliz: TFrmAnaliz
  Left = 232
  Top = 134
  Width = 694
  Height = 561
  Caption = 'Analiz'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 686
    Height = 534
    Align = alClient
    Caption = 'Balansûí Analizi'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 2
      Top = 376
      Width = 682
      Height = 2
      Cursor = crVSplit
      Align = alBottom
      Color = clBlack
      ParentColor = False
    end
    object Splitter2: TSplitter
      Left = 2
      Top = 228
      Width = 682
      Height = 2
      Cursor = crVSplit
      Align = alBottom
      Color = clBlack
      ParentColor = False
    end
    object DBGridBalance: TDBGrid
      Left = 2
      Top = 48
      Width = 682
      Height = 153
      Align = alClient
      Color = clScrollBar
      DataSource = DataSrcBalance
      FixedColor = clScrollBar
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = ExportPopupMenu
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'BAL_CN'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Width = 67
          Visible = True
        end
        item
          Color = clInactiveBorder
          Expanded = False
          FieldName = 'FIRSTACTIVE'
          Title.Alignment = taCenter
          Width = 97
          Visible = True
        end
        item
          Color = clInactiveBorder
          Expanded = False
          FieldName = 'FIRSTPASSIVE'
          Title.Alignment = taCenter
          Width = 98
          Visible = True
        end
        item
          Color = clActiveBorder
          Expanded = False
          FieldName = 'DTURNOVER'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Width = 96
          Visible = True
        end
        item
          Color = clActiveBorder
          Expanded = False
          FieldName = 'KTURNOVER'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Width = 101
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'LASTACTIVE'
          Title.Alignment = taCenter
          Width = 97
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'LASTPASSIVE'
          Title.Alignment = taCenter
          Width = 102
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 682
      Height = 33
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 362
        Top = 7
        Width = 73
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Äþâðöí ñîíó:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 153
        Top = 8
        Width = 88
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Äþâðöí ÿââÿëè:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 598
        Top = 4
        Width = 75
        Height = 25
        Caption = '&×ûõûø'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Kind = bkClose
      end
      object DBNavigator: TDBNavigator
        Left = 6
        Top = 3
        Width = 136
        Height = 27
        DataSource = DataSrcBalance
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 264
        Top = 8
        Width = 58
        Height = 17
        Caption = 'StaticText1'
        TabOrder = 2
      end
      object StaticText2: TStaticText
        Left = 456
        Top = 8
        Width = 58
        Height = 17
        Caption = 'StaticText2'
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 201
      Width = 682
      Height = 27
      Align = alBottom
      TabOrder = 2
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 29
        Height = 13
        Caption = 'Æÿìè :'
      end
      object DBEdit2: TDBEdit
        Left = 80
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(FA)'
        DataSource = DataSrcSum
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 179
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(FP)'
        DataSource = DataSrcSum
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 279
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(D)'
        DataSource = DataSrcSum
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 378
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(K)'
        DataSource = DataSrcSum
        TabOrder = 3
      end
      object DBEdit11: TDBEdit
        Left = 478
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(LA)'
        DataSource = DataSrcSum
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 578
        Top = 2
        Width = 100
        Height = 21
        Color = clActiveBorder
        DataField = 'SUM(LP)'
        DataSource = DataSrcSum
        TabOrder = 5
      end
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 230
      Width = 682
      Height = 146
      Align = alBottom
      Color = clScrollBar
      DataSource = DataSrcAcc
      TabOrder = 3
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'ACCOUNTANT'
          Title.Alignment = taCenter
          Title.Caption = 'Hesab.N.'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'Àäû'
          Width = 170
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'SUM(CURRDATE.FACTIVE)'
          Title.Alignment = taCenter
          Title.Caption = 'I.Q. Aktiv'
          Width = 90
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'SUM(CURRDATE.FPASSIVE)'
          Title.Alignment = taCenter
          Title.Caption = 'I.Q. Passiv'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM(DTURN)'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dþâ.Äåáåò'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUM(KTURN)'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dþâ.Êðåäèò'
          Width = 88
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'SUM(CURRDATE.LACTIVE)'
          Title.Alignment = taCenter
          Title.Caption = 'S.Q. Aktiv'
          Width = 99
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'SUM(CURRDATE.LPASSIVE)'
          Title.Alignment = taCenter
          Title.Caption = 'S.Q. Passiv'
          Width = 100
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 378
      Width = 682
      Height = 123
      Align = alBottom
      Color = clScrollBar
      DataSource = DataSrcTurnOver
      TabOrder = 4
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clMenu
          Expanded = False
          FieldName = 'DCURRENCY'
          Title.Alignment = taCenter
          Title.Caption = 'D.Val'
          Width = 31
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'DEBITOR'
          Title.Alignment = taCenter
          Title.Caption = 'Debåt'
          Width = 83
          Visible = True
        end
        item
          Color = clMenu
          Expanded = False
          FieldName = 'CCURRENCY'
          Title.Alignment = taCenter
          Title.Caption = 'K.Val'
          Width = 42
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'KREDITOR'
          Title.Alignment = taCenter
          Title.Caption = 'Kredit'
          Width = 90
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Alignment = taCenter
          Title.Caption = 'Ìÿáëÿü'
          Width = 105
          Visible = True
        end
        item
          Color = cl3DLight
          Expanded = False
          FieldName = 'LAMMOUNT'
          Title.Alignment = taCenter
          Title.Caption = 'Ìÿáëÿü ìàí.'
          Width = 114
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'DAT'
          Title.Alignment = taCenter
          Title.Caption = 'ßìÿëèééàò Òàðèõè'
          Width = 184
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 501
      Width = 682
      Height = 31
      Align = alBottom
      TabOrder = 5
      object DBEdit1: TDBEdit
        Left = 4
        Top = 6
        Width = 673
        Height = 21
        DataField = 'NAME'
        DataSource = DataSrcTurnOver
        TabOrder = 0
      end
    end
  end
  object DataSrcAcc: TDataSource
    DataSet = ODSAcc
    Left = 16
    Top = 64
  end
  object ODSAcc: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_BALANCE.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);'
      'end;'
      ' '
      ' '
      ' '
      ' '
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A41435552534F52740000000000000000000000
      0B0000003A41535452504152414D31050000007F01000053656C656374205375
      6D2843757272446174652E46416374697665292C53756D284375727244617465
      2E4650617373697665292C53756D28445475726E292C53756D284B5475726E29
      2C53756D2843757272446174652E4C416374697665292C53756D284375727244
      6174652E4C50617373697665292C43757272446174652E4163636F756E74616E
      742C43757272446174652E4E616D652066726F6D282853656C6563742041632E
      4E616D65206173204E616D652C41632E4163635F4E6F204163636F756E74616E
      742C53425F42414C414E43452E53616C646F546F4163746976652841722E504F
      4B5F4F535441542C312C313035322920464163746976652C53425F42414C414E
      43452E53616C646F546F506173736976652841722E504F4B5F4F535441542C31
      2C31303532292046506173736976652C3020445475726E2C30204B5475726E2C
      30204C4163746976652C30204C5061737369766520202046726F6D2020416363
      6F756E742041632C417263686F737420417220202000000000000B0000003A41
      535452504152414D32050000008C020000205768657265202861632E69643D61
      722E6163635F696429416E642842414C5F434E313D3130353229416E64284172
      2E446174446174653D2732372D4A414E2D3033272929556E696F6E202853656C
      6563742041632E4E616D65206173204E616D652C41632E4163635F4E6F204163
      636F756E74616E742C302020464163746976652C302046506173736976652C30
      20445475726E2C30204B5475726E2C53425F42414C414E43452E53616C646F54
      6F4163746976652841722E504F4B5F4F535441542C312C3130353229204C4163
      746976652C53425F42414C414E43452E53616C646F546F506173736976652841
      722E504F4B5F4F535441542C312C3130353229204C5061737369766520202046
      726F6D20204163636F756E742041632C417263686F7374204172202020205768
      657265202861632E69643D61722E6163635F696429416E642842414C5F434E31
      3D3130353229416E642841722E446174446174653D2732382D4A414E2D303327
      2929556E696F6E2853656C6563742041632E4E616D65206173204E616D652C41
      632E4163635F4E6F204163636F756E74616E742C3020464163746976652C3020
      46506173736976652C41722E504F4B5F4F42525F442C41722E504F4B5F4F4252
      5F4B2C30204C4163746976652C30204C506173736976650946726F6D20204163
      636F756E742041632C417263686F737420417220095768657265202861632E69
      643D61722E6163635F696429416E642842414C5F434E313D3130353229416E64
      2841722E446174446174653E3D2732382D4A414E2D30332729416E642841722E
      446174446174653C3D2732382D4A414E2D303327292929202043757272446174
      652047726F757020427920204163636F756E74616E742C4E616D652000000000
      00}
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
    AfterScroll = ODSAccAfterScroll
    Left = 48
    Top = 64
    object ODSAccSUMCURRDATEFACTIVE: TFloatField
      FieldName = 'SUM(CURRDATE.FACTIVE)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccSUMCURRDATEFPASSIVE: TFloatField
      FieldName = 'SUM(CURRDATE.FPASSIVE)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccSUMDTURN: TFloatField
      FieldName = 'SUM(DTURN)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccSUMKTURN: TFloatField
      FieldName = 'SUM(KTURN)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccSUMCURRDATELACTIVE: TFloatField
      FieldName = 'SUM(CURRDATE.LACTIVE)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccSUMCURRDATELPASSIVE: TFloatField
      FieldName = 'SUM(CURRDATE.LPASSIVE)'
      DisplayFormat = '#,##0.00'
    end
    object ODSAccACCOUNTANT: TStringField
      FieldName = 'ACCOUNTANT'
    end
    object ODSAccNAME: TStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object DataSrcTurnOver: TDataSource
    DataSet = ODSTurnOver
    Left = 16
    Top = 96
  end
  object ODSTurnOver: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_BALANCE.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A41435552534F52740000000000000000000000
      0B0000003A41535452504152414D3105000000CF00000053656C656374204163
      312E4163635F4E6F2044656269746F722C4163322E4163635F6E6F204B726564
      69746F722C50722E56616C5F416363204443757272656E63792C50722E437572
      72656E637949445F4320204343757272656E6379202C50722E416D6D6F756E74
      2C50722E4C416D6D6F756E742C50722E4461742C50522E4E616D652020202020
      46726F6D2050726F7661726368205072202C4163636F756E74204163312C4163
      636F756E74204163322020202057686572652020282850722E446562743D4163
      312E49642900000000000B0000003A41535452504152414D3205000000720000
      00616E642850722E4B72656469743D4163322E496429290909616E642850722E
      4461743E3D2732312D4A616E2D323030332729616E642850722E4461743C3D27
      32312D4A616E2D323030332729416E6428284163312E4163635F6E6F3D333229
      4F72284163322E4163635F4E6F3D333229290000000000}
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
    Left = 48
    Top = 96
    object ODSTurnOverDEBITOR: TStringField
      FieldName = 'DEBITOR'
    end
    object ODSTurnOverKREDITOR: TStringField
      FieldName = 'KREDITOR'
    end
    object ODSTurnOverDCURRENCY: TFloatField
      FieldName = 'DCURRENCY'
    end
    object ODSTurnOverCCURRENCY: TIntegerField
      FieldName = 'CCURRENCY'
    end
    object ODSTurnOverAMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
      currency = True
    end
    object ODSTurnOverLAMMOUNT: TFloatField
      FieldName = 'LAMMOUNT'
      currency = True
    end
    object ODSTurnOverDAT: TDateTimeField
      FieldName = 'DAT'
    end
    object ODSTurnOverNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object ODSSum: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_BALANCE.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);'
      'end;')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A41435552534F52740000000000000000000000
      0B0000003A41535452504152414D310500000000000000000000000B0000003A
      41535452504152414D32050000000000000000000000}
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
    Left = 48
    Top = 152
    object ODSSumSUMFA: TFloatField
      FieldName = 'SUM(FA)'
      DisplayFormat = '#,##0.00'
    end
    object ODSSumSUMFP: TFloatField
      FieldName = 'SUM(FP)'
      DisplayFormat = '#,##0.00'
    end
    object ODSSumSUMLA: TFloatField
      FieldName = 'SUM(LA)'
      DisplayFormat = '#,##0.00'
    end
    object ODSSumSUMLP: TFloatField
      FieldName = 'SUM(LP)'
      DisplayFormat = '#,##0.00'
    end
    object ODSSumSUMD: TFloatField
      FieldName = 'SUM(D)'
      DisplayFormat = '#,##0.00'
    end
    object ODSSumSUMK: TFloatField
      FieldName = 'SUM(K)'
      DisplayFormat = '#,##0.00'
    end
  end
  object DataSrcSum: TDataSource
    DataSet = ODSSum
    Left = 16
    Top = 152
  end
  object DataSrcBalance: TDataSource
    DataSet = ODSBalance
    Left = 16
    Top = 184
  end
  object ODSBalance: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  SB_BALANCE.OpenCursor(:ACursor,:AStrParam1,:AStrParam2);'
      'end;'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000003000000080000003A41435552534F52740000000000000000000000
      0B0000003A41535452504152414D310500000000000000000000000B0000003A
      41535452504152414D32050000000000000000000000}
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
    AfterScroll = ODSBalanceAfterScroll
    Left = 48
    Top = 184
    object ODSBalanceFDATE: TStringField
      FieldName = 'FDATE'
      Size = 1
    end
    object ODSBalanceFIRSTACTIVE: TFloatField
      DisplayLabel = 'I.Q Aktiv'
      FieldName = 'FIRSTACTIVE'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceFIRSTPASSIVE: TFloatField
      DisplayLabel = 'I.Q. Passiv'
      FieldName = 'FIRSTPASSIVE'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceLDATE: TStringField
      FieldName = 'LDATE'
      Size = 1
    end
    object ODSBalanceLASTACTIVE: TFloatField
      DisplayLabel = 'S.Q. Activ'
      FieldName = 'LASTACTIVE'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceLASTPASSIVE: TFloatField
      DisplayLabel = 'S.Q. Passiv'
      FieldName = 'LASTPASSIVE'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceDTURNOVER: TFloatField
      DisplayLabel = 'Debet Uz. Dovr'
      FieldName = 'DTURNOVER'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceKTURNOVER: TFloatField
      DisplayLabel = 'Kredit Uz. Dovr'
      FieldName = 'KTURNOVER'
      DisplayFormat = '#,##0.00'
    end
    object ODSBalanceBAL_CN: TFloatField
      DisplayLabel = 'Bal. H'
      FieldName = 'BAL_CN'
      Required = True
    end
    object ODSBalanceBALNAME: TStringField
      FieldName = 'BALNAME'
      Size = 181
    end
  end
  object BalanceExporter: TExcelExporter
    ExportSource = DataSrcBalance
    ExportList.Strings = (
      'BAL_CN'
      'FIRSTACTIVE'
      'FIRSTPASSIVE'
      'DTURNOVER'
      'KTURNOVER'
      'LASTACTIVE'
      'LASTPASSIVE'
      'BALNAME')
    SheetName = 'Balance'
    ShowTitles = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    Left = 368
    Top = 104
  end
  object ExportPopupMenu: TPopupMenu
    Left = 216
    Top = 128
    object miExporttoExcel: TMenuItem
      Caption = 'Export to Excel'
      OnClick = miExporttoExcelClick
    end
  end
end

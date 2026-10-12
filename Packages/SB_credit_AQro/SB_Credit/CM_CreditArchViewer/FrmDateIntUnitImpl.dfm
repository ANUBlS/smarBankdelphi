object FrmDateInterval: TFrmDateInterval
  Left = 354
  Top = 334
  Width = 233
  Height = 137
  BorderIcons = [biSystemMenu]
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 21
    Width = 68
    Height = 13
    Caption = 'Башланьыж тарих'
  end
  object Label2: TLabel
    Left = 6
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Сон  тарих'
  end
  object BitBtn1: TBitBtn
    Left = 61
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Гябул'
    Default = True
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 146
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Имтина'
    TabOrder = 1
    Kind = bkCancel
  end
  object BeginDate: TDateTimePicker
    Left = 78
    Top = 18
    Width = 139
    Height = 21
    CalAlignment = dtaLeft
    Date = 39071.5798596644
    Time = 39071.5798596644
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object EndDate: TDateTimePicker
    Left = 78
    Top = 43
    Width = 139
    Height = 21
    CalAlignment = dtaLeft
    Date = 39071.5798596644
    Time = 39071.5798596644
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object NLSLDateInt: TNLSLocalizer
    Caption = 'Тарих аралыьы'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 9
    Top = 72
  end
  object CreditsDatSet: TOracleDataSet
    SQL.Strings = (
      'select '
      ' DATEOFCONCLUSION,'
      ' DUEDATEFIRSTCONTRACT'
      'from cm_active_credits'
      'where id = :CrdID ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000060000003A4352444944030000000000000000000000}
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
    Session = CMDataModule.CMSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 64
    object CreditsDatSetDATEOFCONCLUSION: TDateTimeField
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object CreditsDatSetDUEDATEFIRSTCONTRACT: TDateTimeField
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
  end
end

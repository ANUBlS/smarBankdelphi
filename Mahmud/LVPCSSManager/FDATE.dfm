object FORMDATE: TFORMDATE
  Left = 393
  Top = 102
  Width = 205
  Height = 153
  Caption = 'FORMDATE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 195
    Height = 118
    TabOrder = 0
    object DateTimePicker1: TDateTimePicker
      Left = 36
      Top = 12
      Width = 123
      Height = 21
      CalAlignment = dtaLeft
      Date = 40053.4238841782
      Time = 40053.4238841782
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 36
      Top = 48
      Width = 123
      Height = 21
      CalAlignment = dtaLeft
      Date = 40053.4239066088
      Time = 40053.4239066088
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 7
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Áÿכט'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
      Layout = blGlyphBottom
    end
    object BitBtn2: TBitBtn
      Left = 106
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Õויטנ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
      Layout = blGlyphBottom
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from sysdat')
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 40
  end
end

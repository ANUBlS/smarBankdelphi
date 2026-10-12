object Putyukova: TPutyukova
  Left = 0
  Top = 0
  Width = 718
  Height = 664
  Caption = 'Putyukova'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 664
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Button1: TButton
      Left = 136
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Hesabat1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 217
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Hesabat2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 714
      Height = 119
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      object GroupBox1: TGroupBox
        Left = 2
        Top = 2
        Width = 255
        Height = 115
        Align = alLeft
        Caption = 'Tarix Aral'#305#287#305#305
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 24
          Width = 86
          Height = 13
          Caption = 'Ba'#351'lan'#287#305'c tarix:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 27
          Top = 67
          Width = 54
          Height = 13
          Caption = 'Son tarix:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DateTimePicker1: TDateTimePicker
          Left = 102
          Top = 19
          Width = 150
          Height = 21
          Date = 44558.340297546300000000
          Time = 44558.340297546300000000
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 102
          Top = 62
          Width = 150
          Height = 21
          Date = 44558.340452557870000000
          Time = 44558.340452557870000000
          TabOrder = 1
        end
      end
    end
  end
  object BKT1: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  dtr =>:dtr'
      '  dtrn =>:dtrn'
      '  result =>:result'
      'end;')
    Optimize = False
    Variables.Data = {
      0400000003000000080000003A004400540052000C0000000000000000000000
      0A0000003A004400540052004E000C00000000000000000000000E0000003A00
      52004500530055004C005400740000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000E000000420041004C005F0043004E003100010000000000
      0C0000004100430043005F004E004F00010000000000080000004E0041004D00
      4500010000000000080000005200450053005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 36
    Top = 151
  end
  object BKT2: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  dtr =>:dtr'
      '  dtrn =>:dtrn'
      '  result =>:result'
      'end;')
    Optimize = False
    Variables.Data = {
      0400000003000000080000003A004400540052000C0000000000000000000000
      0A0000003A004400540052004E000C00000000000000000000000E0000003A00
      52004500530055004C005400740000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000A0000000A0000004600440041005400450001000000000016000000
      4600490052005300540041004300540049005600450001000000000018000000
      4600490052005300540050004100530053004900560045000100000000000A00
      00004C004400410054004500010000000000140000004C004100530054004100
      43005400490056004500010000000000160000004C0041005300540050004100
      530053004900560045000100000000001200000044005400550052004E004F00
      560045005200010000000000120000004B005400550052004E004F0056004500
      52000100000000000C000000420041004C005F0043004E000100000000000E00
      0000420041004C004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 151
  end
end

object AddHoliday: TAddHoliday
  Left = 431
  Top = 171
  Caption = 'AddHoliday'
  ClientHeight = 315
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 315
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 279
      Width = 547
      Height = 35
      Align = alBottom
      BorderStyle = bsSingle
      TabOrder = 0
      object DBNavigator2: TDBNavigator
        Left = 1
        Top = 1
        Width = 541
        Height = 29
        DataSource = CalendarDataMod.DataSource2
        Align = alClient
        TabOrder = 0
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 548
      Height = 232
      DataSource = CalendarDataMod.DataSource2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'HOLIDAY_DATE'
          Footers = <>
          Title.Caption = #1058#1072#1088#1080#1093
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = #1041#1072#1081#1088#1072#1084' '#1101#1094#1085#1094
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 416
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 238
      Width = 547
      Height = 41
      Align = alBottom
      BorderStyle = bsSingle
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 384
        Top = 0
        Width = 159
        Height = 35
        Caption = #1058#1103#1075#1074#1080#1084#1080' '#1076#1072#1093#1080#1083' '#1077#1090
        DoubleBuffered = True
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          66010000424D6601000000000000760000002800000016000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555005555555555555555555555005555555555555555555555005555
          5555544555555555550055555555422455555555550055555554222245555555
          5500555555422222245555555500555554222A2222455555550055555222A5A2
          22455555550055555A2A555A222455555500555555A55555A222455555005555
          555555555A222455550055555555555555A222455500555555555555555A2224
          55005555555555555555A222450055555555555555555A224500555555555555
          555555A225005555555555555555555A55005555555555555555555555005555
          55555555555555555500}
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
    end
  end
end

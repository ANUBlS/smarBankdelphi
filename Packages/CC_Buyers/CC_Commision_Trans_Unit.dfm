object CC_Country_ins: TCC_Country_ins
  Left = 874
  Top = 473
  BorderStyle = bsDialog
  Caption = #1070#1083#1082#1103#1083#1103#1088#1080#1085' '#1072#1076#1083#1072#1088#1099
  ClientHeight = 420
  ClientWidth = 179
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 179
    Height = 176
    Align = alTop
    DataSource = DataMod_Buyers.countrydata
    FixedColor = clActiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CNTR_NAME'
        Title.Caption = #1070#1083#1082#1103
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 141
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 179
    Height = 57
    Align = alTop
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 177
      Height = 49
      Align = alTop
      Caption = #1040#1076#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 134
        Top = 18
        Width = 19
        Height = 17
        Caption = '+'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 156
        Top = 18
        Width = 18
        Height = 17
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton2Click
      end
      object EditCountry: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 233
    Width = 179
    Height = 49
    Align = alTop
    Caption = #1040#1076#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object SpeedButton3: TSpeedButton
      Left = 132
      Top = 16
      Width = 19
      Height = 18
      Caption = '+'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 155
      Top = 16
      Width = 18
      Height = 18
      Caption = '-'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object Editcities: TEdit
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object DBEdit1: TDBEdit
    Left = 80
    Top = 104
    Width = 81
    Height = 21
    DataField = 'ID'
    DataSource = DataMod_Buyers.countrydata
    TabOrder = 3
    Visible = False
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 282
    Width = 179
    Height = 138
    Align = alClient
    DataSource = DataMod_Buyers.ctiesdata
    FixedColor = clActiveCaption
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CITY_NAME'
        Title.Caption = #1064#1103#1097#1103#1088' '
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 141
        Visible = True
      end>
  end
end

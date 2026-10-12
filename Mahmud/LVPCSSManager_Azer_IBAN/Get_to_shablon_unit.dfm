object Form_get_to_shablon: TForm_get_to_shablon
  Left = 406
  Top = 140
  Caption = 'Shablons'
  ClientHeight = 292
  ClientWidth = 1065
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridReadyBatchs: TDBGrid
    Left = 0
    Top = 0
    Width = 1065
    Height = 222
    TabStop = False
    Align = alClient
    BorderStyle = bsNone
    Color = clBtnFace
    DataSource = DataMod.DS_shablon
    DrawingStyle = gdsGradient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridReadyBatchsDblClick
    OnTitleClick = GridReadyBatchsTitleClick
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'SHABLONUN_ADI'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1040#1076#1099
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'ODENISH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1070#1076#1103#1081#1103#1085
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 173
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'BANKIN_KODU'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1041#1072#1085#1082#1099#1085' '#1072#1076#1099
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 186
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'BANKIN_adi'
        Title.Alignment = taCenter
        Title.Caption = #1041#1072#1085#1082#1099#1085' '#1082#1086#1076#1091
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'HESAB_NO'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1065#1077#1089#1072#1073' '#8470':'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 190
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clWhite
        Expanded = False
        FieldName = 'ADI'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 152
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'OD_TEY1'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial AzLat'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1070#1076#1103#1085#1080#1096#1080#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 153
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 1065
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = -38
    ExplicitWidth = 115
    object Button1: TButton
      Left = 936
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Sil'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 222
    Width = 1065
    Height = 32
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    ExplicitTop = -70
    ExplicitWidth = 115
    object SearchEdit1: TSearchEdit
      Left = 6
      Top = 6
      Width = 91
      Height = 21
      TabOrder = 0
      DataSource = DataMod.DS_shablon
      SearchField = 'SHABLONUN_ADI'
    end
    object SearchEdit2: TSearchEdit
      Left = 848
      Top = 6
      Width = 145
      Height = 21
      TabOrder = 1
      SearchField = 'OD_TEY1'
    end
    object SearchEdit3: TSearchEdit
      Left = 456
      Top = 6
      Width = 92
      Height = 21
      TabOrder = 2
      DataSource = DataMod.DS_shablon
      SearchField = 'BANKIN_ADI'
    end
    object SearchEdit4: TSearchEdit
      Left = 552
      Top = 6
      Width = 131
      Height = 21
      TabOrder = 3
      DataSource = DataMod.DS_shablon
      SearchField = 'HESAB_NO'
    end
    object SearchEdit5: TSearchEdit
      Left = 100
      Top = 6
      Width = 160
      Height = 21
      TabOrder = 4
      DataSource = DataMod.DS_shablon
      SearchField = 'ODENISH'
    end
    object SearchEdit6: TSearchEdit
      Left = 264
      Top = 6
      Width = 189
      Height = 21
      TabOrder = 5
      DataSource = DataMod.DS_shablon
      SearchField = 'BANKIN_KODU'
    end
    object SearchEdit7: TSearchEdit
      Left = 686
      Top = 6
      Width = 158
      Height = 21
      TabOrder = 6
      DataSource = DataMod.DS_shablon
      SearchField = 'ADI'
    end
  end
end

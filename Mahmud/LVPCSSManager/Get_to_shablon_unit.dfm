object Form_get_to_shablon: TForm_get_to_shablon
  Left = 327
  Top = 328
  Width = 825
  Height = 506
  Caption = 'Shablons'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object GridReadyBatchs: TDBGrid
    Left = 0
    Top = 0
    Width = 817
    Height = 402
    TabStop = False
    Align = alClient
    BorderStyle = bsNone
    Color = clBtnFace
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
        Title.Caption = 'јды'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
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
        Title.Caption = 'ёд€й€н'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
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
        Title.Caption = 'Ѕанкын ады'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
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
        Title.Caption = 'Ѕанкын коду'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
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
        Title.Caption = 'ћцшт€ринин ўесаб є:'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 135
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
        Title.Caption = 'ћцшт€ринин ады'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
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
        Title.Caption = 'ёд€нишин т€йинаты'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 153
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 434
    Width = 817
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
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
    Top = 402
    Width = 817
    Height = 32
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object SearchEdit1: TSearchEdit
      Left = 6
      Top = 6
      Width = 91
      Height = 21
      TabOrder = 0
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
      SearchField = 'BANKIN_ADI'
    end
    object SearchEdit4: TSearchEdit
      Left = 552
      Top = 6
      Width = 131
      Height = 21
      TabOrder = 3
      SearchField = 'HESAB_NO'
    end
    object SearchEdit5: TSearchEdit
      Left = 100
      Top = 6
      Width = 160
      Height = 21
      TabOrder = 4
      SearchField = 'ODENISH'
    end
    object SearchEdit6: TSearchEdit
      Left = 264
      Top = 6
      Width = 189
      Height = 21
      TabOrder = 5
      SearchField = 'BANKIN_KODU'
    end
    object SearchEdit7: TSearchEdit
      Left = 686
      Top = 6
      Width = 158
      Height = 21
      TabOrder = 6
      SearchField = 'ADI'
    end
  end
end

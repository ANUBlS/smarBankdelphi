object all_orders: Tall_orders
  Left = 201
  Top = 49
  BorderStyle = bsDialog
  ClientHeight = 380
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 674
    Height = 298
    Align = alClient
    DataSource = DataModCustOrders.cust_orders_
    FixedColor = clNavy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PNUM'
        Title.Caption = '¹'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_INN'
        Title.Caption = 'Âþèí'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C_NAME'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDATE'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object searchGroupBox: TGroupBox
    Left = 0
    Top = 298
    Width = 674
    Height = 39
    Align = alBottom
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object noEdit: TEdit
      Left = 4
      Top = 12
      Width = 55
      Height = 21
      TabOrder = 0
      OnChange = noEditChange
      OnExit = noEditExit
    end
    object innEdit: TEdit
      Left = 57
      Top = 12
      Width = 124
      Height = 21
      TabOrder = 1
      OnChange = innEditChange
      OnExit = innEditExit
    end
    object nameEdit: TEdit
      Left = 179
      Top = 12
      Width = 218
      Height = 21
      TabOrder = 2
      OnChange = nameEditChange
      OnExit = nameEditExit
    end
    object ddateEdit: TEdit
      Left = 396
      Top = 12
      Width = 114
      Height = 21
      TabOrder = 3
      OnChange = ddateEditChange
      OnExit = ddateEditExit
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 337
    Width = 674
    Height = 43
    Align = alBottom
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 12
      Top = 12
      Width = 89
      Height = 25
      Caption = 'Ðåäàêòÿ'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C000000000000000000000000000000000000000000000000
        000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F1042104210421042FF7F1042FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F104210421042104210421042FF7F104210421042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F104210421042FF7F1042104210421042FF7F1042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F10421042104210421042FF7F1042104210421042
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7F0000FF7F000000020002FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F0000000200000002000000021042FF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7F000000020000E0030002E0031042FF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7F0000FF7F0000E0030002FF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00001F7C1F7C000000000000000000000000000000000000000000000000
        000000001F7C}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 111
      Top = 12
      Width = 89
      Height = 25
      Caption = 'Ñèë'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C0000FF7F1F7C1F7C1F7C1F7C0000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C
        0000FF7F1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C1F7C1F7C0000
        FF7F1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C1F7C00000000
        FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C00000000FF7F
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000FF7F1F7C0000FF7F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C00000000
        FF7F1F7C1F7C1F7C1F7C0000000000000000FF7F1F7C1F7C1F7C1F7C1F7C0000
        0000FF7F1F7C1F7C1F7C00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        00000000FF7F1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 214
      Top = 12
      Width = 90
      Height = 23
      Caption = 'Àõòàðûø'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1042000010421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C104200420042000010421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1042186300420042000010421F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C0042186300420042000010421F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00421863004200420000104210421042104210421042
        1F7C1F7C1F7C1F7C1F7C1F7C0042186300420042000000000000000000001042
        10421F7C1F7C1F7C1F7C1F7C1F7C004218630042004210421863186318631042
        000010421F7C1F7C1F7C1F7C1F7C1F7C000000421042FF7F1863FF7F18631863
        1042000010421F7C1F7C1F7C1F7C1F7C00001042FF7F1F001F001F001F001F00
        1863104210421F7C1F7C1F7C1F001F7C0000FF7F18631F001863FF7F18631F00
        1863186300001F7C1F7C1F7C1F001F0000001863FF7F1F001F001F001F001F00
        FF7F186300001F7C1F7C1F7C1F001F7C0000FF7F18631F00FF7FFF7F1F00FF7F
        1863186300001F7C1F7C1F7C1F7C1F0010421042FF7F1F001F001F001F001863
        FF7F104210421F7C1F7C1F7C1F7C1F7C1F7C00001042FF7F1863FF7F1863FF7F
        104200001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001042FF7F1863FF7F1042
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10420000000000001042
        1F7C1F7C1F7C}
      ParentFont = False
      OnClick = SpeedButton3Click
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 360
    Top = 208
  end
end

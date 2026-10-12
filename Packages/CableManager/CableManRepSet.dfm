object frmPrintRep: TfrmPrintRep
  Left = 286
  Top = 64
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 441
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label17: TLabel
      Left = 72
      Top = 8
      Width = 104
      Height = 13
      Caption = 'Мялумат / Десжриптион'
    end
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Сыра №'
    end
    object Label16: TLabel
      Left = 320
      Top = 8
      Width = 20
      Height = 13
      Caption = 'В/Г'
    end
    object Label18: TLabel
      Left = 424
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Мябляь / Тотал'
    end
  end
  object p7: TPanel
    Left = 0
    Top = 251
    Width = 549
    Height = 142
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object Label7: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '7'
    end
    object Label15: TLabel
      Left = 70
      Top = 8
      Width = 3
      Height = 13
    end
    object Edit7: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit7: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
    object GrBoxServs: TGroupBox
      Left = 28
      Top = 2
      Width = 281
      Height = 119
      Caption = 'Хидмятляр'
      TabOrder = 2
      object Label19: TLabel
        Left = 8
        Top = 76
        Width = 23
        Height = 13
        Caption = 'диэяр'
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 14
        Width = 116
        Height = 17
        Caption = 'антен гурашдырылмасы'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 35
        Width = 118
        Height = 17
        Caption = 'пултун дяйишдирилмяси'
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 129
        Top = 14
        Width = 129
        Height = 17
        Caption = 'декодерин дяйишдирилмяси'
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 129
        Top = 35
        Width = 150
        Height = 17
        Caption = 'гида блокунун дяйишдирилмяси'
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 56
        Width = 119
        Height = 17
        Caption = 'антенин дяйишдирилмяси'
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 129
        Top = 56
        Width = 111
        Height = 17
        Caption = 'картын дяйишдирилмяси'
        TabOrder = 5
      end
      object Edt7_1: TEdit
        Left = 8
        Top = 92
        Width = 268
        Height = 21
        TabOrder = 6
      end
    end
  end
  object p5: TPanel
    Left = 0
    Top = 181
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object Label5: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '5'
    end
    object Label13: TLabel
      Left = 70
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Эцнляр / Ын дайс'
    end
    object Edit5: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit5: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object p3: TPanel
    Left = 0
    Top = 111
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '3'
    end
    object Label11: TLabel
      Left = 70
      Top = 8
      Width = 144
      Height = 13
      Caption = 'Каналларын артымына эюря юдямя'
    end
    object Edit3: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object p2: TPanel
    Left = 0
    Top = 76
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '2'
    end
    object Label10: TLabel
      Left = 70
      Top = 8
      Width = 93
      Height = 13
      Caption = 'Йенидян гурашдырма'
    end
    object Edit2: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object p1: TPanel
    Left = 0
    Top = 41
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label9: TLabel
      Left = 70
      Top = 8
      Width = 95
      Height = 13
      Caption = 'Аваданлыьын алынмасы'
    end
    object Edit1: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object p6: TPanel
    Left = 0
    Top = 216
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object Label6: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '6'
    end
    object Label14: TLabel
      Left = 70
      Top = 8
      Width = 169
      Height = 13
      Caption = 'Йекун абуня щаггы / Тотал суб. фее'
    end
    object Edit6: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit6: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object p4: TPanel
    Left = 0
    Top = 146
    Width = 549
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 6
      Height = 13
      Caption = '4'
    end
    object Label12: TLabel
      Left = 70
      Top = 8
      Width = 139
      Height = 13
      Caption = 'Абуня щаггы / Субсжрибер фее'
    end
    object Edit4: TEdit
      Left = 315
      Top = 4
      Width = 41
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object CurrencyEdit4: TCurrencyEdit
      Left = 411
      Top = 4
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
  end
  object Button1: TButton
    Left = 320
    Top = 411
    Width = 75
    Height = 25
    Caption = 'Чап'
    Default = True
    ModalResult = 1
    TabOrder = 8
  end
  object Button2: TButton
    Left = 408
    Top = 411
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Баьла'
    ModalResult = 2
    TabOrder = 9
  end
end

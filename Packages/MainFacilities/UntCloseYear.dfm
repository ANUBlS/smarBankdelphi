object FrmSetCloseYear: TFrmSetCloseYear
  Left = 258
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tax settings'
  ClientHeight = 128
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 298
    Top = 85
    Width = 49
    Height = 25
    Caption = 'Гябул'
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 348
    Height = 83
    Align = alTop
    Color = clBtnShadow
    Enabled = False
    Lines.Strings = (
      '       ВЕРЭИ СИСТЕМИ ЦЧЦН ЯСАС ВЯСАИТЛЯРИН САЗЛАНМАСЫ'
      ''
      
        '  Бу сящифядян истифадя едяряк, сиз верэи системи цчцн йени бала' +
        'нс '
      
        'дяйярляринин мцяййян едилмяси вя бунун ясясында йени баланс дяйя' +
        'рляриня '
      
        'амортизасийаларын щесабланмасыны автоматик реъимдя тямин етмиш о' +
        'лурсунуз.')
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 83
    Width = 148
    Height = 45
    Align = alLeft
    TabOrder = 1
    object StaticText2: TStaticText
      Left = 1
      Top = 1
      Width = 146
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Системдяки тарих:'
      Color = clSilver
      ParentColor = False
      TabOrder = 0
    end
    object ECurrentDate: TEdit
      Left = 2
      Top = 20
      Width = 144
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 148
    Top = 83
    Width = 147
    Height = 45
    Align = alLeft
    TabOrder = 2
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 145
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Баьланажаг тарих:'
      Color = clSilver
      ParentColor = False
      TabOrder = 0
    end
    object ENewDate: TEdit
      Left = 2
      Top = 20
      Width = 120
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 1
    end
    object DTPNewDate: TDateTimePicker
      Left = 124
      Top = 20
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      CalAlignment = dtaLeft
      Date = 37734.65589625
      Time = 37734.65589625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnChange = DTPNewDateChange
    end
  end
end

object FormUpdTrans: TFormUpdTrans
  Left = 383
  Top = 260
  AutoSize = True
  BorderStyle = bsDialog
  Caption = '-----------------------'
  ClientHeight = 120
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxDebtAcc: TGroupBox
    Left = 0
    Top = 0
    Width = 191
    Height = 47
    Caption = 'Дебит щесаб'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object CBoxDebtAcc: TComboBox
      Left = 2
      Top = 22
      Width = 186
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBoxCredAcc: TGroupBox
    Left = 0
    Top = 46
    Width = 190
    Height = 47
    Caption = 'Кредит щесаб'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object CBoxCredAcc: TComboBox
      Left = 3
      Top = 23
      Width = 182
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object BitBtnOk: TBitBtn
    Left = 0
    Top = 96
    Width = 190
    Height = 24
    Caption = 'Icra et......'
    TabOrder = 2
    OnClick = BitBtnOkClick
  end
end

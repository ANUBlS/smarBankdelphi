object filter: Tfilter
  Left = 192
  Top = 133
  Caption = 'filter'
  ClientHeight = 162
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 226
    Height = 162
    Align = alClient
    Caption = 'Se'#231'm'#601'l'#601'r'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 50
      Width = 31
      Height = 14
      Caption = 'Hesab'
    end
    object EditBalList: TEdit
      Left = 44
      Top = 43
      Width = 165
      Height = 22
      TabOrder = 0
    end
    object CBDebt: TCheckBox
      Left = 13
      Top = 23
      Width = 79
      Height = 13
      Caption = 'Debet '#252'zr'#601
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CBKred: TCheckBox
      Left = 104
      Top = 23
      Width = 79
      Height = 13
      Caption = 'Kredit '#252'zr'#601
      TabOrder = 2
    end
    object CheckBoxBalance: TCheckBox
      Left = 8
      Top = 100
      Width = 176
      Height = 13
      Caption = 'Balans hesab'#305' '#252'zr'#601
      TabOrder = 3
      OnClick = CheckBoxBalanceClick
    end
    object ComboBoxPlan: TComboBox
      Left = 6
      Top = 71
      Width = 145
      Height = 22
      Enabled = False
      TabOrder = 4
      Text = '1 balans hesab'#305
      Items.Strings = (
        '1 balans hesab'#305
        '2 balans hesab'#305
        '3 balans hesab'#305
        '4 balans hesab'#305)
    end
    object ButtonOk: TButton
      Left = 32
      Top = 128
      Width = 75
      Height = 25
      Caption = '&Oldu'
      ModalResult = 1
      TabOrder = 5
    end
    object ButtonCancel: TButton
      Left = 120
      Top = 128
      Width = 75
      Height = 25
      Caption = #304'&mtina'
      ModalResult = 2
      TabOrder = 6
    end
  end
end

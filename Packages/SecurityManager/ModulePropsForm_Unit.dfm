object ModulePropsForm: TModulePropsForm
  Left = 296
  Top = 424
  BorderStyle = bsDialog
  Caption = 'Module properties'
  ClientHeight = 107
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 265
    Height = 81
    Caption = 'Модулун хцсусиййятляри'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 18
      Height = 13
      Caption = 'Ады:'
    end
    object DescriptionLabel: TLabel
      Left = 8
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Тясвири:'
    end
    object NameEdit: TEdit
      Left = 80
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object DescriptionEdit: TEdit
      Left = 80
      Top = 48
      Width = 161
      Height = 21
      TabOrder = 1
    end
  end
  object OkButton: TButton
    Left = 109
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 189
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ErrorHintBox: THintBox
    Left = 0
    Top = 88
    Width = 150
    Height = 18
    AutoSize = True
    BevelOuter = bvNone
    Caption = 'ErrorHintBox'
    TabOrder = 3
    Visible = False
    HintStyle = hsWarning
    Timeout = 4000
    BeepOnMessage = False
  end
end

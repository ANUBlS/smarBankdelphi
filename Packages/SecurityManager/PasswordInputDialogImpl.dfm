object PasswordInputDialog: TPasswordInputDialog
  Left = 419
  Top = 215
  BorderStyle = bsDialog
  Caption = 'Password set dialog'
  ClientHeight = 97
  ClientWidth = 228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 228
    Height = 69
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Password:'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 28
      Height = 13
      Caption = 'Retry:'
    end
    object PasswordEdit: TMaskEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object RetryPasswordEdit: TMaskEdit
      Left = 96
      Top = 40
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object OkButton: TButton
    Left = 72
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set'
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 152
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end

object OpenIniFileForm: TOpenIniFileForm
  Left = 330
  Top = 315
  Width = 286
  Height = 165
  Caption = 'OpenIniFileForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IniFileTypeRGB: TRadioGroup
    Left = 0
    Top = 0
    Width = 278
    Height = 105
    Align = alTop
    Caption = 'Open a ...'
    Items.Strings = (
      'Windows Ini File'
      'Ini stored on DB Server')
    TabOrder = 0
  end
  object OkButton: TButton
    Left = 120
    Top = 112
    Width = 75
    Height = 25
    Action = Commit
    Default = True
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 200
    Top = 112
    Width = 75
    Height = 25
    Action = Cancel
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 200
    Top = 24
    object Commit: TAction
      Caption = '&Ok'
      OnExecute = CommitExecute
      OnUpdate = CommitUpdate
    end
    object Cancel: TAction
      Caption = '&Cancel'
      OnExecute = CancelExecute
    end
  end
  object OpenLocalDlg: TOpenDialog
    Filter = 'Windows INI Files (*.ini)|*.ini|All files (*.*)|*.*'
    Left = 160
    Top = 16
  end
end

object FindDialog: TFindDialog
  Left = 293
  Top = 319
  Width = 287
  Height = 222
  Caption = 'FindDialog'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = '&Text to find:'
  end
  object SearchTextEdit: TEdit
    Left = 80
    Top = 5
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 35
    Width = 145
    Height = 65
    Caption = 'Options'
    TabOrder = 1
    object CaseSensitiveCB: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Action = OptionsCaseSensitive
      TabOrder = 0
    end
    object WholeWordsCB: TCheckBox
      Left = 8
      Top = 40
      Width = 97
      Height = 17
      Action = OptionsWholeWords
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 100
    Width = 145
    Height = 65
    Caption = 'Scope'
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Action = ScopeGlobal
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Action = ScopeSelected
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 148
    Top = 35
    Width = 128
    Height = 65
    Caption = 'Direction'
    TabOrder = 3
    object RadioButton3: TRadioButton
      Left = 24
      Top = 16
      Width = 92
      Height = 17
      Action = DirectionForward
      TabOrder = 0
      TabStop = True
    end
    object RadioButton4: TRadioButton
      Left = 24
      Top = 40
      Width = 93
      Height = 17
      Action = DirectionBackward
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 148
    Top = 100
    Width = 128
    Height = 65
    Caption = 'Origin'
    TabOrder = 4
    object RadioButton5: TRadioButton
      Left = 24
      Top = 16
      Width = 89
      Height = 17
      Action = OriginFromCursor
      TabOrder = 0
    end
    object RadioButton6: TRadioButton
      Left = 24
      Top = 40
      Width = 89
      Height = 17
      Action = OriginEntireScope
      TabOrder = 1
    end
  end
  object OkButton: TButton
    Left = 120
    Top = 168
    Width = 75
    Height = 25
    Action = CommitAction
    Default = True
    TabOrder = 5
  end
  object CancelButton: TButton
    Left = 200
    Top = 168
    Width = 75
    Height = 25
    Action = CancelAction
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 211
    Top = 27
    object ScopeGlobal: TAction
      Category = 'Scope'
      Caption = 'Global'
      Checked = True
      OnExecute = ScopeGlobalExecute
    end
    object ScopeSelected: TAction
      Category = 'Scope'
      Caption = 'Selected Text'
      OnExecute = ScopeGlobalExecute
    end
    object OptionsCaseSensitive: TAction
      Category = 'Options'
      Caption = 'Case Sensitive'
    end
    object OptionsWholeWords: TAction
      Category = 'Options'
      Caption = 'Whole Words'
    end
    object DirectionForward: TAction
      Category = 'Direction'
      Caption = 'Forward'
      Checked = True
      OnExecute = DirectionForwardExecute
    end
    object DirectionBackward: TAction
      Category = 'Direction'
      Caption = 'Backward'
      OnExecute = DirectionForwardExecute
    end
    object OriginFromCursor: TAction
      Category = 'Origin'
      Caption = 'From Cursor'
      OnExecute = OriginFromCursorExecute
    end
    object OriginEntireScope: TAction
      Category = 'Origin'
      Caption = 'Entire Scope'
      OnExecute = OriginFromCursorExecute
    end
    object CommitAction: TAction
      Caption = '&Ok'
    end
    object CancelAction: TAction
      Caption = '&Cancel'
    end
  end
end

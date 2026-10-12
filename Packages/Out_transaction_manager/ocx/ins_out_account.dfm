object insert_out_account: Tinsert_out_account
  Left = 376
  Top = 257
  Width = 244
  Height = 221
  Caption = 'Transfer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 194
    Align = alClient
    TabOrder = 0
    object Button2: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Account'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 16
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Provarch'
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 16
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Archost'
      TabOrder = 2
      OnClick = Button6Click
    end
    object box2: TGroupBox
      Left = 99
      Top = 11
      Width = 127
      Height = 167
      TabOrder = 3
      Visible = False
      object Button7: TButton
        Left = 13
        Top = 16
        Width = 101
        Height = 25
        Caption = 'DisableTrigger'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 14
        Top = 64
        Width = 99
        Height = 25
        Caption = 'Insert-Provarch'
        TabOrder = 1
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 14
        Top = 112
        Width = 99
        Height = 25
        Caption = 'EnableTrigger'
        TabOrder = 2
        OnClick = Button9Click
      end
    end
    object box3: TGroupBox
      Left = 99
      Top = 15
      Width = 126
      Height = 166
      TabOrder = 4
      object Button10: TButton
        Left = 17
        Top = 18
        Width = 96
        Height = 24
        Caption = 'DisableTrigger'
        TabOrder = 0
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 18
        Top = 64
        Width = 93
        Height = 25
        Caption = 'Insert-Archost'
        TabOrder = 1
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 17
        Top = 109
        Width = 92
        Height = 25
        Caption = 'EnableTrigger'
        TabOrder = 2
        OnClick = Button12Click
      end
    end
    object box1: TGroupBox
      Left = 99
      Top = 16
      Width = 129
      Height = 172
      TabOrder = 5
      object Button13: TButton
        Left = 16
        Top = 16
        Width = 97
        Height = 25
        Caption = 'DisableTriggers'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button14: TButton
        Left = 19
        Top = 112
        Width = 97
        Height = 25
        Caption = 'EnableTriggers'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button15: TButton
        Left = 16
        Top = 64
        Width = 97
        Height = 25
        Caption = 'Insert-Account'
        TabOrder = 2
        OnClick = Button3Click
      end
    end
  end
end

object fmUsersRefresh: TfmUsersRefresh
  Left = 345
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Sinonimlerin yenilenmesi'
  ClientHeight = 274
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 232
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 136
      Height = 230
      Align = alLeft
      Caption = '…енил€нм€к гайдалары'
      TabOrder = 0
      object gbDatabaseObjects: TGroupBox
        Left = 2
        Top = 36
        Width = 132
        Height = 140
        Align = alBottom
        Caption = 'Ѕазанын обйектл€ри'
        TabOrder = 0
        object cbTables: TCheckBox
          Left = 9
          Top = 14
          Width = 57
          Height = 17
          Caption = 'Tables'
          TabOrder = 0
        end
        object cbViews: TCheckBox
          Left = 9
          Top = 56
          Width = 57
          Height = 17
          Caption = 'Views'
          TabOrder = 1
        end
        object cbPackages: TCheckBox
          Left = 9
          Top = 34
          Width = 73
          Height = 17
          Caption = 'Packages'
          TabOrder = 2
        end
        object cbProcedures: TCheckBox
          Left = 9
          Top = 77
          Width = 81
          Height = 17
          Caption = 'Procedures'
          TabOrder = 3
        end
        object cbFunctions: TCheckBox
          Left = 9
          Top = 98
          Width = 73
          Height = 17
          Caption = 'Functions'
          TabOrder = 4
        end
        object cbSynonyms: TCheckBox
          Left = 9
          Top = 119
          Width = 73
          Height = 17
          Caption = 'Synonyms'
          TabOrder = 5
        end
      end
      object cbAll: TCheckBox
        Left = 12
        Top = 18
        Width = 105
        Height = 17
        Caption = 'Ѕцтцн истифад€чил€р'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbAllClick
      end
      object rgRules: TRadioGroup
        Left = 2
        Top = 176
        Width = 132
        Height = 52
        Align = alBottom
        Caption = '√айдалар'
        ItemIndex = 0
        Items.Strings = (
          '…енил€м€к'
          '…енид€н йаратмаг')
        TabOrder = 2
        OnClick = rgRulesClick
      end
    end
    object clbUsers: TCheckListBox
      Left = 137
      Top = 1
      Width = 260
      Height = 230
      Align = alClient
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 232
    Width = 398
    Height = 42
    Align = alBottom
    TabOrder = 1
    object btMainBar: TGauge
      Left = 8
      Top = 9
      Width = 225
      Height = 24
      BackColor = clBtnFace
      ForeColor = clNavy
      Progress = 0
    end
    object btApply: TBitBtn
      Left = 239
      Top = 9
      Width = 73
      Height = 24
      Caption = '√€бул'
      TabOrder = 0
      OnClick = btApplyClick
      Kind = bkOK
    end
    object btExit: TBitBtn
      Left = 316
      Top = 9
      Width = 73
      Height = 24
      Caption = '„ыхыш'
      TabOrder = 1
      Kind = bkCancel
    end
  end
end

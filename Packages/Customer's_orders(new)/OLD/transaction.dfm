object Emeliyyat: TEmeliyyat
  Left = 137
  Top = 252
  Width = 708
  Height = 134
  Caption = 'Emeliyyat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 700
    Height = 103
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 15
      Width = 185
      Height = 81
      Caption = 'Debet'
      TabOrder = 0
      object Edit4: TEdit
        Left = 8
        Top = 16
        Width = 161
        Height = 21
        TabOrder = 0
        OnKeyUp = Edit4KeyUp
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 48
        Width = 161
        Height = 21
        DataField = 'ID'
        DataSource = DataModule1.acc_no_
        Enabled = False
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 194
      Top = 15
      Width = 189
      Height = 82
      Caption = 'Kredit'
      TabOrder = 1
      object Edit5: TEdit
        Left = 8
        Top = 16
        Width = 169
        Height = 21
        TabOrder = 0
        OnKeyUp = Edit5KeyUp
      end
      object DBEdit1: TDBEdit
        Left = 9
        Top = 48
        Width = 167
        Height = 21
        DataField = 'ID'
        DataSource = DataModule1.act_no_
        Enabled = False
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 384
      Top = 16
      Width = 151
      Height = 43
      Caption = 'ћ€бл€ь'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object total: TEdit
        Left = 8
        Top = 14
        Width = 135
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 544
      Top = 18
      Width = 153
      Height = 41
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 4
        Top = 9
        Width = 145
        Height = 28
        Caption = '√€бул'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
    end
    object GroupBox6: TGroupBox
      Left = 383
      Top = 57
      Width = 314
      Height = 43
      Caption = 'ям€лиййатын т€йинаты'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object proper_edit: TEdit
        Left = 7
        Top = 13
        Width = 293
        Height = 21
        TabOrder = 0
      end
    end
  end
end

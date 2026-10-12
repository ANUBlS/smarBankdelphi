object FormUpdGroups: TFormUpdGroups
  Left = 324
  Top = 236
  BorderStyle = bsDialog
  Caption = 'EditGroups'
  ClientHeight = 215
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelM: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 215
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clNavy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SButton: TSpeedButton
      Left = 3
      Top = 180
      Width = 306
      Height = 26
      Caption = 'Icra et.....'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36010000424D3601000000000000760000002800000015000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333000333333333333333333333000338FF3FF3333333333333000338C
        F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
        3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
        CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
        F38CCC88333333333000338CF38C88333333333330003388F388333333333333
        3000333333333333333333333000333333333333333333333000}
      ParentFont = False
      OnClick = SButtonClick
    end
    object GroupBoxName: TGroupBox
      Left = 2
      Top = 2
      Width = 339
      Height = 39
      Align = alTop
      Caption = '√рупун ады'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object EditGroupName: TEdit
        Left = 1
        Top = 16
        Width = 304
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxNBPercent: TGroupBox
      Left = 2
      Top = 42
      Width = 157
      Height = 37
      Caption = 'Faiz(ћалийй€)'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object EditPercentNB: TEdit
        Left = 2
        Top = 14
        Width = 152
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxNLPercent: TGroupBox
      Left = 159
      Top = 42
      Width = 150
      Height = 37
      Caption = 'Faiz(Vergi)'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object EditPercentNL: TEdit
        Left = 2
        Top = 14
        Width = 145
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxDebtAcc: TGroupBox
      Left = 2
      Top = 81
      Width = 158
      Height = 41
      Caption = '’€рж/ƒебит щесаб'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      object CB_exp_acc: TDBLookupComboBox
        Left = 2
        Top = 18
        Width = 154
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBoxCredAcc: TGroupBox
      Left = 2
      Top = 129
      Width = 159
      Height = 47
      Caption = 'јмортизасийа/ редит щесаб'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      object CB_amort_acc: TDBLookupComboBox
        Left = 3
        Top = 24
        Width = 154
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox_main_acc: TGroupBox
      Left = 160
      Top = 81
      Width = 150
      Height = 41
      Caption = 'ясас в€саит щесабы'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object CB_main_acc: TDBLookupComboBox
        Left = 3
        Top = 18
        Width = 145
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox_sale_acc: TGroupBox
      Left = 161
      Top = 129
      Width = 149
      Height = 47
      Caption = 'јлгы - —атгы / «€р€р'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object CB_sale_acc: TDBLookupComboBox
        Left = 2
        Top = 24
        Width = 145
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = DataModWares.DSViewGr
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end

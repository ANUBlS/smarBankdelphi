object FormTransView: TFormTransView
  Left = 192
  Top = 107
  Caption = 'FormTransView'
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxAcc: TGroupBox
    Left = 0
    Top = 0
    Width = 688
    Height = 217
    Align = alTop
    Caption = #1065#1077#1089#1072#1073
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBGridMainState: TDBGrid
      Left = 2
      Top = 16
      Width = 684
      Height = 157
      Align = alClient
      DataSource = Out_Stdatamod.DSMainState
      DrawingStyle = gdsGradient
      FixedColor = 9179948
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'ACCOUNTNUMBER'
          Title.Caption = #1065#1077#1089#1072#1073' '#1085#1102#1084#1088#1103#1089#1080
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 190
          Visible = True
        end
        item
          Color = clInactiveCaption
          Expanded = False
          FieldName = 'CURRENCYID'
          Title.Alignment = taCenter
          Title.Caption = #1042#1072#1083'.'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'ACCOUNTNAME'
          Title.Caption = #1065#1077#1089#1072#1073#1099#1085' '#1072#1076#1099
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 556
          Visible = True
        end>
    end
    object PanelN: TPanel
      Left = 2
      Top = 173
      Width = 684
      Height = 42
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object LabelTurnFirst: TLabel
        Left = 6
        Top = 22
        Width = 122
        Height = 14
        Caption = #1069#1094#1085#1094#1085' '#1103#1074#1074#1103#1083#1080#1085#1103' '#1075#1072#1083#1099#1075' :'
      end
      object LabelTurnEnd: TLabel
        Left = 248
        Top = 24
        Width = 108
        Height = 14
        Caption = #1069#1094#1085#1094#1085' '#1089#1086#1085#1091#1085#1072' '#1075#1072#1083#1099#1075' :'
      end
      object DBEditTurnBeg: TDBEdit
        Left = 115
        Top = 16
        Width = 121
        Height = 22
        Color = clInfoBk
        DataField = 'PokOstat'
        DataSource = Out_Stdatamod.DSMainState
        TabOrder = 0
      end
      object DBEditTurnEnd: TDBEdit
        Left = 352
        Top = 16
        Width = 121
        Height = 22
        Color = clInfoBk
        DataField = 'EndPokOstat'
        DataSource = Out_Stdatamod.DSMainState
        TabOrder = 1
      end
    end
  end
  object GroupBoxTrans: TGroupBox
    Left = 0
    Top = 217
    Width = 688
    Height = 229
    Align = alClient
    Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1083#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGridExtractTrans: TDBGrid
      Left = 2
      Top = 16
      Width = 684
      Height = 211
      Align = alClient
      DataSource = Out_Stdatamod.DSExtractTrans
      DrawingStyle = gdsGradient
      FixedColor = 9179948
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'pairaccountname'
          Title.Caption = #1043#1072#1088#1096#1099' '#1097#1077#1089#1072#1073
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 190
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInactiveCaption
          Expanded = False
          FieldName = 'PairCurrencyId'
          Title.Alignment = taCenter
          Title.Caption = #1042#1072#1083'.'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 45
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'Dat'
          Title.Caption = 'Tarix'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'debit'
          Title.Caption = 'Debit'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'kredit'
          Title.Caption = 'Kredit'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 112
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'ldebit'
          Title.Caption = 'Debit.Ekv'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 117
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'lkredit'
          Title.Caption = 'Kredit.Ekv'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 124
          Visible = True
        end>
    end
  end
end

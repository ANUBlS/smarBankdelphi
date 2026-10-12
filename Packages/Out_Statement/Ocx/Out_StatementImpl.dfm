object Out_StatementForm: TOut_StatementForm
  Left = 192
  Top = 107
  Width = 598
  Height = 392
  Caption = 'Out_StatementForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GrBoxMain: TGroupBox
    Left = 0
    Top = 0
    Width = 598
    Height = 392
    Align = alClient
    Caption = #1065#1077#1089#1072#1073#1076#1072#1085' '#1095#1099#1093#1072#1088#1099#1096
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GrBoxDate: TGroupBox
      Left = 3
      Top = 17
      Width = 590
      Height = 57
      Caption = #1058#1072#1088#1080#1093' '#1072#1088#1072#1083#1099#1100#1099':'
      TabOrder = 0
      object LabelBegDate: TLabel
        Left = 4
        Top = 30
        Width = 43
        Height = 14
        Caption = #1071#1074#1074#1103#1083#1080':'
      end
      object LabelEndDate: TLabel
        Left = 156
        Top = 30
        Width = 28
        Height = 14
        Caption = 'Sonu:'
      end
      object DTP_Begin: TDateTimePicker
        Left = 41
        Top = 24
        Width = 104
        Height = 21
        Date = 38840.716845370400000000
        Time = 38840.716845370400000000
        TabOrder = 0
      end
      object DTP_End: TDateTimePicker
        Left = 189
        Top = 24
        Width = 109
        Height = 21
        Date = 38840.720432476900000000
        Time = 38840.720432476900000000
        TabOrder = 1
      end
      object CBTurnOver: TCheckBox
        Left = 437
        Top = 30
        Width = 105
        Height = 17
        Caption = #1044#1102#1074#1088#1080#1081#1081#1103#1089#1080' '#1086#1083#1072#1085#1083#1072#1088
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CBRateDiff: TCheckBox
        Left = 333
        Top = 30
        Width = 96
        Height = 17
        Caption = #1050#1091#1088#1089' '#1060#1103#1088#1075#1080' '#1048#1083#1103
        TabOrder = 3
      end
    end
    object GrBoxChecking: TGroupBox
      Left = 3
      Top = 75
      Width = 590
      Height = 272
      Caption = #1063#1099#1093#1072#1088#1099#1096' '#1089#1077#1095#1080#1084#1083#1103#1088#1080
      TabOrder = 1
      object Label_Acc_No: TLabel
        Left = 10
        Top = 128
        Width = 175
        Height = 14
        Caption = #1065#1077#1089#1072#1073' '#1085#1102#1084#1088#1103#1089#1080' '#1074#1103' '#1081#1072' '#1085#1102#1084#1088#1103#1083#1103#1088#1080
      end
      object Label_Bal_Cn: TLabel
        Left = 8
        Top = 168
        Width = 172
        Height = 14
        Caption = #1041#1072#1083#1072#1085#1089' '#1097#1077#1089#1072#1073#1099' '#1074#1103' '#1081#1072' '#1097#1077#1089#1072#1073#1083#1072#1088#1099
      end
      object LabelCli_Id: TLabel
        Left = 11
        Top = 88
        Width = 90
        Height = 14
        Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1082#1086#1076#1091
      end
      object Edit_Acc_No: TEdit
        Left = 10
        Top = 144
        Width = 575
        Height = 22
        TabOrder = 0
      end
      object Edit_Bal_Cn: TEdit
        Left = 9
        Top = 185
        Width = 576
        Height = 22
        TabOrder = 1
      end
      object BtnOk: TBitBtn
        Left = 472
        Top = 238
        Width = 113
        Height = 26
        Caption = 'Ok'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BtnOkClick
      end
      object CBoxExtractCheck: TComboBox
        Left = 472
        Top = 214
        Width = 113
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'baxmaq'
          'fayla yaz'
          'excel'
          's'#601'n'#601'dl'#601'r'
          'plastik kart')
      end
      object EditCli_Id: TEdit
        Left = 11
        Top = 104
        Width = 574
        Height = 22
        TabOrder = 4
      end
      object RGroupPrintMode: TRadioGroup
        Left = 8
        Top = 208
        Width = 150
        Height = 57
        Caption = #1063#1072#1087' '#1096#1103#1082#1083#1080
        ItemIndex = 0
        Items.Strings = (
          #1041#1080#1088' '#1089#1103#1097#1080#1092#1103#1076#1103' '#1072#1088#1076#1099#1078#1099#1083
          #1040#1081#1088#1099'-'#1072#1081#1088#1099' '#1089#1103#1097#1080#1092#1103#1083#1103#1088#1076#1103)
        TabOrder = 5
      end
      object CBCurrency: TCheckBox
        Left = 28
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Valyuta'
        TabOrder = 6
        OnClick = CBCurrencyClick
      end
      object DBLCBavalute: TDBLookupComboBox
        Left = 27
        Top = 49
        Width = 141
        Height = 22
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = Out_Stdatamod.DSCurrency
        TabOrder = 7
      end
      object DBLCBfilial: TDBLookupComboBox
        Left = 219
        Top = 49
        Width = 143
        Height = 22
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Out_Stdatamod.DSFilial
        TabOrder = 8
      end
      object CBFilial: TCheckBox
        Left = 219
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Filial'
        TabOrder = 9
        OnClick = CBFilialClick
      end
      object CBUser: TCheckBox
        Left = 421
        Top = 30
        Width = 72
        Height = 17
        Caption = 'Operator'
        TabOrder = 10
        OnClick = CBUserClick
      end
      object dblcbUser: TDBLookupComboBox
        Left = 420
        Top = 49
        Width = 140
        Height = 22
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = Out_Stdatamod.DSUsers
        TabOrder = 11
      end
      object RGroupSetting: TRadioGroup
        Left = 162
        Top = 208
        Width = 147
        Height = 58
        Caption = #1058#1103#1081#1080#1085#1072#1090#1099#1085' '#1084#1102#1074#1075#1077#1081#1080
        ItemIndex = 0
        Items.Strings = (
          #1057#1072#1100' '#1090#1103#1088#1103#1092#1076#1103
          #1040#1096#1072#1100#1099#1076#1072)
        TabOrder = 12
      end
      object RGroupValView: TRadioGroup
        Left = 314
        Top = 209
        Width = 152
        Height = 57
        Caption = #1042#1072#1083#1081#1091#1090#1072' '#1101#1102#1088#1094#1085#1090#1094#1089#1094
        ItemIndex = 0
        Items.Strings = (
          #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1082#1086#1076#1091' '#1080#1083#1103
          #1042#1072#1083#1081#1091#1090#1072#1085#1099#1085' '#1072#1076#1099' '#1080#1083#1103)
        TabOrder = 13
      end
    end
    object PanelProgress: TPanel
      Left = 0
      Top = 348
      Width = 596
      Height = 41
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      Visible = False
      object PrBarParent: TGauge
        Left = 2
        Top = 21
        Width = 591
        Height = 17
        BackColor = clScrollBar
        ForeColor = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Progress = 0
      end
      object PrBarChild: TProgressBar
        Left = 2
        Top = 4
        Width = 591
        Height = 16
        TabOrder = 0
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 64
    Top = 512
  end
  object QRTextFilter: TQRTextFilter
    TextEncoding = DefaultEncoding
    Left = 104
    Top = 512
  end
end

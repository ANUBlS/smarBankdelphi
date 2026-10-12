object AnnutyForm: TAnnutyForm
  Left = 439
  Top = 153
  BorderIcons = [biSystemMenu]
  ClientHeight = 299
  ClientWidth = 170
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 170
    Height = 297
    Align = alTop
    Caption = #1070#1076#1103#1084#1103#1085#1080#1085' '#1096#1103#1088#1090#1083#1103#1088#1080
    TabOrder = 0
    object RGAnnuty: TRadioGroup
      Left = 2
      Top = 24
      Width = 166
      Height = 58
      Align = alTop
      Caption = #1070#1076#1103#1084#1103' '#1087#1083#1072#1085#1099#1085#1099#1085' '#1090#1080#1087#1080
      ItemIndex = 0
      Items.Strings = (
        '"'#1040#1085#1091#1080#1090#1077#1090'" '#1075#1072#1081#1076#1072#1076#1072
        #1041#1103#1088#1072#1073#1103#1088' '#1097#1080#1089#1089#1103#1083#1103#1088#1083#1103)
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 82
      Width = 166
      Height = 37
      Align = alTop
      Caption = #1048#1083#1082' '#1102#1076#1103#1084#1103' '#1090#1072#1088#1080#1093#1080
      TabOrder = 2
      object DTPStartDate: TDateTimePicker
        Left = 2
        Top = 12
        Width = 111
        Height = 21
        Date = 38201.716340393500000000
        Time = 38201.716340393500000000
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 119
      Width = 166
      Height = 37
      Align = alTop
      Caption = #1052#1103#1073#1083#1103#1100
      TabOrder = 3
      object AmountEdit: TCMCurrencyEdit
        Left = 5
        Top = 11
        Width = 158
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 195
      Width = 166
      Height = 36
      Align = alTop
      Caption = #1070#1076#1103#1084#1103' '#1087#1077#1088#1080#1086#1076#1091' '
      TabOrder = 4
      object CmbBoxPeriodRate: TComboBox
        Left = 2
        Top = 12
        Width = 158
        Height = 21
        Style = csDropDownList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CmbBoxPeriodRateClick
        Items.Strings = (
          'AYLIQ'
          'R'#220'BL'#220'K'
          'YARIM-'#304'LL'#304'K'
          #304'LL'#304'K')
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 166
      Height = 9
      Align = alTop
      BorderStyle = bsSingle
      Color = clNavy
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 231
      Width = 166
      Height = 37
      Align = alTop
      Caption = #1055#1077#1088#1080#1086#1076#1083#1072#1088#1099#1085' '#1089#1072#1081#1099
      TabOrder = 5
      object NPeriodsEdit: TEdit
        Left = 2
        Top = 12
        Width = 87
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 156
      Width = 166
      Height = 39
      Align = alTop
      Caption = #1069#1094#1079#1103#1096#1090' '#1076#1102#1074#1088#1094' '#1072#1081#1083#1072#1088#1083#1072
      TabOrder = 6
      object Gdovr: TEdit
        Left = 2
        Top = 14
        Width = 87
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = GdovrChange
        OnKeyPress = GdovrKeyPress
      end
    end
  end
  object Button2: TButton
    Left = 7
    Top = 269
    Width = 75
    Height = 25
    Action = ActnApply
    TabOrder = 1
  end
  object Button3: TButton
    Left = 90
    Top = 269
    Width = 74
    Height = 25
    Action = ActnCancel
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 128
    Top = 80
    object ActnApply: TAction
      Caption = #1043#1103#1073#1091#1083
      OnExecute = ActnApplyExecute
    end
    object ActnCancel: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = ActnCancelExecute
    end
  end
end

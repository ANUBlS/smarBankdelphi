object FormOperations: TFormOperations
  Left = 335
  Top = 207
  ActiveControl = ButtonCommit
  BorderStyle = bsDialog
  Caption = 'Operations Form'
  ClientHeight = 262
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 508
    Height = 262
    Align = alClient
    Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1083#1072#1088
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1072#1076#1099
      TabOrder = 0
      ExplicitTop = 16
      DesignSize = (
        504
        27)
      object OperationName: TDBEdit
        Left = 100
        Top = 2
        Width = 402
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'NAME'
        DataSource = TuningDataModule.DSSettings
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 42
      Width = 504
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1044#1077#1073#1077#1090' '#1097#1077#1089#1072#1073
      TabOrder = 1
      ExplicitTop = 43
      DesignSize = (
        504
        24)
      object EDebt: TEdit
        Left = 100
        Top = 2
        Width = 190
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = EDebtChange
        OnEnter = EDebtEnter
        OnExit = EDebtExit
        OnKeyDown = EDebtKeyDown
      end
      object DBLookupDebt: TDBLookupComboBox
        Left = 292
        Top = 2
        Width = 210
        Height = 21
        DataField = 'DEBT'
        DataSource = TuningDataModule.DSSettings
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = TuningDataModule.DSDebtAccount
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 120
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1050#1088#1077#1076#1080#1090
      TabOrder = 4
      ExplicitTop = 121
      DesignSize = (
        504
        27)
      object EAdditionalCredit: TEdit
        Left = 100
        Top = 2
        Width = 190
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = EDebtChange
        OnEnter = EDebtEnter
        OnExit = EDebtExit
        OnKeyDown = EDebtKeyDown
      end
      object DBLookupAdditionalCredit: TDBLookupComboBox
        Left = 292
        Top = 2
        Width = 210
        Height = 21
        DataField = 'ADDITIONALCREDIT'
        DataSource = TuningDataModule.DSSettings
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = TuningDataModule.DSDebtAccount
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 147
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 5
      ExplicitTop = 148
      DesignSize = (
        504
        27)
      object Assignment: TDBEdit
        Left = 103
        Top = 2
        Width = 399
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'ASSIGNMENT'
        DataSource = TuningDataModule.DSSettings
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 174
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 6
      ExplicitTop = 175
      DesignSize = (
        504
        27)
      object ComAssignment: TDBEdit
        Left = 155
        Top = 2
        Width = 347
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'COMMISIONASSIGNMENT'
        DataSource = TuningDataModule.DSSettings
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 201
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      TabOrder = 7
      ExplicitTop = 202
      DesignSize = (
        504
        27)
      object CBCheckUser: TComboBox
        Left = 1
        Top = 2
        Width = 502
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        TabOrder = 0
        Items.Strings = (
          'Sazlama b'#252't'#252'n istifad'#601#231'il'#601'r '#252#231#252'nd'#252'r'
          'Sazlama yaln'#305'z cari istifad'#601#231'i '#252#231#252'nd'#252'r')
      end
    end
    object Panel7: TPanel
      Left = 2
      Top = 66
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073
      TabOrder = 2
      ExplicitTop = 67
      DesignSize = (
        504
        27)
      object ECredit: TEdit
        Left = 100
        Top = 2
        Width = 190
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = EDebtChange
        OnEnter = EDebtEnter
        OnExit = EDebtExit
        OnKeyDown = EDebtKeyDown
      end
      object DBLookupCredit: TDBLookupComboBox
        Left = 292
        Top = 2
        Width = 210
        Height = 21
        DataField = 'CREDIT'
        DataSource = TuningDataModule.DSSettings
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = TuningDataModule.DSDebtAccount
        TabOrder = 1
      end
    end
    object Panel8: TPanel
      Left = 2
      Top = 93
      Width = 504
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1044#1077#1073#1077#1090
      TabOrder = 3
      ExplicitTop = 94
      DesignSize = (
        504
        27)
      object EAdditionalDebt: TEdit
        Left = 100
        Top = 2
        Width = 190
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = EDebtChange
        OnEnter = EDebtEnter
        OnExit = EDebtExit
        OnKeyDown = EDebtKeyDown
      end
      object DBLookupAdditionalDebt: TDBLookupComboBox
        Left = 292
        Top = 2
        Width = 210
        Height = 21
        DataField = 'ADDITIONALDEBT'
        DataSource = TuningDataModule.DSSettings
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = TuningDataModule.DSDebtAccount
        TabOrder = 1
      end
    end
    object ButtonCommit: TButton
      Left = 328
      Top = 232
      Width = 81
      Height = 27
      Action = ActionCommit
      Default = True
      TabOrder = 8
    end
    object ButtonCancel: TButton
      Left = 411
      Top = 232
      Width = 81
      Height = 27
      Action = ActionCancel
      TabOrder = 9
    end
  end
  object ActionList1: TActionList
    Left = 88
    Top = 216
    object ActionCommit: TAction
      Caption = #1043#1103#1073#1091#1083
      OnExecute = ActionCommitExecute
      OnUpdate = ActionCommitUpdate
    end
    object ActionCancel: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = ActionCancelExecute
    end
  end
end

object TrchAddForm: TTrchAddForm
  Left = 322
  Top = 332
  BorderIcons = [biSystemMenu]
  ClientHeight = 149
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 113
    Align = alTop
    Caption = 'Tran'#351
    TabOrder = 0
    ExplicitWidth = 473
    object Label1: TLabel
      Left = 298
      Top = 47
      Width = 69
      Height = 14
      Caption = 'Verilm'#601' tarix : '
    end
    object Label2: TLabel
      Left = 298
      Top = 78
      Width = 70
      Height = 14
      Caption = 'Mzbl'#601#287'          : '
    end
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 38
      Height = 14
      Caption = #214'ht'#601'lik: '
    end
    object TrancheDatePckr: TDateTimePicker
      Left = 376
      Top = 43
      Width = 131
      Height = 21
      Date = 38195.537546400500000000
      Time = 38195.537546400500000000
      Enabled = False
      TabOrder = 0
    end
    object TrancheSumEdit: TCMCurrencyEdit
      Left = 376
      Top = 73
      Width = 131
      Height = 22
      TabOrder = 1
      Text = '0'
      OnKeyPress = TrancheSumEditKeyPress
    end
    object CBPrcessTransactions: TCheckBox
      Left = 4
      Top = 92
      Width = 288
      Height = 18
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090' '#1072#1087#1072#1088#1099#1083#1089#1099#1085
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 3
      Top = 46
      Width = 292
      Height = 44
      TabOrder = 3
      object StaticText3: TStaticText
        Left = 1
        Top = 1
        Width = 290
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Cari hesab'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object AccountListCB: TDBLookupComboboxEh
        Left = 1
        Top = 18
        Width = 289
        Height = 22
        TabStop = False
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ACCID'
        ListField = 'ACCOUNTNUMBER'
        ListSource = TrancheDataModule.DataSrcTrancheAccounts
        TabOrder = 1
        Visible = True
      end
    end
    object DBEdit1: TDBEdit
      Left = 57
      Top = 17
      Width = 163
      Height = 22
      TabStop = False
      Color = clInfoBk
      DataField = 'OBLIGATION'
      DataSource = TrancheDataModule.DataSrcCreditInfo
      ReadOnly = True
      TabOrder = 4
    end
  end
  object ButtonCommit: TButton
    Left = 335
    Top = 121
    Width = 81
    Height = 27
    Action = ActnProcessTranche
    Caption = '&Q'#601'bul'
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 417
    Top = 121
    Width = 81
    Height = 27
    Action = ActnCancelTranche
    Caption = '&'#304'mtina'
    TabOrder = 2
  end
  object ActionsList: TActionList
    Left = 72
    Top = 104
    object ActnProcessTranche: TAction
      Caption = '&'#1043#1103#1073#1091#1083
      OnExecute = ActnProcessTrancheExecute
      OnUpdate = ActnProcessTrancheUpdate
    end
    object ActnCancelTranche: TAction
      Caption = #1048'&'#1084#1090#1080#1085#1072
      OnExecute = ActnCancelTrancheExecute
    end
  end
end

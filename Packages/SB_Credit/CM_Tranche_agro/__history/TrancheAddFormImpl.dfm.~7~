object TrchAddForm: TTrchAddForm
  Left = 322
  Top = 332
  BorderIcons = [biSystemMenu]
  ClientHeight = 149
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 513
    Height = 113
    Align = alTop
    Caption = 'Tran'#351
    TabOrder = 0
    object Label1: TLabel
      Left = 298
      Top = 47
      Width = 71
      Height = 13
      Caption = 'Verilm'#601' tarixi : '
    end
    object Label2: TLabel
      Left = 299
      Top = 76
      Width = 71
      Height = 13
      Caption = 'M'#601'bl'#601#287'          : '
    end
    object Label3: TLabel
      Left = 4
      Top = 19
      Width = 43
      Height = 13
      Caption = #214'ht'#601'lik : '
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
      Height = 21
      TabOrder = 1
      Text = '0'
      OnKeyPress = TrancheSumEditKeyPress
    end
    object CBPrcessTransactions: TCheckBox
      Left = 6
      Top = 92
      Width = 288
      Height = 18
      Caption = #399'm'#601'liyyat apar'#305'ls'#305'n'
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
        ExplicitWidth = 65
      end
      object AccountListCB: TDBLookupComboboxEh
        Left = 1
        Top = 18
        Width = 289
        Height = 21
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
      Left = 47
      Top = 16
      Width = 163
      Height = 21
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
    Caption = #304'mtina'
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

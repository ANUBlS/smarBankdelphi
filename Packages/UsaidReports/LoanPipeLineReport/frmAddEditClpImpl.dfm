object frmAddEditClp: TfrmAddEditClp
  Left = 293
  Top = 172
  BorderIcons = [biSystemMenu]
  Caption = 'frmAddEditClp'
  ClientHeight = 223
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 181
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 286
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 87
      Height = 14
      Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1072#1076#1099
    end
    object Label2: TLabel
      Left = 10
      Top = 41
      Width = 75
      Height = 14
      Caption = #1064'.'#1058'.'#1057':  '#1057#1077#1088#1080#1081#1072
    end
    object Label3: TLabel
      Left = 10
      Top = 69
      Width = 38
      Height = 14
      Caption = #1052#1103#1073#1083#1103#1100
    end
    object Label4: TLabel
      Left = 10
      Top = 100
      Width = 76
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
    end
    object Label5: TLabel
      Left = 10
      Top = 130
      Width = 43
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072
    end
    object Label6: TLabel
      Left = 10
      Top = 157
      Width = 38
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083
    end
    object Label7: TLabel
      Left = 162
      Top = 41
      Width = 13
      Height = 14
      Caption = #8470
    end
    object DBEditEh1: TDBEditEh
      Left = 92
      Top = 9
      Width = 213
      Height = 22
      DataField = 'CUSTOMERNAME'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBEditEh2: TDBEditEh
      Left = 178
      Top = 37
      Width = 126
      Height = 22
      DataField = 'CUSTOMERID'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBEditEh3: TDBEditEh
      Left = 92
      Top = 65
      Width = 213
      Height = 22
      DataField = 'LOANAMOUNT'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      EditButtons = <>
      TabOrder = 3
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 92
      Top = 95
      Width = 213
      Height = 22
      DataField = 'CREDITTYPE'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'DESCRIPTION'
      ListSource = dmLoanPipeLineReport.crdClpds
      TabOrder = 4
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 92
      Top = 122
      Width = 213
      Height = 22
      DataField = 'CURRENCY'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'VALUTE'
      ListField = 'VALU_NAME'
      ListSource = dmLoanPipeLineReport.valutesclpds
      TabOrder = 5
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBLookupComboboxEh3: TDBLookupComboboxEh
      Left = 92
      Top = 150
      Width = 213
      Height = 22
      DataField = 'BRANCHID'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmLoanPipeLineReport.ffilialds
      TabOrder = 6
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object DBEditEh4: TDBEditEh
      Left = 93
      Top = 37
      Width = 65
      Height = 22
      DataField = 'PASS_SER'
      DataSource = dmLoanPipeLineReport.CrdPipeLinesds
      EditButtons = <>
      TabOrder = 1
      Visible = True
      OnKeyPress = DBEditEh4KeyPress
    end
  end
  object buttonclose: TButton
    Left = 227
    Top = 187
    Width = 76
    Height = 27
    Action = ActionExit
    TabOrder = 3
  end
  object ButtonCancel: TButton
    Left = 137
    Top = 187
    Width = 75
    Height = 27
    Action = ActionCancel
    TabOrder = 2
  end
  object ButtonApply: TButton
    Left = 46
    Top = 187
    Width = 76
    Height = 27
    Action = ActionInsert
    TabOrder = 1
  end
  object ActionList1: TActionList
    Left = 49
    Top = 121
    object ActionInsert: TAction
      Caption = '&'#1043#1103#1073#1091#1083
      OnExecute = ActionInsertExecute
    end
    object ActionCancel: TAction
      Caption = '&'#1048#1084#1090#1080#1085#1072
      OnExecute = ActionCancelExecute
    end
    object ActionExit: TAction
      Caption = #1063#1099#1093#1099#1096
      OnExecute = ActionExitExecute
    end
  end
end

object FrmReferences: TFrmReferences
  Left = 298
  Top = 176
  BorderIcons = [biSystemMenu]
  ClientHeight = 366
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object StatusBar: TStatusBar
    Left = 0
    Top = 347
    Width = 546
    Height = 19
    Panels = <>
    ExplicitTop = 330
    ExplicitWidth = 442
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 546
    Height = 53
    Align = alTop
    Caption = #1043#1080#1081#1084#1103#1090#1083#1103#1088
    TabOrder = 1
    ExplicitWidth = 442
    object ValuesComboBox: TComboBox
      Left = 9
      Top = 17
      Width = 113
      Height = 22
      Style = csDropDownList
      Enabled = False
      TabOrder = 0
    end
    object ValuesEdit: TEdit
      Left = 129
      Top = 17
      Width = 113
      Height = 22
      Enabled = False
      TabOrder = 1
    end
    object BtnApply: TButton
      Left = 258
      Top = 15
      Width = 81
      Height = 27
      Caption = '&'#1043#1103#1073#1091#1083
      Enabled = False
      TabOrder = 2
      OnClick = BtnApplyClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 53
    Width = 546
    Height = 294
    Align = alClient
    Caption = #1042#1077#1088#1080#1083#1103#1085#1083#1103#1088
    TabOrder = 2
    ExplicitWidth = 442
    ExplicitHeight = 277
    object TV: TTreeView
      Left = 2
      Top = 16
      Width = 542
      Height = 276
      Align = alClient
      HotTrack = True
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnChange = TVChange
      ExplicitWidth = 438
      ExplicitHeight = 259
    end
  end
end

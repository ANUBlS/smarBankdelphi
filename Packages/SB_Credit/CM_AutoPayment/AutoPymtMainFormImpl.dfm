object AutoPymtMainForm: TAutoPymtMainForm
  Left = 333
  Top = 249
  BorderIcons = [biSystemMenu]
  ClientHeight = 82
  ClientWidth = 478
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object PanelInfo: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 174
    Top = 46
    Width = 138
    Height = 34
    Action = ActionPayAuto
    BiDiMode = bdLeftToRight
    Caption = '&'#214'd'#601'm'#601'k'
    ParentBiDiMode = False
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 1
    Top = 62
    Width = 161
    Height = 19
    Caption = #1043#1088#1091#1087' '#1097#1072#1083#1099#1085#1076#1072' '#1090#1103#1089#1090#1080#1075#1083#1103#1085#1084#1103' '
    TabOrder = 2
    Visible = False
  end
  object PayActionList: TActionList
    Left = 304
    Top = 40
    object ActionPayAuto: TAction
      Caption = '&'#1070#1076#1103#1084#1103#1082
      OnExecute = ActionPayAutoExecute
      OnUpdate = ActionPayAutoUpdate
    end
  end
end

object FormCorrection: TFormCorrection
  Left = 303
  Top = 158
  BorderIcons = [biSystemMenu]
  Caption = 'FormCorrection'
  ClientHeight = 546
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
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
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 496
    Width = 541
    Height = 50
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096
    TabOrder = 0
    object EditContractno: TEdit
      Left = 2
      Top = 18
      Width = 200
      Height = 22
      TabOrder = 0
      OnKeyPress = EditContractnoKeyPress
    end
    object Button2: TButton
      Left = 360
      Top = 18
      Width = 80
      Height = 27
      Caption = #1048#1084#1090#1080#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 263
      Top = 18
      Width = 81
      Height = 27
      Caption = #1043#1103#1073#1091#1083
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 459
      Top = 18
      Width = 81
      Height = 27
      Caption = #1041#1072#1100#1083#1072
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 541
    Height = 496
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = CRADatMod.CorrectorDatSrc
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbNeverShowEh
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CONTRACTNO'
        Footers = <>
        Title.Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470'-'#1089#1080
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 216
      end
      item
        EditButtons = <>
        FieldName = 'LASTPROCESSDATE'
        Footers = <>
        Title.Caption = #1057#1086#1085' '#1103#1084#1103#1083#1080#1081#1081#1072#1090' '#1090#1072#1088#1080#1093#1080
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 213
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionList: TActionList
    Left = 72
    Top = 152
    object ActionSearch: TAction
      Caption = 'ActionSearch'
      OnExecute = ActionSearchExecute
    end
  end
end

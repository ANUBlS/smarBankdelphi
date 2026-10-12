object FrmFilial: TFrmFilial
  Left = 269
  Top = 217
  ClientHeight = 325
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 666
    Height = 325
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 662
      Height = 279
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = WRSetupDataMod.FilialSrc
      Flat = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1060#1080#1083#1080#1072#1083#1099#1085' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'C_NAME'
          Footers = <>
          Title.Caption = #1060#1080#1083#1080#1072#1083#1099#1085' '#1095#1072#1087' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'DRNAME'
          Footers = <>
          Title.Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1091#1085' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 102
        end
        item
          EditButtons = <>
          FieldName = 'DRFULLNAME'
          Footers = <>
          Title.Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1091#1085'  '#1075#1089#1072' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 112
        end
        item
          EditButtons = <>
          FieldName = 'NNAME'
          Footers = <>
          Title.Caption = #1053#1103#1079#1072#1088#1103#1090#1095#1080#1085#1080#1085' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'NFULLNAME'
          Footers = <>
          Title.Caption = #1053#1103#1079#1072#1088#1103#1090#1095#1080#1085#1080#1085' '#1075#1099#1089#1072' '#1072#1076#1099
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 136
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 294
      Width = 662
      Height = 29
      Align = alBottom
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 405
        Top = 4
        Width = 75
        Height = 25
        Caption = #1043#1103#1073#1091#1083
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 482
        Top = 4
        Width = 75
        Height = 25
        Caption = #1041#1072#1100#1083#1072
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
  end
end

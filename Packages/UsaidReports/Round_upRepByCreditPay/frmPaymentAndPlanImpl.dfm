object frmPaymentAndPlan: TfrmPaymentAndPlan
  Left = 296
  Top = 166
  BorderIcons = [biSystemMenu]
  Caption = 'frmPaymentAndPlan'
  ClientHeight = 346
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 489
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BtnClose: TButton
      Left = 433
      Top = 4
      Width = 87
      Height = 33
      Caption = #1041#1072#1100#1083#1072' !'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 489
    Height = 305
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    HotTrack = True
    MultiLine = True
    ParentFont = False
    RaggedRight = True
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #1070#1076#1103#1084#1103#1083#1080#1076#1080#1088
      ImageIndex = 1
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 277
        Align = alClient
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 479
          Height = 275
          Align = alClient
          Caption = #1070#1076#1103#1084#1103#1083#1080#1076#1080#1088'('#1070#1076#1103#1084#1103' '#1043#1088#1072#1092#1080#1082#1080')'
          TabOrder = 0
          object DBGridEh1: TDBGridEh
            Left = 2
            Top = 17
            Width = 475
            Height = 256
            Align = alClient
            DataGrouping.GroupLevels = <>
            DataSource = dmRepByCreditPay.Plansds
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = 'Azl Sans Serif'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            RowDetailPanel.Color = clBtnFace
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -12
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                EditButtons = <>
                FieldName = 'PAYMENTDATE'
                Footers = <>
                Title.Color = clNavy
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'PRINCIPAL'
                Footers = <>
                Title.Color = clNavy
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'INTEREST'
                Footers = <>
                Title.Color = clNavy
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'SM'
                Footers = <>
                Title.Color = clNavy
                Width = 97
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1070#1076#1103#1084#1080#1096#1076#1080#1088
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 518
        Height = 294
        Align = alClient
        Caption = #1070#1076#1103#1084#1080#1096#1076#1080#1088'('#1102#1076#1103#1085#1080#1096' '#1078#1103#1076#1074#1103#1083#1080')'
        TabOrder = 0
        object DBGridEh2: TDBGridEh
          Left = 2
          Top = 16
          Width = 514
          Height = 276
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmRepByCreditPay.Paymentsds
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = 'Azl Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -12
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'PAYDATE'
              Footers = <>
              Title.Color = clNavy
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'PAYREST'
              Footers = <>
              Title.Color = clNavy
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'PAYINTREST'
              Footers = <>
              Title.Color = clNavy
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'PAYEDPENALTYAMT'
              Footers = <>
              Title.Color = clNavy
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'SM'
              Footers = <>
              Title.Color = clNavy
              Width = 97
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
end

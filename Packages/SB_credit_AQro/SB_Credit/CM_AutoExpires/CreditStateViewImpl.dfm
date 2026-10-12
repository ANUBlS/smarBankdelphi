object frmStateViewer: TfrmStateViewer
  Left = 162
  Top = 192
  Width = 938
  Height = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 437
    Align = alLeft
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 417
      Height = 435
      Align = alClient
      DataSource = DataModAE.DSSchedule
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'PAYMENTDATE'
          Footers = <>
          Title.Color = clHighlight
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'PRINCIPAL'
          Footers = <>
          Title.Color = clHighlight
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'INTEREST'
          Footers = <>
          Title.Color = clHighlight
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Total'
          Footers = <>
          Title.Color = clHighlight
          Width = 100
        end>
    end
  end
  object Panel2: TPanel
    Left = 419
    Top = 0
    Width = 511
    Height = 437
    Align = alClient
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 509
      Height = 435
      Align = alClient
      DataSource = DataModAE.DSPayments
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Azl Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          EditButtons = <>
          FieldName = 'PAYDATE'
          Footers = <>
          Title.Color = clHighlight
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'PAYEDAMT'
          Footers = <>
          Title.Color = clHighlight
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'PAYEDINTAMT'
          Footers = <>
          Title.Color = clHighlight
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'PAYEDDUEAMT'
          Footers = <>
          Title.Color = clHighlight
          Width = 95
        end
        item
          EditButtons = <>
          FieldName = 'PAYEDDUEINTAMT'
          Footers = <>
          Title.Color = clHighlight
          Width = 95
        end>
    end
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = ' редитин в€зийй€ти'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 416
    Top = 16
  end
end

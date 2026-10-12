object CommissionForm: TCommissionForm
  Left = 64
  Top = 12
  Width = 867
  Height = 491
  Caption = 'CommissionForm'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 464
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 859
      Height = 385
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object GridCommission: TDBGrid
        Left = 0
        Top = 0
        Width = 859
        Height = 385
        Align = alClient
        DataSource = TransactionDataModule.CommissionData
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridCommissionDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Ямялиййатын ады'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCOUNT'
            Title.Caption = 'Дебет'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 122
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'DEBITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCOUNT'
            Title.Caption = 'Кредит'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 122
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'CREDITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADEBITACCOUNT'
            Title.Caption = 'Комиссийа дебет'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 122
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'ADEBITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACREDITACCOUNT'
            Title.Caption = 'Комиссийа кредит'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 122
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'ACREDITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 431
      Width = 859
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtonRefresh: TButton
        Left = 703
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Йениля'
        TabOrder = 0
        OnClick = ButtonRefreshClick
      end
      object ButtonClose: TButton
        Left = 782
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Баьла'
        TabOrder = 1
        OnClick = ButtonCloseClick
      end
      object Button3: TButton
        Left = 624
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Ялавя'
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 385
      Width = 859
      Height = 46
      Align = alBottom
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 2
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 855
        Height = 21
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Ямялиййатын тяйинаты:'
        TabOrder = 0
        object DBEdit1: TDBEdit
          Left = 102
          Top = 0
          Width = 754
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          DataField = 'ASSIGNMENT'
          DataSource = TransactionDataModule.CommissionData
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 23
        Width = 855
        Height = 21
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Комиссийа ямялиййатынын тяйинаты'
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 156
          Top = 0
          Width = 700
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          DataField = 'COMMISIONASSIGNMENT'
          DataSource = TransactionDataModule.CommissionData
          TabOrder = 0
        end
      end
    end
  end
end

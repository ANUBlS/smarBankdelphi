object CO_Commission: TCO_Commission
  Left = 192
  Top = 107
  Width = 720
  Height = 483
  Caption = 'CO_Commission'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridCommission: TDBGrid
    Left = 0
    Top = 0
    Width = 712
    Height = 377
    Align = alTop
    DataSource = CO_DataMod.comisdata
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = GridCommissionDblClick
    OnTitleClick = GridCommissionTitleClick
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
  object Panel4: TPanel
    Left = 0
    Top = 377
    Width = 712
    Height = 46
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 708
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Ямялиййатын тяйинаты:'
      TabOrder = 0
      object DBEdit1: TDBEdit
        Left = 102
        Top = 0
        Width = 607
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'ASSIGNMENT'
        DataSource = CO_DataMod.comisdata
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 23
      Width = 708
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Комиссийа ямялиййатынын тяйинаты'
      TabOrder = 1
      object DBEdit2: TDBEdit
        Left = 156
        Top = 0
        Width = 553
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'COMMISIONASSIGNMENT'
        DataSource = CO_DataMod.comisdata
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 423
    Width = 712
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ButtonRefresh: TButton
      Left = 556
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Йениля'
      TabOrder = 0
      OnClick = ButtonRefreshClick
    end
    object ButtonClose: TButton
      Left = 635
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Баьла'
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
    object Button3: TButton
      Left = 477
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ялавя'
      TabOrder = 2
      OnClick = Button3Click
    end
    object acc_no: TSearchEdit
      Left = 1
      Top = 1
      Width = 136
      Height = 21
      TabOrder = 3
      Visible = False
      SearchField = 'acc_no'
    end
    object acc_name: TEdit
      Left = 144
      Top = 0
      Width = 129
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object val_acc: TEdit
      Left = 280
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 5
      Visible = False
    end
  end
end

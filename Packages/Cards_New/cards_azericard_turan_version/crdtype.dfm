object Form14: TForm14
  Left = 412
  Top = 474
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1050#1072#1088#1090' '#1090#1080#1087#1083#1103#1088#1080#1085#1080#1085' '#1089#1072#1079#1083#1072#1085#1084#1072#1089#1099
  ClientHeight = 496
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 11
    Width = 96
    Height = 13
    Caption = 'Contract PRODUCT'
  end
  object Label2: TLabel
    Left = 189
    Top = 10
    Width = 39
    Height = 13
    Caption = 'Subtype'
  end
  object Label3: TLabel
    Left = 323
    Top = 9
    Width = 42
    Height = 13
    Caption = 'Currency'
  end
  object Label4: TLabel
    Left = 399
    Top = 10
    Width = 64
    Height = 13
    Caption = 'Service Pack'
  end
  object Label5: TLabel
    Left = 533
    Top = 9
    Width = 64
    Height = 13
    Caption = 'Acnt Scheme'
  end
  object Label6: TLabel
    Left = 643
    Top = 8
    Width = 15
    Height = 13
    Caption = 'Bin'
  end
  object Label7: TLabel
    Left = 705
    Top = 10
    Width = 52
    Height = 13
    Caption = 'Base Code'
  end
  object Label8: TLabel
    Left = 782
    Top = 10
    Width = 47
    Height = 13
    Caption = 'Sub Code'
  end
  object DBGrid1: TDBGrid
    Left = 39
    Top = 96
    Width = 822
    Height = 321
    DataSource = DataMod_CARDS.CARDTYPESSOURCE
    DrawingStyle = gdsGradient
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Contract PRODUCT'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Alignment = taCenter
        Title.Caption = 'Subtype'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURRENCY'
        Title.Alignment = taCenter
        Title.Caption = 'Currency'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICE'
        Title.Alignment = taCenter
        Title.Caption = 'Service Pack'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCHEME'
        Title.Alignment = taCenter
        Title.Caption = 'Acnt Scheme'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIN'
        Title.Alignment = taCenter
        Title.Caption = 'Bin'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_CODE'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUB_CODE'
        Title.Color = clTeal
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 43
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Enter'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 237
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 26
    Width = 137
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 176
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 513
    Top = 26
    Width = 113
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 383
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 304
    Top = 26
    Width = 73
    Height = 21
    KeyField = 'VALU_NAME'
    ListField = 'VAL_NAME'
    ListSource = DataMod_CARDS.valutasorce
    TabOrder = 7
  end
  object Edit4: TEdit
    Left = 630
    Top = 26
    Width = 60
    Height = 21
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 696
    Top = 26
    Width = 71
    Height = 21
    TabOrder = 9
  end
  object Edit7: TEdit
    Left = 773
    Top = 26
    Width = 81
    Height = 21
    TabOrder = 10
  end
  object Button3: TButton
    Left = 139
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 11
    OnClick = Button3Click
  end
end

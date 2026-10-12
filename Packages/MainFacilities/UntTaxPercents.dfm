object FrmTaxPercents: TFrmTaxPercents
  Left = 111
  Top = 176
  Width = 803
  Height = 365
  Caption = 'Accrual  percents  for TAX'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBTaxPercents: TDBGrid
    Left = 0
    Top = 0
    Width = 795
    Height = 257
    Align = alClient
    Color = clBtnFace
    DataSource = MainFDataModule.DSTaxPercents
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
    TitleFont.Style = []
    Columns = <
      item
        Color = clWhite
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'јды'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 222
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'TAX'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = '%'
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
        Color = clWhite
        Expanded = False
        FieldName = 'FIRST_PRICE'
        Title.Alignment = taRightJustify
        Title.Caption = '»лкин д€й€ри'
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
        Color = clWhite
        Expanded = False
        FieldName = 'TAXPERCENTPRICE'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taRightJustify
        Title.Caption = 'Ѕаланс д€й€ри'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 125
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'ALLTAXAMORT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taRightJustify
        Title.Caption = '…ыьылмыш амортизасийа'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'TAXAMORT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taRightJustify
        Title.Caption = ' ющн€лм€ м€бл€ьи'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 115
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 257
    Width = 795
    Height = 26
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Caption = '  јхтарыш панели: '
    TabOrder = 1
    OnMouseMove = Panel1MouseMove
    object LabelPrint: TLabel
      Left = 645
      Top = 7
      Width = 43
      Height = 13
      Cursor = crHandPoint
      Caption = 'F2 -- „ап'
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnClick = LabelPrintClick
      OnMouseMove = LabelPrintMouseMove
    end
    object EName: TEdit
      Left = 82
      Top = 2
      Width = 101
      Height = 21
      TabOrder = 0
      OnChange = ENameChange
      OnExit = ENameExit
    end
    object EFirst_Price: TEdit
      Left = 191
      Top = 2
      Width = 101
      Height = 21
      TabOrder = 1
      OnChange = ENameChange
      OnExit = ENameExit
    end
    object EAllTaxAmort: TEdit
      Left = 300
      Top = 2
      Width = 101
      Height = 21
      TabOrder = 2
      OnChange = ENameChange
      OnExit = ENameExit
    end
    object ETaxAmort: TEdit
      Left = 410
      Top = 2
      Width = 101
      Height = 21
      TabOrder = 3
      OnChange = ENameChange
      OnExit = ENameExit
    end
    object CBGroups: TComboBox
      Left = 522
      Top = 2
      Width = 115
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 4
      OnChange = CBGroupsChange
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 283
    Width = 795
    Height = 55
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 5
      Top = 9
      Width = 95
      Height = 13
      Caption = '»лкин д€й€рл€рин  ж€ми'
    end
    object Label2: TLabel
      Left = 5
      Top = 37
      Width = 105
      Height = 13
      Caption = 'Ѕаланс д€й€рл€рин ж€ми'
    end
    object Label5: TLabel
      Left = 259
      Top = 9
      Width = 94
      Height = 13
      Caption = '…ыьылмыш амортизасийа'
    end
    object Label6: TLabel
      Left = 260
      Top = 37
      Width = 83
      Height = 13
      Caption = ' ющн€лм€ мигдары'
    end
    object EFPrice: TEdit
      Left = 117
      Top = 2
      Width = 133
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object EBPrice: TEdit
      Left = 117
      Top = 29
      Width = 133
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object EAmort: TEdit
      Left = 356
      Top = 2
      Width = 130
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object ERest: TEdit
      Left = 356
      Top = 30
      Width = 130
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 352
    Top = 64
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 400
    Top = 64
  end
end

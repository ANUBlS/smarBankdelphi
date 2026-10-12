object FrmDeletedConts: TFrmDeletedConts
  Left = 86
  Top = 203
  Width = 830
  Height = 408
  Caption = 'FrmDeletedConts'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridDeletedConts: TDBGrid
    Left = 0
    Top = 0
    Width = 822
    Height = 352
    Align = alClient
    DataSource = DataModC.DS_DeletedConts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridDeletedContsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'Kod'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRACT_NUM'
        Title.Caption = 'Мцгавиля'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABONENT'
        Title.Caption = 'Абунячи'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Caption = 'Щесаб'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENGINEER'
        Title.Caption = 'Мцщяндис'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PACKAGENAME'
        Title.Caption = 'Пакет'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTPLC'
        Title.Caption = 'Йери'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REST_R'
        Title.Caption = 'Галыг'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CALCAGS'
        Title.Caption = 'Щесабланыр'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LASTCALCDATE'
        Title.Caption = 'Сон Щес. тарихи'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'USNAME'
        Title.Caption = 'Истифадячи'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = False
      end>
  end
  object PnlAlBottom: TPanel
    Left = 0
    Top = 352
    Width = 822
    Height = 29
    Align = alBottom
    TabOrder = 1
    object EdtSrchID: TEdit
      Left = 3
      Top = 3
      Width = 56
      Height = 21
      TabOrder = 0
      OnChange = EdtSrchIDChange
    end
    object EdtSrchContractNum: TEdit
      Left = 60
      Top = 3
      Width = 67
      Height = 21
      TabOrder = 1
      OnChange = EdtSrchContractNumChange
    end
    object EdtSrchABN: TEdit
      Left = 127
      Top = 3
      Width = 246
      Height = 21
      TabOrder = 2
      OnChange = EdtSrchABNChange
    end
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 144
    Top = 104
    object N1: TMenuItem
      Caption = 'Йенилямяк'
      OnClick = N1Click
      OnDrawItem = N1DrawItem
    end
    object N2: TMenuItem
      Caption = 'Бярпа етмяк'
      OnClick = N2Click
      OnDrawItem = N1DrawItem
    end
  end
end

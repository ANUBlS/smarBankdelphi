object frmArchive: TfrmArchive
  Left = 212
  Top = 170
  Width = 696
  Height = 480
  Caption = 'Arxiv'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 412
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 684
      Height = 408
      Align = alClient
      DataSource = DataModuleTicketMan.Archive
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = Button2Click
      Columns = <
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNUM'
          Title.Caption = '№'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PDATE'
          Title.Caption = 'Тарих'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AMMOUNT'
          Title.Caption = 'Мябляь'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DBANKNAME'
          Title.Caption = 'Кючцрян банк'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KBANKNAME'
          Title.Caption = 'Бенефисар'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Button1: TButton
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Баьла'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Тикетин чапы'
      TabOrder = 1
      OnClick = Button2Click
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 8
      Top = 8
      Width = 161
      Height = 19
      DropDownBox.Sizable = True
      EditButtons = <>
      Flat = True
      KeyField = 'ID'
      ListField = 'REPORTNAME'
      ListSource = DataModuleTicketMan.Settings
      TabOrder = 2
      Visible = True
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 456
      Top = 8
      Width = 121
      Height = 19
      DropDownBox.Sizable = True
      EditButtons = <>
      Flat = True
      KeyField = 'ID'
      ListField = 'PRIVDESC'
      ListSource = DataModuleTicketMan.Statuses
      TabOrder = 3
      Visible = True
      OnChange = DBLookupComboboxEh2Change
    end
    object Button3: TButton
      Left = 352
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Юдямя тапшырыьы'
      TabOrder = 4
      OnClick = Button3Click
    end
    object cbPDCopy: TCheckBox
      Left = 272
      Top = 13
      Width = 73
      Height = 17
      Caption = 'Копйасы иля'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object PopupMenu1: TPopupMenu
    Images = TicketsManager.imgsTM
    Left = 216
    Top = 104
    object dsf1: TMenuItem
      Caption = 'Статусу дяйиш'
      ImageIndex = 2
      OnClick = dsf1Click
      OnDrawItem = dsf1DrawItem
    end
  end
end

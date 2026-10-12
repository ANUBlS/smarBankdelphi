object AzipsSettings: TAzipsSettings
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'AzipsSettings'
  ClientHeight = 351
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 203
    Width = 776
    Height = 117
    TabOrder = 2
    object Label1: TLabel
      Left = 214
      Top = 21
      Width = 79
      Height = 13
      Caption = 'Komissiya Hesab'
    end
    object Label2: TLabel
      Left = 6
      Top = 21
      Width = 65
      Height = 13
      Caption = 'Muxbir Hesab'
    end
    object Label3: TLabel
      Left = 408
      Top = 21
      Width = 20
      Height = 13
      Caption = 'Filial'
    end
    object Label4: TLabel
      Left = 657
      Top = 21
      Width = 36
      Height = 13
      Caption = 'Valyuta'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 6
      Top = 40
      Width = 195
      Height = 21
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = SWDataModule.mbacc_dt
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 207
      Top = 40
      Width = 195
      Height = 21
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = SWDataModule.comaacc_dt
      TabOrder = 1
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 408
      Top = 40
      Width = 195
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = SWDataModule.azpfil
      TabOrder = 2
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 620
      Top = 40
      Width = 133
      Height = 21
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = SWDataModule.azpval_dt
      TabOrder = 3
    end
    object BTnsave: TButton
      Left = 6
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Yadda Saxla'
      TabOrder = 4
      OnClick = BTnsaveClick
    end
    object BTNEXIT: TButton
      Left = 688
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Bagla'
      TabOrder = 5
      OnClick = BTNEXITClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 776
    Height = 209
    Align = alTop
    DataSource = SWDataModule.azpsett_dt
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ACCOUNT_BACC'
        Title.Caption = 'MUXBIR HESAB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCOUNT_CACC'
        Title.Caption = 'KOMISSIYA HESAB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRANCH_NAME'
        Title.Caption = 'FILIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUTE_NAME'
        Title.Caption = 'VALUTA'
        Visible = True
      end>
  end
  object BTNadd: TButton
    Left = 0
    Top = 326
    Width = 75
    Height = 25
    Caption = #399'lav'#601' Et'
    TabOrder = 1
    OnClick = BTNaddClick
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 96
    object S1: TMenuItem
      Caption = 'Sil'
      OnClick = S1Click
    end
  end
end

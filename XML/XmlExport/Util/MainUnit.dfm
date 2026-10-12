object Form1: TForm1
  Left = 224
  Top = 188
  Width = 391
  Height = 338
  Caption = 'Unicode Shower'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SBBrowse: TSpeedButton
    Left = 352
    Top = 8
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = SBBrowseClick
  end
  object Label1: TLabel
    Left = 9
    Top = 40
    Width = 22
    Height = 13
    Caption = 'Field'
  end
  object Label2: TLabel
    Left = 184
    Top = 80
    Width = 62
    Height = 13
    Caption = 'Field Position'
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 337
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 245
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Show Code'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object TntDBEdit1: TTntDBEdit
    Left = 8
    Top = 96
    Width = 160
    Height = 21
    DataSource = DataSourceMain
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 58
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = ComboBox1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 128
    Width = 383
    Height = 183
    Align = alBottom
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 381
      Height = 181
      Align = alClient
      DataSource = DataSourceMain
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Edit2: TEdit
    Left = 184
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 328
    Top = 96
    Width = 33
    Height = 21
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Datafiles (*.dbf)|*.db;*dbf'
    Left = 184
    Top = 48
  end
  object TableMain: TTable
    Left = 216
    Top = 56
  end
  object DataSourceMain: TDataSource
    DataSet = TableMain
    Left = 248
    Top = 40
  end
end

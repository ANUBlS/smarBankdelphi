object Ceskform: TCeskform
  Left = 269
  Top = 239
  Width = 870
  Height = 640
  Caption = 'Ceskform'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 369
    Height = 561
    Caption = 'MT'
    TabOrder = 0
  end
  object GroupBox2: TGroupBox
    Left = 416
    Top = 18
    Width = 425
    Height = 560
    Caption = 'ћцшт€ри щаггында м€лумат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 160
      Top = 139
      Width = 56
      Height = 13
      Caption = 'ўесабын ады'
    end
    object Label2: TLabel
      Left = 160
      Top = 208
      Width = 65
      Height = 13
      Caption = 'ћцшт€ринин ады'
    end
    object Label3: TLabel
      Left = 117
      Top = 40
      Width = 31
      Height = 13
      Caption = 'ўесаб'
    end
    object DBEdit1: TDBEdit
      Left = 32
      Top = 163
      Width = 350
      Height = 21
      DataField = 'NAME'
      DataSource = SWDataModule.Account_sw
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 35
      Top = 235
      Width = 350
      Height = 21
      DataField = 'NAME'
      DataSource = SWDataModule.customer
      TabOrder = 1
    end
    object SearchEdit1: TSearchEdit
      Left = 184
      Top = 38
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = SearchEdit1Change
      DataSource = SWDataModule.Account_sw
      SearchField = 'ACC_NO'
    end
  end
end

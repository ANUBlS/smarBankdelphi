object settings: Tsettings
  Left = 0
  Top = 0
  Caption = 'Tesdiq'
  ClientHeight = 300
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 765
    Height = 219
    Align = alClient
    TabOrder = 13
    object Label1: TLabel
      Left = 312
      Top = 193
      Width = 52
      Height = 19
      Caption = 'T'#601'yinat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 624
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      Visible = False
    end
    object RadioGroup1: TRadioGroup
      Left = 0
      Top = 1
      Width = 745
      Height = 183
      DragMode = dmAutomatic
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object Edit2: TEdit
      Left = 584
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit2'
      Visible = False
    end
    object Button1: TButton
      Left = 218
      Top = 192
      Width = 80
      Height = 25
      Caption = 'T'#601'yinat'#305' D'#601'yi'#351
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object RadioButton1: TRadioButton
    Left = 464
    Top = 301
    Width = 265
    Height = 17
    Caption = 'Banklarla hesabla'#351'ma'
    TabOrder = 0
    Visible = False
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 464
    Top = 417
    Width = 217
    Height = 17
    Caption = 'Xarici valyuta sat'#305#351#305'ndan daxil olan v'#601'sait'
    TabOrder = 1
    Visible = False
    OnClick = RadioButton2Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 765
    Height = 81
    Align = alTop
    DataSource = SWDataModule.tesdiqin
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACOUNT'
        Title.Caption = 'HESAB'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERANCE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALU'
        Title.Caption = 'M'#399'BL'#399#286
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUTE'
        Title.Caption = 'VALYUTA'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BNK_VOIN'
        Title.Caption = 'VOEN'
        Width = 120
        Visible = True
      end>
  end
  object tsd: TButton
    Left = 8
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Tesdiq et'
    TabOrder = 3
    OnClick = tsdClick
  end
  object RadioButton3: TRadioButton
    Left = 584
    Top = 255
    Width = 169
    Height = 17
    Caption = 'Az'#601'rikart klirinqin n'#601'tic'#601'si'
    TabOrder = 4
    Visible = False
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 600
    Top = 301
    Width = 193
    Height = 17
    Caption = 'AZ'#304'PS xidm'#601't haqq'#305
    TabOrder = 5
    Visible = False
    OnClick = RadioButton4Click
  end
  object RadioButton5: TRadioButton
    Left = 584
    Top = 217
    Width = 193
    Height = 17
    Caption = 'X'#214'HKS xidm'#601't haqq'#305#305
    TabOrder = 6
    Visible = False
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 576
    Top = 176
    Width = 257
    Height = 17
    Caption = 'BKM klirinqin n'#601'tic'#601'si'
    TabOrder = 7
    Visible = False
    OnClick = RadioButton6Click
  end
  object RadioButton7: TRadioButton
    Left = 576
    Top = 232
    Width = 281
    Height = 17
    Caption = 'X'#214'HKS klirinqin n'#601'tic'#601'si'
    TabOrder = 8
    Visible = False
    OnClick = RadioButton7Click
  end
  object RadioButton8: TRadioButton
    Left = 600
    Top = 199
    Width = 129
    Height = 17
    Caption = 'Xarici valyutan'#305'n al'#305#351#305
    TabOrder = 9
    Visible = False
    OnClick = RadioButton8Click
  end
  object RadioButton10: TRadioButton
    Left = 464
    Top = 383
    Width = 217
    Height = 17
    Caption = 'Xarici valyuta sat'#305#351#305'ndan daxil olan v'#601'sait'
    TabOrder = 10
    Visible = False
    OnClick = RadioButton10Click
  end
  object RadioButton11: TRadioButton
    Left = 464
    Top = 317
    Width = 265
    Height = 17
    Caption = 'X'#214'HKS klirinqin n'#601'tic'#601'si'
    TabOrder = 11
    Visible = False
    OnClick = RadioButton11Click
  end
  object RadioButton12: TRadioButton
    Left = 464
    Top = 360
    Width = 177
    Height = 17
    Caption = 'Xarici valyuta sat'#305#351#305
    TabOrder = 12
    Visible = False
    OnClick = RadioButton12Click
  end
  object RadioButton13: TRadioButton
    Left = 631
    Top = 167
    Width = 225
    Height = 17
    Caption = 'Xarici valyuta sat'#305#351#305'ndan daxil olan v'#601'sait'
    TabOrder = 14
    Visible = False
    OnClick = RadioButton13Click
  end
  object RadioButton15: TRadioButton
    Left = 631
    Top = 112
    Width = 169
    Height = 17
    Caption = 'Depozit c'#601'lb edilm'#601'si '
    TabOrder = 15
    Visible = False
    OnClick = RadioButton15Click
  end
  object RadioButton16: TRadioButton
    Left = 631
    Top = 125
    Width = 169
    Height = 17
    Caption = 'Depozit c'#601'lb edilm'#601'si Valyuta'
    TabOrder = 16
    Visible = False
    OnClick = RadioButton16Click
  end
  object CheckBox1: TCheckBox
    Left = 464
    Top = 406
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 17
    Visible = False
    OnClick = CheckBox1Click
  end
  object Edit3: TEdit
    Left = 385
    Top = 276
    Width = 368
    Height = 21
    TabOrder = 18
  end
end

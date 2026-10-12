object ExpAccType: TExpAccType
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'ExpAccType'
  ClientHeight = 327
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 263
    Height = 327
    AutoSize = True
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 261
      Height = 325
      Align = alClient
      Caption = 'Hesab'#305'n Sazlamas'#305
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 182
        Width = 257
        Height = 81
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        Visible = False
        object Label5: TLabel
          Left = 6
          Top = 3
          Width = 223
          Height = 13
          Caption = 'Debet Hesab'#305'n(ba'#351' ofis) '#8470'(2803-2813)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 6
          Top = 37
          Width = 229
          Height = 13
          Caption = 'Kredit  Hesab'#305'n (ba'#351' ofis) '#8470'(2803-2813)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboboxEh3: TDBLookupComboboxEh
          Left = 1
          Top = 18
          Width = 254
          Height = 21
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = ExpAllParametr.BDebetDataSource
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh4: TDBLookupComboboxEh
          Left = 1
          Top = 53
          Width = 254
          Height = 21
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = ExpAllParametr.BKredetDataSource
          TabOrder = 1
          Visible = True
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 263
        Width = 257
        Height = 60
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Button2: TButton
          Left = 125
          Top = 13
          Width = 98
          Height = 35
          Caption = #304'mtina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style = bsCommandLink
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 16
          Top = 13
          Width = 98
          Height = 35
          Caption = 'Q'#601'bul'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Style = bsCommandLink
          TabOrder = 1
          OnClick = Button1Click
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 99
        Width = 257
        Height = 83
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 236
          Height = 13
          Caption = 'Debet Hesab'#305'n '#8470'(4509-4159-2803-2813)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 40
          Width = 239
          Height = 13
          Caption = 'Kredit  Hesab'#305'n '#8470'(4509-4519-4803-4813)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Left = 1
          Top = 18
          Width = 254
          Height = 21
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = ExpAllParametr.DebetDataSource
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh2: TDBLookupComboboxEh
          Left = 1
          Top = 57
          Width = 254
          Height = 21
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = ExpAllParametr.KredetDataSource
          TabOrder = 1
          Visible = True
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 15
        Width = 257
        Height = 84
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 25
          Height = 13
          Caption = 'Filial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 6
          Top = 42
          Width = 43
          Height = 13
          Caption = 'Valyuta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 1
          Top = 18
          Width = 164
          Height = 21
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = ExpAllParametr.FilialDataSource
          TabOrder = 0
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 3
          Top = 58
          Width = 145
          Height = 21
          KeyField = 'VALUTE'
          ListField = 'VAL_NAME'
          ListSource = ExpAllParametr.ValyutaDataSource
          TabOrder = 1
        end
      end
    end
  end
end

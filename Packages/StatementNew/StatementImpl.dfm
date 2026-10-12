object StatementX: TStatementX
  Left = 372
  Top = 123
  Width = 504
  Height = 439
  Caption = 'StatementX'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 1
    Top = 1
    Width = 479
    Height = 344
    Caption = 'ўесаблардан чыхарышлар'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 9
      Top = 65
      Width = 457
      Height = 264
      Caption = '„ыхарышын сечм€л€ри :'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 92
        Width = 81
        Height = 13
        Caption = 'ўесабын нюмр€си:'
      end
      object Label4: TLabel
        Left = 8
        Top = 54
        Width = 78
        Height = 13
        Caption = 'ћцшт€ринин коду:'
      end
      object Label3: TLabel
        Left = 8
        Top = 134
        Width = 83
        Height = 13
        Caption = 'Ѕаланс щесаб(лар)ы'
      end
      object Label5: TLabel
        Left = 227
        Top = 134
        Width = 106
        Height = 13
        Caption = 'Ѕаланс щесаблар планы :'
      end
      object SpeedButton1: TSpeedButton
        Left = 349
        Top = 183
        Width = 92
        Height = 37
        Caption = 'OK'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 349
        Top = 224
        Width = 92
        Height = 33
        Caption = 'Excel'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object EditAcc_no: TEdit
        Left = 8
        Top = 109
        Width = 442
        Height = 21
        TabOrder = 0
      end
      object EditClientID: TEdit
        Left = 8
        Top = 68
        Width = 442
        Height = 21
        TabOrder = 1
      end
      object Bal_sprEdit: TEdit
        Left = 8
        Top = 151
        Width = 201
        Height = 21
        TabOrder = 2
      end
      object PrintMode_RG: TRadioGroup
        Left = 7
        Top = 179
        Width = 130
        Height = 57
        Caption = '„ап ш€кли'
        ItemIndex = 0
        Items.Strings = (
          'Ѕир с€щиф€д€ ардыжыл'
          'јйры-айры с€щиф€л€рд€')
        TabOrder = 3
      end
      object ComboBoxBalance: TComboBox
        Left = 224
        Top = 151
        Width = 225
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 4
        Items.Strings = (
          '1-жи  щесаблар планы'
          '2-жи  щесаблар планы'
          '3-жи  щесаблар планы'
          '4-жи  щесаблар планы')
      end
      object DBLCBfilial: TDBLookupComboBox
        Left = 156
        Top = 32
        Width = 143
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = StatementDataModNew.DsFials
        TabOrder = 5
      end
      object DBLCBavalute: TDBLookupComboBox
        Left = 8
        Top = 33
        Width = 141
        Height = 21
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = StatementDataModNew.DataSrcCurrency
        TabOrder = 6
      end
      object CBCurrency: TCheckBox
        Left = 9
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Valuta'
        TabOrder = 7
        OnClick = CBCurrencyClick
      end
      object CBFilial: TCheckBox
        Left = 157
        Top = 15
        Width = 97
        Height = 17
        Caption = 'Filial'
        TabOrder = 8
        OnClick = CBFilialClick
      end
      object DBLCBUser: TDBLookupComboBox
        Left = 304
        Top = 31
        Width = 140
        Height = 21
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = StatementDataModNew.DSUser
        TabOrder = 9
      end
      object CBUser: TCheckBox
        Left = 306
        Top = 13
        Width = 72
        Height = 17
        Caption = 'Operator'
        TabOrder = 10
        OnClick = CBUserClick
      end
      object ComboBoxPrint: TComboBox
        Left = 139
        Top = 187
        Width = 142
        Height = 21
        ItemHeight = 13
        TabOrder = 11
        Text = 'Ѕахмаг'
        Items.Strings = (
          'Ѕахмаг'
          '„ап'
          '‘айла эюнд€рм€к')
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 16
      Width = 456
      Height = 45
      Caption = 'ƒювр'
      TabOrder = 1
      object Label8: TLabel
        Left = 142
        Top = 22
        Width = 31
        Height = 13
        Caption = '—ону :'
      end
      object Label7: TLabel
        Left = 3
        Top = 22
        Width = 36
        Height = 13
        Caption = 'явв€ли :'
      end
      object BeginDTPicker: TDateTimePicker
        Left = 43
        Top = 14
        Width = 93
        Height = 21
        CalAlignment = dtaLeft
        Date = 37440.6361865162
        Time = 37440.6361865162
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object EndDTPicker: TDateTimePicker
        Left = 177
        Top = 14
        Width = 92
        Height = 21
        CalAlignment = dtaLeft
        Date = 37440.6363040625
        Time = 37440.6363040625
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object CBTurnOver: TCheckBox
      Left = 353
      Top = 23
      Width = 105
      Height = 17
      Caption = 'ƒюврийй€си оланлар'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CBTurnOverClick
    end
    object CBRateDiff: TCheckBox
      Left = 353
      Top = 39
      Width = 96
      Height = 17
      Caption = ' урс ‘ерги »ле'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CBRateDiffClick
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Text Documents (*.txt)|*.txt'
    Title = 'Export TXT'
    Left = 64
    Top = 371
  end
  object QRTextFilter1: TQRTextFilter
    Left = 104
    Top = 371
  end
  object ImageList1: TImageList
    Left = 24
    Top = 368
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042104210421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318631863186318631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318631863186318631863FF7F
      1042104210421042104210421042FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318631863186318631863FF7F
      1042104210421042104210421042FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318631863186318631863FF7F
      1042104210421042104210421042FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186300001002000000001863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631042FF7F000010421863FF7F
      1000100010001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863FF7FFF7F00001863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318630000FF7F00001863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186300001863186300001863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186318631863186318631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end

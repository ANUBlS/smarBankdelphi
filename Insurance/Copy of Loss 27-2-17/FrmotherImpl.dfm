object Frmother: TFrmother
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 584
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 543
    Width = 674
    Height = 41
    Align = alBottom
    TabOrder = 0
    object XFButton1: TXFButton
      Left = 508
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 589
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 543
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object XFLabel4: TXFLabel
      Left = 26
      Top = 26
      Width = 4
      Height = 14
    end
    object XFGroupBox1: TXFGroupBox
      Left = 1
      Top = 192
      Width = 672
      Height = 350
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object DBMemo1: TDBMemo
        Left = 2
        Top = 161
        Width = 668
        Height = 187
        Align = alClient
        DataField = 'DESCRIPTION'
        DataSource = DmLoss.DSRother_Claim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object XFPanel3: TXFPanel
        Left = 2
        Top = 16
        Width = 668
        Height = 86
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        Visible = False
        object XFLabel6: TXFLabel
          Left = 20
          Top = 61
          Width = 108
          Height = 14
          Caption = 'Yekun z'#601'r'#601'r m'#601'bl'#601#287'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object XFLabel11: TXFLabel
          Left = 286
          Top = 61
          Width = 162
          Height = 14
          Caption = 'S'#305#287'orta '#246'd'#601'ni'#351'inin m'#601'bl'#601#287'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object XFLabel14: TXFLabel
          Left = 20
          Top = 35
          Width = 86
          Height = 14
          Caption = 'Ekspertiza x'#601'rci '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object XFLabel10: TXFLabel
          Left = 20
          Top = 9
          Width = 83
          Height = 14
          Caption = 'Z'#601'r'#601'r n'#246'mr'#601'si'
        end
        object XFSpeedButton1: TXFSpeedButton
          Left = 134
          Top = 5
          Width = 23
          Height = 22
          OnClick = XFSpeedButton1Click
        end
        object DBEdit4: TDBEdit
          Left = 134
          Top = 58
          Width = 145
          Height = 22
          DataField = 'FINAL_AMOUNT_LOSS'
          DataSource = DmLoss.DSClaimDescription
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 453
          Top = 56
          Width = 181
          Height = 22
          DataField = 'FINAL_PAYMENT_AMOUNT_LOSS'
          DataSource = DmLoss.DSClaimDescription
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit10: TDBEdit
          Left = 134
          Top = 32
          Width = 145
          Height = 22
          DataField = 'EKSPERTIZA_AMOUNT'
          DataSource = DmLoss.DSClaimDescription
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object XFPanel4: TXFPanel
          Left = 157
          Top = 3
          Width = 122
          Height = 26
          BevelInner = bvLowered
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object DBEdit5: TDBEdit
            Left = 1
            Top = 2
            Width = 119
            Height = 22
            DataField = 'CLAIM_NUM'
            DataSource = DmLoss.DSClaimDescription
            TabOrder = 0
          end
        end
        object XFGroupBox7: TXFGroupBox
          Left = 406
          Top = 2
          Width = 228
          Height = 29
          TabOrder = 4
          object XFRadioButton2: TXFRadioButton
            Left = 107
            Top = 9
            Width = 113
            Height = 17
            Caption = 'Tam m'#601'hv hal'#305
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object XFRadioButton1: TXFRadioButton
            Left = 3
            Top = 9
            Width = 101
            Height = 17
            Caption = 'Adi z'#601'r'#601'r hal'#305
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object XFGroupBox8: TXFGroupBox
        Left = 2
        Top = 102
        Width = 668
        Height = 59
        Align = alTop
        Caption = 'Imatina haqq'#305'nda m'#601'lumatlar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        object XFLabel36: TXFLabel
          Left = 7
          Top = 20
          Width = 78
          Height = 14
          Caption = #304'mtina m'#601'bl'#601#287'i'
        end
        object XFLabel37: TXFLabel
          Left = 343
          Top = 22
          Width = 71
          Height = 14
          Caption = #304'mtina s'#601'b'#601'bi'
        end
        object XFLabel38: TXFLabel
          Left = 180
          Top = 20
          Width = 63
          Height = 14
          Caption = #304'mtina tarixi'
        end
        object DateTimePicker2: TDateTimePicker
          Left = 249
          Top = 18
          Width = 92
          Height = 22
          Date = 41536.738488449080000000
          Time = 41536.738488449080000000
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 86
          Top = 18
          Width = 94
          Height = 22
          DataField = 'REFUSAL_AMMOUNT'
          DataSource = DmLoss.DSClaimDescription
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 415
          Top = 18
          Width = 220
          Height = 22
          DataField = 'REFUSAL_DESCRIPTION'
          DataSource = DmLoss.DSClaimDescription
          TabOrder = 2
        end
      end
    end
    object XFGroupBox3: TXFGroupBox
      Left = 1
      Top = 1
      Width = 672
      Height = 191
      Align = alClient
      TabOrder = 1
      object XFLabel1: TXFLabel
        Left = 23
        Top = 39
        Width = 85
        Height = 14
        Caption = 'S'#305#287'ortan'#305'n n'#246'v'#252
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel2: TXFLabel
        Left = 345
        Top = 39
        Width = 70
        Height = 14
        Caption = 'Tarix v'#601' saat'#305
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel7: TXFLabel
        Left = 23
        Top = 110
        Width = 78
        Height = 14
        Caption = 'Q'#601'za '#601'm'#601'kda'#351#305
      end
      object XFLabel3: TXFLabel
        Left = 23
        Top = 138
        Width = 84
        Height = 14
        Caption = 'Hadis'#601'nin t'#601'sviri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XFLabel5: TXFLabel
        Left = 345
        Top = 110
        Width = 62
        Height = 14
        Caption = 'T'#601'qsirli '#351#601'xs'
      end
      object XFLabel35: TXFLabel
        Left = 345
        Top = 161
        Width = 69
        Height = 14
        Caption = 'T'#601'qribi z'#601'r'#601'r '
      end
      object Edit1: TEdit
        Left = 110
        Top = 36
        Width = 172
        Height = 22
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 456
        Top = 36
        Width = 181
        Height = 22
        Date = 41456.700851203710000000
        Format = 'dd.MM.yyyy HH:mm:ss'
        Time = 41456.700851203710000000
        DateFormat = dfLong
        Kind = dtkTime
        TabOrder = 1
      end
      object XFGroupBox2: TXFGroupBox
        Left = 23
        Top = 61
        Width = 614
        Height = 40
        Caption = 'Ba'#351' verm'#601' yeri'
        TabOrder = 2
        object XFLabel8: TXFLabel
          Left = 9
          Top = 15
          Width = 33
          Height = 14
          Caption = 'Rayon'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object XFLabel9: TXFLabel
          Left = 322
          Top = 15
          Width = 26
          Height = 14
          Caption = 'K'#252#231#601
        end
        object DBEdit2: TDBEdit
          Left = 433
          Top = 11
          Width = 172
          Height = 22
          DataField = 'STREET'
          DataSource = DmLoss.DSClaimDescription
          TabOrder = 0
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 87
          Top = 13
          Width = 172
          Height = 22
          DataField = 'REGION'
          DataSource = DmLoss.DSClaimDescription
          KeyField = 'CITY_NAME'
          ListField = 'CITY_NAME'
          ListSource = DmLoss.DSRcities
          TabOrder = 1
        end
      end
      object DBEdit1: TDBEdit
        Left = 110
        Top = 134
        Width = 527
        Height = 22
        DataField = 'DETAIL'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 3
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 110
        Top = 107
        Width = 172
        Height = 22
        DataField = 'EMPL_ACC'
        DataSource = DmLoss.DSClaimDescription
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DmLoss.DSRins_dict_employee_acc
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 456
        Top = 107
        Width = 181
        Height = 22
        DataField = 'PERSON'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 5
      end
      object DBEdit23: TDBEdit
        Left = 456
        Top = 159
        Width = 181
        Height = 22
        DataField = 'APPROXIMATE_AMMOUNT'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 6
      end
      object XFCheckBox1: TXFCheckBox
        Left = 110
        Top = 164
        Width = 151
        Height = 17
        Caption = 'Subroqasiya h'#252'ququ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
  end
end

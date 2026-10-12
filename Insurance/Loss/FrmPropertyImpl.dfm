object FrmProperty: TFrmProperty
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #399'mlak s'#305#287'ortas'#305'(z'#601'r'#601'r)'
  ClientHeight = 449
  ClientWidth = 658
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
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 408
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object XFGroupBox1: TXFGroupBox
      Left = 1
      Top = 165
      Width = 656
      Height = 118
      Align = alTop
      TabOrder = 0
      Visible = False
      object XFLabel5: TXFLabel
        Left = 20
        Top = 94
        Width = 108
        Height = 14
        Caption = 'Yekun z'#601'r'#601'r m'#601'bl'#601#287'i'
      end
      object XFLabel10: TXFLabel
        Left = 306
        Top = 94
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
        Top = 60
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
      object XFLabel1: TXFLabel
        Left = 20
        Top = 17
        Width = 45
        Height = 14
        Caption = 'Z'#601'r'#601'r '#8470
      end
      object XFSpeedButton1: TXFSpeedButton
        Left = 145
        Top = 12
        Width = 23
        Height = 22
        OnClick = XFSpeedButton1Click
      end
      object DBEdit3: TDBEdit
        Left = 147
        Top = 91
        Width = 157
        Height = 22
        DataField = 'FINAL_AMOUNT_LOSS'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 0
      end
      object DBEdit10: TDBEdit
        Left = 171
        Top = 50
        Width = 133
        Height = 22
        DataField = 'EKSPERTIZA_AMOUNT'
        DataSource = DmLoss.DSClaimDescription
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 473
        Top = 91
        Width = 168
        Height = 22
        DataField = 'FINAL_PAYMENT_AMOUNT_LOSS'
        DataSource = DmLoss.DSClaimDescription
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object XFPanel3: TXFPanel
        Left = 171
        Top = 10
        Width = 133
        Height = 27
        BevelInner = bvLowered
        TabOrder = 3
        object DBEdit1: TDBEdit
          Left = 2
          Top = 3
          Width = 127
          Height = 22
          DataField = 'CLAIM_NUM'
          DataSource = DmLoss.DSClaimDescription
          TabOrder = 0
        end
      end
      object XFGroupBox7: TXFGroupBox
        Left = 413
        Top = 7
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
      object XFRadioGroup1: TXFRadioGroup
        Left = 466
        Top = 37
        Width = 175
        Height = 50
        Caption = 'Subroqasiya h'#252'ququ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          '   Yox'
          '   H'#601)
        ParentFont = False
        TabOrder = 5
      end
    end
    object XFGroupBox2: TXFGroupBox
      Left = 1
      Top = 1
      Width = 656
      Height = 164
      Align = alTop
      TabOrder = 1
      object XFLabel2: TXFLabel
        Left = 20
        Top = 71
        Width = 70
        Height = 14
        Caption = 'Tarix v'#601' saat'#305
      end
      object XFLabel3: TXFLabel
        Left = 365
        Top = 71
        Width = 78
        Height = 14
        Caption = 'Q'#601'za '#601'm'#601'kda'#351#305
      end
      object XFLabel4: TXFLabel
        Left = 20
        Top = 145
        Width = 84
        Height = 14
        Caption = 'Hadis'#601'nin t'#601'sviri'
      end
      object XFLabel35: TXFLabel
        Left = 20
        Top = 28
        Width = 69
        Height = 14
        Caption = 'T'#601'qribi z'#601'r'#601'r '
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 466
        Top = 65
        Width = 175
        Height = 22
        DataField = 'EMPL_ACC'
        DataSource = DmLoss.DSClaimDescription
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = DmLoss.DSRins_dict_employee_acc
        ParentFont = False
        TabOrder = 0
      end
      object XFGroupBox3: TXFGroupBox
        Left = 20
        Top = 93
        Width = 621
        Height = 40
        Caption = 'Ba'#351' verm'#601' yeri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object XFLabel11: TXFLabel
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
        object XFLabel12: TXFLabel
          Left = 347
          Top = 15
          Width = 26
          Height = 14
          Caption = 'K'#252#231#601
        end
        object DBEdit8: TDBEdit
          Left = 446
          Top = 11
          Width = 172
          Height = 22
          DataField = 'STREET'
          DataSource = DmLoss.DSClaimDescription
          TabOrder = 0
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 127
          Top = 10
          Width = 157
          Height = 22
          DataField = 'REGION'
          DataSource = DmLoss.DSClaimDescription
          KeyField = 'CITY_NAME'
          ListField = 'CITY_NAME'
          ListSource = DmLoss.DSRcities
          TabOrder = 1
        end
      end
      object DateTimePicker14: TDateTimePicker
        Left = 11
        Top = 3
        Width = 79
        Height = 22
        Date = 41457.605588252310000000
        Format = 'dd.MM.yyyy HH:mm:ss'
        Time = 41457.605588252310000000
        DateFormat = dfLong
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object DBEdit2: TDBEdit
        Left = 147
        Top = 136
        Width = 494
        Height = 22
        DataField = 'DETAIL'
        DataSource = DmLoss.DSClaimDescription
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DateTimePicker1: TDBDateTimeEditEh
        Left = 145
        Top = 65
        Width = 159
        Height = 22
        EditButtons = <>
        Kind = dtkDateTimeEh
        TabOrder = 4
        Visible = True
      end
      object DBEdit23: TDBEdit
        Left = 145
        Top = 25
        Width = 159
        Height = 22
        DataField = 'APPROXIMATE_AMMOUNT'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 5
      end
      object XFRadioGroup2: TXFRadioGroup
        Left = 466
        Top = 8
        Width = 175
        Height = 52
        Caption = 'Subroqasiya h'#252'ququ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          '   Yox'
          '   H'#601)
        ParentFont = False
        TabOrder = 6
      end
    end
    object XFGroupBox8: TXFGroupBox
      Left = 1
      Top = 283
      Width = 656
      Height = 124
      Align = alClient
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
      object DBEdit25: TDBEdit
        Left = 417
        Top = 18
        Width = 218
        Height = 22
        DataField = 'REFUSAL_DESCRIPTION'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 85
        Top = 18
        Width = 94
        Height = 22
        DataField = 'REFUSAL_AMMOUNT'
        DataSource = DmLoss.DSClaimDescription
        TabOrder = 2
      end
      object XFRadioGroup3: TXFRadioGroup
        Left = 434
        Top = 46
        Width = 175
        Height = 50
        Caption = 'Subroqasiya h'#252'ququ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          '   Yox'
          '   H'#601)
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 408
    Width = 658
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 461
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 542
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
  end
end

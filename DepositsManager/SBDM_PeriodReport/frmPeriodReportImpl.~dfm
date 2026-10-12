object frmPeriodReport: TfrmPeriodReport
  Left = 268
  Top = 208
  Width = 593
  Height = 380
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Валйута'
      TabOrder = 0
      object CBAvalute: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBValutes: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = dmPeriodReport.valutesDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 390
      Top = 2
      Width = 193
      Height = 58
      Align = alClient
      Caption = 'Депозитин типи'
      TabOrder = 1
      object LCBDepositTypes: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'TYPE'
        ListSource = dmPeriodReport.DepositTypesDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBDepositTypes: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 196
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Филиал'
      TabOrder = 2
      object LCBFilials: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmPeriodReport.FilialsDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBFilial: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 62
    Width = 585
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object GroupBox4: TGroupBox
      Left = 2
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Мцштяри'
      TabOrder = 0
      object CBCustomer: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBCustomer: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmPeriodReport.CustomersDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 390
      Top = 2
      Width = 193
      Height = 58
      Align = alClient
      Caption = 'Щесабын №-си'
      TabOrder = 1
      object LCBAccno: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'CONTRACTACCNO'
        ListSource = dmPeriodReport.DepsDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBAccno: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 196
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин коду'
      TabOrder = 2
      object LCBCodCust: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'KOD'
        ListSource = dmPeriodReport.CustomersDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBCodCust: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 124
    Width = 585
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object GroupBox7: TGroupBox
      Left = 2
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин катеэорийасы'
      TabOrder = 0
      object CBPersons: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBPersons: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmPeriodReport.personsDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 196
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин типи'
      TabOrder = 1
      object LCBCategories: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'CATEGORY'
        ListSource = dmPeriodReport.CategoriesDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBCategories: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox9: TGroupBox
      Left = 390
      Top = 2
      Width = 193
      Height = 58
      Align = alClient
      Caption = 'Жялб олунмуш  депозитляр'
      TabOrder = 2
      object Label1: TLabel
        Left = 91
        Top = 15
        Width = 5
        Height = 20
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CBOpenedDep: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DTPOpenDate: TDateTimePicker
        Left = 5
        Top = 14
        Width = 83
        Height = 21
        CalAlignment = dtaLeft
        Date = 39328.5242440625
        Time = 39328.5242440625
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object DTPCloseDate: TDateTimePicker
        Left = 100
        Top = 14
        Width = 83
        Height = 21
        CalAlignment = dtaLeft
        Date = 39328.5242440625
        Time = 39328.5242440625
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 186
    Width = 585
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object GroupBox10: TGroupBox
      Left = 2
      Top = 2
      Width = 194
      Height = 58
      Align = alLeft
      Caption = 'Мцгавилянин №-си'
      TabOrder = 0
      object CBContractno: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBContractno: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 185
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'CONTRACTNO'
        ListSource = dmPeriodReport.DepsDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox11: TGroupBox
      Left = 336
      Top = 2
      Width = 247
      Height = 58
      Align = alClient
      Caption = 'Депозитин мябляьи'
      TabOrder = 1
      object Label3: TLabel
        Left = 109
        Top = 16
        Width = 5
        Height = 20
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CBDepositAmt: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object EdFamt: TEdit
        Left = 6
        Top = 15
        Width = 100
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object EdSAmt: TEdit
        Left = 117
        Top = 15
        Width = 120
        Height = 21
        TabOrder = 2
        Text = '500000'
      end
    end
    object GroupBox12: TGroupBox
      Left = 196
      Top = 2
      Width = 140
      Height = 58
      Align = alLeft
      Caption = 'Йыьылмыш %'
      TabOrder = 2
      object Label2: TLabel
        Left = 64
        Top = 16
        Width = 5
        Height = 20
        Caption = '-'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CBSumInterest: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object EdFintAmt: TEdit
        Left = 5
        Top = 14
        Width = 55
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object EdSintAmt: TEdit
        Left = 73
        Top = 14
        Width = 60
        Height = 21
        TabOrder = 2
        Text = '500'
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 248
    Width = 585
    Height = 67
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object GroupBox13: TGroupBox
      Left = 2
      Top = 2
      Width = 194
      Height = 63
      Align = alLeft
      Caption = 'Щесабат дюврц'
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 18
        Width = 66
        Height = 13
        Caption = 'Дюврцн яввяли'
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 61
        Height = 13
        Caption = 'Дюврцн сону'
      end
      object DTPbegin: TDateTimePicker
        Left = 81
        Top = 13
        Width = 108
        Height = 21
        CalAlignment = dtaLeft
        Date = 39328.5367178356
        Time = 39328.5367178356
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object DTPend: TDateTimePicker
        Left = 81
        Top = 36
        Width = 108
        Height = 21
        CalAlignment = dtaLeft
        Date = 39328.5367178356
        Time = 39328.5367178356
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object RGStatus: TRadioGroup
      Left = 454
      Top = 2
      Width = 129
      Height = 63
      Align = alLeft
      Caption = 'Статусу'
      ItemIndex = 1
      Items.Strings = (
        'Щесабланан'
        'Щамысы')
      TabOrder = 1
    end
    object RGReport: TRadioGroup
      Left = 196
      Top = 2
      Width = 129
      Height = 63
      Align = alLeft
      Caption = 'Щесабат'
      ItemIndex = 1
      Items.Strings = (
        'Excel'
        'Щесабат')
      TabOrder = 2
    end
    object RGTypes: TRadioGroup
      Left = 325
      Top = 2
      Width = 129
      Height = 63
      Align = alLeft
      Caption = 'Депозитляр'
      ItemIndex = 1
      Items.Strings = (
        'Активляр'
        'Щамысы')
      TabOrder = 3
    end
  end
  object BitBtnOK: TBitBtn
    Left = 338
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Гябул'
    TabOrder = 5
    OnClick = BitBtnOKClick
  end
  object BitBtnRetry: TBitBtn
    Left = 418
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Йенидян'
    TabOrder = 6
    OnClick = BitBtnRetryClick
  end
  object BitBtnClose: TBitBtn
    Left = 507
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Баьла'
    TabOrder = 7
    OnClick = BitBtnCloseClick
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Период щесабаты'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Top = 320
  end
  object ExportDeposits: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 32
    Top = 320
  end
end

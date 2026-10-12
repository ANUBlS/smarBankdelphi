object frmFinishPeriodCredits: TfrmFinishPeriodCredits
  Left = 313
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 342
  ClientWidth = 628
  Color = clBtnFace
  UseDockManager = True
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
    Width = 628
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Валйута'
      TabOrder = 0
      object CBaValute: TCheckBox
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
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = dmFinishPeriodCredits.valutesDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 418
      Top = 2
      Width = 208
      Height = 58
      Align = alClient
      Caption = 'Истифадячи групу'
      TabOrder = 1
      object LCBusergroup: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmFinishPeriodCredits.usrgroupsDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBusergroup: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Филиал'
      TabOrder = 2
      object LCBFilials: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmFinishPeriodCredits.FilialsDatSrc
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
    Width = 628
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object GroupBox4: TGroupBox
      Left = 2
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин типи'
      TabOrder = 0
      object CBCategories: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBCategories: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmFinishPeriodCredits.CategoriesDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox5: TGroupBox
      Left = 418
      Top = 2
      Width = 208
      Height = 58
      Align = alClient
      Caption = 'Кредитин типи'
      TabOrder = 1
      object LCBCreditType: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmFinishPeriodCredits.CreditTypesDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBCreditType: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин катеэорийасы'
      TabOrder = 2
      object LCBPersons: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = dmFinishPeriodCredits.personsDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBPersons: TCheckBox
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
    Width = 628
    Height = 62
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object GroupBox7: TGroupBox
      Left = 2
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Тяснифат '
      TabOrder = 0
      object CBReserve: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBReserve: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCR'
        ListSource = dmFinishPeriodCredits.ReservesDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox8: TGroupBox
      Left = 418
      Top = 2
      Width = 208
      Height = 58
      Align = alClient
      Caption = 'Эировун типи'
      TabOrder = 1
      object LCBpledgid: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPTION'
        ListSource = dmFinishPeriodCredits.pledgsDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBpledgid: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 15
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object GroupBox9: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Эежикмиш тяснифат '
      TabOrder = 2
      object LCBDueReserve: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCR'
        ListSource = dmFinishPeriodCredits.DueReservesDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBDueReserve: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 186
    Width = 628
    Height = 61
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object GroupBox12: TGroupBox
      Left = 2
      Top = 2
      Width = 208
      Height = 57
      Align = alLeft
      Caption = 'Статусу'
      TabOrder = 0
      object CLBStatus: TCheckListBox
        Left = 2
        Top = 15
        Width = 204
        Height = 40
        Align = alClient
        Color = clWhite
        ItemHeight = 13
        Items.Strings = (
          'Щесабланан'
          'Щесабланмасы дайандырылан')
        TabOrder = 0
      end
    end
    object GroupBox10: TGroupBox
      Left = 418
      Top = 2
      Width = 208
      Height = 57
      Align = alClient
      Caption = 'Вахты битмиш  кредитляр'
      TabOrder = 1
      object Label2: TLabel
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
      object DTPCls1: TDateTimePicker
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
        TabOrder = 0
      end
      object DTPCls2: TDateTimePicker
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
        TabOrder = 1
      end
      object CBCloseDep: TCheckBox
        Left = 5
        Top = 40
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 2
      end
    end
    object GroupBox11: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 57
      Align = alLeft
      Caption = 'Верилмиш кредитляр'
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
      object DTPO1: TDateTimePicker
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
      object DTPO2: TDateTimePicker
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
  object BitBtnOk: TBitBtn
    Left = 465
    Top = 314
    Width = 75
    Height = 25
    Caption = 'Гябул'
    TabOrder = 4
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 550
    Top = 313
    Width = 75
    Height = 25
    Caption = 'Имтина'
    TabOrder = 5
    OnClick = BitBtnCancelClick
  end
  object Panel5: TPanel
    Left = 0
    Top = 247
    Width = 628
    Height = 63
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object GroupBox14: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 59
      Align = alLeft
      Caption = 'Мцштяринин коду'
      TabOrder = 0
      object CBCustomerID: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object LCBCustomerID: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'KOD'
        ListSource = dmFinishPeriodCredits.CustomersDatSrc
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox15: TGroupBox
      Left = 2
      Top = 2
      Width = 208
      Height = 59
      Align = alLeft
      Caption = 'Мцштяри'
      TabOrder = 1
      object LCBCustomer: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmFinishPeriodCredits.CustomersDatSrc
        TabOrder = 0
        Visible = True
      end
      object CBCustomer: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
    object RGreport: TRadioGroup
      Left = 418
      Top = 2
      Width = 208
      Height = 59
      Align = alClient
      Caption = 'Щесабат'
      ItemIndex = 1
      Items.Strings = (
        'Excel'
        'Щесабат')
      TabOrder = 2
    end
  end
  object EExport: TCMExcelExport
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
    Left = 8
    Top = 312
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Вахты чатмыш кредитляр цзря щесабат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 40
    Top = 312
  end
end

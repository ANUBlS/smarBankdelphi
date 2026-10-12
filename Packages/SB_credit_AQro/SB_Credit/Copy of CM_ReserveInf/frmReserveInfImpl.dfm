object frmReserveInf: TfrmReserveInf
  Left = 298
  Top = 223
  Width = 429
  Height = 258
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Width = 421
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
        ListSource = dmReserveInf.DatSrcValute
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Филиал'
      TabOrder = 1
      object LCBFilials: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = dmReserveInf.DatSrcFilials
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
    Width = 421
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
        ListSource = dmReserveInf.DatSrctCategories
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox6: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
      Caption = 'Мцштяринин катеэорийасы'
      TabOrder = 1
      object LCBPersons: TDBLookupComboboxEh
        Left = 5
        Top = 15
        Width = 195
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'DESCRIPION'
        ListSource = dmReserveInf.DatSrcPersons
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
    Width = 421
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
      Caption = 'Тарих'
      TabOrder = 0
      object CBReserve: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 0
      end
      object DTPDat: TDateTimePicker
        Left = 7
        Top = 15
        Width = 195
        Height = 21
        CalAlignment = dtaLeft
        Date = 39679.5057721991
        Time = 39679.5057721991
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object GroupBox9: TGroupBox
      Left = 210
      Top = 2
      Width = 208
      Height = 58
      Align = alLeft
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
        ListSource = dmReserveInf.DatSrcCreditTypes
        TabOrder = 0
        Visible = True
      end
      object CBCreditType: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Тятбиг ет'
        TabOrder = 1
      end
    end
  end
  object BitBtnOk: TBitBtn
    Left = 254
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Гябул'
    TabOrder = 3
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 339
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Имтина'
    ModalResult = 2
    TabOrder = 4
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Ещтиййатлар цчцн информасийа типли щесабат'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 40
    Top = 188
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
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 8
    Top = 188
  end
end

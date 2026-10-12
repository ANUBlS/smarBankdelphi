object frmReport: TfrmReport
  Left = 307
  Top = 187
  BorderIcons = [biSystemMenu]
  Caption = 'Balans'
  ClientHeight = 225
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 60
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Valyuta'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'T'#601'tbiq et'
        TabOrder = 0
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'VALUTE'
        ListField = 'VALU_NAME'
        ListSource = ValutesDatSrc
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Filial'
      TabOrder = 1
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = FilialsDatSrc
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object CheckBox2: TCheckBox
        Left = 6
        Top = 38
        Width = 97
        Height = 17
        Caption = 'T'#601'tbiq et'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 60
    Width = 442
    Height = 60
    Align = alTop
    TabOrder = 1
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'M'#252#351't'#601'rinin tipi'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox7: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'T'#601'tbiq et'
        TabOrder = 0
      end
      object DBLookupComboboxEh7: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'CATEGORY'
        ListSource = CustTypeDatSrc
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox9: TGroupBox
      Left = 217
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'M'#252#351't'#601'rinin kateqoriyas'#305
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object CheckBox8: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'T'#601'tbiq et'
        TabOrder = 0
      end
      object DBLookupComboboxEh8: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = PersonsDatSrc
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 120
    Width = 442
    Height = 60
    Align = alTop
    TabOrder = 2
    object GroupBox10: TGroupBox
      Left = 1
      Top = 1
      Width = 216
      Height = 58
      Align = alLeft
      Caption = 'Depozitin n'#246'v'#252
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object CheckBox10: TCheckBox
        Left = 5
        Top = 38
        Width = 97
        Height = 17
        Caption = 'T'#601'tbiq et'
        TabOrder = 0
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 5
        Top = 14
        Width = 204
        Height = 21
        DropDownBox.Sizable = True
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'TYPE'
        ListSource = CredTypeDatScr
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
    end
    object GroupBox11: TGroupBox
      Left = 217
      Top = 1
      Width = 224
      Height = 58
      Align = alClient
      Caption = #1058#1072#1088#1080#1093
      TabOrder = 1
      object Label1: TLabel
        Left = 7
        Top = 35
        Width = 43
        Height = 13
        Caption = 'Son tarix'
      end
      object Label2: TLabel
        Left = 6
        Top = 15
        Width = 69
        Height = 13
        Caption = 'Ba'#351'lan'#287#305'c tarix'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BeginDate: TDateTimePicker
        Left = 92
        Top = 7
        Width = 116
        Height = 21
        Date = 39134.682371956000000000
        Time = 39134.682371956000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object EndDate: TDateTimePicker
        Left = 92
        Top = 33
        Width = 116
        Height = 21
        Date = 39134.682371956000000000
        Time = 39134.682371956000000000
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 267
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 348
    Top = 188
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object Valutes: TOracleDataSet
    SQL.Strings = (
      'select valute,valu_name from avalute_t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000C000000560041004C005500540045000100000000001200
      0000560041004C0055005F004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 5
    Top = 184
    object ValutesVALUTE: TIntegerField
      FieldName = 'VALUTE'
      Required = True
    end
    object ValutesVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 25
    end
  end
  object Filials: TOracleDataSet
    SQL.Strings = (
      'select id,name from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 36
    Top = 184
    object FilialsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object FilialsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 90
    end
  end
  object CustomerTypes: TOracleDataSet
    SQL.Strings = (
      'select id,CATEGORY from sbcm_categories')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000010000000430041005400
      450047004F0052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 66
    Top = 185
    object CustomerTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CustomerTypesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
  end
  object Persons: TOracleDataSet
    SQL.Strings = (
      'select * from sbcm_persons')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 97
    Top = 184
    object PersonsID: TFloatField
      FieldName = 'ID'
    end
    object PersonsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object CreditTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, type'
      '  FROM sbcm_deposit_types')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000002000000040000004900440001000000000008000000540059005000
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 128
    Top = 184
    object CreditTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CreditTypesTYPE: TWideStringField
      FieldName = 'TYPE'
      Size = 256
    end
  end
  object Results: TOracleDataSet
    SQL.Strings = (
      'select '
      '   p.contractno,'
      '   p.opendate,'
      '   p.closedate,'
      '   SBCM_REPORT.get_depositbalance(p.id) as balance,'
      '   SBCM_REPORT.get_depositInterest(p.id) as intrate,'
      '   SBCM_REPORT.get_period(p.id,:bdat ) as period,'
      '   SBCM_REPORT.get_DepositCurrency(p.currency) as valute,'
      '   SBCM_REPORT.get_depositrest(p.id,:bdat) as BRest,'
      '   SBCM_REPORT.get_deposittranche(p.id,:bdat,:edat) as TrAmt,'
      '   SBCM_REPORT.get_depositpayment(p.id,:bdat,:edat) as PayAmt,'
      
        '   SBCM_REPORT.get_depositrest(p.id,:edat) as ERest,round((SBCM_' +
        'REPORT.get_depositInterest(p.id)*SBCM_REPORT.get_depositrest(p.i' +
        'd,:edat)/:sm)*100,2) as roundint'
      ' from sbcm_contracts p '
      ' ')
    Optimize = False
    Variables.Data = {
      04000000030000000A0000003A0042004400410054000C000000000000000000
      00000A0000003A0045004400410054000C000000000000000000000006000000
      3A0053004D00040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000C0000001400000043004F004E00540052004100430054004E004F00
      010000000000100000004F00500045004E004400410054004500010000000000
      1200000043004C004F005300450044004100540045000100000000000E000000
      420041004C0041004E00430045000100000000000E00000049004E0054005200
      4100540045000100000000000C00000050004500520049004F00440001000000
      00000C000000560041004C005500540045000100000000000A00000042005200
      4500530054000100000000000A0000005400520041004D005400010000000000
      0C00000050004100590041004D0054000100000000000A000000450052004500
      530054000100000000001000000052004F0055004E00440049004E0054000100
      00000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 206
    Top = 187
    object ResultsCONTRACTNO: TWideStringField
      DisplayLabel = 'M'#252'qavil'#601'nin '#8470'-si'
      FieldName = 'CONTRACTNO'
      Size = 64
    end
    object ResultsOPENDATE: TDateTimeField
      DisplayLabel = 'A'#231#305'lma tarixi'
      FieldName = 'OPENDATE'
      Required = True
    end
    object ResultsCLOSEDATE: TDateTimeField
      DisplayLabel = 'Ba'#287'lanma tarixi'
      FieldName = 'CLOSEDATE'
      Required = True
    end
    object ResultsBALANCE: TFloatField
      DisplayLabel = 'Balans'
      FieldName = 'BALANCE'
    end
    object ResultsINTRATE: TFloatField
      DisplayLabel = '%'
      FieldName = 'INTRATE'
    end
    object ResultsPERIOD: TWideStringField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Size = 4000
    end
    object ResultsVALUTE: TWideStringField
      DisplayLabel = '$'
      FieldName = 'VALUTE'
      Size = 4000
    end
    object ResultsBREST: TFloatField
      DisplayLabel = 'D.R M'#601'bl'#601#287
      FieldName = 'BREST'
    end
    object ResultsTRAMT: TFloatField
      DisplayLabel = 'Yatr'#305'lm'#305#351' m'#601'bl'#601#287
      FieldName = 'TRAMT'
    end
    object ResultsPAYAMT: TFloatField
      DisplayLabel = #214'd'#601'nilmi'#351' m'#601'bl'#601#287
      FieldName = 'PAYAMT'
    end
    object ResultsEREST: TFloatField
      DisplayLabel = 'D.R M'#601'bl'#601#287
      FieldName = 'EREST'
    end
    object ResultsROUNDINT: TFloatField
      DisplayLabel = 'Orta %'
      FieldName = 'ROUNDINT'
    end
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 168
    Top = 184
  end
  object CredTypeDatScr: TDataSource
    DataSet = CreditTypes
    Left = 130
    Top = 216
  end
  object PersonsDatSrc: TDataSource
    DataSet = Persons
    Left = 98
    Top = 215
  end
  object CustTypeDatSrc: TDataSource
    DataSet = CustomerTypes
    Left = 67
    Top = 217
  end
  object FilialsDatSrc: TDataSource
    DataSet = Filials
    Left = 37
    Top = 216
  end
  object ValutesDatSrc: TDataSource
    DataSet = Valutes
    Left = 4
    Top = 216
  end
  object query: TOracleDataSet
    SQL.Strings = (
      'select sum(FACTICALDEBT) as smr from sbcm_contract_state'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000600000053004D005200010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 65
    Top = 49
    object querySMR: TFloatField
      FieldName = 'SMR'
    end
  end
end

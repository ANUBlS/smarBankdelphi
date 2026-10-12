object rbsdostate: Trbsdostate
  Left = 0
  Top = 0
  Caption = 'RbsDofile Statement'
  ClientHeight = 264
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 160
    Top = 22
    Width = 43
    Height = 13
    Caption = #399'vv'#601'li 1:'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 199
    Height = 81
    Align = alTop
    Caption = 'Tarix Aral'#305#287#305
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 22
      Width = 37
      Height = 13
      Caption = #399'vv'#601'li :'
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 31
      Height = 13
      Caption = 'Sonu :'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 64
      Top = 17
      Width = 121
      Height = 21
      Date = 43305.468940648150000000
      Time = 43305.468940648150000000
      TabOrder = 0
    end
  end
  object DateTimePicker2: TDateTimePicker
    Left = 64
    Top = 44
    Width = 121
    Height = 21
    Date = 43305.468940648150000000
    Time = 43305.468940648150000000
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 81
    Width = 199
    Height = 184
    Align = alTop
    Caption = 'Se'#231'iml'#601'r'
    TabOrder = 2
    object LabelCli_Id: TLabel
      Left = 12
      Top = 71
      Width = 35
      Height = 13
      Caption = 'Device '
    end
    object CBCurrency: TCheckBox
      Left = 9
      Top = 20
      Width = 97
      Height = 17
      Caption = 'Valyuta1'
      TabOrder = 0
      OnClick = CBCurrencyClick
    end
    object DBLCBavalute: TDBLookupComboBox
      Left = 8
      Top = 41
      Width = 177
      Height = 21
      KeyField = 'VALUTE'
      ListField = 'VAL_NAME'
      ListSource = DataSource1
      TabOrder = 1
    end
    object EditCli_Id: TEdit
      Left = 9
      Top = 90
      Width = 176
      Height = 21
      TabOrder = 2
    end
    object BtnOk: TBitBtn
      Left = 43
      Top = 155
      Width = 113
      Height = 26
      Caption = 'Ok'
      DoubleBuffered = True
      Glyph.Data = {
        36010000424D3601000000000000760000002800000015000000100000000100
        040000000000C000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333000333333333333333333333000338FF3FF3333333333333000338C
        F38CFF33333333333000338CF38CCCFF333333333000338CF38CCCCCFF333333
        3000338CF38CCCCCCCFF33333000338CF38CCCCCCCCCFF333000338CF38CCCCC
        CCCC88F33000338CF38CCCCCCC8833333000338CF38CCCCC883333333000338C
        F38CCC88333333333000338CF38C88333333333330003388F388333333333333
        3000333333333333333333333000333333333333333333333000}
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BtnOkClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 9
      Top = 90
      Width = 177
      Height = 21
      KeyField = 'ATMID'
      ListField = 'ATMNAME'
      ListSource = DataMod_CARDS.bankomatsource
      TabOrder = 4
      OnCloseUp = DBLookupComboBox1CloseUp
    end
    object RadioButton1: TRadioButton
      Left = 12
      Top = 116
      Width = 113
      Height = 17
      Caption = 'Hesabat'
      TabOrder = 5
    end
    object RadioButton2: TRadioButton
      Left = 12
      Top = 137
      Width = 113
      Height = 17
      Caption = 'Excel'
      TabOrder = 6
    end
  end
  object Memo1: TMemo
    Left = 112
    Top = 87
    Width = 345
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object avalute: TOracleDataSet
    SQL.Strings = (
      'select * from avalute')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000170000000C000000560041004C005500540045000100000000001000
      0000560041004C005F004E0041004D0045000100000000001200000056004100
      4C0055005F004E0041004D00450001000000000014000000560041004C005500
      5F00530048004F00520054000100000000000C0000005500530054004F005200
      47000100000000000C00000055005300540050004F004B000100000000001000
      0000560041004C0055005F00470045004E000100000000000E00000056004100
      4C0055005F0041005A000100000000000A0000005500530049004E0047000100
      0000000014000000560041004C0055005F004F00540048004500520001000000
      000014000000560041004C0055005F0049004E00540045005200010000000000
      12000000560041004C0055005F00420041004C00410001000000000012000000
      50005200490053005400410056004B0041000100000000000E00000043004F00
      55004E00540052005900010000000000100000005500530054005F0050004F00
      4B0031000100000000000E0000004F00460046004900430041004C0001000000
      00000A0000004C0049004D00490054000100000000000A000000440045004200
      450054000100000000000C0000004B0052004500440049005400010000000000
      0C0000004600350035003000310050000100000000000C000000460035003500
      3000310056000100000000000C00000053004400450042004500540001000000
      00000E0000005300430052004500440049005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 360
    Top = 8
    object avaluteVALUTE: TIntegerField
      FieldName = 'VALUTE'
    end
    object avaluteVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object avaluteVALU_NAME: TWideStringField
      FieldName = 'VALU_NAME'
      Size = 40
    end
    object avaluteVALU_SHORT: TWideStringField
      FieldName = 'VALU_SHORT'
      Size = 10
    end
    object avaluteUSTORG: TFloatField
      FieldName = 'USTORG'
    end
    object avaluteUSTPOK: TFloatField
      FieldName = 'USTPOK'
    end
    object avaluteVALU_GEN: TWideStringField
      FieldName = 'VALU_GEN'
      Size = 10
    end
    object avaluteVALU_AZ: TWideStringField
      FieldName = 'VALU_AZ'
      Size = 25
    end
    object avaluteUSING: TIntegerField
      FieldName = 'USING'
    end
    object avaluteVALU_OTHER: TWideStringField
      FieldName = 'VALU_OTHER'
      Size = 25
    end
    object avaluteVALU_INTER: TWideStringField
      FieldName = 'VALU_INTER'
      Size = 3
    end
    object avaluteVALU_BALA: TWideStringField
      FieldName = 'VALU_BALA'
      Size = 25
    end
    object avalutePRISTAVKA: TFloatField
      FieldName = 'PRISTAVKA'
    end
    object avaluteCOUNTRY: TWideStringField
      FieldName = 'COUNTRY'
    end
    object avaluteUST_POK1: TFloatField
      FieldName = 'UST_POK1'
    end
    object avaluteOFFICAL: TWideStringField
      FieldName = 'OFFICAL'
      Size = 5
    end
    object avaluteLIMIT: TFloatField
      FieldName = 'LIMIT'
    end
    object avaluteDEBET: TFloatField
      FieldName = 'DEBET'
    end
    object avaluteKREDIT: TFloatField
      FieldName = 'KREDIT'
    end
    object avaluteF5501P: TFloatField
      FieldName = 'F5501P'
    end
    object avaluteF5501V: TFloatField
      FieldName = 'F5501V'
    end
    object avaluteSDEBET: TFloatField
      FieldName = 'SDEBET'
    end
    object avaluteSCREDIT: TFloatField
      FieldName = 'SCREDIT'
    end
  end
  object DataSource1: TDataSource
    DataSet = avalute
    Left = 415
    Top = 9
  end
  object QExport4Xlsx1: TQExport4Xlsx
    DataSet = DataMod_CARDS.rbsdofilerep
    About = '(About EMS AdvancedExport)'
    _Version = '4.13.3.2'
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '.'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'dd/MM/yyyy'
    Formats.TimeFormat = 'h:mm AMPM'
    Formats.DateTimeFormat = 'dd/MM/yyyy h:mm:ss AMPM'
    Formats.CurrencyFormat = ' #,###,##0.00'
    SheetName = 'sheet1'
    XlsxOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.HeaderStyle.Font.Color = clBlack
    XlsxOptions.HeaderStyle.Font.Height = -15
    XlsxOptions.HeaderStyle.Font.Name = 'Calibri'
    XlsxOptions.HeaderStyle.Font.Style = []
    XlsxOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.CaptionRowStyle.Font.Color = clBlack
    XlsxOptions.CaptionRowStyle.Font.Height = -15
    XlsxOptions.CaptionRowStyle.Font.Name = 'Calibri'
    XlsxOptions.CaptionRowStyle.Font.Style = []
    XlsxOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.DataStyle.Font.Color = clBlack
    XlsxOptions.DataStyle.Font.Height = -15
    XlsxOptions.DataStyle.Font.Name = 'Calibri'
    XlsxOptions.DataStyle.Font.Style = []
    XlsxOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.FooterStyle.Font.Color = clBlack
    XlsxOptions.FooterStyle.Font.Height = -15
    XlsxOptions.FooterStyle.Font.Name = 'Calibri'
    XlsxOptions.FooterStyle.Font.Style = []
    XlsxOptions.StripStylesList = <>
    Left = 136
    Top = 80
  end
end

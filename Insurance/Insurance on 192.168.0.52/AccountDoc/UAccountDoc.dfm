object AccountDoc: TAccountDoc
  Left = 194
  Top = 109
  Width = 720
  Height = 480
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
  object Panel3: TPanel
    Left = 0
    Top = 427
    Width = 712
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 3
      Width = 65
      Height = 22
      Caption = 'To ->'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF000080
        0000FFFFFF000080000000800000008000000080000000800000FFFFFF000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF0000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
        0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000008000000080
        000000800000FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
        00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphRight
      OnClick = SpeedButton1Click
    end
    object OkButton: TButton
      Left = 636
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
  end
  object PageControlTrans: TPageControl
    Left = 0
    Top = 0
    Width = 712
    Height = 427
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'Debet'
      object Panel1: TPanel
        Left = 0
        Top = 376
        Width = 704
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 0
        object Label1: TLabel
          Left = 56
          Top = 5
          Width = 51
          Height = 13
          Caption = 'Дебит цзря:'
        end
        object Label2: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Еквивалент:'
        end
        object Bevel1: TBevel
          Left = 336
          Top = 3
          Width = 3
          Height = 17
        end
        object DebitAmountEdit: TCurrencyEdit
          Left = 128
          Top = 1
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object DebitLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 353
        Width = 704
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit1: TDBEdit
          Left = 1
          Top = 1
          Width = 702
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = DebetTransactions
          TabOrder = 0
        end
      end
      object DebitTransactionsGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 353
        Align = alClient
        DataSource = DebetTransactions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '#'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Тарих'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DebitAccNo'
            Title.Caption = 'Дебит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = 'Кредит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'Д.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'К.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Еквивалент'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kredit'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 376
        Width = 704
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'Жями:'
        TabOrder = 0
        object Label3: TLabel
          Left = 56
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Кредит цзря:'
        end
        object Label4: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Еквивалент:'
        end
        object Bevel2: TBevel
          Left = 336
          Top = 3
          Width = 3
          Height = 17
        end
        object CreditAmountEdit: TCurrencyEdit
          Left = 128
          Top = 1
          Width = 177
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object CreditLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 353
        Width = 704
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DBEdit2: TDBEdit
          Left = 1
          Top = 1
          Width = 702
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 353
        Align = alClient
        DataSource = CreditTransactions
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = clSilver
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = '#'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Тарих'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCNO'
            Title.Caption = 'Дебит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CreditAccNo'
            Title.Caption = 'Кредит'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'Д.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'К.Мябляг'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Еквивалент'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object DebetTransactions: TDataSource
    DataSet = DebetTransactionsData
    Left = 500
    Top = 232
  end
  object DebetTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.debt as DebitAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ac.acc_no as CreditAccNo,'
      '  p.NAME as Destination'
      'from'
      '  SMART.provarch p,'
      '  SMART.account ac'
      'where'
      '  (p.dat between :StartDate and :EndDate)'
      '  and (p.debt = :AccountID)'
      '  and (ac.id = p.kredit)'
      'order by p.dat'
      ' ')
    Variables.Data = {
      03000000030000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C00000000000000000000000A0000003A41
      43434F554E544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000200000049440100000000000A0000004445424954414343
      49440100000000000D0000004F5045524154494F4E444154450100000000000B
      0000004445424954414D4F554E540100000000000C000000435245444954414D
      4F554E54010000000000070000004C414D4F554E540100000000000B00000043
      52454449544143434E4F0100000000000B00000044455354494E4154494F4E01
      0000000000}
    DetailFields = 'DebitAccID'
    QueryAllRecords = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    Active = True
    AfterOpen = DebetTransactionsDataAfterOpen
    OnCalcFields = DebetTransactionsDataCalcFields
    Left = 500
    Top = 265
    object DebetTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object DebetTransactionsDataDEBITACCID: TFloatField
      FieldName = 'DEBITACCID'
    end
    object DebetTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object DebetTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object DebetTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object DebetTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object DebetTransactionsDataCREDITACCNO: TStringField
      FieldName = 'CREDITACCNO'
    end
    object DebetTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object DebetTransactionsDataRowNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object DebetTransactionsDataDebitAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 32
      Calculated = True
    end
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 540
    Top = 232
  end
  object CreditTransactionsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p.ID,'
      '  p.kredit as CreditAccID,'
      '  p.dat as OperationDate,'
      '  p.ammount as DebitAmount,'
      '  p.ammount_c as CreditAmount,'
      '  p.lammount as LAmount,'
      '  ad.acc_no as DebitAccNo,'
      '  p.NAME as Destination'
      'from'
      '  SMART.provarch p,'
      '  SMART.account ad'
      'where'
      '  (p.kredit = :AccountID)'
      '  and (p.dat between :StartDate and :EndDate)'
      '  and (ad.id = p.debt)'
      'order by p.dat')
    Variables.Data = {
      03000000030000000A0000003A5354415254444154450C000000000000000000
      0000080000003A454E44444154450C00000000000000000000000A0000003A41
      43434F554E544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000080000000200000049440100000000000B0000004352454449544143
      4349440100000000000D0000004F5045524154494F4E44415445010000000000
      0B0000004445424954414D4F554E540100000000000C00000043524544495441
      4D4F554E54010000000000070000004C414D4F554E540100000000000A000000
      44454249544143434E4F0100000000000B00000044455354494E4154494F4E01
      0000000000}
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Active = True
    AfterOpen = CreditTransactionsDataAfterOpen
    OnCalcFields = CreditTransactionsDataCalcFields
    Left = 539
    Top = 265
    object CreditTransactionsDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object CreditTransactionsDataCREDITACCID: TFloatField
      FieldName = 'CREDITACCID'
    end
    object CreditTransactionsDataOPERATIONDATE: TDateTimeField
      FieldName = 'OPERATIONDATE'
    end
    object CreditTransactionsDataDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
      currency = True
    end
    object CreditTransactionsDataLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
      currency = True
    end
    object CreditTransactionsDataDEBITACCNO: TStringField
      FieldName = 'DEBITACCNO'
    end
    object CreditTransactionsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccNo'
      Size = 32
      Calculated = True
    end
  end
  object AccTrExport: TExcelExporter
    ExportList.Strings = (
      'OPERATIONDATE'
      'DEBITACCNO'
      'CREDITACCNO'
      'DEBITAMOUNT'
      'CREDITAMOUNT'
      'LAMOUNT'
      'DESTINATION')
    ShowTitles = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 580
    Top = 230
  end
end

object FormAccountTransactions: TFormAccountTransactions
  Left = 128
  Top = 49
  Caption = 'FormAccountTransactions'
  ClientHeight = 446
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlTrans: TPageControl
    Left = 0
    Top = 0
    Width = 739
    Height = 420
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'Debet'
      ExplicitWidth = 680
      ExplicitHeight = 400
      object Panel1: TPanel
        Left = 0
        Top = 371
        Width = 731
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = #1046#1103#1084#1080':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 377
        ExplicitWidth = 680
        object Label1: TLabel
          Left = 56
          Top = 5
          Width = 61
          Height = 14
          Caption = #1044#1077#1073#1080#1090' '#1094#1079#1088#1103':'
        end
        object Label2: TLabel
          Left = 360
          Top = 5
          Width = 64
          Height = 14
          Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
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
          Height = 22
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object DebitLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 22
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 348
        Width = 731
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 354
        ExplicitWidth = 680
        DesignSize = (
          731
          23)
        object DBEdit1: TDBEdit
          Left = 1
          Top = 1
          Width = 729
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = DebetTransactions
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 678
        end
      end
      object DebitTransactionsGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 731
        Height = 348
        Align = alClient
        DataSource = DebetTransactions
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
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
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = #1058#1072#1088#1080#1093
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DebitAccNo'
            Title.Caption = #1044#1077#1073#1080#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = #1050#1088#1077#1076#1080#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = #1044'.'#1052#1103#1073#1083#1103#1075
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = #1050'.'#1052#1103#1073#1083#1103#1075
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kredit'
      ImageIndex = 1
      ExplicitWidth = 680
      ExplicitHeight = 400
      object Panel5: TPanel
        Left = 0
        Top = 371
        Width = 731
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = #1046#1103#1084#1080':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 377
        ExplicitWidth = 680
        object Label3: TLabel
          Left = 56
          Top = 5
          Width = 66
          Height = 14
          Caption = #1050#1088#1077#1076#1080#1090' '#1094#1079#1088#1103':'
        end
        object Label4: TLabel
          Left = 360
          Top = 5
          Width = 64
          Height = 14
          Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
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
          Height = 22
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object CreditLAmountEdit: TCurrencyEdit
          Left = 440
          Top = 1
          Width = 185
          Height = 22
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 348
        Width = 731
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 354
        ExplicitWidth = 680
        DesignSize = (
          731
          23)
        object DBEdit2: TDBEdit
          Left = 1
          Top = 1
          Width = 729
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DESTINATION'
          DataSource = CreditTransactions
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 731
        Height = 348
        Align = alClient
        DataSource = CreditTransactions
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
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
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = #1058#1072#1088#1080#1093
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCNO'
            Title.Caption = #1044#1077#1073#1080#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CreditAccNo'
            Title.Caption = #1050#1088#1077#1076#1080#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = #1044'.'#1052#1103#1073#1083#1103#1075
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = #1050'.'#1052#1103#1073#1083#1103#1075
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 420
    Width = 739
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 688
    DesignSize = (
      739
      26)
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
      Left = 663
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 612
    end
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
      '  SMART.out_provarch p,'
      '  SMART.out_account ac'
      'where'
      '  (p.dat between :StartDate and :EndDate)'
      '  and (p.debt = :AccountID)'
      '  and (ac.id = p.kredit)'
      'order by p.dat'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000003000000140000003A00530054004100520054004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000140000003A004100430043004F0055004E005400
      49004400030000000000000000000000}
    DetailFields = 'DebitAccID'
    QueryAllRecords = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    AfterOpen = DebetTransactionsDataAfterOpen
    OnCalcFields = DebetTransactionsDataCalcFields
    Left = 132
    Top = 73
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
    object DebetTransactionsDataCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
    end
    object DebetTransactionsDataDESTINATION: TWideStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object DebetTransactionsDataRowNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RowNumber'
      Calculated = True
    end
    object DebetTransactionsDataDebitAccNo: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 32
      Calculated = True
    end
  end
  object DebetTransactions: TDataSource
    DataSet = DebetTransactionsData
    Left = 92
    Top = 72
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 92
    Top = 104
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
      '  SMART.out_provarch p,'
      '  SMART.out_account ad'
      'where'
      '  (p.kredit = :AccountID)'
      '  and (p.dat between :StartDate and :EndDate)'
      '  and (ad.id = p.debt)'
      'order by p.dat')
    Optimize = False
    Variables.Data = {
      0400000003000000140000003A00530054004100520054004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000140000003A004100430043004F0055004E005400
      49004400030000000000000000000000}
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterOpen = CreditTransactionsDataAfterOpen
    OnCalcFields = CreditTransactionsDataCalcFields
    Left = 131
    Top = 105
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
    object CreditTransactionsDataDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
    end
    object CreditTransactionsDataDESTINATION: TWideStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TWideStringField
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
    Left = 244
    Top = 78
  end
end

object FormAccountTransactions: TFormAccountTransactions
  Left = 205
  Top = 138
  ClientHeight = 453
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 427
    Width = 882
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      882
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
      Left = 806
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ba'#287'la'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object PageControlTrans: TPageControl
    Left = 0
    Top = 0
    Width = 882
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
        Top = 378
        Width = 874
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'C'#601'mi:'
        TabOrder = 0
        object Label1: TLabel
          Left = 56
          Top = 5
          Width = 57
          Height = 13
          Caption = 'Debet '#252'zr'#601':'
        end
        object Label2: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Ekvivalent:'
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
        Top = 355
        Width = 874
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          874
          23)
        object DBEdit1: TDBEdit
          Left = 1
          Top = 1
          Width = 872
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
        Width = 874
        Height = 355
        Align = alClient
        DataSource = DebetTransactions
        DrawingStyle = gdsClassic
        FixedColor = clActiveCaption
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
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Tarix'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DebitAccNo'
            Title.Caption = 'Debet'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCNO'
            Title.Caption = 'Kredit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'D. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'K. M'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Ekvivalent'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
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
      object Panel5: TPanel
        Left = 0
        Top = 378
        Width = 874
        Height = 23
        Align = alBottom
        Alignment = taLeftJustify
        Caption = 'C'#601'mi:'
        TabOrder = 0
        object Label3: TLabel
          Left = 56
          Top = 5
          Width = 56
          Height = 13
          Caption = 'Kredit '#252'zr'#601':'
        end
        object Label4: TLabel
          Left = 360
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Ekvivalent:'
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
        Top = 355
        Width = 874
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          874
          23)
        object DBEdit2: TDBEdit
          Left = 1
          Top = 1
          Width = 872
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
        Width = 874
        Height = 355
        Align = alClient
        DataSource = CreditTransactions
        DrawingStyle = gdsClassic
        FixedColor = clActiveCaption
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
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERATIONDATE'
            Title.Caption = 'Tarix'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCNO'
            Title.Caption = 'Debet'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CreditAccNo'
            Title.Caption = 'Kredit'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITAMOUNT'
            Title.Caption = 'D. m'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITAMOUNT'
            Title.Caption = 'K. m'#601'bl'#601#287
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LAMOUNT'
            Title.Caption = 'Ekvivalent'
            Title.Color = clNavy
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
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
      '  ac.name as CreditAccName,'
      '  p.NAME as Destination'
      ' '
      'from'
      '  SMART.provarch p,'
      '  SMART.account ac'
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
    QBEDefinition.QBEFieldDefs = {
      0500000009000000040000004900440001000000000014000000440045004200
      49005400410043004300490044000100000000001A0000004F00500045005200
      4100540049004F004E0044004100540045000100000000001600000044004500
      42004900540041004D004F0055004E0054000100000000001800000043005200
      450044004900540041004D004F0055004E0054000100000000000E0000004C00
      41004D004F0055004E0054000100000000001600000043005200450044004900
      54004100430043004E004F000100000000001600000044004500530054004900
      4E004100540049004F004E000100000000001A00000043005200450044004900
      54004100430043004E0041004D004500010000000000}
    DetailFields = 'DebitAccID'
    QueryAllRecords = False
    CountAllRecords = True
    Session = sboapiDataModule.SBSession
    AfterOpen = DebetTransactionsDataAfterOpen
    OnCalcFields = DebetTransactionsDataCalcFields
    Left = 180
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
      Size = 28
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
    object DebetTransactionsDataDebitAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccNo'
      Size = 28
      Calculated = True
    end
    object DebetTransactionsDataCREDITACCNAME: TWideStringField
      FieldName = 'CREDITACCNAME'
      Size = 250
    end
    object DebetTransactionsDataDebitAccName: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'DebitAccName'
      Size = 250
      Calculated = True
    end
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
      '  ad.name as DebitAccName,'
      '  p.NAME as Destination'
      '  '
      'from'
      '  SMART.provarch p,'
      '  SMART.account ad'
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
    QBEDefinition.QBEFieldDefs = {
      0500000009000000040000004900440001000000000016000000430052004500
      440049005400410043004300490044000100000000001A0000004F0050004500
      52004100540049004F004E004400410054004500010000000000160000004400
      450042004900540041004D004F0055004E005400010000000000180000004300
      5200450044004900540041004D004F0055004E0054000100000000000E000000
      4C0041004D004F0055004E005400010000000000140000004400450042004900
      54004100430043004E004F000100000000001600000044004500530054004900
      4E004100540049004F004E000100000000001800000044004500420049005400
      4100430043004E0041004D004500010000000000}
    MasterFields = 'ACCID'
    DetailFields = 'CreditAccID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    AfterOpen = CreditTransactionsDataAfterOpen
    OnCalcFields = CreditTransactionsDataCalcFields
    Left = 179
    Top = 145
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
      Size = 28
    end
    object CreditTransactionsDataDESTINATION: TWideStringField
      FieldName = 'DESTINATION'
      Size = 255
    end
    object CreditTransactionsDataCreditAccNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccNo'
      Size = 28
      Calculated = True
    end
    object CreditTransactionsDataDEBITACCNAME: TWideStringField
      FieldName = 'DEBITACCNAME'
      Size = 250
    end
    object CreditTransactionsDataCreditAccName: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'CreditAccName'
      Size = 250
      Calculated = True
    end
  end
  object CreditTransactions: TDataSource
    DataSet = CreditTransactionsData
    Left = 52
    Top = 152
  end
  object DebetTransactions: TDataSource
    DataSet = DebetTransactionsData
    Left = 52
    Top = 72
  end
  object AccTrExport: TExcelExporter
    ExportList.Strings = (
      'OPERATIONDATE'
      'DEBITACCNO'
      'DEBITACCNAME'
      'CREDITACCNO'
      'CREDITACCNAME'
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
    Left = 364
    Top = 78
  end
end

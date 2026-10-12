object ExpComAccForm: TExpComAccForm
  Left = 498
  Top = 561
  AutoSize = True
  Caption = 'Komission Hesablar'#305
  ClientHeight = 370
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 370
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 636
      Height = 87
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 24
        Height = 14
        Caption = 'Filial:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 38
        Width = 44
        Height = 14
        Caption = 'Valyuta:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 65
        Width = 37
        Height = 14
        Caption = 'Hesab:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 246
        Top = 64
        Width = 23
        Height = 22
        Caption = 'OK'
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 275
        Top = 69
        Width = 32
        Height = 14
        Caption = '(6402)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 555
        Top = 63
        Width = 23
        Height = 22
        Caption = 'OK'
        OnClick = SpeedButton2Click
      end
      object Label5: TLabel
        Left = 589
        Top = 68
        Width = 32
        Height = 14
        Caption = '(6404)'
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object DBViewComboBox1: TDBViewComboBox
        Left = 214
        Top = 8
        Width = 190
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ListSource = FilialDataSource
        ListFields = 'Name'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object DBViewComboBox2: TDBViewComboBox
        Left = 214
        Top = 35
        Width = 190
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ListSource = ValyutaDataSource
        ListFields = 'Valu_Name'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object SearchEdit1: TSearchEdit
        Left = 51
        Top = 65
        Width = 190
        Height = 21
        TabOrder = 2
        DataSource = AccountDataSource
        SearchField = 'ACC_NO'
      end
      object SearchEdit2: TSearchEdit
        Left = 360
        Top = 64
        Width = 190
        Height = 21
        TabOrder = 3
        DataSource = DataSource1
        SearchField = 'ACC_NO'
      end
    end
    object Panel3: TPanel
      Left = 319
      Top = 88
      Width = 318
      Height = 281
      Align = alRight
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 316
        Height = 279
        Align = alClient
        Color = clSilver
        DataSource = ExpComissionAccDataSource
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'VAL_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Val.'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ACC_NO'
            Title.Alignment = taCenter
            Title.Caption = 'Hesab'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 88
      Width = 318
      Height = 281
      Align = alRight
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 316
        Height = 279
        Align = alClient
        Color = clSilver
        DataSource = ExpChequeAccDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'VAL_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Val.'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 47
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ACC_NO'
            Title.Alignment = taCenter
            Title.Caption = 'Hesab'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Azl Sans Serif'
            Title.Font.Style = []
            Visible = True
          end>
      end
    end
  end
  object ExpChequeAccDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT x.*,v.val_name, a.acc_no, f.NAME'
      '  FROM EXP_CHEQUEACCOUNT x, avalute v, ACCOUNT a, Filial f'
      
        ' WHERE (x.valute = v.valute) AND (x.acc_id = a.id) AND (f.id = x' +
        '.branchid)'
      'order by x.valute,x.branchid'
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000010000000420052004100
      4E0043004800490044000100000000000C0000004100430043005F0049004400
      0100000000000C000000560041004C0055005400450001000000000010000000
      560041004C005F004E0041004D0045000100000000000C000000410043004300
      5F004E004F00010000000000080000004E0041004D004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 96
    Top = 168
  end
  object ExpChequeAccDataSource: TDataSource
    DataSet = ExpChequeAccDataSet
    Left = 234
    Top = 168
  end
  object ValyutaDataSet: TOracleDataSet
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
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 96
    Top = 304
  end
  object ValyutaDataSource: TDataSource
    DataSet = ValyutaDataSet
    Left = 234
    Top = 296
  end
  object FilialDataSet: TOracleDataSet
    SQL.Strings = (
      'select * from filial '
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 95
    Top = 226
  end
  object FilialDataSource: TDataSource
    DataSet = FilialDataSet
    Left = 234
    Top = 228
  end
  object AccountDataSet: TOracleDataSet
    SQL.Strings = (
      'select * from smart.account'
      'where close_dat is null and'
      '      bal_cn1=6402')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001800000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000A0000004F0050005F0049004400010000000000
      0C0000004100430043005F004E004F000100000000000E000000560041004C00
      5F00410043004300010000000000080000004E0041004D004500010000000000
      100000004F00500045004E005F00440041005400010000000000120000004300
      4C004F00530045005F004400410054000100000000000E000000420041004C00
      5F0043004E0031000100000000000E000000420041004C005F0043004E003200
      0100000000000E000000420041004C005F0043004E0033000100000000000E00
      0000420041004C005F0043004E0034000100000000000C000000460049004C00
      490041004C0001000000000012000000530049004D005F004F00540043004500
      54000100000000000C0000005400490050004100430043000100000000000A00
      00004C0049004D0049005400010000000000140000004F004C0044005F004100
      430043005F004E004F000100000000001000000050004100490052005F004100
      430043000100000000000E00000049004E005300490044004500520001000000
      00000800000053004900440023000100000000000C000000540045004D005000
      490044000100000000000A0000004F0057004E00490044000100000000001000
      000050005F004300550053005400490044000100000000000800000053005900
      4D004200010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 376
    Top = 168
  end
  object AccountDataSource: TDataSource
    DataSet = AccountDataSet
    Left = 522
    Top = 169
  end
  object ExpComissionAccDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT x.*,v.val_name, a.acc_no, f.NAME'
      '  FROM EXP_COMISSIONACCOUNT x, avalute v, ACCOUNT a, Filial f'
      
        ' WHERE (x.valute = v.valute) AND (x.acc_id = a.id) AND (f.id = x' +
        '.branchid)'
      'order by x.valute,x.branchid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000C000000410043004300
      5F00490044000100000000000C000000560041004C0055005400450001000000
      0000100000004200520041004E00430048004900440001000000000010000000
      560041004C005F004E0041004D0045000100000000000C000000410043004300
      5F004E004F00010000000000080000004E0041004D004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 392
    Top = 227
  end
  object ExpComissionAccDataSource: TDataSource
    DataSet = ExpComissionAccDataSet
    Left = 530
    Top = 226
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 530
    Top = 297
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from smart.account'
      'where close_dat is null and'
      '      bal_cn1=6404')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001800000004000000490044000100000000000C0000004B004C004900
      5F00490044000100000000000A0000004F0050005F0049004400010000000000
      0C0000004100430043005F004E004F000100000000000E000000560041004C00
      5F00410043004300010000000000080000004E0041004D004500010000000000
      100000004F00500045004E005F00440041005400010000000000120000004300
      4C004F00530045005F004400410054000100000000000E000000420041004C00
      5F0043004E0031000100000000000E000000420041004C005F0043004E003200
      0100000000000E000000420041004C005F0043004E0033000100000000000E00
      0000420041004C005F0043004E0034000100000000000C000000460049004C00
      490041004C0001000000000012000000530049004D005F004F00540043004500
      54000100000000000C0000005400490050004100430043000100000000000A00
      00004C0049004D0049005400010000000000140000004F004C0044005F004100
      430043005F004E004F000100000000001000000050004100490052005F004100
      430043000100000000000E00000049004E005300490044004500520001000000
      00000800000053004900440023000100000000000C000000540045004D005000
      490044000100000000000A0000004F0057004E00490044000100000000001000
      000050005F004300550053005400490044000100000000000800000053005900
      4D004200010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 384
    Top = 296
  end
end

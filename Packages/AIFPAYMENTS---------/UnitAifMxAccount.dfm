object FormAifMxAccount: TFormAifMxAccount
  Left = 0
  Top = 0
  AutoSize = True
  ClientHeight = 378
  ClientWidth = 640
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
    Width = 640
    Height = 378
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 94
      Align = alTop
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 12
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
        Left = 4
        Top = 41
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
        Left = 4
        Top = 73
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
        Left = 241
        Top = 65
        Width = 25
        Height = 24
        Caption = 'OK'
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 272
        Top = 74
        Width = 36
        Height = 15
        Caption = '(2801)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 551
        Top = 65
        Width = 25
        Height = 24
        Caption = 'OK'
        OnClick = SpeedButton2Click
      end
      object Label5: TLabel
        Left = 588
        Top = 73
        Width = 36
        Height = 15
        Caption = '(4801)'
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object SearchEdit1: TSearchEdit
        Left = 47
        Top = 67
        Width = 190
        Height = 21
        TabOrder = 0
        DataSource = AccountDataSource
        SearchField = 'ACC_NO'
      end
      object DBViewComboBox1: TDBViewComboBox
        Left = 203
        Top = 9
        Width = 190
        Height = 22
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ListSource = FilialDataSource
        ListFields = 'Name'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object DBViewComboBox2: TDBViewComboBox
        Left = 203
        Top = 38
        Width = 190
        Height = 22
        Style = csSimple
        Color = clSilver
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ListSource = ValyutaDataSource
        ListFields = 'Valu_Name'
        FieldInterval = 5
        DropDownOnEnter = False
      end
      object SearchEdit2: TSearchEdit
        Left = 358
        Top = 67
        Width = 190
        Height = 21
        TabOrder = 3
        DataSource = AccountDataSource
        SearchField = 'ACC_NO'
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 95
      Width = 318
      Height = 282
      Align = alLeft
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 316
        Height = 280
        Align = alClient
        Color = clSilver
        DataSource = AifAccDataSource
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'VAL_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Val.'
            Width = 47
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ACC_NO'
            Title.Alignment = taCenter
            Title.Caption = 'Hesab'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Visible = True
          end>
      end
    end
    object Panel4: TPanel
      Left = 319
      Top = 95
      Width = 318
      Height = 282
      Align = alLeft
      TabOrder = 2
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 316
        Height = 280
        Align = alClient
        Color = clSilver
        DataSource = BranchDataSource
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'VAL_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Val.'
            Width = 47
            Visible = True
          end
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ACC_NO'
            Title.Alignment = taCenter
            Title.Caption = 'Hesab'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Visible = True
          end>
      end
    end
  end
  object AifAccDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT x.*,v.val_name, a.acc_no, f.NAME'
      '  FROM aif_accounts x, avalute v, ACCOUNT a, Filial f'
      
        ' WHERE (x.valute = v.valute) AND (x.acc_id = a.id) AND (f.id = x' +
        '.branchid) and (a.close_dat is null)and (a.val_acc=0) and (v.val' +
        'ute=0)'
      'order by x.branchid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000010000000560041004C005F004E0041004D00450001000000
      00000C0000004100430043005F004E004F00010000000000080000004E004100
      4D004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 57
    Top = 149
  end
  object BranchDataSet: TOracleDataSet
    SQL.Strings = (
      'SELECT x.*,v.Val_Name, a.Acc_No, f.Name'
      '  FROM AIF_BRANCHACCOUNTS x, Avalute v, Account a, Filial f'
      
        ' WHERE (x.valute = v.valute) and (x.AccID = a.ID) and (f.ID = x.' +
        'BranchID) and (a.close_dat is null) and (a.val_acc=0) and (v.val' +
        'ute=0)'
      'order by x.branchid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000600000010000000560041004C005F004E0041004D00450001000000
      00000C0000004100430043005F004E004F00010000000000080000004E004100
      4D004500010000000000100000004200520041004E0043004800490044000100
      000000000A000000410043004300490044000100000000000C00000056004100
      4C00550054004500010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 208
  end
  object AifAccDataSource: TDataSource
    DataSet = AifAccDataSet
    Left = 202
    Top = 150
  end
  object BranchDataSource: TDataSource
    DataSet = BranchDataSet
    Left = 202
    Top = 209
  end
  object AccountDataSet: TOracleDataSet
    SQL.Strings = (
      
        'select * from smart.account where close_dat is null and val_acc=' +
        '0')
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
    Left = 375
    Top = 226
  end
  object ValyutaDataSet: TOracleDataSet
    SQL.Strings = (
      'select * from avalute where valute=0')
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
    Left = 376
    Top = 288
  end
  object AccountDataSource: TDataSource
    DataSet = AccountDataSet
    Left = 522
    Top = 169
  end
  object FilialDataSource: TDataSource
    DataSet = FilialDataSet
    Left = 514
    Top = 228
  end
  object ValyutaDataSource: TDataSource
    DataSet = ValyutaDataSet
    Left = 514
    Top = 288
  end
end

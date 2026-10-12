object FormAccount: TFormAccount
  Left = 0
  Top = 0
  Caption = 'Hesablar'
  ClientHeight = 305
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object XDBGridAccounts: TXDBGrid
    Left = -8
    Top = 37
    Width = 780
    Height = 311
    DataSource = DS_Account
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    TabOrder = 0
    OnDblClick = XDBGridAccountsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KLI_ID'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'ri kodu'
        Visible = True
        Width = 77
      end
      item
        Expanded = False
        FieldName = 'BAL_CN1'
        Title.Alignment = taCenter
        Title.Caption = 'Balans hesab'#305
        Visible = True
        Width = 82
      end
      item
        Expanded = False
        FieldName = 'ACC_NO_SEARCH'
        Title.Alignment = taCenter
        Title.Caption = 'Hesab'
        Visible = True
        Width = 219
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Hesab ad'#305
        Visible = True
        Width = 264
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 665
    Height = 37
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 649
    object Balans: TLabel
      Left = 65
      Top = 15
      Width = 65
      Height = 13
      Caption = 'Balans hesab'#305
    end
    object Label1: TLabel
      Left = 323
      Top = 16
      Width = 61
      Height = 13
      Caption = 'M'#252#351't'#601'ri kodu'
    end
    object EditBalcn: TEdit
      Left = 136
      Top = 12
      Width = 92
      Height = 21
      TabOrder = 0
      OnKeyPress = EditBalcnKeyPress
    end
    object EditKli_id: TEdit
      Left = 391
      Top = 12
      Width = 108
      Height = 21
      TabOrder = 1
      OnKeyPress = EditKli_idKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 268
    Width = 665
    Height = 37
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 311
    ExplicitWidth = 649
    object Label5: TLabel
      Left = 54
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Hesab '#8470'  Axtar'#305#351
    end
    object Button2: TButton
      Left = 564
      Top = 9
      Width = 68
      Height = 25
      Caption = 'Ba'#287'la'
      TabOrder = 0
      OnClick = Button2Click
    end
    object EditACC_NO: TEdit
      Left = 153
      Top = 11
      Width = 231
      Height = 21
      TabOrder = 1
      OnKeyPress = EditACC_NOKeyPress
    end
  end
  object ODS_Account: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '    ACC_NO,'
      
        '  SUBSTR(acc_no,(select value from settings where name='#39'AccNoSea' +
        'rchPos'#39'),30) as ACC_No_Search,'
      '   NAME,bal_cn1,'
      '   KLI_ID'
      'FROM'
      '  ACCOUNT  '
      '  '
      ''
      '  '
      'order by bal_cn1'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000002000000120000003A0056005F00420041004C0043004E0031000100
      000004000000303D300000000000120000003A0056005F004B004C0049005F00
      490044000100000004000000303D300000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000C0000004100430043005F004E004F000100000000000800
      00004E0041004D0045000100000000001A0000004100430043005F004E004F00
      5F005300450041005200430048000100000000000C0000004B004C0049005F00
      490044000100000000000E000000420041004C005F0043004E00310001000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 567
    Top = 85
    object ODS_AccountACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object ODS_AccountACC_NO_SEARCH: TWideStringField
      FieldName = 'ACC_NO_SEARCH'
      Size = 112
    end
    object ODS_AccountNAME: TWideStringField
      FieldName = 'NAME'
      Size = 250
    end
    object ODS_AccountBAL_CN1: TFloatField
      FieldName = 'BAL_CN1'
    end
    object ODS_AccountKLI_ID: TFloatField
      FieldName = 'KLI_ID'
    end
  end
  object DS_Account: TDataSource
    DataSet = ODS_Account
    Left = 568
    Top = 144
  end
end

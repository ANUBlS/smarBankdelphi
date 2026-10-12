object CC_AccInForm: TCC_AccInForm
  Left = 278
  Top = 553
  ClientHeight = 357
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SettingsBrowser: TDBGrid
    Left = 0
    Top = 0
    Width = 775
    Height = 273
    Align = alTop
    Color = clWhite
    DataSource = CO_In_data
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = SettingsBrowserDblClick
    Columns = <
      item
        Color = clGray
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1072#1076#1099
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITACCOUNT'
        Title.Caption = #1044#1077#1073#1077#1090
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'DEBITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITACCOUNT'
        Title.Caption = #1050#1088#1077#1076#1080#1090
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'CREDITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 273
    Width = 775
    Height = 46
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099':'
      TabOrder = 0
      DesignSize = (
        771
        21)
      object DBEdit1: TDBEdit
        Left = 102
        Top = 0
        Width = 703
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'ASSIGNMENT'
        DataSource = CO_In_data
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 23
      Width = 771
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 1
      Visible = False
      DesignSize = (
        771
        21)
      object DBEdit2: TDBEdit
        Left = 156
        Top = 0
        Width = 649
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataSource = CO_In_data
        TabOrder = 0
        Visible = False
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 319
    Width = 775
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      775
      33)
    object ButtonRefresh: TButton
      Left = 595
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1049#1077#1085#1080#1083#1103
      TabOrder = 0
      OnClick = ButtonRefreshClick
    end
    object ButtonClose: TButton
      Left = 682
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1041#1072#1100#1083#1072
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
    object Button3: TButton
      Left = 508
      Top = 6
      Width = 75
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1071#1083#1072#1074#1103
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object CO_In_data: TDataSource
    DataSet = CC_InForm
    Left = 208
    Top = 56
  end
  object CC_InForm: TOracleDataSet
    SQL.Strings = (
      'select'
      '    commision_trans.*'
      '   ,id'
      '   ,name'
      '   ,debt'
      
        '   ,sb_complex_transactions.getaccountnumber(debt) as DebitAccou' +
        'nt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(debt) as DebitCur' +
        'rency'
      '   ,credit'
      
        '   ,sb_complex_transactions.getaccountnumber(credit) as CreditAc' +
        'count'
      
        '   ,sb_complex_transactions.GetAccountCurrency(credit) as Credit' +
        'Currency'
      '   ,assignment'
      '   ,UserID'
      'from'
      '    commision_trans'
      'where'
      '   debt>0'
      'order by'
      '    commision_trans.ID')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000130000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000004400450042005400010000000000180000004400
      45004200490054004100430043004F0055004E0054000100000000001A000000
      44004500420049005400430055005200520045004E0043005900010000000000
      0C0000004300520045004400490054000100000000001A000000430052004500
      4400490054004100430043004F0055004E0054000100000000001C0000004300
      52004500440049005400430055005200520045004E0043005900010000000000
      14000000410053005300490047004E004D0045004E0054000100000000000C00
      00005500530045005200490044000100000000001C0000004100440044004900
      540049004F004E0041004C004400450042005400010000000000200000004100
      440044004900540049004F004E0041004C004300520045004400490054000100
      000000002600000043004F004D004D004900530049004F004E00410053005300
      490047004E004D0045004E00540001000000000008000000490044005F003100
      0100000000000C0000004E0041004D0045005F0031000100000000000C000000
      44004500420054005F0031000100000000001000000043005200450044004900
      54005F00310001000000000018000000410053005300490047004E004D004500
      4E0054005F003100010000000000100000005500530045005200490044005F00
      3100010000000000}
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 112
    object CC_InFormID: TFloatField
      FieldName = 'ID'
    end
    object CC_InFormNAME: TStringField
      FieldName = 'NAME'
      Size = 150
    end
    object CC_InFormDEBT: TFloatField
      FieldName = 'DEBT'
    end
    object CC_InFormDEBITACCOUNT: TStringField
      FieldName = 'DEBITACCOUNT'
      Size = 4000
    end
    object CC_InFormDEBITCURRENCY: TStringField
      FieldName = 'DEBITCURRENCY'
      Size = 4000
    end
    object CC_InFormCREDIT: TFloatField
      FieldName = 'CREDIT'
    end
    object CC_InFormCREDITACCOUNT: TStringField
      FieldName = 'CREDITACCOUNT'
      Size = 4000
    end
    object CC_InFormCREDITCURRENCY: TStringField
      FieldName = 'CREDITCURRENCY'
      Size = 4000
    end
    object CC_InFormASSIGNMENT: TStringField
      FieldName = 'ASSIGNMENT'
      Size = 300
    end
    object CC_InFormUSERID: TFloatField
      FieldName = 'USERID'
    end
  end
end

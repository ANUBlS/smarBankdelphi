object CC_ACCOutForm: TCC_ACCOutForm
  Left = 342
  Top = 558
  Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1083#1072#1088#1099
  ClientHeight = 353
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SettingsBrowser: TDBGrid
    Left = 0
    Top = 0
    Width = 711
    Height = 273
    Align = alTop
    Color = clWhite
    DataSource = CO_Out_data
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
      end
      item
        Expanded = False
        FieldName = 'ADEBT'
        Title.Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1076#1077#1073#1077#1090
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'ADEBITCURRENCY'
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
        FieldName = 'ACREDIT'
        Title.Caption = #1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1082#1088#1077#1076#1080#1090
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 122
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'ACREDITCURRENCY'
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
    Width = 711
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
      Width = 707
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099':'
      TabOrder = 0
      DesignSize = (
        707
        21)
      object DBEdit1: TDBEdit
        Left = 102
        Top = 0
        Width = 623
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'ASSIGNMENT'
        DataSource = CO_Out_data
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 23
      Width = 707
      Height = 21
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#1050#1086#1084#1080#1089#1089#1080#1081#1072' '#1103#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 1
      DesignSize = (
        707
        21)
      object DBEdit2: TDBEdit
        Left = 156
        Top = 0
        Width = 569
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'COMMISIONASSIGNMENT'
        DataSource = CO_Out_data
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 319
    Width = 711
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
      711
      33)
    object ButtonRefresh: TButton
      Left = 555
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1049#1077#1085#1080#1083#1103
      TabOrder = 0
      OnClick = ButtonRefreshClick
    end
    object ButtonClose: TButton
      Left = 634
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1041#1072#1100#1083#1072
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
    object Button3: TButton
      Left = 476
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1071#1083#1072#1074#1103
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object CO_Out_data: TDataSource
    DataSet = CC_OutForm
    Left = 176
    Top = 120
  end
  object CC_OutForm: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '    commision_trans.Rowid'
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
      '   ,additionalDebt'
      '   ,additionalCredit'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalDebt) as ' +
        'ADebt'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalDebt) a' +
        's ADebitCurrency'
      
        '   ,sb_complex_transactions.getaccountnumber(additionalCredit) a' +
        's ACredit'
      
        '   ,sb_complex_transactions.GetAccountCurrency(additionalCredit)' +
        ' as ACreditCurrency'
      '   ,assignment'
      '   ,commisionassignment'
      '   ,UserID   '
      'from'
      '    commision_trans'
      'where'
      '  '
      
        ' (credit>0 and  additionalcredit>0 and debt=0 and additionaldebt' +
        '=0)'
      '  '
      'order by'
      '    commision_trans.ID'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000110000000400000049004400010000000000080000004E0041004D00
      4500010000000000080000004400450042005400010000000000180000004400
      45004200490054004100430043004F0055004E0054000100000000001A000000
      44004500420049005400430055005200520045004E0043005900010000000000
      0C0000004300520045004400490054000100000000001A000000430052004500
      4400490054004100430043004F0055004E0054000100000000001C0000004300
      52004500440049005400430055005200520045004E0043005900010000000000
      1C0000004100440044004900540049004F004E0041004C004400450042005400
      010000000000200000004100440044004900540049004F004E0041004C004300
      520045004400490054000100000000000A000000410044004500420054000100
      000000001C000000410044004500420049005400430055005200520045004E00
      430059000100000000000E000000410043005200450044004900540001000000
      00001E0000004100430052004500440049005400430055005200520045004E00
      4300590001000000000014000000410053005300490047004E004D0045004E00
      54000100000000002600000043004F004D004D004900530049004F004E004100
      53005300490047004E004D0045004E0054000100000000000C00000055005300
      4500520049004400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 168
    Top = 72
  end
end

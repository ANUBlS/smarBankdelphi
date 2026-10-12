object FrmBalanceChecking: TFrmBalanceChecking
  Left = 192
  Top = 133
  Caption = 'FrmBalanceChecking'
  ClientHeight = 526
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 41
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 30
      Height = 14
      Caption = #1058#1072#1088#1080#1093
    end
    object Label2: TLabel
      Left = 169
      Top = 13
      Width = 43
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072
    end
    object Label3: TLabel
      Left = 508
      Top = 13
      Width = 48
      Height = 14
      Caption = #1043#1072#1083#1099#1075#1083#1072#1088
    end
    object STTargetDate: TStaticText
      Left = 61
      Top = 12
      Width = 70
      Height = 18
      BorderStyle = sbsSunken
      Caption = 'STTargetDate'
      TabOrder = 0
    end
    object STCurrency: TStaticText
      Left = 224
      Top = 12
      Width = 62
      Height = 18
      BorderStyle = sbsSunken
      Caption = 'STCurrency'
      TabOrder = 1
    end
    object STBranch: TStaticText
      Left = 365
      Top = 12
      Width = 39
      Height = 18
      BorderStyle = sbsSunken
      Caption = 'Branch'
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 677
      Top = 1
      Width = 95
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object BtnOk: TButton
        Left = 19
        Top = 4
        Width = 65
        Height = 33
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
      end
    end
    object STCurrFormat: TStaticText
      Left = 552
      Top = 12
      Width = 71
      Height = 18
      BorderStyle = sbsSunken
      Caption = 'STCurrFormat'
      TabOrder = 4
    end
  end
  object BalanceViewer: TDBGrid
    Left = 0
    Top = 41
    Width = 773
    Height = 136
    Align = alTop
    BorderStyle = bsNone
    Color = clWhite
    DataSource = out_balancedatamodule.DataSrcBalanceData
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ACCOUNTNUMBER'
        Title.Caption = #1065#1077#1089#1072#1073
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTURNOVER'
        Title.Caption = #1044#1102#1074#1088#1094#1081#1081#1103' '#1044'.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTURNOVER'
        Title.Caption = #1044#1102#1074#1088#1094#1081#1081#1103' '#1050'.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVE'
        Title.Caption = #1040#1082#1090#1080#1074
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASSIVE'
        Title.Caption = #1055#1072#1089#1089#1080#1074
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 177
    Width = 773
    Height = 28
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 2
    object EditAccountNumber: TEdit
      Left = 3
      Top = 1
      Width = 70
      Height = 21
      TabOrder = 0
      OnExit = EditAccountNumberExit
      OnKeyPress = EditAccountNumberKeyPress
    end
  end
  object AccountViewer: TDBGrid
    Left = 0
    Top = 205
    Width = 773
    Height = 112
    Align = alTop
    BorderStyle = bsNone
    Color = clWhite
    DataSource = out_balancedatamodule.DataSrcAccountData
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ACCNUMBER'
        Title.Caption = #1065#1077#1089#1072#1073#1099#1085' '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Color = clGray
        Expanded = False
        FieldName = 'ACCCURRENCY'
        Title.Caption = '  $'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTURNOVER'
        Title.Caption = #1044#1102#1074#1088#1080#1081#1081#1103' '#1044'.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTURNOVER'
        Title.Caption = #1044#1102#1074#1088#1080#1081#1081#1103' '#1050'.'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVE'
        Title.Caption = #1040#1082#1090#1080#1074
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASSIVE'
        Title.Caption = #1055#1072#1089#1089#1080#1074
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end>
  end
  object Panel6: TPanel
    Left = 0
    Top = 317
    Width = 773
    Height = 28
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 4
    object EditAccNumber: TEdit
      Left = 3
      Top = 1
      Width = 166
      Height = 22
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = EditAccNumberExit
      OnKeyPress = EditAccNumberKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 171
      Top = 1
      Width = 590
      Height = 22
      DataField = 'ACCOUNTNAME'
      DataSource = out_balancedatamodule.DataSrcAccountData
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object TransactionsViewer: TDBGrid
    Left = 0
    Top = 345
    Width = 773
    Height = 139
    Align = alTop
    DataSource = out_balancedatamodule.DataSrcTransactionsData
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clWhite
        Expanded = False
        FieldName = 'ID'
        Title.Caption = '       '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'DEBITACCNO'
        Title.Caption = #1044#1077#1073#1077#1090' '#1065#1077#1089#1072#1073#1099#1085#1099#1085' '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'DEBITCURRENCYSNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = '   $'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'CREDITACCNO'
        Title.Caption = #1050#1088#1077#1076#1080#1090' '#1065#1077#1089#1072#1073#1099#1085#1099#1085' '#8470
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'CREDITCURRENCYSNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Caption = '   $'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'DEBITAMOUNT'
        Title.Caption = #1052#1103#1073#1083#1103#1100' ('#1044#1077#1073#1077#1090')'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'CREDITAMOUNT'
        Title.Caption = #1052#1103#1073#1083#1103#1100' ('#1050#1088#1077#1076#1080#1090')'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'LAMOUNT'
        Title.Caption = #1052#1103#1073#1083#1103#1100' ('#1052#1072#1085#1072#1090#1083#1072')'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 484
    Width = 773
    Height = 39
    Align = alTop
    Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085#1058#1103#1081#1080#1085#1072#1090#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object DBText1: TDBText
      Left = 648
      Top = 13
      Width = 110
      Height = 20
      Alignment = taRightJustify
      Color = clNavy
      DataField = 'OPERATORID'
      DataSource = out_balancedatamodule.DataSrcTransactionsData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 14
      Width = 637
      Height = 22
      DataField = 'TRDESCRIPTION'
      DataSource = out_balancedatamodule.DataSrcTransactionsData
      TabOrder = 0
    end
  end
end

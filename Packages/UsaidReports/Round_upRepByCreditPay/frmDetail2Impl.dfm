object frmDetail2: TfrmDetail2
  Left = 115
  Top = 130
  Caption = 'frmDetail2'
  ClientHeight = 357
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 87
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 845
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1102#1076#1103#1085#1080#1096#1080' '#1094#1079#1088#1103'  '#1097#1077#1089#1072#1073#1072#1090#1099' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 304
    end
    object Label2: TLabel
      Left = 2
      Top = 21
      Width = 845
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1102#1076#1103#1085#1080#1096#1083#1103#1088' '#1094#1079#1088#1103' '#1084#1094#1092#1103#1089#1089#1103#1083' '#1080#1085#1092#1086#1088#1084#1072#1089#1080#1081#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 362
    end
    object Label3: TLabel
      Left = 9
      Top = 60
      Width = 44
      Height = 14
      Caption = #1060#1080#1083#1080#1072#1083': '
    end
    object Label4: TLabel
      Left = 224
      Top = 60
      Width = 82
      Height = 14
      Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080' :'
    end
    object Label5: TLabel
      Left = 468
      Top = 60
      Width = 49
      Height = 14
      Caption = #1042#1072#1083#1081#1091#1090#1072': '
    end
    object Label6: TLabel
      Left = 698
      Top = 60
      Width = 33
      Height = 14
      Caption = #1058#1072#1088#1080#1093':'
    end
    object DBEditEh1: TDBEditEh
      Left = 43
      Top = 56
      Width = 172
      Height = 22
      DataField = 'FILIALNAME'
      DataSource = dmRepByCreditPay.Details2ds
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 290
      Top = 56
      Width = 172
      Height = 22
      DataField = 'DESCRIPTION'
      DataSource = dmRepByCreditPay.Details2ds
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 512
      Top = 56
      Width = 172
      Height = 22
      DataField = 'VALU_NAME'
      DataSource = dmRepByCreditPay.Details2ds
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DTPd2: TDateTimePicker
      Left = 733
      Top = 55
      Width = 116
      Height = 21
      Date = 39785.574284213000000000
      Time = 39785.574284213000000000
      Enabled = False
      TabOrder = 3
    end
  end
  object SearchPanel: TGroupBox
    Left = 0
    Top = 296
    Width = 849
    Height = 61
    Align = alBottom
    Caption = #1040#1093#1090#1072#1088#1099#1096' '#1055#1072#1085#1077#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 17
      Width = 148
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1094#1075'.'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditNUMBEROFCREDIT: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
    object Panel7: TPanel
      Left = 150
      Top = 17
      Width = 147
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 145
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1050#1088#1077#1076#1080#1090' '#1097#1077#1089#1072#1073#1099
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditACC_NO: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
    object Panel8: TPanel
      Left = 297
      Top = 17
      Width = 148
      Height = 42
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object StaticText3: TStaticText
        Left = 1
        Top = 1
        Width = 146
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1052#1094#1096'.'#1072#1076#1099
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EditCUSTNAME: TEdit
        Left = 2
        Top = 17
        Width = 143
        Height = 23
        TabOrder = 1
        OnExit = EditNUMBEROFCREDITExit
        OnKeyPress = EditNUMBEROFCREDITKeyPress
      end
    end
  end
  object MainGrid: TDBGridEh
    Left = 0
    Top = 87
    Width = 849
    Height = 209
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dmRepByCreditPay.Details2ds
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = RUSSIAN_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
    RowDetailPanel.Color = clBtnFace
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    OnDblClick = MainGridDblClick
    OnTitleBtnClick = MainGridTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NUMBEROFCREDIT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'ACC_NO'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'CUSTNAME'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 194
      end
      item
        EditButtons = <>
        FieldName = 'TRAMT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'REST'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'ANNUALYINTERESTRATE'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'PERCENT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'EXDATCOUNT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'CLOSE_DAT'
        Footers = <>
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -12
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Title.TitleButton = True
        Width = 69
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionList1: TActionList
    Left = 144
    Top = 160
    object ActionSearch: TAction
      Caption = 'ActionSearch'
      OnExecute = ActionSearchExecute
    end
  end
end

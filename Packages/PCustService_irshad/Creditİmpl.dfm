object CreditFrm: TCreditFrm
  Left = 0
  Top = 0
  ClientHeight = 397
  ClientWidth = 1033
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainGrid: TDBGridEh
    Left = 0
    Top = 41
    Width = 1033
    Height = 356
    Align = alClient
    AllowedOperations = []
    DataGrouping.GroupLevels = <>
    DataSource = DataModPCustService.CreditDSrc
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    FrozenCols = 4
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
    ParentFont = False
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = MainGridCellClick
    OnDblClick = MainGridDblClick
    OnKeyPress = MainGridKeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 80
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'NUMBEROFCREDIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'CONTRACTACCNO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Hesab '#8470
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 180
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'VAL_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 27
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'ri'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 174
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYINTERESTRATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '% d'#601'r'#601'c'#601'si'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'REST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '('#399'.B)Qal'#305'q'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'INTERESTREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '(F.B)Qal'#305'q'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'PENALTYREST'
        Footers = <>
        Title.Caption = 'Penya'
        Title.Color = clNavy
      end
      item
        EditButtons = <>
        FieldName = 'DUEREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '(G.B)Qal'#305'q'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'DUEINTERESTREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '(G.F.B)Qal'#305'q'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'CREDITLINEAMOUNT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Kreditin m'#601'bl'#601#287'i'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'INITIALAMOUNT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Verilmi'#351' m'#601'bl'#601#287
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 99
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYOVERDUERATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Gecikm'#601' %'
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYPENALTYRATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'C'#601'rim'#601' %'
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'DATEOFCONCLUSION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'A'#231#305'lma tarixi'
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DUEDATEFIRSTCONTRACT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = '('#304'.M)Ba'#287'lanma tarixi'
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PURPOSEOFCREDIT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'T'#601'yinat'#305
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = 'STOPCALCDATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Hesablaman'#305'n dayand'#305'r'#305'lma tarixi'
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'OBLIGATION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #214'hd'#601'lik'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'PLEDGEPRICE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Girovun d'#601'y'#601'ri'
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'DUEDATELASTCONTRACT'
        Footers = <>
        Title.Caption = '(S.M)Ba'#287'lanma tarixi'
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'BOOROWERREST'
        Footers = <>
        Title.Caption = 'Cari Hesab'#305'n qal'#305#287#305
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 120
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 1033
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TimerButton: TXFButton
      Left = 81
      Top = 1
      Width = 80
      Height = 39
      Align = alLeft
      Caption = #199#305'xar'#305#351
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = TimerButtonClick
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object XFButton2: TXFButton
      Left = 248
      Top = 1
      Width = 89
      Height = 39
      Align = alLeft
      Caption = #214'd'#601'm'#601' plan'#305
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = XFButton2Click
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object XFButton1: TXFButton
      Left = 1
      Top = 1
      Width = 80
      Height = 39
      Align = alLeft
      Caption = 'Baxmaq'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = XFButton1Click
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object Returngoods: TXFButton
      Left = 571
      Top = 1
      Width = 109
      Height = 39
      Align = alLeft
      Caption = 'Girov v'#601' Zamin'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = ReturngoodsClick
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object XFButton3: TXFButton
      Left = 337
      Top = 1
      Width = 116
      Height = 39
      Align = alLeft
      Caption = ' Kreditin '#246'd'#601'nilm'#601'si'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
      OnClick = XFButton3Click
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object XFButton5: TXFButton
      Left = 453
      Top = 1
      Width = 118
      Height = 39
      Align = alLeft
      Caption = '  M'#252'qavil'#601'nin '#231'ap'#305
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 5
      OnClick = XFButton5Click
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
    object XFBitBtn1: TXFBitBtn
      Left = 872
      Top = 56
      Width = 75
      Height = 25
      Caption = 'XFBitBtn1'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
    end
    object XFButton4: TXFButton
      Left = 161
      Top = 1
      Width = 87
      Height = 39
      Align = alLeft
      Caption = 'Tran'#351
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 7
      OnClick = XFButton4Click
      Flat = True
    end
    object XFButton6: TXFButton
      Left = 680
      Top = 1
      Width = 109
      Height = 39
      Align = alLeft
      Caption = 'Lizinq m'#601'lumatlar'#305
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 8
      Visible = False
      OnClick = XFButton6Click
      Flat = True
      Gradient.HotColor = clLime
      Gradient.Options = [goGradient, goHotButton, goHotTrack, goHotColor]
    end
  end
  object Ods_shedule: TOracleDataSet
    SQL.Strings = (
      'select*from cm_payment_schedule where creditid=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 336
    Top = 152
  end
end

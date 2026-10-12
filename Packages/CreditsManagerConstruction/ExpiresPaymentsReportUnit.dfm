object ExpiresPaymentsForm: TExpiresPaymentsForm
  Left = 62
  Top = 161
  Caption = 'ExpiresPaymentsForm'
  ClientHeight = 599
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 560
    object BitBtn1: TBitBtn
      Left = 7
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Yenil'#601'm'#601'k'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 98
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excel'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object DTPD: TDateTimePicker
      Left = 226
      Top = 8
      Width = 149
      Height = 21
      Date = 39003.869973958300000000
      Time = 39003.869973958300000000
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 562
    Width = 763
    Height = 37
    Align = alBottom
    Caption = 'Axtar'#305#351
    TabOrder = 1
    ExplicitTop = 264
    ExplicitWidth = 560
    object EditContractno: TEdit
      Left = 1
      Top = 14
      Width = 135
      Height = 21
      TabOrder = 0
      OnKeyPress = EditContractnoKeyPress
    end
  end
  object CommonGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 763
    Height = 521
    Align = alClient
    DataSource = CreditsDatSrc
    FixedColor = clActiveCaption
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRACTNO'
        Title.Caption = 'M'#252'qavil'#601' N-si'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCNO'
        Title.Caption = 'Kredit hesab'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTNAME'
        Title.Caption = 'M'#252#351't'#601'ri'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPENDATE'
        Title.Caption = 'A'#231#305'lma tarixi'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSEDATE'
        Title.Caption = 'Ba'#287'lanma tarixi'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTAMOUNT'
        Title.Caption = 'M'#252'qavil'#601'nin d'#601'y'#601'ri'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GECMEB'
        Title.Caption = #214'd'#601'nil'#601'c'#601'k m'#601'bl'#601#287
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GECGUN'
        Title.Caption = 'Gecikmi'#351' g'#252'n'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLD_NAME'
        Title.Caption = 'Bina'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 159
        Visible = True
      end>
  end
  object Credits: TOracleDataSet
    SQL.Strings = (
      
        'select cont.id, cont.contnum as contractno,contamount,CC_GENERAL' +
        '.get_BuyerName(cont.buyer) as CustName, cont.acc_no as accno,'
      
        'cont.opendate,cont.expdate as closedate,CC_GENERAL.gecikme(cont.' +
        'id) as gecmeb, CC_GENERAL.gecgun(cont.id) as gecgun,cont.bld_nam' +
        'e'
      'from  CC_ACTIVECONTRACTS cont '
      'WHERE  CC_GENERAL.gecgun(cont.id)>0  '
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000A00000004000000490044000100000000001400000043004F004E00
      540052004100430054004E004F00010000000000100000004300550053005400
      4E0041004D0045000100000000000A0000004100430043004E004F0001000000
      0000100000004F00500045004E00440041005400450001000000000012000000
      43004C004F005300450044004100540045000100000000000C00000047004500
      43004D00450042000100000000000C000000470045004300470055004E000100
      000000001000000042004C0044005F004E0041004D0045000100000000001400
      000043004F004E00540041004D004F0055004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 122
    object CreditsID: TFloatField
      FieldName = 'ID'
    end
    object CreditsCONTRACTNO: TWideStringField
      FieldName = 'CONTRACTNO'
      Size = 10
    end
    object CreditsCUSTNAME: TWideStringField
      FieldName = 'CUSTNAME'
      Size = 4000
    end
    object CreditsACCNO: TWideStringField
      FieldName = 'ACCNO'
    end
    object CreditsOPENDATE: TDateTimeField
      FieldName = 'OPENDATE'
    end
    object CreditsCLOSEDATE: TDateTimeField
      FieldName = 'CLOSEDATE'
    end
    object CreditsGECMEB: TFloatField
      FieldName = 'GECMEB'
    end
    object CreditsGECGUN: TFloatField
      FieldName = 'GECGUN'
    end
    object CreditsBLD_NAME: TWideStringField
      FieldName = 'BLD_NAME'
    end
    object CreditsCONTAMOUNT: TFloatField
      FieldName = 'CONTAMOUNT'
    end
  end
  object CreditsDatSrc: TDataSource
    DataSet = Credits
    Left = 120
    Top = 128
  end
  object ExcelExport: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 168
    Top = 128
  end
  object ActionList1: TActionList
    Left = 472
    Top = 216
    object ActnOK: TAction
      Caption = #1043#1103#1073#1091#1083
    end
    object ACTNnook: TAction
      Caption = #1048#1084#1090#1080#1085#1072
    end
    object ActnSearch: TAction
      Caption = 'ActnSearch'
      OnExecute = ActnSearchExecute
    end
  end
end

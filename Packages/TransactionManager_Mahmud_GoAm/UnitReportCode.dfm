object FormReportCode: TFormReportCode
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'FormReportCode'
  ClientHeight = 89
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 623
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 0
    ExplicitTop = 60
    ExplicitWidth = 391
    object Button1: TButton
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ok'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Əməliyyatın_növü: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 23
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' '#399'm'#601'liyyat'#305'n n'#246'v'#252':'
    TabOrder = 1
    ExplicitLeft = -218
    ExplicitTop = 117
    ExplicitWidth = 644
    object Label9: TLabel
      Left = 100
      Top = 5
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBLC_MMX_Transmode: TDBLookupComboBox
      Left = 192
      Top = 1
      Width = 421
      Height = 21
      KeyField = 'NAME'
      ListField = 'DESCRIPTION'
      ListSource = DataSource1
      TabOrder = 0
      OnCloseUp = DBLC_MMX_TransmodeCloseUp
    end
    object EditTransModeCode: TEdit
      Left = 118
      Top = 1
      Width = 74
      Height = 21
      TabOrder = 1
      OnKeyPress = EditTransModeCodeKeyPress
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 23
    Width = 623
    Height = 24
    Align = alTop
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' '#399'. t'#601'snifat kodu:'
    TabOrder = 2
    ExplicitTop = 24
    object Label14: TLabel
      Left = 96
      Top = 5
      Width = 6
      Height = 13
      Caption = '*'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBLC_MMX_reportcode: TDBLookupComboBox
      Left = 192
      Top = 1
      Width = 421
      Height = 21
      KeyField = 'NAME'
      ListField = 'DESCRIPTION'
      ListSource = DataSource2
      TabOrder = 0
      OnCloseUp = DBLC_MMX_reportcodeCloseUp
    end
    object Editreportcode: TEdit
      Left = 118
      Top = 1
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = EditreportcodeExit
      OnKeyPress = EditreportcodeKeyPress
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select*from mmx_reportcode')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 48
    object OracleDataSet2ID: TIntegerField
      FieldName = 'ID'
    end
    object OracleDataSet2NAME: TWideStringField
      FieldName = 'NAME'
    end
    object OracleDataSet2DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 600
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select*from mmx_transmode')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 48
    Top = 48
    object OracleDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TIntegerField
      FieldName = 'NAME'
    end
    object OracleDataSet1DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 400
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 128
    Top = 48
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 120
  end
end

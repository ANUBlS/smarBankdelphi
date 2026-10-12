object AccGrpForm: TAccGrpForm
  Left = 308
  Top = 152
  BorderIcons = [biSystemMenu]
  ClientHeight = 557
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 244
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 341
      Height = 244
      Align = alClient
      DataSource = DataSource1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = #8470
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Qurupun ad'#305
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 272
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 538
    Width = 341
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 244
    Width = 341
    Height = 294
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 341
      Height = 33
      DataSource = DataSource2
      Align = alTop
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 33
      Width = 341
      Height = 261
      Align = alClient
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
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
          FieldName = 'GROUPID'
          ReadOnly = True
          Title.Caption = 'Qrup '#8470' si'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACCOUNTNUMBER'
          Title.Caption = 'Balans hesab'#305
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end>
    end
  end
  object AccGroups: TOracleDataSet
    SQL.Strings = (
      'SELECT id, iname, description'
      '  FROM cm_accountgroups')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000300000004000000490044000100000000000A00000049004E004100
      4D00450001000000000016000000440045005300430052004900500054004900
      4F004E00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 64
    object AccGroupsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccGroupsINAME: TWideStringField
      FieldName = 'INAME'
      Size = 32
    end
    object AccGroupsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object AccGrInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT agi.RowID,agi.groupid, agi.accountnumber'
      '  FROM cm_aginfo agi'
      'WHERE agi.GROUPID=:GROUPID'
      ''
      'order by agi.accountnumber')
    Optimize = False
    Variables.Data = {
      0400000001000000100000003A00470052004F00550050004900440003000000
      0000000000000000}
    Cursor = crSQLWait
    Master = AccGroups
    MasterFields = 'ID'
    DetailFields = 'GROUPID'
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 136
    object AccGrInfoGROUPID: TFloatField
      FieldName = 'GROUPID'
      Required = True
    end
    object AccGrInfoACCOUNTNUMBER: TFloatField
      FieldName = 'ACCOUNTNUMBER'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AccGroups
    Left = 176
    Top = 64
  end
  object DataSource2: TDataSource
    DataSet = AccGrInfo
    Left = 176
    Top = 136
  end
end

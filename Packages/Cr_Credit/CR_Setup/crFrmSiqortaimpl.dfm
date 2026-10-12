object FrmSiqorta: TFrmSiqorta
  Left = 459
  Top = 219
  ClientHeight = 332
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 332
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitHeight = 325
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 342
      Height = 292
      Align = alClient
      DataSource = DataSource1
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SID'
          Title.Caption = 'ID si'
          Title.Color = clBtnText
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'Ad'#251
          Title.Color = clWindowText
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 259
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 294
      Width = 342
      Height = 29
      DataSource = DataSource1
      Align = alBottom
      Flat = True
      TabOrder = 1
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid ,a.*'
      '  FROM cm_insuranceagency a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      450001000000000006000000530049004400010000000000}
    Left = 232
    Top = 56
    object OracleDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 90
    end
    object OracleDataSet1SID: TStringField
      FieldName = 'SID'
      Size = 22
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 176
    Top = 56
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = #209#251#252#238#287#242#224#237#251#237' '#247#229#248#232#228#232
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 120
    Top = 104
  end
end

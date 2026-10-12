object Expert: TExpert
  Left = 445
  Top = 199
  Caption = #199#255#236#224#237#255#242#232' '#241#255#235#225' '#229#228#255#237' '#236#246#242#255#245#255#241#241#232#241' '#225#224#287#255#228' '#236#255#235#243#236#224#242
  ClientHeight = 299
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 400
    Height = 268
    Align = alClient
    DataSource = DataSource1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = 'Kodu'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 38
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
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'filid'
        Title.Caption = 'Filial'
        Title.Color = clBtnText
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 268
    Width = 400
    Height = 31
    DataSource = DataSource1
    VisibleButtons = [nbPrior, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 283
    ExplicitWidth = 431
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid,t.* from cr_expert t')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000800000043004F004400
      4500010000000000080000004E0041004D004500010000000000100000004600
      49004C00490041004C0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 112
    Top = 72
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1CODE: TWideStringField
      FieldName = 'CODE'
      Size = 12
    end
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 80
    end
    object OracleDataSet1FILIALID: TFloatField
      FieldName = 'FILIALID'
    end
    object OracleDataSet1filid: TWideStringField
      FieldKind = fkLookup
      FieldName = 'filid'
      LookupDataSet = OracleDataSet2
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FILIALID'
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 176
    Top = 72
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000140000004B004F0044005F00460049004C00490041004C00
      010000000000}
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 56
  end
end

object SaldoEditorForm: TSaldoEditorForm
  Left = 187
  Top = 170
  Width = 852
  Height = 480
  Caption = 'SaldoEditorForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 844
    Height = 29
    ButtonHeight = 21
    Caption = 'ToolBar1'
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 2
      Width = 240
      Height = 21
      DataSource = AccsSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 844
    Height = 401
    Align = alClient
    DataSource = AccsSource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ACCOUNTNO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Caption = 'ўесаб'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURRENCYSNAME'
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTOPERATIONDATE'
        Title.Caption = 'ямалиййат тарихи'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Caption = '√алыг'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAMOUNT'
        Title.Caption = '≈квивалент'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITTURNOVER'
        Title.Caption = 'ƒебит дюврийй€'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITLTURNOVER'
        Title.Caption = '≈квивалент'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITTURNOVER'
        Title.Caption = ' редит дюврийй€'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITLTURNOVER'
        Title.Caption = '≈квивалент'
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 430
    Width = 844
    Height = 23
    Align = alBottom
    TabOrder = 2
    object AccountNoSearchEdit: TEdit
      Left = 2
      Top = 1
      Width = 119
      Height = 21
      TabOrder = 0
      OnChange = AccountNoSearchEditChange
    end
  end
  object Accs: TOracleDataSet
    SQL.Strings = (
      'select'
      '  a.acc_no as AccountNo,'
      '  c.val_name as CurrencySName,'
      '  a.Name as AccountName,'
      '  t.datdate as LastOperationDate,'
      '  t.Ostat as Amount,'
      '  t.Pok_Ostat as LAmount,'
      '  t.Obr_d as DebitTurnover,'
      '  t.pok_obr_d as DebitLTurnover,'
      '  t.obr_k as CreditTurnover,'
      '  t.pok_obr_k as CreditLTurnover'
      'from'
      '  account a,'
      '  tenostat t,'
      '  avalute c'
      'where'
      '  (a.close_dat is null)'
      '  and (t.acc_id = a.id)'
      '  and (c.valute = a.val_acc)'
      'order by AccountNo ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = True
    Left = 168
    Top = 136
    object AccsACCOUNTNO: TStringField
      FieldName = 'ACCOUNTNO'
    end
    object AccsCURRENCYSNAME: TStringField
      FieldName = 'CURRENCYSNAME'
      Size = 10
    end
    object AccsACCOUNTNAME: TStringField
      FieldName = 'ACCOUNTNAME'
      Size = 90
    end
    object AccsLASTOPERATIONDATE: TDateTimeField
      FieldName = 'LASTOPERATIONDATE'
    end
    object AccsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object AccsLAMOUNT: TFloatField
      FieldName = 'LAMOUNT'
    end
    object AccsDEBITTURNOVER: TFloatField
      FieldName = 'DEBITTURNOVER'
    end
    object AccsDEBITLTURNOVER: TFloatField
      FieldName = 'DEBITLTURNOVER'
    end
    object AccsCREDITTURNOVER: TFloatField
      FieldName = 'CREDITTURNOVER'
    end
    object AccsCREDITLTURNOVER: TFloatField
      FieldName = 'CREDITLTURNOVER'
    end
  end
  object AccsSource: TDataSource
    DataSet = Accs
    Left = 136
    Top = 136
  end
end

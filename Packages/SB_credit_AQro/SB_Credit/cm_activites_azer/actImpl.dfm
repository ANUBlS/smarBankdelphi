object ActFrom: TActFrom
  Left = 350
  Top = 20
  Width = 369
  Height = 718
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 361
    Height = 153
    Align = alTop
    Caption = 'Ѕоржаланын сектоу'
    Color = clCaptionText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 126
      Width = 357
      Height = 25
      DataSource = DataSource1
      Align = alBottom
      Flat = True
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 357
      Height = 111
      Align = alClient
      DataSource = DataSource1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOD'
          Title.Caption = ' од'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'јды'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 281
    Width = 361
    Height = 151
    Align = alTop
    Caption = 'Bржаланын ф€алийй€т нювц'
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object DBNavigator3: TDBNavigator
      Left = 2
      Top = 124
      Width = 357
      Height = 25
      DataSource = DataSource3
      Align = alBottom
      Flat = True
      TabOrder = 0
    end
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 357
      Height = 109
      Align = alClient
      DataSource = DataSource3
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ACT_ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'ID'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOD'
          Title.Caption = ' од'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'јды'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 153
    Width = 361
    Height = 128
    Align = alTop
    Caption = 'Ѕоржаланын ф€алийй€ти '
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 101
      Width = 357
      Height = 25
      DataSource = DataSource2
      Align = alBottom
      Flat = True
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 357
      Height = 86
      Align = alClient
      DataSource = DataSource2
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANK_KOD'
          Title.Caption = ' од'
          Title.Color = clBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'јды'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 432
    Width = 361
    Height = 117
    Align = alTop
    Caption = 'Ѕоржаланын ф€алийй€ти типи '
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object DBNavigator4: TDBNavigator
      Left = 2
      Top = 90
      Width = 357
      Height = 25
      DataSource = DataSource6
      Align = alBottom
      Flat = True
      TabOrder = 0
    end
    object DBGrid4: TDBGrid
      Left = 2
      Top = 15
      Width = 357
      Height = 75
      Align = alClient
      DataSource = DataSource6
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOD'
          Title.Caption = ' од'
          Title.Color = clBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'јды'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end>
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 549
    Width = 361
    Height = 135
    Align = alTop
    Caption = 'Bржаланын ф€алийй€т сащ€си'
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object DBNavigator5: TDBNavigator
      Left = 2
      Top = 108
      Width = 357
      Height = 25
      DataSource = DataSource7
      Align = alBottom
      Flat = True
      TabOrder = 0
    end
    object DBGrid5: TDBGrid
      Left = 2
      Top = 15
      Width = 357
      Height = 93
      Align = alClient
      DataSource = DataSource7
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBtnText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ACT_ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'ID'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOD'
          Title.Caption = ' од'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'јды'
          Title.Color = clBlue
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 254
          Visible = True
        end>
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_creditcat a'
      'order by id,kod'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000030000004B4F44010000000000}
    Session = CMDataModule.CMSession
    Left = 72
    Top = 56
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet1KOD: TStringField
      FieldName = 'KOD'
      Size = 12
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_activities  A'
      'WHERE '
      'ACT_ID=:ACT_ID'
      'order by id ,bank_kod')
    Variables.Data = {0300000001000000070000003A4143545F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000200000049440100000000000B0000004445534352495054
      494F4E0100000000000800000042414E4B5F4B4F440100000000000600000041
      43545F4944010000000000050000004E45574944010000000000}
    Master = OracleDataSet1
    MasterFields = 'ID'
    DetailFields = 'ACT_ID'
    Session = CMDataModule.CMSession
    Left = 88
    Top = 191
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet2DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object OracleDataSet2ACT_ID: TFloatField
      FieldName = 'ACT_ID'
    end
    object OracleDataSet2NEWID: TFloatField
      FieldName = 'NEWID'
    end
    object OracleDataSet2BANK_KOD: TStringField
      FieldName = 'BANK_KOD'
      Size = 12
    end
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'SELECT ROWID,A.*   FROM creditsmgr.cm_activities_type A'
      'where '
      'act_type_id=:act_type_id'
      'order by act_id ,kod'
      ''
      '')
    Variables.Data = {
      03000000010000000C0000003A4143545F545950455F49440300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000060000004143545F4944010000000000040000004E414D45
      010000000000030000004B4F440100000000000B0000004143545F545950455F
      4944010000000000}
    Master = OracleDataSet2
    MasterFields = 'id'
    DetailFields = 'act_type_id'
    Session = CMDataModule.CMSession
    Left = 72
    Top = 343
    object OracleDataSet3ACT_ID: TFloatField
      FieldName = 'ACT_ID'
    end
    object OracleDataSet3NAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet3ACT_TYPE_ID: TFloatField
      FieldName = 'ACT_TYPE_ID'
    end
    object OracleDataSet3KOD: TStringField
      FieldName = 'KOD'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 120
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 144
    Top = 191
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 128
    Top = 343
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_creditcat a'
      'order by id,kod'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000030000004B4F44010000000000}
    Session = CMDataModule.CMSession
    Left = 72
    Top = 56
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object StringField2: TStringField
      FieldName = 'KOD'
      Size = 4
    end
  end
  object DataSource4: TDataSource
    DataSet = OracleDataSet4
    Left = 120
    Top = 56
  end
  object OracleDataSet5: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_creditcat a'
      'order by id,kod'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      0000030000004B4F44010000000000}
    Session = CMDataModule.CMSession
    Left = 72
    Top = 56
    object FloatField2: TFloatField
      FieldName = 'ID'
    end
    object StringField3: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object StringField4: TStringField
      FieldName = 'KOD'
      Size = 4
    end
  end
  object DataSource5: TDataSource
    DataSet = OracleDataSet5
    Left = 120
    Top = 56
  end
  object OracleDataSet6: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_activities_qrup  A'
      'WHERE '
      'act_Q_id=:act_Q_id'
      'order by id ,kod')
    Variables.Data = {
      0300000001000000090000003A4143545F515F49440300000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000030000004B4F44010000000000080000004143545F515F49440100000000
      00}
    Master = OracleDataSet3
    MasterFields = 'act_id'
    DetailFields = 'act_Q_id'
    Session = CMDataModule.CMSession
    Left = 96
    Top = 479
    object OracleDataSet6ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet6NAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet6KOD: TStringField
      FieldName = 'KOD'
      Size = 5
    end
    object OracleDataSet6ACT_Q_ID: TFloatField
      FieldName = 'ACT_Q_ID'
    end
  end
  object DataSource6: TDataSource
    DataSet = OracleDataSet6
    Left = 152
    Top = 479
  end
  object OracleDataSet7: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* FROM creditsmgr.cm_activities_area  A'
      'where act_ar_id = :act_ar_id'
      'order by id ,kod')
    Variables.Data = {
      03000000010000000A0000003A4143545F41525F494404000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      0000030000004B4F44010000000000090000004143545F41525F494401000000
      0000}
    Master = OracleDataSet6
    MasterFields = 'ID'
    DetailFields = 'ACT_AR_ID'
    Session = CMDataModule.CMSession
    Left = 112
    Top = 607
    object OracleDataSet7ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet7NAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object OracleDataSet7KOD: TStringField
      FieldName = 'KOD'
      Size = 5
    end
    object OracleDataSet7ACT_AR_ID: TFloatField
      FieldName = 'ACT_AR_ID'
    end
  end
  object DataSource7: TDataSource
    DataSet = OracleDataSet7
    Left = 160
    Top = 607
  end
end

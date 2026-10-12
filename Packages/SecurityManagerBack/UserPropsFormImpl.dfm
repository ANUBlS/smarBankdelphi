object UserPropsForm: TUserPropsForm
  Left = 317
  Top = 193
  BorderStyle = bsDialog
  Caption = 'UserPropsForm'
  ClientHeight = 272
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 140
      Height = 13
      Caption = '»стифад€чинин параметрл€ри'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 165
      Height = 13
      Caption = '»стифад€чинин параметрл€ини дахил един'
    end
  end
  object DialogPages: TPageControl
    Left = 0
    Top = 32
    Width = 376
    Height = 214
    ActivePage = PropsPage
    Align = alClient
    TabOrder = 1
    TabStop = False
    object PropsPage: TTabSheet
      Caption = 'Ў€хсийй€т в€р€г€си'
      object Label3: TLabel
        Left = 8
        Top = 40
        Width = 68
        Height = 13
        Caption = 'ћцшт€ринин ады:'
      end
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 175
        Height = 13
        Caption = '»стифад€чинин адыны в€ паролу дахил един'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 88
        Width = 305
        Height = 3
      end
      object Label5: TLabel
        Left = 40
        Top = 108
        Width = 27
        Height = 13
        Caption = 'ѕарол:'
      end
      object Label6: TLabel
        Left = 40
        Top = 131
        Width = 57
        Height = 13
        Caption = '“€крар един:'
      end
      object Label7: TLabel
        Left = 8
        Top = 68
        Width = 32
        Height = 13
        Caption = '“€свир:'
      end
      object UserNameEdit: TEdit
        Left = 96
        Top = 40
        Width = 217
        Height = 21
        TabOrder = 0
        OnChange = UserNameEditChange
      end
      object PasswordEdit: TMaskEdit
        Left = 136
        Top = 104
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
        OnChange = PasswordEditChange
      end
      object RetryPasswordEdit: TMaskEdit
        Left = 136
        Top = 128
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
      end
      object HintBox: THintBox
        Left = 40
        Top = 160
        Width = 281
        Height = 18
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'HintBox'
        TabOrder = 4
        Visible = False
        HintStyle = hsError
        Timeout = 4000
        BeepOnMessage = False
      end
      object DescriptionEdit: TEdit
        Left = 96
        Top = 64
        Width = 217
        Height = 21
        TabOrder = 1
      end
    end
    object GroupsPage: TTabSheet
      Caption = '√руплары'
      ImageIndex = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 392
        Height = 29
        Caption = 'ToolBar1'
        EdgeBorders = [ebTop, ebBottom]
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 2
          Width = 240
          Height = 22
          DataSource = Groups
          Flat = True
          TabOrder = 0
        end
      end
      object GroupsGrid: TDBCtrlGrid
        Left = 0
        Top = 46
        Width = 392
        Height = 140
        Align = alClient
        AllowDelete = False
        AllowInsert = False
        ColCount = 1
        Color = clSilver
        DataSource = Groups
        PanelBorder = gbNone
        PanelHeight = 20
        PanelWidth = 376
        ParentColor = False
        TabOrder = 1
        RowCount = 7
        SelectedColor = clNavy
        OnPaintPanel = GroupsGridPaintPanel
        object GroupNameText: TDBText
          Left = 3
          Top = 3
          Width = 294
          Height = 14
          DataField = 'NAME'
          DataSource = Groups
        end
        object DBCheckBox1: TDBCheckBox
          Left = 301
          Top = 2
          Width = 15
          Height = 17
          Caption = 'DBCheckBox1'
          DataField = 'MEMBER'
          DataSource = Groups
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object HeaderControl1: THeaderControl
        Left = 0
        Top = 29
        Width = 392
        Height = 17
        DragReorder = False
        Sections = <
          item
            ImageIndex = -1
            Text = 'јды'
            Width = 270
          end
          item
            ImageIndex = -1
            Text = 'Member'
            Width = 50
          end>
        Style = hsFlat
      end
      object GroupHintBox: THintBox
        Left = 168
        Top = 160
        Width = 150
        Height = 18
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'GroupHintBox'
        TabOrder = 3
        Visible = False
        HintStyle = hsError
        Timeout = 4000
        BeepOnMessage = False
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Security'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 0
        Top = -1
        Width = 369
        Height = 186
        Caption = 'User'#39's rights'
        TabOrder = 0
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 2
          Top = 32
          Width = 365
          Height = 152
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clSilver
          DataSource = Access
          PanelBorder = gbNone
          PanelHeight = 19
          PanelWidth = 349
          ParentColor = False
          TabOrder = 0
          RowCount = 8
          SelectedColor = clNavy
          OnPaintPanel = DBCtrlGrid1PaintPanel
          object AccessNameText: TDBText
            Left = 3
            Top = 3
            Width = 294
            Height = 13
            DataField = 'DESCRIPTION'
            DataSource = Access
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBCheckBox2: TDBCheckBox
            Left = 328
            Top = 1
            Width = 15
            Height = 17
            Caption = 'DBCheckBox2'
            DataField = 'ASSIGNED'
            DataSource = Access
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object HeaderControl2: THeaderControl
          Left = 2
          Top = 15
          Width = 365
          Height = 17
          DragReorder = False
          Sections = <
            item
              ImageIndex = -1
              Text = 'User right'
              Width = 300
            end
            item
              Alignment = taRightJustify
              ImageIndex = -1
              Text = 'Y/N'
              Width = 65
            end>
        end
      end
    end
    object SummaryPage: TTabSheet
      Caption = '—уммари'
      ImageIndex = 2
      OnShow = SummaryPageShow
      object SummaryMemo: TMemo
        Left = 0
        Top = 0
        Width = 392
        Height = 186
        TabStop = False
        Align = alClient
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = SummaryMemoKeyPress
      end
    end
    object ProgressPage: TTabSheet
      Caption = 'Progress'
      ImageIndex = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 246
    Width = 376
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BackButton: TButton
      Left = 75
      Top = 1
      Width = 75
      Height = 25
      Action = DlgBack
      TabOrder = 0
    end
    object NextButton: TButton
      Left = 150
      Top = 1
      Width = 75
      Height = 25
      Action = DlgNext
      Default = True
      TabOrder = 1
    end
    object CancelButton: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 25
      Action = DlgCancel
      TabOrder = 3
    end
    object FinishButton: TButton
      Left = 225
      Top = 1
      Width = 75
      Height = 25
      Action = DlgFinish
      Default = True
      TabOrder = 2
    end
  end
  object Groups: TDataSource
    DataSet = GroupsData
    Left = 220
    Top = 153
  end
  object ActionList1: TActionList
    Left = 284
    Top = 152
    object DlgBack: TAction
      Category = 'Dialog'
      Caption = '&Back'
      OnExecute = DlgBackExecute
      OnUpdate = DlgBackUpdate
    end
    object DlgNext: TAction
      Category = 'Dialog'
      Caption = '&Next'
      OnExecute = DlgNextExecute
      OnUpdate = DlgNextUpdate
    end
    object DlgCancel: TAction
      Category = 'Dialog'
      Caption = '&Cancel'
      OnExecute = DlgCancelExecute
    end
    object DlgFinish: TAction
      Category = 'Dialog'
      Caption = '&Finish'
      OnExecute = DlgFinishExecute
      OnUpdate = DlgFinishUpdate
    end
  end
  object GroupsData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  g.ID,'
      '  g.Name,'
      '  g.Create_Date,'
      '  g.Created_By_User,'
      '  g.Flags,'
      '  g.Member,'
      '  g.rowid'
      'from ('
      '  select'
      '    g.*, ('
      '      select decode(count(*), 0, 0, 1)'
      '        from security_group_membership'
      '      where'
      '        (client# = :UserID)'
      '        and (group# = g.ID)'
      '    ) Member'
      '  from group$ g'
      ') g'
      'order by g.name'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A555345524944030000000000000000000000}
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
    RefreshOptions = []
    OnApplyRecord = GroupsDataApplyRecord
    CommitOnPost = False
    CachedUpdates = True
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    AfterEdit = GroupsDataAfterEdit
    AfterScroll = GroupsDataAfterScroll
    Left = 252
    Top = 152
    object GroupsDataID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object GroupsDataNAME: TStringField
      DisplayLabel = 'јды'
      FieldName = 'NAME'
      Size = 32
    end
    object GroupsDataCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
      Visible = False
    end
    object GroupsDataCREATED_BY_USER: TFloatField
      FieldName = 'CREATED_BY_USER'
      Visible = False
    end
    object GroupsDataFLAGS: TFloatField
      FieldName = 'FLAGS'
      Visible = False
    end
    object GroupsDataMEMBER: TFloatField
      FieldName = 'MEMBER'
    end
  end
  object IniSource1: TIniSource
    Active = False
    Left = 164
    Top = 160
  end
  object UserPropsData: TOracleDataSet
    SQL.Strings = (
      'select * from user$'
      'where ID = :UserID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {0300000001000000070000003A555345524944030000000000000000000000}
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
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 212
    Top = 96
  end
  object AccessData: TOracleDataSet
    SQL.Strings = (
      'select r.*, r.rowid'
      'from ('
      '  select'
      '    acc.*,'
      '    sbsec.access_check_int('
      '      :CLIENTID,'
      '      ('
      '      select sid# from security_clients$'
      '      where ID = :CLIENTID'
      '      ),'
      '      acc.ID'
      '    ) as Assigned'
      '  from'
      '    security_access$ acc'
      '  where'
      '    IS_ACCESS_DESCENDS('
      '      ID,'
      '      ('
      '        select ID'
      '          from security_access$'
      '        where name = '#39'Rights'#39
      '      )'
      '    ) = 1'
      ') r'
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000090000003A434C49454E5449440300000000000000000000
      00}
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
    RefreshOptions = []
    OnApplyRecord = AccessDataApplyRecord
    CommitOnPost = True
    CachedUpdates = True
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    AfterEdit = AccessDataAfterEdit
    Left = 324
    Top = 104
    object AccessDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccessDataNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 32
    end
    object AccessDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 256
    end
    object AccessDataPARENTID: TFloatField
      FieldName = 'PARENTID'
    end
    object AccessDataASSIGNED: TFloatField
      FieldName = 'ASSIGNED'
    end
  end
  object Access: TDataSource
    DataSet = AccessData
    Left = 292
    Top = 104
  end
end

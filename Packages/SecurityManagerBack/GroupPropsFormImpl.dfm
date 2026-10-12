object GroupPropsForm: TGroupPropsForm
  Left = 392
  Top = 182
  BorderStyle = bsDialog
  Caption = 'New group'
  ClientHeight = 282
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TitlePanel: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 248
      Height = 13
      Caption = '»стифад€чил€рин группунун хцсусийй€тл€ринин д€иштирилм€си'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 128
      Height = 13
      Caption = '√руппун хцсусийй€тл€ри'
    end
  end
  object AddButton: TButton
    Left = 222
    Top = 257
    Width = 75
    Height = 25
    Caption = '…аддаша йаз'
    Default = True
    TabOrder = 2
    OnClick = AddButtonClick
  end
  object CancelButton: TButton
    Left = 302
    Top = 257
    Width = 75
    Height = 25
    Caption = '»мтина'
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 378
    Height = 207
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = '√руппун хцсусийй€тл€ри'
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 370
        Height = 179
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 11
          Top = 48
          Width = 18
          Height = 13
          Caption = 'јды:'
        end
        object Label4: TLabel
          Left = 9
          Top = 67
          Width = 56
          Height = 13
          Caption = 'Description:'
        end
        object GroupNameEdit: TEdit
          Left = 88
          Top = 44
          Width = 153
          Height = 21
          TabOrder = 0
        end
        object DescriptionEdit: TEdit
          Left = 88
          Top = 65
          Width = 153
          Height = 21
          TabOrder = 1
        end
        object HintBox: THintBox
          Left = 3
          Top = 145
          Width = 281
          Height = 18
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'HintBox'
          TabOrder = 2
          Visible = False
          HintStyle = hsWarning
          Timeout = 4000
          BeepOnMessage = True
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Groups membership'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 370
        Height = 179
        Align = alClient
        TabOrder = 0
        object MembershipCtrlGrid: TDBCtrlGrid
          Left = 2
          Top = 32
          Width = 366
          Height = 145
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clSilver
          DataSource = Membership
          PanelBorder = gbNone
          PanelHeight = 18
          PanelWidth = 350
          ParentColor = False
          TabOrder = 0
          RowCount = 8
          SelectedColor = clNavy
          OnPaintPanel = MembershipCtrlGridPaintPanel
          object GroupNameText: TDBText
            Left = 3
            Top = 3
            Width = 294
            Height = 13
            DataField = 'NAME'
            DataSource = Membership
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBCheckBox3: TDBCheckBox
            Left = 328
            Top = 1
            Width = 15
            Height = 17
            Caption = 'DBCheckBox2'
            DataField = 'MEMBER'
            DataSource = Membership
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object HeaderControl3: THeaderControl
          Left = 2
          Top = 15
          Width = 366
          Height = 17
          DragReorder = False
          Sections = <
            item
              ImageIndex = -1
              Text = 'group'
              Width = 300
            end
            item
              Alignment = taRightJustify
              ImageIndex = -1
              Text = 'member'
              Width = 65
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Roles'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 370
        Height = 179
        Align = alClient
        TabOrder = 0
        object HeaderControl1: THeaderControl
          Left = 2
          Top = 15
          Width = 366
          Height = 17
          DragReorder = False
          Sections = <
            item
              ImageIndex = -1
              Text = 'Role'
              Width = 310
            end
            item
              ImageIndex = -1
              Text = 'Y/N'
              Width = 100
            end>
          Style = hsFlat
        end
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 2
          Top = 32
          Width = 366
          Height = 145
          Align = alClient
          AllowInsert = False
          ColCount = 1
          Color = clSilver
          DataSource = Roles
          PanelBorder = gbNone
          PanelHeight = 18
          PanelWidth = 350
          ParentColor = False
          TabOrder = 1
          RowCount = 8
          SelectedColor = clNavy
          OnPaintPanel = DBCtrlGrid1PaintPanel
          object RoleNameText: TDBText
            Left = 2
            Top = 1
            Width = 295
            Height = 13
            DataField = 'NAME'
            DataSource = Roles
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = 316
            Top = 0
            Width = 15
            Height = 17
            Caption = 'DBCheckBox1'
            DataField = 'MEMBER'
            DataSource = Roles
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Security'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 370
        Height = 179
        Align = alClient
        TabOrder = 0
        object DBCtrlGrid2: TDBCtrlGrid
          Left = 2
          Top = 32
          Width = 366
          Height = 144
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clSilver
          DataSource = Access
          PanelBorder = gbNone
          PanelHeight = 18
          PanelWidth = 350
          ParentColor = False
          TabOrder = 0
          RowCount = 8
          SelectedColor = clNavy
          OnPaintPanel = DBCtrlGrid2PaintPanel
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
          Width = 366
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
  end
  object Roles: TDataSource
    DataSet = RolesData
    Left = 256
    Top = 56
  end
  object RolesData: TOracleDataSet
    SQL.Strings = (
      'select'
      '  r.ID,'
      '  r.name,'
      '  r.Member,'
      '  r.rowid'
      'from ('
      '  select'
      '    r.user# as ID,'
      '    r.name,'
      '    ('
      '      select decode(count(*), 0, 0, 1)'
      '        from security_group_roles'
      '      where'
      '        (GroupID = :GroupID)'
      '        and (RoleID = r.user#)'
      '    ) as Member'
      '  from'
      '    sys.user$ r'
      '  where'
      '    (type# = 0)'
      '    and (not (name in ('#39'PUBLIC'#39', '#39'_NEXT_USER'#39')))'
      ') r'
      'order by r.name')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A47524F55504944030000000000000000000000}
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
    OnApplyRecord = RolesDataApplyRecord
    CommitOnPost = True
    CachedUpdates = True
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 288
    Top = 56
    object RolesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RolesDataNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 30
    end
    object RolesDataMEMBER: TFloatField
      FieldName = 'MEMBER'
    end
  end
  object GroupPropertiesData: TOracleDataSet
    SQL.Strings = (
      'select * from group$'
      'where ID = :GroupID')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      0300000001000000080000003A47524F55504944030000000000000000000000}
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
    Left = 320
    Top = 56
    object GroupPropertiesDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object GroupPropertiesDataNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
    object GroupPropertiesDataFLAGS: TFloatField
      FieldName = 'FLAGS'
    end
    object GroupPropertiesDataDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
  end
  object Access: TDataSource
    DataSet = AccessData
    Left = 252
    Top = 24
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
      'order by r.name')
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
    Left = 284
    Top = 24
  end
  object MembershipData: TOracleDataSet
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
      '        (client# = :ClientID)'
      '        and (group# = g.ID)'
      '    ) Member'
      '  from group$ g'
      '  where'
      '    g.ID <> :ClientID'
      ') g'
      'order by g.name'
      ''
      ' ')
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
    OnApplyRecord = MembershipDataApplyRecord
    CommitOnPost = True
    CachedUpdates = True
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 324
    Top = 137
    object MembershipDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object MembershipDataNAME: TStringField
      FieldName = 'NAME'
      Size = 32
    end
    object MembershipDataCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object MembershipDataCREATED_BY_USER: TFloatField
      FieldName = 'CREATED_BY_USER'
    end
    object MembershipDataFLAGS: TFloatField
      FieldName = 'FLAGS'
    end
    object MembershipDataMEMBER: TFloatField
      FieldName = 'MEMBER'
    end
  end
  object Membership: TDataSource
    DataSet = MembershipData
    Left = 292
    Top = 137
  end
end

object Sazlama: TSazlama
  Left = 61
  Top = 54
  Align = alClient
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Sazlama'
  ClientHeight = 605
  ClientWidth = 1187
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 56
    Top = 197
    Width = 36
    Height = 13
    Caption = 'DEBET'
  end
  object Label8: TLabel
    Left = 232
    Top = 197
    Width = 40
    Height = 13
    Caption = 'KREDIT'
  end
  object Label9: TLabel
    Left = 408
    Top = 197
    Width = 40
    Height = 13
    Caption = 'SUMMA'
  end
  object Label13: TLabel
    Left = 552
    Top = 197
    Width = 45
    Height = 13
    Caption = 'FORMAT'
  end
  object GroupBox1: TGroupBox
    Left = 497
    Top = 386
    Width = 690
    Height = 219
    Align = alClient
    Caption = 'БИЖ-ляри йенилямя'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial AzLat'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object inst: TLabel
      Left = 16
      Top = 117
      Width = 87
      Height = 12
      Caption = 'Entered Institution'
      Enabled = False
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Там йенилямя'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Дяйишикликляри йенилямя'
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 8
      Top = 80
      Width = 177
      Height = 20
      TabOrder = 2
    end
    object Button4: TButton
      Left = 192
      Top = 80
      Width = 41
      Height = 25
      Caption = '........'
      TabOrder = 3
      Visible = False
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 240
      Top = 80
      Width = 97
      Height = 25
      Caption = 'Йениля'
      TabOrder = 4
      OnClick = Button5Click
    end
    object instcount: TEdit
      Left = 112
      Top = 112
      Width = 121
      Height = 20
      Enabled = False
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 1187
    Height = 209
    Align = alTop
    Caption = 'Эюндярилянлярин  сазланмасы'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 45
      Height = 13
      Caption = 'ФОРМАТ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 107
      Top = 21
      Width = 36
      Height = 13
      Caption = 'ДЕБЕТ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 256
      Top = 21
      Width = 40
      Height = 13
      Caption = 'КРЕДИТ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 396
      Top = 21
      Width = 46
      Height = 13
      Caption = 'МЯБЛЯЬ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 552
      Top = 20
      Width = 47
      Height = 13
      Caption = 'ТЯЙИНАТ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 692
      Top = 19
      Width = 31
      Height = 13
      Caption = 'ФИЛИАЛ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 849
      Top = 17
      Width = 91
      Height = 13
      Caption = 'ТЯЙИНАТ БАШЛЫЬЫ'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object format: TDBViewComboBox
      Left = 8
      Top = 37
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnChange = formatChange
      ListSource = SWDataModule.MtSource
      ListFields = 'COLUMN_NAME'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object debet: TDBViewComboBox
      Left = 100
      Top = 37
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      ListSource = SWDataModule.set_fields
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object kredit: TDBViewComboBox
      Left = 248
      Top = 37
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      ListSource = SWDataModule.set_fields2
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object summ: TDBViewComboBox
      Left = 396
      Top = 37
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      ListSource = SWDataModule.set_fields3
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object destination: TDBViewComboBox
      Left = 544
      Top = 36
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      ListSource = SWDataModule.set_fields4
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object filials: TDBViewComboBox
      Left = 692
      Top = 35
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
      ListSource = SWDataModule.filial_datasource
      ListFields = 'name'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object prow: TDBGrid
      Left = 8
      Top = 62
      Width = 985
      Height = 137
      DataSource = SWDataModule.prowok
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
    end
    object Dest_Title: TDBViewComboBox
      Left = 841
      Top = 34
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 7
      ListSource = SWDataModule.set_fields5
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object Add: TButton
      Left = 1000
      Top = 75
      Width = 75
      Height = 25
      Caption = 'Ялавя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = AddClick
    end
    object edit: TButton
      Left = 1000
      Top = 107
      Width = 75
      Height = 25
      Caption = 'Редактя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = editClick
    end
    object delete: TButton
      Left = 1001
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Сил'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 209
    Width = 1187
    Height = 177
    Align = alTop
    Caption = 'Эялянлянрин  сазланмасы'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object DBViewComboBox1: TDBViewComboBox
      Left = 7
      Top = 21
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'DBViewComboBox1 - DataSource2 { sw_field }'
      ListSource = DataSource2
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object DBViewComboBox2: TDBViewComboBox
      Left = 183
      Top = 21
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      Text = 'DBViewComboBox2 - DataSource2 { sw_field }'
      ListSource = DataSource2
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object DBViewComboBox3: TDBViewComboBox
      Left = 360
      Top = 20
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Text = 'DBViewComboBox3 - DataSource4 { sw_field }'
      ListSource = DataSource4
      ListFields = 'sw_field'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object DBViewComboBox4: TDBViewComboBox
      Left = 519
      Top = 20
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      ListSource = SWDataModule.MtSource
      ListFields = 'COLUMN_NAME'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 49
      Width = 625
      Height = 120
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DEBET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KREDIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Visible = True
        end>
    end
    object Button6: TButton
      Left = 641
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Ялавя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = AddClick
    end
    object Button7: TButton
      Left = 641
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Редактя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = editClick
    end
    object Button8: TButton
      Left = 641
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Сил'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 386
    Width = 497
    Height = 219
    Align = alLeft
    Caption = 'Мцхбир щесабларын сазланмасы'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 5
      Top = 54
      Width = 366
      Height = 147
      DataSource = SWDataModule.sw_coraccounts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
    end
    object acc: TSearchEdit
      Left = 5
      Top = 28
      Width = 173
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DataSource = SWDataModule.Account_sw
      SearchField = 'acc_no'
    end
    object bic: TSearchEdit
      Left = 181
      Top = 28
      Width = 190
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DataSource = SWDataModule.sw_banks
      SearchField = 'bic'
    end
    object Button1: TButton
      Left = 378
      Top = 64
      Width = 71
      Height = 25
      Caption = 'Ялавя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Button2: TButton
      Left = 378
      Top = 128
      Width = 71
      Height = 25
      Caption = 'Сил'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Button3: TButton
      Left = 378
      Top = 96
      Width = 71
      Height = 25
      Caption = 'Редактя ет'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object Openbic: TOpenDialog
    Filter = 'excel|*.xlsx'
    Left = 1024
    Top = 358
  end
  object MainMenu1: TMainMenu
    Left = 1056
    Top = 365
    object N1: TMenuItem
      Caption = 'View'
      object Filials1: TMenuItem
        Caption = 'Filials'
        OnClick = Filials1Click
      end
      object Main1: TMenuItem
        Caption = 'Main'
        OnClick = Main1Click
      end
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
  object dbgridfilial: TOracleDataSet
    SQL.Strings = (
      'select a.filial as filial , a.account as hesab from sw_filials a')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000600000046494C49414C0100000000000500000048455341
      42010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 1096
    Top = 285
  end
  object fil_all: TDataSource
    DataSet = dbgridfilial
    Left = 1128
    Top = 285
  end
  object filialoffilial: TOracleDataSet
    SQL.Strings = (
      'select * from filial')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      00000A0000004B4F445F46494C49414C010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 1096
    Top = 221
  end
  object accountoffilial: TOracleDataSet
    SQL.Strings = (
      'select * from account where close_dat is null order by acc_no')
    QBEDefinition.QBEFieldDefs = {
      0400000018000000020000004944010000000000060000004B4C495F49440100
      00000000050000004F505F4944010000000000060000004143435F4E4F010000
      0000000700000056414C5F414343010000000000040000004E414D4501000000
      0000080000004F50454E5F44415401000000000009000000434C4F53455F4441
      540100000000000700000042414C5F434E310100000000000700000042414C5F
      434E320100000000000700000042414C5F434E33010000000000070000004241
      4C5F434E340100000000000600000046494C49414C0100000000000900000053
      494D5F4F54434554010000000000060000005449504143430100000000000500
      00004C494D49540100000000000A0000004F4C445F4143435F4E4F0100000000
      0008000000504149525F41434301000000000007000000494E53494445520100
      0000000004000000534944230100000000000600000054454D50494401000000
      0000050000004F574E494401000000000008000000505F435553544944010000
      0000000B0000004942414E5F4143435F4E4F010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 1096
    Top = 253
  end
  object fli: TDataSource
    DataSet = filialoffilial
    Left = 1128
    Top = 221
  end
  object ac: TDataSource
    DataSet = accountoffilial
    Left = 1128
    Top = 253
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select * from  sw_prow_in'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000050000004445424554010000
      000000060000004B52454449540100000000000500000053554D4D4101000000
      0000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 1096
    Top = 397
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 1128
    Top = 397
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select * from sw_fields'
      ' ')
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000800000053575F4649454C440100000000000D0000005357
      5F4D41494E5F4649454C44010000000000050000004D54313030010000000000
      050000004D54313031010000000000050000004D543130320100000000000500
      00004D54313033010000000000050000004D5432303001000000000005000000
      4D54323032010000000000050000004D54323035010000000000050000004D54
      333030010000000000050000004D54333230010000000000050000004D543730
      37010000000000050000004D54373330010000000000050000004D5437333201
      0000000000050000004D54373334010000000000050000004D54373430010000
      000000050000004D54373432010000000000050000004D543734370100000000
      00050000004D54373534010000000000050000004D5437363001000000000005
      0000004D54373637010000000000050000004D54373638010000000000050000
      004D54373639010000000000050000004D54393030010000000000050000004D
      54393130010000000000050000004D54393430010000000000050000004D5439
      35300100000000000800000043415445474F5259010000000000070000005357
      5F4D41494E010000000000080000004D54313033415A4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 1096
    Top = 429
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select * from sw_fields')
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000800000053575F4649454C440100000000000D0000005357
      5F4D41494E5F4649454C44010000000000050000004D54313030010000000000
      050000004D54313031010000000000050000004D543130320100000000000500
      00004D54313033010000000000050000004D5432303001000000000005000000
      4D54323032010000000000050000004D54323035010000000000050000004D54
      333030010000000000050000004D54333230010000000000050000004D543730
      37010000000000050000004D54373330010000000000050000004D5437333201
      0000000000050000004D54373334010000000000050000004D54373430010000
      000000050000004D54373432010000000000050000004D543734370100000000
      00050000004D54373534010000000000050000004D5437363001000000000005
      0000004D54373637010000000000050000004D54373638010000000000050000
      004D54373639010000000000050000004D54393030010000000000050000004D
      54393130010000000000050000004D54393430010000000000050000004D5439
      35300100000000000800000043415445474F5259010000000000070000005357
      5F4D41494E010000000000080000004D54313033415A4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 1096
    Top = 461
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      'select * from sw_fields')
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000800000053575F4649454C440100000000000D0000005357
      5F4D41494E5F4649454C44010000000000050000004D54313030010000000000
      050000004D54313031010000000000050000004D543130320100000000000500
      00004D54313033010000000000050000004D5432303001000000000005000000
      4D54323032010000000000050000004D54323035010000000000050000004D54
      333030010000000000050000004D54333230010000000000050000004D543730
      37010000000000050000004D54373330010000000000050000004D5437333201
      0000000000050000004D54373334010000000000050000004D54373430010000
      000000050000004D54373432010000000000050000004D543734370100000000
      00050000004D54373534010000000000050000004D5437363001000000000005
      0000004D54373637010000000000050000004D54373638010000000000050000
      004D54373639010000000000050000004D54393030010000000000050000004D
      54393130010000000000050000004D54393430010000000000050000004D5439
      35300100000000000800000043415445474F5259010000000000070000005357
      5F4D41494E010000000000080000004D54313033415A4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 1096
    Top = 325
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 1128
    Top = 429
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 1128
    Top = 461
  end
  object DataSource4: TDataSource
    DataSet = OracleDataSet4
    Left = 1128
    Top = 325
  end
  object OracleDataSet6: TOracleDataSet
    SQL.Strings = (
      'select * from sw_fields')
    QBEDefinition.QBEFieldDefs = {
      040000001E0000000800000053575F4649454C440100000000000D0000005357
      5F4D41494E5F4649454C44010000000000050000004D54313030010000000000
      050000004D54313031010000000000050000004D543130320100000000000500
      00004D54313033010000000000050000004D5432303001000000000005000000
      4D54323032010000000000050000004D54323035010000000000050000004D54
      333030010000000000050000004D54333230010000000000050000004D543730
      37010000000000050000004D54373330010000000000050000004D5437333201
      0000000000050000004D54373334010000000000050000004D54373430010000
      000000050000004D54373432010000000000050000004D543734370100000000
      00050000004D54373534010000000000050000004D5437363001000000000005
      0000004D54373637010000000000050000004D54373638010000000000050000
      004D54373639010000000000050000004D54393030010000000000050000004D
      54393130010000000000050000004D54393430010000000000050000004D5439
      35300100000000000800000043415445474F5259010000000000070000005357
      5F4D41494E010000000000080000004D54313033415A4E010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 1096
    Top = 365
  end
  object DataSource5: TDataSource
    DataSet = OracleDataSet6
    Left = 1128
    Top = 365
  end
  object CMExcelExport1: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 1056
    Top = 324
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 1024
    Top = 288
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1056
    Top = 288
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1024
    Top = 320
  end
end

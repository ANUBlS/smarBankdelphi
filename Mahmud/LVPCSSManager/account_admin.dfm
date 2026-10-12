object Acccount: TAcccount
  Left = 426
  Top = 182
  Width = 271
  Height = 463
  Caption = 'Acccount'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -1
    Top = -1
    Width = 263
    Height = 428
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Филиал:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 55
      Width = 38
      Height = 13
      Caption = 'Валйута:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 93
      Width = 34
      Height = 13
      Caption = 'Щесаб:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 229
      Top = 88
      Width = 25
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      OnClick = SpeedButton3Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 123
      Width = 248
      Height = 304
      BiDiMode = bdLeftToRight
      Color = clSilver
      DataSource = DataSource1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VAL_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Val.'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clWhite
          Expanded = False
          FieldName = 'ACC_NO'
          Title.Alignment = taCenter
          Title.Caption = 'Щесаб'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Филиал'
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end>
    end
    object ComFilial1: TDBViewComboBox
      Left = 55
      Top = 15
      Width = 190
      Height = 21
      Style = csDropDownList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      ListSource = PropertiesForm.DSFilial
      ListFields = 'NAME'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object Combo_valute1: TComboBox
      Left = 55
      Top = 50
      Width = 191
      Height = 21
      Style = csDropDownList
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
    end
    object SearchXsAccount: TSearchEdit
      Left = 55
      Top = 87
      Width = 163
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 3
      SearchField = 'acc_no'
    end
    object Valute_ID1: TListBox
      Left = 123
      Top = 52
      Width = 26
      Height = 16
      ItemHeight = 13
      TabOrder = 4
      Visible = False
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT v.val_name, a.acc_no, f.NAME'
      '  FROM xs_accounts x, avalute v, account a, Filial f'
      
        ' WHERE (x.valute = v.valute) AND (x.facc_id = a.id) AND (f.id = ' +
        'x.branchid)')
    QBEDefinition.QBEFieldDefs = {
      04000000030000000800000056414C5F4E414D45010000000000060000004143
      435F4E4F010000000000040000004E414D45010000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 39
    Top = 183
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 87
    Top = 183
  end
end

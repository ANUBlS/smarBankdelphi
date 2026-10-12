object FrmCatagories: TFrmCatagories
  Left = 423
  Top = 209
  Width = 456
  Height = 111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 300
    Top = 48
    Width = 66
    Height = 22
    Caption = 'ίλΰβÿ ες'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 369
    Top = 48
    Width = 63
    Height = 22
    Caption = 'Αΰόλΰ'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 9
    Top = 4
    Width = 29
    Height = 13
    Caption = 'Òθολÿπ '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 9
    Top = 18
    Width = 436
    Height = 21
    DropDownBox.Sizable = True
    EditButtons = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    KeyField = 'ID'
    ListField = 'DESCRIPTION'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Top = 48
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select c.id,v.name||'#39'-'#39'||c.description description  from '
      'creditsmgr.CM_CATEGORIES c,'
      'creditsmgr.cm_activities a,'
      'creditsmgr.cm_creditcat k,'
      'creditsmgr.cm_vid_sob   v'
      'where  '
      'c.act_id=a.id and'
      'k.id=a.act_id and'
      'v.id=k.vid_sob and'
      'c.id not in (SELECT catagoriesid'
      '  FROM cm_categories_add) '
      'order by description'
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000200000049440100000000000B0000004445534352495054
      494F4E010000000000}
    Session = CMDataModule.CMSession
    Left = 40
    Top = 48
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 279
    end
  end
  object OraclePackage1: TOraclePackage
    Session = CMDataModule.CMSession
    PackageName = 'CM_N3_SD'
    Left = 72
    Top = 48
  end
end

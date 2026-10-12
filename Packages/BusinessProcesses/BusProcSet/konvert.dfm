object konvert1: Tkonvert1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 192
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 161
    Width = 384
    Height = 31
    Align = alBottom
    TabOrder = 0
    object Edit1: TEdit
      Left = 0
      Top = 6
      Width = 49
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 55
      Top = 6
      Width = 290
      Height = 21
      TabOrder = 1
      OnChange = Edit2Change
    end
  end
  object GridAccount1: TDBGrid
    Left = 0
    Top = 0
    Width = 384
    Height = 161
    Align = alClient
    Color = clBtnFace
    DataSource = DataSource9
    DrawingStyle = gdsGradient
    FixedColor = clActiveCaption
    GradientEndColor = clNavy
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridAccount1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SHORTNAME'
        Title.Caption = #304'D'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FULLPATH'
        Title.Caption = 'Konvertasiya'
        Visible = True
      end>
  end
  object OracleDataSet9: TOracleDataSet
    SQL.Strings = (
      
        'select a.id,a.shortname,a.fullpath,a.different,a.extra from conv' +
        'ert_assignments a '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000005000000040000004900440001000000000012000000530048004F00
      520054004E0041004D00450001000000000010000000460055004C004C005000
      4100540048000100000000001200000044004900460046004500520045004E00
      54000100000000000A00000045005800540052004100010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 64
    object OracleDataSet9ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet9SHORTNAME: TWideStringField
      FieldName = 'SHORTNAME'
      Required = True
      Size = 10
    end
    object OracleDataSet9FULLPATH: TWideStringField
      FieldName = 'FULLPATH'
      Size = 200
    end
    object OracleDataSet9EXTRA: TWideStringField
      FieldName = 'EXTRA'
      Size = 10
    end
    object OracleDataSet9DIFFERENT: TFloatField
      FieldName = 'DIFFERENT'
    end
  end
  object DataSource9: TDataSource
    DataSet = OracleDataSet9
    Left = 120
    Top = 24
  end
end

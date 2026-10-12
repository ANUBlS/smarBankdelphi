object frmkindaccs: Tfrmkindaccs
  Left = 512
  Top = 212
  BorderIcons = [biSystemMenu]
  Caption = 'frmkindaccs'
  ClientHeight = 353
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object StatusBar1: TStatusBar
    Left = 0
    Top = 334
    Width = 461
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 461
    Height = 334
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1065#1077#1089#1072#1073#1083#1072#1088
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 27
        Width = 488
        Height = 303
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 488
        Height = 27
        DataSource = DataSource1
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alTop
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1083#1072#1088
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 27
        Width = 453
        Height = 278
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPTION'
            Width = 237
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 0
        Width = 453
        Height = 27
        DataSource = DataSource2
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid,a.acc_no'
      '  FROM pbf_kindofaccs a'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000C0000004100430043005F004E004F00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 80
    object OracleDataSet1ACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Required = True
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 88
    Top = 80
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'SELECT a.rowid ,a.id, a.name,a.description'
      '  FROM pbf_otheroptypes a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 52
    Top = 128
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet2NAME: TWideStringField
      FieldName = 'NAME'
      Size = 23
    end
    object OracleDataSet2DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 100
    Top = 128
  end
end

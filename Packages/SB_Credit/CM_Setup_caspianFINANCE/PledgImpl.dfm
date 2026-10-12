object PledgForm: TPledgForm
  Left = 421
  Top = 223
  BorderIcons = [biSystemMenu]
  Caption = 'PledgForm'
  ClientHeight = 517
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 34
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 415
      Height = 30
      DataSource = DataSourcePlegds
      Align = alClient
      Flat = True
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 34
    Width = 419
    Height = 231
    Align = alTop
    Caption = 'Girovlar'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 415
      Height = 214
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = DataSourcePlegds
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TYPECODE'
          Footers = <>
          Title.Caption = 'Kodu'
          Title.Color = clSilver
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = 'T'#601'yinat'#305
          Title.Color = clSilver
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 235
        end
        item
          EditButtons = <>
          FieldName = 'PECENT'
          Footers = <>
          Title.Caption = 'Amartizasiya %'
          Width = 80
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 265
    Width = 419
    Height = 252
    Align = alClient
    Caption = 'Girovlar'#305'n  '#231'e'#351'idi'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 45
      Width = 415
      Height = 205
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
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
          Width = 229
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OUTBAL_CIN'
          Title.Caption = 'Balans hes'
          Width = 96
          Visible = True
        end>
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 15
      Width = 415
      Height = 30
      DataSource = DataSource1
      Align = alTop
      TabOrder = 1
    end
  end
  object DataSourcePlegds: TDataSource
    DataSet = Plegds
    Left = 80
    Top = 104
  end
  object Plegds: TOracleDataSet
    SQL.Strings = (
      'SELECT Rowid,a.*'
      '  FROM cm_pledges a'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000800000010000000540059005000450043004F004400450001000000
      0000180000004E0045004500440050004C004100430045004F00550054000100
      00000000160000004400450053004300520049005000540049004F004E000100
      000000000A000000540045004D00490044000100000000000400000049004400
      0100000000000E00000050005500520043004F00440045000100000000001400
      00004F0055005400420041004C005F00430049004E000100000000000C000000
      50004500430045004E005400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 152
    Top = 96
    object PlegdsTYPECODE: TWideStringField
      FieldName = 'TYPECODE'
      Required = True
      Size = 8
    end
    object PlegdsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object PlegdsNEEDPLACEOUT: TFloatField
      DisplayLabel = #1041'.'#1050'-'#1076#1072' '#1081#1077#1088#1083#1103#1096#1076#1080#1088
      FieldName = 'NEEDPLACEOUT'
    end
    object PlegdsTEMID: TFloatField
      FieldName = 'TEMID'
    end
    object PlegdsID: TFloatField
      FieldName = 'ID'
    end
    object PlegdsPURCODE: TWideStringField
      FieldName = 'PURCODE'
      Size = 15
    end
    object PlegdsOUTBAL_CIN: TWideStringField
      FieldName = 'OUTBAL_CIN'
      Size = 6
    end
    object PlegdsPECENT: TFloatField
      FieldName = 'PECENT'
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 120
    Top = 336
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid ,a.* from CM_PLEDGSORTS a where pldid = :pldid')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A0050004C004400490044000400000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000080000004E0041004D00
      45000100000000000A00000050004C0044004900440001000000000010000000
      480045005300410042004B004F004400010000000000140000004F0055005400
      420041004C005F00430049004E00010000000000}
    Master = Plegds
    MasterFields = 'ID'
    DetailFields = 'PLDID'
    Session = sboapiDataModule.SBSession
    Left = 208
    Top = 336
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 80
    end
    object OracleDataSet1PLDID: TFloatField
      FieldName = 'PLDID'
    end
    object OracleDataSet1HESABKOD: TWideStringField
      FieldName = 'HESABKOD'
      Size = 3
    end
    object OracleDataSet1OUTBAL_CIN: TWideStringField
      FieldName = 'OUTBAL_CIN'
    end
  end
end

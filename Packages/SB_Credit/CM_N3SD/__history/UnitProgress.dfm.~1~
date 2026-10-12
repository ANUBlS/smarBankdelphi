object FormProgress: TFormProgress
  Left = 482
  Top = 177
  Width = 325
  Height = 483
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
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
    Width = 317
    Height = 269
    Align = alTop
    Caption = '…ени типл€р'
    TabOrder = 0
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 313
      Height = 252
      Align = alClient
      DataSource = DataSource3
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = '“ипл€р'
          Title.Color = clInfoText
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 297
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 272
    Width = 317
    Height = 177
    Align = alBottom
    Caption = ' ющн€ типл€ри'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 313
      Height = 132
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'ялаг€л€ндирилмиш типл€р'
          Title.Color = clInfoText
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 260
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 147
      Width = 313
      Height = 28
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 4
        Top = 2
        Width = 56
        Height = 25
        Flat = True
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330F03333
          3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
          3300333330F033333300333330F0333333003333300033333300333333333333
          33003333333333333300}
        OnClick = SpeedButton1Click
      end
      object DBNavigator1: TDBNavigator
        Left = 62
        Top = 3
        Width = 250
        Height = 24
        DataSource = DataSource1
        VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Flat = True
        TabOrder = 0
      end
    end
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet3
    Left = 52
    Top = 56
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'select * from creditsmgr.cm_categories_repair'
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = CMDataModule.CMSession
    Left = 92
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 36
    Top = 328
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid ,c.* from creditsmgr.CM_CATEGORIES_ADD c'
      'where catid=:catid ')
    Variables.Data = {0300000001000000060000003A4341544944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000050000004341544944010000
      000000040000004E414D45010000000000}
    Master = OracleDataSet3
    MasterFields = 'id'
    DetailFields = 'catid'
    Session = CMDataModule.CMSession
    Left = 88
    Top = 328
    object OracleDataSet1CATID: TFloatField
      FieldName = 'CATID'
      Required = True
    end
    object OracleDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
  end
end

object FormMain_delivery: TFormMain_delivery
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #199'atd'#305'r'#305'lma qeydl'#601'ri'
  ClientHeight = 381
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 227
    Width = 643
    Height = 186
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object DBMemo1: TDBMemo
      Left = 1
      Top = 1
      Width = 641
      Height = 184
      Align = alClient
      DataField = 'TEXT'
      DataSource = DataSource2
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 643
    Height = 190
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 641
      Height = 188
      Align = alClient
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'RID'
          Title.Caption = 'No'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USNAME'
          Title.Alignment = taCenter
          Title.Caption = 'User'
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DAT'
          Title.Alignment = taCenter
          Title.Caption = 'Tarix'
          Width = 119
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 37
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 255
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Yeni '
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      
        'select rownum rid, RowID , id,  creditid , (select name from use' +
        'r$ where id=usid) usname , dat  , text from cm_notes_report wher' +
        'e '
      'status in(1,2,3) and creditid=:v_crid'
      'order by rownum ,id')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0056005F004300520049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000006000000100000004300520045004400490054004900440001000000
      00000C000000550053004E0041004D0045000100000000000600000044004100
      5400010000000000080000005400450058005400010000000000040000004900
      440001000000000006000000520049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 456
    Top = 64
    object OracleDataSet2RID: TFloatField
      FieldName = 'RID'
    end
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet2CREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object OracleDataSet2USNAME: TWideStringField
      FieldName = 'USNAME'
      Size = 128
    end
    object OracleDataSet2DAT: TDateTimeField
      FieldName = 'DAT'
    end
    object OracleDataSet2TEXT: TWideStringField
      FieldName = 'TEXT'
      Size = 4000
    end
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 456
    Top = 112
  end
end
